library(shiny)
library(shinythemes)
library(plotly)
library(shinydashboard)

# Define UI for application that draws a histogram

ui <- dashboardPage(
  dashboardHeader(title = "Bowling League Statistics"),
  dashboardSidebar(),
  dashboardBody(fluidRow(
    column(
      width = 3,
      box(
        width = NULL,
        title = "User Guide",
        
        p(
          "Welcome to the Bowling League Statistics application!
                            This application is compatible with data downloaded from
                            the League Secretary website."
        ),
        
        h4("Steps to Upload Data"),
        
        p(
          "1. Navigate to the League Secretary website: ",
          a("League Secretary", href = "https://www.leaguesecretary.com/")
        ),
        
        p("2. Find your bowling league and navigate to Bowler History"),
        
        p("3. Download a csv file with the data of every bowler of interest"),
        
        p("4. Upload the data in the sidebar to the left")
      ),
      box(width = NULL,
        title = "Inputs",
        fileInput(
          "bowler_dat",
          "Choose CSV File",
          accept = c(".csv"),
          multiple = TRUE
        ),
        actionButton("submit_button", label = "Submit")
      )
    ),
    column(width = 9,
  box(width = NULL,
    plotlyOutput("bowler_wk_plt")))
)))
