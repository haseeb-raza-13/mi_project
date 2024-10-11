#activating repositories -----
setRepositories()
install.packages("readxl", dependencies = TRUE)
library(readxl)
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)
install.packages("devtools", dependencies = TRUE)
library(devtools)
devtools::install_github("JLSteenwyk/ggpubfigs", force = TRUE)
library(ggpubfigs)
install.packages("ggpubr", dependencies = TRUE)
library(ggpubr)
install.packages("esquisse", dependencies = TRUE)
library(esquisse)

# plotting using esquisse---- 
esquisser()

df_2 <- mpg

library(ggplot2)

ggplot(df_2) +
 aes(x = displ, y = hwy, colour = cyl) +
 geom_point() +
 scale_color_viridis_c(option = "viridis", 
 direction = 1) +
 labs(x = "Displacement ", y = "Highway", color = "Cylinder") +
 coord_polar(theta = "x") +
 theme_minimal()

esquisser()

library(ggplot2)

ggplot(df_2) +
 aes(x = displ, y = hwy, colour = cyl) +
 geom_point() +
 geom_smooth(se = TRUE) +
 scale_color_viridis_c(option = "viridis", 
 direction = 1) +
 labs(x = "Displacement", y = "Highway", color = "Cylinder") +
 theme_minimal()


ggplot(df_2) +
  aes(x = displ, y = hwy, colour = cyl) +
  geom_point() +
  geom_smooth(se = TRUE, method = "lm") +
  scale_color_viridis_c(option = "viridis", 
                        direction = 1) +
  labs(x = "Displacement", y = "Highway", color = "Cylinder") +
  theme_minimal()

plt <- ggplot(df_2) +
  aes(x = displ, y = hwy, colour = cyl) +
  geom_point() +
  geom_smooth(se = TRUE, method = "lm") +
  scale_color_viridis_c(option = "viridis", 
                        direction = 1) +
  labs(x = "Displacement", y = "Highway", color = "Cylinder") +
  theme_classic()

ggsave("mpg_reg_plt.pdf" , plot = plt , height = 8, width = 9 , units = "in")



ggsave("mpg_reg_plt.png" , plot = plt , height = 8, width = 9 , units = "in",
       dpi = 300)
