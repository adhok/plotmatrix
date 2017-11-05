## ----eval=F--------------------------------------------------------------
#  if(!require(devtools)){install.packages('devtools')}
#  if(!require(plotmatrix)){devtools::install_github('adhok/plotmatrix')}

## ----fig.width=5,fig.height=5--------------------------------------------
set.seed(1000)
matrix_3_3 <- data.frame(a=rnorm(3),b=rnorm(3),c=rnorm(3))
print(matrix_3_3)
plotmatrix::plotmatrix(matrix_3_3)


## ----fig.width=5,fig.height=5--------------------------------------------

matrix_5_10<- data.frame(a=rnorm(10),b=rnorm(10),c=rnorm(10),d=rnorm(10),e=rnorm(10))

print(matrix_5_10)
plotmatrix::plotmatrix(matrix_5_10,text_include=TRUE,legend_position = "none")

