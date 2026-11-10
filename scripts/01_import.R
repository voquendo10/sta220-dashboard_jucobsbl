# ==============================================================================
# Packages
# ==============================================================================

# un-comment install.packages() to download packages
# install.packages(c("tidyverse", "sf"))

library(tidyverse)
library(sf)

# ==============================================================================
# Import Data
# ==============================================================================

# Import college scorecard data ------------------------------------------------
# expect 6278 rows, 3379 columns
college_scorecard <- read_csv("data/institutional_data_10-29-2026.csv")

# three checks
dim(college_scorecard)
names(college_scorecard)
summary(college_scorecard)




# Import NCAA individual data --------------------------------------------------
# expect 27470 rows, 25 columns
indiv_stats <- read_csv("data/individual_stats_11-2-2026.csv")

# three checks
dim(indiv_stats)
names(indiv_stats)
summary(indiv_stats)

# expect 161 rows, 21 columns
indiv_pitcher_info <- read_csv("data/individual_info_11-2-2026.csv") # data set did not include NJCU

# three checks
dim(indiv_pitcher_info)
names(indiv_pitcher_info)
summary(indiv_pitcher_info)

# expect 16 rows, 12 columns
njcu_pitchers_2025_2026 <- read_csv("data/njcu_pitchers_2025-2026_11-9-2026.csv")

# three checks
dim(njcu_pitchers_2025_2026)
names(njcu_pitchers_2025_2026)
summary(njcu_pitchers_2025_2026)



# Import NJCAA individual data -------------------------------------------------
# missing several njcaa schools baseball stats (not a result of data collection, but of actual missing data)
njcaa_players_2024_2025 <- read_csv("data/njcaa_2024_2025_pitching_11-3-2026.csv")

# three checks
dim(njcaa_players_2024_2025)
names(njcaa_players_2024_2025)
summary(njcaa_players_2024_2025)

# NJCAA data last 3 years
njcaa_players_3yr <- read_csv("data/NJCAA_3_Years_Pitching.csv")

# three checks
dim(njcaa_players_3yr)
names(njcaa_players_3yr)
summary(njcaa_players_3yr)

# clean njcaa table variable names to lower_snake_case
names(njcaa_players_2024_2025) <- names(njcaa_players_2024_2025) |>
  str_to_lower() |>
  str_replace_all("\\s+", "_")

names(njcaa_players_3yr) <- names(njcaa_players_3yr) |>
  str_to_lower() |>
  str_replace_all("\\s+", "_")

# three checks
dim(njcaa_players_3yr)
names(njcaa_players_3yr)
summary(njcaa_players_3yr)



# Import All NJAC Pitching Totals ----------------------------------------------
njac_pitching_totals <- read_csv("data/pitching_totals_11-2-2026.csv")

# three checks
dim(njac_pitching_totals)
names(njac_pitching_totals)
summary(njac_pitching_totals)

