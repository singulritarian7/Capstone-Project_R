

library(shiny)
library(DT)
library(shinydisconnect)
library(shinybusy)

shinyUI(fluidPage(
    
    add_busy_gif(
        src = "https://jeroen.github.io/images/banana.gif",
        height = 70, width = 70
    ),
    
    titlePanel("Word Predictor"),
    sidebarLayout(
        sidebarPanel(
            textInput("user_input", "Enter one ore more words and then press 'Predict':"),
            submitButton("Predict Third Word"),
            br(), 
            h5("The top three predictions with higher probability are:"),
            verbatimTextOutput("pred")
        ),
        
        mainPanel(
            DT::dataTableOutput("table")
        )
    )        
))        
        
        
        