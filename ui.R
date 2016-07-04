#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Chick Weight Data"),

  # Selection box for each diet 
  sidebarLayout(
    sidebarPanel(
        helpText("The ChickWeight R dataset contains data from an experiment on the effect of diet 
           on early growth of chicks.  The body weights of the chicks were measured at birth
                 and every second day until day 20.  They were also measured on day 21.  Data represents 
                 four different protein diets."),
        
        selectInput("sDiet", label = h5("Choose one of the four diets to see plot, 
                                        mean, and standard deviation:"), 
                    choices = list("Diet 1" = "1", "Diet 2" = "2", "Diet 3" = "3", "Diet 4" = "4"), 
                    selected = "1"),
        checkboxInput("lmCheck", 
                      label = h5("Check here to see a linear model fit on the plot"),
                      FALSE)
    ),
    
    # Show plot, mean and std dev
    mainPanel(
       plotOutput("distPlot"),
       verbatimTextOutput("avgWt"),
       verbatimTextOutput("sDev")
       #verbatimTextOutput("lmSummary")
    )
  )
))
