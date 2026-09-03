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

## Examples

``` r
head(trips)
#> # A tibble: 6 × 7
#>     fid numberplate date       time       lat   lon plant   
#>   <dbl> <chr>       <date>     <time>   <dbl> <dbl> <chr>   
#> 1   117 AUS 119X    2015-03-30 10:53:03 0.358  32.6 Bugolobi
#> 2   118 AUS 119X    2015-03-31 03:53:41 0.349  32.6 Bugolobi
#> 3   119 AUS 119X    2015-03-31 10:33:01 0.322  32.6 Bugolobi
#> 4   120 AUS 119X    2015-03-31 11:42:01 0.364  32.5 Bugolobi
#> 5   121 AUS 119X    2015-04-01 07:03:01 0.360  32.6 Bugolobi
#> 6   122 AUS 119X    2015-04-01 09:14:21 0.312  32.6 Bugolobi

# Number of recorded trips per treatment plant
table(trips$plant)
#> 
#> Bugolobi   Lubigi 
#>     2212     3441 
```
