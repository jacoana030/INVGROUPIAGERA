# Mapa de evidencia, vacíos y preguntas de investigación

**James (Director)** · 24 de noviembre de 2026 · Documento interno de trabajo, no es el producto final.

Insumos: `literatura/sintesis_aristas.md` (Camilo), `literatura/matriz_literatura.csv` (57 documentos, 35 fichas), `datos/inventario_fuentes_cali_valle.md` (Banana). Las magnitudes no se repiten aquí: viven en la síntesis y en `registro/verificacion_cifras.csv`, donde Jacobo (agente) las verifica.

## 1. Mapa de evidencia por arista

| Arista | Evidencia nacional | Métodos dominantes | Evidencia para Cali o el Valle | Datos públicos para cerrar el vacío en Cali |
| --- | --- | --- | --- | --- |
| Salarios | Alta: signo negativo consistente, magnitud muy dispersa | IV de redes/enclave, shift-share, distancia a la frontera | Ninguna cuantitativa | GEIH (Cali A.M. es dominio) |
| Empleo y participación | Alta: empleo nativo casi sin cambio, ajuste por participación | Igual que salarios | Solo cualitativa | GEIH |
| Informalidad | Media-alta: crece el segmento informal; interacción con el salario mínimo | Exposición espacial, DiD | Solo encuestas de ONG y cualitativa | GEIH |
| Género | Media-alta: cae la participación de nativas poco calificadas | IV, Bartik | Cualitativa (discriminación) | GEIH |
| Regularización (PEP/ETPV) | Alta en calidad: efecto agregado nulo en empleo formal | DiD por intensidad, IV | Solo encuesta de ONG | EPM (incluye Cali); ETPV solo departamental |
| Precios y vivienda | Media-baja: suben no transables y arriendos | Panel de ciudades | Cualitativa (vivienda autoconstruida) | IPC por ciudad del DANE (por verificar) |
| Seguridad | Media, solo frontera | DiD/IV en municipios fronterizos | Percepciones; un experimento de lista en tesis | Sin SIEDCO con nacionalidad; Fiscalía con país de nacimiento |
| Actitudes y voto | Media | Shift-share, conjoint | Tesis con experimento en Cali | Resultados electorales (Registraduría) |
| PIB y productividad | Baja | DiD continuo por industria | Ninguna | Cuentas departamentales (solo 32 unidades) |
| Finanzas públicas | Media-baja, con supuestos | Contabilidad de costos, equilibrio general | Ninguna | Faltan gastos por nacionalidad |
| Salud y educación | Media | Distancia a puntos de entrada | Ninguna causal | BDUA y SIMAT sin desagregación municipal abierta |
| Empresas y comercio | Baja | IV de enclave con aduanas | Descriptiva (13 negocios) | Sin datos de firmas públicos por municipio |

## 2. Lectura del director

1. **El vacío dominante es geográfico, no temático.** La literatura nacional sobre mercado laboral es abundante y de buena calidad, pero ningún estudio reporta un efecto causal para Cali o el Valle. Los estimadores nacionales son promedios entre ciudades y la literatura muestra que el efecto cambia con la informalidad inicial y con la estructura productiva, dos rasgos en que Cali se diferencia de Bogotá, Barranquilla o Cúcuta.
2. **La dispersión de magnitudes es una oportunidad.** Las estimaciones salariales van de nulas a fuertemente negativas según medición de la exposición, periodo y método. Un trabajo que reporte efectos heterogéneos por ciudad, con Cali como caso, aporta a ese debate y no solo al contexto local.
3. **La factibilidad manda.** Con datos públicos, la única fuente con resolución en Cali A.M., grupo de comparación de nativos y serie larga es la GEIH. PIB, finanzas, empresas y seguridad para Cali no tienen datos abiertos con nacionalidad o con escala municipal, así que hoy no son viables sin solicitudes de datos.
4. **Riesgos.** (a) Pocos migrantes por mes en una sola ciudad: hay que medir tamaños de muestra y coeficientes de variación antes de comprometerse. (b) Cambio de marco de la GEIH en 2021 y choque del COVID-19 en 2020. (c) Las cifras de la síntesis vienen de resúmenes y aún se están verificando.

## 3. Preguntas de investigación candidatas

**P1 (recomendada). ¿Cuánto y por qué canal afectó la migración venezolana los salarios, la informalidad y la participación laboral de los trabajadores nativos de Cali, y en qué difiere ese efecto del promedio de las demás áreas metropolitanas?**
- Valor: primera estimación causal para Cali; aporta al debate sobre la heterogeneidad (informalidad inicial, salario mínimo).
- Diseño: panel de 23 áreas metropolitanas con GEIH 2013 a 2024, instrumento shift-share con la distribución previa de nacidos en Venezuela (CNPV 2005 o GEIH previa a 2015), estudio de eventos con intensidad continua y heterogeneidad por informalidad inicial; control sintético para Cali A.M. como robustez.
- Datos: públicos (GEIH, CNPV). Viabilidad alta, sujeta al chequeo de tamaño de muestra.

**P2. ¿La regularización (PEP y Estatuto Temporal de Protección) redujo la informalidad de los migrantes en Cali y cambió su efecto sobre los nativos?**
- Valor: la evaluación existente es nacional y anterior al ETPV.
- Diseño: diferencias en diferencias por elegibilidad (fecha de llegada) con GEIH y EPM.
- Riesgo: la GEIH no siempre identifica el estatus; el ETPV solo es público por departamento.

**P3. ¿Qué efecto tuvo la migración sobre los arriendos y el costo de vida en Cali?**
- Valor: arista con poca evidencia y alta relevancia local; los estudios nacionales sugieren presión sobre no transables y arriendos.
- Diseño: panel de ciudades con el IPC del DANE (arriendos y no transables) e instrumento de exposición.
- Riesgo: el IPC mide arriendos formales; la vivienda informal de los migrantes queda fuera.

**P4. ¿Aumentó la migración el delito en Cali o solo la percepción de inseguridad?**
- Valor: alta atención pública y evidencia causal solo de frontera.
- Riesgo: sin datos abiertos de delitos totales con nacionalidad; quedaría en categorías parciales o requeriría solicitud a la Policía.

**Recomendación:** P1, con P2 como extensión natural del mismo montaje de datos. Antes de fase 2, Banana debe medir el tamaño de muestra de migrantes en Cali A.M. en la GEIH; si es insuficiente, se cambia a Cali más Valle o a un diseño por grupos de ciudades.

## 4. Pendientes

- Leer completa `mondragon2026` (único estudio con experimento en Cali).
- Buscar de nuevo los documentos regionales no hallados (Banco de la República seccional Cali, Cámara de Comercio de Cali, Alcaldía, Universidad del Valle, Banco Mundial 2018, Fedesarrollo).
- Habilitar desde R el acceso a dane.gov.co y datos.gov.co (bloqueado en el entorno en la nube) para correr `R/dat_01_inventario.R`.
- Decidir si se excluye `internews2022` (sin autores individuales) o se usa solo como contexto.
