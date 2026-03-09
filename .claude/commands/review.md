---
description: Revisa los cambios no commiteados (git diff HEAD) buscando bugs, edge cases y problemas de calidad
---

Ejecuta `git diff HEAD` y revisa todos los cambios no commiteados con `ultrathink`.

Busca y reporta:

1. **Bugs potenciales** — clasifícalos por severidad:
   - P1 (crítico): puede causar corrupción de datos, crash o fallo de seguridad.
   - P2 (importante): comportamiento incorrecto en casos normales.
   - P3 (menor): comportamiento incorrecto solo en edge cases raros.

2. **Edge cases no cubiertos** — entradas inesperadas, estados límite, concurrencia.

3. **Problemas de rendimiento** — complejidad algorítmica obvia, N+1 queries, bloqueos innecesarios.

4. **Violaciones de convenciones** — nombrado, estructura, estilo detectado en el proyecto.

5. **Tests ausentes** — lógica nueva sin cobertura de test.

6. **Regresiones potenciales** — cambios que podrían romper funcionalidad existente no testada.

7. **Problemas de seguridad** — inyección, exposición de datos sensibles, validación de entrada.

**Reglas de reporte:**
- Indicar fichero y número de línea para cada hallazgo.
- Ser directo y específico; sin reportes vagos.
- Si no estás seguro de que algo sea un problema, indicarlo explícitamente como "posible".
- No reportes falsos positivos por precaución; la calidad importa más que la cantidad.
- Si no hay problemas relevantes, decirlo claramente: "No se detectaron problemas significativos."
