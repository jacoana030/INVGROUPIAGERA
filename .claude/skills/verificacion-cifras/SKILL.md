---
name: verificacion-cifras
description: Procedimiento para verificar cada cifra y cita contra su fuente primaria y registrarla. Úsalo antes de que cualquier número o cita llegue a un producto del grupo.
---

# Verificación de cifras y citas

## Por cada cifra

1. Identifica la fuente primaria. Si la cifra viene de prensa o de otro artículo, rastrea la fuente original.
2. Compara: valor exacto, unidad (personas, miles, %, pesos corrientes o constantes), periodo (año, trimestre, trimestre móvil), cobertura (Cali, área metropolitana, Valle, nacional) y redacción (que el texto no diga más de lo que dice la fuente).
3. Registra una fila en `registro/verificacion_cifras.csv`.

## Por cada cita

Comprueba que el documento existe (DOI o URL), que autor y año coinciden, y que la afirmación atribuida aparece en el documento.

## Estados

- `verificada`: coincide en todo.
- `corregida`: la fuente existe pero el valor, periodo, unidad o redacción no coincidía; se anota el valor correcto.
- `rechazada`: no se encontró fuente primaria o la fuente no dice eso.
- `requiere_revision`: ambigüedad o fuentes oficiales en desacuerdo; se escala a James.

## Formato del registro

`id,producto,afirmacion,valor_reportado,valor_fuente,unidad,periodo,cobertura,fuente,url,fecha_consulta,estado,nota`
