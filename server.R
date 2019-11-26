library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output) {

output$contents <- renderTable({
    inFile <- input$bowler_dat
    
    if (is.null(inFile)) return(NULL)
    
        read.csv(inFile$datapath)

})

}


