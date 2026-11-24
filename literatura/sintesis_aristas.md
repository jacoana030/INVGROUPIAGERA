# Síntesis por arista: migración venezolana y economía de Cali y el Valle del Cauca

Camilo, 24 de noviembre de 2026. Insumos: `literatura/matriz_literatura.csv` (57 filas), `literatura/fichas/` (35 fichas) y `literatura/referencias.bib`.

**Advertencia de lectura.** Casi todas las cifras provienen del resumen que publica el editor, el repositorio o IDEAS/RePEc. No se leyó el texto completo de ningún documento, por eso las cifras llevan "resumen" en lugar de número de página, salvo cuando la fuente permitió ver la página. Jacobo (agente) debe contrastar cada cifra contra el texto completo antes de que llegue a un producto. Las referencias se citan por el identificador de la matriz (`id`), que coincide con el nombre de la ficha.

## Panorama

- Hay evidencia causal abundante a escala nacional, sobre todo de mercado laboral, y muy poca para Cali o el Valle.
- Para Cali solo hay estudios cualitativos o descriptivos de muestra pequeña y un experimento de lista dentro de una tesis. No encontré ningún estimador causal con resultados para Cali ni para el Valle del Cauca.
- No pude verificar la existencia de varias obras que el encargo pedía buscar: el informe del Banco Mundial de 2018 (la página de la biblioteca digital y el comunicado fallaron al abrirse), los informes de Fedesarrollo (solo hallé notas de prensa, que no cuentan como evidencia), y documentos de la Cámara de Comercio de Cali, la Alcaldía, la seccional Cali del Banco de la República, Proyecto Migración Venezuela y el GIFMM. Quedan como pendientes de búsqueda.

## 1. Empleo y desempleo (calificación de la evidencia: alta en volumen y calidad nacional; baja para Cali)

**(a) Qué se sabe.** Los estudios con identificación usan instrumentos de redes de migrantes por región (tipo shift-share o Bartik), la distancia a la frontera o diferencias en diferencias por intensidad departamental.
- `bonillamejia2024` (Bartik): la migración eleva el desempleo de los migrantes y no tiene efecto significativo sobre el desempleo de los no migrantes, porque reduce su participación laboral. En el borrador 1119 de la versión previa, +1 pp en la cuota venezolana eleva cerca de 1,15 pp la probabilidad de desempleo de los inmigrantes (resumen no técnico).
- `lebow2022`: el efecto sobre el empleo nativo es casi nulo (resumen).
- `penaloza2022`: -0,1 pp en la tasa de empleo de poco calificados por cada pp de aumento de oferta (resumen).
- `santamaria2022`: efectos nulos precisos sobre empleo, formal e informal (resumen).
- `imf2020`: localidades con más migrantes no muestran peor empleo (informe de país).

**(b) Desacuerdos.** `bonillamejia2024` encuentra pérdidas concentradas en cuenta propia, mujeres, jóvenes y poco calificados; `santamaria2022` y `imf2020` no encuentran efecto agregado. La diferencia aparente se explica en parte por cómo se mide la exposición (índice de búsquedas en internet frente a registros administrativos en `santamaria2022`) y por la margen de ajuste (participación frente a desempleo).

**(c) Cali y el Valle.** Solo cualitativo: en Cali predominan empleos informales y precarios que confinan a los venezolanos, y solo 7 de 20 mujeres calificadas tienen empleo acorde con su formación (`roa2025`, pp. 352 y 358). El informe de Internews reporta 8,8% de empleo formal y 63,64% de informalidad entre 327 encuestados en Cali (`internews2022`, p. 19 para el gráfico y p. 20 para el texto) [corregida por Jacobo (agente)]; ese documento no nombra autores individuales y es solo contexto. Falta una estimación causal por ciudad o área metropolitana.

## 2. Salarios (alta; baja para Cali)

**(a)** Consenso en el signo, no en la magnitud: efecto negativo sobre el salario de los nativos, concentrado en informales y poco calificados.
- `caruso2021` (IV): +1 pp de inmigración reduce 10 pp el salario del sector informal urbano (resumen).
- `lebow2022`: -1,05% por pp de cuota migrante, y -0,59% con tendencias regionales (resumen).
- `penaloza2022`: -0,4% por pp de oferta (resumen).
- `lebow2024`: el degradamiento ocupacional de migrantes educados agrava en 30% el efecto negativo para nativos sin secundaria completa (80% con ajuste de capital a largo plazo; resumen).

**(b) Desacuerdos.** La magnitud va de -10 pp (`caruso2021`, solo sector informal urbano) a nulo (`santamaria2022`). `lebow2022` atribuye gran parte de la dispersión a omitir migrantes en la medición, lo que sesga al alza el efecto. `delgado2022` añade el canal de sustitución formal-informal.

**(c) Cali y el Valle.** Nada cuantitativo. `jimenez2023` reporta pagos cercanos al mínimo de 2022 y contratos verbales en 13 negocios de la comuna 6 (p. 21), con muestra de 19 venezolanos.

## 3. Informalidad (media-alta; baja para Cali)

**(a)** `delgado2022` (variación espacial en exposición): el salario cae en el sector informal y el empleo formal nativo cae donde el salario mínimo obliga; la informalidad sube sobre todo en pequeñas firmas. `prieto2024` (diferencias en diferencias, 2015-2018): se expande el segmento informal sin aumento significativo de su participación en el empleo total. `lebow2022`: los efectos salariales son mayores en ciudades con más informalidad inicial.

**(b)** Hay tensión entre un aumento del número de informales y la ausencia de cambio en la participación; depende de la definición de informalidad (`prieto2024`).

**(c)** Para Cali: 63,64% de informalidad entre migrantes encuestados (`internews2022`, p. 19, etiqueta de gráfico) [corregida por Jacobo (agente)] frente a 48% de informalidad en Cali en febrero-abril de 2022 según DANE, cifra citada en ese informe (p. 20) y que Jacobo (agente) debe verificar en la fuente primaria. `jimenez2023` y `chaves2024` describen economías étnicas y emprendimiento de subsistencia sin estimar efectos sobre nativos.

## 4. Género y participación laboral femenina (media-alta; baja para Cali)

**(a)** `pedrazzi2022` (IV) y `otero2022` (Bartik) coinciden: cae la participación de mujeres nativas poco calificadas; sube para las muy calificadas con hijos (+1,6 pp en `otero2022`, resumen), con menor costo del servicio doméstico como mecanismo en `pedrazzi2022`. `moyano2021` (descriptivo, GEIH 2014-2019, 555.208 mujeres) documenta que las venezolanas tienen probabilidad de empleo similar pero menores ingresos y más precariedad (p. 2).

**(b)** `otero2022` no encuentra más tercerización del trabajo doméstico, mientras que `pedrazzi2022` sí.

**(c)** `roa2025` documenta discriminación por nacionalidad y género en Cali; `rincon2022` describe el tránsito de mujeres por Cali. Sin estimaciones causales locales.

## 5. PIB, productividad y macroeconomía (baja-media)

**(a)** `benitez2023` (diferencias en diferencias continuo con reapertura de la frontera): +1 pp de cuota migrante por industria sube 7,6% la productividad laboral, por menor empleo y horas y no por más producto (resumen). `tribin2020` caracteriza efectos macro y `hamann2021` modela la respuesta monetaria; ninguno estima PIB regional.

**(b)** El aumento de productividad por menor empleo contrasta con la lectura de ganancia de producto; la interpretación depende de la composición por habilidades.

**(c)** Nada para el PIB del Valle. Falta una estimación con cuentas departamentales del DANE.

## 6. Empresas y comercio (baja)

**(a)** `lombardo2021` (IV de enclave, aduanas 2013-2019): mejora el desempeño exportador de manufactureras, mayor en firmas que exportaban poco; los salarios de obreros bajan (resumen, truncado). **(c)** `jimenez2023`: 13 negocios de la comuna 6 de Cali, con 50-60% de trabajadores venezolanos (p. 20). Sin evidencia sobre firmas del Valle.

## 7. Finanzas públicas (media-baja)

**(a)** `melo2020`: costo de salud, educación y primera infancia de 0,12% del PIB en 2017-2019 según el gobierno nacional y proyecciones de 0,19% a 0,42% del PIB para 2020-2022 (resumen del registro). `valencia2020` (modelo de equilibrio general): déficit de corto plazo y dividendo fiscal de largo plazo, resultado de simulación y no de identificación. `mesa2021` no se pudo leer. **(b)** Los resultados dependen de supuestos de servicios y de cobertura. **(c)** `melo2020` estudia Bogotá, Barranquilla, Medellín y Cartagena; no hay estudio fiscal de Cali ni del Valle.

## 8. Salud y educación (media; baja para Cali)

**(a)** `ibanez2021` (distancia a puntos de entrada, 2012-2018): +1 desviación estándar del flujo predicho eleva 0,22 casos de varicela y 0,23 de tuberculosis por 100.000; cifras tomadas de una reseña, no del artículo. `rozo2020`: aumenta la matrícula de venezolanos, baja la promoción y sube la deserción (resumen). `urbina2023`: los elegibles al PEP tuvieron mejor acceso a salud durante la pandemia (resumen). **(c)** `internews2022`: 91,4% de los irregulares y 26,1% de los regulares sin cobertura en salud entre los encuestados (p. 26-27). Faltan estudios de educación y salud en Cali.

## 9. Precios y vivienda (media-baja; baja para Cali)

**(a)** `daly2021`: +1 pp en la tasa migratoria eleva 0,913% los precios no transables. `forero2022`: un aumento de 1% en la proporción de inmigrantes sube los arriendos cerca de 1,25% en las principales ciudades (unidad por confirmar). **(c)** `orozco2024`: en Cali las viviendas autoconstruidas se adaptan rápido a la demanda con sobreocupación y allegamiento (20 entrevistas totales para Cali y Barcelona). Falta un efecto sobre arriendos de Cali.

## 10. Seguridad y crimen (media; baja para Cali)

**(a)** `knight2023`: los homicidios suben cerca de la frontera por víctimas venezolanas, sin efecto significativo sobre víctimas colombianas; los arrestos no suben. `rey2025` no se pudo leer (solo título). **(b)** La relación se limita a municipios fronterizos; no se debe extrapolar a ciudades grandes. **(c)** `roa2025` (p. 366) no halla vínculo entre migrantes calificadas e inseguridad en Cali, solo percepciones de entrevistadas. `mondragon2026` incluye un experimento de lista en Cali sobre la creencia de que los migrantes aumentan la inseguridad; resultado no visto en el resumen. Falta análisis de delitos en Cali con datos de la Policía.

## 11. Actitudes y política (media; baja para Cali)

**(a)** `rozo2021` (instrumento tipo enclave): solo la migración internacional aumenta la participación política y mueve el voto de izquierda a derecha. `valencia2026` (shift-share): menor apoyo a la redistribución y giro a la derecha. `allen2023` (conjoint, N = 2.508): los colombianos prefieren políticas con algunas o ninguna restricción al acceso laboral y a la salud de los venezolanos [corregida por Jacobo (agente)]. El resumen no dice "abiertas" sin restricciones. **(c)** `pardo2020`, `quintero2020` y `mondragon2026` (experimento de lista en Cali); sin resultados cuantitativos visibles.

## 12. Regularización (alta en calidad, media en volumen)

**(a)** `bahar2021` (diferencias en diferencias por intensidad departamental y tres IV): efectos insignificantes sobre el empleo formal en conjunto, negativos para colombianos muy educados y mujeres, positivos para venezolanos (resumen). `ibanez2025` y `urbina2023` evalúan bienestar y resiliencia de elegibles. **(b)** El resultado nulo agregado esconde efectos de composición. **(c)** En Cali, `internews2022` reporta 29,1% con PPT y 14,7% con PEP entre 327 encuestados (p. 17). Falta evaluación de la regularización con datos regionales.

## Vacíos prioritarios para Cali y el Valle

1. Ninguna estimación causal de efectos laborales, de precios o de seguridad con resultados para Cali o el Valle.
2. Ningún estudio de PIB, empresas o finanzas locales.
3. Evidencia cualitativa con muestras de 3 a 30 personas; no extrapolable.
4. Documentos regionales no hallados: Banco de la República (seccional Cali), Cámara de Comercio de Cali, Alcaldía, Universidad del Valle (solo un artículo en revista), GIFMM.
5. Pendiente de lectura completa: `mondragon2026` (el único con trabajo de campo en Cali y diseño causal parcial).
