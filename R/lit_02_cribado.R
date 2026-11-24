# lit_02_cribado.R
# Cribado de la búsqueda OpenAlex del 24-nov-2026 (sin gastar tokens de lectura).
# Paso 1: reglas por código. Paso 2: decisiones por título revisadas por James,
# registradas aquí para que el cribado sea reproducible.
# Uso: Rscript R/lit_02_cribado.R

library(readr)
library(dplyr)
library(stringr)

d <- read_csv("literatura/busqueda_2026-11-24.csv", show_col_types = FALSE) |>
  mutate(n = row_number())

# Decisiones por número de fila (orden del archivo de búsqueda)
incluir <- c(1, 4, 5, 6, 8, 10, 13, 16, 17, 19, 20, 21, 22, 25, 28, 29, 35, 36,
             37, 42, 43, 45, 51, 53, 56, 58, 62, 67, 70, 72, 73, 82, 83, 88,
             104)
dudoso  <- integer(0)  # los 19 dudosos se resolvieron tras leer resumenes (Camilo, 24-nov-2026)

# Resolucion de los 19 dudosos (n = fila en la busqueda; razon de una linea)
resol_incluir <- c(
  `9`  = "confianza hacia migrantes venezolanos en Colombia; sin resumen, se verifica en la fuente",
  `32` = "informe Banco Mundial sobre insercion laboral de migrantes en agro; aporta a empleo",
  `47` = "etnografia en Cali (mujeres en transito); evidencia cualitativa especifica de Cali",
  `49` = "diferencias en diferencias sobre desempleo por departamentos; metodo empirico (calidad baja)",
  `63` = "entrevistas sobre vivienda informal en Cali; especifico de Cali",
  `76` = "revision mixta regional (Brasil, Colombia, Peru); contexto, calidad baja",
  `84` = "efecto en salarios por nivel educativo y experiencia con GEIH 2013-2019"
)
resol_excluir <- c(
  `2`  = "crimen organizado en la frontera; cualitativo y sin vinculo con aristas economicas",
  `14` = "criminalidad transnacional en la frontera; ensayo sin efectos economicos",
  `18` = "estigmatizacion en prensa; sin estimacion de efectos",
  `30` = "COVID y ODS; descriptivo, sin metodo de identificacion",
  `40` = "paradigma hermeneutico basado en prensa y rumores; sin datos propios",
  `46` = "politicas publicas; revision sin metodo empirico explicito",
  `59` = "estudio de casos en Pasto; fuera de Cali y el Valle",
  `65` = "derechos de mujeres migrantes en general; no es migracion venezolana",
  `81` = "percepciones sin metodo claro",
  `90` = "caso Ecuador; sin aporte de metodo",
  `94` = "colombianos retornados de EE.UU.; no es migracion venezolana",
  `102` = "migracion haitiana en Cali; no venezolana"
)
incluir <- c(incluir, as.integer(names(resol_incluir)))

# Duplicados de un mismo trabajo (se conserva la versión publicada)
duplicado <- c(50, 60, 61, 71, 103)
excl_dudoso <- as.integer(names(resol_excluir))  # versiones previas, repetidas o traducciones

cribado <- d |>
  mutate(
    decision = case_when(
      n %in% duplicado ~ "excluir",
      n %in% excl_dudoso ~ "excluir",
      n %in% incluir   ~ "incluir",
      n %in% dudoso    ~ "dudoso",
      TRUE             ~ "excluir"
    ),
    razon = case_when(
      n %in% duplicado ~ "duplicado o version previa de otro documento",
      as.character(n) %in% names(resol_excluir) ~ unname(resol_excluir[as.character(n)]),
      as.character(n) %in% names(resol_incluir) ~ unname(resol_incluir[as.character(n)]),
      decision == "incluir" & str_detect(str_to_lower(paste(titulo, resumen)), "cali|valle del cauca") ~
        "empirico, menciona Cali o el Valle",
      decision == "incluir" ~ "empirico sobre efectos economicos de la migracion venezolana en Colombia",
      decision == "dudoso"  ~ "tema cercano (crimen, frontera, actitudes, politica); revisar resumen",
      !str_detect(str_to_lower(paste(titulo, resumen)), "venezuel") ~ "no trata migracion venezolana",
      TRUE ~ "sin metodo empirico o fuera de las aristas economicas"
    ),
    menciona_cali_valle = str_detect(str_to_lower(paste(titulo, resumen)), "cali\\b|valle del cauca")
  ) |>
  select(n, decision, razon, menciona_cali_valle, anio, citas, tipo, fuente, titulo, doi)

write_csv(cribado, "literatura/cribado_2026-11-24.csv")
print(count(cribado, decision))
print(filter(cribado, menciona_cali_valle) |> select(n, decision, titulo))
