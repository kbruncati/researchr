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
#' @import rio
#' @export

data_return <- function(x) {
  if (x >= 1985 & x < 2021){
    nih <- read_html('https://exporter.nih.gov/ExPORTER_Catalog.aspx?sid=4&index=0')
    ahref <- nih %>% html_elements('a') %>% html_attr('href') #collect text in a href
    ahref_data <- data.frame(Col1=sapply(ahref, toString), stringsAsFactors = FALSE) #convert character to data frame to filter for desired links to files
    all_links <- ahref_data %>% dplyr::filter(grepl('XMLData/final/', Col1)) #use dplyr to filter for XML .zip files, now collected under links
    selected_links <- all_links %>% dplyr::filter(grepl(toString(x), Col1)) #filter for user input, x
    links_list <- as.list(selected_links$Col1) #convert to list of zip files to loop through... gives me list with only one element??
    append_link <- "http://exporter.nih.gov/"
    for (i in 1:length(links_list)) {
      link4download <- paste(append_link, links_list[i], sep='')
      #Make a temporary file (tf) and a temporary folder (tdir)
      td <- tempdir()
      # create a temporary file
      tf <- tempfile(tmpdir=td, fileext=".zip")
      download.file(link4download, tf)
      file_names <- unzip(tf, list=TRUE) #list zip archive
      unzip(tf, exdir=td, overwrite=TRUE) #extract files from zip file
    }
    if (x == 2021){ #multiple files in zip case
      data_multiple <- lapply(file_names$Name, function(x) import(file.path(td, x)))
      view(data)
      unlink(td) #delete temp files/directories
    } else { #one file in zip case
      data <- import(file.path(td, file_names$Name[1]))
      view(data)
      unlink(td) #delete temp files/directories
    }
    } else {
      print('Invalid input. Please enter a valid year between 1985 and 2022.')
    }
}

options(timeout=1000000) # timeout deafult problem fixed
