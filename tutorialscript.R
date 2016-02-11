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

ggplot(data = mydata, aes(x=date, y = pm10)) + geom_line()

ggplot(data = mydata) + aes(x=date, y = pm10) + geom_line()

ggplot(data = mydata) + aes(x=date, y = pm10) + geom_line() + scale_y_log10()
