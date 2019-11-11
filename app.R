library(shiny)
library(shinydashboard)
library(bupaR)
library(edeaR)
library(eventdataR)
library(processmapR)
library(processmonitR)
library(xesreadR)
library(petrinetR)

data <- readr::read_csv("r_test_definitivo.csv")
# load BPI Challenge 2017 data set ####


# change timestamp to date var
data$starttimestamp = as.POSIXct(data$'Start Timestamp', 
                                 format = "%Y/%m/%d %H:%M:%S")

data$endtimestamp = as.POSIXct(data$'Complete Timestamp', 
                               format = "%Y/%m/%d %H:%M:%S")


events <- bupaR::activities_to_eventlog(
  data,
  case_id = 'Case_ID',
  activity_id = 'Activity',
  resource_id = 'Resource',
  timestamps = c('starttimestamp', 'endtimestamp')
)


ui <- dashboardPage(
  dashboardHeader(
  ),
  dashboardSidebar(
    width = 0
  ),
  dashboardBody(
    box(title = "Process Map", status = "primary",height = "575", solidHeader = 
          T,events %>% process_map(),align = "left"),
    box(title = "Resource Map", status = "primary",height = "575", solidHeader = 
          T,
        resource_map(events, render = T))
  )
)

server <- function(input, output) { }

shinyApp(ui, server)
