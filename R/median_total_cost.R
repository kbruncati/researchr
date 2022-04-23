#' median_total_cost
#'
#' @name median_total_cost
#' @param your_dataFrame an nih exporter data frame extracted by the nih_research function
#' @usage median_total_cost(your_dataFrame)
#' @return An interactive bar graph: the median total cost v.s the number of support year
#'
#' @import dplyr
#' @import utils
#' @import ggplot2
#' @import plotly
#' @importFrom stats median
#' @export

median_total_cost <- function(your_dataFrame){
  data3 <- your_dataFrame %>%
    select(c(SUPPORT_YEAR, TOTAL_COST)) # filter the data frame

  data3.graph <- ggplot2::ggplot(data = data3, aes(x = SUPPORT_YEAR), y = median(TOTAL_COST)) +
    geom_bar() +
    xlab("support years") +
    ylab("median cost (dollars)") +
    ggplot2::ggtitle("Median total cost v. support years")
    #theme(plot.title = element_text(hjust = 0.5)) #use this to somehow move title? so far right
  # plot out the bar graphs

  data3.graph <- data3.graph + theme(
    plot.title = element_text(color = "black", size = 12, face = "bold", hjust = 0.9))
  # change the theme of the title

  data3.interactiveGraph <- plotly::ggplotly(data3.graph) # make the graph more interactive

  data3.interactiveGraph%>%
    plotly::layout(
      xaxis = list(
        dtick = 10,
        tick0 = 0,
        tickmode = "linear")) # modify the ticks
}
