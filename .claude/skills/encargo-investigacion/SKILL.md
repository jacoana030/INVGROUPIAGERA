---
name: encargo-investigacion
description: Plantilla de encargo de investigación con criterios de calidad y elección de estrategia de identificación causal (DiD, IV, control sintético, estudio de eventos, RD). Úsala al iniciar un proyecto o una fase nueva, antes de delegar trabajo.
---

# Encargo de investigación

Banana (directora) escribe el encargo en `proyectos/<proyecto>/encargo.md` antes de delegar. Un encargo bueno permite que Camilo, James y Jacobo (agente) trabajen sin preguntar.

## Plantilla

```
# Encargo: <título>
Solicitado por: Jacobo (gestor) · <fecha>     Responsable: Banana
Fase: <n>     Estado: borrador | aprobado por Jacobo (fecha)

## 1. Pregunta
Pregunta causal en una frase: efecto de <tratamiento> sobre <resultado> en <población>, <lugar>, <periodo>.
Por qué importa (política pública, vacío en la literatura: citar fichas).

## 2. Estimando
Parámetro (ATE, ATT, LATE, elasticidad), población objetivo y unidad de análisis.

## 3. Estrategia de identificación
Diseño elegido (ver tabla), supuesto clave en palabras simples, cómo se pondrá a prueba
y amenazas principales con su respuesta.

## 4. Datos
Fuente oficial, periodo, unidad, variables de resultado y de tratamiento, tamaño de muestra
esperado (medido, no supuesto), cambios de metodología. Remitir a skills geih o datos-colombia.

## 5. Productos intermedios y responsables
| Producto | Agente | Ruta | Límite de esfuerzo | Fecha |

## 6. Criterios de calidad (lista de abajo) y criterio de salida
## 7. Lo que el proyecto NO hará
## 8. Costo estimado (bajo, medio, alto) y tope diario
## 9. Producto final: menú de opciones para Jacobo (pendiente de su elección)
```

## Elegir la estrategia de identificación

| Diseño | Cuándo sirve | Supuesto clave | Pruebas obligatorias | Paquete R |
| --- | --- | --- | --- | --- |
| Diferencias en diferencias (DiD) | Un choque afecta a unas unidades más que a otras (ciudades con más o menos migrantes) | Tendencias paralelas sin el choque | Gráfico de tendencias previas; estudio de eventos con coeficientes previos ≈ 0; placebo con fecha falsa | `fixest` |
| DiD escalonado | Las unidades se tratan en fechas distintas | Paralelas por cohorte; sin anticipación | Usar Callaway y Sant'Anna o Sun y Abraham, no TWFE simple (sesgo por efectos heterogéneos) | `did`, `fixest::sunab` |
| Variables instrumentales (IV) | El tratamiento es endógeno (los migrantes eligen ciudades con mejores empleos) | Relevancia y exclusión | F de primera etapa (> 10, mejor efectivo de Montiel Olea–Pflueger); argumentar exclusión; para shift-share, pruebas de Goldsmith-Pinkham, Sorkin y Swift o Borusyak, Hull y Jaravel | `fixest` |
| Instrumento de enclave (shift-share) | Migración: asentamientos previos predicen dónde llegan los nuevos | Participaciones base exógenas a choques futuros de demanda | Correlación de participaciones base con tendencias previas del resultado; excluir la ciudad propia del flujo | `fixest` |
| Control sintético | Una sola unidad tratada (Cali) y pocas de control | El sintético reproduce el periodo previo | Ajuste previo (RMSPE); placebos en el espacio y en el tiempo; inferencia por permutación | `Synth`; `tidysynth` si está en CRAN (verificar) |
| Estudio de eventos | Fecha de choque clara (cierre de frontera 2015, oleada 2017-2018, ETPV 2021) | Sin anticipación; paralelas | Coeficientes previos; ventana declarada antes de mirar resultados | `fixest::i()` |
| Regresión discontinua (RD) | Regla con umbral (edad, fecha de llegada para el PEP o ETPV) | Sin manipulación en el umbral | Prueba de densidad; covariables balanceadas; varios anchos de banda | `rdrobust` |

Si ningún diseño es creíble, el proyecto se presenta como descriptivo y lo dice en el título y el resumen.

## Criterios de calidad

1. La pregunta es causal y el estimando está escrito antes de ver datos.
2. El tamaño de muestra se midió (por ejemplo con la plantilla 02 de `geih`) antes de aprobar el diseño.
3. La estrategia nombra su supuesto clave y al menos dos pruebas que podrían refutarlo.
4. Se reporta inferencia adecuada al número de conglomerados (con menos de 30, inferencia por aleatorización o bootstrap salvaje además de errores agrupados).
5. Resultados principales y de robustez definidos de antemano; cambios posteriores se anotan en la bitácora.
6. Validez externa: qué parte del resultado aplica a Cali y qué no.
7. Toda cifra del producto tiene fila aprobada en `registro/verificacion_cifras.csv`.
8. Se comparan los resultados con la literatura (fichas de Camilo) y se explica cualquier diferencia.
