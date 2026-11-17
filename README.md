# What is this?
This dashboard helps a Junior College (JUCO) baseball pitcher decide which public New Jersey Athletic Conference (NJAC) university to transfer to by comparing schools on both financial value (costs, financial aid, and post-graduate ROI) and athletic player development. By combining public institutional data with historical pitching statistics, it uncovers the hidden financial and on-field realities of each program to support a more informed transfer decision.

# Where did the data come from?
This project contains several different data sources.
1. College Scorecard Institutional Data is all data files for 1996-97 through 2025-26 containing aggregate data for each institution in the United States. It is from the U.S. Department of Education. It was downloaded October 29th, 2026. This link is:  [College Scorecard Insitutional Data](https://collegescorecard.ed.gov/data)
2. Pitcher Totals data is team-level data for each all 10 teams in the NJAC for the 2025-26 season. The data comes from The Baseball Cube, a long-running baseball statistics database tracking player, team, and league data across several levels of organized baseball. The data was downloaded November 2nd, 2026. The link is: [Pitching Totals](https://www.thebaseballcube.com/content/college_summary.asp?ID=2026~NJAC&view=totals#pitching)
3. Individual Info data is athlete roster data for the NJAC 2025-26 year. The data is missing the data for New Jersey City University. The data comes from Hugging Face (compiled by Dharit Shah, CC0 1.0 public domain license). The data was downloaded November 2nd, 2026. The link is: [Individual Info](https://huggingface.co/datasets/dharits3/ncaa-college-athlete-rosters-2025-26/viewer?views%5B%5D=default_full&views%5B%5D=baseball&sql=--+The+SQL+console+is+powered+by+DuckDB+WASM+and+runs+entirely+in+the+browser.%0A--+Get+started+by+typing+a+query+or+selecting+a+view+from+the+options+below.%0ASELECT+*%0AFROM+default_full+%0AWHERE+sport+%3D+%27baseball%27%0A++AND+conference+%3D+%27New+Jersey+Athletic+Conference%27%3B)
4. Individual Stats data is athlete statistics for the NJAC 2025-26 year. The data comes from Hugging Face (compiled by Dharit Shah, CC0 1.0 public domain license). The data was downloaded November 2nd, 2026. The link is: [Individual Stats](https://huggingface.co/datasets/dharits3/ncaa-college-athlete-rosters-2025-26/raw/main/by_sport/baseball/stats.csv)
5. NJCU Pitcher data is pitcher data for NJCU pitchers in the 2025-26 year. This data was manually compiled using the NJCU baseball statistics website. The data was compiled in Google sheets. Each column was named exactly as the columns kept and used in the join between the Individual Info and Individual Stats datasets. The data was compiled and downloaded on November 9th, 2026. The link is: [NJCU Pitchers](https://njacsports.com/teamstats.aspx?path=baseball&year=2026&school=njcu). Optional: Click the "PITCHING" tab at the top to only show pitching stats.

# How do I run it?


# What is in each folder?
This repository contains 5 folders.
1. The data folder contains all data used in the scripts as .csv files.
2. The scripts folder contains each script used in this project to develop the dashboard.
3. The output folder contains all visualizations created from the scripts as .png files.
4. The library folder contains the PDF codebook for the College Scorecard data.
5. The hold-then delete contains all files that would be deleted, but kept just in case.

# Who made it, and when was it last updated?
