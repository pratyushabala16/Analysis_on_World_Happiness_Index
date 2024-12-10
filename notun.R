library(sf)
library(tmap)
library(tidyverse)
library(plotly)
library(viridis)
library(hrbrthemes)
library(ggthemes) 


countries <- read_sf(dsn = "D:/IITK/MTH208A/group_18 rproject/World_Countries.shp", 
                     layer = "World_Countries")
join <- left_join(countries,dataset, by = c("COUNTRY"="Country" ))
dataset2 <- join %>% filter(!is.na("latestRate"))

map <- tm_shape(dataset2) +
  tm_polygons("latestRate",
              style = "quantile", 
              palette = "RdYlGn") +
  tm_layout(legend.height = 0.45, 
            legend.width = 0.3,
            legend.outside = FALSE,
            legend.position = c("right", "bottom"),
            frame = FALSE) +
  tm_borders(alpha = 0.5) 

tmap_mode("view")
map
