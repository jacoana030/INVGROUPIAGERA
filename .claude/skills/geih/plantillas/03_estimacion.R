# Plantilla 03: estimaciones para efectos de la migración en nativos por ciudad.
# Requiere el diseño aprobado por Banana en el encargo (ver skill encargo-investigacion).
# Paquetes CRAN: fixest, did, modelsummary.

library(tidyverse)
library(arrow)
library(fixest)
library(did)
library(modelsummary)

# Panel ciudad-periodo de nativos (construido a partir de la base persona-mes):
# y_ct (resultado ponderado), migr_ct (participación de nacidos en Venezuela en la PET),
# cali (1 si AREA == "76"), periodo, covariables pre-tratamiento.
panel <- read_parquet("datos/procesados/panel_ciudad_periodo.parquet")

# --- 1. Diferencias en diferencias con intensidad continua -----------------------------
# Efectos fijos de ciudad y periodo; errores agrupados por ciudad (23 conglomerados: pocos).
m_did <- feols(y ~ migr | AREA + periodo, data = panel, weights = ~pet, cluster = ~AREA)

# --- 2. Instrumento shift-share (enclave) ------------------------------------------------
# z_ct = participación de venezolanos en la ciudad en un año base (CNPV 2018 o GEIH previa)
#        × flujo nacional total del periodo (Migración Colombia), excluyendo la ciudad propia.
m_iv <- feols(y ~ 1 | AREA + periodo | migr ~ z, data = panel, weights = ~pet, cluster = ~AREA)
fitstat(m_iv, ~ ivf + ivwald)   # reportar F de la primera etapa

# --- 3. Estudio de eventos ------------------------------------------------------------------
# rel = periodos relativos al choque (p. ej., 2015-T3 cierre de frontera o 2017-2018 aceleración),
# interactuado con exposición alta (alta_expo = 1 si exposición base por encima de la mediana).
m_es <- feols(y ~ i(rel, alta_expo, ref = -1) | AREA + periodo, data = panel, cluster = ~AREA)
iplot(m_es)   # guardar con ggsave en resultados/

# --- 4. DiD con adopción escalonada (Callaway y Sant'Anna) ---------------------------------
# g = primer periodo en que la ciudad supera un umbral de exposición (0 si nunca).
# cs <- att_gt(yname = "y", tname = "t_num", idname = "id_ciudad", gname = "g",
#              data = panel, control_group = "notyettreated", clustervars = "id_ciudad")
# aggte(cs, type = "dynamic")

# --- 5. Pocos conglomerados --------------------------------------------------------------
# Con 23 ciudades, complementar con inferencia por aleatorización (permutar la exposición
# entre ciudades 999 veces y comparar el coeficiente) y decirlo en la nota de la tabla.

# --- Tablas --------------------------------------------------------------------------------
modelsummary(list("DiD" = m_did, "IV" = m_iv), stars = TRUE,
             gof_map = c("nobs", "r.squared"),
             notes = "Errores agrupados por ciudad (23). Ponderado por PET. Fuente: DANE, GEIH.",
             output = "resultados/tabla_efectos.docx")
