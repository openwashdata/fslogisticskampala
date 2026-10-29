# Interactive map of collection locations

``` r

library(fslogisticskampala)
library(leaflet)
```

## Overview

The `trips` dataset records the GPS locations where faecal sludge trucks
collected sludge in Kampala, Uganda, between 30th March 2015 and 25th
June 2015. Each record is tagged with the treatment plant the truck was
associated with (`Bugolobi` or `Lubigi`).

The README shows these locations as a static image, because GitHub does
not render JavaScript widgets in Markdown. This article renders the map
as a fully interactive `leaflet` widget that you can pan, zoom, and
click. The colour of each circle marker indicates the associated
treatment plant, and the two larger markers show the location of each
plant.

## Interactive map

``` r

leaflet(data = trips) |>
  addTiles() |>
  addCircleMarkers(
    ~lon, ~lat,
    popup = ~as.character(plant),
    color = ~ifelse(plant == "Bugolobi", "red", "blue"),
    radius = 0.5
  ) |>
  addMarkers(
    lng = ~c(32.6071673, 32.5458844),
    lat = ~c(0.3190139, 0.3472747),
    popup = ~c("Bugolobi FS treatment plant", "Lubigi FS treatment plant")
  )
```

## Source and acknowledgements

This map was contributed by Jos van der Ent as part of a capstone
project for the [Data Science for Open WASH
Data](https://ds4owd-002.github.io/) course (Ent 2025). The capstone
explores the structure and trends of the informal faecal sludge
collection sector in Kampala and is available at
<https://github.com/ds4owd-002/project-yozgoesdigital>.

## References

Ent, Jos van der. 2025. *Faecal Sludge Truck Logistics Analysis in
Kampala, Uganda: An Exploration to Understand the Structure and Trends
of an Informal Faecal Collection Sector*. Capstone project, Data Science
for Open WASH Data course.
<https://github.com/ds4owd-002/project-yozgoesdigital>.
