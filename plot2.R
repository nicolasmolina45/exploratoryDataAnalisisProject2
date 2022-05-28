# Descargar, Descomprimir y cargar archivos en directorio de trabajo

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Respuesta a la pregunta 2 - plot2.R 

## Have total emissions from PM2.5 decreased 
## in the Baltimore City, Maryland ## (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

emissionsTotal <- NEI %>%
        filter(fips == "24510") %>%
        group_by(year) %>%
        summarise(Emissions = sum(Emissions))
png('plot2.png')
with(emissionsTotal,
     barplot(height=Emissions/1000, names.arg = year, col = color_range, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Baltimore, Maryland Emissions from 1999 to 2008'))
)

dev.off()



















