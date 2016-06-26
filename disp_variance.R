library(jpeg)

home <- "C:/Users/ibshi/Desktop/insight/project"
setwd(home)
numimages <- 2000 # 1000 cats, then 1000 dogs

# will need to do something with this if svdtot not in global environment
# svdtot_u_temp <- read.csv("svdtot_u.csv",header=FALSE)
# svdtot_temp <- read.csv("svdtot_v.csv",header=FALSE)
# svdtot_d_temp <- read.csv("svdtot_d.csv",header=FALSE)

# look at eigenvalues

numdim <- 50

while (numdim > 0) {
  cat ("Enter numdim, 0 to exit")
  line <- readline()
  numdim <- as.integer(line)
  if (numdim <= 0) {break}
  totvar <- 0.0
  for (i in 1:numdim) {
    totvar <- totvar + svdtot$d[i]^2/sum(svdtot$d^2)
  } 
#  par(mfrow = c(1, 2),mar=c(0,2,0,1))
  par(mfrow = c(1, 2))
  plot(svdtot$d, xlab = "Column", ylab = "Singular value", pch = 19, xlim = c(0,numdim))
  plot(svdtot$d^2/sum(svdtot$d^2), xlab = "Column", ylab = "Prop. of variance explained",
     pch = 19, xlim = c(0,numdim))
  output <- paste ("Number of components= ",numdim,"  total variance explained =",totvar)
  print(output)
#  mtext(output, side = 1, outer=TRUE)
  cat ("Press [enter] to continue")
  line <- readline()
  dev.off()
}