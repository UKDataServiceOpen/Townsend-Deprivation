#import leafletmapdata
#load the following packages
library("dplyr")
library("rgdal")
#read shapefile from the relevant location 
shapefile<-readOGR(dsn = "C:/Users/sanah.yousaf/Documents/Mapping resources/Adjustedshp/Shapefile",
                   layer = "UKWard2011S")
#check the structure of both the dataframes to see if they match
str(leafletmapdata$geo_code)
str(shapefile@data$geo_code)
#order the variable you will use to join the shapefile data and csv data
shapefile<-shapefile[order(shapefile@data$geo_code), ]
leafletmapdata<-leafletmapdata[order(leafletmapdata$geo_code), ]
#check that they are identical
shapefile@data$geo_code<-as.character(shapefile@data$geo_code)
identical(leafletmapdata$geo_code, shapefile@data$geo_code)
#change the CRS
shapefile@data<-left_join(shapefile@data, leafletmapdata, by = "geo_code")
proj4string(shapefile)<-CRS("+init=epsg:27700")
shapefile<-spTransform(shapefile, CRS("+init=epsg:4326"))
#open leaflet 
library(leaflet)
#choose color options
pal<- colorQuantile(palette = "YlGnBu", domain = shapefile@data$TDS, n = 5)
#relevant code for the map
map<-leaflet(data = shapefile) %>% 
  addTiles() %>% 
  setView(-3.4360, 55.3781, zoom = 6) %>% 
  addLegend("topleft", pal = pal, values = ~TDS, title = "UK Deprivation in 2011") %>% 
  addPolygons(fillColor = ~pal(TDS), fillOpacity = 0.8, color = "FF0000", weight = 1, 
              popup = paste("<b>Ward:</b>", leafletmapdata$geo_label, "<br>", 
                            "<b>Townsend score:</b>", leafletmapdata$TDS))
#load your map
map
