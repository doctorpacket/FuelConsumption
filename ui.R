library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Fuel Consumption Predictor"),    
    sidebarPanel(
        numericInput(inputId="hp", label="Horsepower", value=100, min=50, max=1000, step=1),
        numericInput(inputId="wt", label="Weight (lb/1000)", value=1, min=0.5, max=5, step=0.1),
        radioButtons(inputId="am", label="Transmission Type", choices=c("Automatic", "Manual")),
        actionButton("calcBtn", "Calculate MPG")
    ),
    mainPanel(
        helpText("This is a fuel consumption predictor trained using Motor Trend's performance data from 32 automobiles",
                 "in 1974. The fitted model uses linear regression, and horsespower, weight, transmission type as",
                 "predictors to predict fuel efficiency in miles per gallon."),                 
        helpText("In the left panel, please enter the horsepower, weight (in short tonnes, or pounds/1000),",
                 "transmission type (automatic or manual), and click \"Calculate MPG\" to compute. The predicted fuel",
                 "consumption in miles per gallon will be displayed below."),
        p("Miles per Gallon"),
        textOutput("mpg")
    )
))