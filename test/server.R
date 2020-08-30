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
        median1 <- round(median1,3)
        paste0(median1)
    })
    output$median1 <- renderText(median1())

    mean1 <- eventReactive(input$go, {
        newdata <-  as.character(input$set1)
        myvec <- strsplit(newdata,"\n")[[1]]
        myvec <- as.numeric(myvec)
        mean1 <- mean(myvec)
        mean1 <- round(mean1,3)
        paste0(mean1)
    })
    output$mean1 <- renderText(mean1())

    sd1 <- eventReactive(input$go, {
        newdata <-  as.character(input$set1)
        myvec <- strsplit(newdata,"\n")[[1]]
        myvec <- as.numeric(myvec)
        sd1 <- sd(myvec)
        sd1 <- round(sd1,3)
        paste0(sd1)
    })
    output$sd1 <- renderText(sd1())

    median2 <- eventReactive(input$go, {
      newdata <-  as.character(input$set2)
      myvec <- strsplit(newdata,"\n")[[1]]
      myvec <- as.numeric(myvec)
      median2 <- median(myvec)
      median2 <- round(median2,3)
      paste0(median2)
    })
    output$median2 <- renderText(median2())
    
    mean2 <- eventReactive(input$go, {
      newdata <-  as.character(input$set2)
      myvec <- strsplit(newdata,"\n")[[1]]
      myvec <- as.numeric(myvec)
      mean2 <- mean(myvec)
      mean2 <- round(mean2,3)
      paste0(mean2)
    })
    output$mean2 <- renderText(mean2())
    
    sd2 <- eventReactive(input$go, {
      newdata <-  as.character(input$set2)
      myvec <- strsplit(newdata,"\n")[[1]]
      myvec <- as.numeric(myvec)
      sd2 <- sd(myvec)
      sd2 <- round(sd2,3)
      paste0(sd2)
    })
    output$sd2 <- renderText(sd2())

    myt <- eventReactive(input$go, {
      newdata1 <-  as.character(input$set1)
      myvec <- strsplit(newdata1,"\n")[[1]]
      myvec1 <- as.numeric(myvec)
      newdata2 <-  as.character(input$set2)
      myvec <- strsplit(newdata2,"\n")[[1]]
      myvec2 <- as.numeric(myvec)
      x <- t.test(myvec2,myvec1)
      myt <- round(x$statistic,3)
      paste0(myt)
    })
    output$myt = renderText(myt())
    
    myp <- eventReactive(input$go, {
      newdata1 <-  as.character(input$set1)
      myvec <- strsplit(newdata1,"\n")[[1]]
      myvec1 <- as.numeric(myvec)
      newdata2 <-  as.character(input$set2)
      myvec <- strsplit(newdata2,"\n")[[1]]
      myvec2 <- as.numeric(myvec)
      x <- t.test(myvec2,myvec1)
      myp <- round(x$p.value,3)
      paste0(myp)
    })    
    output$myp = renderText(myp())
}
    

