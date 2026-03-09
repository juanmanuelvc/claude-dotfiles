---
name: context-mgmt
description: Usa esta skill cuando el contexto esté al 60%+, necesites hacer /clear o /compact, vayas a cambiar de tarea, o quieras delegar trabajo a sub-agentes para preservar el contexto principal.
---

# Gestión de Contexto

## Cuándo Actuar

| Señal                                     | Acción recomendada                          |
|-------------------------------------------|---------------------------------------------|
| Contexto al ~60% en tarea compleja        | `/handoff` + `/compact` o `/clear`          |
| Cambio de tarea o dominio significativo   | `/handoff` + `/clear`                       |
| Tarea de exploración independiente        | Delegar a agente Explore (contexto fresco)  |
| Proceso largo a monitorizar               | Lanzar como background agent                |
| Instrucciones que se repiten en prompts   | Mover a Skill o comando slash               |
| CLAUDE.md > 200 líneas                    | Dividir secciones en Skills específicas     |

## Flujo de Handoff

Antes de limpiar contexto, ejecutar `/handoff` para generar `scratchpad/handoff-FECHA.md`.

El fichero de handoff debe contener:
1. Objetivo de la sesión
2. Cambios realizados (ficheros + resumen)
3. Estado actual (qué funciona / qué no / qué falta)
4. Decisiones de diseño tomadas y su razonamiento
5. Próximos pasos ordenados por prioridad
6. Contexto crítico que no debe perderse

Después: `/compact` (conserva resumen) o `/clear` (contexto limpio).

## Uso de Sub-agentes para Preservar Contexto

Delegar a agentes especializados cuando:
- La tarea es exploración/investigación sin modificar código.
- Se necesitan múltiples búsquedas paralelas en el codebase.
- Se quiere aislar una tarea larga del contexto principal.

**Tipos de agentes disponibles:**
- `Explore` — exploración de codebase, búsqueda de ficheros y código.
- `general-purpose` — investigación, búsquedas complejas, tareas multi-paso.
- `Plan` — diseño de arquitectura y planificación de implementación.

**Cuándo NO usar sub-agentes:**
- Tareas de 1-3 pasos simples y directos.
- Cuando ya tienes el contexto necesario en el hilo principal.
- Para evitar duplicar trabajo que ya se está haciendo.

## Principios de Context Engineering

1. **Plug el contexto más relevante, reduce el ruido.**
   - Las instrucciones en CLAUDE.md deben ser pocas y no contradictorias.
   - Información específica de dominio → Skills (carga bajo demanda).
   - Prompts repetidos → comandos slash.

2. **Un contexto fresco rinde mejor en tareas complejas.**
   - Compactar antes de una tarea difícil nueva.
   - No acumular conversaciones largas de exploración antes de implementar.

3. **Los sub-agentes tienen contexto propio aislado.**
   - Son ideales para exploración donde los resultados pueden ser grandes.
   - El agente padre recibe solo el resumen final, no todos los pasos intermedios.

## Estructura de scratchpad/

```
scratchpad/
├── handoff-2025-01-15.md   # Handoffs de sesión
├── handoff-2025-01-16.md
└── notas-arquitectura.md   # Notas temporales de trabajo
```

`scratchpad/` debe estar en `.gitignore` — es espacio de trabajo temporal, no artefacto del proyecto.
