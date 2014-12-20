library(shiny)
library(shinyBS)

#####Defining UI for application Developing Data Products

shinyUI(fluidPage(
######App title
    titlePanel("Estimation Regression Model"),
    p("Author:", "Javier Deaza"),
  
####Defining sidebar
    sidebarLayout(
      sidebarPanel(
        selectInput("depvar", label = "Dependent Variable", 
                    choices = c("Miles/(US) gallon",
                      "Cylinders",
                      "Transmission",
                      "Gears",
                      "Horse Power")),
        br(),
        selectInput("indepvar", label = "Independent Variable", 
                    choices = c("Miles/(US) gallon",
                      "Cylinders",
                      "Transmission",
                      "Gears",
                      "Horse Power"), multiple = TRUE),
        br(),
        
        helpText("Note: You can choose the indpendent variables to see the adjusment.")
       
      ),
    
      mainPanel(
        bsCollapsePanel("Model", htmlOutput("formula"), tags$br(), tableOutput('model'), id="col5", value="test5"),
        
      ),
      textOutput("text1")
    )
))