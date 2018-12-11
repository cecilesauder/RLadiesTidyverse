library(magick)
imgs_urls <- c(
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/ggplot2.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/tibble.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/tidyr.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/readr.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/readxl.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/purrr.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/dplyr.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/stringr.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/forcats.png?raw=true",
  "https://github.com/rstudio/hex-stickers/blob/master/PNG/pipe.png?raw=true"
  )

imgs <- image_read(imgs_urls)

bande <- image_append(image_scale(imgs, "x100"))

image_write(bande, path = "img/tidyband.png", format = "png")
