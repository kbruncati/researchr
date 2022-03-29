\name{data_return}
\alias{data_return}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
data_return(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x) 
{
    if (x >= 1985 & x < 2021) {
        nih <- read_html("https://exporter.nih.gov/ExPORTER_Catalog.aspx?sid=4&index=0")
        ahref <- nih \%>\% html_elements("a") \%>\% html_attr("href")
        ahref_data <- data.frame(Col1 = sapply(ahref, toString), 
            stringsAsFactors = FALSE)
        all_links <- ahref_data \%>\% dplyr::filter(grepl("XMLData/final/", 
            Col1))
        selected_links <- all_links \%>\% dplyr::filter(grepl(toString(x), 
            Col1))
        links_list <- as.list(selected_links$Col1)
        append_link <- "http://exporter.nih.gov/"
        for (i in 1:length(links_list)) {
            link4download <- paste(append_link, links_list[i], 
                sep = "")
            tf <- tempfile(tmpdir = tdir <- tempdir())
            download.file(link4download, tf)
            unzip(tf)
        }
    }
    else {
        print("Invalid input. Please enter a valid year between 1985 and 2022.")
    }
    if (x == 2022) {
        name <- xmlToDataFrame(paste("RePORTER_PRJ_X_FY", toString(x), 
            "_002.xml", sep = ""))
    }
    if (x >= 1985 & x < 2020) {
        name <- xmlToDataFrame(paste("RePORTER_PRJ_X_FY", toString(x), 
            ".xml", sep = ""))
    }
    if (x == 2020) {
        name <- xmlToDataFrame(paste("RePORTER_PRJ_X_FY", toString(x), 
            "_new.xml", sep = ""))
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
