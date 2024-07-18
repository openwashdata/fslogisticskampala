# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx"))
library(usethis)
library(fs)
library(here)
library(readr)
library(readxl)
library(openxlsx)
library(dplyr)

# Read data --------------------------------------------------------------------
readxl::read_excel("data-raw/sustainability-09-00194-s001.xls") |>
  write_csv("data-raw/sustainability-09-00194-s001.csv")

data_in <- read_csv2("data-raw/sustainability-09-00194-s001.csv") |>
  janitor::clean_names()

# codebook <- readxl::read_excel("data-raw/codebook.xlsx") |>
#  clean_names()

library(stringr)

add_period_after_two <- function(string) {
  str_c(str_sub(string, 1, 2), ".", str_sub(string, 3))
}


# Tidy data --------------------------------------------------------------------

trips <- data_in |>
  mutate(date = lubridate::dmy(date)) |>
  select(fid, numberplate = numberplat, date, time, lat = latitude, lon =longitude) |>
  mutate(lat= as.numeric(lat)) |>
  mutate(lon = as.character(lon)) |>
  mutate(lon = add_period_after_two(lon)) |>
  mutate(lon = as.numeric(lon))

trucks <- data_in |>
  select(numberplate = numberplat, volume, plant) |>
  unique()

# Export Data ------------------------------------------------------------------
usethis::use_data(trips, trucks, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

readr::write_csv(trips,
                 here::here("inst", "extdata", paste0("trips", ".csv")))

openxlsx::write.xlsx(trips,
                     here::here("inst", "extdata", paste0("trips", ".xlsx")))

readr::write_csv(trucks,
                 here::here("inst", "extdata", paste0("trucks", ".csv")))

openxlsx::write.xlsx(trucks,
                     here::here("inst", "extdata", paste0("trucks", ".xlsx")))
