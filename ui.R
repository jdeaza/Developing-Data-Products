library(shiny)

shinyUI(fluidPage(
  headerPanel("Linear regression"),
  
  sidebarPanel(
    p("Select dependent variable and independent variables"),
    selectInput("depvar", label = "Dependent Variable:", choices = c("mpg", "cyl",  "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")),
    uiOutput("indepvar"),
    p("You can find additional information of the data set in the following link:", a("mtcars", href = "http://stat.ethz.ch/R-manual/R-patched/library/datasets/html/mtcars.html"))   
  ),

  mainPanel
  (tableOutput("Outcome")),
  h4("Regression Outcome", align = "center"),
  plotOutput("Diagnostics"),
  h4("Cook's distance Plot", align = "center")
))