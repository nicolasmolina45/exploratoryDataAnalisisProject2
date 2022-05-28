# Descargar, Descomprimir y cargar archivos en directorio de trabajo

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

# Respuesta a la pregunta 6 - plot6.R 

## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

fipsMotor <- data.frame(fips = c("06037", "24510"), county = c("Los Angeles", "Baltimore"))

SCCSector <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
vehicle_emissions <- NEI %>%
        filter(SCC %in% SCCSector & fips %in% fipsMotor$fips) %>%
        group_by(fips, year) %>%
        summarize(Emissions = sum(Emissions))

emissionsMotor <- merge(vehicle_emissions, fipsMotor)

png("plot6.png", width=1040, height=480)
 ggplot(emissionsMotor, aes(x = factor(year), y = round(Emissions/1000, 2), 
        label=round(Emissions/1000,2), fill = year)) +
        geom_bar(stat = "identity") + facet_grid(. ~ county) +
        ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
        geom_label(aes(fill = year),colour = "white", fontface = "bold") +
        ggtitle("Los Angeles vs Baltimore Vehicle Emissions.")

dev.off()




















