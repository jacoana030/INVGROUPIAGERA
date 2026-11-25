# Plantilla 02: tamaño de muestra y coeficiente de variación (CV) de migrantes por ciudad.
# Insumo: base persona-mes de la plantilla 01. Salida: resultados/muestra_migrantes_geih.csv
# Primer paso de la fase 2: decide si Cali A.M. tiene precisión suficiente.

library(tidyverse)
library(arrow)
library(survey)   # CRAN; registrar con renv

geih <- read_parquet("datos/procesados/geih_<periodo>.parquet")  # debe traer ANIO, MES, AREA, FEX_PERIODO

# Definición de migrante: ajustar nombre y código de Venezuela tras verificar en el ANDA.
var_pais_nac <- "P3373S3"   # marco 2018 (verificar); marco 2005: "P756S3"
cod_venezuela <- "<codigo>" # tomar de la tabla de países del diccionario del año

geih <- geih |>
  mutate(migrante_ven = as.integer(.data[[var_pais_nac]] == cod_venezuela),
         trimestre = paste0(ANIO, "-T", ceiling(as.numeric(MES) / 3)))

# Conteos sin ponderar: cuántas observaciones hay por celda
muestra <- geih |>
  count(AREA, trimestre, migrante_ven, name = "n_obs")

# Estimación ponderada con diseño simplificado (sin estratos ni UPM públicas: el CV
# resultante es aproximado; si el ANDA publica variables de diseño, incluirlas).
diseno <- svydesign(ids = ~DIRECTORIO, weights = ~FEX_PERIODO, data = geih)
est <- svyby(~migrante_ven, ~AREA + trimestre, diseno, svytotal, na.rm = TRUE) |>
  as_tibble() |>
  mutate(cv = se / migrante_ven,
         semaforo = case_when(cv <= 0.15 ~ "reportable",
                              cv <= 0.20 ~ "con advertencia",
                              TRUE ~ "no reportable"))

left_join(est, filter(muestra, migrante_ven == 1), by = c("AREA", "trimestre")) |>
  write_csv("resultados/muestra_migrantes_geih.csv")
