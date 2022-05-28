# exploratoryDataAnalisisProject2
Tareas calificadas por los compañeros


1.	Instrucciones
El material particulado fino (PM2.5) es un contaminante del aire ambiental del que existe fuerte evidencia de que es dañino para la salud humana. En los Estados Unidos, la Agencia de Protección Ambiental (EPA, por sus siglas en inglés) tiene la tarea de establecer estándares nacionales de calidad del aire ambiente para las partículas finas y para rastrear las emisiones de este contaminante a la atmósfera. Aproximadamente cada 3 años, la EPA publica su base de datos sobre emisiones de PM2.5. Esta base de datos se conoce como el Inventario Nacional de Emisiones (NEI). Puede leer más información sobre el NEI en el sitio web del Inventario Nacional de Emisiones de la EPA .
Para cada año y para cada tipo de fuente de PM, el NEI registra cuántas toneladas de PM2.5 se emitieron desde esa fuente durante todo el año. Los datos que utilizará para esta tarea son de 1999, 2002, 2005 y 2008.

El objetivo general de esta tarea es explorar la base de datos del Inventario Nacional de Emisiones y ver qué dice sobre la contaminación por partículas finas en los Estados Unidos durante el período de 10 años 1999–2008. Puede usar cualquier paquete R que desee para respaldar su análisis.

Preguntas a abordar
Debe abordar las siguientes preguntas y tareas en su análisis exploratorio. Para cada pregunta/tarea necesitará hacer un solo gráfico. A menos que se especifique, puede usar cualquier sistema de trazado en R para hacer su trazado.
1.	¿Han disminuido las emisiones totales de PM2.5 en los Estados Unidos de 1999 a 2008? Utilizando el  sistema de representación gráfica base  , haga una representación gráfica que muestre la  emisión total de  PM2.5 de todas las fuentes para cada uno de los años 1999, 2002, 2005 y 2008.
2.	¿Han disminuido las emisiones totales de PM2.5 en la  ciudad de Baltimore , Maryland de 1999 a 2008? Utilice el  sistema de representación gráfica base  para hacer una representación gráfica que responda a esta pregunta.
3.	De los cuatro tipos de fuentes indicadas por el tipo (puntual, no puntual, en carretera, fuera de carretera), ¿cuál de estas cuatro fuentes ha visto disminuciones en las emisiones entre 1999 y 2008 para  la ciudad de Baltimore ? ¿Cuáles han visto aumentos en las emisiones entre 1999 y 2008? Use el  sistema de trazado ggplot2  para hacer que un gráfico responda a esta pregunta.
4.	En los Estados Unidos, ¿cómo han cambiado las emisiones de fuentes relacionadas con la combustión del carbón entre 1999 y 2008?
5.	¿Cómo han cambiado las emisiones de fuentes de vehículos motorizados entre 1999 y 2008 en  la ciudad de Baltimore ?
6.	Compare las emisiones de fuentes de vehículos motorizados en la ciudad de Baltimore con las emisiones de fuentes de vehículos motorizados en  el condado de Los Ángeles , California .

Datos
menos 
Los datos para esta tarea están disponibles en el sitio web del curso como un solo archivo zip:

Datos para evaluación por pares [29Mb]

El archivo zip contiene dos archivos:

Datos de emisiones de PM2.5 (\color{rojo}{\verbo|resumenSCC_PM25.rds|}resumenSCC_PM25.rds): este archivo contiene un marco de datos con todos los datos de emisiones de PM2.5 para 1999, 2002, 2005 y 2008. Para cada año, la tabla contiene el número de toneladas de PM2.5 emitidas por un tipo específico de fuente para el año entero. Aquí están las primeras filas.

##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
## 24 09001 10200602  PM25-PRI     1.490 POINT 1999

\color{rojo}{\verbo|fips|}fips: Un número de cinco dígitos (representado como una cadena) que indica el condado de EE. UU.

\color{rojo}{\verbo|SCC|}SCC: El nombre de la fuente indicado por una cadena de dígitos (consulte la tabla de clasificación del código fuente)

\color{rojo}{\verbo|Contaminante|}Contaminante: Una cadena que indica el contaminante

\color{rojo}{\verb|Emisiones|}Emisiones: Cantidad de PM2.5 emitida, en toneladas

\color{rojo}{\verbo|tipo|}escribe: El tipo de fuente (puntual, no puntual, en carretera o fuera de carretera)

\color{rojo}{\verbo|año|}año: El año de las emisiones registradas

Tabla de códigos de clasificación de fuentes : esta tabla proporciona una asignación de las cadenas de dígitos SCC en la tabla de emisiones al nombre real de la fuente de PM2.5. Las fuentes se clasifican de diferentes maneras, desde las más generales hasta las más específicas, y puede optar por explorar las categorías que considere más útiles. Por ejemplo, la fuente “10100101” se conoce como “Ext Comb/Electric Gen/Anthracite Coal/Pulverized Coal”.

Para leer cada uno de los dos archivos usando readRDS()función en R. Por ejemplo, la lectura en cada archivo se puede hacer con el siguiente código:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



