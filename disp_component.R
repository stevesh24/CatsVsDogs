library(jpeg)

home <- "C:/Users/ibshi/Desktop/insight/project"
setwd(home)
numimages <- 2000 # 1000 cats, then 1000 dogs
xsize <- 279
ysize <- 279

component <- 1

while (component > 0) {
  cat ("Enter component number, 0 to exit")
  line <- readline()
  component <- as.integer(line)
  if (component <= 0) {break}
  component_vector <- svdtot$v[,component]
  disp <- matrix(component_vector, nrow = xsize, ncol = ysize)
  dispJPEG <- writeJPEG(disp)
  image(disp, col = gray.colors(256))
  cat ("Press [enter] to continue")
  line <- readline()
}
