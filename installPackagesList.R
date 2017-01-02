#package installation script
packages <- c(  "plotly"
                , "ggplot2"
                , "shiny"
                , "readr"
                , "dplyr"
                , "readxl"
                , "ckanr"       # open db scraping
                , "knitr" 
                , "Hmisc"
                , "ggthemes"
                , "forecast"
                , "lubridate"
                , "reshape"
								, "ggfortify"   # unify stat plotting e.g. time series
								, "tm"          # text mining
								, "wordcloud" 
								, "devtools"    # install from git
								, "googleVis"   #gapminder
								, "xlsx"
)

install.packages(packages)

# problem with gtk+ with rattle install... solution here:
#install.packages("RGtk2", dependencies = T, type = 'mac.binary.mavericks')