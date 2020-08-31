
header <- dashboardHeader(title = "t-test calculator")
#header <- titlePanel(
#)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Enter your data", tabName = "model", icon = icon("bar-chart-o"),
             textAreaInput("set1name",
                           "Set 1 name",
                           "",height=30),
             textAreaInput("set1",
                           "Set 1 values",
                           "",
                           height = 125),
             textAreaInput("set2name",
                           "Set 2 name",
                           "",height=30),
             textAreaInput("set2",
                           "Set 2 values",
                           "",
                           height = 125),
             selectInput("paired",
                         "Data type",
                         c("unpaired", "paired")),
             selectInput("variance",
                         "Variance",
                         c("unequal", "equal")),
             textAreaInput("units",
                           "Units",
                           "",
                           height = 30),
             div(style="display: inline-block;vertical-align:top; width: 100px;",
                 actionButton("go", "Calculate!")),
             div(style="display: inline-block;vertical-align:top; width: 100px;",
                 actionButton("reset", "Clear", style='padding:6px;width:80px'))
             , startExpanded=TRUE)
  )
)

body <- dashboardBody(
  h3("Summary statistics: "),
  tableOutput("mytbl"),
  tags$head(tags$style("#mytbl{color: black;
                       font-size: 15px;
                       font-family: Source Sans Pro
                       }")),
  h3("Student's t-test"),
  verbatimTextOutput("ttestout",placeholder = TRUE),
  h3("Wilcox test"),
  verbatimTextOutput("wilcoxout",placeholder = TRUE),
  plotOutput("boxPlot")
)

ui <- dashboardPage(header, 
                    sidebar, 
                    body, 
                    useShinyjs()
)