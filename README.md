
<!-- README.md is generated from README.Rmd. Please edit that file -->

# researchr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/kbruncati)](https://CRAN.R-project.org/package=researchr)
<!-- badges: end -->

The goal of researchr is to make finding information about funded
research opportunities easier and more accessible. This package takes a
year as an input and will return a dataframe of information on funded
NIH research opportunities from that year. Details include PIs,
location, department, and much more.

## Installation

You can install researchr like so:

    remotes::install_github('kbruncati/diviiproject')

## Example

Here are some basic examples to show what `data_return` returns to the
user, as well as some “error” examples:

``` r
library(researchr)

class(nih_research(2002))
#> https://reporter.nih.gov/services/exporter/Download?fileId=36
#> /tmp/RtmpjlbQbg/RePORTER_PRJ_C_FY2002.csv
#> Rows: 83423 Columns: 42
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (30): ACTIVITY, ADMINISTERING_IC, BUDGET_START, BUDGET_END, CORE_PROJEC...
#> dbl   (8): APPLICATION_ID, APPLICATION_TYPE, CFDA_CODE, FY, SERIAL_NUMBER, S...
#> lgl   (3): ARRA_FUNDED, NIH_SPENDING_CATS, PHR
#> dttm  (1): AWARD_NOTICE_DATE
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> [1] "spec_tbl_df" "tbl_df"      "tbl"         "data.frame"

ncol(nih_research(1999))  
#> https://reporter.nih.gov/services/exporter/Download?fileId=30
#> /tmp/RtmpjlbQbg/RePORTER_PRJ_C_FY1999.csv
#> Rows: 80081 Columns: 42── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (29): ACTIVITY, ADMINISTERING_IC, BUDGET_START, BUDGET_END, CORE_PROJEC...
#> dbl   (6): APPLICATION_ID, APPLICATION_TYPE, CFDA_CODE, FY, SERIAL_NUMBER, S...
#> lgl   (6): ARRA_FUNDED, FUNDING_ICs, NIH_SPENDING_CATS, PHR, TOTAL_COST, TOT...
#> dttm  (1): AWARD_NOTICE_DATE
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> [1] 42

colnames(nih_research(1999))[-1] 
#> https://reporter.nih.gov/services/exporter/Download?fileId=30
#> /tmp/RtmpjlbQbg/RePORTER_PRJ_C_FY1999.csv
#> Rows: 80081 Columns: 42── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (29): ACTIVITY, ADMINISTERING_IC, BUDGET_START, BUDGET_END, CORE_PROJEC...
#> dbl   (6): APPLICATION_ID, APPLICATION_TYPE, CFDA_CODE, FY, SERIAL_NUMBER, S...
#> lgl   (6): ARRA_FUNDED, FUNDING_ICs, NIH_SPENDING_CATS, PHR, TOTAL_COST, TOT...
#> dttm  (1): AWARD_NOTICE_DATE
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#>  [1] "ACTIVITY"               "ADMINISTERING_IC"       "APPLICATION_TYPE"      
#>  [4] "ARRA_FUNDED"            "AWARD_NOTICE_DATE"      "BUDGET_START"          
#>  [7] "BUDGET_END"             "CFDA_CODE"              "CORE_PROJECT_NUM"      
#> [10] "ED_INST_TYPE"           "FOA_NUMBER"             "FULL_PROJECT_NUM"      
#> [13] "FUNDING_ICs"            "FY"                     "IC_NAME"               
#> [16] "NIH_SPENDING_CATS"      "ORG_CITY"               "ORG_COUNTRY"           
#> [19] "ORG_DEPT"               "ORG_DISTRICT"           "ORG_DUNS"              
#> [22] "ORG_FIPS"               "ORG_NAME"               "ORG_STATE"             
#> [25] "ORG_ZIPCODE"            "PHR"                    "PI_IDS"                
#> [28] "PI_NAMEs"               "PROGRAM_OFFICER_NAME"   "PROJECT_START"         
#> [31] "PROJECT_END"            "PROJECT_TERMS"          "PROJECT_TITLE"         
#> [34] "SERIAL_NUMBER"          "STUDY_SECTION"          "STUDY_SECTION_NAME"    
#> [37] "SUBPROJECT_ID"          "SUFFIX"                 "SUPPORT_YEAR"          
#> [40] "TOTAL_COST"             "TOTAL_COST_SUB_PROJECT"

#nih_research("a")

#nih_research(1805)
```

## Authors

Benjamin Bruncati and Hongtong Lin
