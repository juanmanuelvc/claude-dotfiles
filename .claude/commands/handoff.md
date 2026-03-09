---
description: Genera un resumen de la sesión actual antes de hacer /clear o /compact
---

Antes de cerrar el contexto, genera un fichero `scratchpad/handoff-$ARGUMENTS.md` (si no se pasa argumento, usa la fecha actual en formato YYYY-MM-DD) con el siguiente contenido:

1. **Objetivo de la sesión**: qué se intentaba conseguir y por qué.
2. **Cambios realizados**: lista de ficheros modificados con resumen de cada cambio.
3. **Estado actual**: qué funciona, qué no, qué falta por hacer.
4. **Decisiones tomadas**: decisiones de diseño importantes y su razonamiento.
5. **Próximos pasos**: tareas pendientes ordenadas por prioridad (P1/P2/P3).
6. **Contexto crítico**: cualquier dato, constraint o detalle que sería doloroso perder.
7. **Comandos útiles**: comandos específicos del proyecto para retomar el trabajo.

Formato: markdown limpio. Sé conciso pero no omitas nada crítico.
Crea el directorio `scratchpad/` si no existe. Añade `scratchpad/` al `.gitignore` si no está ya.
