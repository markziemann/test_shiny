
header <- dashboardHeader(title = "Demo Calculator")

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Calculate!", tabName = "model", icon = icon("bar-chart-o"),
                 textAreaInput("set1",
                               "Set 1 values",
                               "",
                               height = 200),
                 textAreaInput("set2",
                               "Set 2 values",
                               "",
                               height = 200),
                 div(style="display: inline-block;vertical-align:top; width: 100px;",
                     actionButton("go", "Calculate!")),
                 div(style="display: inline-block;vertical-align:top; width: 100px;",
                     actionButton("reset", "Clear", style='padding:6px;width:80px'))
        )
    )
)

body <- dashboardBody(
    h3("Set 1  median is: "),
    h3(verbatimTextOutput("median1", placeholder = T)),
    h3("Set 1 mean is: "),
    h3(verbatimTextOutput("mean1", placeholder = T)),
    h3("Set 1 standard deviation is: "),
    h3(verbatimTextOutput("sd1", placeholder = T)),
    tags$head(tags$style("#median1{color: black;
                                 font-size: 15px;
                                 font-family: Source Sans Pro
                                 }")),
    tags$head(tags$style("#mean1{color: black;
                                 font-size: 15px;
                                 font-family: Source Sans Pro
                                 }")),
    tags$head(tags$style("#sd1{color: black;
                                 font-size: 15px;
                                 font-family: Source Sans Pro
                                 }")),
    h3("Set 2  median is: "),
    h3(verbatimTextOutput("median2", placeholder = T)),
    h3("Set 2 mean is: "),
    h3(verbatimTextOutput("mean2", placeholder = T)),
    h3("Set 2 standard deviation is: "),
    h3(verbatimTextOutput("sd2", placeholder = T)),
    tags$head(tags$style("#median2{color: black;
                                 font-size: 15px;
                                 font-family: Source Sans Pro
                                 }")),
    tags$head(tags$style("#mean2{color: black;
                                 font-size: 15px;
                                 font-family: Source Sans Pro
                                 }")),
    tags$head(tags$style("#sd2{color: black;
                                 font-size: 15px;
                                 font-family: Source Sans Pro
                                 }")),
    h3("t statistic: "),
    h3(verbatimTextOutput("myt", placeholder = T)),
    tags$head(tags$style("#myt{color: black;
                                 font-size: 15px;
                                 font-family: Source Sans Pro
                                 }")),
    h3("p-value: "),
    h3(verbatimTextOutput("myp", placeholder = T)),
    tags$head(tags$style("#myp{color: black;
                                 font-size: 15px;
                                 font-family: Source Sans Pro
                                 }")),
    fluidRow(
        infoBox(
            "What", "is this app for?", icon = icon("line-chart"),
            width = 4
        ),
        infoBox(
            "Who", "is this app for?", icon = icon("user-friends"),
            width = 4
        ),
        infoBox(
            "Where", "can I find out more?", icon = icon("book-open"),
            width = 4
        )),
    fluidRow(
        column(align = "center",
               "Performing basic stats",
               width = 4
        ),
        column(
            align = "center",
            "Everyone, biologists especially!",
            width = 4
        ),
        column(
            align = "center",
            "To read more visit: ",
            width = 4
        ))
)

ui <- dashboardPage(header, 
                    sidebar, 
                    body, 
                    useShinyjs()
)