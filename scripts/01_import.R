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

dim(college_scorecard)
names(college_scorecard)
summary(college_scorecard)

# filter only baseball NJAC colleges/universities
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

dim(college_scorecard_njac)

# select necessary columns
college_scorecard_njac <- college_scorecard_njac |>
  select(
    # Institutional Context
    unitid            = UNITID,         # The unique 6-digit federal identification number assigned to each postsecondary institution in IPEDS.
    opeid             = OPEID,          # The Office of Postsecondary Education identification number used to track Title IV financial aid eligibility.
    institution_name  = INSTNM,         # The official name of the college or university as reported to the federal government.
    latitude          = LATITUDE,       #
    longitude         = LONGITUDE,      #
    undergrad_size    = UGDS,           # Total count of degree- or certificate-seeking undergraduate students enrolled during the fall census.
    acceptance_rate   = ADM_RATE,       # The share of undergraduate applicants who are offered admission to the institution in the fall term.
    pct_pell          = PCTPELL_DCS,    # Share of undergraduate students receiving federal Pell Grants, serving as a proxy for low-income student enrollment.
    pct_part_time     = PPTUG_EF,       # Share of enrolled undergraduates taking less than a full-time course load.
    
    # Cost & Affordability
    avg_net_price     = NPT4_PUB,       # Average annual cost of attendance (tuition, fees, living expenses) minus grant and scholarship aid for in-state Title IV students.
    net_price_inc_q1  = NPT41_PUB,      # $0 - $30k     Average annual net price for students from families earning $0–$30,000 per year.
    net_price_inc_q2  = NPT42_PUB,      # $30k - $48k
    net_price_inc_q3  = NPT43_PUB,      # $48k - $75k
    net_price_inc_q4  = NPT44_PUB,      # $75k - $110k
    net_price_inc_q5  = NPT45_PUB,      # $110k+
    in_state_tuition  = TUITIONFEE_IN,  # Annual sticker price for published tuition and mandatory fees for New Jersey residents.
    room_board_on     = ROOMBOARD_ON,   # Estimated annual institution-reported cost for on-campus housing and meal plans.
    room_board_off    = ROOMBOARD_OFF,  # Estimated annual living expenses for students residing off-campus (not with family).
    
    # Student Debt & Repayment
    pct_fed_loan      = PCTFLOAN_DCS,            # Percentage of undergraduate students who take out federal Direct Loans during the academic year.
    median_debt_all   = DEBT_MDN,                # Cumulative median federal loan principal accumulated by all student borrowers upon leaving the institution.
    median_debt_grad  = GRAD_DEBT_MDN,           # Cumulative median federal loan principal accumulated specifically by students who successfully completed their degree.
    median_parent_plus = PLUS_DEBT_INST_MD,      # Cumulative median federal loan debt borrowed by parents on behalf of students attending the school.
    repay_prog_1yr    = BBRR1_FED_UG_MAKEPROG,   # Share of federal loan borrowers who are actively making progress on reducing their loan principal balance 1 year after entering repayment.
    repay_prog_4yr    = BBRR4_FED_UG_MAKEPROG,   # Share of federal loan borrowers who are actively making progress on reducing their loan principal balance 5 years after entering repayment.
    
    # Retention & Graduation Outcomes
    retention_rate_ft = RET_FT4_POOLED,   # Percentage of first-time, full-time bachelor's degree-seeking freshmen who return to the school for their sophomore year.
    grad_rate_6yr     = C150_4_POOLED,    # Percentage of first-time, full-time undergraduate students who complete their degree within 6 years (150% of standard time).
    grad_rate_8yr     = OMAWDP8_FTFT,     # Percentage of undergraduate students who complete their degree within 8 years, accounting for transfers and part-time students.
    
    # Post-Graduation Earnings & ROI
    median_earn_1yr   = MD_EARN_WNE_1YR,  # Median annual earnings of working alumni 1 year after leaving the institution.
    median_earn_5yr   = MD_EARN_WNE_5YR,  # Median annual earnings of working alumni 5 years after leaving the institution.
    pct_earn_above_hs = GT_THRESHOLD_1YR  # Share of former students working full-time who earn more than the median wage of a high school graduate 1 year after leaving.
  )

# check names
names(college_scorecard_njac)

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



