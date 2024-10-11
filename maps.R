setRepositories()
install.packages("sf", dependencies = TRUE)
install.packages("rnaturalearth", dependencies = TRUE)
# installing required packages ----
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

# making plots ----
world <- ne_countries(scale = "medium", 
                      returnclass = "sf")
view(world)

# practice plot 1
ggplot(data=world,  aes(fill = income_grp)) +geom_sf() + theme_map() + scale_fill_viridis_d()


world %>% 
  ggplot(aes(fill = income_grp)) +geom_sf() + theme_map() + scale_fill_viridis_d()

# practice plot 2

world %>% 
  filter(region_un=="Africa") %>% 
  ggplot() +
  geom_sf(aes(fill= pop_est/1e6), 
          color= "white", 
          lwd = 0.3) +
  theme_map()




world %>% 
  filter(region_un=="Asia") %>% 
  ggplot() +
  geom_sf(aes(fill= pop_est/1e6), 
          color= "white", 
          lwd = 0.3) +
  theme_map()





world %>% 
  filter(region_un=="Europe") %>% 
  ggplot() +
  geom_sf(aes(fill= pop_est/1e6), 
          color= "white", 
          lwd = 0.3) +
  theme_map()

# making interactive plots ----


install.packages("janitor", dependencies = )
install.packages("giscoR", dependencies = TRUE)

library(tidyverse)
library(janitor)
library(giscoR)




gisco_get_nuts( country = 'Germany') %>% 
  as_tibble() %>% 
  janitor::clean_names() %>% 
  count(levl_code)




gisco_get_nuts( country = 'Germany', 
                nuts_level = 3, 
                year = "2021") %>% 
  as_tibble() %>% 
  janitor::clean_names()



germany_dist <- gisco_get_nuts( country = 'Germany', 
                nuts_level = 3, 
                year = "2021", 
                epsg = 3035) %>% 
  as_tibble() %>% 
  janitor::clean_names()


germany_states <- gisco_get_nuts( country = 'Germany', 
                                nuts_level = 1, 
                                year = "2021", 
                                epsg = 3035) %>% 
  as_tibble() %>% 
  janitor::clean_names()


germany_dist %>% 
  ggplot(aes(geometry = geometry))+ geom_sf()




# making the plot beautiful and interactive using ggiraph package and htlm_tools -----

install.packages("ggiraph", dependencies = TRUE)
library(ggiraph)


germany_dist %>% 
  ggplot(aes(geometry = geometry))+ geom_sf( data = germany_states, 
                                             aes(fill= nuts_name, 
                                                 color = "black", 
                                                 lwd = 0.5)) + geom_sf_interactive( fill = NA, 
                                                                                    aes(
                                                                                      data_id = nuts_id, 
                                                                                      tooltip = nuts_name
                                                                                    ), 
                                                                                    color= 'black', 
                                                                                    lwd  = 0.1) +
  theme_void()





gg_plt <- germany_dist %>% 
  ggplot(aes(geometry = geometry))+ geom_sf( data = germany_states, 
                                             aes(fill= nuts_name, 
                                                 color = "black", 
                                                 lwd = 0.5)) + geom_sf_interactive( fill = NA, 
                                                                                    aes(
                                                                                      data_id = nuts_id, 
                                                                                      tooltip = nuts_name
                                                                                    ), 
                                                                                    color= 'black', 
                                                                                    lwd  = 0.1) +
  theme_void()



girafe(ggobj = gg_plt)




map_lgl(
  germany_states$geometry, 
  \ (y) {
    st_within(
      germany_dist$geometry[[1]],
      y
    ) %>% as.logical()
  }
) %>% which()




map_dbl(
  germany_dist$geometry, 
  \(x) {map_lgl(
    germany_states$geometry, 
    \ (y) {
      st_within(
        germany_dist$geometry,
        x,
        y
      ) %>% as.logical()
    }
  ) %>% which()
    
  }
)



 map_dbl(
  germany_dist$geometry , 
  \(x) {
    map_lgl(
      germany_states$geometry,
      \(y) {
        st_within(
          x,
          y
        ) %>% as.logical() 
      }
    ) %>% which()
  }
)

state_nmbrs <-  
  map_dbl(
    germany_dist$geometry , 
    \(x) {
      map_lgl(
        germany_states$geometry,
        \(y) {
          st_within(
            x,
            y
          ) %>% as.logical() 
        }
      ) %>% which()
    }
  )


germany_districts_w_state <- germany_dist %>% 
  mutate(
    state = germany_states$nuts_name[state_nmbrs]
  )


gg_plt <- germany_districts_w_state %>% 
  ggplot(aes(geometry = geometry))+ geom_sf( data = germany_states, 
                                             aes(fill= nuts_name, 
                                                 color = "black", 
                                                 lwd = 0.5)) + geom_sf_interactive( fill = NA, 
                                                                                    aes(
                                                                                      data_id = nuts_id, 
                                                                                      tooltip = nuts_name
                                                                                    ), 
                                                                                    color= 'black', 
                                                                                    lwd  = 0.1) +
  theme_void()


girafe(ggobj = gg_plt)





gg_plt <- germany_districts_w_state %>% 
  ggplot(aes(geometry = geometry))+ geom_sf( data = germany_states, 
                                             aes(fill= nuts_name, 
                                                 color = "black", 
                                                 lwd = 0.5)) + geom_sf_interactive( fill = NA, 
                                                                                    aes(
                                                                                      data_id = nuts_id, 
                                                                                      tooltip = glue::glue(
                                                                                        '{nuts_name}<br>{state}'
                                                                                      )
                                                                                    ), 
                                                                                    color= 'black', 
                                                                                    lwd  = 0.1) +
  theme_void() + theme(legend.position = 'none') +
  scale_fill_manual(
    values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", 
               "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", 
               "#bcbd22", "#17becf", "#aec7e8", "#ffbb78", 
               "#98df8a", "#ff9896", "#c5b0d5", "#c49c94")
  )


girafe(ggobj = gg_plt)




make_nice_label <- function(nuts_name, state) {
  nuts_name_label <- htmltools::span(
    nuts_name, 
    style = htmltools::css(
      fontweight = 600, 
      font_family = 'Source Sans Pro', 
      font_size = '32px'
    )
  )
  
  state_label <- htmltools::span(
    state, 
    style = htmltools::css(
      font_family ='Source Sans Pro', 
      font_size = '20px'
    )
  )
  glue::glue('{nuts_name_label}<br>{state_label}')
}




gg_plt <- germany_districts_w_state %>% 
  mutate(
    nice_label = map2_chr(
      nuts_name, 
      state, 
      make_nice_label
    )
  ) %>% 
  ggplot(aes(geometry = geometry))+ geom_sf( data = germany_states, 
                                             aes(fill= nuts_name, 
                                                 color = "black", 
                                                 lwd = 0.5)) + geom_sf_interactive( fill = NA, 
                                                                                    aes(
                                                                                      data_id = nuts_id, 
                                                                                      tooltip = nice_label
                                                                                    ), 
                                                                                    color= 'black', 
                                                                                    lwd  = 0.1) +
  theme_void() + theme(legend.position = 'none') +
  scale_fill_manual(
    values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", 
               "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", 
               "#bcbd22", "#17becf", "#aec7e8", "#ffbb78", 
               "#98df8a", "#ff9896", "#c5b0d5", "#c49c94")
  )


girafe(ggobj = gg_plt)
