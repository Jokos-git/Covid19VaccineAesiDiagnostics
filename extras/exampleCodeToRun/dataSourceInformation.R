ROhdsiWebApi::authorizeWebApi(Sys.getenv('baseUrl'), "windows") # Windows authentication - if security enabled using windows authentication


cdmSources <-
  ROhdsiWebApi::getCdmSources(baseUrl = Sys.getenv('baseUrl')) %>%
  dplyr::mutate(
    baseUrl = Sys.getenv('baseUrl'),
    dbms = 'redshift',
    sourceDialect = 'redshift',
    port = 5439,
    version = .data$sourceKey %>% substr(., nchar(.) - 3, nchar(.)) %>% as.integer(),
    database = .data$sourceKey %>% substr(., 5, nchar(.) - 6)
  ) %>%
  dplyr::group_by(.data$database) %>%
  dplyr::arrange(dplyr::desc(.data$version)) %>%
  dplyr::mutate(sequence = dplyr::row_number()) %>%
  dplyr::ungroup() %>%
  dplyr::arrange(.data$database, .data$sequence) %>%
  dplyr::mutate(server = tolower(paste0(
    Sys.getenv("serverRoot"), "/", .data$database
  ))) %>%
  dplyr::mutate(cohortDatabaseSchema = paste0("scratch_", keyring::key_get(service = keyringUserService))) %>%
  dplyr::filter(database %in% databaseIds) %>%
  dplyr::filter(sequence == 1)



######
execute <- function(x) {
  if (x$generateCohortTableName) {
    cohortTableName <- paste0(
      stringr::str_squish(x$databaseId),
      stringr::str_squish('Covid19VaccineAesiDiagnostics')
    )
  }
  
  # this function gets details of the data source from cdm source table in omop, if populated.
  # The assumption is the cdm_source.sourceDescription has text description of data source.
  getDataSourceDetails <-
    function(connection,
             databaseId,
             cdmDatabaseSchema) {
      sqlCdmDataSource <- "select * from @cdmDatabaseSchema.cdm_source;"
      sourceInfo <- list(cdmSourceName = databaseId,
                         sourceDescription = databaseId)
      tryCatch(
        expr = {
          cdmDataSource <-
            DatabaseConnector::renderTranslateQuerySql(
              connection = connection,
              sql = sqlCdmDataSource,
              cdmDatabaseSchema = cdmDatabaseSchema,
              snakeCaseToCamelCase = TRUE
            )
          if (nrow(cdmDataSource) == 0) {
            return(sourceInfo)
          }
          if (sourceDescription %in% colnames(cdmDataSource)) {
            sourceInfo$sourceDescription <- cdmDataSource$sourceDescription
          }
          if (cdmSourceName %in% colnames(cdmDataSource)) {
            sourceInfo$cdmSourceName <- cdmDataSource$cdmSourceName
          }
        },
        error = function(...) {
          return(sourceInfo)
        }
      )
      return(sourceInfo)
    }
  
  # Details for connecting to the server:
  connectionDetails <-
    DatabaseConnector::createConnectionDetails(
      dbms = x$cdmSource$dbms,
      server = x$cdmSource$server,
      user = keyring::key_get(service = x$userService),
      password =  keyring::key_get(service = x$passwordService),
      port = x$cdmSource$port
    )
  # The name of the database schema where the CDM data can be found:
  cdmDatabaseSchema <- x$cdmSource$cdmDatabaseSchema
  cohortDatabaseSchema <- x$cdmSource$cohortDatabaseSchema
  
  connection <-
    DatabaseConnector::connect(connectionDetails = connectionDetails)
  dataSourceDetails <- getDataSourceDetails(
    connection = connection,
    databaseId = x$databaseId,
    cdmDatabaseSchema = cdmDatabaseSchema
  )
  DatabaseConnector::disconnect(connection)
  
  Covid19VaccineAesiDiagnostics::execute(
    connectionDetails = connectionDetails,
    cdmDatabaseSchema = cdmDatabaseSchema,
    cohortDatabaseSchema = cohortDatabaseSchema,
    cohortTable = cohortTableName,
    verifyDependencies = x$verifyDependencies,
    outputFolder = x$outputFolder,
    databaseId = x$databaseId,
    databaseName = dataSourceDetails$databaseName,
    databaseDescription = dataSourceDetails$databaseDescription
  )
  
  if (x$preMergeDiagnosticsFiles) {
    CohortDiagnostics::preMergeDiagnosticsFiles(dataFolder = x$outputFolder)
  }
  
  if (length(x$privateKeyFileName) > 0 && 
      !x$privateKeyFileName == '' &&
      length(x$userName) > 0 &&
      !x$userName == '') {
    CohortDiagnostics::uploadResults(x$outputFolder,
                                     x$privateKeyFileName,
                                     x$userName)
  }
  
  if (length(x$uploadToLocalPostGresDatabaseSpecifications) > 1) {
    # Set the POSTGRES_PATH environmental variable to the path to the folder containing the psql executable to enable bulk upload (recommended).
    
    connectionPostGres <- DatabaseConnector::connect(x$uploadToLocalPostGresDatabaseSpecifications$connectionDetails)
    
    # check if schema was instantiated
    sqlSchemaCheck <-
      paste0(
        "SELECT * FROM information_schema.schemata WHERE schema_name = '",
        tolower(x$uploadToLocalPostGresDatabaseSpecifications$schema),
        "';"
      )
    schemaExists <-
      DatabaseConnector::renderTranslateQuerySql(
        connection = connectionPostGres,
        sql = sqlSchemaCheck
      )
    
    if (nrow(schemaExists) == 0) {
      warning(
        paste0(
          'While attempting to upload to postgres, found target schema to not exist - attempting to create target schema ',
          x$uploadToLocalPostGresDatabaseSpecifications$schema
        )
      )
      createSchemaSql <-
        paste0(
          "select create_schema('",
          tolower(x$uploadToLocalPostGresDatabaseSpecifications$schema),
          ");"
        )
      DatabaseConnector::renderTranslateQuerySql(
        connection = connectionPostGres,
        sql = createSchemaSql
      )
      ParallelLogger::logInfo("Schema created.")
      
    }
    # check if required table exists, else create them
    if (!DatabaseConnector::dbExistsTable(conn = connectionPostGres, name = 'cohort_count')) {
      CohortDiagnostics::createResultsDataModel(connection = connectionPostGres, schema = tolower(x$uploadToLocalPostGresDatabaseSpecifications$schema))
    }
    
    DatabaseConnector::disconnect(connection = connectionPostGres)
    # note this is a thread safe upload, so its ok to parallelize
    CohortDiagnostics::uploadResults(
      connectionDetails = x$uploadToLocalPostGresDatabaseSpecifications$connectionDetails,
      schema = x$uploadToLocalPostGresDatabaseSpecifications$schema,
      zipFileName = x$uploadToLocalPostGresDatabaseSpecifications$zipFileName
    )
  }
}