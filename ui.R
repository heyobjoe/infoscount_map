
library(shiny)

shinyUI(fluidPage(
  titlePanel("Demographic Map"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("gender", 
        label = "Gender",
        choices = c("all","Male","Female"),
        selected = "all"), 
      
      selectInput("ethnicity", 
        label = "Ethnicity",
        choices = c("all","White/Caucasian", "Black or African American",
          "Hispanic/Latino", "Asian"),
        selected = "all"),
      
      selectInput("age", 
        label = "Age:",
        choices = c("all","18-20","21-24","25-34","35-44","45-54","55-64","65+"),
        selected = "all"),
      
      submitButton("Apply")
    ),
    
    mainPanel(plotOutput("map"),
              textOutput("text"))
  )
))