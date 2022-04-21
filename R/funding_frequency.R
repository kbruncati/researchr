#' funding_frequency
#'
#' @name funding_frequency
#' @param data_frame an nih exporter data frame extracted by the nih_research function
#' @usage funding_frequency(data_frame)
#' @return a graph of funding frequency by state
#'
#' @import dplyr
#' @import utils
#' @import ggplot2
#' @import plotly
#' @import sf
#' @importFrom stats frequency
#' @export

funding_frequency <- function(data_frame){
  wd <- getwd()
  states <- read_sf(paste0(wd, "/cb_2020_us_state_20m/cb_2020_us_state_20m.shp"))

  data4 <- table(data_frame$ORG_STATE)
  data4 <- as.data.frame(data4)
  state.ex <- c("AB","AS","BC", "GU", "MB", "MH", "MP", "NS", "PW", "QC","ON",
                "QC", "VI", "PQ")
  states.final <- data4[!grepl(paste(state.ex, collapse='|'), data4$Var1),]


  states.map <- states[order(states$STUSPS), ] %>%
    st_zm() %>%
    mutate(frequency = states.final$Freq)


  g <- ggplot(states.map) +
    geom_sf(aes(fill=frequency)) +
    scale_fill_distiller("the number of times each state got funded", palette="Spectral") +
    ggtitle("Funding Frequency by State")


  pp <- plotly::ggplotly(g)

  return(pp)

    #library(leaflet)
}
