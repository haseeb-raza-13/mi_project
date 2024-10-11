# activating repositories and installing packages----
setRepositories()
install.packages("readxl", dependencies = TRUE)
library(readxl)
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)
library(ggplot2)



# importing data----

df <- iris # creating a variable df from iris
df_1 <- 'Haseeb'
print(df_1)

# plotting using ggplot2 package ----
View(df)

ggplot(data = df, mapping = aes(x=Sepal.Length,y=Sepal.Width))+
  geom_point()

ggplot(data = df, mapping = aes(x=Sepal.Length,y=Sepal.Width, col=Species))+
  geom_point()

ggplot(data = df, mapping = aes(x=Sepal.Length,y=Sepal.Width, col=Species))+
  geom_point(size=5)+theme_classic()

ggplot(data = df, mapping = aes(x=Sepal.Length,y=Sepal.Width, col=Species))+
  geom_point(size=5)+theme_classic()+labs(x="sep_length",y="sep_width")

ggplot(data = df, mapping = aes(x=Sepal.Length,
                                y=Sepal.Width, col=Species))+
  geom_point(size=5)+theme_classic()+
  labs(x="sep_length",y="sep_width")+facet_wrap(~Species)






ggplot(data = df, mapping = aes(x=Sepal.Length,
                                y=Sepal.Width, col=Species))+
  geom_point(position = "jitter", size=5)+theme_classic()+
  labs(x="sep_length",y="sep_width")+facet_grid(.~Species)


ggplot(data = df, mapping = aes(x=Sepal.Length,
                                y=Sepal.Width, col=Species))+
  geom_point(position = "jitter", size=5)+theme_classic()+
  labs(x="sep_length",y="sep_width")+facet_grid(.~Species)+coord_flip()


ggplot(data = df, mapping = aes(x=Sepal.Length,
                                y=Sepal.Width, col=Species))+
  geom_point(position = "jitter", size=5)+theme_classic()+
  labs(x="sep_length",y="sep_width")+facet_grid(.~Species)+coord_flip()+stat_ellipse(col="red",size=2)

