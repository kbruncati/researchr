
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
year as an input and will return information on funded NIH research
opportunities from that year. Details include PIs, location, department,
and much more.

## Installation

You can install researchr like so:

    remotes::install_github('kbruncati/diviiproject')

## Example

Here are some basic examples to show what `data_return` returns to the
user, as well as some “error” examples:

``` r
library(researchr)

class(researchr::data_return(2002))
#> [1] "data.frame"

ncol(researchr::data_return(1999))  
#> [1] 42

colnames(researchr::data_return(1999))[-1] 
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

researchr::data_return("a")
#> [1] "Invalid input. Please enter a valid year between 1985 and 2020."

researchr::data_return(1805)
#> [1] "Invalid input. Please enter a valid year between 1985 and 2020."
```

## Authors

Benjamin Bruncati and Hongtong Lin
