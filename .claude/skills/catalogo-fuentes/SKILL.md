---
name: catalogo-fuentes
description: Catálogo de fuentes oficiales y de organismos con URL para estadísticas de Colombia, Cali y el Valle, y la regla "cifra-fuente-fecha" para citar cualquier número. Úsalo para saber a qué fuente primaria ir al verificar o descargar una cifra.
---

# Catálogo de fuentes oficiales y regla cifra-fuente-fecha

## La regla cifra-fuente-fecha

Ninguna cifra viaja sola. En cualquier archivo del grupo, cada número va con:

1. **Cifra:** valor, unidad (personas, miles, %, pesos corrientes o constantes con año base) y cobertura (Cali municipio, Cali A.M., Valle, nacional).
2. **Fuente:** entidad, nombre de la operación o documento, y tabla, cuadro o página. URL estable (no la de un buscador).
3. **Fecha:** periodo de referencia del dato (mes, trimestre móvil, año; preliminar o definitivo) **y** fecha de consulta.

Forma corta en el texto: `9,8 % (DANE, Cuentas departamentales, boletín 2025pr, cuadro 1; 2025p; consultado 2026-11-24)`. En el registro, una fila de `registro/verificacion_cifras.csv` con esos campos. Si falta cualquiera de los tres elementos, la cifra queda `rechazada` hasta completarse.

Reglas adicionales: preferir el dato más reciente **definitivo** y decir si es preliminar; no mezclar periodos ni coberturas en una misma comparación; una cifra calculada por el grupo dice "cálculo propio con base en <fuente>" y deja el cálculo escrito en la nota.

## Catálogo

URL de portada o catálogo; la ruta exacta del archivo se anota en cada fila del registro. "Verificar" = la URL no se ha comprobado desde el grupo; comprobarla la primera vez y quitar la marca.

### Estadística oficial (primer nivel)

| Tema | Entidad y operación | URL |
| --- | --- | --- |
| Microdatos (GEIH, ECV, EPM, CNPV) | DANE, catálogo ANDA | https://microdatos.dane.gov.co/index.php/catalog |
| Mercado laboral | DANE, GEIH: boletines y anexos | https://www.dane.gov.co/index.php/estadisticas-por-tema/mercado-laboral/empleo-y-desempleo (verificar) |
| Informalidad | DANE, GEIH: informalidad | https://www.dane.gov.co/index.php/estadisticas-por-tema/mercado-laboral/empleo-informal-y-seguridad-social (verificar) |
| Migración (encuesta) | DANE, Encuesta Pulso de la Migración | https://www.dane.gov.co/index.php/estadisticas-por-tema/demografia-y-poblacion/encuesta-pulso-de-la-migracion-epm |
| Migración (sistema) | DANE, SIEM y geovisor | https://geoportal.dane.gov.co/geovisores/sociedad/estadisticas-migracion/ |
| Población | DANE, proyecciones de población | https://www.dane.gov.co/index.php/estadisticas-por-tema/demografia-y-poblacion/proyecciones-de-poblacion (verificar) |
| PIB departamental | DANE, Cuentas departamentales | https://www.dane.gov.co/index.php/estadisticas-por-tema/cuentas-nacionales/cuentas-nacionales-departamentales |
| Precios | DANE, IPC (incluye Cali) | https://www.dane.gov.co/index.php/estadisticas-por-tema/precios-y-costos/indice-de-precios-al-consumidor-ipc (verificar) |
| Pobreza | DANE, pobreza monetaria y multidimensional | https://www.dane.gov.co/index.php/estadisticas-por-tema/pobreza-y-condiciones-de-vida (verificar) |
| Series macro y financieras | Banco de la República, estadísticas | https://www.banrep.gov.co/es/estadisticas (verificar) |
| Migrantes venezolanos | Migración Colombia, Observatorio OM3 | https://www.migracioncolombia.gov.co/planeacion-y-estadistica/observatorio-om3/dinamicas-migratorias/venezolanos-en-colombia |
| Datos abiertos | Portal datos.gov.co (API SODA) | https://www.datos.gov.co |
| Indicadores territoriales | DNP, TerriData | https://terridata.dnp.gov.co (verificar) |
| Salud de migrantes | Minsalud, boletines de población migrante | https://www.minsalud.gov.co |
| Educación | MEN, SIMAT / SINEB | https://portalsineb.mineducacion.gov.co |
| Cali | Alcaldía de Santiago de Cali, datos abiertos | https://datos.cali.gov.co |

Detalle por fuente para Cali y el Valle (cobertura, identificador de migrantes, limitaciones): `datos/inventario_fuentes_cali_valle.md`. Cómo descargar con R: skill `datos-colombia`. Variables de la GEIH: skill `geih`.

### Organismos internacionales (segundo nivel)

| Entidad | Uso | URL |
| --- | --- | --- |
| Banco Mundial, WDI | Comparaciones internacionales (paquete `WDI`) | https://data.worldbank.org |
| R4V / GIFMM | Cifras de la respuesta humanitaria; no son estadística oficial de población | https://www.r4v.info |
| BID, CEPAL, OIT (ILOSTAT) | Comparaciones regionales y definiciones | https://www.iadb.org · https://www.cepal.org · https://ilostat.ilo.org |

### Solo contexto (nunca para cifras de un producto)

Prensa, Cali Cómo Vamos (percepción; su encuesta sí puede usarse como fuente primaria de percepción si se cita como tal), comunicados sin documento técnico.
