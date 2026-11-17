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
  # Application title
  titlePanel("Test")
)

server <- function(input, output, session) {
  
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