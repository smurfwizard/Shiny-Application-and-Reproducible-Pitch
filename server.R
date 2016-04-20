#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output, session) {

  convertanswer <- function(amount, c1,c2){
          amount * euro.cross[c1,c2]
  }
  
  
  datasetInputAmount <- reactive({input$e0})
  
  datasetInputConvert <- reactive({
    switch(input$e1,
           "Austrian Schilling" = "ATS",
           "Belgian Franc" = "BEF",
           "German Mark" = "DEM",
           "Spanish Peseta" = "ESP",
           "Finnish Markka" = "FIM",
           "French Franc" = "FRF",
           "Irish Punt" = "IEP",
           "Italian Lira" = "ITL",
           "Luxembourg Franc" = "LUF",
           "Dutch Guilder" = "NLG",
           "Portuguese Escudo" = "PTE")
  })
  datasetInputConvertTo <- reactive({
    switch(input$e2,
           "Austrian Schilling" = "ATS",
           "Belgian Franc" = "BEF",
           "German Mark" = "DEM",
           "Spanish Peseta" = "ESP",
           "Finnish Markka" = "FIM",
           "French Franc" = "FRF",
           "Irish Punt" = "IEP",
           "Italian Lira" = "ITL",
           "Luxembourg Franc" = "LUF",
           "Dutch Guilder" = "NLG",
           "Portuguese Escudo" = "PTE")
  })
  
      convamt <- reactive({convertanswer(datasetInputAmount(),datasetInputConvert(),datasetInputConvertTo())})

      output$answer <- reactive({paste(input$e0, input$e1," converts to ",convamt(),input$e2, sep=" ")})

})
