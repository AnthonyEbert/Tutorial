install.packages(c("tidyr", "ggplot2",
                   "GGally", "scales", "openair",
                   "lubridate", "broom", "readr"))
library(tidyr)
library(ggplot2)

library(GGally)
library(scales)
library(openair)
library(lubridate)
library(broom)
library(readr)

data(mydata)

class(mydata)
names(mydata)

head(mydata$date)

class(mydata$date)

