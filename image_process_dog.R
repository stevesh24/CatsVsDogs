# set home directory
home <- "C:/Users/ibshi/Desktop/insight/project"
setwd(home)
train <- "C:/Users/ibshi/Desktop/insight/project/train/"
images <- "C:/Users/ibshi/Desktop/insight/project/images/"

xsize_min <- 300
ysize_min <- 300
numimages <- 1000

maximages <- 12500
library(jpeg)

# do cats
ct <- 0
fileno <- 1
while (ct < numimages && fileno < maximages) {
  infile <- paste(train,"dog.",as.character(fileno),".jpg",sep="")
  dog <- readJPEG(infile)
  t <- dim(dog)
  if (t[1] < xsize_min || t[2] < ysize_min) {
    fileno <- fileno + 1
    next
  } 
  if (t[1] > t[2]) {
    begx <- as.integer(t[1]/2) - as.integer(t[2]/2)
    endx <- begx + t[2]    
    dog1 <- dog[begx:endx,,]
  }
  if (t[2] > t[1]) {
    begy <- as.integer(t[2]/2) - as.integer(t[1]/2)
    endy <- begy + t[1]    
    dog1 <- dog[,begy:endy,]
  }
  if (t[1] == t[2]) {
    dog1 <- dog
  }
  outfile <- paste(images,"dog.",as.character(ct),"sq.jpg",sep="")
  jpeg(outfile,height=ysize_min,width=xsize_min)
  par(mar=c(0,0,0,0))
  plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
  rasterImage(dog1,0,0,1,1)
  dev.off()
  ct <- ct + 1
  fileno <- fileno + 1
}
