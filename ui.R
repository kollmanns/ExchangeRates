library(shiny)

shinyServer(
  pageWithSidebar(
    headerPanel("Shiny Exchange Rates"),
    
    sidebarPanel(
      helpText("To use this shiny application, choose an exchange rate below which you want to display.
               There is also the possibility to adjust the time span to get a closer or wider look.
               If you want to change the color, check the checkbox and slide to the color you like."),
      
      selectInput("currency", "Please choose an Exchange Rate",
                  choices=c("EUR/USD", "EUR/RUB", "EUR/CNY")
                  ),
      dateRangeInput("dateRange", "Please choose a Time Span",
                     start = "2014-01-01", end = "2014-12-31",
                     min = NULL, max = NULL, format = "yyyy-mm-dd",
                     startview = "month", weekstart = 0, language = "en",
                     separator = " to "
                     ),
      checkboxInput("checkColor", "Choose Custom Color", FALSE),
      # The function call, colors(), returns a vector of  657 color names in R
      # e.g. colors()[2] = "aliceblue"
      conditionalPanel(condition = "input.checkColor == true",
                       sliderInput("colorChoice", "Please select a Color",
                                   min=2, max=150, value=115, step=1)
                       )
    ),
    mainPanel(
      h4("This application displays the exchange rate between two currencies in a given time span.
         It uses the quantmod package which downloads the exchange rates from oanda."),
      plotOutput("ExchangeRateOutput")
    ) 
  )
)