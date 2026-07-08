# fslogisticskampala 1.0.0

Released 2026-07-08. First stable release, completing the openwashdata
package review (#5, #7, #9, #11, #13).

## Data corrections

* Fixed decimal-point corruption in truck volumes introduced by the previous
  data processing pipeline: 12 of 35 volumes were inflated tenfold (for
  example 6.5 cubic meters became 65). Volumes now match the raw source
  values (#7, #8).
* Recoded three transposed "AUS" numberplate prefixes to "UAS", merging
  `trucks` from 35 to 33 unique trucks and updating 458 rows in `trips`
  (#7, #8).
* `trips$fid` is now stored as integer (#7, #8).

## Documentation

* Expanded the README introduction, fixed the Example 1 legend title, and
  labelled all figure chunks (#9, #10).
* Added usage examples to the `trips` and `trucks` documentation (#9, #10).
* Moved the interactive map article to `vignettes/articles/` and added a
  reference index to the pkgdown site; the site URL is now used as the
  pkgdown base URL (#9, #10).
* Added `inst/CITATION` and synced citation metadata across DESCRIPTION,
  CITATION.cff, and inst/CITATION (#5, #6).

## Infrastructure

* Added a testthat suite asserting the data contract: structure, column
  types, completeness, unique identifiers, referential integrity, and value
  ranges (#11, #12).
* R-CMD-check now runs on pushes and pull requests to the dev branch
  (#11, #12).
* Added a data validation script in `analysis/` (#7, #8).
