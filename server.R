##################
# Coursera Course 9 - Shiny Applications
# Aldreen Venzon
# 1.10.19
##################

library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output){
         
  output$distPlot <- renderPlot({
        # use linear model
        fit <- lm(mpg ~ hp, mtcars)
        # predict from horsepower input
        pred <- predict(fit, newdata = data.frame(hp = input$hp))
        # draw plot of the model and predictions
        plot <- ggplot(data=mtcars, aes(x=hp, y=mpg))+
                  geom_point(aes(color=cyl))+
                  geom_smooth(method = "lm")+
                  geom_vline(xintercept=input$hp, color = "blue")+
                  geom_hline(yintercept=pred, color = "red")
        plot
  })
  

  output$result <- renderText({
          # output the predicted result as text
          fit <- lm(mpg ~ hp, mtcars)
          pred <- predict(fit, newdata = data.frame(hp = input$hp))
          result <- round(pred, digits = 2)
          result
  })
  
  
})
