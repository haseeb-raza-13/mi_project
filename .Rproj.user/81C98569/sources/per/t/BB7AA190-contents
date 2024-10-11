setRepositories()
library(tidyverse)
library(ggplot2)
library(sf)
install.packages("usmap", dependencies = TRUE)
library(usmap)
install.packages("patchwork", dependencies = TRUE)
library(patchwork)
install.packages("grid", dependencies = TRUE)
library(grid)
library(rnaturalearth)
library(rnaturalearthdata)
library(janitor)
library(ggiraph)






plot_usmap(regions = 'states')


us_map(regions = 'states') 


divisions_states <- state.abb[state.division=='Mountain']


division_map_data <- us_map(regions = 'states', 
                            include = divisions_states) %>% 
  as_tibble()



fill_color <- "grey80"


plot_usmap(
  regions = "states", 
  fill = fill_color, 
  color = "steelblue", 
  exclude = divisions_states, 
  
) +
  geom_sf( data = division_map_data$geom, 
           fill = "yellow", 
           color = "black", 
           lwd = 0.5, 
           alpha = 0.5)












plot_usmap(
  regions = "states", 
  fill = fill_color, 
  color = fill_color, 
  exclude = divisions_states, 
  
) +
  geom_sf( data = division_map_data$geom, 
           fill = "yellow", 
           color = "white", 
           lwd = 1)











plot_division_map <- function(selected_division) { 
  divisions_states <- state.abb[state.division==selected_division]


division_map_data <- us_map(regions = 'states', 
                            include = divisions_states) %>% 
  as_tibble()



fill_color <- "grey80"
plot_usmap(
  regions = "states", 
  fill = fill_color, 
  color = fill_color, 
  exclude = divisions_states, 
  
) +
  geom_sf( data = division_map_data$geom, 
           fill = "yellow", 
           color = "black", 
           lwd = 0.5, 
           alpha = 0.5)

  
}





plot_division_map('Mountain')



plot_division_map('Pacific')


####

read_csv(
  'school_starts.csv'
)
