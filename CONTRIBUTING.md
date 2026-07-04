# Contribuir a github_actions-runner

Gracias por interesarte en el proyecto.

## Antes de empezar

1. Revisá [README.md](README.md) y el orden de instalación de módulos.
2. **No commitees secretos**: tokens GitHub, kubeconfig, `credentials/`.

## Cómo reportar bugs

1. Buscá si ya existe un [issue](https://github.com/ghcetraro/github_actions_runner/issues) similar.
2. Abrí uno nuevo con:
   - Versión / commit
   - Configuración relevante (**sin secretos**)
   - Comportamiento esperado vs actual

Para vulnerabilidades, seguí [SECURITY.md](SECURITY.md).

## Pull requests

1. Fork del repo y branch desde `main`:
   ```bash
   git checkout -b feature/mi-cambio
   ```
2. Cambios acotados y commits claros en español o inglés.
3. Verificá localmente:
   ```bash
   cd infra/cert-manager && terraform validate
   ```
4. Actualizá README.md y CHANGELOG.md si cambiás comportamiento.
5. Abrí el PR describiendo el **por qué** del cambio.

## Estilo

- Terraform formateado; manifiestos YAML validados
- Respetar numeración de carpetas en `infra/`

## Releases

Versiones etiquetadas (`v1.0.0`, …) documentadas en [CHANGELOG.md](CHANGELOG.md).

## Preguntas

Abrí un issue con etiqueta `question`.
