list.of.packages <- c("leaflet", "htmlwidgets")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages))
  install.packages(new.packages)


# Start Script Here: ------------------------------------------------------

library(leaflet)

my.path = 'paulassignment.csv'

dataf = read.csv(my.path, stringsAsFactors = F)
dataf$Latitude = as.numeric(dataf$Latitude)

popup <- paste("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:300px'><b>",
               '<a href=', dataf$InfoURL, ' target="_blank"> <h2 align="center"><strong>', dataf$Name, "</strong></h2></a><br>",
               "</b>", dataf$Description, '<br><br><center><img src="', dataf$ImageURL, '" height="150px" width="200px" border="8"></center><br> </div>')


map = leaflet() %>%
    addTiles( ) %>%
    addMarkers(data = dataf, lat = dataf$Latitude, lng = dataf$Longitude, popup = popup )

map

htmlwidgets::saveWidget(map, file = paste0(dirname(my.path), "/map.html"))

