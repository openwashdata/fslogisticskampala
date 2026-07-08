# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx",
##                    "dplyr", "janitor", "lubridate"))
library(usethis)
library(fs)
library(here)
library(readr)
library(readxl)
library(openxlsx)
library(dplyr)

# Read data --------------------------------------------------------------------
# The .xls supplement stores each record as a single semicolon-separated
# string, so the sheet reads as one column. Keep a plain-text copy of it,
# then parse the semicolon-separated values with a period decimal mark.
readxl::read_excel("data-raw/sustainability-09-00194-s001.xls") |>
  write_csv("data-raw/sustainability-09-00194-s001.csv")

data_in <- read_delim("data-raw/sustainability-09-00194-s001.csv",
                      delim = ";") |>
  janitor::clean_names()

# Tidy data --------------------------------------------------------------------

trips <- data_in |>
  mutate(date = lubridate::dmy(date)) |>
  select(fid, numberplate = numberplat, date, time,
         lat = latitude, lon = longitude, plant)

trucks <- data_in |>
  select(numberplate = numberplat, volume) |>
  distinct()

# Export Data ------------------------------------------------------------------
usethis::use_data(trips, trucks, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

readr::write_csv(trips,
                 here::here("inst", "extdata", "trips.csv"))

openxlsx::write.xlsx(trips,
                     here::here("inst", "extdata", "trips.xlsx"))

readr::write_csv(trucks,
                 here::here("inst", "extdata", "trucks.csv"))

openxlsx::write.xlsx(trucks,
                     here::here("inst", "extdata", "trucks.xlsx"))
