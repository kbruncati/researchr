#' nih_research
#' @name nih_research
#' @param year a numeric vector containing a positive integer (year) between 1985 - 2021
#' @usage nih_research(year)
#' @return A dataframe of funded NIH research opportunities relevant to the year input (year)
#'
#' @import dplyr
#' @import utils
#' @importFrom readr read_csv
#' @export

nih_research <- function(year) {
  append_link <- "https://reporter.nih.gov/services/exporter/Download?fileId=" #beginning of link to paste() with links_list for download
  if (year >= 1985 & year < 2021){
    year_list <- 1985:2020 # make a list of years

    for (i in 1:length(year_list)) {
      fileld <- 2*which(year_list == year) # the pattern of urls
      link4download <- paste0(append_link, fileld) #string concatenation
      message(link4download)
      td <- tempdir() #create a temporary directory
      tf <- tempfile() #create a temporary file
      download.file(link4download, tf, quiet=TRUE, mode='wb') #download file with temp file as dest file
      path <- unzip(file.path(tf), exdir = td)
      message(path)
      data2 <- read_csv(path)
      return(data2) #return requested data to the user for relevant year
    }
  } else if (year == 2021){
    fileld <- 334  #the unique fileld for year 2021
    link4download <- paste0(append_link, fileld) #string concatenation
    message(link4download)
    td <- tempdir() #create a temporary directory
    tf <- tempfile() #create a temporary file
    download.file(link4download, tf, quiet=TRUE, mode='wb') #download file with temp file as dest file
    path <- unzip(file.path(tf), exdir = td)
    message(path)
    data2 <- read_csv(path)
    return(data2) #return requested data to the user for relevant year
  } else { #user inputs an unavailable year or something entirely unrelated
    stop('Invalid input. Please enter a valid year between 1985 and 2021.')
  }

}




