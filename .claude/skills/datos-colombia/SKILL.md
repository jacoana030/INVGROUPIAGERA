---
name: datos-colombia
description: Dónde y cómo obtener datos económicos oficiales de Colombia (DANE, Banco de la República, Migración Colombia, datos.gov.co, DNP) con R, y cómo documentarlos. Úsalo antes de descargar cualquier serie o microdato colombiano.
---

# Datos oficiales de Colombia con R

## Reglas

- Siempre la fuente oficial primaria. Anota URL exacta y fecha de consulta en el encabezado del script.
- Descarga desde R hacia `datos/crudos/`; nunca edites a mano un archivo crudo.
- Antes de usar un paquete nuevo, verifica que esté en CRAN y regístralo con `renv::snapshot()`.
- Si una URL cambió o una descarga falla, no inventes datos: deja la falla escrita en la bitácora y avisa a James.

## Fuentes clave para migración en Cali y el Valle (verificar la URL vigente antes de usar)

| Tema | Fuente | Cómo |
| --- | --- | --- |
| Mercado laboral, informalidad, ingresos, condición migratoria | DANE, Gran Encuesta Integrada de Hogares (GEIH), microdatos en el catálogo ANDA | Descarga de microdatos; leer con `haven` o `readr`; usar factores de expansión |
| Población migrante | DANE, Encuesta Pulso de la Migración y proyecciones de población | Microdatos ANDA o anexos en Excel con `readxl` |
| Flujos y stock de migrantes venezolanos, Estatuto Temporal de Protección | Migración Colombia; datos abiertos en datos.gov.co | `RSocrata` para conjuntos en datos.gov.co |
| PIB departamental y por actividad | DANE, Cuentas departamentales | Anexos en Excel con `readxl` |
| Precios | DANE, IPC por ciudades (Cali) | Anexos en Excel |
| Tasas, TRM, remesas | Banco de la República, series estadísticas | Descarga de series; `readxl` o `readr` |
| Delitos | Policía Nacional (SIEDCO) en datos.gov.co | `RSocrata` |
| Indicadores territoriales | DNP, TerriData | Descarga de archivos |
| Comparaciones internacionales | Banco Mundial | Paquete `WDI` |

## Documentación obligatoria

Por cada base procesada, añade a `datos/procesados/diccionario.md`: nombre del archivo, fuente, URL, fecha de consulta, periodo, cobertura, unidad de observación, variables con descripción y unidad, y advertencias (cambios de metodología, por ejemplo el rediseño de la GEIH en 2021 con el marco del censo 2018).
