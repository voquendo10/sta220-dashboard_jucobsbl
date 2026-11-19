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
ncaa_stats <- read_csv("data/individual_stats_11-2-2026.csv")

# three checks
dim(ncaa_stats)
names(ncaa_stats)
summary(ncaa_stats)

# expect 161 rows, 21 columns
ncaa_info <- read_csv("data/individual_info_11-17-2026.csv") # data set did not include NJCU

# three checks
dim(ncaa_info)
names(ncaa_info)
summary(ncaa_info)



# Import NJAC pitching totals --------------------------------------------------
njac_pitching_totals <- read_csv("data/pitching_totals_11-2-2026.csv")

# three checks
dim(njac_pitching_totals)
names(njac_pitching_totals)
summary(njac_pitching_totals)



# Import NJCAA Region 19 data --------------------------------------------------
# 23-24 season
njcaa_24 <- read_csv("data/region_19_23-24_11-16-2026.csv")

# three checks
dim(njcaa_24)
names(njcaa_24)
summary(njcaa_24)

# 24-25 season
njcaa_25 <- read_csv("data/region_19_24-25_11-16-2026.csv")

# three checks
dim(njcaa_25)
names(njcaa_25)
summary(njcaa_25)

