library(tidyverse)
library(ggplot2)
library(sjPlot)
library(broom)
library(performance)
library(yardstick)
library(kableExtra)

measles <- read.csv('DAProject15.csv')

# Calculate total proportion of susceptible children per year.
measles_proportions <- measles %>%
  summarise('Proportion' = sum(Y)/sum(N), .by = Year)

# Summary of proportions per year
measles_proportions %>%
  kable()

# Line graph of proportions by year.
ggplot(measles_proportions, aes(x= Year, y = Proportion)) +
  geom_line() +
  geom_vline(xintercept = 1998, col = "red") +
  geom_vline(xintercept = 2004, col = "blue") +
  labs(x = 'Year', y = 'Proportion of children susceptible to Measles', title = 'Proportion of children susceptible to Measles in Glasgow by year')
