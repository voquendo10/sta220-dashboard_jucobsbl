# ------------------------------------------------------------------------------
# Financial Visualizations
# ------------------------------------------------------------------------------

# ==============================================================================
# Net Price vs. Median Amount Earned After 5 Years
# ==============================================================================
# 1. Clean the data (convert character columns to numeric if needed)
college_scorecard_njac_v1 <- college_scorecard_njac |>
  mutate(
    avg_net_price   = as.numeric(as.character(avg_net_price)),   # as.character in case variables were imported as "factor" type
    median_earn_5yr = as.numeric(as.character(median_earn_5yr))  # i.e. if value was factor level 1, as.numeric turns value to 1
  )

# 2. Calculate mean or median benchmark reference lines for quadrants
mean_price <- mean(college_scorecard_njac_v1$avg_net_price, na.rm = TRUE)
mean_earn  <- mean(college_scorecard_njac_v1$median_earn_5yr, na.rm = TRUE)

# 3. Build the quadrant scatter plot
p1 <- ggplot(college_scorecard_njac_v1, aes(x = avg_net_price, y = median_earn_5yr)) +
  # create scatter plot
  geom_point() +
  # add 4 quadrants using mean price and mean earn
  geom_vline(xintercept = mean_price, linetype = "dashed") +
  geom_hline(yintercept = mean_earn, linetype = "dashed") +
  # add names to points
  geom_text(aes(label = institution_name), vjust = -0.7, size = 2.5) +
  # add titles, labels, caption
  labs(
    title = "Net Price vs. 5-Year Alumni Earnings at NJAC Institutions",
    subtitle = "Dashed lines represent 2025-2026 averages for quadrant division",
    x = "Average Annual Net Price ($)",
    y = "Median Earnings 5 Years Post-Graduation ($)",
    caption = "Source: College Scorecard"
  )

# save plot to output directory
ggsave("output/net_price_vs_5yr_earn.png", plot = p1)

# ------------------------------------------------------------------------------
# Baseball Visualizations
# ------------------------------------------------------------------------------

# ==============================================================================
# Team-Level NJAC Pitching Stats
# ==============================================================================
# 1. Get ERA of NJAC (Total NJAC earned runs * 9 / total NJAC innings pitched)
njac_era <- (sum(njac_pitching_totals$er) * 9) / sum(njac_pitching_totals$ip)

# 2. Create bar chart of each team ERA, with NJAC ERA
p2 <- ggplot(njac_pitching_totals, aes(x = era, y = fct_rev(fct_reorder(school, era)))) +
  # create the bar chart
  geom_col() +
  # add vertical line of avg era of njac
  geom_vline(xintercept = njac_era, linetype = "dashed") +
  labs(
    title = "Kean, Rowan, Montclair State Among the Best Team Pitching Staff across the NJAC",
    subtitle = "Dashed line represents conference average ERA",
    x = "Team Earned Run Average (ERA)",
    y = "NJAC School",
    caption = "Source: The Baseball Cube"
  ) +
  theme_minimal()

ggsave("output/team_era_njac.png", plot = p2)

# ==============================================================================
# Strikeout to Walk Ratio
# ==============================================================================

# 1. Plot the ratio, with a regression line