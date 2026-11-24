# 00_paquetes.R
# Prepara el entorno de R del Grupo GERA. Correr una vez en RStudio.
# Todos los paquetes vienen de CRAN y quedan registrados con renv.

if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
if (!file.exists("renv.lock")) renv::init(bare = TRUE)

paquetes <- c(
  # Datos
  "tidyverse", "readxl", "haven", "arrow", "janitor", "RSocrata", "WDI",
  # Literatura
  "openalexR", "pdftools",
  # Econometría y tablas (fase 2)
  "fixest", "did", "Synth", "modelsummary",
  # Flujo reproducible e informes
  "targets", "quarto"
)

renv::install(paquetes)
renv::snapshot(prompt = FALSE)
