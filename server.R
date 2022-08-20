
require(shiny)
require(data.table)
require(quanteda)
load("D:\\Next-Word-Prediction-20220603T063748Z-001\\Next-Word-Prediction\\Shiny_app\\data\\ngrams.Rdata")
source("D:\\Next-Word-Prediction-20220603T063748Z-001\\Next-Word-Prediction\\Shiny_app\\getNextWords.R",local = TRUE)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
     output$predict <- renderText({
          if(input$str=="")
               return("Write  your text!")
          predictions <- nextWord(input$str,input$n)
          paste0(1:input$n,".",predictions,"\n")
     })
})
