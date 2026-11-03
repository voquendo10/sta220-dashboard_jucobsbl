# Packages ---------------------------------------------------------------------

install.packages(c("tidyverse", "baseballr", "chromote"))

library(tidyverse)
library(baseballr)
library(chromote)

# ------------------------------------------------------------------------------
# Import Data
# ------------------------------------------------------------------------------

# import college scorecard data
# expect 6278 rows, 3379 columns
college_scorecard <- read_csv("data/institutional_data_10-29-2026.csv")

# filter only baseball njac colleges/universities
# expect 10 rows, 3379 columns
college_scorecard_njac <- college_scorecard |> 
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

dim(college_scorecard_njac) # returns 10 3379
names(college_scorecard_njac)
summary(college_scorecard_njac)

# select columns you need

# import individual data
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

# ------------------------------------------------------------------------------
# Join Individual Player Data Sets
# ------------------------------------------------------------------------------
# === check 1 - key verification ===
names(indiv_pitcher_info)
names(indiv_stats)

# must both be 0 in order for athlete_id to be a key
indiv_pitcher_info |> count(athlete_id) |> filter(n > 1)  # returns 0 - athlete_id is a key!
indiv_stats |> count(athlete_id) |> filter(n > 1)         # returns 0 - athlete_id is a key!

# === check 2 - anti joins ===
indiv_pitcher_info |> anti_join(indiv_stats, join_by(athlete_id)) # returns 18 - on the roster, but no stats (injured, doesn't meet grade requirements, etc.)
indiv_stats |> anti_join(indiv_pitcher_info, join_by(athlete_id)) # returns 27,327 - pitcher_info table is only njac players, all 27,327 players are outside the njac!

# === check 3 - left join stats (right table) to info (left table) by athlete_id ===
# expect 161 rows, 45 columns (some columns will repeat (col.x, col.y))
njac_pitchers <- indiv_pitcher_info |>
  left_join(indiv_stats, by = "athlete_id")

dim(njac_pitchers)
names(njac_pitchers)
summary(njac_pitchers)



