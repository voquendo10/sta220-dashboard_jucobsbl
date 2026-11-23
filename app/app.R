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
ncaa <- read_csv("data/ncaa.csv")

# ==============================================================================
# User Interface
# ==============================================================================

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("What NJAC School Should I Transfer To?"),
  p("For: JUCO Pitchers preparing to transfer to a 4-year university"),
  p("The decision: Pick the NJAC school that fits you most"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "pick_div", 
                  label = "1. Select Division:", 
                  choices = sort(unique(ncaa$division)),
                  selected = "D1"
      ),
      selectInput(inputId = "pick_conf", 
                  label = "2. Select Conference:", 
                  choices = NULL
      )
    ),
    mainPanel(
      plotOutput("so9")
    )
  )
)

server <- function(input, output, session) {
  # filter ncaa by division
  ncaa_div <- reactive({
    req(input$pick_div)
    ncaa |>
      filter(division == input$pick_div)
  })
  
  # filter by conference (only show conferences in the division)
  observeEvent(ncaa_div(), {
    available_conferences <- sort(unique(ncaa_div()$conference))
    
    updateSelectInput(
      session = session,
      inputId = "pick_conf",
      choices = available_conferences
    )
  })
  
  so9_ncaa_long <- reactive({
    req(input$pick_conf)
    req(input$pick_conf %in% ncaa_div()$conference)
    
    so9_ncaa <- ncaa_div() |>
      filter(conference == input$pick_conf) |>
      group_by(school) |>
      summarize(
        so = sum(k, na.rm = TRUE),
        ip_total = sum(ip, na.rm = TRUE),
        so9 = (so / ip_total) * 9,
        era = sum(era * ip, na.rm = TRUE) / ip_total
      ) |> ungroup() |>
      filter(!is.nan(so9))
    
    so9_ncaa |>
      pivot_longer(
        cols = c(so9, era),
        names_to = "stat",
        values_to = "value"
      )
  })
  
  output$so9 <- renderPlot({
    plot_data <- so9_ncaa_long()
    req(nrow(plot_data) > 0)
    
    so9_ncaa_med <- plot_data |>
      filter(stat == "so9") |>
      summarize(so9_med = median(value, na.rm = TRUE)) |>
      pull(so9_med)
    
    ggplot(plot_data, aes(x = value, y = school, fill = stat)) +
      geom_col(position = "dodge") + 
      geom_vline(xintercept = so9_ncaa_med, linetype = "dashed") +
      labs(
        title = paste(input$pick_div, "-", input$pick_conf),
        x = "K/9 vs. ERA",
        y = "School",
        fill = "Metric"
      ) + 
      theme_minimal()
  })
}


# ==============================================================================
# Run the App
# ==============================================================================

shinyApp(ui, server)