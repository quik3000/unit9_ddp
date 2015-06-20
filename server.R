# server.R

library(shiny)

your_bmi <- function(weight, height) weight/(height^2)

shinyServer(
        function(input, output) {
                output$inputValue1 <- renderPrint({input$weight})
                output$inputValue2 <- renderPrint({input$height})
                output$calculate <- renderPrint({your_bmi(input$weight, input$height)})
        
                output$whoclass <- renderText({
                  y <- your_bmi(input$weight, input$height)
                  if (y <= 18.5) {whoclass <- "Underweight"}
                  else if (y > 18.5 & y <= 25) {whoclass <- "Normal"}
                  else if (y > 25 & y <= 30) {whoclass <- "Overweight"}
                  else if (y > 30) {whoclass <- "Obese"}
                  whoclass
                })
                
                output$asianclass <- renderText({
                  y <- your_bmi(input$weight, input$height)
                  if (y <= 17.5) {asianclass <- "Underweight"}
                  else if (y > 17.5 & y <= 23) {asianclass <- "Normal"}
                  else if (y > 23 & y <= 28) {asianclass <- "Overweight"}
                  else if (y > 28) {asianclass <- "Obese"}
                  asianclass
                })
                
                output$riskclass <- renderText({
                  y <- your_bmi(input$weight, input$height)
                  if (y <= 18.5) {riskclass <- "Not Classified"}
                  else if (y > 18.5 & y <= 23) {riskclass <- "Low Risk"}
                  else if (y > 23 & y <= 27.5) {riskclass <- "Moderate Risk"}
                  else if (y > 27.5 & y <= 33) {riskclass <- "High Risk"}
                  else if (y > 33) {riskclass <- "Very High Risk"}
                  riskclass
                })
        }
)