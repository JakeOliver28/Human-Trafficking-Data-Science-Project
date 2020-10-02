## UI for Shiny App

library(shiny)
library(ggplot2)

ui <- fluidPage(  

  
  
    
  fluidRow(
    tags$br()
  ),
  
  fluidRow(column(width = 2, selectInput(inputId = "typeOfTrafficking", label = "Known Trafficking Type (Percent)", 
                                         choices = c("SexualExploit", "ForcedLabour", "SexAndLabour", 
                                                     "ForcedMarriage", "OtherExploit"))),
           column(width = 10, plotOutput(outputId = "typeBar"))
  ),
  
  fluidRow(
    tags$br()
  ),
  
  fluidRow(column(width = 2, sliderInput(inputId = "year",
                                         "Year (1990-2011)", value = 1990, min = 1990, max = 2011, step = 1, sep = "")),
           column(width = 10, plotOutput(outputId = "adv_scatter"))
  ),
  
  fluidRow(
    tags$br()
  ),
  
      
  fluidRow(column(width = 2, selectInput(inputId = "meansOfControl", label = "X Axis: Means of Control (Percent)", 
              choices = c("DebtBondage", "TakesEarnings", "RestrictsFinancialAccess", 
                          "Threats", "PsychologicalAbuse", "PhysicalAbuse", "SexualAbuse",
                          "FalsePromises", "PsychoactiveSubstances", "RestrictsMovement",
                          "RestrictsMedicalCare", "ExcessiveWorkingHours", "UsesChildren",
                          "ThreatOfLawEnforcement", "WithholdsNecessities", "WithholdsDocuments", 
                           "Other", "NotSpecified")),
    selectInput(inputId = "typeOfLabour", label = "Y Axis: Type of Labour (Percent)", 
                choices = c("Agriculture", "Aquafarming", "Begging", "Construction", 
                            "DomesticWork", "Hospitality", "IllicitActivities", 
                            "Manufacturing", "MiningOrDrilling", "Peddling",
                            "Transportation", "Other", "NotSpecified"))),
    column(width = 10, plotOutput(outputId = "scatter"))
  ),  
  
  fluidRow(
    tags$br()
  ), 
  
  
  fluidRow(column(width = 2, selectInput(inputId = "recruiterRelation", label = "Recruiter Relationship (Percent)", 
                                        choices = c("IntimatePartner", "Friend", "Family", "Other", "Unknown"))), 
                        
    column(width = 10, plotOutput(outputId = "relationBar"))
  )
    

)

 


