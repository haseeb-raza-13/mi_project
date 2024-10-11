# activating repos and installing packages----
setRepositories()
install.packages("readxl", dependencies = TRUE)
library(readxl)
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)

# importing dataset for practice----
View(iris)
data(iris)

df <- iris
view(df)
as.tibble(df)
print(df)
glimpse(df)
head(df)
tail(df)

summary(df)

ggplot(data = df,
       mapping = aes(x=Sepal.Length, y=Petal.Length))+geom_point()

ggplot(data = df,
       mapping = aes(x=Sepal.Length,
                     y=Petal.Length,
                     col=Species))+geom_point(size=5)


ggplot(data = df,
       mapping = aes(x=Sepal.Length,
                     y=Petal.Length,
                     col=Species))+geom_point(size=5)+theme_dark()
