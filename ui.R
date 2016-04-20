#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
# The data set euro contains the value of 1 Euro in all currencies participating in the European monetary union 
# (Austrian Schilling ATS, Belgian Franc BEF, German Mark DEM, Spanish Peseta ESP, Finnish Markka FIM, French Franc FRF, 
# Irish Punt IEP, Italian Lira ITL, Luxembourg Franc LUF, Dutch Guilder NLG and Portuguese Escudo PTE). 
# These conversion rates were fixed by the European Union on December 31, 1998. 
# To convert old prices to Euro prices, divide by the respective rate and round to 2 digits.
## Convert 20 Spanish Pesetas to Italian Lira           20 * euro.cross["ESP", "ITL"]

library(shiny)
library(MASS)
data(euro)

codenames <- c("Austrian Schilling","Belgian Franc","German Mark","Spanish Peseta","Finnish Markka","French Franc",
                "Irish Punt","Italian Lira","Luxembourg Franc","Dutch Guilder","Portuguese Escudo")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Converting European Currencies"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput(
        'e0', 'Amount To Convert', value = 1
      ),
      selectInput(
        'e1', 'Choose the Currency you want converted',
        choices = codenames
      ),
      selectInput(
        'e2', 'Choose the currancy you want it converted to',
        choices = codenames
      )
    ),
    
    mainPanel(
      helpText('     ')
     , textOutput("answer")
    )
  )
))
