#' data_return
#' @name data_return
#' @param x a numeric vector containing a positive integer (year) between 1985 - 2020
#' @usage data_return(x)
#' @return A dataframe of funded NIH research opportunities relevant to the year input (x)
#'
#' @import rvest
#' @import dplyr
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @import tibble
#' @importFrom utils View
#' @importFrom data.table fread
#' @export

data_return <- function(x) {
  if (x >= 1985 & x < 2021){
    nih <- read_html('https://exporter.nih.gov/ExPORTER_Catalog.aspx?sid=4&index=0') #link to scrape with rvest
    ahref <- nih %>%
      html_elements('a') %>%
      html_attr('href') #collect text in a href - where desired .zip file links are
    ahref_data <- data.frame(Col1=sapply(ahref, toString), stringsAsFactors = FALSE) #convert character to data frame to filter for desired links to files
    all_links <- ahref_data %>%
      filter(grepl('CSVs/final/RePORTER_PRJ_C', Col1)) #use dplyr to filter for XML .zip files, now collected under links
    selected_links <- all_links %>%
      filter(grepl(toString(x), Col1)) #filter for user input, x (year)
    links_list <- as.list(selected_links$Col1) #.zip file links in list for string concatenation
    append_link <- "http://exporter.nih.gov/" #beginning of link to paste() with links_list for download
    for (i in 1:length(links_list)) {
      link4download <- paste(append_link, links_list[i], sep='') #string concatenation
      td <- tempdir() #create a temporary directory
      tf <- tempfile() #create a temporary file
      download.file(link4download, tf, quiet=TRUE, mode='wb') #download file with temp file as dest file
      data2 <- data.table::fread(unzip(file.path(tf), exdir = td)) #unzip temp file, convert .csv
      data2 <- as.data.frame(data2) #make final product - data frame
      return(data2) #return requested data to the user for relevant year
    }
  } else { #user inputs an unavailable year or something entirely unrelated
    print('Invalid input. Please enter a valid year between 1985 and 2020.')
  }
}





