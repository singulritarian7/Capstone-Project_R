
library(shiny)
library(DT)
library(sbo)
source('Funcion_next_word.R')

shinyServer(function(input, output) {
    
    
    
    output$pred <- renderText({
        
        predict_t <- sbo_t_prediction (input$user_input, train_c)
        predict_t
    })
    
    output$table <- DT::renderDataTable({ 
        
        table <- sbo_f_prediction(input$user_input,train_c)
        head(table, 5)
        
    }) 
    
})

## Presentation: <https://rpubs.com/spoke/723611>
## shinyapp :<https://mimispoke.shinyapps.io/Shiny_Algorithm/>


