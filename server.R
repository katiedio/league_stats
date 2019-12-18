library(shiny)
library(dplyr)
library(ggplot2)
library(wesanderson)
library(scales)
library(plotly)


source("./helpers/utils.R")
source("./helpers/ind_plots.R")

# Define server logic required to draw a histogram
server <- function(input, output) {

  rv <- reactiveValues()  
    
    
bowler_dat <- reactive({
    inFile <- input$bowler_dat
    
    if (is.null(inFile)) return(NULL)
    
    read.csv(inFile$datapath)

})

observeEvent(input$submit_button,
output$bowler_wk_plt <- renderPlotly({
    require(bowler_dat())
    bowler_wk_plt(bowler_dat())
})
)
}


