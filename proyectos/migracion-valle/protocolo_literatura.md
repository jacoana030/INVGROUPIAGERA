# Protocolo de revisión de literatura: migración y economía de Cali y el Valle

**Responsable:** James (Director) · Camilo (lectura) · 24 de noviembre de 2026

## Aristas a cubrir
Empleo y desempleo, salarios, informalidad, participación laboral femenina, PIB y productividad, comercio y empresas, finanzas públicas, servicios sociales (salud y educación), precios y vivienda, seguridad y crimen, actitudes y política. Para cada una: evidencia nacional y evidencia específica para Cali, su área metropolitana y el Valle del Cauca.

## Términos
Español: migración venezolana, migrantes venezolanos, mercado laboral, salarios, informalidad, delito, Cali, Valle del Cauca, Permiso Especial de Permanencia (PEP), Estatuto Temporal de Protección (ETPV).
Inglés: Venezuelan migration, Venezuelan exodus, forced migration, Colombia, labor market, wages, informality, crime, fiscal, regularization, amnesty.

## Inclusión
- Periodo de publicación 2015 a 2026; migración desde Venezuela hacia Colombia (o comparaciones útiles con Perú, Ecuador, Chile).
- Documentos con método empírico (cuantitativo o cualitativo sistemático) o revisiones sistemáticas.
- Artículos arbitrados, documentos de trabajo de instituciones reconocidas (Banco de la República, Banco Mundial, BID, FMI, NBER, IZA, universidades), informes oficiales. Tesis de posgrado solo si estudian Cali o el Valle.

## Exclusión
Opinión sin datos, duplicados, documentos sin autor, temas ajenos (historia de Venezuela, derecho constitucional general, comunicación sin vínculo económico), migración distinta a la venezolana salvo que aporte método.

## Embudo
1. Búsqueda OpenAlex (`R/lit_01_busqueda_openalex.R`): 105 documentos.
2. Cribado por código y por título (`R/lit_02_cribado.R`): incluir, dudoso o excluir con razón.
3. Búsqueda complementaria dirigida: literatura canónica que OpenAlex no trajo (Banco de la República, Banco Mundial, BID, revistas de primer nivel) y documentos sobre Cali y el Valle.
4. Lectura a fondo solo de resumen, datos, método y resultados de los incluidos; ficha por documento.
