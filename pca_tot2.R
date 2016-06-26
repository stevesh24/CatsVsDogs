library(jpeg)

home <- "C:/Users/ibshi/Desktop/insight/project"
setwd(home)
images <- "C:/Users/ibshi/Desktop/insight/project/images/"

numimages <- 1000
#numimages <- 500
trim <- 11
endct <- numimages - 1
xsize <- 300
ysize <- 300
xend <- xsize-trim; yend <- ysize - trim

for (ct in 0:endct) {
  infile <- paste(images,"cat.",as.character(ct),"sq.jpg",sep="")
  cat_untrim <- readJPEG(infile)
  cat_trim <- cat_untrim[trim:xend,trim:yend,]
  catbw <- apply(cat_trim,c(1,2),mean)
  catbw_vector <- as.vector(catbw)
  if (ct == 0) {
    cat_data <- catbw_vector}
  else {
    cat_data <- rbind(cat_data,catbw_vector)
  }
}


for (ct in 0:endct) {
  infile <- paste(images,"dog.",as.character(ct),"sq.jpg",sep="")
  dog_untrim <- readJPEG(infile)
  dog_trim <- dog_untrim[trim:xend,trim:yend,]
  dogbw <- apply(dog_trim,c(1,2),mean)
  dogbw_vector <- as.vector(dogbw)
  if (ct == 0) {
    dog_data <- dogbw_vector}
  else {
    dog_data <- rbind(dog_data,dogbw_vector)
  }
}

tot_data <- rbind(cat_data,dog_data)
rm(cat_data)
rm(dog_data)

svdtot <- svd(tot_data)
rm(tot_data)

write(svdtot$u,file = "svdtot_u.csv")
write(svdtot$d,file = "svdtot_d.csv")
write(svdtot$v,file = "svdtot_v.csv")
