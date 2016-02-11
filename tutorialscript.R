# install.packages(c("tidyr", "ggplot2",
#                    "GGally", "scales", "openair",
#                    "lubridate", "broom", "readr"))
library(tidyr)
library(ggplot2)

library(GGally)
library(scales)
library(openair)
library(lubridate)
library(broom)
library(readr)
library(magrittr)

data(mydata)

class(mydata)
names(mydata)

head(mydata$date)

class(mydata$date)

ggplot(data = mydata, aes(x=date, y = pm10)) + geom_line()

ggplot(data = mydata) + aes(x=date, y = pm10) + geom_line()

ggplot(data = mydata) + aes(x=date, y = pm10) %>% geom_line()

ggplot(data = mydata) + aes(x=date, y = pm10) + geom_line() + scale_y_log10()


p <- ggplot(data = mydata, aes(x=date, y = pm10)) + geom_line()
p + scale_y_log10()

ggplot(data = mydata, aes(x = pm10)) + geom_histogram(binwidth = 5)

max(mydata$pm10, na.rm = T)
help(max)

quantile(mydata$pm10,probs = 0.999, na.rm = T)

  ##Demonstration of what the pipe operator does
  10 %>% log(base = 100)

xmax <- quantile(mydata$pm10, probs = 0.999,
                 na.rm = T)

ggplot(data = mydata, aes(x = pm10)) +
  geom_histogram(binwidth = 5) +
  xlim(c(0, xmax))

