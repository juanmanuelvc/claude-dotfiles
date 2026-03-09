# Instrucciones Globales — claude-dotfiles

## Identidad del Repositorio
- Repositorio de dotfiles y configuración reutilizable para Claude Code.
- Contiene plantillas de CLAUDE.md, comandos slash, skills y hooks.
- Objetivo: acelerar el onboarding en nuevos proyectos personales.

## Estilo de Código
- Código explícito sobre cleverness. Legibilidad primero.
- Tipos y anotaciones siempre que el lenguaje lo permita.
- Nombres descriptivos; evitar abreviaturas opacas.
- Tests junto a la implementación, no como afterthought.
- Sin comentarios obvios; solo donde la lógica no sea autoevidente.

## Convenciones de Commits (Conventional Commits)
- `feat`: nueva funcionalidad
- `fix`: corrección de bug
- `chore`: mantenimiento (deps, configs, sin cambio de comportamiento)
- `docs`: solo documentación
- `refactor`: sin cambio de comportamiento observable
- `test`: añadir o modificar tests

Formato: `tipo(scope): descripción en imperativo`
Ejemplo: `feat(hooks): add PostToolUse auto-format hook`

## Flujo de Ramas
- Crear siempre desde `main` actualizado.
- Nombre: `tipo/descripción-corta` — ej. `feat/git-workflow-skill`
- Un PR por feature/fix. Squash merge a main.

## Comportamiento del Agente
- Pregunta antes de cambios grandes, destructivos o irreversibles.
- Usa `ultrathink` para tareas complejas o revisión de cambios propios.
- Cuando el contexto llegue al 60% en tarea compleja, avisar antes de continuar.
- Prefiero explicaciones en español.
- No añadas funcionalidades no solicitadas ni sobre-ingenierices.
- Ante errores, muestra la causa raíz antes de proponer un fix.

## Gestión del Contexto
- Si la tarea es de exploración independiente, delegarla a un agente Explore.
- Si las instrucciones se repiten, moverlas a una Skill o comando slash.
- Si CLAUDE.md supera ~200 líneas, dividir en Skills específicas.
- Procesos largos: lanzar como background agent.
- Revisión de código propio: usar `ultrathink`.

## Skills Disponibles
<!-- El agente lee los SKILL.md bajo demanda según relevancia -->
- `skills/git-workflow/SKILL.md` — flujo git, commits semánticos, PRs
- `skills/context-mgmt/SKILL.md` — gestión de contexto y handoffs
- `skills/code-review/SKILL.md` — revisión de código y checklist de calidad
