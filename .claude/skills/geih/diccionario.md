# Diccionario de trabajo de la GEIH

Estado: **borrador del 2026-11-25, sin verificar contra el ANDA.** El entorno no tuvo acceso a dane.gov.co desde R en la fase 1. Cada fila marcada "verificar" se confirma con el diccionario oficial del año antes de usarla, y se anota aquí la fecha y el año revisados.

## 1. Marcos y periodos

| Periodo | Marco muestral y proyecciones | Qué cambia | Consecuencia práctica |
| --- | --- | --- | --- |
| 2006–2020 | Marco del Censo 2005 | Cuestionario original de la GEIH; archivos separados por Cabecera, Resto y Área | Factor histórico `fex_c_2011` (verificar nombre por año) |
| 2020 (abr–jul aprox.) | Igual, recolección telefónica por la pandemia | Cuestionario reducido; algunos módulos no se recogieron | Excluir o tratar aparte; no usar como periodo "pre" o "post" sin prueba de robustez |
| 2021 en adelante | Marco del CNPV 2018 y nuevo cuestionario | Cambian nombres de preguntas (por ejemplo sexo y nivel educativo), módulos reorganizados y módulo de migración rediseñado | Factor `FEX_C18` (verificar); el DANE publicó series reponderadas hacia atrás con proyecciones del CNPV 2018 (verificar años cubiertos) |

Decisión por defecto para la fase 2: usar el periodo más largo con factores comparables (series reponderadas del DANE) y, si el módulo de migración no es comparable entre marcos, estimar 2015–2019 y 2021–2025 por separado o incluir efectos fijos de marco. Banana aprueba la decisión en el encargo.

## 2. Módulos y llaves de unión

Llaves de persona: `DIRECTORIO`, `SECUENCIA_P`, `ORDEN`. Llaves de hogar: `DIRECTORIO`, `SECUENCIA_P`. Algunos años traen además `HOGAR`. Unir siempre por todas las llaves que compartan los dos archivos y comprobar que el número de filas no cambia (`stopifnot(nrow(despues) == nrow(antes))`).

| Contenido | Marco 2005 (nombre típico del archivo) | Marco 2018 (nombre típico del archivo) |
| --- | --- | --- |
| Personas: edad, sexo, parentesco, educación, salud | Características generales (Personas) | Características generales, seguridad social en salud y educación |
| Condición de actividad | Fuerza de trabajo | Fuerza de trabajo |
| Ocupados: ingresos, horas, posición, pensión | Ocupados | Ocupados |
| Desocupados / no ocupados | Desocupados | No ocupados |
| Inactivos | Inactivos | (dentro de No ocupados o Fuerza de trabajo; verificar) |
| Vivienda y hogar | Vivienda y Hogares | Datos del hogar y la vivienda |
| Otros ingresos | Otros ingresos | Otros ingresos e impuestos |
| Migración | Migración | Migración |

## 3. Variables clave (verificar cada una en el año usado)

| Concepto | Marco 2005 | Marco 2018 | Notas |
| --- | --- | --- | --- |
| Mes y año | `MES`, `AÑO` o del nombre del archivo | `MES`, `PERIODO` | |
| Ciudad / área metropolitana | `AREA` | `AREA` | Código DIVIPOLA del departamento de la capital: Cali A.M. = `76` |
| Departamento | `DPTO` | `DPTO` | Valle del Cauca = `76` |
| Clase (cabecera/resto) | `CLASE` | `CLASE` | 1 = cabecera |
| Factor de expansión | `fex_c_2011` | `FEX_C18` | Mensual; dividir al apilar |
| Sexo | `P6020` | `P3271` | 1 = hombre, 2 = mujer (verificar) |
| Edad | `P6040` | `P6040` | Años cumplidos |
| Parentesco con el jefe | `P6050` | `P6050` | |
| Nivel educativo | `P6210` | `P3042` | Categorías distintas entre marcos: construir años de educación con una tabla de equivalencia propia |
| Ocupado | `OCI` | `OCI` | 1 si ocupado |
| Desocupado | `DSI` | `DSI` | 1 si desocupado |
| Inactivo / fuera de la fuerza de trabajo | `INI` | `FFT` | Verificar |
| Población en edad de trabajar | `PET` | `PET` | 15+ en marco 2018 (antes 12+ urbano y 10+ rural): homogeneizar a 15+ en toda la serie |
| Ingreso laboral mensual | `INGLABO` | `INGLABO` | Imputado por el DANE; pesos corrientes |
| Salario antes de descuentos | `P6500` | `P6500` | Asalariados |
| Horas trabajadas a la semana | `P6800` | `P6800` | Para salario por hora |
| Posición ocupacional | `P6430` | `P6430` | Asalariado, cuenta propia, patrón, etc. |
| Cotiza a pensión | `P6920` | `P6920` | Base de la informalidad por seguridad social |
| Afiliado a salud | `P6090` | `P6090` | |
| Tamaño de la empresa | `P6870` | `P6870` | Base de la informalidad por tamaño |
| Rama de actividad | `RAMA2D` (CIIU Rev. 3) | `RAMA2D_R4` (CIIU Rev. 4) | Las ramas no son comparables sin correlativa |
| Oficio | `OFICIO` (CIUO-68) | `OFICIO_C8` (CIUO-08 A.C.) | Idem |

### Indicadores derivados

- **Tasa de ocupación** = ocupados / PET; **desempleo** = desocupados / fuerza de trabajo; **participación** = fuerza de trabajo / PET. Todo ponderado.
- **Salario real por hora** = `INGLABO` / (`P6800` × 4,33), deflactado con el IPC de Cali (DANE) a pesos de un año base declarado. Recortar el 1 % superior e inferior por ciudad-año y decirlo.
- **Informalidad:** reportar dos definiciones. (a) Seguridad social: ocupado que no cotiza a pensión (`P6920` distinto de "sí"; excluir pensionados). (b) DANE por tamaño de empresa (hasta 5 trabajadores, con sus excepciones de profesionales independientes y trabajo doméstico). Verificar cuál es la definición oficial vigente del DANE en el boletín de informalidad más reciente y citarla.

## 4. Identificación de migrantes

| Concepto | Marco 2005 (módulo desde 2012 aprox.) | Marco 2018 | Verificar |
| --- | --- | --- | --- |
| Lugar de nacimiento (este municipio, otro municipio, otro país) | `P756` | `P3373` | Sí |
| País de nacimiento | `P756S3` | `P3373S3` | Sí; código de Venezuela según la tabla de países del año |
| Dónde vivía hace 5 años | `P755` (y país en `P755S3`) | `P3376`/`P3377` aprox. | Sí, nombres inciertos |
| Dónde vivía hace 12 meses | `P753` (y país en `P753S3`) | `P3374`/`P3375` aprox. | Sí, nombres inciertos |

Definiciones del grupo (escoger una por proyecto y mantenerla):

1. **Nacido en Venezuela:** país de nacimiento = Venezuela. Incluye retornados con doble nacionalidad nacidos allá; es la definición más usada en la literatura (Caruso et al., Lebow) y la más estable.
2. **Migrante reciente:** vivía en Venezuela hace 12 meses (o hace 5 años). Pierde a quien llegó antes; útil para flujos.
3. **Nativo (grupo de interés en la fase 2):** nacido en Colombia y sin residencia en Venezuela hace 5 años. Los colombianos retornados se excluyen del grupo de nativos y se analizan aparte.

## 5. Geografía

- 13 áreas metropolitanas principales + 10 ciudades intermedias = 23 ciudades. Cali A.M. incluye Cali y Yumbo.
- Códigos `AREA` de las 23 ciudades: tomarlos del diccionario del año y guardarlos en `datos/procesados/codigos_area_geih.csv` (una sola vez, con fecha de verificación).
- Representatividad: mensual para el total nacional y trimestral (móvil) para las 23 ciudades; para subgrupos como migrantes en una ciudad, medir el CV con la plantilla 02 antes de comprometer un diseño.

## 6. Problemas conocidos

- Composición: la llegada de migrantes cambia quién es "nativo ocupado"; usar resultados por persona en edad de trabajar, no solo entre ocupados.
- Ingresos imputados y ceros: documentar cuántos.
- Pocos conglomerados: con 23 ciudades, los errores agrupados por ciudad son poco confiables; reportar además inferencia por aleatorización o bootstrap salvaje si hay paquete CRAN disponible (verificar), y decirlo en la tabla.
