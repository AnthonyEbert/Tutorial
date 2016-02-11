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

ggplot(data = mydata, aes(x = date, y = pm10)) + geom_line()

ggplot(data = mydata) + aes(x = date, y = pm10) + geom_line()

ggplot(data = mydata) + aes(x = date, y = pm10) %>% geom_line()

ggplot(data = mydata) + aes(x = date, y = pm10) + geom_line() + scale_y_log10()


p <- ggplot(data = mydata, aes(x = date, y = pm10)) + geom_line()
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

ggplot(data = mydata, aes(x = wd, y = pm10)) + geom_point() + scale_y_log10()

mydata.daily <- timeAverage(mydata, avg.time = "day", vector.ws = T)

ggplot(data = mydata.daily, aes(x = wd,
                                y = pm10)) + geom_point(alpha = 0.25,
                                                        position = position_jitter(w = 2.5,
                                                                                   h = 0)) + scale_y_log10()

ggplot(data = mydata.daily, aes(x = wd,
                                y = pm10)) + geom_point(alpha = 0.25,
                                                        position = position_jitter(w = 2.5,
                                                                                   h = 0)) + scale_y_log10() +
  annotation_logticks(sides = "lr") +
  geom_smooth() + xlab("Wind direction (degrees)")

mydata.daily$year <- year(mydata.daily$date)

ggplot(data = mydata.daily, aes(x = date,
                                y = pm10)) + geom_line() + scale_y_log10() +
  facet_wrap( ~ year) + annotation_logticks(sides = "l")

ggplot(data = mydata.daily, aes(x = date,
                                y = pm10)) + geom_line() + scale_y_log10() +
  annotation_logticks(sides = "l") +
  facet_wrap( ~ year, scales = "free_x",
              ncol = 4) + scale_x_datetime(breaks = date_breaks("3 months"),
                                           labels = date_format("%b")) +
  theme(axis.text.x = element_text(angle = 90))

mydata.daily$month <- factor(month(mydata.daily$date))
ggplot(data = mydata.daily, aes(x = month,
                                y = pm10)) + geom_boxplot() +
  annotation_logticks(sides = "l") +
  scale_y_log10() + facet_wrap( ~ year,
                                ncol = 2)

z <- 2+2
