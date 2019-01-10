##################
# Coursera Course 9 - Shiny Applications
# Aldreen Venzon
# 1.10.19
##################

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Car MPG from Horsepower!"),
  
  # Sidebar with horsepower input (range: 52-335 from MTCars dataset)
  sidebarLayout(
    sidebarPanel(
       sliderInput("hp",
                   "# of Horsepower:",
                   min = 52,
                   max = 335,
                   value = 150)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h4("The predicted MPG of the car is:"),
       h3(textOutput("result"))
    )
  )
))
