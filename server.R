library(shiny)
library(datasets)

mpgDF <<- mtcars
mpgDF$am <- factor(mpgDF$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output, session) {

  output$indepvar <- renderUI({
    selectInput("indepvar", "Independent Variables:",names(mpgDF)[!names(mpgDF) %in% input$depvar],names(mpgDF)[!names(mpgDF) %in% input$depvar], multiple = TRUE)
  })

  model <- reactive({
    lm(as.formula(paste(input$depvar," ~ ",paste(input$indepvar,collapse="+"))),data=mpgDF)
  })

  output$Outcome <- renderTable({
    if(!is.null(input$indepvar)){
      summary(model())$coefficients
    } else {
      print(data.frame(Warning="Please select model parameters."))
    }
    })
  
  output$Diagnostics <- renderPlot({
  if(!is.null(input$indepvar)){
    plot(model(), which = 4, cook.levels = cutoff)
  } else {
    print(data.frame(Warning="Please select model parameters."))
  }
  })
})