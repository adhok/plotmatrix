#' Side by Side layouts for matrix plots
#' @param ... One or more matrix plots
#'




#' @export
side <- function(...){

  grob_list <- list(...)
  grid.newpage()
  grid.draw(do.call("cbind_gtable_max", lapply(grob_list, ggplotGrob)))
}
