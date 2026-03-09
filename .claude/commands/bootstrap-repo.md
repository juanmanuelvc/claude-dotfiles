---
description: Explora el repositorio y genera documentación de onboarding en docs/repo-overview.md
---

Lanza agentes Explore en paralelo para analizar este repositorio en profundidad.
Usa thoroughness level "very thorough" en todos los agentes Explore.

Una vez completada la exploración, genera `docs/repo-overview.md` con:

1. **Propósito**: qué hace el proyecto en 2-3 frases directas.
2. **Arquitectura**: diagrama ASCII de los módulos principales y sus relaciones.
3. **Stack tecnológico**: lenguajes, frameworks, librerías clave y sus versiones (extraídas de package.json, pyproject.toml, go.mod, etc.).
4. **Entry points**: ficheros principales de inicio, configuración y bootstrapping.
5. **Flujo de datos**: cómo fluye la información de extremo a extremo (input → procesamiento → output).
6. **Convenciones detectadas**: patrones de nombrado, estructura de directorios, estilo de código observado.
7. **Tests**: cómo se ejecutan, qué frameworks se usan, cobertura aproximada si es detectable.
8. **Scripts disponibles**: comandos de desarrollo, build, deploy detectados en package.json/Makefile/etc.
9. **TODO/FIXME detectados**: listado de deuda técnica encontrada en el código.
10. **Dependencias externas**: servicios, APIs o sistemas externos requeridos.

Crea el directorio `docs/` si no existe.
El fichero debe ser autocontenido: alguien nuevo debe poder entender el proyecto solo leyéndolo.
