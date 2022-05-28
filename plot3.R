# Descargar, Descomprimir y cargar archivos en directorio de trabajo

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

# Respuesta a la pregunta 3 - plot3.R 

## Of the four types of sources indicated by the type (point, nonpoint, onroad, 
## nonroad) variable, which of these four sources have seen decreases in emissions 
## from 1999 2008 for Baltimore City? Which have seen increases in emissions from 1999 2008? 
##  Use the ggplot2 plotting system to make a plot answer this question.

emissionsType <- NEI %>%
        filter(fips == "24510") %>%
        group_by(year, type) %>%
        summarise(Emissions=sum(Emissions))

png("plot3.png", width=640, height=480)
ggplot(data = emissionsType, aes(x = factor(year), y = Emissions, fill = type, colore = "black")) +
        geom_bar(stat = "identity") + facet_grid(. ~ type) + 
        xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
        ggtitle("Baltimore Emissions by Source Type") 

dev.off()






















