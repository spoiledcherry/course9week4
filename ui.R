library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Predict car stopping distance"),
  
  sidebarLayout(
    sidebarPanel(
       h3("Input the car speed"),
       sliderInput("Sliderspeed","The car speed:", min = 1, max = 50,value = 15),
       checkboxInput("showmodel", "Show Linear Model", value = TRUE)
    ),
    
     mainPanel(
       plotOutput("plot1"),
       h3("Predicted car stopping distance"),
       textOutput("pred1")
    )
  )
))
