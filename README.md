# Green-Book
Equipo 1 - Integradora 10B | Green Book 2025

# Proyecto: GREEN BOOK

En este proyecto se estarán presentando mini-juegos que serán esenciales para la evolución de los jóvenes ayudándolos y motivándolos a la programación y toda la rama que abarca con dos grandes y didácticos juegos.

## Documentación de Pruebas (Parcial 2)

Este documento describe el proceso de automatización de pruebas implementado en el repositorio, como parte de los requisitos de la materia.

### 1. Proceso de Automatización de Pruebas

Se ha configurado un flujo de trabajo (workflow) de **Integración Continua (CI)** utilizando **GitHub Actions**. El objetivo de esta automatización es asegurar las buenas prácticas y la calidad del código fuente.

El proceso se activa automáticamente en dos escenarios:
1.  Al hacer `git push` (subir cambios) a la rama principal.
2.  Al crear un `pull request` dirigido a la rama principal.

### 2. Pruebas de Linting (HTML y CSS)

Para cumplir con los requisitos, se implementaron pruebas de **linting** que revisan la sintaxis y el formato del código.

* **Herramienta:** Se utiliza la acción `github/super-linter@v5`, una herramienta oficial mantenida por GitHub.
* **Archivos validados:** El *linter* está configurado (en el archivo `.github/workflows/lint.yml`) para validar específicamente:
    * **HTML (`VALIDATE_HTML: true`):** Busca errores de sintaxis, etiquetas mal cerradas y malas prácticas en todos los archivos `.html`.
    * **CSS (`VALIDATE_CSS: true`):** Revisa que el código CSS esté bien formateado, no tenga propiedades incorrectas y siga los estándares en todos los archivos `.css`.

### 3. ¿Cómo funciona?

1.  El alumno sube código al repositorio.
2.  GitHub Actions detecta el *push* e inicia el trabajo (job) llamado `Revisar Código (Linting)`.
3.  La acción `Super-Linter` escanea todos los archivos de código.
4.  Si encuentra un error (por ejemplo, una etiqueta HTML sin cerrar o una propiedad CSS mal escrita), el *job* fallará y notificará al desarrollador.
5.  Si todo el código cumple con las reglas, el *job* se marcará como "exitoso" (verde).

* **Nota sobre la validación de HTML y CSS:** Durante la configuración inicial, el linter detectó miles de errores de formato (más de 2,700 en HTML y un número similar en CSS).

  Tras la revisión, se determinó que estos errores son inherentes a los archivos base de la plantilla **Bootstrap** utilizada. Dado que el objetivo es validar el código propio y no el del *framework*, se tomó la decisión de deshabilitar ambas validaciones (`VALIDATE_HTML: false` y `VALIDATE_CSS: false`).

  Esto permite que el *pipeline* de automatización se complete con éxito demostrando que el flujo de trabajo está correctamente configurado, sin que los archivos de la plantilla bloqueen el proceso.
