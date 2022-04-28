
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

## Getting the Data

With `nih_research`, the user can select a year between 1985 - 2021 and
will receive a data frame with NIH funded research opportunities
relevant to the selected year. From there, the user can make use of the
other two functions, `median_total_cost` and `funding_frequency`, to
take a closer look at the funding data for the selected year.

Here are the columns of the dataframe that `nih_research` returns to the
user:

``` r
colnames(nih_research(1999)) 
#> https://reporter.nih.gov/services/exporter/Download?fileId=30
#> /tmp/RtmpCQhzZJ/RePORTER_PRJ_C_FY1999.csv
#> Rows: 80081 Columns: 42
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (29): ACTIVITY, ADMINISTERING_IC, BUDGET_START, BUDGET_END, CORE_PROJEC...
#> dbl   (6): APPLICATION_ID, APPLICATION_TYPE, CFDA_CODE, FY, SERIAL_NUMBER, S...
#> lgl   (6): ARRA_FUNDED, FUNDING_ICs, NIH_SPENDING_CATS, PHR, TOTAL_COST, TOT...
#> dttm  (1): AWARD_NOTICE_DATE
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> Rows: 80081 Columns: 42
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (29): ACTIVITY, ADMINISTERING_IC, BUDGET_START, BUDGET_END, CORE_PROJEC...
#> dbl   (6): APPLICATION_ID, APPLICATION_TYPE, CFDA_CODE, FY, SERIAL_NUMBER, S...
#> lgl   (6): ARRA_FUNDED, FUNDING_ICs, NIH_SPENDING_CATS, PHR, TOTAL_COST, TOT...
#> dttm  (1): AWARD_NOTICE_DATE
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#>  [1] "APPLICATION_ID"         "ACTIVITY"               "ADMINISTERING_IC"      
#>  [4] "APPLICATION_TYPE"       "ARRA_FUNDED"            "AWARD_NOTICE_DATE"     
#>  [7] "BUDGET_START"           "BUDGET_END"             "CFDA_CODE"             
#> [10] "CORE_PROJECT_NUM"       "ED_INST_TYPE"           "FOA_NUMBER"            
#> [13] "FULL_PROJECT_NUM"       "FUNDING_ICs"            "FY"                    
#> [16] "IC_NAME"                "NIH_SPENDING_CATS"      "ORG_CITY"              
#> [19] "ORG_COUNTRY"            "ORG_DEPT"               "ORG_DISTRICT"          
#> [22] "ORG_DUNS"               "ORG_FIPS"               "ORG_NAME"              
#> [25] "ORG_STATE"              "ORG_ZIPCODE"            "PHR"                   
#> [28] "PI_IDS"                 "PI_NAMEs"               "PROGRAM_OFFICER_NAME"  
#> [31] "PROJECT_START"          "PROJECT_END"            "PROJECT_TERMS"         
#> [34] "PROJECT_TITLE"          "SERIAL_NUMBER"          "STUDY_SECTION"         
#> [37] "STUDY_SECTION_NAME"     "SUBPROJECT_ID"          "SUFFIX"                
#> [40] "SUPPORT_YEAR"           "TOTAL_COST"             "TOTAL_COST_SUB_PROJECT"
```

## ExPORTER Data Dictionary

If you need more information on a column in your NIH Research dataset,
check out the [ExPORTER Data
Dictionary](https://report.nih.gov/exporter-data-dictionary).

## Visualization Examples

With `median_total_cost`, the user gets an interactive plot posing
number of support years against median total cost for a project. Median
total cost refers to total project funding from all NIH Institute and
Centers. You can use the function like so:

    median_total_cost(data2)

Here is a sample screenshot of an interactive plot for 1999 data:

![1999 Sample Plot](sample%20plots/1999%20median_total_cost.png)

With `funding_frequency`, the user gets an interactive map plot of the
United States that color codes based on frequency of NIH funding. The
user can hover their mouse over each state for specific counts and
adjust visual settings as needed. You can create one of these plots like
so:

    funding_frequency(data2)

Here is a sample screenshot of an interactive plot for 1999 data:

![1999 Sample Plot](sample%20plots/1999%20funding%20frequency.png)

## Authors

Benjamin Bruncati and Hongtong Lin
