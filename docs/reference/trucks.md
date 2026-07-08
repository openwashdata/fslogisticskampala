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
#> 1 UAS 119X       3  
#> 2 UAG 448X       3.5
#> 3 UAN 030N       3  
#> 4 UAN 087N       3.6
#> 5 UAT 112M       5  
#> 6 UAV 418C       4  

# Join truck volumes onto the trips they made
merge(trips, trucks, by = "numberplate") |>
  head()
#>   numberplate  fid       date     time      lat      lon  plant volume
#> 1  LG 0257-01 5068 2015-05-22 10:17:15 0.299871 32.53372 Lubigi      5
#> 2  LG 0257-01 5067 2015-05-22 09:00:35 0.324870 32.55980 Lubigi      5
#> 3  LG 0257-01 5072 2015-05-22 17:27:45 0.305458 32.56335 Lubigi      5
#> 4  LG 0257-01 5069 2015-05-22 11:50:25 0.328806 32.61192 Lubigi      5
#> 5  LG 0257-01 5070 2015-05-22 13:11:25 0.280900 32.57796 Lubigi      5
#> 6  LG 0257-01 5071 2015-05-22 14:50:25 0.299871 32.53372 Lubigi      5
```
