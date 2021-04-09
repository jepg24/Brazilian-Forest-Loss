library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Brazil forest lost"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("range",
                        label = "Range date of interest:",
                        min = 2001,
                        max = 2013,
                        value = c(2005, 2008)),
        
            selectInput("var",
                        label = "Choose a variable",
                        choices = list("Commercial crops" = "commercial_crops",
                                       "Natural disturbances" = "natural_disturbances",
                                       "Pasture for livestock" = "pasture",
                                       "Logging for lumber" = "selective_logging",
                                       "Fire loss" = "fire"),
                        selected = "Commercial crops"),
            
            a(href = "https://rpubs.com/jepg24/751831", "Documentation")
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            h4("Interactive plot"),
            plotOutput("plot2"),
            h4("Total Forest loss (in Ha)"),
            h1(textOutput("range"))
        )
    )
))
