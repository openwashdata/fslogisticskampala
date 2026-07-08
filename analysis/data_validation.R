# Description ------------------------------------------------------------------
# Data validation checks for the trips and trucks datasets, written during the
# openwashdata package review (issue #7). Each check prints its result;
# stopifnot() calls fail loudly if a guarantee is violated.
# Run from the package root after regenerating the data with
# data-raw/data_processing.R.

library(dplyr)

load("data/trips.rda")
load("data/trucks.rda")

# Missing values ----------------------------------------------------------------
# All missing values are coded as NA; both datasets are complete.
cat("Missing values per variable (trips):\n")
print(colSums(is.na(trips)))
cat("Missing values per variable (trucks):\n")
print(colSums(is.na(trucks)))
stopifnot(sum(is.na(trips)) == 0, sum(is.na(trucks)) == 0)

# Uniqueness and referential integrity -------------------------------------------
# fid identifies a trips record; numberplate identifies a trucks record; every
# plate in trips has a volume in trucks.
stopifnot(
  !anyDuplicated(trips$fid),
  !anyDuplicated(trucks$numberplate),
  all(trips$numberplate %in% trucks$numberplate)
)

# Variable classes ----------------------------------------------------------------
stopifnot(
  is.integer(trips$fid),
  is.character(trips$numberplate),
  inherits(trips$date, "Date"),
  inherits(trips$time, "hms"),
  is.numeric(trips$lat),
  is.numeric(trips$lon),
  is.character(trips$plant),
  is.numeric(trucks$volume)
)

# Value ranges --------------------------------------------------------------------
# Coordinates lie within Uganda; dates within the documented collection period;
# volumes within plausible vacuum truck sizes (decimal corruption in the old
# processing pipeline once inflated 2.5 to 25, 6.5 to 65, 7.2 to 72).
stopifnot(
  all(trips$lat > -1.5 & trips$lat < 4.5),
  all(trips$lon > 29.5 & trips$lon < 35.5),
  all(trips$date >= as.Date("2015-03-30") & trips$date <= as.Date("2015-06-25")),
  all(trucks$volume >= 2 & trucks$volume <= 12)
)

# Categorical variables -------------------------------------------------------------
# plant has two clean levels; numberplates follow Ugandan formats (civilian
# "UXX 000X", government "LG 0000-00", and one short plate "UCS 701").
cat("Treatment plant frequencies:\n")
print(count(trips, plant))
stopifnot(setequal(unique(trips$plant), c("Bugolobi", "Lubigi")))
stopifnot(!any(grepl("^AUS", trips$numberplate)))

# Encoding ---------------------------------------------------------------------------
stopifnot(
  all(stringi::stri_enc_isutf8(trips$numberplate)),
  all(stringi::stri_enc_isutf8(trips$plant)),
  all(stringi::stri_enc_isutf8(trucks$numberplate))
)

cat("All validation checks passed.\n")
