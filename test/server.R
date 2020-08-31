library("shinydashboard")
server <- function(input, output, session) { 
    
    #reset
    observeEvent(input$reset, {
       updateNumericInput(session, "set1", value = "")
    })

    mytbl <- eventReactive(input$go, {
      newdata1 <-  as.character(input$set1)
      myvec <- strsplit(newdata1,"\n")[[1]]
      myvec1 <- as.numeric(myvec)
      median1 <- median(myvec1)
      median1 <- round(median1,3)
      mean1 <- mean(myvec1)
      mean1 <- round(mean1,3)
      sd1 <- sd(myvec1)
      sd1 <- round(sd1,3)
      
      newdata2 <-  as.character(input$set2)
      myvec <- strsplit(newdata2,"\n")[[1]]
      myvec2 <- as.numeric(myvec)
      median2 <- median(myvec2)
      median2 <- round(median2,3)
      mean2 <- mean(myvec2)
      mean2 <- round(mean2,3)
      sd2 <- sd(myvec2)
      sd2 <- round(sd2,3)
      
      data <- c("median","mean","SD")
      set1 <- c(median1,mean1,sd1)
      set2 <- c(median2,mean2,sd2)
      mytbl <- data.frame(t(rbind(data,set1,set2)))
      myname1 <-  as.character(input$set1name)
      if (myname1=="") {myname1="set1"}
      myname2 <-  as.character(input$set2name)
      if (myname2=="") {myname2="set2"}
      colnames(mytbl) <- c("data",myname1,myname2)
      return(mytbl)
    })
    output$mytbl = renderTable({ mytbl()},
       bordered = TRUE,  
       align = 'c',  
       digits = 3)

    ttestout <- eventReactive(input$go, {
      newdata1 <-  as.character(input$set1)
      myvec <- strsplit(newdata1,"\n")[[1]]
      myvec1 <- as.numeric(myvec)
      newdata2 <-  as.character(input$set2)
      myvec <- strsplit(newdata2,"\n")[[1]]
      myvec2 <- as.numeric(myvec)
      paired <- as.character(input$paired)
      if (paired=="paired") { paired <- TRUE } else { paired <- FALSE}
      variances <- as.character(input$variance)
      if (variances=="equal") { var.equal <- TRUE } else { var.equal <- FALSE}
      t.test(myvec2,myvec1,paired = paired,var.equal = var.equal)
    })
    output$ttestout = renderPrint(ttestout())

    wilcoxout <- eventReactive(input$go, {
      newdata1 <-  as.character(input$set1)
      myvec <- strsplit(newdata1,"\n")[[1]]
      myvec1 <- as.numeric(myvec)
      newdata2 <-  as.character(input$set2)
      myvec <- strsplit(newdata2,"\n")[[1]]
      myvec2 <- as.numeric(myvec)
      paired <- as.character(input$paired)
      if (paired=="paired") { paired <- TRUE } else { paired <- FALSE}
      variances <- as.character(input$variance)
      if (variances=="equal") { var.equal <- TRUE } else { var.equal <- FALSE}
      wilcox.test(myvec2,myvec1,paired = paired)
    })
    output$wilcoxout = renderPrint(wilcoxout())
    
    boxPlot <- eventReactive(input$go, {
      newdata1 <-  as.character(input$set1)
      myvec <- strsplit(newdata1,"\n")[[1]]
      myvec1 <- as.numeric(myvec)
      newdata2 <-  as.character(input$set2)
      myvec <- strsplit(newdata2,"\n")[[1]]
      myvec2 <- as.numeric(myvec)
      myname1 <-  as.character(input$set1name)
      if (myname1=="") {myname1="set1"}
      myname2 <-  as.character(input$set2name)
      if (myname2=="") {myname2="set2"}
      units <- as.character(input$units)
      boxplot(myvec1,myvec2,names = c(myname1,myname2),ylab=units)
      geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.25,height=0)
      })

    output$boxPlot <- renderPlot({
      print(boxPlot())
    })
        
}