library(ggplot2)

vehicles_BaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
vehicles_BaltimoreNEI$city <- "Baltimore City"
vehicles_LANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehicles_LANEI$city <- "Los Angeles County"
bothNEI <- rbind(vehicles_BaltimoreNEI,vehicles_LANEI)

gggraph <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) + geom_bar(aes(fill=year),stat="identity") + facet_grid(scales="free", space="free", .~city) + guides(fill=FALSE) + theme_bw() + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
print(gggraph)
