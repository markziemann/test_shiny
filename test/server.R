library("shinydashboard")
server <- function(input, output, session) { 
    
    #reset
    observeEvent(input$reset, {
        updateSelectInput(session, 'cyl')
        updateNumericInput(session, 'disp', value = 100)
        updateNumericInput(session, 'hp', value = 100)
        updateNumericInput(session, "drat", value = 3)
        updateNumericInput(session, "wt", value = 3)
    })
    
    fit <- lm(mpg ~ ., data = mtcars[,1:6])
    
    pred <- eventReactive(input$go, {
        
        newdata <- tibble(cyl = input$cyl,
                          disp = input$disp,
                          hp = input$hp,
                          drat = input$drat,
                          wt = input$wt) %>%
            mutate_all(as.numeric)
        
        pred <- predict(fit, newdata = newdata)
        pred <- round(pred, 2)
        paste0(pred)
    })
    
    output$pred <- renderText(pred())
}