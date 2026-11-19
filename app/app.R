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
transfers <- read_csv("data/transfers.csv")

# ==============================================================================
# User Interface
# ==============================================================================

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("What NJAC School Should I Transfer To?"),
  p("For: JUCO Pitchers preparing to trasnfer to a 4-year university"),
  p("The decision: Pick the NJAC school that fits you most"),
  
  selectInput(inputId = "pick", label = "Pick one:", choices = transfers |> distinct(division) |> pull()),
  
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
    
    ggplot(transfers |> filter(division == input$pick), aes(y = school_ncaa)) + 
      geom_bar() +
      labs(
        title = "Transfer Pitcher Count for each NCAA University in 2026",
        x = "Number of Transfers",
        y = "University",
        caption = "Source: Hugging Face"
      )
    
  })
  
  output$fig_2 <- renderPlot({
    
    ggplot()     # replace with your code for Figure 2
    
  })
  
}


# ==============================================================================
# Run the App
# ==============================================================================

shinyApp(ui, server)