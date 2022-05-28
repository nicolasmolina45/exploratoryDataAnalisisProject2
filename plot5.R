# Descargar, Descomprimir y cargar archivos en directorio de trabajo

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

# Respuesta a la pregunta 5 - plot5.R 

## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

sccMotor <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
emissionsMotor <- NEI %>% 
        filter(SCC %in% sccMotor & fips == "24510") %>%
        group_by(year) %>%
        summarise(Emissions = sum(Emissions))

png("plot5.png", width = 640, height = 480)
  ggplot(emissionsMotor, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
        geom_bar(stat="identity") + ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
        geom_label(aes(fill = year),colour = "white", fontface = "bold") +
        ggtitle("Baltimore Vehicle Emissions, 1999 to 2008.")

dev.off()
























