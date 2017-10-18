#' Make charts with matrices
#'
#' Given a named matrix or a data frame, this function will return a ggplot object that
#' represents a tile chart with the values of the matrix. The library gives the user the
#' choice to change the color , title and subtitle and the legend position in the plot.
#'
#'
#'
#' If a data frame is used, the column will be taken as the column of the matrix and the rows
#' will be taken as the rows of the matrix and the function will plot accordingly.
#'
#' A matrix input is also allowed.
#'
#' Chart title and x-axis and y-axis labels are optional.
#'
#'
#'
#' plotmatrix is inspired by hrbrmstr's waffle package (@hrbrmstr)
#'
#' @param matrix named data.frame or matrix
#' @param header header of the Plot
#' @param subtitle subtitle of the Plot
#' @param low_color is the color assigned to the lowest value
#' @param high_color is the color assigned to the highest value
#' @param legend_position position of legend
#' @param xlabel x label for the chart
#' @param ylabel ylabel for the chart
#' @param height height of each cell
#' @param width width of each cell
#' @param color color of the cell borders
#' @param title_size size of the title text
#' @param subtitle_size size of the subtitle text
#' @examples
#' data_matrix  <- data.frame(a=c(1,0,0),b=c(0,1,0),c=c(0,0,1))
#' plotmatrix(data_matrix)
#'
#' # Plotting matrix with high and low color
#' plotmatrix(data_matrix,low_color="#f6efb9",high_color="#d6efd9")
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'






#'@export
plotmatrix <- function(matrix,title="",subtitle="",low_color="#132B43",high_color="#56B1F7",legend_position="top",xlabel="",ylabel="",title_size=8,subtitle_size=7,height=0.9,width=0.9,color="black")
{
  options(warn = -1)

  # create a theme for the plot
  plotTheme <- function(){ggplot2::theme(axis.ticks = element_blank(),
                     panel.grid.major = element_blank(),
                     axis.text.x = element_blank(),
                     axis.text.y = element_blank(),
                     axis.title=element_blank(),
                     legend.position = legend_position,
                     plot.title = element_text(hjust=0.5,size=title_size,face="bold"),
                     plot.subtitle = element_text(face="italic",size=subtitle_size))}



  if(class(matrix)=="matrix"| class(matrix)=="data.frame"){

    mat <- as.matrix(matrix)
    rownames(mat) <- NULL
    colnames(mat) <- NULL
    colnames(mat) <- 1:ncol(mat)
    #print(mat)
    #change the matrix orientation for geom_tile()
    for(i in 1:ncol(mat)){
      mat[,i] <- rev(mat[,i])
    }
    # change the matrix orientation for geom_tile()

    #change to data frame

    df_mat <- as.data.frame(mat)
    # create the ggplot object
    #print(head(df_mat))

    df_mat_intermediate <- df_mat %>% dplyr::mutate(row_names=rownames(df_mat)) %>% tidyr::gather(type,value,1:ncol(df_mat)) %>% dplyr::arrange(desc(row_names))
    #print(head(df_mat_intermediate))

    p <- df_mat_intermediate %>%
      ggplot2::ggplot(aes(x=reorder(type,as.numeric(type)),y=reorder(row_names,as.numeric(row_names)),fill=value))+ggplot2::geom_tile(height=height,width=width,color=color,size=0.1)+
      ggplot2::scale_fill_continuous(high = high_color,low=low_color)+labs(title=title,subtitle=subtitle,x=xlabel,y=ylabel)



  }else{

    cat("\n")
    stop("Please use a dataframe/matrix for input")

  }
  # remove variables from environment
  rm(df_mat)
  rm(mat)
  rm(matrix)
  #return ggplot object


  return(p+plotTheme())
}




