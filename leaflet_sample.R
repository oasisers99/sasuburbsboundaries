install.packages("leaflet")
library(leaflet)
library(jsonlite)

# sample code from https://rstudio.github.io/leaflet/
m <- leaflet() %>%
  addTiles() %>% #Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplatce of R")
m

# SA suburbs topo data from http://www.dptiapps.com.au/dataportal/Suburbs_geojson.zip
setwd('/Users/songminseok/R/sa_thriving_communities')
geoJson <- readLines("sasuburbs.js", warn = FALSE) %>%
  paste(collapse = "\n") %>%
  fromJSON(simplifyVector = FALSE)

leaflet() %>% setView(lng = 138.6007, lat = -34.9285, zoom = 8) %>%
  addTiles() %>%
  addGeoJSON(geoJson, weight = 1, color = "#444444", fill=FALSE)
