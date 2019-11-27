library(shiny)
library(shinythemes)
library(plotly)
# Define UI for application that draws a histogram
ui <- navbarPage("Bowling League Statistics",
        theme = shinytheme("yeti"),
        
        tabPanel("Setup",
                 fluidPage(

                         h3("User Guide"),
                         
                         p("Welcome to the Bowling League Statistics application! 
                            This application is compatible with data downloaded from
                            the League Secretary website."),
                         
                         h4("Steps to Upload Data"),
                         
                         p("1. Navigate to the League Secretary website: ", 
                           a("League Secretary", href="https://www.leaguesecretary.com/")),

                         p("2. Find your bowling league and navigate to Bowler History"),
                         
                         p("3. Download a csv file with the data of every bowler of interest"),
                         
                         p("4. Upload the data in the sidebar to the left")

                     
                 )
        ),
        
        tabPanel("Bowler Statistics",
                 sidebarLayout(
                     
                     sidebarPanel(
                         fileInput("bowler_dat", "Choose CSV File",
                                            accept = c(".csv"),
                                            multiple = TRUE),
                         submitButton(text = "Submit")
                     ),
                     
                     mainPanel(
                         tabsetPanel(
                             tabPanel("Plot",
                                      plotlyOutput("bowler_wk_plt")), 
                             tabPanel("Summary"), 
                             tabPanel("Table")
                         )
                     )
                 )),
        
        tabPanel("Team Statistics",
                 sidebarLayout(
                     
                     sidebarPanel(
                         # Inputs excluded for brevity
                     ),
                     
                     mainPanel(
                         tabsetPanel(
                             tabPanel("Plot"), 
                             tabPanel("Summary"),
                             tabPanel("Table")
                         )
                     )
                 ))
    )

