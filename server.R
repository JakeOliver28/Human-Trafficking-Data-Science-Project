## Server for Shiny App

library(shiny)
library(ggplot2)

load("Senior Project Workspace.RData")

server <- function(input, output){

  


  output$adv_scatter <- renderPlot({ggplot(df_agg_allyears, 
                                           aes_string(x = paste("Sex", input$year, sep = ""), 
                                                      y = paste("GDP", input$year, sep = ""), 
                                                      color = "isSexualExploit")) + 
                                    geom_point() + scale_color_gradient(low="blue", high="red") + 
                                    labs(x = "Estimated HIV Prevalence (%)", 
                                         y = "GDP per Capita ($)",
                                         color = "Sexual Exploits (Percent)",
                                         title = "HIV Prevalence vs. GDP per Capita")})
  
  output$typeBar <- renderPlot({ggplot(df_agg, aes_string(x="CountryOfExploitation", 
                                                           y=paste("is", input$typeOfTrafficking, sep = ""))) + 
                                geom_col() + 
                                labs(x = "Country of Exploitation", 
                                     y = gsub('([[:upper:]])', ' \\1', input$typeOfTrafficking),
                                     title = "Prevalence of Trafficking Types in Countries")})
  
  output$relationBar <- renderPlot({ggplot(df_agg, aes_string(x="CountryOfExploitation", 
                                                              y=paste("recruiterRelation", input$recruiterRelation, sep = ""))) + 
                                    geom_col() + 
                                    labs(x = "Country Of Exploitation", 
                                         y = gsub('([[:upper:]])', ' \\1', input$recruiterRelation),
                                         title = "Common Recruiter Relationships in Countries (Percent)")})
  
  output$scatter <- renderPlot({ggplot(df_agg, aes_string(x=paste("meansOfControl", input$meansOfControl, sep = ""), 
                                                          y=paste("typeOfLabour", input$typeOfLabour, sep = ""))) + 
                                geom_label(aes(label = CountryOfExploitation)) + 
                                labs(x = gsub('([[:upper:]])', ' \\1', input$meansOfControl), 
                                     y = gsub('([[:upper:]])', ' \\1', input$typeOfLabour),
                                     title = "Percentage of Means of Control vs. Percentage of Labour Type")})
  
  
}