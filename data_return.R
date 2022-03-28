library(rvest)
library(dplyr)
#' @export

data_return <- function(x) {
  #Read the HTML page via rvest to start
  nih <- read_html('https://exporter.nih.gov/ExPORTER_Catalog.aspx?sid=4&index=0')

  ahref <- nih %>% html_elements('a') %>% html_attr('href') #collect text in a href
  ahref_data <- data.frame(Col1=sapply(ahref, toString), stringsAsFactors = FALSE) #convert character to data frame to filter for desired links to files
  links <- ahref_data %>% filter(grepl('XMLData/final/', Col1)) #use dplyr to filter for XML .zip files, now collected under links
  #Take scraped file links and actually make them tangible
  links_list <- as.list(links$Col1) #convert to list of zip files to loop through... gives me list with only one element??
  append_link <- "http://exporter.nih.gov/"
  vec <- cbind(append_link, links_list[1])
  link4download <- paste(append_link, links_list[1], sep='')
  #Make a temporary file (tf) and a temporary folder (tdir)
  tf <- tempfile(tmpdir = tdir <- tempdir())
  download.file(link4download, tf)
  unzip(tf)
  selected_data <- xmlToDataFrame('RePORTER_PRJ_X_FY2022_002.xml') #new problem area... need to better understand why we need the tempfile/tempdir
  #unlink(tf)... do I need this line? Keep for now?
}
