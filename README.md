# plotmatrix
Simple R library to plot matrices

This is a student project created for plotting matrices. This package makes use of the `ggplot2` R package.
## Installation

To install, please run ```devtools::install_github('adhok/plotmatrix')```

## Example

```data_matrix  <- data.frame(a=c(1,0,0),b=c(0,1,0),c=c(0,0,1))```

```plotmatrix(data_matrix,legend_position="none")```


