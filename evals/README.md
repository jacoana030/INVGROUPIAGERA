# Casos de prueba

Cada agente tiene casos con respuesta conocida. Se corren cada vez que cambia un manual de rol o una skill.

Formato de `evals/casos.csv`: `id,agente,tarea,respuesta_esperada,fuente_respuesta,tipo_evaluador,notas`

- `tipo_evaluador`: `codigo` (comparación exacta), `rubrica` (un modelo califica de 0 a 1) o `humano` (Jacobo).
- Meta inicial: 20 casos, tomados de fallas reales de los primeros proyectos.
- Rúbrica de productos: exactitud de cifras, exactitud de citas, completitud, calidad de fuentes y eficiencia. Se aprueba con 0,8 o más.
