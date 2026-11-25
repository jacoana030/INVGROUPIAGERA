# Plantilla 01: leer un mes de la GEIH, unir módulos y apilar meses.
# Fuente: DANE, GEIH, catálogo ANDA https://microdatos.dane.gov.co/index.php/catalog
# Fecha de consulta: <AAAA-MM-DD>  ·  Marco: <2005 | 2018>  ·  Verificado contra diccionario ANDA del año: <sí/no>
# Copiar a R/ con número consecutivo antes de usar.

library(tidyverse)
library(arrow)

# --- Chequeo de variables: detiene el script si falta alguna -------------------
verificar_variables <- function(base, requeridas, archivo = "") {
  faltan <- setdiff(toupper(requeridas), toupper(names(base)))
  if (length(faltan) > 0) {
    stop("Faltan variables en ", archivo, ": ", paste(faltan, collapse = ", "),
         ". Revisa el diccionario ANDA del año y actualiza diccionario.md.")
  }
  invisible(TRUE)
}

leer_modulo <- function(ruta) {
  # Los CSV del DANE suelen venir con separador ";" y codificación latin1 (verificar).
  readr::read_delim(ruta, delim = ";", locale = readr::locale(encoding = "latin1"),
                    col_types = readr::cols(.default = "c"), progress = FALSE) |>
    rename_with(toupper)
}

llaves_persona <- c("DIRECTORIO", "SECUENCIA_P", "ORDEN")

leer_mes <- function(carpeta_mes, marco = c("2018", "2005")) {
  marco <- match.arg(marco)
  # Ajustar los patrones al nombre real de los archivos del mes.
  arch <- list.files(carpeta_mes, full.names = TRUE, recursive = TRUE, pattern = "\\.(csv|CSV)$")
  buscar <- function(patron, excluir = "^$") {
    nombres <- str_to_lower(basename(arch))
    x <- arch[str_detect(nombres, patron) & !str_detect(nombres, excluir)]
    if (length(x) != 1) stop("Se esperaba 1 archivo para '", patron, "' y hay ", length(x))
    x
  }
  personas <- leer_modulo(buscar("caracter"))
  fuerza   <- leer_modulo(buscar("fuerza"))
  ocupados <- leer_modulo(buscar("ocupados", excluir = "no[ _]ocupados|desocupados"))
  migra    <- leer_modulo(buscar("migra"))

  fex <- if (marco == "2018") "FEX_C18" else "FEX_C_2011"
  verificar_variables(personas, c(llaves_persona, "AREA", "DPTO", "CLASE", fex, "P6040"), "personas")

  base <- personas
  for (m in list(fuerza, ocupados, migra)) {
    comunes <- intersect(llaves_persona, names(m))
    nuevas  <- setdiff(names(m), names(base))
    n0 <- nrow(base)
    base <- left_join(base, m[, c(comunes, nuevas)], by = comunes)
    stopifnot(nrow(base) == n0)  # la unión no debe duplicar personas
  }
  base |> mutate(MARCO = marco, FEX = as.numeric(str_replace(.data[[fex]], ",", ".")))
}

# --- Apilar meses -----------------------------------------------------------------
# carpetas <- list.dirs("datos/crudos/geih/2024", recursive = FALSE)
# geih <- map(carpetas, leer_mes, marco = "2018") |> list_rbind() |>
#   mutate(FEX_PERIODO = FEX / n_distinct(MES))     # divide el factor por meses apilados
# write_parquet(geih, "datos/procesados/geih_2024.parquet")

# --- Chequeo de reproducción (obligatorio) ------------------------------------------
# Tasa de desempleo de Cali A.M. (AREA == "76") con la base vs. la del boletín DANE.
# td <- geih |> filter(AREA == "76", as.numeric(P6040) >= 15) |>
#   summarise(td = sum(FEX * (DSI == "1"), na.rm = TRUE) /
#                  sum(FEX * (OCI == "1" | DSI == "1"), na.rm = TRUE))
