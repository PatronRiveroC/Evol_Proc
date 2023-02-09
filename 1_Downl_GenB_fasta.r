
# --------------------------------------------------------------------------------------------------------------- #

### Title: Descargar secuencias loop ####
### Author: Patrón-Rivero, C. ####
### Date: 09/22/2022 ###

# --------------------------------------------------------------------------------------------------------------- #

# Packages #

# --------------------------------------------------------------------------------------------------------------- #

library(seqinr)

# --------------------------------------------------------------------------------------------------------------- #

# Loop para descargar todos los archivos y guardarlos con el nombre del código #

# --------------------------------------------------------------------------------------------------------------- #

data <- read.csv("C:/Cuso_proc_evol/G_blo/ND4/seq.csv" # Si cargas la tabla desde tu pc

# Datos de ejemplo en Drive #

id <- "1yaboY6HariaG53qiMzlYqlppPHA_kdjz" # ID de la tabla en .csv (una columna por código)
data <- read.csv(sprintf("https://docs.google.com/uc?id=%s&export=download", id)) # Cargar archivo desde Drive

n <- nrow(data)
head(data) # Visualizar la columna

pb <- txtProgressBar(min = 0, max = n, style = 3, width = 40, char = "=")

for(i in 1:n){
	code <- data$GenBank_ND4[i] # cambiar por el nombre de la columna donde están los codigos de GenB
	fast_gb <- rentrez::entrez_fetch(db = "nucleotide", id = code, rettype = "fasta")
	setwd("C:/Users/manol/Documents/Doctorado/3_semestre/Cuso_proc_evol/G_blo/raw/ND4") # carpeta donde se van a guardar los archivos .fasta
	write(fast_gb, file = paste0(data$GenBank_ND4[i], ".fasta")) # el nombre del archivo va a ser el GenB code
	setTxtProgressBar(pb, i)
}

# --------------------------------------------------------------------------------------------------------------- #

## EndNotRun
