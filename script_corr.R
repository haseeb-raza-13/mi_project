# activating repos---- 


setRepositories()
library(readxl)
library(tidyverse)
library(ggplot2)

data()
# correlation on mpg ----
mpg <- mpg
library(corrplot)



corr <- mpg %>%  select(., displ, cyl, cty, hwy) %>% 
  cor() 


corrplot(corr, method = "number", type = "full")


corrplot(corr, method = "shade", type = "full")



corrplot(corr, method = "circle", type = "upper", order = "hclust", addrect = TRUE )

corrplot.mixed(corr, lower = "circle", upper = "shade")




# regression in R




mod <- mpg %>%  lm( formula = displ ~ cyl)


summary(mod)


plot(mod, col=2, lwd=1)
 par(mfrow = c(2,2))


ggplot(data = mpg, aes(x=cyl, y=displ))+geom_abline(col=2)+
  geom_point(col="blue")+geom_smooth(se=FALSE, col="green")



plot(mod, col=2, lwd=1)


ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) +
  geom_abline(col=2) + geom_point(size=3, col="blue") +
  geom_smooth(se=FALSE, col="green", span=10) + theme_classic()
