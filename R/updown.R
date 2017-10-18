#' Vertical layout for matrix plots
#' @param ... list of matrix plots
#' @export
updown <- function(...)
{
  grob_list <- list(...)
  grid::grid.newpage()
  grid::grid.draw(do.call("rbind_gtable_max", lapply(grob_list, ggplot2::ggplotGrob)))
}
