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

# missing NJCU pitchers Will be added to NJAC data
# expect 16 rows, 12 columns
njcu_pitchers_2025_2026 <- read_csv("data/njcu_pitchers_2025-2026_11-9-2026.csv")

# three checks
dim(njcu_pitchers_2025_2026)
names(njcu_pitchers_2025_2026)
summary(njcu_pitchers_2025_2026)



# Import All NJAC Pitching Totals ----------------------------------------------
njac_pitching_totals <- read_csv("data/pitching_totals_11-2-2026.csv")

# three checks
dim(njac_pitching_totals)
names(njac_pitching_totals)
summary(njac_pitching_totals)

