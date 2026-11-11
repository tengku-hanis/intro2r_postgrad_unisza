# Intro to R
# Author: Tengku Muhd Hanis Mokhtar
# Date: 12-11-2026


# Getting help in R ------------------------------------------------------

?mean
help(mean)


# Install necessary package -----------------------------------------------

# Install some packages before we continue
pckg <- c("installr", "tidyverse", "naniar", "summarytools", "skimr", "gtsummary", "rmarkdown")
install.packages(pckg, dependencies = TRUE)


# Update R ----------------------------------------------------------------

installr::updateR() #only for R dekstop, not for Posit Cloud