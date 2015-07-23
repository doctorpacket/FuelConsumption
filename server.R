library(datasets)
library(caret)

data(mtcars)

df <- mtcars
df$cyl <- as.factor(df$cyl)
df$am <- as.factor(df$am)
df$gear <- as.factor(df$gear)

fit <- train(mpg ~ hp + wt + am, data=df, method='lm')

predictMPG <- function(hp, wt, am) {    
    data <- df[1,]
    data$hp <- hp
    data$wt <- wt    
    data$am <- as.factor(am)
    predict(fit, data)
}

library(shiny)
shinyServer(
    function(input, output) {         
        output$mpg <- renderText({
            input$calcBtn
            isolate(
                if(input$am=="Automatic") {
                    predictMPG(
                        as.numeric(input$hp),
                        as.numeric(input$wt),
                        0
                    )
                }
                else {
                    predictMPG(
                        as.numeric(input$hp),
                        as.numeric(input$wt),
                        1
                    )
                }
            )
        })
    }
)