# dat_01_inventario.R
# Consultas pequenas (solo metadatos y muestras de <= 5 filas) a datos.gov.co para el
# inventario de fuentes de migracion en Cali y el Valle.
# Fuente: API SODA de datos.gov.co (https://www.datos.gov.co), catalogo y dataset
#   Migracion Colombia "Pre registros ETPV" (id 6eyy-q57b).
# Fecha de consulta: 2026-11-24
# Uso: Rscript R/dat_01_inventario.R
# Salidas: datos/crudos/inventario_catalogo_datosgov_<tema>.json, datos/crudos/etpv_preregistro_muestra.csv
# Nota: si la red bloquea el host, el script avisa y termina sin inventar datos.

suppressPackageStartupMessages({
  library(readr)
  library(jsonlite)
})

dir.create("datos/crudos", recursive = TRUE, showWarnings = FALSE)

# 1. Catalogo: buscar conjuntos por tema (maximo 10 resultados por tema)
temas <- c(migrantes = "migrantes venezolanos",
           pep       = "permiso especial permanencia",
           delitos   = "delitos nacionalidad policia",
           salud     = "afiliados migrantes regimen")

for (t in names(temas)) {
  url <- paste0("https://www.datos.gov.co/api/catalog/v1?limit=10&q=", URLencode(temas[[t]]))
  destino <- file.path("datos/crudos", paste0("inventario_catalogo_datosgov_", t, ".json"))
  res <- tryCatch({
    download.file(url, destino, quiet = TRUE, mode = "wb")
    j <- fromJSON(destino)$results
    data.frame(tema = t,
               id = j$resource$id,
               nombre = j$resource$name,
               entidad = j$resource$attribution,
               actualizado = j$resource$updatedAt)
  }, error = function(e) {
    message("FALLA catalogo '", t, "': ", conditionMessage(e)); NULL
  })
  if (!is.null(res)) { cat("\n== ", t, " ==\n"); print(res[, c("id", "nombre", "entidad", "actualizado")], row.names = FALSE) }
}

# 2. Muestra del pre-registro ETPV (columnas: sexo, rango_edad, departamento_residencia,
#    departamento_divipola, anio, mes, cantidad). Solo 5 filas para ver la estructura.
muestra <- tryCatch(
  read_csv("https://www.datos.gov.co/resource/6eyy-q57b.csv?$limit=5", show_col_types = FALSE),
  error = function(e) { message("FALLA muestra ETPV: ", conditionMessage(e)); NULL })
if (!is.null(muestra)) {
  write_csv(muestra, "datos/crudos/etpv_preregistro_muestra.csv")
  str(muestra)
}

# 3. Conteo de pre-registros del Valle (divipola 76) vs. total, agregado en el servidor
agg <- tryCatch(
  read_csv(paste0("https://www.datos.gov.co/resource/6eyy-q57b.csv?",
                  URLencode("$select=departamento_divipola,sum(cantidad) as total&$group=departamento_divipola&$limit=50")),
           show_col_types = FALSE),
  error = function(e) { message("FALLA agregado ETPV: ", conditionMessage(e)); NULL })
if (!is.null(agg)) {
  agg$total <- as.numeric(agg$total)
  cat("\nTotal pre-registros ETPV (suma cantidad):", sum(agg$total), "\n")
  cat("Valle (76):", agg$total[agg$departamento_divipola == "76"], "\n")
}
