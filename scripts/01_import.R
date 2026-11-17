# ==============================================================================
# Packages
# ==============================================================================

# un-comment install.packages() to download packages
# install.packages("tidyverse")

library(tidyverse)

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



# Import NJAC pitching totals --------------------------------------------------
njac_pitching_totals <- read_csv("data/pitching_totals_11-2-2026.csv")

# three checks
dim(njac_pitching_totals)
names(njac_pitching_totals)
summary(njac_pitching_totals)

write_csv(njac_pitching_totals, "app/data/njac_pitching_totals.csv")



# Import NJCAA Region 19 data --------------------------------------------------
# 23-24 season
njcaa_23_24 <- read_csv("data/region_19_23-24_11-16-2026.csv")

# three checks
dim(njcaa_23_24)
names(njcaa_23_24)
summary(njcaa_23_24)

# 24-25 season
njcaa_24_25 <- read_csv("data/region_19_24-25_11-16-2026.csv")

# three checks
dim(njcaa_24_25)
names(njcaa_24_25)
summary(njcaa_24_25)

