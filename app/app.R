# ==============================================================================
# Packages
# ==============================================================================

# un-comment install.packages() to download packages
# install.packages(c("tidyverse","shiny"))
library(tidyverse)
library(shiny)

# ==============================================================================
# Importing Clean Data
# ==============================================================================


# ==============================================================================
# User Interface
# ==============================================================================

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("What NJAC School Should I Transfer To?"),
  p("For: JUCO Pitchers preparing to trasnfer to a 4-year university"),
  p("The decision: Pick the NJAC school that fits you most"),
  
  selectInput(inputId = "pick", label = "Pick one:", choices = c("choice 1", "choice 2")),
  
  h3("Figure 1. title"),
  plotOutput(outputId = "fig_1"),
  p("a sentence or two saying what the figure shows."),
  
  h3("Figure 2. title"),
  plotOutput(outputId = "fig_2"),
  p("a sentence or two saying what the figure shows."),
  
  h3("What this dashboard cannot tell you"),
  p("the limits of your data.")
  
)

server <- function(input, output) {
  
  output$fig_1 <- renderPlot({
    
    ggplot()     # replace with your code for Figure 1
    
  })
  
  output$fig_2 <- renderPlot({
    
    ggplot()     # replace with your code for Figure 2
    
  })
  
}


# ==============================================================================
# Run the App
# ==============================================================================

shinyApp(ui, server)