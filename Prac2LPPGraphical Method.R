#Find a geometrical interpretation and solution as well for the following Lp problem
#Max z=3x1 + 5x2
#subject to constraints:
#x1+2x2<=2000
#x1+x2<=1500
#x2<=600
#x1,x2>=0
#Load lpsolve
require(lpSolve)
##Set the coefficients of the decision variables -> c of objective function
c <- c(3,5)
# create constraint matrix b
A <- matrix(c(1,2,
              1,1,
              0,1), nrow=3, byrow=TRUE)
# Right hand side for the constraints
B <- c(2000,1500,600)
#Direction of the constraints
constraints_direction <- c("<=","<=","<=")
#Create empty example plot
plot.new()
plot.window(xlim=c(0,2000), ylim=c(0,2000))
axis(1)
axis(2)
#Create empty example plot
plot.new()
plot.window(xlim=c(0,2000), ylim=c(0,2000))
axis(1)
axis(2)
title(main="LPP using Graphical method")
title(xlab="X axis")
title(ylab="Y axis")
box()
#Draw one line
segments(x0=2000, y0=0, x1=0, y1=1000, col="green")
segments(x0=1500, y0=0, x1=0, y1=1500, col="green")
segments(x0=0, y0=0, x1=600, y1=0, col="green")
#Find the optimal solution
optimum <- lp(direction="max",
              objective.in = c,
              const.mat = A,
              const.dir = constraints_direction,
              const.rhs = B,
              all.int = T)
#Print status: 0 = success, 2 = no feasible solution
print(optimum$status)
#Display the optimum values for x1 and x2
best_sol <- optimum$solution
names(best_sol) <- c("x1","x2")
print(best_sol)
#Check the value of objective function at optimal point
print(paste("Total cost:", optimum$objval, sep=""))

