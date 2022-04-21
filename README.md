
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

## Data Examples

Here are some basic examples to show what data `nih_research` returns to
the user:

``` r
class(nih_research(1999))
#> https://reporter.nih.gov/services/exporter/Download?fileId=30
#> /tmp/RtmpxyAU8a/RePORTER_PRJ_C_FY1999.csv
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
#> [1] "spec_tbl_df" "tbl_df"      "tbl"         "data.frame"

colnames(nih_research(1999)) 
#> https://reporter.nih.gov/services/exporter/Download?fileId=30
#> /tmp/RtmpxyAU8a/RePORTER_PRJ_C_FY1999.csv
#> Rows: 80081 Columns: 42── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (29): ACTIVITY, ADMINISTERING_IC, BUDGET_START, BUDGET_END, CORE_PROJEC...
#> dbl   (6): APPLICATION_ID, APPLICATION_TYPE, CFDA_CODE, FY, SERIAL_NUMBER, S...
#> lgl   (6): ARRA_FUNDED, FUNDING_ICs, NIH_SPENDING_CATS, PHR, TOTAL_COST, TOT...
#> dttm  (1): AWARD_NOTICE_DATE
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.Rows: 80081 Columns: 42── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (29): ACTIVITY, ADMINISTERING_IC, BUDGET_START, BUDGET_END, CORE_PROJEC...
#> dbl   (6): APPLICATION_ID, APPLICATION_TYPE, CFDA_CODE, FY, SERIAL_NUMBER, S...
#> lgl   (6): ARRA_FUNDED, FUNDING_ICs, NIH_SPENDING_CATS, PHR, TOTAL_COST, TOT...
#> dttm  (1): AWARD_NOTICE_DATE
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

Here is a sample interactive data visualization posing median total
project costs against length of funding for 1999:

``` r
median_total_cost(data2)
#> Warning: Removed 1997 rows containing non-finite values (stat_count).
#> PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

<div id="htmlwidget-690358c5c02cbbb78142" style="width:100%;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-690358c5c02cbbb78142">{"x":{"data":[{"orientation":"v","width":[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.899999999999999,0.900000000000002,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006,0.900000000000006],"base":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"x":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,50,54],"y":[11966,8560,6988,5170,4414,2953,2413,2315,2421,2223,1465,1542,1493,1742,1557,1236,1190,971,563,1002,595,1504,516,1129,831,958,823,1007,181,339,224,129,171,137,580,359,1206,2504,2574,96,9,7,6,10,1,2,1,1],"text":["count: 11966<br />SUPPORT_YEAR:  1","count:  8560<br />SUPPORT_YEAR:  2","count:  6988<br />SUPPORT_YEAR:  3","count:  5170<br />SUPPORT_YEAR:  4","count:  4414<br />SUPPORT_YEAR:  5","count:  2953<br />SUPPORT_YEAR:  6","count:  2413<br />SUPPORT_YEAR:  7","count:  2315<br />SUPPORT_YEAR:  8","count:  2421<br />SUPPORT_YEAR:  9","count:  2223<br />SUPPORT_YEAR: 10","count:  1465<br />SUPPORT_YEAR: 11","count:  1542<br />SUPPORT_YEAR: 12","count:  1493<br />SUPPORT_YEAR: 13","count:  1742<br />SUPPORT_YEAR: 14","count:  1557<br />SUPPORT_YEAR: 15","count:  1236<br />SUPPORT_YEAR: 16","count:  1190<br />SUPPORT_YEAR: 17","count:   971<br />SUPPORT_YEAR: 18","count:   563<br />SUPPORT_YEAR: 19","count:  1002<br />SUPPORT_YEAR: 20","count:   595<br />SUPPORT_YEAR: 21","count:  1504<br />SUPPORT_YEAR: 22","count:   516<br />SUPPORT_YEAR: 23","count:  1129<br />SUPPORT_YEAR: 24","count:   831<br />SUPPORT_YEAR: 25","count:   958<br />SUPPORT_YEAR: 26","count:   823<br />SUPPORT_YEAR: 27","count:  1007<br />SUPPORT_YEAR: 28","count:   181<br />SUPPORT_YEAR: 29","count:   339<br />SUPPORT_YEAR: 30","count:   224<br />SUPPORT_YEAR: 31","count:   129<br />SUPPORT_YEAR: 32","count:   171<br />SUPPORT_YEAR: 33","count:   137<br />SUPPORT_YEAR: 34","count:   580<br />SUPPORT_YEAR: 35","count:   359<br />SUPPORT_YEAR: 36","count:  1206<br />SUPPORT_YEAR: 37","count:  2504<br />SUPPORT_YEAR: 38","count:  2574<br />SUPPORT_YEAR: 39","count:    96<br />SUPPORT_YEAR: 40","count:     9<br />SUPPORT_YEAR: 41","count:     7<br />SUPPORT_YEAR: 42","count:     6<br />SUPPORT_YEAR: 43","count:    10<br />SUPPORT_YEAR: 44","count:     1<br />SUPPORT_YEAR: 45","count:     2<br />SUPPORT_YEAR: 46","count:     1<br />SUPPORT_YEAR: 50","count:     1<br />SUPPORT_YEAR: 54"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(89,89,89,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":42.1685346616853,"r":7.30593607305936,"b":40.1826484018265,"l":54.7945205479452},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"<b> The median total cost corresponding to <br /> the number of support year in 2001 <\/b>","font":{"color":"rgba(0,0,0,1)","family":"","size":15.9402241594022},"x":0.9,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-2.145,57.145],"tickmode":"linear","ticktext":["0","20","40"],"tickvals":[0,20,40],"categoryorder":"array","categoryarray":["0","20","40"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"the number of support year","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f","dtick":10,"tick0":0},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-598.3,12564.3],"tickmode":"array","ticktext":["0","2500","5000","7500","10000","12500"],"tickvals":[0,2500,5000,7500,10000,12500],"categoryorder":"array","categoryarray":["0","2500","5000","7500","10000","12500"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"median cost (dollars)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"805b95ce35eff":{"x":{},"type":"bar"}},"cur_data":"805b95ce35eff","visdat":{"805b95ce35eff":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

Here is another interactive data visualization that shows frequency of
funding by state for 1999:

``` r
#funding_frequency(data2) this doesnt currently work for some reason...
```

## Authors

Benjamin Bruncati and Hongtong Lin
