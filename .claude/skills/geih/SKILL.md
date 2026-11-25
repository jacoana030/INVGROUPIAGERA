---
name: geih
description: Cómo trabajar con los microdatos de la GEIH del DANE en R: módulos y llaves, variables clave, factores de expansión, cambio de marco 2005/2018, empalmes, identificación de migrantes, tamaños de muestra por ciudad y plantillas de estimación (fixest, did, modelsummary). Úsalo antes de tocar cualquier archivo de la GEIH.
---

# GEIH en R

La Gran Encuesta Integrada de Hogares (DANE) es la fuente principal del grupo para mercado laboral y migración por ciudad. Archivos de apoyo:

- `diccionario.md`: variables clave por marco, llaves de unión, códigos de ciudad, factores de expansión y definición de migrante.
- `plantillas/01_lectura_union.R`: lectura de un mes, unión de módulos y apilado de meses, con chequeo automático de variables.
- `plantillas/02_muestra_migrantes.R`: tamaño de muestra y coeficiente de variación de migrantes por ciudad y periodo.
- `plantillas/03_estimacion.R`: diferencias en diferencias, estudio de eventos, instrumento shift-share y tablas con `modelsummary`.

Copia la plantilla a `R/` con número consecutivo (por ejemplo `R/geih_01_lectura.R`) y ajústala; no ejecutes las plantillas desde la carpeta de la skill.

## Reglas que no se negocian

1. **Ningún nombre de variable se da por cierto.** Los nombres cambian entre años y marcos. Antes de usar un año, abre su diccionario en el catálogo ANDA (https://microdatos.dane.gov.co/index.php/catalog) y corre `verificar_variables()` de la plantilla 01. Si una variable no aparece, se detiene el script; no se adivina.
2. **Siempre con factor de expansión.** Ningún nivel, tasa o promedio se publica sin ponderar. Al apilar meses, divide el factor mensual por el número de meses apilados (12 para un año, 3 para un trimestre).
3. **Errores estándar honestos.** Las cifras por ciudad y grupo llevan coeficiente de variación (CV). Regla del grupo: CV ≤ 15 % se reporta; entre 15 % y 20 % se reporta con advertencia; más de 20 % no se reporta (el DANE usa umbrales parecidos; verificar el que publique en su ficha metodológica vigente).
4. **No mezclar marcos sin empalme.** Las series que cruzan 2020-2021 usan los factores reponderados que publica el DANE o se analizan por separado con un indicador de marco en la regresión. Documenta la decisión en `datos/procesados/diccionario.md`.
5. **Unidad geográfica explícita.** Distingue siempre Cali área metropolitana (Cali y Yumbo) de Cali municipio, del Valle del Cauca y del total de 23 ciudades.
6. **Microdatos pesados fuera de la conversación.** Más de 50 MB por mes: se descarga desde R a `datos/crudos/geih/<año>/<mes>/`, se resume con código y solo el resumen llega a la conversación. Los crudos no se suben a GitHub si superan 50 MB (añádelos a `.gitignore`).

## Flujo estándar

1. Ficha del periodo: marco, cuestionario, nombre de módulos y del factor de expansión (desde el ANDA). Anótalo en `datos/procesados/diccionario.md`.
2. Lectura y unión (plantilla 01) → base persona-mes en Parquet.
3. Chequeos: número de personas por mes y ciudad contra el boletín técnico del DANE; tasa de desempleo de Cali A.M. reproducida con la base frente a la publicada (diferencia < 0,1 p. p.). Si no se reproduce, no se sigue.
4. Muestra de migrantes por ciudad y periodo (plantilla 02) antes de cualquier estimación.
5. Estimación (plantilla 03) solo con el diseño aprobado por Banana en el encargo.
6. Toda cifra que vaya a un producto pasa a `registro/verificacion_cifras.csv`.
