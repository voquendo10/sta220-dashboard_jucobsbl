# Packages ---------------------------------------------------------------------

# install.packages("tidyverse")

library(tidyverse)

# Import Data ------------------------------------------------------------------

college_scorecard <- read_csv("data/institutional_data_10-29-2026.csv")

college_scorecard_nj <- college_scorecard |> filter(STABBR == "NJ") # only colleges in new jersey
college_scorecard_nj <- college_scorecard_nj |> 
  filter(INSTNM %in% c("Rowan University",
                      "Rutgers University-New Brunswick",            # not in njac
                      "Rutgers University-Camden",
                      "Rutgers University-Newark",
                      "Montclair State University",
                      "The College of New Jersey",
                      "Kean University",
                      "New Jersey Institute of Technology",          # not in njac
                      "Stockton University",
                      "William Paterson University of New Jersey",
                      "Ramapo College of New Jersey",
                      "New Jersey City University")
  )