---
title       : Developing Data Products
subtitle    : Course Project
author      : JDeaza
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny, interactive]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

--- 

## Introduction

Regression models are an important tool to estimate causality relationship among variables. For example, when we analize demand functions, we are interested in the demand determinants, as price of the good, price of the substitutes or complements goods and money. The application to Course Project of the Developing Data Products, we make an application that you can use estimate linear regression models and a model diagnosis.

--- 

## Description app and source data

The app, estimate a linear regression model using Ordinary Least Square, we can find the coefficients of the regression, standard errors, t statistic and p-value. We can find estimate the Cook's distance to make regression diagnostics. The source data for this project, is a database that we had used in different courses of the Data Sciece Specialization, this is mtcars. Following I going to do a brief explanation of the variables:

- mpg:  Miles/(US) gallon,	cyl:	Number of cylinders
-	disp:	Displacement (cu.in.), hp:	Gross horsepower
-	drat:	Rear axle ratio, wt:	Weight (lb/1000)
-	qsec:	1/4 mile time, vs:	V/S
-	gear:	Number of forward gears, carb:	Number of carburetors
- am:	Transmission (0 = automatic, 1 = manual)

---

## My Regression lineal app

This app has a few simple steps that you have to follow:

- You need to select the dependent variable.
- You need to select the independent variables. The app starts with the whole of the independent variables, you can delete different variables to see how can change the final outcome.

Addtional, you obtain an diagnostic analysis after estimation. This test is the Cook's distance. 

--------

## Try the app

We show an example the output that you can estimate easily:


```r
library(datasets)

model <- lm(mpg ~., data = mtcars)
summary(model)$coefficients
```

```
##                Estimate  Std. Error    t value   Pr(>|t|)
## (Intercept) 12.30337416 18.71788443  0.6573058 0.51812440
## cyl         -0.11144048  1.04502336 -0.1066392 0.91608738
## disp         0.01333524  0.01785750  0.7467585 0.46348865
## hp          -0.02148212  0.02176858 -0.9868407 0.33495531
## drat         0.78711097  1.63537307  0.4813036 0.63527790
## wt          -3.71530393  1.89441430 -1.9611887 0.06325215
## qsec         0.82104075  0.73084480  1.1234133 0.27394127
## vs           0.31776281  2.10450861  0.1509915 0.88142347
## am           2.52022689  2.05665055  1.2254035 0.23398971
## gear         0.65541302  1.49325996  0.4389142 0.66520643
## carb        -0.19941925  0.82875250 -0.2406258 0.81217871
```

In the following link you can try my app: [Here](https://appsjdeaza.shinyapps.io/appjdeazaf/)

---

