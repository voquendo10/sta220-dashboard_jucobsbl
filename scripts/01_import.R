# Packages ---------------------------------------------------------------------

install.packages(c("tidyverse", "baseballr", "chromote"))

library(tidyverse)
library(baseballr)
library(chromote)

# Import Data ------------------------------------------------------------------

# import college scorecard data
college_scorecard <- read_csv("data/institutional_data_10-29-2026.csv")

# filter only nj colleges/universities
college_scorecard_nj <- college_scorecard |> filter(STABBR == "NJ") # only colleges in new jersey

# filter only schools in the NJA Conference with baseball
college_scorecard_nj <- college_scorecard_nj |> 
  filter(INSTNM %in% c("Rowan University",
                      "Rutgers University-Camden",
                      "Rutgers University-Newark",
                      "Montclair State University",
                      "The College of New Jersey",
                      "Kean University",
                      "Stockton University",
                      "William Paterson University of New Jersey",
                      "Ramapo College of New Jersey",
                      "New Jersey City University")
  )

# filter to columns you will need

# import individual data
indiv_stats <- read_csv("data/individual_stats_11-2-2026.csv")

# data set did not include NJCU
indiv_pitcher_info <- read_csv("data/individual_info_11-2-2026.csv")

# join individual datasets to get all players info + stats for NJAC