library(ggplot2)
"df" <- read.csv("EVOprecipspecies - Sheet1.csv")
ggplot(df) + geom_point(aes(x=Annual.Precip..mm., y=Species.Count, color=Site)) + labs(title = "Relationship between Precipitation and Species Count", x = "Annual Precipitation (mm)", y = "Number of Vascular Plant Species")
lm(`Annual Precipitation (mm)` ~ `Number of Species`)

abline(lm(`Annual Precipitation (mm)` ~ `Number of Species`, color = "black")

ggplot(df) + geom_point(aes(x=Annual.Mean.Temp, y=Species.Count, color=Site)) + labs(title = "Relationship between Temperature and Species Count", x = "Annual Mean Temperature (C)", y = "Number of Vascular Plant Species")



ggplot(df) + geom_point(aes(x=Latitude, y=Species.Count, color=Site)) + labs(title = "Relationship between Latitude and Species Count", x = "Latitude", y = "Number of Vascular Plant Species")

library(scatterplot3d)
library(RColorBrewer)

# TRIAL CODE
source('http://www.sthda.com/sthda/RDoc/functions/addgrids3d.r')
plotvar <- df$Species.Count # pick a variable to plot
nclr <- 8 # number of colors
plotclr <- brewer.pal(nclr,"Spectral") # get the colors
colornum <- cut(rank(df$Species.Count), nclr, labels=F)
colcode <- plotclr[colornum] # assign color
lon <- df$Latitude
lat <- df$Annual.Mean.Temp

plot.angle <- 60
p3d <- scatterplot3d(lon, lat, plotvar, type="h", angle=plot.angle, color=colcode, pch=20, cex.symbols=2, 
              col.axis="gray", col.grid="gray",
              main = "Relating Species Counts to Environmental Variables",
              xlab = "Latitude",
              ylab = "           Annual Mean Temperature (C)",
              zlab = " Number of Species Present"
)

legend("bottomright", legend = levels(df$Site),
       col =  colcode, pch = 16, bty = "n", bg = "transparent", inset = -.11, xpd = T)

