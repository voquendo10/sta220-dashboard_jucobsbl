# ==============================================================================
# Packages
# ==============================================================================

# un-comment install.packages() to download packages
# install.packages(c("tidyverse","shiny"))
library(tidyverse)
library(shiny)

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
# Importing Clean Data
# ==============================================================================

college_scorecard_njac <- read_csv("data/college_scorecard_njac.csv")
njac_pitchers_2025_2026 <- read_csv("data/njac_pitchers_2025_2026.csv")
njcaa_pitchers_2023_2025 <- read_csv("data/njcaa_pitchers_2023_2025.csv")

# ==============================================================================
# Run the App
# ==============================================================================

shinyApp(ui, server)