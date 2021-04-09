library(shiny)
library(ggplot2)
library(tidyverse)

shinyServer(function(input, output) {

    br <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/brazil_loss.csv')
    
    value <- reactive({
        br <- br %>% select(year, input$var)
        br[br$year %in% seq(from = min(input$range), to = max(input$range), by = 1), ]   
    })
    
    data <- reactive({
        x <- br %>% select(year, input$var)
        x <- x[x$year %in% seq(from = min(input$range), to = max(input$range), by = 1), ]   
       sum(x[,2])
       
    })
    
    output$plot2 <- renderPlot({
        value() %>% ggplot(aes(.[[1]],.[[2]])) + 
            geom_point(size=3, color="#69b3a2") + 
            geom_area(fill="#69b3a2", alpha=0.4) +
            geom_line(color="#69b3a2", size=2) +
            labs(x="Time period", y = "Forest loss (in Ha)") +
            theme(axis.text=element_text(size=12), axis.title=element_text(size=14)) +
            ggtitle("Loss by period")
    
    })
       
    output$range <- renderText({
        data()
    }) 
})


