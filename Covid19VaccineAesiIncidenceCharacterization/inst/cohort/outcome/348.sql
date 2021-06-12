{
	"cdmVersionRange" : ">=5.0.0",
	"PrimaryCriteria" : {
		"CriteriaList" : [
			{
				"ConditionOccurrence" : {
					"CodesetId" : 0,
					"ConditionType" : [
						{
							"CONCEPT_ID" : 38000183,
							"CONCEPT_NAME" : "Inpatient detail - primary",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822059",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 38000199,
							"CONCEPT_NAME" : "Inpatient header - primary",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822075",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 44786627,
							"CONCEPT_NAME" : "Primary Condition",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822127",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 38000184,
							"CONCEPT_NAME" : "Inpatient detail - 1st position",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822060",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 38000200,
							"CONCEPT_NAME" : "Inpatient header - 1st position",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822076",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 38000215,
							"CONCEPT_NAME" : "Outpatient detail - 1st position",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822091",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 38000230,
							"CONCEPT_NAME" : "Outpatient header - 1st position",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822106",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 45756835,
							"CONCEPT_NAME" : "Carrier claim header - 1st position",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822136",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 45756843,
							"CONCEPT_NAME" : "Carrier claim detail - 1st position",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822144",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						},
						{
							"CONCEPT_ID" : 44786628,
							"CONCEPT_NAME" : "First Position Condition",
							"STANDARD_CONCEPT" : null,
							"STANDARD_CONCEPT_CAPTION" : "Unknown",
							"INVALID_REASON" : null,
							"INVALID_REASON_CAPTION" : "Unknown",
							"CONCEPT_CODE" : "OMOP4822128",
							"DOMAIN_ID" : "Type Concept",
							"VOCABULARY_ID" : "Condition Type",
							"CONCEPT_CLASS_ID" : null
						}
					],
					"ConditionTypeExclude" : false
				}
			}
		],
		"ObservationWindow" : {
			"PriorDays" : 0,
			"PostDays" : 0
		},
		"PrimaryCriteriaLimit" : {
			"Type" : "All"
		}
	},
	"AdditionalCriteria" : {
		"Type" : "ALL",
		"CriteriaList" : [
			{
				"Criteria" : {
					"VisitOccurrence" : {
						"CodesetId" : 1,
						"VisitTypeExclude" : false
					}
				},
				"StartWindow" : {
					"Start" : {
						"Coeff" : -1
					},
					"End" : {
						"Days" : 0,
						"Coeff" : 1
					},
					"UseIndexEnd" : false,
					"UseEventEnd" : false
				},
				"EndWindow" : {
					"Start" : {
						"Days" : 0,
						"Coeff" : -1
					},
					"End" : {
						"Coeff" : 1
					},
					"UseIndexEnd" : false,
					"UseEventEnd" : true
				},
				"RestrictVisit" : false,
				"IgnoreObservationPeriod" : false,
				"Occurrence" : {
					"Type" : 2,
					"Count" : 1,
					"IsDistinct" : false
				}
			}
		],
		"DemographicCriteriaList" : [],
		"Groups" : []
	},
	"ConceptSets" : [
		{
			"id" : 0,
			"name" : "Guillian-Barre syndrome",
			"expression" : {
				"items" : [
					{
						"concept" : {
							"CONCEPT_ID" : 374925,
							"CONCEPT_NAME" : "Acute infective polyneuritis",
							"STANDARD_CONCEPT" : "S",
							"STANDARD_CONCEPT_CAPTION" : "Standard",
							"INVALID_REASON" : "V",
							"INVALID_REASON_CAPTION" : "Valid",
							"CONCEPT_CODE" : "129131007",
							"DOMAIN_ID" : "Condition",
							"VOCABULARY_ID" : "SNOMED",
							"CONCEPT_CLASS_ID" : "Clinical Finding"
						},
						"isExcluded" : false,
						"includeDescendants" : true,
						"includeMapped" : false
					},
					{
						"concept" : {
							"CONCEPT_ID" : 4164770,
							"CONCEPT_NAME" : "Guillain-Barr� syndrome",
							"STANDARD_CONCEPT" : "S",
							"STANDARD_CONCEPT_CAPTION" : "Standard",
							"INVALID_REASON" : "V",
							"INVALID_REASON_CAPTION" : "Valid",
							"CONCEPT_CODE" : "40956001",
							"DOMAIN_ID" : "Condition",
							"VOCABULARY_ID" : "SNOMED",
							"CONCEPT_CLASS_ID" : "Clinical Finding"
						},
						"isExcluded" : false,
						"includeDescendants" : true,
						"includeMapped" : false
					},
					{
						"concept" : {
							"CONCEPT_ID" : 4070552,
							"CONCEPT_NAME" : "Fisher's syndrome",
							"STANDARD_CONCEPT" : "S",
							"STANDARD_CONCEPT_CAPTION" : "Standard",
							"INVALID_REASON" : "V",
							"INVALID_REASON_CAPTION" : "Valid",
							"CONCEPT_CODE" : "1767005",
							"DOMAIN_ID" : "Condition",
							"VOCABULARY_ID" : "SNOMED",
							"CONCEPT_CLASS_ID" : "Clinical Finding"
						},
						"isExcluded" : false,
						"includeDescendants" : true,
						"includeMapped" : false
					}
				]
			}
		},
		{
			"id" : 1,
			"name" : "Inpatient or Inpatient/ER visit",
			"expression" : {
				"items" : [
					{
						"concept" : {
							"CONCEPT_ID" : 262,
							"CONCEPT_NAME" : "Emergency Room and Inpatient Visit",
							"STANDARD_CONCEPT" : "S",
							"STANDARD_CONCEPT_CAPTION" : "Standard",
							"INVALID_REASON" : "V",
							"INVALID_REASON_CAPTION" : "Valid",
							"CONCEPT_CODE" : "ERIP",
							"DOMAIN_ID" : "Visit",
							"VOCABULARY_ID" : "Visit",
							"CONCEPT_CLASS_ID" : "Visit"
						},
						"isExcluded" : false,
						"includeDescendants" : true,
						"includeMapped" : false
					},
					{
						"concept" : {
							"CONCEPT_ID" : 9201,
							"CONCEPT_NAME" : "Inpatient Visit",
							"STANDARD_CONCEPT" : "S",
							"STANDARD_CONCEPT_CAPTION" : "Standard",
							"INVALID_REASON" : "V",
							"INVALID_REASON_CAPTION" : "Valid",
							"CONCEPT_CODE" : "IP",
							"DOMAIN_ID" : "Visit",
							"VOCABULARY_ID" : "Visit",
							"CONCEPT_CLASS_ID" : "Visit"
						},
						"isExcluded" : false,
						"includeDescendants" : true,
						"includeMapped" : false
					}
				]
			}
		}
	],
	"QualifiedLimit" : {
		"Type" : "All"
	},
	"ExpressionLimit" : {
		"Type" : "All"
	},
	"InclusionRules" : [
		{
			"name" : "has no events in prior 'clean window'",
			"expression" : {
				"Type" : "ALL",
				"CriteriaList" : [
					{
						"Criteria" : {
							"ConditionOccurrence" : {
								"CorrelatedCriteria" : {
									"Type" : "ALL",
									"CriteriaList" : [
										{
											"Criteria" : {
												"VisitOccurrence" : {
													"CodesetId" : 1,
													"VisitTypeExclude" : false
												}
											},
											"StartWindow" : {
												"Start" : {
													"Coeff" : -1
												},
												"End" : {
													"Days" : 0,
													"Coeff" : 1
												},
												"UseIndexEnd" : false,
												"UseEventEnd" : false
											},
											"EndWindow" : {
												"Start" : {
													"Days" : 0,
													"Coeff" : -1
												},
												"End" : {
													"Coeff" : 1
												},
												"UseIndexEnd" : false,
												"UseEventEnd" : true
											},
											"RestrictVisit" : false,
											"IgnoreObservationPeriod" : false,
											"Occurrence" : {
												"Type" : 2,
												"Count" : 1,
												"IsDistinct" : false
											}
										}
									],
									"DemographicCriteriaList" : [],
									"Groups" : []
								},
								"CodesetId" : 0,
								"ConditionType" : [
									{
										"CONCEPT_ID" : 38000183,
										"CONCEPT_NAME" : "Inpatient detail - primary",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822059",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 38000199,
										"CONCEPT_NAME" : "Inpatient header - primary",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822075",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 44786627,
										"CONCEPT_NAME" : "Primary Condition",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822127",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 38000184,
										"CONCEPT_NAME" : "Inpatient detail - 1st position",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822060",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 38000200,
										"CONCEPT_NAME" : "Inpatient header - 1st position",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822076",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 38000215,
										"CONCEPT_NAME" : "Outpatient detail - 1st position",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822091",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 38000230,
										"CONCEPT_NAME" : "Outpatient header - 1st position",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822106",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 45756835,
										"CONCEPT_NAME" : "Carrier claim header - 1st position",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822136",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 45756843,
										"CONCEPT_NAME" : "Carrier claim detail - 1st position",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822144",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									},
									{
										"CONCEPT_ID" : 44786628,
										"CONCEPT_NAME" : "First Position Condition",
										"STANDARD_CONCEPT" : null,
										"STANDARD_CONCEPT_CAPTION" : "Unknown",
										"INVALID_REASON" : null,
										"INVALID_REASON_CAPTION" : "Unknown",
										"CONCEPT_CODE" : "OMOP4822128",
										"DOMAIN_ID" : "Type Concept",
										"VOCABULARY_ID" : "Condition Type",
										"CONCEPT_CLASS_ID" : null
									}
								],
								"ConditionTypeExclude" : false
							}
						},
						"StartWindow" : {
							"Start" : {
								"Days" : 365,
								"Coeff" : -1
							},
							"End" : {
								"Days" : 1,
								"Coeff" : -1
							},
							"UseIndexEnd" : false,
							"UseEventEnd" : false
						},
						"RestrictVisit" : false,
						"IgnoreObservationPeriod" : true,
						"Occurrence" : {
							"Type" : 0,
							"Count" : 0,
							"IsDistinct" : false
						}
					}
				],
				"DemographicCriteriaList" : [],
				"Groups" : []
			}
		}
	],
	"EndStrategy" : {
		"DateOffset" : {
			"DateField" : "StartDate",
			"Offset" : 1
		}
	},
	"CensoringCriteria" : [],
	"CollapseSettings" : {
		"CollapseType" : "ERA",
		"EraPad" : 0
	},
	"CensorWindow" : {}
}