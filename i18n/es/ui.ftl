# Texto de la interfaz (español): estructura del sitio, avisos, selector de idioma, carcasa del Studio.

## Site chrome
site-skip-link = Saltar al contenido
site-nav-primary = Principal
site-nav-missions = Misiones
site-nav-capabilities = Capacidades
site-nav-evidence = Evidencias
site-nav-research = Investigación
site-nav-developers = Desarrolladores
site-nav-docs = Documentación
site-nav-editions = Ediciones
site-nav-search = Buscar
site-nav-launch = Iniciar
site-nav-studio = { -brand } Studio
site-nav-home = Inicio de { -brand }
site-nav-theme = Cambiar entre el tema claro y el oscuro
site-version = v{ $version }

site-footer-tagline = Simulador de código abierto de resiliencia PNT (posicionamiento, navegación y temporización). No controla ningún equipo de radio y no transmite nada: su salida a nivel de señal son archivos de muestras IQ en banda base, y su receptor GNSS por software es una herramienta de análisis. No es un producto de vuelo.
site-footer-product = Producto
site-footer-company = Empresa
site-footer-benchmark = Referencia comparativa
site-footer-install = Instalación
site-footer-mcp = Servidor MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · de Ashforde® OÜ · AGPL-3.0, con opción de licencia comercial
site-footer-provenance = Cada gráfico se dibuja a partir de una ejecución registrada del motor v{ $version } e indica su escenario, su semilla y la ruta para reproducirlo.

## Language switcher
site-lang-label = Idioma
site-lang-switch-aria = Elija el idioma de esta página
site-lang-auto = Idioma del navegador
site-lang-remembered = Su elección se recuerda en este dispositivo.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } parte de esta página ha cambiado desde que se tradujo y se muestra en inglés.
        [many] { $n } de partes de esta página han cambiado desde que se tradujeron y se muestran en inglés.
       *[other] { $n } partes de esta página han cambiado desde que se tradujeron y se muestran en inglés.
    }
notice-not-started = Esta página aún no se ha traducido. Se muestra en inglés.
notice-detected = Se muestra en { $language }. <a1>Cambiar a inglés</a1>
notice-dismiss = Cerrar
notice-recorded-in-english = Registrado en inglés
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Inicio de { -brand }
studio-search-label = Buscar un escenario, un área, un ajuste o un comando
studio-search-placeholder = Busque por nombre, pregunta o ajuste, por ejemplo máscara de elevación
studio-search-scenarios = Buscar escenarios, áreas o ajustes
studio-search-commands = Buscar escenarios y comandos
studio-search-all = Buscar un escenario, un área, un ajuste, una vista o un comando
studio-search = Buscar
studio-theme = Cambiar entre el tema claro y el oscuro
studio-starting-questions = Preguntas para empezar
studio-where-you-are = Dónde se encuentra
studio-engine-status = Dónde se ejecuta el motor
studio-views = Vistas: Geometría, Confianza del receptor, Mapa de interferencias, Informe de formación, Herramientas
studio-more-views = Más vistas
studio-advanced-full = El panel completo: todos los paneles, campos y pestañas
studio-advanced-switch = Cambiar a la vista avanzada
studio-view-geometry = Geometría: skyplot, horizonte y DOP
studio-view-training = Informe de formación: abrir un registro de instructor
studio-view-interference = Mapa de interferencias: abrir archivos de mapa
studio-view-receiver-trust = Confianza del receptor: abrir una ejecución de buque
studio-view-tools = Herramientas: evidencias, bench, compliance, OSNMA
studio-result = Resultado
studio-result-meaning = Qué significa el resultado
studio-key-figures = Cifras clave
studio-result-views = Vistas de este resultado
studio-figures-of-merit = Figuras de mérito
studio-find-result-field = Buscar un campo del resultado
studio-capability-view = Vista de capacidades
studio-time-series = Series temporales
studio-chart-source = Origen del gráfico
studio-signal-band = Señal y banda
studio-signal-field = Campo de señal
studio-clock-holdover = Holdover del reloj
studio-telecom-masks = Máscaras de temporización de telecomunicaciones
studio-clock-stability = Estabilidad del reloj
studio-orbit-3d = Órbita 3D
studio-ground-track = Traza en tierra
studio-parameter-sweep = Barrido de parámetros
studio-compare-runs = Comparar ejecuciones
studio-animation = Animación
studio-engine-report = Informe del motor
studio-exports = Exportaciones e informe
studio-full-result = Documento de resultado completo
studio-settings = Ajustes y detalles
studio-find-setting = Buscar un ajuste, por ejemplo máscara
studio-find-scenario-setting = Buscar un ajuste de este escenario
studio-engine-summary = El resumen propio del motor
studio-restore-scenario = Restaurar el escenario incluido
studio-copy-scenario = Copiar el texto del escenario
studio-scenario-source = Fuente del escenario (TOML)
studio-install-engine = Instalar el motor
studio-run-history = Historial de ejecuciones
studio-scenarios-count =
    { $n ->
        [one] Escenario que ejecuta ({ $n })
        [many] Escenarios que ejecuta ({ $n })
       *[other] Escenarios que ejecuta ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } fila del registro
        [many] { $n } de filas del registro
       *[other] { $n } filas del registro
    }
studio-recorded-in-english = Registrado en inglés
studio-lang-engine-fallback = No se pudo cargar el texto del motor para este idioma; se muestra el inglés.
