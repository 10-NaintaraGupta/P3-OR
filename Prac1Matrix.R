#Solve following assignment problem represented in following matrix using R programming
# Assignment Problem
# Job1 Job2 Job3
#w1 15 10 9
#w2 9 15 10
#w3 10 12 8
#import lpsolve package
library(lpSolve)
#Set assignment costs matrix
costs <- matrix(c(15,10,9,
                  9,15,10,
                  10,12,8), nrow = 3,byrow = TRUE)
# print assignment n costs matrix
costs
# Final value (z)
lp.assign(costs)
# Variables final values
lp.assign(costs)$solution

