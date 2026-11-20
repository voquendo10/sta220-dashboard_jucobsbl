# What is this?
This dashboard helps a Junior College (JUCO) baseball pitcher decide which public New Jersey Athletic Conference (NJAC) university to transfer to by comparing schools on both financial value (costs, financial aid, and post-graduate ROI) and athletic player development. By combining public institutional data with historical pitching statistics, it uncovers the hidden financial and on-field realities of each program to support a more informed transfer decision.

# Where did the data come from?
This project contains several different data sources.
1. College Scorecard Institutional Data is all data files for 1996-97 through 2025-26 containing aggregate data for each institution in the United States. It is from the U.S. Department of Education. It was downloaded October 29th, 2026. This link is:  [College Scorecard Insitutional Data](https://collegescorecard.ed.gov/data)
2. Pitcher Totals data is team-level data for each all 10 teams in the NJAC for the 2025-26 season. The data comes from The Baseball Cube, a long-running baseball statistics database tracking player, team, and league data across several levels of organized baseball. The data was downloaded November 2nd, 2026. The link is: [Pitching Totals](https://www.thebaseballcube.com/content/college_summary.asp?ID=2026~NJAC&view=totals#pitching)
3. Individual Info data is athlete roster data for all NCAA players in the 2025-26 year. The data comes from Hugging Face (compiled by Dharit Shah, CC0 1.0 public domain license). The data is missing some schools, like NJCU, for example. The data was downloaded November 17th, 2026. The link is: [Individual Info](https://huggingface.co/datasets/dharits3/ncaa-college-athlete-rosters-2025-26/raw/main/by_sport/baseball/all.csv)
4. Individual Stats data is athlete statistics for the NJAC 2025-26 year. The data comes from Hugging Face (compiled by Dharit Shah, CC0 1.0 public domain license). The data was downloaded November 2nd, 2026. The link is: [Individual Stats](https://huggingface.co/datasets/dharits3/ncaa-college-athlete-rosters-2025-26/raw/main/by_sport/baseball/stats.csv)
5. Region 19 Pitcher Statistics 2023-24 is pitcher data for each school in Region 19 of the NJCAA (JUCO). This data was manually compiled from The Baseball Cube. The data was compiled and downloaded November 16th, 2026. The link is: [Region 19 Pitcher Statistics 2023-24](https://www.thebaseballcube.com/content/college_summary/2024~NJCAA-Reg19/). The data was compiled in the following manner:
    1. Click each school
    2. Scroll to "Pitching Statistics"
    3. Click "CSV"
    4. Copy the text into Notepad on windows
    5. Repeat for each school. Note: Only the first school included the header row. No school included the totals row
    6. Download the Notepad text as a .csv file
6. Region 19 Pitcher Statistics 2024-25 is pitcher data for each school in Region 19 of the NJCAA (JUCO). This data was manually compiled from The Baseball Cube. The data was compiled and downloaded November 16th, 2026. The link is: [Region 19 Pitcher Statistics 2024-25](https://www.thebaseballcube.com/content/college_summary/2025~NJCAA-Reg19/). The data was compiled in the same manner as Region 19 Pitcher Statistics 2023-24.

# How do I run it?


# What is in each folder?
This repository contains 5 folders.
1. The data folder contains all data used in the scripts as .csv files.
2. The scripts folder contains each script used in this project to develop the dashboard.
3. The output folder contains all visualizations created from the scripts as .png files.
4. The library folder contains the PDF codebooks for data, including College Scorecard and The Baseball Cube
5. The hold-then delete contains all files that would be deleted, but kept just in case.

# Who made it, and when was it last updated?
