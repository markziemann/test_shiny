library("tidyverse")
library("shiny")
library("shinydashboard")
library("shinyjs")
source("test/ui.R")
source("test/server.R")

shinyApp(ui, server)