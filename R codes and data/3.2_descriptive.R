# Descriptive statistics
# Author: Tengku Muhd Hanis Mokhtar
# Date: 12-11-2026


# Packages ----------------------------------------------------------------

library(tidyverse)
library(summarytools)
library(skimr)


# Data --------------------------------------------------------------------

glimpse(iris)


# Summary -----------------------------------------------------------------

summary(iris)

skim(iris)


# Numerical ---------------------------------------------------------------

# 1. General
descr(iris)

# 2. For one variable 
mean(iris$Sepal.Length, na.rm = T)

iris$Sepal.Length %>% 
  mean(na.rm = T)

iris %>% 
  # na.omit() %>% 
  summarise(mean = mean(Sepal.Length), sd = sd(Sepal.Length))

# 3. For > 1 variables
iris %>% 
  summarise(median_Sepal.Length = median(Sepal.Length), iqr_Sepal.Length = IQR(Sepal.Length), 
            mean_Sepal.Width = mean(Sepal.Width), sd_Sepal.Width = sd(Sepal.Width))

# 4. Based on other grouping variable 
iris %>% 
  group_by(Species) %>% 
  summarise(mean = mean(Sepal.Length), sd = sd(Sepal.Length))


# Categorical -------------------------------------------------------------

# 1. General
freq(iris$Species)

# 2. Based on other variables
iris %>% 
  filter(Sepal.Length > 6) %>% 
  freq(Species)

iris %>% 
  filter(Sepal.Length > 6) %>% 
  count(Species)


# gtsummary --------------------------------------------------------------

library(gtsummary)

# Basic table
tbl_summary(iris)

# Edit a little bit
iris %>%
  tbl_summary(
    # Change continuous variables to mean (SD)
    statistic = list(all_continuous() ~ "{mean} ({sd})")
  ) %>%
  # Update the column header to use lowercase n
  modify_header(all_stat_cols() ~ "**n = {N}**")
