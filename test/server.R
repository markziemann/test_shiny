library("shinydashboard")
server <- function(input, output, session) { 
    
    #reset
    observeEvent(input$reset, {
       updateNumericInput(session, "set1", value = "")
    })
    
    median1 <- eventReactive(input$go, {
        newdata <-  as.character(input$set1)
        myvec <- strsplit(newdata,"\n")[[1]]
        myvec <- as.numeric(myvec)
        median1 <- median(myvec)
        paste0(median1)
    })
    output$median1 <- renderText(median1())

    mean1 <- eventReactive(input$go, {
        newdata <-  as.character(input$set1)
        myvec <- strsplit(newdata,"\n")[[1]]
        myvec <- as.numeric(myvec)
        mean1 <- mean(myvec)
        paste0(mean1)
    })
    output$mean1 <- renderText(mean1())

    sd1 <- eventReactive(input$go, {
        newdata <-  as.character(input$set1)
        myvec <- strsplit(newdata,"\n")[[1]]
        myvec <- as.numeric(myvec)
        sd1 <- sd(myvec)
        paste0(sd1)
    })
    output$sd1 <- renderText(sd1())

}
    

