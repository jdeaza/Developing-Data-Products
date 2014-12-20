library(shiny)
library(datasets)

mpgDF <<- mtcars
mpgDF$am <- factor(mpgDF$am, labels = c("Automatic", "Manual"))

# Define server logic required to estimate mpg

shinyServer(function(input, output) {
  # Compute the forumla text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
                    
  dataInput <- reactive({
                  subset("Miles/(US) gallon" = mpgDF$mpg,
                         "Cylinders" = mpgDF$cyl,
                         "Transmission" = mpgDF$am,
                         "Gears" = mpgDF$gear,
                         "Horse Power" = mpgDF$hp)
  })
      
  output$formula <- renderUI({
    inputData = dataInput()    
    xlab=input$indepvar
    ylab=input$depvar
    if (!is.null(xlab)){    
      x <- inputData[xlab]
      y <- inputData[ylab] 
      dform <- as.formula(paste(ylab," ~ ", paste(xlab,collapse= "+")))
      modelf = lm(dform,data = inputData)      
      rSquared = summary(modelf)$r.squared
      arSquared = summary(modelf)$adj.r.squared
      coef = round(coefficients(modelf),digits=2)
      sign = ifelse(coef < 0,"-","+")
      HTML(c(ylab,"=",paste(sign,abs(coef),c("",xlab)),"+u", '<br/><br/>', 
             "R-Squared=",round(rSquared,digits=2),"     R-Squared=",round(arSquared,digits=2),'<br/>'))    
    }
  })
  
  output$model <- renderTable({  
    inputData = dataInput()    
    xlab = input$indepvar
    ylab = input$depvar
    if (!is.null(xlab)){          
      x <- inputData[xlab]
      y <- inputData[ylab] 
      dform <- as.formula(paste(ylab," ~ ", paste(xlab,collapse= "+")))
      modelf = lm(fmla,data=inputData)
      summary(modelf)
    }
  })
  })
})