# activating repositories and installing packages----
setRepositories()
library(readxl,ggplot2)
library(tidyverse)
install.packages("nycflights23", dependencies = TRUE)
library(nycflights23)
nycflights23:: 
# importing nycflights23 as data frame ----


df <- nycflights23::flights
glimpse(df)
summary(df)
view(df)


df_1 <- filter(df, df$month==1)
unique(df$month)
unique(df$carrier)

df_1 <- filter(df, df$month==1, df$carrier=="UA")


ggplot(data = df_1, mapping = aes(x=dest, y=distance, fill="red"))+
  geom_bar(stat ="identity")+geom_


