# ------------------------------------------------------------------------------
# Packages
# ------------------------------------------------------------------------------

install.packages(c("tidyverse", "baseballr", "chromote"))

library(tidyverse)
library(baseballr)
library(chromote)

# ------------------------------------------------------------------------------
# Import Data
# ------------------------------------------------------------------------------

# Import college scorecard data  -------------------------
# expect 6278 rows, 3379 columns
college_scorecard <- read_csv("data/institutional_data_10-29-2026.csv")

dim(college_scorecard)
names(college_scorecard)
summary(college_scorecard)

# Import individual data ---------------------------------
# expect 27470 rows, 25 columns
indiv_stats <- read_csv("data/individual_stats_11-2-2026.csv")

dim(indiv_stats)
names(indiv_stats)
summary(indiv_stats)

# expect 161 rows, 21 columns
indiv_pitcher_info <- read_csv("data/individual_info_11-2-2026.csv") # data set did not include NJCU

dim(indiv_pitcher_info)
names(indiv_pitcher_info)
summary(indiv_pitcher_info)



