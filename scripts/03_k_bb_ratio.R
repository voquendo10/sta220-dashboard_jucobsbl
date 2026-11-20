# ==============================================================================
# Pitch-to-Contact vs. Strikeout Programs
# ==============================================================================

# pitch-to-contact programs have low strikeouts per 9
# strikeout programs have high strikeouts per 9
# a strikeout pitcher might not want to consider a pitch-to-contact program

# show the strikeout per 9 for each NCAA program: (so / ip) * 9
so9_ncaa <- ncaa |>
  filter(division == "D3" & conference == "New Jersey Athletic Conference") |>
  group_by(school) |>
  summarize(
    so = sum(k, na.rm = TRUE),
    ip_total = sum(ip, na.rm = TRUE),
    so9 = (so / ip_total) * 9,
    era = sum(era * ip, na.rm = TRUE) / ip_total
  ) |>
  filter(!is.nan(so9))

so9_ncaa_med <- mean(so9_ncaa$so9)

# 1. Reshape so 'so9' and 'era' are in a single 'stat' column
so9_ncaa_long <- so9_ncaa |>
  pivot_longer(
    cols = c(so9, era),
    names_to = "stat",
    values_to = "value"
  )

# 2. Plot horizontal side-by-side bars
ggplot(so9_ncaa_long, aes(x = value, y = school, fill = stat)) +
  geom_col(position = "dodge") +
  geom_vline(xintercept = so9_ncaa_med, linetype = "dashed") +
  labs(
    x = "Rate (per 9 Innings)",
    y = "School",
    fill = "Metric"
  )
  