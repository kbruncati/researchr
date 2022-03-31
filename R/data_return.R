#' data_return
#' @name data_return
#' @param x a numeric vector containing a positive integer (year)
#' @usage data_return(x)
#' @return A dataframe or multiple dataframes of funded NIH research opportunities relevant to the year input (x)
#'
#' #potential to pass a vector for Div III?
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
    nih <- read_html('https://exporter.nih.gov/ExPORTER_Catalog.aspx?sid=4&index=0')
    ahref <- nih %>%
      html_elements('a') %>%
      html_attr('href') #collect text in a href
    ahref_data <- data.frame(Col1=sapply(ahref, toString), stringsAsFactors = FALSE) #convert character to data frame to filter for desired links to files
    all_links <- ahref_data %>%
      filter(grepl('CSVs/final/RePORTER_PRJ_C', Col1)) #use dplyr to filter for XML .zip files, now collected under links
    selected_links <- all_links %>%
      filter(grepl(toString(x), Col1)) #filter for user input, x
    links_list <- as.list(selected_links$Col1)
    append_link <- "http://exporter.nih.gov/"
    for (i in 1:length(links_list)) {
      link4download <- paste(append_link, links_list[i], sep='')
      td <- tempdir() #create a temporary directory
      tf <- tempfile() #create a temporary file
      download.file(link4download, tf, quiet=TRUE, mode='wb')
      data2 <- data.table::fread(unzip(file.path(tf), exdir = td))
      data2 <- as.data.frame(data2)
      return(data2)
    }
  } else {
    print('Invalid input. Please enter a valid year between 1985 and 2020.')
  }
}





