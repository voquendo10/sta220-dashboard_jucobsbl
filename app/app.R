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

# creates the user interface
# fluidPage is a container, allows resizing of the window
ui <- fluidPage(
  
  # title of the dashboard
  titlePanel("What NCAA School Should I Transfer To?"),
  
  # paragraphs
  p("Who this is for: JUCO Pitchers preparing to transfer to a 4-year university"),
  p("The decision: Pick the NJAC school that fits you most"),
  
  # separates page into a small left side, and large right side
  sidebarLayout(
    
    # creates a panel that can hold input choices, like dropdown, slider, etc.
    sidebarPanel(
      
      # creates a dropdown
      selectInput(inputId = "pick_div",                    # name referenced to use the selection
                  label = "1. Select Division:",           # what the audience sees
                  choices = sort(unique(ncaa$division)),   # fills dropdown with unique division value in ncaa data
                  selected = "D1"                          # defaults the dropdown selection to D1
      ),
      selectInput(inputId = "pick_conf",                   # name referenced to use the selection
                  label = "2. Select Conference:",         # what the audience sees
                  choices = NULL                           # starts the dropdown as empty
      )
    ),
    mainPanel(
      
      # holds a spot for the output. so9 is the outputId
      plotOutput("so9")
    )
  )
)

# input - list of inputs
# output - list of outputs
# session - connects the server to the browser. need to update ui elements from the server
server <- function(input, output, session) {
  # filter ncaa by division
  # reactive expression re-runs automatically when an input it uses changes
  ncaa_div <- reactive({
    
    # this expression requires division input. stop expression if no input given
    # its a check
    req(input$pick_div)
    
    # filters ncaa data by division input
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
    
    ggplot(plot_data, aes(x = value, y = reorder(school, value), fill = stat)) +
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