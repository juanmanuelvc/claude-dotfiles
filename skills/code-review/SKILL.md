---
name: code-review
description: Usa esta skill cuando necesites revisar código propio o ajeno: pull requests, diff de cambios, auditoría de calidad, búsqueda de bugs, o revisión de seguridad. También actívala al usar el comando /review.
---

# Code Review

## Proceso de Revisión

Siempre usar `ultrathink` al revisar cambios propios. El modelo debe actuar como revisor externo crítico.

### Orden de Revisión

1. **Correctitud funcional** — ¿hace lo que debe hacer?
2. **Seguridad** — ¿introduce vulnerabilidades?
3. **Edge cases** — ¿qué pasa con entradas inesperadas?
4. **Rendimiento** — ¿complejidad algorítmica razonable?
5. **Mantenibilidad** — ¿el código es comprensible?
6. **Tests** — ¿la lógica nueva está cubierta?
7. **Convenciones** — ¿sigue el estilo del proyecto?

## Checklist de Seguridad (OWASP Top 10)

- [ ] **Inyección** (SQL, comandos, LDAP): ¿se sanitizan entradas externas?
- [ ] **Autenticación rota**: ¿se valida sesión/token en cada endpoint protegido?
- [ ] **Exposición de datos**: ¿logs o respuestas exponen datos sensibles?
- [ ] **Control de acceso**: ¿se verifica autorización, no solo autenticación?
- [ ] **Configuración incorrecta**: ¿credenciales o secrets en el código?
- [ ] **Componentes vulnerables**: ¿dependencias con CVEs conocidos?
- [ ] **XSS**: ¿se escapa output en contextos HTML/JS?
- [ ] **Deserialización**: ¿se deserializan datos de fuentes no confiables?

## Clasificación de Hallazgos

| Severidad | Criterio                                                      | Acción                    |
|-----------|---------------------------------------------------------------|---------------------------|
| P1        | Corrupción de datos, crash, fallo de seguridad               | Bloquear merge, fix ahora |
| P2        | Comportamiento incorrecto en casos normales                   | Fix antes de merge        |
| P3        | Edge case raro, mejora de calidad, convención                 | Fix o ticket para después |
| Info      | Sugerencia, alternativa, observación sin impacto              | Opcional                  |

## Formato de Reporte

```
**[P1] Descripción concisa del problema**
- Fichero: `src/api/users.ts:42`
- Problema: [explicación clara del bug o riesgo]
- Impacto: [qué puede pasar si no se corrige]
- Sugerencia: [cómo arreglarlo, si es obvio]
```

## Patrones de Bug Comunes por Lenguaje

### JavaScript/TypeScript
- `== null` vs `=== null` (nullish coalescing)
- Promesas sin `await` o sin `.catch()`
- Mutación de estado en lugar de copias inmutables
- Closures en bucles (captura de variable por referencia)
- `parseInt` sin radix
- Tipos `any` que ocultan errores reales

### Python
- Argumentos mutables por defecto (`def f(lst=[])`)
- Excepciones demasiado amplias (`except Exception`)
- Variables no inicializadas en ramas de control
- f-strings con expresiones complejas sin escapar
- Recursos sin context manager (`with`)

### General
- División por cero sin guard
- Off-by-one en bucles e índices
- Comparaciones de flotantes con `==`
- Recursión sin caso base claro
- Deadlocks en código concurrente

## Auto-revisión — Preguntas Clave

Antes de proponer un cambio como terminado, responder:

1. ¿Si alguien más lee este código en 6 meses, lo entenderá sin contexto adicional?
2. ¿Qué pasa si el input es null/undefined/vacío/negativo/muy grande?
3. ¿Qué pasa si este código falla a mitad de ejecución? ¿Queda el sistema en estado inconsistente?
4. ¿Hay alguna condición de carrera si esto se ejecuta en paralelo?
5. ¿Estoy añadiendo complejidad que no era necesaria?
