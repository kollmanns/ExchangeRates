library(shiny)
library(quantmod)
source("helpers.R")

shinyServer(
  function(input, output, session) {
    output$ExchangeRateOutput <- renderPlot({
      cur <- input$currency
      dateStart <- input$dateRange[1]
      dateEnd <- input$dateRange[2]
      color <- input$colorChoice
      
      exchangeRate <- xts(get(getFX(cur, from=dateStart, to=dateEnd)))
      plot.xts2(exchangeRate, col=colors()[color], main = cur)
    })
  }
  
  
)