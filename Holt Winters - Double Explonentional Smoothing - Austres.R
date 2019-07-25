austres
plot(austres)
m=HoltWinters(austres, gamma=FALSE)
m
level <- austres[c('1993','Qtr2')]
level <- 17661.5
beta <- 0.4062519
m$coefficients
levelN <- level + (beta*(17661.5-17627.1)) + ((1-beta)*(m$coefficients)
levelN
