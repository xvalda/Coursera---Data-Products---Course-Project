library(shiny)

data("mtcars")

shinyServer(function(input, output, session) {
    # PLOT
    fit <- reactive({
        lm(mtcars[,input$inputOutcome]~mtcars[,input$inputPredictor])
    })
    output$plotLM <- renderPlot({
        plot(mtcars[,input$inputPredictor], mtcars[,input$inputOutcome],
             xlab=input$inputPredictor, ylab=input$inputOutcome, cex = 1.5, pch = 16)
        abline(lm(mtcars[,input$inputOutcome]~mtcars[,input$inputPredictor]), col = "red", lwd = 2)
    })
    output$interceptOut <- renderText({
        summary(lm(mtcars[,input$inputOutcome]~mtcars[,input$inputPredictor]))$coef[1,1]
    })
    output$slopeOut <- renderText({
        summary(lm(mtcars[,input$inputOutcome]~mtcars[,input$inputPredictor]))$coef[2,1]
    })
    output$rsquaredtOut <- renderText({
        summary(lm(mtcars[,input$inputOutcome]~mtcars[,input$inputPredictor]))$r.squared
    })

})
