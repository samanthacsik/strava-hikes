#......................load leaflet package......................
library(leaflet)

#.................create some small example data.................
my_hikes <- data.frame(
  name = c("hike 1", "hike 2"),
  total_miles = c(7.5, 5),
  elevation_gain_ft = c(2483, 1307),
  lat = c(34.45503, 34.45409),
  lng = c(-119.6535, -119.7289)
)

#........................create hiker icon.......................
hiker_icon <- makeIcon(
  iconUrl = "media/hiker.png", # hiker image downloaded from google!
  iconWidth = 20, iconHeight = 20
)

#........................build leaflet map.......................
leaflet(my_hikes) %>%

  # add map tiles & center view over Santa Barbara, CA
  addProviderTiles("Esri.WorldTerrain") %>%
  setView(lng = -119.753042, lat = 34.484782, zoom = 10) %>%

  # mark trail heads with hiker icon and
  # add hiker markers to group called "Display Icons"
  addMarkers(icon = hiker_icon, group = "Display Icons",
             lng = ~lng, lat = ~lat) %>%

  # create layer of our hiker-inspired icons -- these can be toggled on/off
  addLayersControl(
    overlayGroups = c("Display Icons")
  )



