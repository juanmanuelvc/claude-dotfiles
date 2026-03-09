---
name: git-workflow
description: Usa esta skill para operaciones de git: crear ramas, commits semánticos, PRs, resolución de conflictos, gestión de tags, cherry-pick, rebase o cualquier flujo de trabajo con git.
---

# Git Workflow

## Convención de Commits (Conventional Commits)

| Tipo       | Cuándo usarlo                                      |
|------------|----------------------------------------------------|
| `feat`     | Nueva funcionalidad visible para el usuario        |
| `fix`      | Corrección de bug                                  |
| `chore`    | Mantenimiento: deps, configs, sin cambio funcional |
| `docs`     | Solo documentación                                 |
| `refactor` | Reestructuración sin cambio de comportamiento      |
| `test`     | Añadir o modificar tests                           |
| `perf`     | Mejora de rendimiento                              |
| `ci`       | Cambios en pipelines de CI/CD                      |
| `revert`   | Revertir un commit anterior                        |

**Formato:** `tipo(scope opcional): descripción en imperativo, presente`
**Ejemplos:**
```
feat(auth): add OAuth2 login with GitHub
fix(api): handle null response from external service
chore(deps): upgrade eslint to v9
docs(readme): add development setup instructions
```

**Reglas:**
- Descripción en minúscula, sin punto final.
- Máximo 72 caracteres en la primera línea.
- Cuerpo opcional tras línea en blanco para explicar el "por qué".
- `BREAKING CHANGE:` en el footer si hay rotura de API.

## Flujo de Ramas

```
main (protegida)
 ├── feat/descripción-corta
 ├── fix/descripción-corta
 └── chore/descripción-corta
```

**Pasos para una feature:**
```bash
git checkout main && git pull origin main
git checkout -b feat/mi-feature
# ... desarrollo ...
git add <ficheros específicos>
git commit -m "feat(scope): descripción"
git push -u origin feat/mi-feature
# Crear PR en GitHub/GitLab
```

## Checklist Pre-Commit

1. `git diff --staged` — revisar exactamente qué se commitea.
2. Tests pasando: ejecutar suite relevante.
3. Sin ficheros de debug, logs o credenciales staged.
4. Sin `console.log`, `print()`, `debugger` olvidados.
5. Sin ficheros `.env`, `*.key`, `*.pem` en el stage.

## Resolución de Conflictos

```bash
# Ver ficheros en conflicto
git status

# Tras resolver manualmente cada fichero:
git add <fichero-resuelto>
git commit  # sin -m, git genera mensaje de merge

# Abortar si es necesario
git merge --abort
git rebase --abort
```

**Regla:** En caso de duda sobre cómo resolver un conflicto, preguntar al usuario antes de decidir qué código mantener.

## Operaciones Peligrosas — Siempre Confirmar

| Comando                    | Riesgo                              |
|----------------------------|-------------------------------------|
| `git push --force`         | Sobreescribe historia remota        |
| `git reset --hard`         | Pierde cambios no commiteados       |
| `git clean -fd`            | Elimina ficheros no trackeados      |
| `git checkout -- .`        | Descarta todos los cambios locales  |
| `git branch -D <rama>`     | Elimina rama aunque no esté merged  |

**Preferir alternativas seguras:**
- `git push --force-with-lease` en lugar de `--force`
- `git stash` en lugar de `reset --hard` para trabajo en progreso
- `git restore --staged` para des-stagear sin perder cambios

## Tags y Releases

```bash
# Tag semántico
git tag -a v1.2.3 -m "Release v1.2.3: descripción breve"
git push origin v1.2.3

# Listar tags
git tag -l "v*" --sort=-version:refname | head -10
```

## Comandos de Diagnóstico Útiles

```bash
# Historia visual compacta
git log --oneline --graph --decorate -20

# Qué rama tiene un commit
git branch --contains <hash>

# Buscar en historia por texto
git log -S "texto buscado" --oneline

# Ver cambios de un commit específico
git show <hash> --stat

# Comparar rama actual con main
git diff main...HEAD --stat
```
