# Inventario de fuentes públicas: migración venezolana en Cali (A.M.) y el Valle del Cauca

**Autora:** Banana (Grupo GERA) · **Fecha de consulta:** 24 de noviembre de 2026 · **Proyecto:** `proyectos/migracion-valle` (punto 3 del encargo)

## Cómo se verificó y qué no se pudo

- Las páginas se leyeron con WebSearch/WebFetch (modo standard). Las cifras citadas están en `registro/verificacion_cifras.csv` con estado `pendiente` (ids V001 a V014).
- **Desde R no hubo acceso a la red:** el proxy del entorno rechazó `datos.gov.co`, `dane.gov.co` y `microdatos.dane.gov.co` (HTTP 403). `R/dat_01_inventario.R` quedó escrito pero falló; no se descargó nada a `datos/crudos/`. El catálogo de datos.gov.co sí se pudo leer con WebFetch (metadatos y 3 filas de muestra); las consultas agregadas (`sum`, `group`) dieron error del servidor. **Por eso no hay conteos reales del pre-registro ETPV para el Valle.**
- Lo marcado "no verificado" salió solo de resultados de búsqueda o de conocimiento previo, no de la página oficial.
- Los PDF de la GEIH 2024 y del catálogo de Cali (`planestadistico.cali.gov.co`) llegaron ilegibles (binarios); sus variables hay que revisarlas en el diccionario del ANDA.

## Tabla resumen

| # | Fuente (entidad) | Periodo / frecuencia | Unidad | Geografía mínima | Identifica migrantes | Acceso | Aristas |
|---|---|---|---|---|---|---|---|
| 1 | GEIH, módulo migración (DANE) | Mensual; módulo 2012-2021 documentado; 2022 en adelante por confirmar | Persona/hogar, encuesta | Cali A.M. (dominio de 23 ciudades), Valle como departamento (por confirmar en ficha) | Residencia hace 12 meses y hace 5 años en Venezuela; país de nacimiento | Microdatos libres en ANDA | Empleo, salarios, informalidad |
| 2 | Encuesta Pulso de la Migración, EPM (DANE) | 8 rondas, jul-2021 a may-jun 2025 | Persona/hogar migrante | 23 ciudades con A.M., **incluye Cali A.M.** | Toda la muestra es migrante (venezolanos y retornados de 15+ años) | Microdatos y anexos Excel libres | Empleo, ingresos, acceso a servicios, intención de permanencia |
| 3 | CNPV 2018 (DANE) | 2018, única vez | Persona | Municipio (microdatos); boletín solo departamento | Lugar de nacimiento; residencia hace 1 y 5 años | Redatam/microdatos libres | Línea de base de stock 2018 |
| 4 | SIEM y geovisor de migración (DANE) | 2018-2022 | Registros integrados | Departamental y municipal (según el documento) | Marca de migración en el Registro Estadístico Base de Población | Geovisor público; microdato por solicitud | Stock municipal por años |
| 5 | Cuentas departamentales y VAM (DANE) | Anual; VAM 2011-2022p según documento | Miles de millones de pesos | Valle (departamento); VAM municipal incluye Cali | No aplica | Excel libres | PIB, valor agregado por actividad |
| 6 | Proyecciones de población (DANE) | Anual | Personas | Municipal | Incluye componente migratorio (por verificar versión) | Excel libres | Denominador per cápita |
| 7 | Pre-registro ETPV, datos.gov.co `6eyy-q57b` (Migración Colombia) | Mensual desde 2021; últimos datos 2023-09-15 | Conteo por sexo, edad, departamento, mes | **Departamento** (divipola 76 = Valle) | Todos son venezolanos pre-registrados | API SODA libre | Stock regularizable, no municipal |
| 8 | Informes y OM3 (Migración Colombia) | Informes desde ene-2024; el último, 11-jun-2026 | PDF, estimaciones | Departamento y municipio (según metodología); cifras no leídas | Venezolanos regulares e irregulares (estimado) | PDF libres; datos por PQRS | Stock y flujo |
| 9 | RAMV 2018 | 2018, una vez | Persona | Departamento (publicado) | Todos | Solo resultados agregados (no verificado) | Línea de base de irregulares |
| 10 | SIMAT (MEN) | Anual; variable país de origen desde 2018 | Estudiante | Nacional (boletín); Cali (ETC) solo total | País de origen | Boletines libres; micro por solicitud | Educación |
| 11 | BDUA/ADRES y RIPS (Minsalud, SISPRO) | Afiliación a mar-2025; RIPS a nov-2024 | Afiliados, atenciones | Departamento (Valle sí); municipio en cubos SISPRO (no verificado) | Tipo de documento (PEP/PPT) | Boletín libre; cubos con registro | Salud, gasto público |
| 12 | SISBEN IV (DNP) | Desde 2021 | Persona | Municipal | Incluye extranjeros con permiso (nota de prensa DNP) | Base anonimizada por solicitud (no verificado) | Focalización social |
| 13 | PILA / UGPP / FILCO | Mensual | Cotizante | Municipio | No verificado | No verificado | Empleo formal |
| 14 | Datos de delitos (Policía, Fiscalía, Medicina Legal) en datos.gov.co | Variable | Evento | Municipio | Nacionalidad solo en conjuntos específicos | API SODA libre | Seguridad |
| 15 | Banco de la República (ICER, IMAE regional) | ICER anual; IMAE Valle por Javeriana Cali | Indicadores | Departamento | No | PDF/Excel libres | PIB regional, coyuntura |
| 16 | Datos Cali (Alcaldía), Cali Cómo Vamos, GIFMM/R4V | Variable | Variable | Cali / Valle | Variable | Libre en general | Contexto y servicios |

## Notas por fuente

### 1. GEIH (DANE)
- **URL:** catálogo https://microdatos.dane.gov.co (ANDA); páginas de migración, p. ej. https://www.dane.gov.co/files/investigaciones/boletines/ech/ech/presentacion-geih-migracion-2019-2020.pdf
- **Preguntas:** "¿hace 12 meses vivía en Venezuela?" y "¿hace 5 años vivía en Venezuela?" (documento DANE, V003). El SIEM documenta que el módulo de migración de la GEIH abarca 2014-2021 (V012). El dato "país de nacimiento" no apareció en el PDF leído: **verificar en el diccionario ANDA**.
- **Cali y Valle:** el boletín DANE solo desagrega Bogotá, Barranquilla y Cúcuta. El Tiempo atribuye 117.807 migrantes en Cali y Yumbo a la GEIH a julio de 2023 (V013, prensa, solo contexto). Cali A.M. es dominio de la GEIH, pero la **representatividad por estatus migratorio en una sola ciudad no está publicada**: hay que calcular coeficientes de variación con los factores de expansión antes de usarla.
- **Cambio de marco:** la GEIH pasó al marco del CNPV 2018 (rediseño 2021). Pendiente de verificar el empalme de las series de migración 2018-2021 contra 2022+; no se encontró nota oficial en esta consulta.
- **Limitaciones:** la pregunta capta a quien vivía en Venezuela hace 12 meses o 5 años, así que pierde a los llegados hace más tiempo; subregistro de irregulares; pocos casos por ciudad.
- **Arista:** empleo, salarios, informalidad. Es la fuente principal para identificación con diferencias en diferencias entre ciudades.
- **Acceso:** descarga libre. Más de 50 MB por mes, **no descargada en esta fase**.

### 2. Encuesta Pulso de la Migración (DANE)
- **URL:** https://www.dane.gov.co/index.php/estadisticas-por-tema/demografia-y-poblacion/encuesta-pulso-de-la-migracion-epm
- **Rondas:** 1 (jul-ago 2021), 2 (oct-nov 2021), 3 (ene-feb 2022), 4 (mar-abr 2022), 5 (jul 2023), 6 (ago-sep 2023), 7 (abr-may 2024), 8 (may-jun 2025). La página tiene etiquetas de fechas inconsistentes: confirmar en cada documento.
- **Cobertura:** 23 ciudades capitales con áreas metropolitanas; **incluye Cali A.M.** (V004, V005). Ronda 8: 7.532 personas completas, población de referencia 974.658.
- **Limitaciones:** entrevista telefónica; muestra solo de quienes tienen vocación de permanencia; las rondas 5 y 6 tienen muestras distintas (6.239 personas en la ronda 6, y las fichas dan 3.315 y 3.154 hogares); no hay grupo de comparación de no migrantes. La ronda 8 menciona al BID y al Banco Mundial como apoyo; verificar.
- **Arista:** condiciones laborales, ingresos, acceso a salud y educación del migrante en Cali.

### 3. CNPV 2018 (DANE)
- **URL:** https://www.dane.gov.co/files/investigaciones/poblacion/informes-estadisticas-sociodemograficas/2021-10-01-caracterizacion-migrantes-y-retornados-desde-venezuela-CNPV.2018.pdf
- Identifica migrantes por lugar de nacimiento y residencia hace 1 año y hace 5 años. El boletín da el Valle como porcentaje (5,3 % de los inmigrantes según residencia hace 5 años, V005) pero **no da conteos del Valle ni de Cali** (sí Bogotá 223.712, Atlántico 110.229, Antioquia 105.987, Norte de Santander 97.378).
- **Limitaciones:** foto de enero-marzo de 2018; el stock ha crecido mucho desde entonces. Omisión censal alta en Cali (prensa: El País, La República; no verificado).
- **Arista:** línea de base municipal para el instrumento de enclave (shift-share) y para ciudades de tratamiento.

### 4. SIEM y geovisor (DANE)
- **URL:** https://www.dane.gov.co/files/investigaciones/poblacion/migracion/Construccion-SIEM-2018-2022.pdf ; geovisor https://geoportal.dane.gov.co/geovisores/sociedad/estadisticas-migracion/
- Integra CNPV, registros de Migración Colombia, GEIH, ECV y EPM. Según el documento, permite información departamental y municipal, pero **no presenta una estimación de población venezolana por municipio** (V012). No se verificó qué publica el geovisor.

### 5. Cuentas departamentales y VAM (DANE)
- **URL:** https://www.dane.gov.co/index.php/estadisticas-por-tema/cuentas-nacionales/cuentas-nacionales-departamentales ; boletín https://www.dane.gov.co/files/operaciones/PIB/bol-PIBDep-2025pr.pdf
- PIB del Valle 2025 provisional: 180.903 miles de millones de pesos corrientes, cerca del 9,8 % del total (cálculo propio sobre la tabla 1; V001, V002). Año de referencia de volumen 2015.
- **VAM:** distribución descendente de valor agregado departamental con indicadores proxy (personal ocupado, matrículas, predial). El documento metodológico lista 2011-2022p; con rezago n-2 debería haber 2024p (el boletín 2025 la menciona para Cali). **Es un reparto, no una medición:** no sirve como variable de resultado municipal sin riesgo de circularidad. Además, está en pesos corrientes.
- También existe el ITAED (indicador trimestral de actividad económica departamental), que no se revisó en detalle.

### 6. Proyecciones de población (DANE)
- Sin revisión de página en esta consulta. **No verificado:** versión vigente, y si se ajustaron con el componente de migración venezolana tras el CNPV 2018.

### 7. Pre-registro ETPV en datos.gov.co (Migración Colombia)
- **URL:** https://www.datos.gov.co/resource/6eyy-q57b (API: `https://www.datos.gov.co/resource/6eyy-q57b.csv?$limit=...`)
- **Campos (verificados con 3 filas):** sexo, rango_edad, departamento_residencia, departamento_divipola, anio, mes, cantidad. Metadatos: actualizado en el portal el 18-may-2026, pero los datos se actualizaron por última vez el 15-sep-2023 (V014).
- **Limitación clave:** sin municipio y solo hasta septiembre de 2023; mide pre-registros, no PPT entregados ni personas presentes.
- **Otros conjuntos del catálogo:** visas a venezolanos (`yj6h-yjbu`, Cancillería, con "ciudad de domicilio"); migrantes afiliados con PEP en Norte de Santander (`j2u4-79za`, `38kb-azu8`) como ejemplo de lo que otras gobernaciones publican, **no hay equivalente verificado para Valle**.

### 8. Informes e OM3 (Migración Colombia)
- **URL:** https://www.migracioncolombia.gov.co/planeacion-y-estadistica/observatorio-om3/dinamicas-migratorias/venezolanos-en-colombia
- Hay 9 informes desde enero de 2024; el último, de caracterización y balance demográfico, se publicó el 11 de junio de 2026 (V010 en el CSV). **No se leyó el PDF**, así que no se sabe si trae cifras por municipio ni su corte.
- Migración Colombia responde por PQRS con anexos Excel de PPT autorizados y cédulas de extranjería (respuesta 184100, 1-jun-2026): el desglose municipal se puede pedir por esa vía.
- **Limitación:** los PPT autorizados no determinan la permanencia actual de sus titulares. Los irregulares son estimaciones.

### 9. RAMV 2018
- Resultado agregado conocido: 442.462 venezolanos registrados (Cancillería; **no verificado en esta consulta**, solo apareció como titular). El microdato no es público (no verificado).

### 10. SIMAT / MEN
- **URL:** boletín https://portalsineb.mineducacion.gov.co/1782/articles-412174_Boletin_grupos_poblacionales_2018_2023.pdf ; ficha Cali https://portalsineb.mineducacion.gov.co/1782/articles-412172_ETC_CALI.pdf
- País de origen desde 2018. Nacional: venezolanos 6,8 % de la matrícula en 2023 (V008). La ficha de Cali da matrícula total (341.361 en 2023, V009) **sin desagregar por nacionalidad**.
- La Alcaldía publica matrícula oficial y no oficial de Cali en CSV (https://datos.cali.gov.co/hu/dataset/?tags=Simat), sin desagregación por nacionalidad a la vista.
- **Arista:** presión sobre educación pública y gasto.

### 11. Salud: BDUA/ADRES y RIPS
- **URL:** https://www.minsalud.gov.co/sites/rid/Lists/BibliotecaDigital/RIDE/DE/PS/boletin-tecnico-poblacion-migrante-salud-colombia-poblacion-venezolana.pdf
- Marzo de 2025: 1.571.767 venezolanos afiliados en el país (93,6 % de los migrantes afiliados), 81,0 % en el subsidiado; en el Valle, 151.611 migrantes afiliados (9,0 %) (V006, V007). Atenciones 2024: 246.625 venezolanos atendidos. El boletín **no da municipio ni cifras de atenciones del Valle**.
- Dataset ADRES de BDUA subsidiado en datos.gov.co (`d7a5-cnra`) existe; **no se verificó si trae nacionalidad**.
- **Limitación:** el corte de afiliación y el de RIPS difieren.

### 12. SISBEN IV (DNP)
- Nota oficial del DNP: Sisbén IV amplía la inscripción a extranjeros con permiso (https://www.dnp.gov.co/Prensa_/Noticias/Paginas/poblacion-extranjera-y-vulnerable-podra-beneficiarse-del-sisben-IV-con-jornadas-masivas-de-solicitud-de-registro.aspx). No se verificó la base pública ni si publica nacionalidad por municipio.

### 13. PILA, UGPP, FILCO
- **No se encontró un dato abierto verificable de cotizantes extranjeros por municipio.** El informe de la UGPP sobre migrantes (julio de 2024) usa solo la GEIH, no la PILA (V011): 2.330.714 migrantes estimados, Bogotá 18,5 %, Antioquia 14,1 %, Atlántico 8,4 %; sin Valle ni Cali. Habría que solicitar a la UGPP o a Minsalud un tabulado por municipio. Marcado como solicitud, no como descarga.

### 14. Seguridad (Policía, Fiscalía, Medicina Legal)
Conjuntos de datos.gov.co con nacionalidad o país de nacimiento (verificados en el catálogo, con municipio):
- Policía: NNA víctimas de delitos (`8mcu-22np`), turistas víctimas (`p2r3-hbie`), aprehensiones de menores (`makj-p2yr`), capturas por delitos sexuales contra NNA (`6u2i-cstb`). Todos con nacionalidad.
- Fiscalía: Víctimas V3 (`hr73-zqjf`) con `pais_nacimiento`.
- Medicina Legal: desaparecidos (`8hqm-7fdt`) con país de nacimiento.
- **No se encontró el SIEDCO general de delitos con nacionalidad del victimario o la víctima** en esta consulta. Los conjuntos con nacionalidad cubren categorías de delito, no el total. No se puede medir el efecto de la migración sobre delitos totales con ellos, solo la participación de extranjeros en capturas o víctimas de esos delitos.

### 15. Banco de la República
- ICER Valle del Cauca (informes anuales; los PDF listados son 2010-2015) en https://www.banrep.gov.co ; IMAE regional del Valle lo publica la Javeriana Cali (https://www.javerianacali.edu.co/sites/default/files/2026-07/IMAE_VALLE_2026.pdf, no leído). **No verificado:** qué series actuales publica el Banco para el Valle.

### 16. Cali: datos locales y GIFMM/R4V
- Datos abiertos Cali (https://datos.cali.gov.co) y el catálogo de microdatos de la Alcaldía (https://planestadistico.cali.gov.co/amda): contenido no legible en esta consulta.
- R4V/GIFMM Valle: reportes situacionales y "pagers" de cifras (2021-2023) en r4v.info (PDF). Son estadísticas de la respuesta humanitaria, no de población total.
- Cali Cómo Vamos: existe la encuesta de percepción; no se verificó acceso a microdatos.
- La cifra de prensa de 84.000 venezolanos en Cali (El País, 20-jun-2022) no tiene corte ni fuente explícita: **no usar**.

## Qué preguntas permiten responder estos datos para Cali y el Valle, y cuáles no

**Sí permiten (con salvedades):**
1. **Efecto sobre el mercado laboral de Cali A.M.** (empleo, informalidad, salarios de nativos) con GEIH: estimación con diferencias en diferencias o instrumento de enclave contra otras ciudades, usando el CNPV 2018 como línea de base. El cuello de botella es la precisión del estatus migratorio en una sola ciudad; hay que medirla antes de comprometerse.
2. **Perfil y condiciones del migrante en Cali** frente a otras 22 ciudades (EPM, rondas 1 a 8): descriptivo, sin grupo de comparación de nativos.
3. **Peso del Valle en el stock y en el sistema de salud:** nivel departamental (CNPV, BDUA, ETPV).
4. **PIB departamental y composición sectorial del Valle** antes y después de la llegada: descriptivo; solo 32 departamentos para identificación.

**No permiten, o solo con solicitud de datos:**
1. **Efecto causal en el PIB de Cali o municipal:** el VAM es un reparto proxy, no una medición.
2. **Stock de venezolanos por municipio y año:** no hay serie pública municipal verificada (SIEM no la presenta; el pre-registro ETPV es departamental y llega a 2023). Habría que pedirla a Migración Colombia o DANE.
3. **Efecto fiscal** (ingresos de impuestos, gasto en salud y educación por migrante en Cali): faltan cifras municipales de gasto por nacionalidad. Salud y educación dan solo el nivel nacional o departamental.
4. **Empleo formal de migrantes por municipio (PILA):** sin acceso abierto verificado.
5. **Efecto sobre delitos totales:** los conjuntos con nacionalidad cubren solo categorías de delito, y no se verificó un SIEDCO con nacionalidad.
6. **Series empalmadas 2018-2025 de la GEIH** hasta confirmar la compatibilidad del módulo tras el cambio de marco.

**Pendiente antes de la fase 2:** cuando haya red hacia dane.gov.co y datos.gov.co desde R, correr `R/dat_01_inventario.R`, leer el diccionario ANDA de la GEIH 2022-2025 y medir tamaños de muestra de migrantes en Cali A.M. por mes.
