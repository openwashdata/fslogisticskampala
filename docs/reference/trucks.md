# trucks: Faecal sludge emptying trucks

Additional information on the volume of each truck used in the dataset
`trips`.

## Usage

``` r
trucks
```

## Format

A tibble with 33 rows and 2 variables

- numberplate:

  Numberplate of the truck, can be joined with `trips` resource.

- volume:

  Volume of the truck in cubic meters.

## Examples

``` r
head(trucks)
#> # A tibble: 6 × 2
#>   numberplate volume
#>   <chr>        <dbl>
#> 1 AUS 119X         3
#> 2 UAG 448X        35
#> 3 UAN 030N         3
#> 4 UAN 087N        36
#> 5 UAT 112M         5
#> 6 UAV 418C         4

# Join truck volumes onto the trips they made
merge(trips, trucks, by = "numberplate") |>
  head()
#>   numberplate  fid       date     time      lat      lon    plant volume
#> 1    AUS 088V 3590 2015-06-05 13:24:47 0.312675 32.63670 Bugolobi     65
#> 2    AUS 088V 1473 2015-05-06 04:02:51 0.297745 32.60090 Bugolobi     65
#> 3    AUS 088V 3083 2015-05-23 17:12:00 0.348744 32.66190 Bugolobi     65
#> 4    AUS 088V 1470 2015-05-03 14:30:32 0.386287 32.65322 Bugolobi     65
#> 5    AUS 088V 4979 2015-06-23 11:58:25 0.357731 32.60086 Bugolobi     65
#> 6    AUS 088V 4533 2015-06-13 09:54:28 0.694974 34.19220 Bugolobi     65
```
