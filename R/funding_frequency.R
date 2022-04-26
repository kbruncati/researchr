#' funding_frequency
#'
#' @name funding_frequency
#' @param data_frame data of NIH research opportunities for year selected by user
#' @usage funding_frequency(data_frame)
#' @return an interactive graph of funding frequency by state
#'
#' @import dplyr
#' @import utils
#' @import ggplot2
#' @import plotly
#' @import sf
#' @importFrom stats frequency
#' @export

funding_frequency <- function(data_frame){
  wd <- getwd() # get the working directory for this R file
  states <- sf::read_sf(paste0(wd, "/data/cb_2020_us_state_20m.shp")) # get the path name of the map file

  data4 <- table(data_frame$ORG_STATE)
  # only select the state names from the nih website, and count the frequency of state names

  data4 <- as.data.frame(data4) # make the table as the data frame
  state.ex <- c("AB","AS","BC", "GU", "MB", "MH", "MP", "NS", "PW", "QC","ON",
                "QC", "VI", "PQ") # create a list of state names that are not in the census
  states.final <- data4[!grepl(paste(state.ex, collapse='|'), data4$Var1),] # remove those nonexistent state names
  states.final <- states.final[-1,] # remove the first row that shows the total frequency

  states.map <- states[order(states$STUSPS), ] %>%
    sf::st_zm() %>%
    mutate(frequency = states.final$Freq) # create a map filled with funding frequency
    #currently an error at line 30
  g <- ggplot(states.map, label = states.final) +
    geom_sf(aes(fill=frequency)) + # plot out the map filled with funding frequency
    scale_fill_distiller("the number of times \neach state got funded", palette="Spectral") +
    ggtitle(label = "Funding Frequency by State") +
    coord_sf(xlim = c(-170, -50), ylim = c(10,70), expand = FALSE) + # change the map size and view
    theme(plot.title = element_text(face = "bold"),
          legend.title = element_text(size = 8), # change the font size of the legend title
          legend.text = element_text(size = 6)) # change the font size of the numbers in the legend

  fund.freq.map <- plotly::ggplotly(g) %>%
    plotly::layout(title = list(text = paste0('Funding Frequency by State',
                                              '<br>',
                                              '<sup>',
                                              'Select a state to view the funding frequency',
                                              '</sup>'))) # turn the graph into an interactive one

  return(fund.freq.map)

}

