# lit_01_busqueda_openalex.R
# Búsqueda y cribado inicial de literatura con OpenAlex (sin gastar tokens).
# Fuente: API pública de OpenAlex (https://openalex.org). Registrar fecha de consulta.
# Uso: Rscript R/lit_01_busqueda_openalex.R

library(openalexR)
library(dplyr)
library(readr)
library(stringr)

# Ajustar según proyectos/<proyecto>/protocolo_literatura.md
consultas <- c(
  "Venezuelan migration Colombia labor market",
  "Venezuelan migrants Colombia wages informality",
  "Venezuelan migration Colombia crime",
  "Venezuelan migration Colombia economic growth fiscal",
  "migracion venezolana Colombia mercado laboral",  # sin tildes: la API no las empareja
  "migracion venezolana Cali"
)

buscar <- function(q) {
  res <- oa_fetch(
    entity = "works",
    title_and_abstract.search = q,
    from_publication_date = "2015-01-01",
    # Máximo 200 documentos por consulta, los más citados: cribado barato pero acotado
    options = oa_options(sort = "cited_by_count:desc", per_page = 200,
                         paging = "page", pages = 1),
    verbose = FALSE
  )
  if (is.null(res) || nrow(res) == 0) {
    message("Sin resultados: ", q)
    return(NULL)
  }
  mutate(res, consulta = q)
}

resultados <- bind_rows(lapply(consultas, buscar))

# Los nombres de columnas cambian entre versiones de openalexR: se toman los que existan
col <- function(df, nombres) {
  n <- intersect(nombres, names(df))
  if (length(n) == 0) NA_character_ else as.character(df[[n[1]]])
}

base <- tibble(
  id      = col(resultados, "id"),
  doi     = col(resultados, "doi"),
  titulo  = col(resultados, c("title", "display_name")),
  anio    = col(resultados, "publication_year"),
  citas   = suppressWarnings(as.integer(col(resultados, "cited_by_count"))),
  tipo    = col(resultados, "type"),
  fuente  = col(resultados, c("source_display_name", "so")),
  resumen = col(resultados, c("abstract", "ab")),
  consulta = resultados$consulta
) |>
  distinct(id, .keep_all = TRUE) |>
  # Filtro automático: debe mencionar Colombia o Venezuela en título o resumen
  filter(str_detect(str_to_lower(paste(titulo, resumen)), "colombia|venezuel")) |>
  arrange(desc(citas))

archivo <- file.path("literatura", paste0("busqueda_", Sys.Date(), ".csv"))
write_csv(base, archivo)
message("Documentos tras filtro automático: ", nrow(base), " -> ", archivo)
