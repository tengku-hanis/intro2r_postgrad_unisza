# Basic plots
# Author: Tengku Muhd Hanis Mokhtar
# Date: 12-11-2026

# Packages ----------------------------------------------------------------

library(tidyverse)


# Data --------------------------------------------------------------------

glimpse(iris)


# Plot in Base R ----------------------------------------------------------

# Read this part on your own 
# Use ? or any LLM to understand the code

## 1) Histogram ----
hist(iris$Sepal.Length)

## 2) Bar plot ----
dat <- 
  iris %>% 
  group_by(Species) %>% 
  summarise(mean_Sepal.Length = mean(Sepal.Length))

barplot(height = dat$mean_Sepal.Length, names = dat$Species)

## 3) Box plot ----
bx_plt <- boxplot(iris$Sepal.Width)
bx_plt$out

boxplot.stats(iris$Sepal.Width)

## 4) Scatter plot ----
plot(iris$Sepal.Length, iris$Sepal.Width)


# ggplot2 -----------------------------------------------------------------

## 1) histogram ----
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram()

# Advanced histogram
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(alpha = 0.6) +
  facet_grid(rows = vars(Species)) +
  theme_bw() +
  labs(title = "Histogram of Sepal Length by Species", subtitle = "Data: iris dataset")
  
ggplot(data = iris, aes(x = Sepal.Length, fill = Species, color = Species)) +
  geom_histogram(alpha = 0.6) +
  theme_bw()

## 2) Bar plot ----
ggplot(data = iris, aes(x = Species)) +
    geom_bar()

## 3) Box plot ----
bx_ggplot <- 
    ggplot(data = iris, aes(y = Sepal.Width)) +
    geom_boxplot()
bx_ggplot

boxplot.stats(iris$Sepal.Width)

# Advanced box plot
ggplot(data = iris, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot()

ggplot(data = iris, aes(y = Sepal.Width)) +
  geom_boxplot() +
  facet_grid(cols = vars(Species))

## 4) Scatter plot ----
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() 

# Advanced scatter plot
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  geom_smooth() +
  theme_bw()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_smooth() +
  facet_grid(rows = vars(Species)) +
  theme_bw()


# Save a plot ------------------------------------------------------------

# Create a plot
hist_plot <- 
  ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram()
hist_plot

# Save the plot
jpeg("histogram plot.jpeg", width = 480, height = 480, quality = 50)
hist_plot
dev.off()

#png(), tiff()