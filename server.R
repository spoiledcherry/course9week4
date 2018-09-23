library(shiny)

shinyServer(function(input, output) {
  model1 <- lm(dist~speed, data=cars)
  model1pred <- reactive({
          speed1 <- input$Sliderspeed
          predict(model1, newdata=data.frame(speed=speed1))
  })
   
  output$plot1 <- renderPlot({
    speed1 <- input$Sliderspeed
    plot(cars$speed, cars$dist, xlab = "Car Speed", ylab = "Stopping Distance",xlim = c(1, 50), ylim = c(0,200))
    if(input$showmodel) {
       abline(model1, col="red", lwd=2)     
    }
    legend(25,250, c("Prediction Model"))
    points(speed1, model1pred(), col="blue", pch=16, cex=2)
   })
   
   output$pred1 <- renderText({
       model1pred()
   })
})
