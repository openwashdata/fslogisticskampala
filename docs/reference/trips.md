# trips: Trips of faecal sludge trucks

This dataset contains the GPS locations of faecal sludge trucks
collecting sludge from pit latrines and septic tanks in Kampala, Uganda.
Each trip is recorded with a unique identifier, the numberplate of the
truck, the date and time of the record. Data was collected from 30th
March 2015 until 25th June 2015.

## Usage

``` r
trips
```

## Format

A tibble with 5653 rows and 7 variables

- fid:

  Running ID for each recorded GPS location of a truck.

- numberplate:

  Numberplate of the truck, can be joined with `trucks` resource.

- date:

  Date of the record in ISO 8601 format.

- time:

  Time of the record in hours, minutes, seconds.

- lat:

  Latitude of the record.

- lon:

  Longitude of the record.

- plant:

  Treatment plant that the truck delivered faecal sludge to.
