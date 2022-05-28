# Descargar, Descomprimir y cargar archivos en directorio de trabajo

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

library(dplyr)
library(ggplot2)

# Pregunta 4 - plot4
## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999-2008? fetch all NEIxSCC records with Short.Name (SCC) Coal

coalSCC <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
coalNEI <- NEI %>% filter(SCC %in% coalSCC)
coalsummary <- coalNEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

png("plot4.png", width=640, height=480)
  ggplot(coalsummary, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
        geom_bar(stat="identity") + ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
        geom_label(aes(fill = year),colour = "white", fontface = "bold") +
        ggtitle("Coal Combustion Emissions, 1999 to 2008.")

dev.off()

 


























