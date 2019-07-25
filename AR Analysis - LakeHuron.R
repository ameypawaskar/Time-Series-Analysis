LakeHuron
help("LakeHuron")
plot(LakeHuron)

data<- LakeHuron
plot(diff(data)) # Edit this line - Removing downword trend
data.diff <- diff(data)

acf(data.diff, main="ACF of diff.")
pacf(data.diff, main="PACF of diff.", lag.max = 50)
R=matrix(1,2,2) # matrix of dimension 2 by 2, with entries all 1's.

r=NULL
r[1:2]=acf(diff(LakeHuron), plot=F)$acf[2:3]
R[1,2]=r[1] # only diagonal entries are edited
R[2,1]=r[1] # only diagonal entries are edited
R
b=matrix(r,nrow=2,ncol=1)
b

# solve(R,b) solves Rx=b, and gives x=R^(-1)b vector
phi.hat=NULL
phi.hat=solve(R,b)[,1]
phi.hat

#variance estimation using Yule-Walker Estimator
c0=acf(data.diff, type='covariance', plot=F)$acf[1]
c0

var.hat=c0*(1-sum(phi.hat*r))
var.hat

# constant term in the model
phi0.hat=mean(data)*(1-sum(phi.hat))
phi0.hat

cat("Constant:", phi0.hat," Coeffcinets:", phi.hat, " and Variance:", var.hat, '\n')
