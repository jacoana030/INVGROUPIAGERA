---
name: ficha-articulo
description: Ficha estándar por artículo y lista de revistas, series de documentos de trabajo y repositorios prioritarios para economía colombiana (Desarrollo y Sociedad, Lecturas de Economía, Borradores de Economía, NBER, Fedesarrollo, entre otros). Úsala al buscar fuentes académicas y al fichar cada documento.
---

# Ficha por artículo y fuentes académicas prioritarias

Complementa a `revision-literatura` (el embudo de búsqueda); esta skill fija **dónde buscar primero** y **cómo se ficha**.

## Ficha estándar

Archivo `literatura/fichas/<apellido><año>.md` (si hay dos del mismo autor y año, añadir a, b). Nada se inventa: lo que no está en el documento se escribe "no reportado".

```
# <Apellido> (<año>): <título corto>

**Referencia (APA 7):**
**DOI o URL estable:**                 **Tipo:** artículo arbitrado | documento de trabajo | informe oficial | tesis
**Revista o serie:**                   **Nivel de la fuente:** A | B | C (tabla de abajo)
**Pregunta:**
**Datos:** fuente, periodo, unidad de análisis, región, tamaño de muestra
**Tratamiento y resultado:** cómo miden la migración y la variable de resultado
**Estrategia de identificación:** diseño (DiD, IV, shift-share, control sintético, RD, descriptivo) y supuesto clave
**Pruebas de validez que reportan:** tendencias previas, F de primera etapa, placebos, etc.
**Resultado principal:** magnitud, unidad, error estándar o IC, significancia (copiar la tabla y página)
**Heterogeneidad:** por sexo, edad, informalidad, ciudad
**Resultados para Cali o el Valle:** sí/no y cuáles
**Limitaciones (según autores y según el grupo):**
**Calidad (1 a 5) y por qué:** 5 = arbitrado de alto nivel con identificación creíble; 1 = descriptivo sin método claro
**Uso para el grupo:** qué aporta a la pregunta del proyecto y a qué arista
**Cifras citables:** cifra · página/tabla (pasan a Jacobo (agente) antes de usarse)
**Fichado por:** Camilo · <fecha> · lectura: resumen | secciones | completa
```

Y una fila en `literatura/matriz_literatura.csv` con las columnas existentes.

## Fuentes prioritarias

Buscar en este orden. Nivel A = arbitrado o serie institucional reconocida; B = serie universitaria o de centro de pensamiento con revisión interna; C = informe oficial o de organismo (útil para datos, no para causalidad).

### Revistas colombianas y latinoamericanas (A)

| Revista | Editor |
| --- | --- |
| Desarrollo y Sociedad | Universidad de los Andes |
| Lecturas de Economía | Universidad de Antioquia |
| Ensayos sobre Política Económica (ESPE) | Banco de la República |
| Cuadernos de Economía | Universidad Nacional de Colombia |
| Revista de Economía del Rosario | Universidad del Rosario |
| Coyuntura Económica | Fedesarrollo |
| Sociedad y Economía | Universidad del Valle (homenaje GERA: revisar siempre para Cali y el Valle) |
| Economía (LACEA) y Latin American Economic Review | LACEA / CIDE |

### Revistas internacionales (A)

Journal of Development Economics, World Development, Journal of Human Resources, Journal of Labor Economics, Labour Economics, Journal of Population Economics, Journal of Urban Economics, American Economic Journal: Applied Economics, Economic Development and Cultural Change, IZA Journal of Development and Migration.

### Series de documentos de trabajo (A o B)

| Serie | Institución | Dónde |
| --- | --- | --- |
| Borradores de Economía | Banco de la República | https://www.banrep.gov.co/es/borradores-economia · repositorio https://repositorio.banrep.gov.co |
| Documentos de Trabajo sobre Economía Regional y Urbana (CEER) | Banco de la República (Cartagena) | repositorio del Banco |
| NBER Working Papers | NBER | https://www.nber.org/papers |
| Documentos CEDE | Universidad de los Andes | IDEAS/RePEc |
| Documentos de trabajo / Coyuntura | Fedesarrollo | https://www.repository.fedesarrollo.org.co |
| Policy Research Working Papers | Banco Mundial | https://openknowledge.worldbank.org |
| IDB Working Papers | BID | https://publications.iadb.org |
| IZA Discussion Papers | IZA | https://www.iza.org/publications/dp |
| Archivos de Economía | DNP | https://www.dnp.gov.co |
| Documentos de trabajo | Facultad de Ciencias Sociales y Económicas, Universidad del Valle | IDEAS/RePEc o repositorio Univalle (verificar) |

### Buscadores

OpenAlex (con `R/lit_01_busqueda_openalex.R`), IDEAS/RePEc (https://ideas.repec.org), Google Scholar para rastrear citas, y SciELO/Redalyc para revistas latinoamericanas. Las URL marcadas aquí se verifican la primera vez que se usan; si una falla, se anota en la bitácora y se corrige esta tabla.

### Lo que no cuenta como evidencia

Prensa (solo contexto), blogs, sitios sin autor, presentaciones sin documento de respaldo, y cifras de segunda mano sin fuente primaria.
