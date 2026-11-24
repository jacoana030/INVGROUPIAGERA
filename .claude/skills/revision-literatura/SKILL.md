---
name: revision-literatura
description: Protocolo de revisión de literatura económica con cribado barato por código (OpenAlex) y lectura a fondo solo de lo relevante. Úsalo para armar un estado del arte o una matriz de literatura.
---

# Revisión de literatura en embudo

El objetivo es leer toda la literatura útil gastando el mínimo de tokens.

## 1. Protocolo escrito (antes de buscar)

En `proyectos/<proyecto>/protocolo_literatura.md` escribe:

- Pregunta o aristas a cubrir.
- Términos de búsqueda en español e inglés (por ejemplo: migración venezolana, Venezuelan migration, Colombia, Cali, Valle del Cauca, labor market, wages, informality, crime, GDP, fiscal).
- Criterios de inclusión: periodo, país o región, tipo de documento, que tenga método empírico o revisión sistemática.
- Criterios de exclusión: opinión sin datos, duplicados, documentos sin autor.

## 2. Búsqueda y cribado con código (cero tokens de lectura)

Usa `R/lit_01_busqueda_openalex.R` (paquete `openalexR`) para traer título, autores, año, revista, DOI, número de citas y resumen. Guarda el resultado en `literatura/busqueda_<fecha>.csv`. Complementa con búsquedas web en IDEAS/RePEc, Google Scholar y repositorios del Banco de la República, Banco Mundial y BID.

Cribado en dos pasos:

1. Filtro automático en R: año, idioma, palabras clave obligatorias en título o resumen, eliminación de duplicados por DOI.
2. Clasificación de títulos y resúmenes restantes en lotes de 30 (modelo haiku si se delega): `incluir`, `excluir` o `dudoso`, con una razón de una línea.

## 3. Lectura a fondo

Solo para `incluir` y `dudoso`. Extrae con `pdftools` el texto del resumen, datos, método, resultados y conclusiones; no leas el PDF completo salvo que sea indispensable.

## 4. Ficha por documento

`literatura/fichas/<apellido><año>.md`:

```
Referencia (APA 7):
Pregunta:
Datos (fuente, periodo, unidad de análisis, región):
Método y estrategia de identificación:
Resultado principal (con magnitud y significancia):
Resultados para Cali o el Valle (si los hay):
Limitaciones:
Calidad (1 a 5) y por qué:
```

Y una fila en `literatura/matriz_literatura.csv` con las mismas columnas en forma corta.

## 5. Síntesis

Agrupa por arista (por ejemplo empleo, salarios, informalidad, PIB y consumo, finanzas públicas, servicios sociales, seguridad). Para cada una: qué se sabe con buena evidencia, dónde hay desacuerdo y qué falta para Cali y el Valle. Esa lista de vacíos es la materia prima de la pregunta de investigación.
