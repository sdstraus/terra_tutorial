# install packages

# install.packages("sf")
# install.packages("terra")
# install.packages("spData")
# install.packages("spDataLarge", repos = "https://nowosad.r-universe.dev")

# load packages
library(sf)
library(terra)
library(spData)
library(spDataLarge)

vignette(package = "sf") # see which vignettes are available
vignette("sf1")          # an introduction to the package

# exporing the world object
class(world) # world country polygon
names(world) # all of the country names for which there are polygons
plot(world) # all possible plots for world
world$name_long # view names
which(world$name_long == "Canada") # which polygon is canada?
plot(world$geom[4]) # plotting canada geometry

## other way to do the same thing
canada <- world[world$name_long == "Canada", ]
# get geometry from sf object
plot(st_geometry(canada), expandBB = c(0, 0.2, 0.1, 1), col = "gray", lwd = 3) 
# plot within north america
na <- world[world$continent == "North America", ]
plot(st_geometry(na), add = TRUE)
coords <- as.data.frame(st_coordinates(canada))
plot(coords$X, coords$Y)


## read in raster file
hfi <- rast("HFI-geotiff/wildareas-v3-2009-human-footprint.tif")
hfi
project(hfi, "+proj=longlat +datum=WGS84")
plot(hfi)
plot(st_geometry(canada), add = TRUE)



####### RGBIF #########

install.packages("rgbif", repos="https://dev.ropensci.org")
library(rgbif)
