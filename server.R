#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    
    output$distPlot <- renderPlot({
        subData <- subset(ChickWeight, Diet==input$sDiet)
        if (input$lmCheck) {
            plot(weight ~ Time, subData, col="blue",
                 main = paste("Chick Weights for Diet", as.character(input$sDiet), 
                              "with Linear Regression Line"),
                 xlab = "Age in Days",
                 ylab = "Weight in Grams (gm)")
            abline(lm(weight ~ Time, subData), col="red" )
            
        } else  {
            plot(weight ~ Time, subData, col="blue",
                 main = paste("Chick Weights for Diet", as.character(input$sDiet)),
                 xlab = "Age in Days",
                 ylab = "Weight in Grams (gm)") 
        }
    })
  
    output$avgWt <- renderText({
        subData <- subset(ChickWeight, Diet==input$sDiet)
        avgWt <- round(mean(subData$weight, na.rm=TRUE), 2)
        paste("Mean weight for diet", as.character(input$sDiet), "is", as.character(avgWt))
    })
  
    output$sDev <- renderText({
        subData <- subset(ChickWeight, Diet==input$sDiet)
        sDev <- round(sd(subData$weight, na.rm = TRUE), 2)
        paste("Standard deviation of weight for diet", as.character(input$sDiet), "is", as.character(sDev))
    })
  
    ## Would like to show summary of the model, but having trouble getting this to print nicely  
  #  output$lmSummary <- renderPrint({
  #      if (input$lmCheck) {
  #          subData <- subset(ChickWeight, Diet==input$sDiet)
  #          fit <- lm(weight ~ Time, subData)
  #          paste("Summary of regression line:", summary(fit))
  #      } else {
  #          "Checkbox for linear regression line is not selected."
  #      }
        
        
    #})
  
})
