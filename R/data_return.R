#' @param x a numeric vector containing a positive value (year)
#' @return A dataframe or multiple dataframes of funded NIH research opportunities relevant to the year input (x)
#' @examples
#' data_return(1985)
#'
#' #potential to pass a vector for Div III?
#'
#' @import rvest
#' @import dplyr
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @import XML
#' @import xml2
#' @export

data_return <- function(x) {
  nih <- read_html('https://exporter.nih.gov/ExPORTER_Catalog.aspx?sid=4&index=0')
  x <- 2021
  x <- toString(x)
  ahref <- nih %>% html_elements('a') %>% html_attr('href') #collect text in a href
  ahref_data <- data.frame(Col1=sapply(ahref, toString), stringsAsFactors = FALSE) #convert character to data frame to filter for desired links to files
  all_links <- ahref_data %>% dplyr::filter(grepl('XMLData/final/', Col1)) #use dplyr to filter for XML .zip files, now collected under links
  selected_links <- all_links %>% dplyr::filter(grepl(x, Col1)) #filter for user input, x
  links_list <- as.list(selected_links$Col1) #convert to list of zip files to loop through... gives me list with only one element??
  append_link <- "http://exporter.nih.gov/"
  for (i in 1:length(links_list)) {
    link4download <- paste(append_link, links_list[i], sep='')
    #Make a temporary file (tf) and a temporary folder (tdir)
    tf <- tempfile(tmpdir = tdir <- tempdir())
    download.file(link4download, tf)
    unzip(tf)
  } #need a counter from 01 to 53 for 2021 only
  if (x == 2021){
    for (i in 2:9){ #save for later... could be grouped into one file in the near future
      name <- paste('dataset', toString(i))
      eval(name) <- xmlToDataFrame(paste('RePORTER_PRJ_X_FY2021_00', toString(i) , '.xml', sep=''))} #how to have name regenerate and get multiple datasets out of this line??
  }
  if (x ==2022){
    name <- xmlToDataFrame(paste('RePORTER_PRJ_X_FY', toString(x), '_002.xml', sep=''))
  }
  if (x >= 1985 & x <= 2020){
    name <- xmlToDataFrame(paste('RePORTER_PRJ_X_FY', toString(x), '.xml', sep=''))
  } else {
    print('Invalid input. Please enter a valid year between 1985 and 2022.')
  }
  #unlink(tf)... do I need this line? Keep for now?
}
