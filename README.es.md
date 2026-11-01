> Esta es una traducción automática de README.md en la versión v0.40.0 que ningún hablante nativo ha revisado todavía; el README en inglés es la referencia. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: el emblema, una retícula de brújula que marca el instante preciso, junto al logotipo kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>el instante preciso</em></strong><br>
  Un simulador de código abierto para la resiliencia PNT (posicionamiento, navegación y temporización).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Estado de la integración continua en main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Cobertura de líneas cercana al 95 % de src/, medida en docs/COVERAGE.md y exigida al 85 % en la integración continua"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 de 401 capacidades VALIDATED frente a una referencia externa independiente, según la matriz de verificación"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Estado del umbral de calidad de SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Versión v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Inglés y 17 idiomas más, con traducción automática"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Licencia: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, el registro conceptual de Zenodo de todas las versiones"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Hay disponible una licencia comercial de Ashforde® OÜ, véase Ediciones"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana en crates.io, la versión publicada actual"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana en PyPI, la versión publicada actual"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana en npm, la versión publicada actual"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Abrir Kshana Studio</a> ·
  <a href="#install">Instalación</a> ·
  <a href="#capabilities">Capacidades</a> ·
  <a href="#evidence">Evidencias</a> ·
  <a href="#research">Investigación</a> ·
  <a href="docs/CONCEPTS.md">Documentación</a> ·
  <a href="#cite">Citar</a>
</p>

<p align="center">
  <strong>Idiomas:</strong> <a href="README.md">English</a> ·
  <a href="README.nl.md"><span lang="nl">Nederlands</span></a> ·
  <a href="README.pl.md"><span lang="pl">Polski</span></a> ·
  <a href="README.pt-BR.md"><span lang="pt-BR">Português (Brasil)</span></a> ·
  <a href="README.pt-PT.md"><span lang="pt-PT">Português (Portugal)</span></a> ·
  <a href="README.fi.md"><span lang="fi">Suomi</span></a> ·
  <a href="README.sv.md"><span lang="sv">Svenska</span></a> ·
  <a href="README.da.md"><span lang="da">Dansk</span></a> ·
  <a href="README.nb.md"><span lang="nb">Norsk bokmål</span></a> ·
  <a href="README.cs.md"><span lang="cs">Čeština</span></a> ·
  <a href="README.uk.md"><span lang="uk">Українська</span></a> ·
  <a href="README.ru.md"><span lang="ru">Русский</span></a> ·
  <a href="README.de.md"><span lang="de">Deutsch</span></a> ·
  <a href="README.fr.md"><span lang="fr">Français</span></a> ·
  <a href="README.es.md"><span lang="es">Español</span></a> ·
  <a href="README.et.md"><span lang="et">Eesti</span></a> ·
  <a href="README.ja.md"><span lang="ja">日本語</span></a> ·
  <a href="README.zh-Hans.md"><span lang="zh-Hans">简体中文</span></a><br>
  <sub>La línea de comandos, los resúmenes de ejecución, los gráficos y los informes hablan cada idioma con <code>--lang &lt;tag&gt;</code>
  (por ejemplo <code>kshana scenarios/holdover-test-example.toml --lang de</code>), y lo mismo hacen las superficies de Python, WebAssembly y MCP.
  Son traducciones automáticas que ningún hablante nativo ha revisado todavía; el inglés es la referencia.
  Véase <a href="docs/i18n.md">Localización</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Ensaye el minuto en que el GNSS se apaga. La consola de misión de Kshana, dibujada a partir de una ejecución real del motor v0.40.0: la campaña encadenada campaign-jam-spoof-holdover-integrity (semilla 20260928, 6 fases, 18 ejecuciones miembro a lo largo de T+01:16:10) y los 102 satélites de GPS, Galileo, BeiDou y GLONASS de constellation-multi-gnss-coverage, cada uno dibujado en la órbita circular de dos cuerpos recuperada de la traza en tierra del motor, con los radios comprimidos para la visualización. El error de tiempo del reloj alcanza un máximo de 62.7 ns frente a un margen de 50 ns, la densidad portadora-ruido cae a -12.2 dB-Hz frente a un mínimo de 25 dB-Hz y el nivel de protección vertical llega a 135.4 m frente a un límite de alerta de 50 m." width="100%">
</picture>

<details>
<summary><strong>Contenido</strong></summary>

- [Ensaye el minuto en que el GNSS se apaga](#rehearse-the-minute-gnss-goes-dark)
- [Novedades de 0.40](#whats-new-in-040), [Novedades de 0.39](#whats-new-in-039), [Novedades de 0.38](#whats-new-in-038) y [0.38 en profundidad](#038-in-depth): puntuación de Jammertest, los indicadores propios del receptor, entradas de máquina, temporización y holdover, paquetes de normas, LunaNet AFS, el viaje de ida y vuelta al laboratorio, kshana-bench, el observatorio, exportadores, óptica, [navegación de usuarios espaciales](#space-user-navigation-gnss-ssv) e [infraestructura lunar](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) y cada página del Studio
- [Capacidades](#capabilities): la tabla de áreas, [cada tipo de escenario por familia](#every-scenario-kind-by-family), [cada comando](#every-command), [cada superficie](#every-surface)
- [Cómo funciona una ejecución](#how-a-run-works), [Misiones](#missions)
- [Evidencias](#evidence): el registro, [dominios de capacidad](#capability-domains)
- [Instalación](#install), [Arquitectura](#architecture) (y los [diagramas](#diagrams)), [Asistente de IA](#ai-assistant)
- [Ediciones](#editions), [Investigación](#research), [Citar](#cite), [Licencia](#licence)
- [Referencia](#reference): uso, formato de escenario, salida, estructura del repositorio, preguntas frecuentes, resolución de problemas, versionado, hoja de ruta, contribución, documentación

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Ensaye el minuto en que el GNSS se apaga

Kshana reproduce el jamming, el spoofing y el holdover del reloj cuando fallan las señales GNSS (Global Navigation Satellite
System, sistema global de navegación por satélite), y le indica cuánto tiempo mantiene un sistema el tiempo y la posición dentro de su
presupuesto, y qué reloj o sensor aporta más margen. Es un único motor en Rust. Se ejecuta en un
terminal, un cuaderno (notebook), un IDE (entorno de desarrollo integrado), un asistente de IA (inteligencia
artificial) o en su navegador.

Cada ejecución es reproducible bit a bit a partir del escenario, la semilla y la versión del motor.
Cada capacidad lleva una de tres etiquetas en un registro comprobado automáticamente: **VALIDATED** (una
referencia externa independiente coincide), **MODELLED** (internamente coherente, y así se declara abiertamente)
o **PARTNER** (la responsabilidad es de un socio de hardware).

> **Estado: v0.40.0.** Un sustrato de simulación validado y reproducible para la resiliencia PNT.
> La temporización y el holdover van primero, porque ese dominio es el mejor validado. Kshana es un
> instrumento de estudio y de análisis de compromisos: no es hardware generador de señales de radiofrecuencia (RF) (no
> controla ninguna radio y no transmite nada; su salida a nivel de señal son archivos de muestras IQ en banda base
> para receptores por software), no es un receptor GNSS de hardware ni certificado (su receptor por software
> es una herramienta de análisis) y no es un producto de vuelo. ¿Es nuevo en el campo? Empiece por la
> [introducción en lenguaje sencillo](docs/CONCEPTS.md) y el [glosario](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Novedades de 0.40

0.40 añade un presupuesto de error a nivel de misión, etiqueta cada figura y cada tabla con su nivel de evidencia, lee registros de reloj medidos,
comprueba los envíos de socios de datos, estima dónde puede estar un emisor de interferencias y habla diecisiete idiomas además del inglés.
El registro tiene ahora 401 filas: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Ninguna fila se ha promovido a VALIDATED, y cada incumplimiento indicado abajo está
fijado por una prueba.

- **Hilo de misión.** El tipo `mission-thread` encadena fases desde el lanzamiento hasta la entrada (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` y cuatro tipos lunares) con reglas de traspaso declaradas, un margen frente a requisitos declarados y el eslabón
  más débil; un ejemplo de extremo a extremo de clase Artemis a lo largo de 11 fases (segmentos terrestre y lunar), 92 tipos de escenario en total. Cada número es MODELLED. La propagación cislunar frente a la trayectoria pública de Artemis I
  **no alcanza** su umbral preregistrado (45.3 km y 0.25 m/s frente a 5 km y 0.05 m/s; la causa son pequeñas maniobras que el modelo no incluye), y el propagador lunar frente a la órbita de CAPSTONE
  **no alcanza** el suyo (136.8 km frente a 25 km al final de una revolución); la comparación con LRO sí se cumple. Las filas siguen siendo MODELLED
  ([Hilo de misión](docs/MISSION-THREAD.md), [segmento lunar](docs/MISSION-THREAD-LUNAR.md)). En el Studio el hilo se consulta en `/studio/mission-thread/`.
- **Etiquetas de evidencia.** Cada figura y cada tabla que escribe una ejecución lleva el nivel y los ids de fila del registro en los que se basa, leídos de la matriz.
- **Relojes medidos.** Se leen ocho formatos de registro de reloj ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)) y una serie
  ajustada puede alimentar el holdover. Frente a umbrales preregistrados, el ajuste **no alcanza** F1(a) en cinco de seis registros y F2 en uno; ambos
  siguen siendo MODELLED ([Registro de cambios](CHANGELOG.md#0400---2026-10-29)).
- **Socios de datos.** `kshana partner check` comprueba el formato de un envío y no puntúa nada ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Región del emisor.** `kshana interference-map locate` da una región y una elipse, nunca un punto aislado, a partir de informes ADS-B o AIS.
  Comparado una vez con los emplazamientos de los transmisores de Jammertest 2025, el resultado es **NOT ASSESSABLE** para ambas fuentes (demasiado pocas
  sesiones programadas en los datos abiertos), así que la fila sigue siendo MODELLED ([Mapa de interferencias](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Referencia comparativa.** La nueva campaña de 0.40 cumple A3, D3 (ambos EXPLORATORY), R3 y R4; A2, D1 y R1 siguen en NOT MET ([Bench](docs/BENCH.md)).
- **Idiomas.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja y zh-Hans, como **traducciones automáticas que ningún hablante
  nativo ha revisado**; el inglés es la referencia, y las ejecuciones en idiomas distintos del inglés tardan aproximadamente el doble
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Novedades de 0.39

0.39 no añade ninguna función y no cambia ningún resultado; la salida del motor es la salida de 0.38. Corrige una cosa
en la línea de comandos, actualiza dependencias de las herramientas de validación cruzada y declara los veredictos
de la referencia comparativa completos.

- **Línea de comandos.** `kshana kinds | head` (cualquier salida estándar cerrada) ya no provoca un pánico: el programa termina
  en silencio con el estado 141, como hacen otras herramientas ante una tubería cerrada. Los demás errores de escritura se siguen notificando.
- **Dependencias.** `memmap2` 0.9.11 en los dos archivos de bloqueo de la comprobación cruzada de ANISE y `pillow` 13.0.0 y
  `certifi` 2026.10.19 en las versiones fijadas del entorno de la referencia independiente, todo bajo `xval/`: no ha cambiado nada de lo que se distribuye.
- **kshana-bench, todos los veredictos.** Frente a los umbrales preregistrados, tres están en NOT MET, cada uno fijado por una prueba:
  A2 (`agc_k_sigma` AUC 0.766 frente a al menos 0.80), D1 (mayor diferencia 0.0301) y la tarea (b) R1 (trasladado,
  no se volvió a ejecutar). No se relajó ningún umbral ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Novedades de 0.38

0.38 hace medible al árbitro neutral: puntúa registros de receptores frente a un calendario de pruebas
publicado, lee más receptores y sensores, prueba sistemas de temporización y distribuye una referencia comparativa y un
observatorio de interferencias. Sigue siendo consultivo: nada de esto está certificado, ningún resultado es una homologación
y nada transmite. Cada fila indica lo que el registro contiene para ella ([cómo se obtiene una etiqueta](#evidence));
un estado nombra solo lo que se comprobó, y la fila del registro y la página enlazada dicen lo que no se comprobó.

| Novedad en 0.38 | Qué hace y por qué | Estado en el registro | Lectura |
|---|---|---|---|
| **Puntuación de Jammertest** | `kshana jammertest import` lee el catálogo de pruebas y el plan de transmisión publicados por la NPRA como verdad programada; `jammertest score` puntúa un registro de receptor por prueba (latencia de detección, alarmas omitidas, falsas alarmas, tiempo de recuperación), como paquete de evidencias firmado si usted aporta una clave | **MODELLED**: una fila del registro. Los umbrales se preregistraron antes de cualquier ejecución puntuada; con los datos de JammerTest 2024 la regla de datos mínimos falló en ambas ejecuciones (4 y 7 ventanas puntuables frente a las 10 requeridas), así que **ningún umbral es evaluable** y no se afirma nada | [Jammertest](docs/JAMMERTEST.md) |
| **Los indicadores propios del receptor** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG y NovAtel RXSTATUS se leen en un `self_report` por época y se comparan con las alarmas de Kshana (ambos, solo el receptor, solo Kshana, ninguno); un lector de Septentrio SBF y una entrada `--serial` de solo lectura | **MODELLED**; la concordancia entre el detector de un receptor y el de Kshana no es una validación | [Confianza en el receptor](docs/RECEIVER-TRUST.md) |
| **Más receptores y sensores** | RTKLIB `.pos`, NovAtel OEM7, C/N0 de RTCM 3 MSM4/MSM7 (a partir de las tablas de pyrtcm con licencia BSD, no del texto de RTCM), flujos de monitorización de GNSS-SDR, un registro de IMU como segundo sensor, un paquete de ROS 2, un puente con `gnss_lib_py` e `imu-fit` para los parámetros de sensores híbridos | **MODELLED**: seis filas del registro; solo datos de prueba de elaboración propia, no se leyó ninguna captura de un receptor real, IMU, ejecución de GNSS-SDR ni grafo de ROS | [Entradas de máquina](docs/MACHINE-INPUTS.md) |
| **Pruebas de temporización y holdover** | el tipo `holdover-test` puntúa una prueba de holdover (GNSS retirado por el operador, holdover, recuperación) a partir de un registro medido de error de tiempo frente a las máscaras del ITU-T, "medido frente a la máscara"; lectores de registros de linuxptp y chrony; las etapas de hardware y el campo `lab-attestation` | **MODELLED**: dos filas del registro; los tiempos son la declaración del operador, no se verifican | [Timing HIL](docs/TIMING-HIL.md), [Seguridad del hardware](docs/HARDWARE-SAFETY.md) |
| **Paquetes de normas, LunaNet AFS, viaje de ida y vuelta al laboratorio** | paquetes puntuados para DHS RPCF, IMO MSC.1/Circ.1575 e ICAO Doc 9849 Appendix F frente a umbrales declarados antes de la ejecución, "aporta evidencia para"; una correspondencia con NIST IR 8323r1; un generador y comprobador de códigos de LunaNet AFS; un paquete firmado que vincula el escenario, las condiciones de prueba, el registro del receptor y la puntuación de una ejecución de laboratorio | **MODELLED** para los paquetes y el viaje de ida y vuelta; la comprobación de códigos AFS es **VALIDATED** frente a sus columnas de comprobación impresas (véanse las filas del registro) | [Normas](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench y el observatorio** | tareas, particiones y métricas fijas para la detección de interferencias, la detección en IQ, la predicción de holdover y la brecha de optimismo, con un conjunto reservado sellado y una clasificación estática; un producto diario y reproducible de interferencias con un retraso de 24 h, celdas gruesas y sin atribución | ninguna fila propia en el registro: puntúa propuestas, y sus líneas base se etiquetan como MODELLED en los archivos de resultados; frente a los umbrales preregistrados, el puntuador, C1 a C3 y D2 se cumplen y tres umbrales están en **NOT MET** (fijados por pruebas): A2 (`agc_k_sigma` AUC 0.766 frente a al menos 0.80 en la partición de test), D1 (mayor diferencia 0.0301) y la tarea (b) R1 (trasladado, no se volvió a ejecutar); véase `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatorio](docs/observatory/METHOD.md) |
| **Exportadores** | telemetría de confianza como mensajes de descubrimiento y de estado MQTT de Home Assistant (solo publicación, sin credenciales) junto a Prometheus, CEF, LEEF y OTLP | **MODELLED**: una fila del registro | [Telemetría de confianza](docs/TRUST-TELEMETRY.md) |
| **Margen del enlace óptico en función del tiempo** | el tipo `optical-atmosphere` puede escribir una realización con semilla del tiempo meteorológico de un emplazamiento como serie de margen de enlace | **MODELLED**: una fila del registro; una extracción del modelo, no el clima | [Atmósfera óptica](docs/OPTICAL-ATMOSPHERE.md) |

Lo más destacado de 0.37: [registro de cambios](CHANGELOG.md#0370---2026-10-17). La lista completa de 0.38 está en el
[registro de cambios](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 en profundidad

Cada capacidad de la tabla anterior, en unas pocas líneas: qué hace, un comando para ejecutarla, una
imagen dibujada a partir de una ejecución real del motor y lo que el registro contiene para ella. Las imágenes
las escribe [`tools/gen_figures_038.py`](tools/gen_figures_038.py) en
[`docs/figures/0.38/`](docs/figures/0.38/) (nunca se dibujan a mano): `python3 tools/gen_figures_038.py`
las reescribe a partir de un motor compilado, y `--check` falla si alguna está desactualizada o si su pie de imagen aquí difiere.
Cuando una entrada es un registro, se trata de uno inventado que escribe el script, porque los registros reales de terceros
nunca se incluyen en el repositorio, y el pie de imagen lo indica. Todo lo que sigue es consultivo: no está certificado, no es una
homologación y nada transmite. Un estado nombra lo que se comprobó y nada más;
[cómo se obtiene una etiqueta](#evidence).

### Puntuación de Jammertest

`kshana jammertest import` convierte el catálogo de pruebas y el plan de transmisión publicados por la NPRA en
verdad programada, y `kshana jammertest score` puntúa un registro de receptor frente a ella: para cada
prueba programada, si se detectó, con cuánto retraso y cuánto tardó el receptor en recuperarse, además de las
falsas alarmas fuera de todas las franjas. El catálogo se descarga, nunca se incluye en el repositorio.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Puntuación de un registro sintético de receptor frente a un calendario de tres pruebas, a partir de una ejecución real del motor v0.40.0 (`kshana jammertest score`). El registro es inventado: 1800 s de NMEA con una caída de C/N0 de 20 dB en dos intervalos. El calendario enumera tres franjas; la franja central no tiene inhibidor en el registro. La puntuación marca 2 de 3 pruebas detectadas (latencia mediana 0 s) y 1 omitida, con 0 rachas de falsas alarmas en 0.25 h de tiempo limpio. Nada de esto dice algo sobre un receptor real. Software de carácter consultivo, no un equipo de navegación homologado (IEC 61108, IEC 61162): el operador sigue siendo responsable de la navegación del buque.">
</picture>

**Estado en el registro: MODELLED.** Los umbrales se fijaron antes de cualquier ejecución puntuada; con los datos de JammerTest 2024
la regla de datos mínimos falló en ambas ejecuciones, así que ningún umbral es evaluable y no se afirma nada.
[Jammertest](docs/JAMMERTEST.md).

### Los indicadores propios del receptor

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG y NovAtel RXSTATUS se leen en un `self_report` por época
y se colocan junto a las alarmas de Kshana: ambos, solo el receptor, solo Kshana o ninguno. Un
lector de Septentrio SBF y una entrada `--serial` de solo lectura alimentan la misma comparación. Ninguna de las dos partes es
la verdad de referencia.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="El indicador de spoofing propio del receptor frente a las alarmas de Kshana, a partir de una ejecución real del motor v0.40.0 sobre un registro UBX inventado (200 épocas a 1 Hz). La C/N0 cae 20 dB entre 80 y 90 s y entre 120 y 130 s; el receptor marca de 120 a 130 s y de 160 a 165 s. De 140 épocas comparadas tras la calibración, en 11 marcaron ambos, en 6 solo el receptor, en 11 solo Kshana y en 112 ninguno. Ninguna de las dos partes es la verdad de referencia y la concordancia no es una validación. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

**Estado en el registro: MODELLED.** La concordancia entre el detector de un receptor y el de Kshana no es una
validación. [Confianza en el receptor](docs/RECEIVER-TRUST.md).

### Más receptores y sensores

RTKLIB `.pos`, NovAtel OEM7, C/N0 de RTCM 3 MSM4/MSM7, flujos de monitorización de GNSS-SDR, un registro de IMU como segundo
sensor, un paquete de ROS 2 y un puente con `gnss_lib_py` desembocan todos en la misma línea temporal de confianza en el receptor.
`imu-fit` lee los parámetros de sensor que necesitan los escenarios híbridos y de fusión a partir de un registro de IMU
estacionaria, de modo que un escenario puede ejecutarse con el sensor que usted realmente tiene.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Lo que `kshana imu-fit` lee de un registro de IMU estacionaria, a partir de una ejecución real del motor v0.40.0 sobre un registro inventado (20,000 muestras a 100 Hz, 200 s): el paseo aleatorio de velocidad del acelerómetro q_va = 4.02e-06, el paseo aleatorio de ángulo del giróscopo q_arw = 9e-08, la inestabilidad del sesgo 0.00296 y las pendientes de Allan iniciales (-0.51 y -0.49; alrededor de -0.5 donde domina el ruido blanco). La tabla de al lado es el TOML que imprime el comando. El estimador solo se ha comprobado con registros sintéticos. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

**Estado en el registro: MODELLED.** Solo datos de prueba de elaboración propia; no se leyó ninguna captura de un receptor real, IMU,
ejecución de GNSS-SDR ni grafo de ROS. [Entradas de máquina](docs/MACHINE-INPUTS.md).

### Pruebas de temporización y holdover

El tipo `holdover-test` puntúa una prueba de holdover (GNSS retirado por el operador, holdover, recuperación)
a partir de un registro medido de error de tiempo frente a las máscaras del ITU-T, y lo dice con esas palabras: medido
frente a la máscara. Lo alimentan lectores de registros de linuxptp y chrony; las etapas de hardware y el
campo `lab-attestation` dicen quién declaró qué.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Una prueba de holdover puntuada a partir de un registro de error de tiempo, a partir de una ejecución real del motor v0.40.0 sobre scenarios/holdover-test-example.toml (601 muestras cada 5 s). El operador retira el GNSS a los 600 s y lo restablece a los 2400 s; el error de tiempo deriva hasta 299 ns al final del holdover, supera el presupuesto de 100 ns tras 675 s y vuelve dentro de la banda de 100 ns 70 s después del restablecimiento. Veredictos: máscaras de línea base PASS, máscaras de holdover FAIL, envolvente de holdover FAIL, recuperación RECOVERED. Medido frente a la máscara, no una aprobación. Los tiempos son la declaración del operador, no verificados por Kshana. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

**Estado en el registro: MODELLED.** Los momentos en que se retiró y se restableció el GNSS son la declaración del operador,
no se verifican. [Timing HIL](docs/TIMING-HIL.md), [Seguridad del hardware](docs/HARDWARE-SAFETY.md).

### Paquetes de normas

Paquetes puntuados para los perfiles de prueba de PNT resiliente del DHS, IMO MSC.1/Circ.1575 e ICAO Doc 9849
Appendix F, además de una correspondencia con NIST IR 8323r1 en `compliance-report`. Cada prueba ejecuta un escenario
incluido y compara un campo del resultado con un umbral declarado antes de la ejecución; una prueba que necesita un registro
de receptor figura como pendiente de una entrada, no se puntúa. La formulación es "aporta evidencia para".

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Todas las pruebas de los tres paquetes de normas puntuados, a partir de ejecuciones reales del motor v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 cumplidas, 1 no cumplida, 2 necesitan una entrada; imo-circ-1575: 1 cumplida, 4 no cumplidas, 2 necesitan una entrada; icao-doc9849-appf: 6 cumplidas, 0 no cumplidas, 2 necesitan una entrada. En total, 13 cumplidas, 5 no cumplidas y 6 necesitan una entrada que el motor no tiene (un registro de receptor o documentación del equipo). Cada umbral se declaró antes de la ejecución; un incumplimiento se mantiene como incumplimiento. Un umbral cumplido dice que un escenario modelado cumplió un umbral declarado, nada sobre un producto. Los paquetes aportan evidencia para las filas que citan; no son una evaluación. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana; no debe ser la única base de ninguna decisión de navegación o de seguridad.">
</picture>

**Estado en el registro: MODELLED.** Un umbral cumplido dice que un escenario modelado cumplió un umbral declarado, nada sobre un
producto; cada incumplimiento se mantiene y queda fijado por una prueba. [Normas](docs/STANDARDS.md).

### LunaNet AFS

El generador de códigos de la LunaNet Augmented Forward Signal (códigos Gold, Weil y terciarios, la trama
del mensaje y su codificación de errores) y un comprobador para un flujo de símbolos grabado o generado, fijados a una
edición de la especificación.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="El generador de códigos de LunaNet AFS comprobado frente a las columnas impresas de la especificación, a partir de una ejecución real del motor v0.40.0 (`kshana lunanet-afs-check spec`, fijado a LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 de enero de 2025; el documento marca sus tablas de códigos como {LSIS-TBC}). Se cumplen 9 de 10 comprobaciones; B4 está en NOT MET (420 de 421 coincidentes). Comprueba un flujo de símbolos frente a una edición de una especificación publicada y no dice nada sobre ningún nodo o servicio de LunaNet. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Comprueba un flujo de símbolos frente a una edición de una especificación publicada y no dice nada sobre ningún nodo o servicio de LunaNet.">
</picture>

**Estado en el registro: VALIDATED** para las comprobaciones de código y de sincronización, frente a los valores que la
especificación imprime (que marca como TBC); una comprobación está en NOT MET, se mantiene y queda fijada (una columna impresa
de código terciario difiere: el documento imprime el mismo valor para dos PRN). Las palabras LDPC y CRC
de las subtramas 2 a 4 no se comprueban. Las filas del registro dicen exactamente cuáles. [LunaNet AFS](docs/LUNANET-AFS.md).

### Viaje de ida y vuelta al laboratorio

`kshana.test-conditions/1` es una descripción publicada de lo que hizo un laboratorio (eventos, tiempos,
potencias). `kshana evidence round-trip` vincula el hash del escenario, el hash de las condiciones, el hash del registro del receptor
y la puntuación en un único paquete firmado, y rechaza un paquete cuyas condiciones y cuyo escenario de puntuación
discrepen sobre los eventos. Kshana nunca produce ni reproduce una señal: cómo llegó un escenario a un
receptor es responsabilidad del operador.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="La estructura de un paquete de evidencias. Un registro de receptor (NMEA, u-blox UBX, RINEX 3 o un registro de Android) y una ventana de tiempo entran en kshana receiver-trust evidence, que escribe siete archivos: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig y un timestamp.tsr opcional. El manifiesto registra el SHA-256 del registro completo y de cada archivo, y una cadena de hashes sobre los archivos; la firma cubre el manifiesto. kshana evidence verify comprueba la firma, el hash de cada archivo, la cadena y que no haya ningún archivo no listado, y termina con 0 cuando está verificado, 1 cuando algo falló y 3 cuando el firmante no estaba fijado. Un paquete es un registro técnico, no un dictamen jurídico.">
</picture>

La imagen es la estructura de un paquete. **Estado en el registro: MODELLED.**
[Condiciones de prueba](docs/spec/TEST-CONDITIONS.md), [Banco de pruebas](docs/TEST-BENCH.md).

### kshana-bench

Tareas, particiones y métricas fijas para la detección de interferencias, la detección en IQ, la predicción de holdover y
la brecha de optimismo, con un conjunto reservado sellado y una clasificación estática. Puntúa propuestas; no es
una clasificación de receptores.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="Las líneas base integradas de la tarea D de kshana-bench (la brecha de optimismo) en la partición de test, a partir de una ejecución real del motor v0.40.0 (`kshana bench baseline`). Cada par de barras es el área bajo la curva ROC en los casos dentro de la distribución y en los casos desplazados; la diferencia entre ellas es la brecha de optimismo, frente a una tolerancia de 0.05. fused-max-z: 0.998 y 0.983 (brecha 0.015); sqm-imbalance: 0.882 y 0.882 (brecha 0.001); agc-excess: 0.848 y 0.819 (brecha 0.030); raim-parity: 0.682 y 0.672 (brecha 0.010); energy-cn0-drop: 0.595 y 0.565 (brecha 0.030). Las etiquetas son etiquetas de un modelo generativo sobre un corpus sintético, nunca datos de campo: MODELLED. Carácter consultivo: modelado o medido frente a referencias declaradas, no una aprobación, una certificación ni una declaración de conformidad. Una puntuación describe un registro o un corpus, nunca un producto.">
</picture>

**Estado en el registro:** ninguna fila propia en el registro; las líneas base se etiquetan como MODELLED en los archivos de resultados.
Frente a los umbrales preregistrados, el puntuador, C1 a C3 y D2 se cumplen y tres umbrales están en NOT MET, cada uno
fijado por una prueba: A2 (`agc_k_sigma` AUC 0.766 frente a al menos 0.80 en la partición de test), D1 (mayor diferencia
0.0301) y la tarea (b) R1 (trasladado de la campaña anterior, no se volvió a ejecutar). Las cifras están en
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Observatorio de interferencias

Un producto por día UTC y región a partir de un archivo abierto de posiciones de aeronaves, sobre una cuadrícula gruesa fija:
cada celda está degradada, no degradada o no observada (lo cual no significa "despejada"). Se publica no antes
de 24 h después del final del día, con las celdas pequeñas suprimidas y sin atribución de causa.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Dos días sintéticos de mapa de interferencias dibujados a partir de las muestras incluidas en examples/interference-map/output, cada uno con su propia ruta sintética y las proporciones de exposición de la ruta que informa el motor. A la izquierda, un día ADS-B: 1 celda degradada, 6 no degradadas, 4 sin evaluar (rayadas) y celdas sin entrada, dibujadas vacías, que no se observaron. La ruta mide 525 km: el 11.5% de su longitud en celdas degradadas, el 38.3% no degradadas, el 9.1% sin evaluar y el 41.1% no observadas. A la derecha, un día AIS: celdas marcadas por los detectores de círculo y de posición en tierra, celdas no anómalas y celdas vacías; la ruta mide 454 km con el 10.5% en celdas anómalas, el 21.2% no anómalas, el 0.0% sin evaluar y el 68.3% no observadas. ADS-B y AIS son capas separadas, nunca combinadas. Una celda marcada no es una constatación de interferencia, y una celda sin color no se observó, lo cual no es lo mismo que despejada. Todos los datos son inventados, en pleno Atlántico central, y no son una medición.">
</picture>

La imagen son los días de muestra incluidos, no un producto del observatorio. **Estado en el registro: MODELLED**:
sin referencia externa, sin verdad de referencia y sin atribución de causa; una celda que no se observa no se ha
evaluado, lo cual no es lo mismo que despejada. [Método del observatorio](docs/observatory/METHOD.md).

### Exportadores

Telemetría de confianza como texto de Prometheus, CEF, LEEF, OTLP y mensajes de descubrimiento y de estado MQTT de Home Assistant.
El comando publica solo en el destino que usted le indique y no guarda credenciales.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Un resultado de confianza en tres formatos de exportación, a partir de ejecuciones reales del motor v0.40.0 (`kshana trust-telemetry`) sobre examples/maritime-trust: la exposición en texto de Prometheus (la última puntuación de confianza es 5.9 y la banda no fiable es la activa), y los últimos mensajes CEF y LEEF. El comando no publica nada si no se le da un destino, no guarda credenciales y no transmite ninguna señal de radio. Software de carácter consultivo, no un equipo de navegación homologado (IEC 61108, IEC 61162): el operador sigue siendo responsable de la navegación del buque.">
</picture>

**Estado en el registro: MODELLED.** [Telemetría de confianza](docs/TRUST-TELEMETRY.md).

### Margen del enlace óptico en función del tiempo

El tipo `optical-atmosphere` puede escribir una realización con semilla del tiempo meteorológico de un emplazamiento como serie
de margen de enlace: episodios de nubes, una columna de agua líquida para cada uno, una muestra de centelleo por paso. La
página Optical PNT del Studio abre los escenarios de optical-atmosphere.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Una realización con semilla del margen de enlace del emplazamiento 'northern' a lo largo de 336 h, a partir de una ejecución real del motor v0.40.0 sobre scenarios/optical-atmosphere-network.toml (semilla 37, paso de 600 s). El margen cae por debajo de cero durante los episodios de nubes; en esta extracción el enlace está activo el 40.5 % del tiempo, con 27 cortes y un corte más largo de 30.7 h. Las entradas son ilustrativas, la serie es una extracción del modelo y no el clima, y difiere de la disponibilidad estadística (37.8 %) por el error de muestreo de la extracción. Solo análisis consultivo: no es un producto certificado de disponibilidad, integridad o navegación, ni una predicción para ningún emplazamiento real salvo que sus entradas climáticas procedan de un conjunto de datos declarado.">
</picture>

**Estado en el registro: MODELLED.** Una extracción del modelo, no el clima. [Atmósfera óptica](docs/OPTICAL-ATMOSPHERE.md).

### Nuevas vistas del Studio

[kshana.dev/studio](https://kshana.dev/studio/) incorpora una repetición Bridge (dos ejecuciones lado a lado sobre un mismo
reloj de misión, en [`/studio/replay/`](https://kshana.dev/studio/replay/)), una página Optical PNT
(`/studio/optical/`), una página de prueba de holdover (`/studio/holdover/`) y un visor del observatorio
(`/studio/observatory/`). Ejecutan el mismo motor en el navegador, no se sube nada y llevan
la misma declaración de carácter consultivo. Las imágenes anteriores las dibuja un script a partir de la salida del propio motor;
no son capturas de pantalla de estas páginas.

<a id="space-user-navigation-gnss-ssv"></a>
### Navegación de usuarios espaciales (`gnss-ssv`)

Para una nave espacial por encima, alrededor o mucho más allá de las órbitas GNSS: cuántas señales GNSS puede usar, qué
intensidad tienen, qué calidad tiene la geometría y qué puede hacer con ellas un filtro a bordo. Un tipo,
cuatro modos, elegidos por las tablas del escenario: una **capa** (shell) de usuarios (la proporción de tiempo con una y con cuatro
señales, por constelación), una **trayectoria** (señales, C/N0, dilución de la precisión y el
medio de los rayos rasantes al limbo a lo largo de una órbita), una ejecución de **navegación** (un filtro de nueve estados sobre pseudodistancias, hasta la
Luna) y una **formación** (navegación relativa de satélites secundarios respecto a uno principal). La fuente pública para la
comparación de disponibilidad es el folleto interoperable GNSS Space Service Volume (UN OOSA
ST/SPACE/75, del International Committee on GNSS), que es a su vez una simulación; se descarga, nunca se
incluye en el repositorio. Página completa: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Disponibilidad de señales para un usuario en una esfera a 36000 km de altitud con una antena hemisférica, a partir de una ejecución real del motor v0.40.0 sobre scenarios/gnss-ssv-shell.toml (una ejecución reducida: 162 usuarios, 3 días, pasos de 10 min), con un umbral de 20 dB-Hz. Para cada constelación y banda, dos barras: la proporción de pares (usuario, época) con al menos una señal y con al menos cuatro. Combinado, L1: 99.4 % al menos una, 73.2 % al menos cuatro, corte más largo por debajo de cuatro señales 160 min. Combinado, L5: 100.0 % al menos una, 99.9 % al menos cuatro, corte más largo por debajo de cuatro señales 20 min. MODELLED: un estudio modelado a partir de entradas declaradas, no una medición ni una afirmación sobre el volumen de servicio de ningún sistema. El tamaño reducido no es la comparación con el folleto. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Señales a lo largo de una órbita terrestre alta (perigeo 497 km, apogeo 58622 km, periodo 18.8 h), a partir de una ejecución real del motor v0.40.0 sobre scenarios/gnss-ssv-heo.toml, banda L1. Arriba: la mejor densidad portadora-ruido entre las señales visibles, frente al umbral de 20 dB-Hz. En medio: el número de señales visibles de todas las constelaciones, de 4 a 55 a lo largo de los puntos muestreados. De los enlaces recibidos, 2252 llegaron por un lóbulo principal y 696 por lóbulos secundarios, usando un patrón paramétrico sustitutivo etiquetado, no el patrón medido de ningún sistema. PDOP mediano 67, percentil 95 358. MODELLED: un estudio modelado a partir de entradas declaradas, no una medición ni una afirmación sobre el volumen de servicio de ningún sistema. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Un filtro de nueve estados a bordo en una transferencia desde una órbita baja hacia la Luna, a partir de una ejecución real del motor v0.40.0 sobre scenarios/gnss-ssv-nav-lunar.toml (289 épocas, 13 puntos dibujados). En un eje logarítmico, el error de posición real y la cota de una sigma del propio filtro frente al tiempo desde el inicio. Dentro de las órbitas GNSS el RMS de posición es de 1.4 m; por encima de ellas es de 90 m, con un error final de 184 m a 193,330 km de altitud con 1 medición. El error de estimación cuadrático normalizado medio en toda la ejecución es 4.4 (alrededor de 3 para un bloque de posición coherente). La verdad y el filtro comparten sus sustitutos del Sol y de la Luna. MODELLED: un estudio modelado a partir de entradas declaradas, no una medición ni una afirmación sobre el volumen de servicio de ningún sistema. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Navegación relativa de 2 satélites secundarios alrededor de uno principal en una órbita alta, a partir de una ejecución real del motor v0.40.0 sobre scenarios/gnss-ssv-formation-heo.toml (401 épocas). Para cada satélite secundario, dos barras: el RMS de la posición relativa obtenido restando las dos estimaciones absolutas independientes, y el del filtro relativo sobre pseudodistancias de diferencias simples. Línea base de 0.8 km: 5.1 m y 1.2 m. Línea base de 2.0 km: 4.1 m y 2.1 m. El filtro absoluto no es coherente aquí: error de estimación cuadrático normalizado medio de 187 frente a alrededor de 3 para un filtro coherente, así que su incertidumbre declarada es demasiado pequeña. MODELLED: un estudio modelado a partir de entradas declaradas, no una medición ni una afirmación sobre el volumen de servicio de ningún sistema. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

**Estado en el registro: MODELLED, y la comparación con el folleto no alcanza los umbrales en su mayor parte.** Los umbrales se fijaron antes de
la ejecución. De ocho, solo se cumplen S0 (el presupuesto de enlace inverso, 13 de 13 valores) y S6 (la misión lunar).
**S1 a S5 y S7 están en NOT MET**: la geometría de los volúmenes de servicio superior e inferior (43 de 52 y 48 de 52
celdas), el volumen de servicio superior a 15/20/25 dB-Hz, las seis misiones GEO, la misión HEO y el
patrón paramétrico de lóbulos secundarios frente a los patrones de panel de GPS medidos. Casi todos los incumplimientos de S1 a S5 afectan a
GLONASS, y el folleto imprime dos ángulos de referencia distintos para él; una variante de diagnóstico que usa el
otro par lleva S1, S2 y S4 a todas las celdas, pero no sustituye a la ejecución de referencia y ninguna fila es
VALIDATED. El filtro absoluto de la ejecución de formación también tiene un exceso de confianza (error cuadrático normalizado medio
muy por encima del valor de alrededor de 3 que da un filtro coherente).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="La comparación registrada del modelo de disponibilidad para usuarios espaciales con el folleto público Space Service Volume, a partir de los resultados incluidos de la ejecución preregistrada (xval/gnss-ssv/results-run1.json, escrito por el ejemplo ssv_booklet_check del motor v0.40.0). Barra a barra, las celdas dentro de la tolerancia: S0 13 de 13 (MET); S1 43 de 52 (NOT MET); S2 48 de 52 (NOT MET); S3 122 de 155 (NOT MET); S4 132 de 156 (NOT MET); S5 18 de 26 (NOT MET); S6 26 de 26 (MET); S7 0 de 20 patrones de panel (NOT MET). Solo S0 y S6 se cumplen según la lectura preregistrada. Una variante de diagnóstico que usa los otros ángulos de GLONASS del folleto lleva S1, S2 y S4 a todas las celdas, pero no sustituye a la ejecución de referencia. Ninguna fila del registro es VALIDATED. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

[Navegación de usuarios espaciales](docs/SSV.md), [lo que muestra la comparación](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Infraestructura lunar (`lunar-infrastructure`)

La órbita y la superficie de la Luna como infraestructura de navegación y geodésica, en cinco estudios elegidos por
`study`: **od-consistency** (una determinación de órbita a bordo con GNSS terrestre en una órbita halo frente a una
determinación independiente en tierra), **carrier-phase** (resolución de ambigüedades enteras entre estaciones de superficie y un
orbitador), **frame-coestimation** (el datum lunar a partir de mediciones de distancia desde estaciones terrestres con y sin enlaces
del orbitador), **space-tie** (desplazamientos láser, VLBI y GNSS en una misma nave frente al error del enlace local) y
**geodesy-sensitivity** (qué familia de observables ve los números de Love h2, k2 y l2). El modelo es uno
de tres cuerpos restringido con simplificaciones declaradas y entradas ilustrativas. Página completa:
[docs/LUNAR-INFRASTRUCTURE.md](docs/LUNAR-INFRASTRUCTURE.md).

```sh
kshana scenarios/lunar-infrastructure-od-consistency.toml
kshana scenarios/lunar-infrastructure-carrier-phase.toml            # quick; the scored run takes about eight minutes
kshana scenarios/lunar-infrastructure-frame-coestimation.toml
kshana scenarios/lunar-infrastructure-space-tie.toml
kshana scenarios/lunar-infrastructure-geodesy-sensitivity.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-od-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-od-light.svg">
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Coherencia de una determinación de órbita a bordo con GNSS terrestre en una órbita halo casi rectilínea con una determinación de órbita independiente en tierra, a partir de ejecuciones reales del motor v0.40.0 sobre scenarios/lunar-infrastructure-od-consistency.toml y la variante con error de modelo (400 ensayos cada una). La diferencia normalizada media q es 5.81 sin error de modelo y 5.95 con un error de aceleración inyectado de 3e-10 m/s2, frente a 6 esperado: las dos soluciones de órbita son coherentes (umbral C1 MET). La proporción de ensayos por encima del punto del 95 % es 0.040 y 0.052; el umbral para detectar el error inyectado era al menos 0.5, así que está en NOT MET (C3): la solución a bordo se conoce con una precisión de unos 352 m frente a 23 m para la de tierra, así que un desplazamiento de diez metros se oculta dentro de su covarianza. MODELLED: un modelo de tres cuerpos restringido con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Resolución de ambigüedades enteras de fase de portadora entre estaciones de la superficie lunar y un orbitador, a partir del resultado incluido de la ejecución puntuada del motor v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 longitudes de arco, un Monte Carlo de 401 extracciones cada una, escrito por scenarios/carrier-phase-scored.toml). 1 día: éxito 1.0 % (error estándar 0.5 %), 134 ambigüedades, sigma de posición del orbitador 45.6 m flotante y 18.5 m fija; 2 días: éxito 0.5 % (error estándar 0.4 %), 259 ambigüedades, sigma de posición del orbitador 21.5 m flotante y 8.7 m fija; 3 días: éxito 2.8 % (error estándar 0.8 %), 375 ambigüedades, sigma de posición del orbitador 6.3 m flotante y 2.1 m fija. No se logra la resolución entera: el éxito se mantiene entre el 1 % y el 3 % a 25 dBi, y con los 12 dBi registrados el problema no puede plantearse. MODELLED: un modelo de tres cuerpos restringido con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Precisión del datum lunar de siete parámetros (tres traslaciones, una escala y tres rotaciones) a partir de mediciones de distancia desde estaciones terrestres, con y sin distancias entre el orbitador y las estaciones de superficie, a partir de una ejecución real del motor v0.40.0 sobre scenarios/lunar-infrastructure-frame-coestimation.toml. La sigma de Cramer-Rao de las traslaciones y las rotaciones disminuye con los enlaces del orbitador (por ejemplo t_z de 0.98 m a 0.046 m); el menor autovalor de información aumenta 111 veces y la traza de la CRLB cae al 1.0 % (umbral F3 MET). Esto supone que la órbita se conoce en los ejes lunares, con su error recogido por la sigma de distancia del orbitador de 1 m. MODELLED: un modelo de tres cuerpos restringido con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Precisión de los desplazamientos entre las posiciones de telemetría láser, VLBI y GNSS de una misma nave, frente al error del enlace local en tierra, a partir de una ejecución real del motor v0.40.0 sobre scenarios/lunar-infrastructure-space-tie.toml (un arco de 6.56 días, sigmas de las técnicas GNSS 10 m, VLBI 1 m, láser 0.1 m). Con un enlace local de 1 mm a 1 m, la sigma de la traslación láser menos GNSS se mantiene cerca de 1.04 m hasta que el enlace alcanza 1 m: está limitada por el ruido de medición de las técnicas, no por el enlace local. El mínimo fijado solo por el enlace es la raíz cuadrada de dos veces su sigma. MODELLED: un modelo de tres cuerpos restringido con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Qué familia de observables es sensible a los números de Love lunares h2, k2 y l2, a partir de una ejecución real del motor v0.40.0 sobre scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Cada celda es la derivada parcial RMS de las observaciones de una familia con respecto a un parámetro, en las unidades propias de esa familia (así que las celdas se comparan a lo largo de una fila, no de una columna); un guion significa que la familia no tiene sensibilidad. telemetría láser: h2 7.6, k2 ninguna, l2 9.8. seguimiento del orbitador: h2 ninguna, k2 0.00086, l2 ninguna. gravímetro de superficie: h2 2.9e+03, k2 4.3e+03, l2 ninguna. reloj de superficie: h2 2.8e-17, k2 2.8e-17, l2 ninguna. Con las cuatro familias, la sigma de Cramer-Rao es el 0.36 % del h2 nominal, el 0.52 % de k2 y el 1.16 % de l2. Añadir una familia nunca redujo el menor autovalor (28 de 28 adiciones), pero la traza de la pseudoinversa no fue mayor solo en 16 de 28: esa mitad del umbral G3 está en NOT MET. La familia del orbitador ve la integral a lo largo de la línea de visión de la aceleración de k2, una cifra del extremo superior. MODELLED: un modelo de tres cuerpos restringido con simplificaciones declaradas y entradas ilustrativas, no una medición de ninguna magnitud lunar. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.">
</picture>

**Estado en el registro: MODELLED, y tres umbrales están en NOT MET.** Los cálculos numéricos se comprueban frente a programas independientes
de numpy y scipy; nada se compara con una medición de una magnitud lunar, y nada es
VALIDATED. Se cumple: las dos soluciones de órbita son coherentes (q medio 5.81 frente a 6 esperado), y los enlaces del orbitador
elevan el menor autovalor del datum unas 111 veces, suponiendo una órbita conocida. **No se cumple**: el
error de modelo inyectado de 3e-10 m/s2 **no se detecta** (C3: la solución a bordo se conoce con una precisión de unos 350 m, así que
unos diez metros se ocultan en su covarianza); **no se logra la resolución entera** (éxito del 1 al 3 % a
25 dBi, y con los 12 dBi registrados el problema no puede plantearse); y la mitad de la traza de G3 al añadir una
familia de observables (la traza aumentó en 12 de 28 adiciones, cada vez porque la familia elevó el rango).
Cada incumplimiento queda fijado por una prueba. [Infraestructura lunar](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Abra [kshana.dev/studio](https://kshana.dev/studio/) y todo el motor se ejecuta en su
navegador, compilado a WebAssembly. No hay nada que instalar y no se sube nada. El Studio tiene
dos vistas del mismo motor, y un conmutador en la cabecera pasa de una a otra, conservando el
escenario, la vista y los ajustes que usted haya cambiado.

**La vista simple** es donde se abre el Studio. Parte de preguntas (cuántos satélites
puedo ver, puedo confiar en mi posición, cuánto tiempo puede un reloj mantener la hora, qué le hace un inhibidor
a mi receptor) y de un mapa de todo lo que puede hacer el motor, cada área con su proporción de
métodos validados. Abra un escenario y la respuesta aparece primero: una frase sencilla, escrita para
lo que mide ese escenario, y después sus cifras clave y un gráfico. Se muestran como máximo cinco ajustes,
los que más cambian la respuesta; el resto espera en **Ajustes avanzados**.
**Cómo se calcula esto** explica el método, y **Para investigadores** ofrece las cifras propias del motor,
el archivo de escenario, el código para ejecutarlo desde Python y la cita.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, vista simple, con el escenario incluido integrity-raim, motor v0.40.0 ejecutándose localmente. La pregunta: ¿cumple la geometría los límites de alerta (nivel de protección horizontal y vertical)? Primero la respuesta, marcada como Resultado en vivo: Sí, en su mayor parte: durante el 95.3 % de las 12 h. La cota de error del receptor se mantuvo por debajo de los límites de alerta (40 m horizontal y 50 m vertical) en 344 de 361 comprobaciones, y ninguna posición fue engañosa. Cifras clave: tiempo en que se puede confiar en la posición 95.3 %, mayor intervalo sin servicio 10 min, cota de error típica 6.5 / 13 m, posiciones engañosas 0. Al lado, Pruebe otros ajustes con cinco de ellos (el error de distancia, los dos límites de alerta, la duración y la máscara de elevación) y Ejecutar de nuevo, y después las secciones plegadas Ajustes avanzados (13 más), Cómo se calcula esto (8 validados, 6 modelados) y Para investigadores. Debajo, las vistas de este resultado y los niveles de protección representados frente al límite de alerta." width="100%">
</picture>

**La vista avanzada** es el panel completo: la biblioteca de escenarios, cinco pasos numerados
(Elegir, Configurar, Ejecutar, Leer resultados, Compartir o exportar), las cifras clave con indicadores PASS y FAIL
donde la ejecución declara un umbral, y todos los paneles: resumen, gráficos, mapas, repetición, el
informe del motor y las exportaciones. Un único cuadro de búsqueda llega a los escenarios, los dominios y los campos que contienen,
y puede fijar hasta cuatro ejecuciones y compararlas lado a lado.

<details>
<summary>La pantalla inicial de la vista simple y la vista avanzada tras una ejecución</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, vista simple, pantalla inicial, titulada ¿Qué le gustaría averiguar?, con el motor v0.40.0 en vivo y, en la barra superior, tres enlaces: Informe de formación, Mapa de interferencias y Confianza en el receptor. Cuatro preguntas: cuántos satélites puedo ver en cualquier lugar de la Tierra, puedo confiar en mi posición, cuánto tiempo puede un reloj mantener la hora sin satélites y qué le hace un inhibidor a mi receptor. Debajo de la primera, su resultado registrado: al menos 22 satélites visibles en todos los lugares y 31 de media con GPS, Galileo, BeiDou y GLONASS juntos, una posición posible en el 100 % de los lugares y momentos, sobre un mapa mundial de satélites visibles, con un botón Abrir este resultado. Al lado, Todo lo que puede hacer Kshana: 16 áreas y 139 escenarios listos para ejecutar, cada tesela con un pequeño gráfico de una ejecución registrada y su proporción de métodos validados, y las 173 de 350 capacidades validadas del registro." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, vista avanzada, tras una ejecución del escenario incluido constellation-multi-gnss-coverage (Cuatro constelaciones GNSS, un mapa), motor v0.40.0 ejecutándose localmente. A la izquierda la biblioteca de escenarios, 139 escenarios en 16 dominios. Los cinco pasos Elegir, Configurar, Ejecutar, Leer resultados y Compartir o exportar, con el paso 4 activo. Cifras clave: 102 satélites, disponibilidad 100 % (PASS), dilución de la precisión de la posición (PDOP) mediana 0.95 (PASS), PDOP percentil 95 1.105 (PASS), 31.03 satélites visibles de media y 22 como mínimo. Debajo, la fila de paneles con Cobertura seleccionada, la barra de repetición, un mapa mundial del PDOP medio de 0.831 a 1.0853 con todos los satélites dibujados, y las cifras de cobertura global." width="100%">
</picture>

</details>

El código fuente del Studio y sus notas de compilación están en [`web/README.md`](web/README.md).

### El sitio

El resto de [kshana.dev](https://kshana.dev) se construye a partir de los propios archivos y ejecuciones del motor de este
repositorio: misiones, capacidades, el registro de evidencias, la investigación publicada y las
ediciones.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Tres páginas de kshana.dev lado a lado. La cabecera de Inicio: la línea del nombre Kshana · क्षण · el instante preciso sobre el titular Ensaye el minuto en que el GNSS se apaga, con la consola de misión de una ejecución real del motor v0.40.0 (un globo y tres gráficos en vivo: error de tiempo del reloj, densidad portadora-ruido y nivel de protección). Evidencias, Investigación publicada: los seis artículos de arXiv basados en el motor abierto, el más reciente con una figura del motor. Ediciones, Kshana Pro, el mismo motor, ampliado: Free ejecuta un escenario, Pro responde a la pregunta del programa." width="100%">
</picture>

<a id="capabilities"></a>
## Capacidades

Un único motor cubre toda la cadena de fallos, desde el primer satélite perturbado hasta el último
nanosegundo de holdover del reloj. El motor tiene 92 tipos de escenario; `kshana kinds` los
enumera y [`docs/SCENARIOS.md`](docs/SCENARIOS.md) documenta cada campo.

| Capacidad | Qué responde |
|---|---|
| [Espectro](docs/SPECTRUM.md) | cómo un inhibidor ocupa la banda L de GNSS, banda a banda, segundo a segundo |
| [Relojes y temporización](docs/TELECOM-TIMING.md) | cuánto tiempo mantiene la hora cada reloj tras perder el GNSS |
| [Constelaciones alrededor de cualquier cuerpo](docs/CONSTELLATION-DESIGN.md) | cobertura, dilución de la precisión y disponibilidad alrededor de la Tierra, la Luna o Marte |
| [Sistema solar](docs/SOLAR-SYSTEM.md) | dónde está cada planeta y el tiempo de luz de cualquier enlace |
| [Navegación en órbita terrestre baja](docs/LEO-PNT.md) | un paso, un enlace, un mensaje de navegación y una posición fusionada, etapa a etapa |
| [Campañas](docs/CAMPAIGNS.md) | una misión encadenada, un barrido o un conjunto de Monte Carlo en un solo escenario |
| [Animación](docs/ANIMATION.md) | la serie temporal de una ejecución como dibujo animado, reproductor o fotogramas |
| [Informes](docs/REPORTS.md) | cada cifra con su unidad y su etiqueta, en HTML (HyperText Markup Language) y JSON (JavaScript Object Notation) |
| [Exportaciones de interoperabilidad](docs/INTEROP.md) | órbitas y geometría para otras herramientas: SP3, CCSDS OMM y OEM, CZML, KML, GeoJSON, STK y SigMF |
| [Confianza marítima](docs/MARITIME-TRUST.md) | puede el puente confiar en esta posición: una puntuación de 0 a 100 y sus motivos para el NMEA de un buque, en vivo o desde un registro (consultivo, no un equipo de navegación homologado) |
| [Flujos NMEA de formación](docs/NMEA-TRAINING.md) | NMEA sintético de puente con jamming y spoofing programados y un registro del instructor, para la formación de la tripulación (solo texto; nunca para los sistemas de navegación en vivo de un buque; consultivo, no un equipo de navegación homologado) |
| [Mapa de interferencias](docs/INTERFERENCE-MAP.md) | dónde notificaron aeronaves y buques datos de navegación degradados, y qué parte de una ruta afecta |
| [Región del emisor](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | dónde, bajo hipótesis declaradas, puede estar una fuente de informes de posición degradados: regiones con una confianza declarada, un centroide con su elipse, nunca un punto (MODELLED; `kshana interference-map locate`) |
| [Paquetes de evidencias](docs/EVIDENCE-PACKS.md) | un registro técnico firmado y verificable sin conexión de una ventana del registro de un buque y de lo que el motor calculó a partir de ella, para un informe de incidente (consultivo, no un equipo de navegación homologado) |
| [Telemetría de confianza](docs/TRUST-TELEMETRY.md) | el flujo de confianza como métricas de Prometheus, eventos SIEM y OpenTelemetry opcional, con un panel de Grafana de ejemplo (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K y OpenCPN](docs/MARINE-INTEGRATIONS.md) | la puntuación de confianza en el servidor Signal K de una embarcación y en OpenCPN, con una compilación de referencia para un pequeño ordenador junto al receptor (consultivo, no un equipo de navegación homologado) |
| [Exportación a banco de pruebas](docs/TEST-BENCH.md) | `kshana bench-export`: el movimiento del vehículo y los eventos de un escenario para un simulador GNSS de laboratorio (no se escribe ninguna señal), y cómo puntuar después el registro del receptor |
| [Correspondencia normativa e informe](docs/compliance/README.md) | `kshana compliance-report`: para qué filas de marcos públicos de resiliencia aporta evidencia un conjunto de ejecuciones, y la brecha que queda |
| [Cuadernos](notebooks/README.md) | tutoriales ejecutables: confianza de buques y flujos de formación, exposición de una ruta en el mapa de interferencias, correspondencia normativa y el banco de pruebas, GDOP cuántico frente a clásico |
| [Verificador de Galileo OSNMA](docs/OSNMA.md) | los datos de navegación de qué satélites puede autenticar criptográficamente un receptor, y por qué falla una comprobación; Kshana no concede ningún derecho bajo los IPR del ICD de OSNMA de la UE (véase el NOTICE en la página) |

Los formatos de exportación completos: SP3 es Standard Product 3; CCSDS OMM y OEM son los Orbit
Mean-elements y Orbit Ephemeris Messages del Consultative Committee for Space Data
Systems; CZML y KML son los Cesium y Keyhole Markup Languages; STK es Systems Tool Kit;
SigMF es el Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="La campaña encadenada campaign-jam-spoof-holdover-integrity, una ejecución real del motor (semilla 20260928): 6 fases (Nominal → Jamming → Spoofing → Holdover → Alarma de integridad → Recuperación) y 18 ejecuciones miembro en una rejilla de 10 s a lo largo de T+01:16:10. Tres carriles: el error de tiempo del reloj frente a un margen de 50 ns (máximo 62.7 ns), la densidad portadora-ruido efectiva frente a un mínimo de 25 dB-Hz (mínimo -12.2 dB-Hz) y el nivel de protección vertical frente a un límite de alerta de 50 m (máximo 135.4 m), con los eventos de alarma de la ejecución: T+00:20:00 alarma del detector de spoofing de RF (monitores fusionados de coherencia, potencia y calidad de señal); T+00:26:10 alarma del monitor de spoofing asistido por reloj." width="100%">
</picture>

<details>
<summary>Cada capacidad, dibujada a partir de una ejecución real: la cascada de la banda L, el mapa de cobertura, el sistema solar y un paso en órbita terrestre baja</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="La banda L de GNSS como una densidad espectral de potencia a lo largo de 60 s, a partir de una ejecución real del tipo spectrum (l-band-waterfall-jamming.toml, semilla 7, motor v0.40.0): la frecuencia en horizontal, el tiempo hacia abajo, el color para la potencia por encima del ruido de fondo de -202.0 dBW/Hz. Inhibidores: dispositivo de privacidad de barrido (chirp, activo a los 10 s, inactivo a los 40 s); tono CW en L1 (cw, activo a los 30 s); ruido de banda estrecha en L2 (narrowband, activo a los 45 s). Peor banda GPS L1 C/A: C/N0 efectiva mínima de 3.2 dB-Hz a los 31 s frente a un mínimo de seguimiento de 25 dB-Hz. GPS L1 C/A mínimo 3.2 dB-Hz; Galileo E1 mínimo 4.7 dB-Hz; GPS L2C mínimo 36.9 dB-Hz; GPS L5 mínimo 44.1 dB-Hz; Galileo E5a mínimo 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Satélites visibles sobre toda la Tierra durante un día, a partir de una ejecución real de constellation-design (constellation-multi-gnss-coverage.toml, motor ejecutado por este generador): 102 satélites (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Cada celda de 10 grados está sombreada según el número medio de satélites por encima de la máscara de 10 grados (27.2 a 36.5); los puntos son las muestras de la traza en tierra del motor, una por hora por satélite. Disponibilidad global del 100.00 % con PDOP igual o inferior a 6, PDOP mediano 0.95, media de 31.0 y mínimo de 22 satélites visibles." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="El sistema solar en la época del escenario 2026-09-28T00:00:00, a partir de una ejecución real del tipo solar-system (solar-system-tour.toml): el Sol, 9 planetas y el planeta enano Plutón vistos desde encima de la eclíptica, con las distancias comprimidas logarítmicamente para la visualización, con el tiempo de luz en un sentido de cada cuerpo desde la Tierra. Mercurio 0.47 au, 10.1 minutos luz, VALIDATED; Venus 0.73 au, 3.0 minutos luz, VALIDATED; Marte 1.55 au, 14.0 minutos luz, VALIDATED; Júpiter 5.30 au, 49.5 minutos luz, VALIDATED; Saturno 9.44 au, 70.2 minutos luz, VALIDATED; Urano 19.44 au, 157.4 minutos luz, MODELLED; Neptuno 29.88 au, 240.2 minutos luz, MODELLED; Plutón 35.61 au, 292.2 minutos luz, MODELLED. Enlaces: Marte a Júpiter en un sentido 2193.5 s; Saturno a la Tierra en un sentido 4212.2 s; Europa a Júpiter en un sentido 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Un paso en órbita terrestre baja (LEO) a partir de una ejecución real del tipo leo-pass (leo-pass-iridium.toml, motor ejecutado por este generador): Iridium-pass a 781 km, banda STL a 1621 MHz, visto por un usuario aéreo a 50° N 30° W. Por encima de la máscara de 5° durante 750 s, elevación máxima de 65.0° a los 444 s. La densidad portadora-ruido alcanza un máximo de 80.5 dB-Hz (mediana 71.3), 34.3 dB por encima de la mediana GNSS de 46.2 dB-Hz de 8 satélites GPS visibles (38.2 a 51.1 dB-Hz); el Doppler llega a 35.4 kHz." width="100%">
</picture>

Ejecute cualquiera de ellos con `kshana example <scenario> > s.toml && kshana s.toml`: los escenarios
son `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
y `leo-pass-iridium`.

</details>

<details>
<summary>Las capacidades marítimas y de interferencias, dibujadas a partir de entradas sintéticas incluidas: una puntuación de confianza, un mapa de interferencias con la exposición de una ruta, un flujo de formación y un paquete de evidencias</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Puntuación de confianza a lo largo de una travesía sintética, a partir de una ejecución real del motor v0.40.0 sobre examples/maritime-trust (un registro NMEA inventado de un ferri en una ruta de Tallin a Helsinki, 3001 épocas a 1 Hz). Tres carriles comparten un mismo eje temporal. Arriba: la distancia entre la posición que informa el receptor y la posición real del buque, que se mantiene dentro de unos pocos metros hasta alrededor de 1576 s, cuando el arrastre de posición programado en el registro la aleja, mientras el receptor sigue informando de una posición válida. En medio: la puntuación de confianza de 0 a 100, no calculada durante los primeros 300 s de calibración, en la banda nominal (al menos 90) hasta el arrastre, y después cayendo a través de la banda degradada (al menos 55) hasta la banda no fiable. Abajo: la banda de cada época como una cinta coloreada con su nombre. La puntuación es consultiva. Software de carácter consultivo, no un equipo de navegación homologado (IEC 61108, IEC 61162): el operador sigue siendo responsable de la navegación del buque. El registro es inventado para mostrar el formato y los monitores; no es una medición y no dice nada sobre cómo se comportaría ningún receptor." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Dos días sintéticos de mapa de interferencias dibujados a partir de las muestras incluidas en examples/interference-map/output, cada uno con su propia ruta sintética y las proporciones de exposición de la ruta que informa el motor. A la izquierda, un día ADS-B: 1 celda degradada, 6 no degradadas, 4 sin evaluar (rayadas) y celdas sin entrada, dibujadas vacías, que no se observaron. La ruta mide 525 km: el 11.5% de su longitud en celdas degradadas, el 38.3% no degradadas, el 9.1% sin evaluar y el 41.1% no observadas. A la derecha, un día AIS: celdas marcadas por los detectores de círculo y de posición en tierra, celdas no anómalas y celdas vacías; la ruta mide 454 km con el 10.5% en celdas anómalas, el 21.2% no anómalas, el 0.0% sin evaluar y el 68.3% no observadas. ADS-B y AIS son capas separadas, nunca combinadas. Una celda marcada no es una constatación de interferencia, y una celda sin color no se observó, lo cual no es lo mismo que despejada. Todos los datos son inventados, en pleno Atlántico central, y no son una medición." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Flujo de formación del escenario coastal-drag-off (motor v0.40.0, semilla 22, 25 minutos a una posición cada 10 s del registro del instructor). Un mapa muestra la derrota real del buque y la derrota que informa el receptor: coinciden hasta que comienza un arrastre de posición programado a los 421 s; la derrota informada se aleja entonces de la real mientras el receptor mantiene una posición válida, y vuelve cuando el evento termina a los 1140 s. Al lado, la distancia entre las dos derrotas a lo largo del tiempo y la densidad portadora-ruido media que informa el receptor, que sube a un nivel elevado mientras dura el evento. Datos de formación sintéticos generados por Kshana. Solo para formación y pruebas: nunca introduzca este flujo en los sistemas de navegación en vivo de un buque. Consultivo, no un equipo de navegación homologado. Software de carácter consultivo, no un equipo de navegación homologado (IEC 61108, IEC 61162): el operador sigue siendo responsable de la navegación del buque. Las posiciones, fechas y derrotas son inventadas." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="La estructura de un paquete de evidencias. Un registro de receptor (NMEA, u-blox UBX, RINEX 3 o un registro de Android) y una ventana de tiempo entran en kshana receiver-trust evidence, que escribe siete archivos: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig y un timestamp.tsr opcional. El manifiesto registra el SHA-256 del registro completo y de cada archivo, y una cadena de hashes sobre los archivos; la firma cubre el manifiesto. kshana evidence verify comprueba la firma, el hash de cada archivo, la cadena y que no haya ningún archivo no listado, y termina con 0 cuando está verificado, 1 cuando algo falló y 3 cuando el firmante no estaba fijado. Un paquete es un registro técnico, no un dictamen jurídico." width="100%">
</picture>

Los cuatro son datos inventados y de carácter consultivo: muestran el formato y el comportamiento del software, no cómo se comporta ningún receptor o sistema frente a interferencias. Ejecute el primero con `kshana receiver-trust examples/maritime-trust/session.toml`, el segundo con `kshana route-exposure` sobre las muestras de `examples/interference-map/`, el tercero con `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (solo para formación: nunca lo introduzca en equipos de navegación en vivo) y el cuarto como en [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>La tabla completa de capacidades, dominio a dominio</summary>

A continuación figura el detalle completo dominio a dominio; para un registro de madurez por capacidad véase
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) y [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Dominio | Capacidad |
|--------|------------|
| **Órbita y geometría** | Propagación SGP4/SDP4 (validada hasta 4.12 mm frente a los 666 vectores de AIAA 2006-6753); elementos de dos líneas reales (una instantánea de Celestrak `gps-ops` incluida y fechada) o constelaciones Walker-delta sintéticas cuyos elementos medios realizan la fórmula `i:T/P/F` con menos de 1 km de diferencia en una propagación de 24 h; visibilidad multiconstelación, **dilución de la precisión — geométrica, de posición, horizontal, vertical y de tiempo (GDOP/PDOP/HDOP/VDOP/TDOP), validada hasta 1e-6 frente a gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), y disponibilidad GNSS; un optimizador de diseño de constelaciones sin gradientes, dimensionamiento del número mínimo de satélites por streets-of-coverage, una herramienta de comparación multiconstelación y un **barrido de diseño** Walker que tabula cobertura / PDOP / tiempo de revisita sobre una rejilla de planos × satélites e informa de los diseños óptimos de Pareto. |
| **Propagador numérico** | Un propagador numérico de **Cowell** (`src/propagator.rs`) que complementa la vía analítica SGP4/SDP4, con un modelo de fuerzas jerárquico de **siete perturbaciones** (`src/forces.rs`): dos cuerpos + el campo **zonal J2–J6** completo (los coeficientes armónicos zonales del achatamiento terrestre J2 a J6; el gradiente analítico exacto de su potencial perturbador), un **geopotencial armónico esférico teseral EGM2008 hasta grado/orden 70** opcional (Earth Gravitational Model 2008; `src/gravity_sh.rs`; coeficientes reales de la NGA — National Geospatial-Intelligence Agency de EE. UU. (Estados Unidos) —, recurrencia de Legendre normalizada de Holmes–Featherstone, comprobada de forma cruzada frente a las funciones de Legendre en forma cerrada y la identidad analítica ∇V), gravedad de terceros cuerpos **Sol y Luna dependiente de la época** (una efeméride integrada de baja precisión, sin núcleo DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel —), **presión de radiación solar** (modelo de bala de cañón con sombra cónica de umbra+penumbra), **resistencia atmosférica** (densidad exponencial por tramos de Vallado, atmósfera en corrotación), la **corrección relativista post-newtoniana de Schwarzschild** y el término de **arrastre de marco de Lense–Thirring** (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, lineal en el momento angular de la Tierra, ~1–2 órdenes por debajo de Schwarzschild), impulsado por uno de dos integradores adaptativos (RK4 — Runge–Kutta de cuarto orden — con duplicación de paso o el par embebido **Dormand–Prince RK5(4)**). **Validado frente a Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853`: 278 épocas en LEO (órbita terrestre baja) + GTO (órbita de transferencia geoestacionaria), con los niveles de fuerzas conservativas coincidiendo hasta un peor caso de **\|Δr\| 0.08 m en 24 h** (`tests/numerical_cowell_propagator_reference.rs`); el nivel de resistencia atmosférica se caracteriza por separado (≈ 333 m / 24 h) y las entradas absolutas de efemérides del Sol y la Luna y de densidad siguen siendo, con honestidad, **Modelled**. Evidencia interna adicional (no validación externa): la órbita no perturbada se comprueba frente a la solución exacta de Kepler en variable universal hasta **menos de un metro en 24 h**, la energía y el momento angular se conservan hasta ~1e-9, y cada perturbación coincide con una firma en forma cerrada derivada a mano. |
| **Maniobras y diseño de trayectorias** | Nodos ΔV impulsivos con propagación de covarianza 6×6 (marcos de error de ejecución ECI — inercial centrado en la Tierra — / LVLH — vertical local, horizontal local —), integración de encendidos finitos comprobada frente a la ecuación del cohete de **Tsiolkovsky** en forma cerrada hasta < 0.01 %, un solucionador de **Lambert** de **Izzo-2015** de una sola revolución, un propagador de **Kepler** exacto en variable universal y un barrido **porkchop** (lanzamiento × llegada) de C3 (energía de lanzamiento) / V∞ de llegada emitido como una rejilla de contornos JSON: la capa de simulación de prestaciones por encima de GMAT/Orekit, con cada salida de Lambert verificada de ida y vuelta frente a la verdad de dos cuerpos y el mínimo del porkchop comprobado frente al mínimo analítico de Hohmann. |
| **Sistemas de tiempo y marcos de referencia** | Escalas **UTC / TAI / TT / UT1** con segundos intercalares del IERS (Tiempo Universal Coordinado, Tiempo Atómico Internacional, Tiempo Terrestre y el tiempo de rotación terrestre Tiempo Universal 1), una API (interfaz de programación de aplicaciones) de fecha juliana, el **ángulo de rotación de la Tierra** (ERA) de la IAU-2000 (Unión Astronómica Internacional), **TEME ↔ ECEF** basado en GMST (tiempo sidéreo medio de Greenwich) (ecuador verdadero, equinoccio medio ↔ centrado en la Tierra, fijo a la Tierra) con marcos geodésicos WGS-84 (World Geodetic System 1984), precesión IAU 2006 (Fukushima–Williams), **nutación IAU 2000A/2000B** completa, **movimiento del polo** del IERS y la reducción **GCRS↔ITRS IAU 2006/2000A basada en el CIO** sin equinoccio (CIO = Celestial Intermediate Origin), todo validado **bit a bit** frente a los vectores de SOFA/ERFA y **comprobado de forma cruzada e independiente frente a ANISE** (la reimplementación en Rust puro de NAIF/SPICE; NAIF = la Navigation and Ancillary Information Facility de la NASA, la National Aeronautics and Space Administration de EE. UU.): el GCRS→ITRS de kshana frente al ITRF93 (International Terrestrial Reference Frame 1993) de ANISE a partir de `earth_latest_high_prec.bpc` del JPL, con los mismos parámetros de orientación de la Tierra del IERS para ambos, coinciden hasta **≤ 0.86 m en el suelo / ≤ 3.6 m en la órbita GNSS** (máx. 0.028″) en ocho épocas entre 2020 y 2023. |
| **Inercial** | INS strapdown de tres ejes: actitud en cuaterniones, mecanización WGS-84 NED (norte-este-abajo), compensación de coning/sculling y un modelo de error de IMU determinista (factor de escala, desalineación, sensibilidad a g, cuantización, deriva); un **acelerómetro de interferómetro de átomos fríos desde primeros principios** (fase de Mach–Zehnder, ruido de proyección cuántica, decaimiento del contraste, acoplamiento de vibraciones) que *deriva* el coeficiente de paseo aleatorio de velocidad; y un **filtro de partículas** de remuestreo por importancia secuencial para la navegación sin GPS asistida por mapas (referenciada al terreno o a la gravedad). |
| **PNT alternativo (sin GPS)** | Un **modelo de medición de gravímetro** de átomos fríos cuyo nivel de ruido blanco (`σ = ASD/√τ`, ASD = densidad espectral de amplitud) se deriva de la física del acelerómetro CAI; un **campo de anomalías de gravedad en armónicos esféricos** de bajo grado y totalmente normalizado (comprobado frente a las funciones de Legendre en forma cerrada y una anomalía de un solo término derivada a mano) más mascones sintéticos; el **núcleo de síntesis de funcionales de gravedad** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`), el "lector de mapas" con el que compara un navegador asistido por gravedad, está validado frente a la **norma de gravedad normal GRS80** (Geodetic Reference System 1980), reproduciendo la gravedad normal de Somigliana en forma cerrada y los γ_e / γ_p publicados hasta **3.5e-12** y produciendo un mapa de perturbaciones físicamente acotado a partir del campo real **EGM2008** del ICGEM (International Centre for Global Earth Models) (RMS — media cuadrática — ≈ 26 mGal, máx. ≈ 89 mGal a g/o 70; `tests/icgem_gravity_reference.rs`); y un **filtro de partículas de correlación con mapas de gravedad** que recupera una trayectoria sin GPS a partir de la secuencia de anomalías que recorre. Se extiende a la **navegación referenciada al terreno** (TERCOM/SITAN — terrain contour matching / Sandia Inertial Terrain-Aided Navigation — frente a un DEM (modelo digital de elevaciones) SRTM (Shuttle Radar Topography Mission) `.hgt`, `src/altpnt/terrain.rs`), un **campo geomagnético principal IGRF-14** (International Geomagnetic Reference Field de 14.ª generación) hasta grado/orden 13 (`src/igrf.rs`, comprobado frente a la forma cerrada del dipolo inclinado y diferencias finitas de ∇V), y un navegador **combinado de gravedad + magnetismo + terreno** que fusiona los tres canales escalares en un único filtro de partículas (la información es aditiva: ningún canal empeora la posición). Una **referencia de 60 minutos sin GPS** (una interrupción de ~700 km / una hora en la que la solución inercial deriva hasta ~70 km) se recupera hasta **~145 m (< 500 m)** mediante un comparador jerárquico de grueso a fino: el objetivo *Quantum Wayfarer* del ESA NAVISP (Navigation Innovation and Support Programme). |
| **Fusión** | EKF (filtro de Kalman extendido) de estado de error GNSS/INS débilmente acoplado de 15 estados con realimentación en lazo cerrado (el paquete `gnss-ins`); una actualización de pseudodistancia **fuertemente acoplada** que sigue corrigiendo con menos de cuatro satélites; un filtro acoplado de **reloj + posición**; un estimador **de Kalman unscented (de puntos sigma)** general para mediciones fuertemente no lineales; un **navegador UKF** GNSS/INS fuertemente acoplado (pseudodistancia + Doppler) cuya propagación orbital con modelo de fuerzas se comprueba por autocoherencia hasta **0.77 m RMS** en un paso LEO curvo de 30 minutos que incluye una interrupción GNSS de 120 segundos (una cifra de coherencia del filtro, no una validación con referencia externa: este navegador sigue siendo MODELLED); y un **UKF GNSS/INS fuertemente acoplado de 17 estados** completo (posición, velocidad, error de actitud, sesgos de acelerómetro y giróscopo, sesgo y deriva del reloj) cuya **navegación a estima con CAI cuántico** cubre una interrupción de 120 segundos con el paseo aleatorio de velocidad derivado del acelerómetro de átomos fríos. |
| **Determinación de órbita** | Recuperación de un estado orbital `[r, v]` a partir del seguimiento de distancias desde estaciones terrestres, combinando el modelo de fuerzas de dos cuerpos + J2 y el integrador RK4 con un corrector **por lotes de Gauss–Newton** (`determine_orbit_batch`, menos de un metro / mm·s⁻¹ con distancias sin ruido, ~2 m con un ruido de fondo de 5 m) y una variante **secuencial** con filtro unscented (`determine_orbit_sequential`). |
| **Observabilidad y teoría de la estimación** | Una capa general y reutilizable de **información de Fisher / Cramér–Rao** (`src/fim.rs`): la matriz de información M = HᵀWH, la **cota inferior de Cramér–Rao**, el **rango de observabilidad y el espacio nulo del defecto de datum** (pseudoinversa de Moore–Penrose) y los escalares de diseño de experimentos **D/A/E/T-óptimos** a partir de un solucionador de autovalores de Jacobi simétrico. **Validado**: autovalores frente a `numpy.linalg.eigh`, la covarianza de la CRLB frente a σ²(XᵀX)⁻¹ mediante `numpy.linalg.inv` y el DOP GNSS a partir de la matriz de información, todos coincidentes hasta **1e-9** (`tests/fim_observability_reference.rs`), y además comprobado de forma cruzada frente a las cotas en forma cerrada de **Kay (1993)** con el alcance de la CRLB por Monte Carlo. Sustenta el motor de DOP, la CRLB de geolocalización pasiva y el **teorema de observabilidad** de las estaciones lunares absolutas (más abajo). |
| **Lunar y cislunar** | Un propagador del **problema circular restringido de tres cuerpos (CR3BP)** Tierra–Luna en el marco rotatorio, con la constante de Jacobi conservada y los cinco puntos de Lagrange (`src/cr3bp.rs`), ahora con una **matriz de transición de estado (STM) 6×6 y un corrector diferencial de disparo simple** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`) que produce órbitas **halo / NRHO** (órbita halo casi rectilínea) realmente periódicas: la STM se valida frente a diferencias finitas, las órbitas corregidas se cierran hasta la precisión de máquina, y partir del estado de apolunio publicado reproduce la **NRHO 9:2 sur de L2** (L2 = el segundo punto de Lagrange Tierra–Luna; la órbita del Gateway) con un periodo ≈ 6.57 d / perilunio ≈ 3,250 km, coherente con los ≈ 6.56 d / ≈ 3,370 km publicados (una solución del CR3BP, circular y sin el Sol, **no** validada frente a una efeméride real de LANS (Lunar Augmented Navigation Service)/Gateway; la transformación selenocéntrica MCI/MCMF (inercial centrado en la Luna / centrado en la Luna, fijo a la Luna) de la órbita corregida es un trabajo posterior); además de geometría PNT cislunar **LunaNet / LNIS** (LunaNet Interoperability Specification) (reducción MCI↔MCMF, coordenadas selenográficas) con un pase de **ARAIM en el polo sur lunar** que muestra con honestidad la brecha de integridad: un σ_URE (error de distancia del usuario) de ~30 m lleva el nivel de protección muy por encima de un límite de alerta de 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); y un **aumento del DOP con balizas de superficie** (`src/lunar_beacon.rs`) que muestra cómo unas pocas balizas de medición de distancia topografiadas en la superficie aportan las filas de línea de visión de baja elevación y amplio azimut de las que carece un conjunto solo orbital y siempre cenital, reduciendo el GDOP mal condicionado del polo sur y, mediante un presupuesto de error de suma cuadrática, la precisión de posición obtenida en metros (reutilizando el núcleo de DOP validado con gnss_lib_py y la forma cerrada de visibilidad con horizonte sin atmósfera; el análisis de la dilución de la precisión se describe en [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Conjunto PNT lunar** | Un conjunto de navegación lunar/cislunar construido sobre el núcleo CR3BP, cada uno un `kind` ejecutable: **Tiempo Coordenado Lunar** (`lunar-time-offset`, `src/lunar_time.rs`: la tasa secular LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = su forma francesa, Temps-Coordonnée Lunaire) a partir de la diferencia de autopotencial + término cinético, informada junto a la banda publicada de 56–59 µs/día); un observable geodésico de retardo **VLBI lunar** (interferometría de muy larga base) (`lunar-vlbi`, `src/lunar_vlbi.rs`: un retardo + tasa de diferencia de dos distancias en campo cercano con base terrestre, comprobado de forma cruzada frente al Δ-DOR (medición de distancia diferencial unidireccional delta) de onda plana del mismo código en el límite de campo lejano, con derivadas parciales verificadas por diferencias finitas); un estimador por lotes **conjunto multitécnica de OD + reloj** (`lunar-joint-od-clock`, `src/lunar_combination.rs`: un ajuste de Gauss–Newton que fusiona VLBI + distancias lunares locales + distancias entre satélites) que lleva un resultado de **observabilidad por información de Fisher**: la medición de distancias interna por sí sola deja un **defecto de datum** de sólido rígido de seis grados de libertad, así que la posición *absoluta* de una estación de superficie es inobservable hasta que se añade un enlace con un marco terrestre; un retardo **VLBI** con base terrestre *restablece* la observabilidad para una constelación escasa y *estrecha* la cota de Cramér–Rao para una rica, y el datum absoluto se cierra con **tres** estaciones terrestres no colineales (el resultado de observabilidad se describe en [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **realización del marco de referencia** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs`: un ajuste de datum de Helmert de 7 parámetros + enlace de orientación IAU 2015 WGCCRE, WGCCRE = el IAU Working Group on Cartographic Coordinates and Rotational Elements); un análisis de **volumen de servicio de clase Moonlight/LCNS** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs`: DOP / cobertura / disponibilidad + una envolvente generalizada de ARAIM lunar HPL/VPL (nivel de protección horizontal/vertical), reutilizando el núcleo de DOP validado con gnss_lib_py y la maquinaria LunaNet de σ_URE≈30 m); **PNT diferencial lunar** (`lunar-differential-pnt`, `src/lunar_dpnt.rs`: un análogo lunar del GNSS diferencial / sistema de aumentación basado en satélites (SBAS): cancelación exacta del reloj en modo común + decorrelación espacial de primer orden frente a la línea base, reutilizando el nivel de protección SBAS de DO-229E, siendo DO-229E la norma de prestaciones operativas mínimas de RTCA (antes Radio Technical Commission for Aeronautics) para receptores SBAS); y una **exportación de interoperabilidad alineada con LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs`: ida y vuelta de CCSDS-OEM (Orbit Ephemeris Message) + escala de tiempo lunar en el marco del cuerpo lunar IAU 2015, envuelta en el sobre KIF). Los niveles de evidencia de cada pieza están en la [matriz de verificación](docs/VERIFICATION-MATRIX.md): el Tiempo Coordenado Lunar, el estimador conjunto de OD + reloj, la realización del marco de referencia y la geometría del volumen de servicio son **VALIDATED** (cada uno frente a la referencia independiente que nombra su fila, como lo es la vía del núcleo del retardo VLBI); el observable VLBI, el resultado de observabilidad del defecto de datum, el PNT diferencial y la exportación de interoperabilidad son **MODELLED**. Los parámetros son valores **ilustrativos de fuentes públicas**: **no** validados frente a seguimiento real de VLBI/Gateway, **sin** afiliación ni respaldo de ninguna agencia, sin afirmación de TRL (nivel de madurez tecnológica) ni de herencia de vuelo. |
| **PNT en el espacio profundo y en Marte** | Un **motor de navegación radiométrica** abierto: tiempo de luz iterativo + retardo relativista de **Shapiro**, **Doppler y distancia** de dos, una y tres vías (Moyer de dos tramos), relaciones de retransmisión coherente del transpondedor, medición de distancia regenerativa/PN (pseudoaleatoria) (CCSDS 414, la norma de medición de distancia por pseudorruido) y **Δ-DOR** en el plano del cielo (CCSDS 506, la norma Delta-DOR), con medios de plasma solar/troposfera/ionosfera; análisis y emisión de mensajes de datos de seguimiento **CCSDS-TDM (503)**; un **filtro de información de raíz cuadrada de dinámica reducida** (aceleraciones empíricas RTN — radial, transversal, normal — + un reloj a bordo de 3 estados + resistencia atmosférica marciana) que realiza **determinación de órbita en LMO de Marte hasta ≈ 0.2 m** en un lazo cerrado sintético; un estimador de **fusión de una vía + dos vías** conjunto; un núcleo de dinámica multicuerpo (`Body{μ, re, zonals, gravity, IAU-pole}`, gravedad de Marte GMM-3 (Goddard Mars Model 3), un marco de Marte fijo al cuerpo de la IAU, una interfaz enchufable `EphemerisProvider`, fechas julianas en dos partes + TT↔TDB (Tiempo Dinámico Baricéntrico)); y el escenario de PNT por retransmisión **`mars-pnt`** (una constelación de retransmisión areoestacionaria MARCONI) con un **simulador de prestaciones GSE** de extremo a extremo (GSE = equipo de apoyo en tierra) (geometría → presupuesto de enlace → observables → SRIF → covarianza). **Validado por simulación** (cifras de mérito de covarianza / lazo cerrado); la dinámica de Marte con el Sol como cuerpo central se comprueba de forma cruzada frente a **DE440** del JPL (137 m con un arco de 1 día, `xval/anise-mars-od`). La validación con datos reales de seguimiento de DSN/ESTRACK está en la hoja de ruta. |
| **Sistema solar y PNT alrededor de cualquier cuerpo** | Una **efeméride de todo el sistema solar** sin núcleos (`src/ephem.rs`, `src/ephem_provider.rs`): cada planeta a partir de los **elementos keplerianos de Standish** del JPL (Tabla 1, 1800–2050 d. C.; Tablas 2a/2b, 3000 a. C.–3000 d. C.) con el error nominal publicado de cada planeta, la Tierra y la Luna separadas mediante la serie lunar, y Fobos, Deimos, Ío, Europa, Ganímedes, Calisto y Titán a partir de elementos medios del JPL y el modelo de rotación de la IAU (Unión Astronómica Internacional); **cualquier cuerpo respecto a cualquier otro** en el ICRF (International Celestial Reference Frame). `Body` lleva ahora **GM (parámetro gravitacional), radios, J2 (el segundo armónico zonal) donde está publicado y el polo y el meridiano principal de la IAU para dieciocho cuerpos**. El tipo **`solar-system`** informa de posiciones, velocidades, constantes, **tiempo de luz y distancia en una y dos vías** entre dos cuerpos cualesquiera (el solucionador radiométrico de tiempo de luz existente, con el retardo de Shapiro solar) y una traza orbital por cuerpo, suficiente para dibujar un sistema solar interactivo; el tipo **`body-pnt`** posiciona un orbitador o un módulo de aterrizaje **alrededor de cualquier cuerpo** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) con una constelación Walker local, la maquinaria de dilución de la precisión y de Gauss–Newton, y una distancia de espacio profundo desde la Tierra. **Validado** frente a JPL Horizons (DE441, JPL Development Ephemeris 441): de Mercurio a Saturno y la Tierra a partir de la Tabla 1 dentro del doble del error nominal (peor caso 1.87×), los ocho planetas a partir de las Tablas 2a/2b (peor caso 1.71×) y el tiempo de luz Tierra–Marte/Júpiter. **Modelled**: Urano y Neptuno a partir de la Tabla 1 (2.0× y 5.2× el error declarado frente a DE441), Plutón, las lunas y los resultados de navegación de `body-pnt`. |
| **PNT fusionado MEO + LEO** | `src/leo_fusion/`: posicionamiento, navegación y temporización LEO independientes del sistema sobre cualquier constelación (capas Walker, conjuntos de elementos, preajustes GNSS) y cualquier señal (portadora, tasa de chip, envolvente de C/N0, error de distancia de la señal en el espacio), con preajustes opcionales de un solo archivo que llevan sus fuentes (Xona Pulsar X1/X5, Iridium STL, señales de oportunidad de Starlink, CentiSpace, un sistema representativo en banda C, el modelo de efemérides de reloj cero ATOMIC). **`leo-pvt`**: **posicionamiento Doppler** por lotes a partir de la tasa de distancia (uno o varios satélites, estados de deriva del reloj y velocidad, geometría a lo largo y a través de la traza en un solo paso y la solución especular), **mínimos cuadrados ponderados conjuntos GNSS + LEO** con sesgos entre sistemas por sistema y sigmas por señal aportadas por quien llama, el DOP frente al número de satélites LEO, la cobertura **polar y ártica**, y la **transferencia de tiempo LEO a UTC** frente a la C/N0 y el oscilador. **`leo-ppp`**: un EKF (filtro de Kalman extendido) de PPP (posicionamiento preciso de punto) flotante solo con GNSS y con LEO, su tiempo de convergencia y una prueba de coherencia NEES de chi cuadrado. **`ntn-positioning`**: posicionamiento en redes no terrestres 5G a partir de la cota de Cramér-Rao del ancho de banda. **Validado**: la envolvente Doppler LEO frente a las cifras publicadas de Iridium y Xona. **Modelled**: el resto, con la tendencia del PPP comparada con Li et al. (2019); véase [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integridad** | RAIM (monitorización autónoma de la integridad en el receptor) instantáneo y por separación de soluciones (estilo ARAIM) con niveles de protección horizontal/vertical (HPL/VPL), detección y exclusión de fallos, y diagramas de integridad de Stanford; un nivel de protección de **separación de soluciones de hipótesis múltiples (MHSS)** con un presupuesto explícito de riesgo de integridad, incluido el **modo de fallo de toda una constelación con dos o más constelaciones** (ARAIM de la UE (Unión Europea) / DO-316, la norma de prestaciones de RTCA para equipos GPS de a bordo con aumentación basada en la aeronave), aplicado a una instantánea real de GPS + Galileo (`scenarios/araim-gps-galileo.toml`). El nivel de protección aplica la proyección unilateral del **sesgo nominal** `b_k = Σ_i|s_i|·b_nom` por modo de fallo y la sigma de **integridad** σ_URA (precisión de distancia del usuario; distinta de la de precisión σ_URE, error de distancia del usuario) del Integrity Support Message; véase [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). El núcleo de detección (los umbrales χ²/χ² no central/normal y los multiplicadores K) está **validado externamente frente a SciPy** en 171 casos (`tests/raim_reference.rs`); la geometría reutiliza el núcleo de DOP validado con gnss_lib_py. La *asignación del presupuesto* de riesgo de integridad de ARAIM MHSS en sí no tiene una referencia numérica publicada y sigue siendo, con honestidad, Modelled. |
| **Aumentación (SBAS)** | **Niveles de protección SBAS / WAAS** (WAAS = el Wide Area Augmentation System) en la forma de mínimos cuadrados ponderados de DO-229E (factores K de aproximación de precisión y de ruta) y la combinación **libre de ionosfera de doble frecuencia L1/L5** (siendo L1 y L5 dos bandas de señales civiles de GPS; IS-GPS-705, la especificación de interfaz de GPS para la señal L5, γ₁₅ ≈ 1.793) que sustenta DO-316, en `src/sbas.rs`. El algoritmo del nivel de protección está **validado externamente frente a la bifurcación SBAS-PL de RTKLIB** (RTKLIB = la biblioteca abierta de posicionamiento cinemático en tiempo real; PL = nivel de protección) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki y Takács 2017, DO-229D — la revisión anterior de DO-229 — App. J) ejecutada sobre **datos reales de EGNOS** (European Geostationary Navigation Overlay Service), reproduciendo su HPL hasta < 2e-3 m (`tests/sbas_reference.rs`); gLAB (el conjunto de herramientas GNSS Laboratory) v6.0.0 confirmó la misma convención. |
| **Reloj y temporización** | Holdover de Kalman de dos estados (covarianza en forma de Joseph, salud de coherencia NIS/NEES — innovación cuadrática normalizada / error de estimación cuadrático normalizado —); estabilidad de la familia de Allan (ADEV / MDEV / TDEV / HDEV / MTIE — desviación de Allan, de Allan modificada, de tiempo y de Hadamard, y error máximo de intervalo de tiempo) con intervalos de confianza específicos del tipo de ruido y un **ajuste completo de ley de potencias de cinco coeficientes IEEE-1139** (IEEE Std 1139, las definiciones de metrología de frecuencia y tiempo del Institute of Electrical and Electronics Engineers); los estimadores se validan con hardware real frente a **Stable32**: un **patrón primario de cesio 5071A real frente a un máser de hidrógeno** (556,990 muestras de fase, 16 factores de promediado, OADEV/OHDEV — desviación de Allan/Hadamard solapada — hasta 1e-3; `tests/cs5071a_reference.rs`) y la serie de regresión **canónica PHASE.DAT de Stable32** (139 factores de promediado, OADEV/MDEV/TDEV hasta 1e-3; `tests/phasedat_reference.rs`); los estimadores ADEV/MDEV/TDEV y la métrica de errancia de telecomunicaciones **MTIE** se comprueban además de forma cruzada frente a la **biblioteca independiente allantools 2024.06** hasta **< 1e-9** con la serie NIST SP 1065 (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); correcciones geométricas (Sagnac, vista común GNSS); y los métodos operativos de transferencia: **TWSTFT** (transferencia de tiempo y frecuencia bidireccional por satélite) con la forma cerrada de Sagnac del BIPM (Oficina Internacional de Pesas y Medidas), **vista común GNSS**, transferencia de tiempo libre de ionosfera por **PPP** (posicionamiento preciso de punto), un enlace **óptico** en espacio libre con centelleo por turbulencia y una **escala de tiempo de conjunto de relojes (papel)** por varianza inversa por debajo del mejor reloj que contribuye. Una **calculadora de holdover de reloj sin GNSS** (`src/holdover.rs`) expone el crecimiento del error en navegación libre de van Loan en forma cerrada como una inversión *de holdover hasta umbral* (cuánto tiempo funciona libre un reloj antes de que su error de temporización supere el presupuesto) para clases representativas de relojes clásicos y cuánticos; **modelada** (comprobada de forma cruzada frente a la recursión de covarianza multipaso `clock_state`), y honesta en que, para un reloj muy estable, el holdover hasta un umbral estricto lo fija el nivel de ruido de tau larga *supuesto*, no la ADEV citada. Un **nivel de protección de temporización condicional** (`src/tpl.rs`) extiende el holdover al spoofing: una cota del error de tiempo *no detectado*, dada una comprobación cruzada independiente, que combina un nivel mínimo de monitor de k sigmas, la varianza de navegación libre de van Loan durante la latencia de detección y un tiempo hasta la alarma CUSUM (suma acumulada). Calibrado con un spoofing real registrado (JammerTest 2024) y reproducible mediante `cargo run --example tpl_jammertest`; composición **MODELLED** (sin presupuesto de riesgo de integridad por hora), condicionada a la detección: no existe una cota *incondicional* finita. |
| **Dominio de medición GNSS** | Síntesis directa de pseudodistancia / Doppler con ionosfera **Klobuchar** (radiodifundida) e **IONEX / rejilla de TEC** (IONosphere map EXchange format / contenido total de electrones; medida), incluidos un analizador de archivos IONEX, interpolación temporal entre mapas y el mapeo de oblicuidad inclinada de capa delgada, troposfera **Saastamoinen + Niell** y RAIM instantáneo (HPL/VPL). |
| **Resiliencia** | **Jamming** por presupuesto de enlace (J/S → C/N₀ efectiva → pérdida de enganche — relación inhibidor/señal, relación portadora/densidad de ruido — con el factor de separación espectral antiinterferencia `Q` ahora **derivado de los espectros de potencia reales de la señal y del inhibidor** mediante `src/navsignal.rs`, `Q = 1/(R_c·κ)`, comprobado de forma cruzada en la CI frente a la constante representativa anterior); un **detector estocástico de spoofing de tiempo** (prueba de energía de Neyman–Pearson / χ²₁ con P_fa/P_md en forma cerrada y por Monte Carlo y una cifra de mérito (FoM) de seguridad de 1 − P_md); y un **detector de spoofing multicapa** que fusiona una prueba de paridad de coherencia RAIM (con el punto ciego de modo común modelado con honestidad), un monitor de potencia AGC (control automático de ganancia) de RF y un monitor de calidad de señal (SQM — monitorización de la calidad de la señal, early-minus-late); y un **presupuesto de error de navegación a estima inercial cuántica** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`) que combina el paseo aleatorio de velocidad de ruido blanco del interferómetro de átomos fríos con el sesgo residual (comprobado de forma cruzada frente al integrador independiente `AccelModel`) y el error de factor de escala en una cifra de deriva de posición durante el holdover: el gemelo inercial del holdover del reloj. Un **motor de puntuación de resiliencia alineado con marcos** (`src/resilience/`) asigna el comportamiento simulado de una arquitectura a subpuntuaciones por dimensión en las siete categorías de resiliencia propias de Kshana (no términos del DHS), alineadas con el Resilient PNT Conformance Framework del Department of Homeland Security de EE. UU., y después estudia la **estabilidad de la decisión** de cualquier puntuación compuesta única o nivel de madurez bajo un símplex de ponderaciones de Dirichlet y un conjunto de cinco amenazas: inestabilidad de rango de Kendall-τ, tasa de cambio del ganador principal y **colapso de diversidad** de modo común (Hill-N2), con un informe de garantía con hash de integridad (35 pruebas con referencia derivada a mano). Reproducible mediante `cargo run --example resilience_report`; arquitecturas sintéticas **MODELLED**, una autoevaluación alineada con RPCF v2.0, **no** una certificación. Véase [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Geolocalización pasiva de RF** | **Geolocalización de emisores por TDOA/FDOA** (diferencia de tiempo / de frecuencia de llegada; `src/geolocation.rs`): localiza un inhibidor o un suplantador (o una fuente de oportunidad para PNT inverso) a partir de hiperboloides de **diferencia de tiempo de llegada** a través de una red de receptores, resueltos por mínimos cuadrados de Gauss–Newton; añadir la **diferencia de frecuencia de llegada** con receptores en movimiento recupera conjuntamente la posición *y* la velocidad del emisor, con la cota de **Cramér–Rao** sobre la covarianza de la posición derivada de la geometría de la red. **MODELLED** (referencias de coherencia interna: idas y vueltas directo→inverso, la identidad J·CRLB = I, la monotonía del GDOP y el estimador alcanzando su propia CRLB por Monte Carlo): un modelo de fuente puntual con línea de visión, sin términos de multitrayecto / NLOS (sin línea de visión), sesgo del reloj del receptor ni refracción. |
| **Señal de navegación y seguimiento de código** | El **nivel de señal** entre el presupuesto de enlace y el dominio de medición (`src/navsignal.rs`): **densidades espectrales de potencia** (PSD) de área unitaria para **BPSK-R(n)** (modulación por desplazamiento de fase binaria con chips rectangulares) y **sine-BOC(m,n)** (portadora con desplazamiento binario); el **coeficiente de separación espectral** (SSC) κ = ∫ G_s·G_i df, que **deriva la `Q` antiinterferencia** que usa el modelo de jamming (`Q = 1/(R_c·κ)`) a partir de los espectros reales de la señal y del inhibidor en lugar de una constante representativa; el **ancho de banda RMS (de Gabor)** (BOC > BPSK: la medida de información de distancia / Cramér–Rao); la **fluctuación por ruido térmico del seguimiento de código DLL early–late coherente** (DLL = lazo de seguimiento de retardo; Kaplan y Hegarty; ~por debajo del metro para C/A — el código de adquisición gruesa de GPS — a 45 dB-Hz); y la **envolvente de error por multitrayecto** (EML coherente, early-minus-late: supresión por correlador estrecho). Validado frente a anclas en forma cerrada (auto-SSC de BPSK = 2/(3·R_c), PSD de área unitaria, fluctuación de C/A por debajo del metro). Se trata de análisis de **prestaciones** de la señal, **no** de diseño de hardware de antena / carga útil de RF (el papel de un socio de carga útil). |
| **Interoperabilidad** | Ingesta de efemérides radiodifundidas multi-GNSS **RINEX-3** (GPS, Galileo, QZSS — el Quasi-Zenith Satellite System de Japón —, BeiDou MEO/IGSO — órbita terrestre media / órbita geosíncrona inclinada — mediante IS-GPS-200, la especificación de interfaz de GPS; GLONASS, el Global Navigation Satellite System de Rusia, mediante RK4 del vector de estado PZ-90 — el datum ruso Parametry Zemli 1990 —) utilizable como fuente de constelación (entra RINEX, sale geometría PNT); un analizador de observaciones **RINEX-3** (pseudodistancia, fase de portadora, Doppler, intensidad de señal; se espera que la estructura de observaciones 4.00 se analice pero no está probada, y los archivos de navegación RINEX 4 se rechazan por su nombre en lugar de descodificarse mal) que ahora **alimenta un solucionador de posicionamiento de punto simple (SPP)** (`pvt`): entran observaciones de código reales, sale una **posición del receptor** real, validado con datos del IGS; un lector/escritor de efemérides precisas **SP3-c/d** con interpolación de Lagrange de 9.º orden; y exportación **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) para herramientas de dinámica de vuelo (GMAT, Orekit, STK — Systems Tool Kit —); y análisis y emisión de mensajes de datos de seguimiento **CCSDS-TDM (503)** para el seguimiento radiométrico de espacio profundo. |
| **Análisis de misión (ingeniería de sistemas)** | Presupuestos de diseño de misión de primer orden, cada uno un tipo ejecutable: **geometría de lanzamiento y ascenso** de dos cuerpos (`launch-window`: azimut de lanzamiento `sin Az = cos i/cos lat`, inclinación mínima, bonificación por la rotación terrestre, Δv de cambio de plano en dogleg, oportunidades diarias; `src/launch.rs`); un **corredor de reentrada balística de Allen–Eggers** (`reentry`: deceleración máxima, velocidad/altitud del máximo de g, velocidad del máximo calentamiento; `src/reentry.rs`); **geometría de cobertura de observación de la Tierra** (`eo-coverage`: franja / GSD (distancia de muestreo en el suelo) en el nadir / acceso fuera del nadir / revisita mediante el triángulo espacial de SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); un **presupuesto de error de actitud y apuntamiento de 3-DOF** (tres grados de libertad; `attitude-budget`: par de gradiente de gravedad en el peor caso + presupuesto de apuntamiento RSS (suma cuadrática); `src/attitude_budget.rs`); **predicción de pasos sobre estaciones terrestres** (`passes`: AOS/TCA/LOS, adquisición de señal / momento de máxima aproximación / pérdida de señal, elevación máxima, tiempo de acceso; `src/passes.rs`); y un **presupuesto de enlace unidireccional** sobre la ecuación de enlace de CCSDS 401 / DSN 810-005 (la norma de radiofrecuencia y modulación de CCSDS / el manual de diseño de enlaces de la Deep Space Network; `link-budget`: FSPL (pérdida de trayecto en espacio libre), C/N₀, Eb/N₀ (relación energía por bit / densidad de ruido), margen, cierre; `src/linkbudget.rs`). Presupuestos analíticos de primer orden **MODELLED**: la capa previa al hardware por debajo de STK/GMAT/Basilisk, no un sustituto de 6-DoF ni radiométrico. |
| **Análisis de decisiones y compromisos (MCDA)** | Un conjunto completo de **análisis de decisión multicriterio** (MCDA) (`src/mcda/`) que abarca las cuatro familias de métodos: agregación de valores (**WSM**, **WPM**, **WASPAS** — modelo de suma ponderada, modelo de producto ponderado, evaluación agregada ponderada de suma y producto —), distancia al ideal (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), programación de compromiso (**VIKOR**, del serbio para optimización multicriterio y solución de compromiso) y sobreclasificación (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, del francés para eliminación y elección que expresa la realidad), además de **MOORA** por sistema de razones (Multi-Objective Optimization on the basis of Ratio Analysis) y **COPRAS** proporcional (Complex Proportional Assessment), con ponderación de prioridades por comparación por pares **AHP** (Analytic Hierarchy Process) (razón de coherencia), un frente no dominado de **Pareto**, análisis de **sensibilidad** de los pesos y puntuación de **utilidad** multiatributo. Los nueve agregadores reproducen las bibliotecas independientes de terceros **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) y **pyDecision** (ELECTRE I, COPRAS) hasta **< 1e-9**, y el vector de prioridades AHP + la razón de coherencia coinciden con la tabla de índice aleatorio de Saaty y el solucionador de autovalores principal de SciPy/LAPACK hasta < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED**: la capa de decisión bajo el motor de estudios de compromisos. |
| **Entorno espacial** | Un **modelo del entorno de meteorología espacial** (`space-weather`, `src/space_weather.rs`): índices de actividad solar (F10.7 / F10.7a centrado de 81 días, el flujo de radio solar de 10.7 cm) y geomagnética (Kp, el índice K planetario, con la tabla de definición Kp↔ap, siendo ap su amplitud planetaria lineal), la temperatura exosférica de **Jacchia-1971** que determinan (validada frente a los mínimos/medios/máximos solares publicados) y la densidad neutra termosférica corregida por actividad frente a la estática en altitud: la dependencia de la densidad respecto del ciclo solar que omite la atmósfera estática USSA76 (US Standard Atmosphere 1976). **MODELLED**: un acoplamiento de altura de escala de primer orden calibrado, **no** una atmósfera validada con datos (NRLMSISE, el modelo Mass Spectrometer and Incoherent Scatter Radar Exosphere del US Naval Research Laboratory). |
| **Evaluación de IA/ML y compromisos** | Un **banco de pruebas de evaluación de la detección de deterioros de RF** (`impairment-eval`, `src/impairment_eval.rs`): un corpus **sintético** etiquetado y fundamentado en parámetros (nominal / jamming / spoofing de tiempo / spoofing de posición / multitrayecto), un sistema de evaluación **ROC/AUC** (característica operativa del receptor / área bajo la curva) independiente del detector que puntúa cualquier detector (energy \| agc \| sqm \| parity \| fused) con Pd (probabilidad de detección) por clase a una Pfa (probabilidad de falsa alarma) objetivo, y la **brecha de optimismo** dentro frente a fuera de la distribución (modo de desplazamiento de distribución). Además, un **compromiso PNT cuántico frente a clásico** (`quantum-trade`, `src/quantum_trade.rs`) que cuantifica el beneficio de holdover de temporización/inercial de un reloj candidato a partir de una curva de **ADEV medida** frente a una línea base clásica, con la salvedad del nivel mínimo de τ larga incluida en el artefacto y una envolvente de resiliencia sin GNSS en función del tiempo. Las **métricas** de evaluación (AUC / confusión / Pd-Pmd, siendo Pmd la probabilidad de detección omitida) están **validadas con coincidencia exacta frente a scikit-learn 1.9.0**, incluso con **telemetría real de ESA OPS-SAT** (el conjunto de datos de detección de anomalías OPSSAT-AD, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0 —), donde el ROC AUC de Mann–Whitney de Kshana reproduce `roc_auc_score` de scikit-learn hasta < 1e-9 en la partición de test reservada y un detector transparente por recuento de picos separa las anomalías etiquetadas con un AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`), y los **núcleos** numéricos del motor de compromisos (ajuste NNLS — mínimos cuadrados no negativos — de ADEV, bandas de coherencia χ², Q del reloj de van Loan) **frente a scipy 1.17.1**; las cifras de beneficio de dispositivo construidas encima siguen siendo características operativas **MODELLED**: nunca datos de campo/IQ (muestras en fase/cuadratura), sin veredicto de bueno/malo. Sobre el banco de pruebas, un **estudio más profundo de la brecha de optimismo** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) puntúa un panel de **13 detectores** (energía/AGC/SQM/paridad más detectores de regresión logística con semilla y MLP — perceptrón multicapa — de una capa oculta), ajusta **leyes de escala** dentro frente a fuera de la distribución con una hipótesis nula por permutación y aprende un **predictor por exclusión de uno** de la degradación fuera de la distribución a partir de estadísticos dentro de la distribución (`cargo run --example optimism_study`). Un **frontal de receptor definido por software** (`src/sdr.rs`: IQ/FI (frecuencia intermedia) en bruto → tomas early/prompt/late del correlador → SQM) y **adaptadores de ingesta de datos reales** (`src/realdata/`: RINEX, u-blox UBX (el protocolo binario de u-blox), GnssLogger, JammerTest, Yunnan, SatGrid) permiten ejecutar los mismos detectores sobre grabaciones aportadas localmente (no se incluye ningún conjunto de datos). El **mapa de cruce de resiliencia cuántica frente a clásica** bajo incertidumbre de parámetros (`src/crossover.rs`; `cargo run --bin crossover_study`) regenera los estudios de cruce inercial y de reloj en los que se basan las figuras de Resultados. |
| **Demostrador de PNT con tecnología cuántica** | Tres áreas de aplicación ejecutables y **MODELLED** sobre el motor abierto, cada una emitiendo `TradeEvidence` honesta + un registro de representatividad / brechas hasta el vuelo (`src/representativeness.rs`): **transferencia de tiempo cuántica de confianza** (`quantum-time-transfer`, `src/timetransfer_chain.rs`: un presupuesto de extremo a extremo de reloj de red óptica + enlace fotónico frente a CSAC (reloj atómico a escala de chip) + RF bidireccional, con un nivel de protección de temporización reutilizado, una FoM de seguridad frente a ataques de retardo/repetición (1 − P_md) y detección de anomalías del reloj + latencia CUSUM); **navegación cuántica sin GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs`: una navegación inercial libre con interferómetro de átomos fríos frente a una INS de grado de navegación durante una interrupción GNSS, honesta en que sin una posición externa el sesgo del acelerómetro es inobservable y el error sigue creciendo); y **detección de fallos/anomalías** de sistemas cuánticos (`quantum-anomaly-detect`, `src/quantum_faults.rs`: un catálogo de fallos etiquetado con un ROC AUC con IC (intervalo de confianza) bootstrap a partir del `eval_stats` validado externamente y un fallo mínimo detectable a una tasa de falsas alarmas fija). Una **biblioteca común de modelos de error de dispositivos cuánticos** (`src/quantum_devices.rs`) y un **sistema unificado de compromisos cuántico frente a clásico** (`src/qtrade.rs`) los sustentan. Se reutilizan los núcleos validados en los que se apoyan (métricas de evaluación frente a scikit-learn, núcleos de compromisos frente a scipy); las cifras de beneficio de dispositivo construidas encima siguen siendo **MODELLED**: parámetros de dispositivo/enlace **ilustrativos de fuentes públicas**, modela la *clase*, sin TRL / herencia de vuelo / certificación, sin respaldo de ninguna agencia. |
| **Ingeniería frugal e impacto en la integridad** | Una perspectiva de **ROI por cobertura** (retorno de la inversión) (`src/frugal.rs`), el coste por unidad de cobertura entregada en un compromiso de arquitectura, y una correspondencia **detección omitida → impacto en la integridad** (`src/integrity_impact.rs`) que convierte la tasa de detecciones omitidas de un monitor en su contribución al riesgo de integridad. Presupuestos de apoyo a la decisión **MODELLED**, aditivos. |
| **Intercambio de artefactos** | El **Kshana Interchange Format (KIF)** (`src/interchange.rs`): un sobre versionado y autodescriptivo que envuelve el resultado de un escenario con su tipo, la versión del esquema y las etiquetas MODELLED/VALIDATED, de modo que un artefacto almacenado siga siendo autodocumentado y los sobres más antiguos sigan siendo legibles con compatibilidad hacia delante. |

Cada capacidad es accesible como API de Rust, como `kind` de escenario ejecutable, o ambas.
La madurez de cada capacidad (*validada*, *ejecutable* o *biblioteca*) se sigue en
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). Una **matriz de verificación comprobada automáticamente**
(`src/verification.rs`) presenta la referencia cruzada requisito → módulo → prueba → referencia independiente → estado,
con invariantes de honestidad probadas mediante pruebas unitarias que permiten una etiqueta *validada*
solo cuando la respalda una referencia **externa** independiente, y que registran las
capacidades de hardware/PA (aseguramiento del producto) que Kshana deliberadamente **no** proporciona.

</details>

<details>
<summary>Los cuatro paquetes de sensores, tal como se publicaron por primera vez (resultados)</summary>

### Resultados

Cada escenario compara un sensor cuántico con su homólogo clásico a lo largo de una
interrupción GNSS de ~1.8 h. Las cifras son reproducibles (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Lo que aportan los sensores cuánticos cuando el GNSS desaparece, escenario de holdover del reloj: el cuántico mantiene 6600 s de autonomía frente a 2610 s el clásico, un error de temporización mucho menor y una disponibilidad del 100% frente al 95.6%" width="88%">
  <br><sub>Lo que aportan los sensores cuánticos cuando el GNSS desaparece — <code>clock-holdover</code> · semilla 42 · dibujado con el motor 0.40.0, y cada cifra anterior se vuelve a comprobar frente al motor actual en cada compilación mediante <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

La ventaja **depende de la duración de la interrupción y de las vibraciones**, con un punto de equilibrio explícito en el que gana lo clásico, mostrado con honestidad a lo largo de la escala de madurez tecnológica (las cifras del reloj óptico son objetivos de demostradores en tierra; ningún reloj óptico de estroncio ha volado):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Cruce del holdover del reloj cuántico frente al clásico a lo largo de la escala de madurez tecnológica, con bandas de confianza" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Mapa de calor de la ventaja inercial cuántica frente a la clásica en función de la duración de la interrupción y de las vibraciones, con un contorno de equilibrio donde gana lo clásico" width="96%">
  <br><sub>Cruce de resiliencia cuántica frente a clásica — escala TRL del holdover del reloj (arriba) · mapa de la ventaja inercial con contorno de equilibrio (abajo). Regenerable mediante <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Navegación inercial a estima: error de posición durante una interrupción GNSS; el sensor cuántico (átomos fríos) se mantiene cerca de la línea de especificación mientras que el sensor de grado de navegación diverge hasta decenas de kilómetros" width="80%">
  <br><em>Error de posición de la navegación a estima durante una interrupción GNSS: el sensor cuántico (azul)
  se mantiene plano cerca de la especificación; el sensor clásico (rojo) diverge hasta decenas de kilómetros.
  Generado por Kshana a partir de <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Paquete | Escenario | Cuántico | Clásico |
|------|----------|---------|-----------|
| **1 — Holdover del reloj** | `clock-holdover.toml` (especificación de 20 ns) | el reloj óptico aguanta toda la interrupción | el CSAC incumple la especificación a mitad de la interrupción |
| **2 — Navegación inercial a estima** | `imu-deadreckoning.toml` (especificación de 100 m) | átomos fríos: **~41 m**, aguanta toda la interrupción | grado de navegación: incumple en **~350 s** → decenas de km |
| **3 — Transferencia de tiempo** (enlace óptico entre satélites) | `timetransfer.toml` | óptico: medición de distancia de **~0.3 mm** | RF (TWSTFT): medición de distancia de **~150 mm** |
| **4 — Fusión híbrida** (culminación) | `hybrid-pnt.toml` | posición + temporización completas durante toda la interrupción | **limitado en posición a los ~350 s** |

La culminación muestra la tesis de la fusión: la transferencia óptica de tiempo entre satélites mantiene enganchado incluso
un *reloj* clásico, aislando el sensor *inercial* como el eslabón débil del conjunto clásico,
es decir, inercial cuántico + temporización óptica juntos.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Holdover del reloj: error de fase durante una interrupción GNSS; el reloj óptico se mantiene dentro de la especificación de 20 ns durante toda la interrupción mientras que el reloj a escala de chip la incumple a mitad de la interrupción" width="80%">
  <br><em>Holdover del reloj durante una interrupción GNSS: el reloj óptico (azul) se mantiene dentro de la
  especificación de 20 ns durante toda la navegación libre; el reloj a escala de chip (rojo) la incumple a medio camino.
  Generado por Kshana a partir de <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Otro escenario, `orbit-gnss-challenged.toml`, deriva la disponibilidad GNSS de la
**geometría orbital** en lugar de ventanas escritas a mano: una nave espacial dentro de la capa
GNSS se propaga frente a una constelación Walker similar a GPS, y el número de satélites visibles
(línea de visión, ocultación por la Tierra, máscara de elevación) fija el estado de la posición en cada
paso. A lo largo de un día el usuario tiene posición solo ~59% del tiempo; el reloj cuántico mantiene una
solución de temporización de 5 ns en todos los intervalos sin servicio (disponibilidad **1.0**), el reloj a escala de chip
solo **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Órbita con GNSS limitado: error de temporización del reloj a lo largo de un día para una nave espacial dentro de la capa GNSS, donde los huecos de cobertura se derivan de la geometría orbital; el reloj óptico se mantiene dentro de la especificación de 5 ns en todos los huecos mientras que el reloj a escala de chip la incumple" width="80%">
  <br><em>Error de temporización a lo largo de un día con la disponibilidad GNSS derivada de la geometría orbital: el
  número de satélites visibles (línea de visión, ocultación por la Tierra, máscara de elevación) fija el estado de la
  posición en cada paso, así que el reloj debe funcionar libre en cada hueco; el reloj óptico mantiene la especificación
  de 5 ns mientras que el reloj a escala de chip la incumple. Generado por Kshana a partir de
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

La constelación también puede darse como conjuntos de elementos de dos líneas (TLE) reales. Un TLE *completo*
(línea 1 + línea 2) se propaga con el modelo **SGP4/SDP4** completo, incluidos la
resistencia atmosférica y los términos de espacio profundo lunisolares y de resonancia de 12 h / 24 h que
importan para las órbitas GNSS de ~12 h, validado frente a los vectores oficiales de AIAA 2006-6753
hasta un peor caso de ≈ 4 mm. `scenarios/orbit-sgp4-gps.toml` incluye una **instantánea real de Celestrak
`gps-ops`** de la constelación GPS operativa (2021-07-28, 30 satélites)
y exige sumas de comprobación de TLE válidas; los conjuntos de elementos de dos líneas son datos abiertos del catálogo de la US
Space Force / 18th Space Defense Squadron, redistribuidos por Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); actualícelos con
`scripts/fetch_tles.sh`. Un bloque solo con la línea 2 conserva
la propagación analítica de dos cuerpos (`scenarios/orbit-real-tle.toml`); las dos formas pueden
mezclarse en una misma constelación. Una constelación puede construirse igualmente a partir de un bloque de
registros de **efemérides radiodifundidas GPS RINEX-3** (el formato que descodifica un receptor),
propagados con el algoritmo de usuario de IS-GPS-200 y procesados por la misma geometría
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Qué es / qué no es, en su totalidad</summary>

<a id="what-it-is--is-not"></a>
### Qué es / qué no es

**Es:** un motor determinista y con pocas dependencias que abarca la pila PNT: geometría
orbital, navegación inercial, fusión GNSS/INS, integridad, relojes y temporización.
Ejecuta un escenario (a menudo una interrupción GNSS), hace evolucionar modelos de error de sensores calibrados
a través del estimador adecuado y puntúa el resultado frente a las cifras de mérito
operativas, emitiendo un resultado JSON (JavaScript Object Notation) reproducible y un gráfico SVG, desde una
biblioteca de Rust, una interfaz de línea de comandos (CLI), una extensión de Python, un módulo WebAssembly en el navegador, un
**servidor del Model Context Protocol (MCP)** para agentes de IA o un **plugin para IDE de JetBrains (entorno de
desarrollo integrado)**.

**No es:** hardware de vuelo, un diseño de carga útil cuántica, un receptor de señales GNSS
completo, un simulador de señales de radiofrecuencia (RF) ni un banco de hardware en el bucle, ni un
producto de aviónica certificado; y no sustituye a MATLAB/Simulink, STK (Systems Tool
Kit) ni Orekit: se sitúa junto a ellos e intercambia archivos con ellos. La fidelidad del hardware cuántico procede de
modelos de error publicados, no de esta herramienta. La madurez detallada de cada
capacidad está documentada en [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**No es (todavía):** un motor de física de interferometría atómica *completo* (la mayoría de los sensores cuánticos
consumen coeficientes publicados de Allan/presupuesto de ruido; el acelerómetro CAI (interferómetro de átomos fríos) tiene una
capa desde primeros principios — fase de Mach–Zehnder, ruido de proyección, decaimiento del contraste y
acoplamiento de vibraciones, además de los sistemáticos de Coriolis y de desplazamiento por luz —, pero los sistemáticos del frente de onda y
la resolución de la ambigüedad de franjas siguen siendo una capa **P2** (fase 2 de la hoja de ruta, la capa de física cuántica)
de la hoja de ruta, véase [`ROADMAP.md`](ROADMAP.md) y [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
un receptor GNSS certificado o de hardware (resuelve una posición **PVT** (posición, velocidad y tiempo) de punto
simple a partir de observaciones de código RINEX (Receiver Independent Exchange Format) reales, validada
con datos reales del IGS (International GNSS Service), y su capa IQ (`kshana iq`, desde 0.31.0)
adquiere y sigue muestras en banda base grabadas o generadas por software, como receptor de
análisis: no controla hardware de radio ni transmite, no es un receptor certificado y no realiza
posicionamiento por fase de portadora (RTK ni PPP)); ni una suite completa de diseño de misiones (tiene bloques de construcción de Lambert / porkchop /
maniobras / determinación de órbita, pero es la capa de simulación de prestaciones
*por encima* de GMAT (General Mission Analysis Tool)/Orekit, no un sustituto). Asumir este alcance es deliberado. Si necesita presupuestos de error
de interferómetros de átomos fríos desde primeros principios (p. ej. de grado CARIOQA-PMP — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — o una validación al estilo del X-37B), consulte
la hoja de ruta P2 y [póngase en contacto](#support--professional-services) para colaborar.

</details>

### Navegación en órbita terrestre baja

Los satélites en órbita terrestre baja (LEO) pasan rápido y con señal intensa. El tipo `leo-pnt-chain` sigue un
sistema a través de cada etapa: la señal, el paso y su enlace, el mensaje de navegación, y
la posición, velocidad y tiempo (PVT) fusionados y el posicionamiento preciso de punto (PPP). Cada
etapa entrega sus cifras a la siguiente. Véase [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="La cadena PNT LEO a partir de una ejecución real de leo-pnt-chain (leo-pnt-end-to-end.toml): la etapa de señal (generic-l a 1191.795 MHz, piloto seguido a 10.23 Mchip/s) pasa a la etapa del paso (1080 km, máximo de C/N0 seguida 58.2 dB-Hz), que pasa al mensaje de navegación (kepler-rac, ajuste de 300 s, SISRE de representación 0.91 mm RMS, 0.250 m con determinación de órbita), que alimenta la posición fusionada (solo GNSS 1.60 m RMS 3D, GNSS más LEO 0.43 m) y el posicionamiento preciso de punto (convergencia 11.5 min solo GNSS, 7.5 min con 240 satélites LEO). Se entregan 11 valores entre etapas." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Cada tipo de escenario por familia

Los tipos de escenario del motor, clasificados por familias. Cada familia tiene una página con una entrada por tipo (la
descripción y los campos del motor, un comando de ejemplo, cifras destacadas de una ejecución, las
filas de la [matriz de verificación](docs/VERIFICATION-MATRIX.md) que lo nombran y el gráfico que escribe el propio motor) y un
hoja de contactos de esos gráficos; [`docs/KINDS.md`](docs/KINDS.md) los indexa todos. La tabla la escribe
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) y las páginas
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), y ambos fallan si el motor gana un tipo que ninguna familia nombra.

<!-- generated:kind-families -->
| Familia | Qué responde | Tipos | Ejecute uno |
|---|---|---|---|
| **[Relojes, temporización y holdover](docs/kinds/clocks-timing-and-holdover.md)** | cuánto tiempo mantiene la hora un reloj sin GNSS, y cómo resiste un sistema de temporización frente a sus máscaras | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Sensores inerciales, de fusión y cuánticos](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | navegación a estima y fusión de sensores durante una interrupción GNSS, con sensores clásicos y cuánticos | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[PNT alternativo sin GPS](docs/kinds/gps-denied-alternative-pnt.md)** | navegar con la gravedad, el terreno y otros campos cuando el GNSS desaparece | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Constelaciones, cobertura y geometría](docs/kinds/constellations-coverage-and-geometry.md)** | dónde están los satélites, quién los ve y qué calidad tiene la geometría, alrededor de la Tierra, la Luna o Marte | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[Mediciones GNSS, posicionamiento e integridad](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudodistancias, posiciones, niveles de protección y el entorno espacial | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Jamming, spoofing y el espectro](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | cómo llega la interferencia a un receptor y si se detecta | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navegación en órbita terrestre baja](docs/kinds/low-earth-orbit-navigation.md)** | un paso, un enlace, un mensaje de navegación y una posición fusionada, etapa a etapa | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Lunar y cislunar](docs/kinds/lunar-and-cislunar.md)** | navegación, tiempo, marcos y geodesia en la Luna | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navegación de usuarios espaciales](docs/kinds/space-user-navigation.md)** | señales GNSS para naves espaciales por encima, alrededor y más allá de las órbitas GNSS | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[PNT óptico](docs/kinds/optical-pnt.md)** | enlaces ópticos a través de la atmósfera y cifras de mérito ópticas más RF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Análisis de misión, enlaces y operaciones espaciales](docs/kinds/mission-analysis-links-and-space-operations.md)** | lanzamiento, ascenso, entrada, actitud, enlaces, planificación de contactos y formatos de archivo | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Hilos de misión](docs/kinds/mission-threads.md)** | el presupuesto de error de navegación y temporización de una cadena de fases desde el lanzamiento hasta la entrada | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Campañas](docs/kinds/campaigns.md)** | misiones encadenadas, barridos y conjuntos construidos a partir de los demás tipos | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Cada comando

`kshana <scenario.toml>` ejecuta un escenario; todos los demás comandos son subcomandos, y `kshana --help` imprime el uso
de todos ellos. Los comandos son `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (con `live` y
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` y `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) da el propósito de cada uno, un ejemplo verificado y su página de documentación.

<a id="every-surface"></a>
### Cada superficie

Un motor, los mismos resultados en todas partes: la línea de comandos, la biblioteca de Rust, Python, JavaScript y WebAssembly,
el servidor MCP con sus comandos de plugin y sus skills, Kshana Studio (cada página se ejecuta en el navegador, sin instalación, sin subir nada), las
integraciones con ROS 2, Signal K, OpenCPN, GNSS-SDR y `gnss_lib_py`, los kits de despliegue de systemd, Docker y Grafana, y el
plugin de JetBrains. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) los enumera con cómo obtener cada uno y los nombres de todos
los comandos de plugin, skills y páginas del Studio; [`docs/SURFACES.md`](docs/SURFACES.md) indica, para cada comando y tipo,
qué superficie lo incluye y cuáles no, con el motivo.

<a id="how-a-run-works"></a>
## Cómo funciona una ejecución

Un escenario es un archivo TOML (Tom's Obvious, Minimal Language): un tipo, una semilla y los
parámetros. El motor lo ejecuta y escribe el resultado, un gráfico y un informe a su lado, y
las exportaciones que usted pida.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Cómo fluye una ejecución. Un archivo TOML de escenario (un tipo, una semilla y sus parámetros) entra en el motor, kshana 0.40.0, a través del despacho api::run_toml sobre 92 tipos de escenario, determinista a partir del escenario, la semilla y la versión del motor. El motor escribe result.json, chart.svg, report.html y report.json, un table.csv para los tipos que lo definen y, a petición, exportaciones SP3, CCSDS OMM y OEM, CZML, KML, GeoJSON, STK y SigMF; una suite escribe study.json y study.html. Esos archivos alimentan Kshana Studio en el navegador, un asistente de IA a través del servidor kshana-mcp y la integración continua." width="100%">
</picture>

Este escenario incluido dura 2 h: 10 min de GNSS y después unas 1.8 h sin GNSS. Pregunta
cuánto tiempo mantienen la hora un reloj óptico de red de estroncio y un reloj atómico a escala de chip (CSAC)
dentro de 20 ns.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

El reloj óptico mantiene el presupuesto de 20 ns durante toda la interrupción de 6600 s; el CSAC lo mantiene durante
2610 s, y está dentro del presupuesto el 95.6% de la ejecución frente al 100% del reloj óptico.
`kshana example` enumera todos los escenarios incluidos.

<a id="missions"></a>
## Misiones

Diez sectores plantean diez preguntas distintas al mismo motor. Cada uno tiene escenarios incluidos
por los que empezar.

| Sector | Empiece por |
|---|---|
| Defensa y seguridad | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Espacio, órbita terrestre | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Luna, Marte y espacio profundo | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Aviación y drones | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Marítimo | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Carretera | `automotive-urban-canyon` |
| Ferrocarril | `rail-tunnel-coast` |
| Infraestructuras críticas y temporización | `clock-holdover`, `clock-ensemble` |
| Telecomunicaciones y 5G (la quinta generación de redes móviles) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Ciencia e investigación | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>La pregunta que plantea cada sector</summary>

<br>

| Sector | La pregunta que plantea | Empiece por |
|---|---|---|
| **Defensa y seguridad** | ¿Cuánto tiempo siguen siendo fiables nuestra navegación y nuestra temporización bajo jamming y spoofing, y qué capas nos mantienen dentro de la especificación? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Espacio: órbita terrestre** | ¿Ve mi nave espacial suficientes satélites de navegación, cuánto tiempo mantiene la hora su reloj entre posiciones y qué aportaría una capa de navegación en órbita baja? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Lunar y espacio profundo** | ¿Obtendrá un módulo de aterrizaje, un vehículo explorador o un orbitador en la Luna, en Marte o más lejos una posición y una hora fiables? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Aviación y drones** | Después de que un inhibidor elimine el GNSS, ¿cuánto tiempo se mantiene mi sistema de aeronave no tripulada (UAS) dentro de su presupuesto de posición, y hay integridad disponible en mi ruta? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Marítimo** | ¿Hasta dónde llega un inhibidor sobre el agua, se detectaría un desplazamiento de la posición y cuánto tiempo puede un buque navegar sin GNSS hasta el puerto? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Carretera y automoción** | ¿Cuánto deriva un coche bajo un paso elevado o al pasar junto a un inhibidor al borde de la carretera? | `automotive-urban-canyon` |
| **Ferrocarril** | ¿Cuántos segundos dentro de un túnel puede un tren seguir sabiendo en qué vía está? | `rail-tunnel-coast` |
| **Infraestructuras críticas y temporización** | Si la hora GNSS se pierde o se suplanta, ¿cuánto tiempo mantienen una red eléctrica, un centro de negociación o un centro de datos una hora trazable? | `clock-holdover`, `clock-ensemble` |
| **Telecomunicaciones y 5G** | Si se pierde la referencia de tiempo GNSS, ¿se mantiene el reloj de mi red dentro de las máscaras del ITU-T, y durante cuánto tiempo? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Ciencia e investigación** | ¿Puedo reproducir, ampliar y citar un resultado PNT, hasta la semilla? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Evidencias

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 comprobado frente a los 666 vectores de referencia de AIAA 2006-6753, peor error de posición 4.12 mm"></a></p>

<strong>176 de 401</strong> capacidades validadas frente a referencias externas independientes; 221 etiquetadas con honestidad como Modelled.
Cada fila de la matriz de verificación nombra una capacidad, la referencia independiente con la que se comprueba,
la prueba que ejecuta la comprobación y la etiqueta resultante. La integración continua (CI) hace
imposible calificar una capacidad de VALIDATED sin una referencia externa independiente.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Cómo obtiene una capacidad su etiqueta. Cada fila de la matriz de verificación nombra una capacidad, la referencia independiente con la que se comprueba, la prueba que ejecuta la comprobación en la integración continua y la etiqueta resultante. Una fila solo puede ser VALIDATED con una referencia externa independiente; en caso contrario es MODELLED, o PARTNER cuando la responsabilidad es de un socio de hardware. Ejemplo: SGP4/SDP4, Cowell 6-DOF + perturbaciones, OD por lotes/secuencial, referencia vectores de verificación SGP4 de AIAA 2006-6753, prueba tests/sgp4_verification.rs, etiqueta VALIDATED. Recuentos en vivo: 176 VALIDATED, 221 MODELLED, 4 PARTNER de 401 filas. En total, 176 capacidades validadas frente a referencias externas independientes; otras 221 están etiquetadas con honestidad como MODELLED y 4 son responsabilidad de un PARTNER." width="100%">
</picture>

| Etiqueta | Filas | Significado |
|---|---|---|
| VALIDATED | 176 | una referencia externa independiente coincide: datos reales, una implementación independiente o vectores de referencia publicados |
| MODELLED | 221 | comprobado frente a una verdad analítica o la autocoherencia de la simulación, y así se declara abiertamente |
| PARTNER | 4 | responsabilidad de un socio de hardware; Kshana no tiene ninguna referencia independiente para ello |

Algunas de las comprobaciones: los 666 vectores SGP4 (Simplified General Perturbations 4) de AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 hasta 4.12 mm; el modelo de fuerzas de Cowell
hasta 0.08 m frente a Orekit 12.2; Galileo hasta 0.61 m y Swarm-A hasta 0.10 m frente a efemérides precisas
reales de la Agencia Espacial Europea (ESA). Las pruebas mantienen una cobertura de líneas cercana al 95 % de
`src/`, exigida al 85 % en la CI. El registro es
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), generado a partir de
`src/verification.rs`: la [matriz completa de 401 filas](docs/VERIFICATION-MATRIX.md), y por qué cada
fila Modelled no tiene referencia externa en [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Cómo funciona la validación, la tabla de aspectos destacados seleccionados y las figuras de evidencia</summary>

### Validación, reproducibilidad y honestidad

- Cada término de ruido está calibrado con una cifra **publicada y citada** y validado
  frente a la relación estándar (desviación de Allan para los relojes; el crecimiento del error de navegación a estima
  de Groves para lo inercial; la conversión temporización→distancia para la transferencia de tiempo). El estado
  de cada término se sigue en [`docs/VALIDATION.md`](docs/VALIDATION.md) como `validated` o
  `not modeled`: nada se presenta como validado sin serlo.
- **Reproducible por construcción:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` lo impone; las ejecuciones cuánticas y clásicas usan
  semillas independientes para que su ruido no esté correlacionado.
- La madurez se declara con honestidad: las cifras del reloj óptico y del enlace óptico son resultados de *objetivos /
  demostradores en tierra*, no han volado.

### La etiqueta de evidencia en cada figura

Cada figura y cada tabla que escribe una ejecución dicen hasta qué punto se puede confiar en ellas y en qué filas del registro se basan. El JSON del resultado tiene una
clave `evidence`, el SVG del gráfico una línea bajo el trazado (y un elemento `<metadata id="kshana-evidence">`), y la tabla CSV
líneas de comentario `# evidence:` al principio (léala con `comment='#'`). Nombra un nivel, `VALIDATED`, `MODELLED` o `PARTNER`, y
los ids (`VM-` y ocho dígitos hexadecimales) de las filas de la matriz de verificación que ejercitó la ejecución. El nivel es el más débil de esas
filas, así que una ejecución que se apoya en una fila modelada se etiqueta como MODELLED por muchas filas validadas que tenga al lado; la etiqueta
nunca puede afirmar más que el registro. Las filas, los estados y los ids se leen de la matriz, no se teclean
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), y
`tests/evidence_labels_doc_sync.rs` falla si una figura no tiene etiqueta o si una etiqueta discrepa de la matriz.

### La validación de un vistazo

Cada fila la impone una prueba con nombre en la CI. Esta tabla es una **selección de aspectos destacados**;
la matriz completa comprobada automáticamente tiene **401 filas: 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), con la evidencia completa (y lo que, con honestidad, *aún no* está
validado) en [`docs/VALIDATION.md`](docs/VALIDATION.md) y en el artefacto por versión
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
(generado por `cargo run --bin validation_report`, con atestación SLSA — Supply-chain
Levels for Software Artifacts).

La columna **Estado** indica el *tipo* de evidencia, de acuerdo con la escala de validación anterior: **VALIDATED** = comprobado frente a una referencia externa independiente (datos reales, una biblioteca independiente o vectores de referencia publicados); **MODELLED** = comprobado frente a una verdad analítica o la autocoherencia de la simulación (sin un conjunto de datos externo independiente). VALIDATED describe el *método* de comprobación, no un aprobado/suspenso: un incumplimiento honesto frente a una referencia externa real sigue siendo VALIDATED, mientras que una comparación que ninguna fila de la matriz nombra como referencia independiente (el ajuste de LRO — Lunar Reconnaissance Orbiter — anterior) se muestra como MODELLED. Las filas `CI` son salvaguardas del proceso, no cifras de mérito. Algunas islas de datos reales (el reloj de cesio medido, Stable32 PHASE.DAT y las comprobaciones de OPS-SAT/ICGEM cuyas entradas en bruto no llevan licencia de redistribución) están **condicionadas a los datos**: la prueba imprime un aviso de omisión y sigue en verde cuando falta la entrada, y las cifras de referencia públicas están incluidas en `tests/fixtures/`. Reproduzca las entradas en bruto con el `scripts/fetch_*.sh` correspondiente.

| Estado | Capacidad | Concordancia | Referencia / referencia independiente |
|--------|------------|-----------|--------------------|
| **VALIDATED** | Propagación SGP4/SDP4 | 666/666 vectores, peor caso **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + comparación directa con el crate independiente `sgp4` |
| **VALIDATED** | Marcos de referencia: nutación IAU 2000A/B, cadena CIO IAU 2006/2000A, ERA | **bit a bit** (X,Y hasta 1e-14, s hasta 1e-18, ERA hasta 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS frente a un motor SPICE independiente | máx. **0.028″** → ≤ 0.86 m en el suelo, ≤ 3.6 m en la órbita GNSS | ANISE (NAIF/SPICE en Rust puro), mismos EOP `finals2000A` del IERS, 8 épocas 2020–2023 (comparado con esta referencia; ninguna fila de la matriz de verificación la nombra como referencia externa, así que no se etiqueta como VALIDATED) |
| **MODELLED** | Geopotencial EGM2008 (grado/orden 70) | aceleración = ∇V hasta **< 1e-6**; el colapso zonal reproduce el J2 validado | coeficientes EGM2008 de la NGA + identidad analítica ∇V |
| **VALIDATED** | Síntesis de funcionales de gravedad (mapa de navegación asistida por gravedad / sin GNSS) | Somigliana GRS80 + γ_e/γ_p hasta **3.5e-12**; mapa de perturbaciones EGM2008 real físicamente plausible (RMS ≈ 26 mGal, g/o 70) | gravedad normal de Somigliana GRS80 (Moritz 1980, IAG — International Association of Geodesy) + EGM2008 real del ICGEM (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Estimadores de Allan (ADEV/MDEV/TDEV/HDEV) + bandas de confianza | reproducen las desviaciones de referencia; las bandas χ² coinciden | NIST SP 1065 (Riley), Tabla 31/32 de 1000 puntos |
| **VALIDATED** | Estimadores de Allan sobre un **reloj de cesio real medido** | OADEV/OHDEV hasta **1e-3** (observado ≤ 3e-5), 16 factores de promediado | Stable32 sobre un 5071A de Cs real frente a un máser de H, 556,990 puntos (`tests/cs5071a_reference.rs`, condicionado a los datos) |
| **VALIDATED** | Estimadores de Allan sobre la **PHASE.DAT canónica de Stable32** | OADEV/MDEV/TDEV hasta **1e-3** (observado ≤ 5e-5), 139 factores de promediado | desviaciones de referencia de Stable32 para PHASE.DAT (`tests/phasedat_reference.rs`, condicionado a los datos) |
| **MODELLED** | Modelo de error de IMU: ARW / VRW / inestabilidad del sesgo | recuperados con **< 5 %** (inestabilidad del sesgo < 15 %) | hoja de datos de Analog Devices ADIS16465; perfil de referencia de NaveGo |
| **VALIDATED** | Propagador numérico de Cowell + modelo de fuerzas (niveles conservativos) | peor error de posición **0.08 m** en 24 h, 278 épocas (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Nivel de resistencia de Cowell + entradas absolutas de efemérides del Sol y la Luna y de densidad | nivel de resistencia caracterizado ≈ 333 m / 24 h; la órbita no perturbada coincide con Kepler en variable universal por debajo del metro, energía/momento ~1e-9 | efeméride integrada de baja precisión + Kepler analítico |
| **MODELLED** | Lambert · Tsiolkovsky · porkchop | ida y vuelta frente a la verdad de dos cuerpos; ΔV **< 0.01 %** | Izzo 2015 · ecuación del cohete · mínimo analítico de Hohmann |
| **MODELLED** | Determinación de órbita (lotes de Gauss–Newton) | menos de un metro / mm·s⁻¹ sin ruido; ~2 m con un ruido de fondo de 5 m | dos cuerpos + J2 sobre un arco RK4 |
| **MODELLED** | Ajuste del modelo de fuerzas frente a la efeméride precisa de Galileo (arco completo) | **0.61 m** RMS 3-D, 24 h, g/o 70, solo fuerzas | órbita final ESA/ESOC `ESA0MGNFIN` (E11), EOP `finals2000A` reales (comparado con esta referencia; ninguna fila de la matriz de verificación la nombra como referencia externa, así que no se etiqueta como VALIDATED) |
| **MODELLED** | Ajuste del modelo de fuerzas frente a la efeméride precisa de Swarm-A (dinámica reducida) | **0.10 m** RMS 3-D (cota del nivel empírico, no una medida) | órbita precisa ESA `SW_OPER_SP3ACOM_2_` (comparado con esta referencia; ninguna fila de la matriz de verificación la nombra como referencia externa, así que no se etiqueta como VALIDATED) |
| **MODELLED** | Ajuste del modelo de fuerzas frente a LRO lunar (incumplimiento honesto) | **6.67 m** con dinámica reducida, *por encima* del objetivo de 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (comparado con esta referencia; ninguna fila de la matriz de verificación la nombra como referencia externa, así que no se etiqueta como VALIDATED) |
| **MODELLED** | OD de Marte en espacio profundo (SRIF de dinámica reducida) | **≈ 0.2 m** LMO de Marte (FoM de simulación, *no* de una misión real) | OD sintética en lazo cerrado: validación de la maquinaria del estimador |
| **MODELLED** | Dinámica de Marte con el Sol como cuerpo central frente a JPL DE440 | **137 m con un arco de 1 día** (crece con el arco = n cuerpos no modelados) | JPL DE440 mediante ANISE (`xval/anise-mars-od`, condicionado al núcleo) (comparado con esta referencia; ninguna fila de la matriz de verificación la nombra como referencia externa, así que no se etiqueta como VALIDATED) |
| **VALIDATED** | Posicionamiento de punto simple frente a una coordenada del IGS topografiada (observaciones reales) | **5.7 m** RMS 3-D / **1.1 m** horizontal, SPP de código libre de ionosfera en doble frecuencia | levantamiento de la estación ABMF del IGS + efemérides radiodifundidas GPS, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | UKF GNSS/INS fuertemente acoplado | **0.77 m RMS** en un paso LEO de 30 min con una interrupción de 120 s | navegación libre con modelo de fuerzas, derivada a mano |
| **MODELLED** | Navegación con mapas de gravedad sin GPS | deriva INS de ~70 km → **~145 m** recuperados | objetivo *Quantum Wayfarer* del ESA NAVISP |
| **MODELLED** | Navegación referenciada al terreno (TERCOM/SITAN) | deriva de 70 km → **< 500 m** (mínimo por resolución de la rejilla ~140 m) | DEM SRTM `.hgt`; deriva inyectada a mano (comprobación no circular) |
| **MODELLED** | Campo principal IGRF-14 (grado/orden 13) | polo ~80.7°N, dipolo ~29.7 µT, banda física de 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (semi-normalizado de Schmidt) |
| **MODELLED** | Modulación de la señal de navegación y seguimiento de código | auto-SSC de BPSK = **2/(3·R_c)**; PSD de área unitaria; fluctuación de la DLL de C/A **por debajo del metro** a 45 dB-Hz | anclas SSC/PSD en forma cerrada + fórmula del ruido térmico de la DLL de Kaplan y Hegarty |
| **MODELLED** | Corrector diferencial de halo/NRHO del CR3BP | STM = diferencias finitas; la órbita se cierra hasta la **precisión de máquina**; NRHO 9:2 de L2 **≈ 6.57 d / perilunio ≈ 3,250 km** | comprobación de la STM por diferencias finitas + NRHO 9:2 sur de L2 publicada (≈ 6.56 d / ≈ 3,370 km): CR3BP, no una efeméride real del Gateway |
| **MODELLED** | Integridad ARAIM con dos constelaciones | modo de fallo de toda una constelación con GPS + Galileo reales | ARAIM TR (informe técnico) de la UE / DO-316; Celestrak `gps-ops` 2021-07-28 (comparado con esta referencia; ninguna fila de la matriz de verificación la nombra como referencia externa, así que no se etiqueta como VALIDATED) |
| **VALIDATED** | Geometría GNSS / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | coincidencia hasta **1e-6 relativo** en 8 geometrías (de bien condicionada a casi singular) | gnss_lib_py 1.0.4 (Stanford NAV Lab): biblioteca independiente (`tests/dop_reference.rs`) |
| **VALIDATED** | Métricas de evaluación de detectores de ML (AUC/ROC/confusión/Pd-Pmd/precisión/F1) | **recuentos exactos + < 1e-9** en 5 conjuntos de datos × 24 umbrales | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011): biblioteca independiente (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC de detección de anomalías sobre **telemetría real de ESA OPS-SAT** | el AUC reproduce scikit-learn hasta **< 1e-9**; AUC del detector por recuento de picos **≈ 0.85** en la partición de test etiquetada | `roc_auc_score` de scikit-learn en la partición de test de OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0): telemetría real de OPS-SAT (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Núcleos numéricos de quantum-trade (ajuste NNLS de ADEV · bandas de coherencia χ² · Q del reloj de van Loan) | NNLS + Q **exactos**; χ² **< 5e-4** con gdl operativos ≥ 48 | scipy 1.17.1: `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Métricas de errancia de telecomunicaciones MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811, las recomendaciones del Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones) | MTIE (9 factores de promediado, exacto bit a bit) y MDEV + TDEV (8 factores, **< 1e-9** relativo) con la serie LCG (generador congruencial lineal) de NIST SP 1065 | allantools 2024.06 `mtie` / `mdev` / `tdev`: biblioteca independiente (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | Métodos de estudios de compromisos MCDA: las cuatro familias de decisión, nueve agregadores validados externamente (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) más la ponderación de prioridades por comparación por pares **AHP** | puntuaciones / clasificaciones / matrices de concordancia reproducidas hasta **< 1e-9** | pymcdm + pyDecision (bibliotecas MCDA independientes de terceros) + RI (Random Index) de Saaty / eig de SciPy-LAPACK (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | Envolvente Doppler LEO a partir de la órbita y la portadora | máximo de Iridium dentro del **5 %** de los ±36 kHz publicados; Xona Pulsar X1 dentro de los **32–34 kHz** publicados | resultados de pruebas LEO PNT de la RNTF; Leclère, Marathe y Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | Convergencia de PPP con aumentación LEO | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min con 60 / 96 / 192 / 288 satélites LEO, monótona; NEES del filtro dentro de la banda χ² | tendencia comparada con Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); constelaciones y ruido no reproducidos |
| **MODELLED** | Nivel de protección de temporización condicional (error de tiempo no detectado limitado por el holdover bajo spoofing) | la composición reproduce la recursión de covarianza multipaso `clock_state`; calibrado con un spoofing real registrado | escalares de JammerTest 2024 (Zenodo 15911589) + formas cerradas de van Loan / CUSUM (`examples/tpl_jammertest`) |
| **MODELLED** | Puntuación de resiliencia PNT + inestabilidad de la decisión | 35 pruebas con referencia derivada a mano; artefacto de estudio determinista byte a byte (semilla fija) | correspondencia con DHS RPCF v2.0 + formas cerradas de Dirichlet / Kendall-τ / Hill-N2: arquitecturas sintéticas, no una certificación |
| **MODELLED** | Estudio de la brecha de optimismo de deterioros de RF (leyes de escala + predictor por exclusión de uno) | significación frente a la hipótesis nula por permutación; artefacto determinista byte a byte (5 semillas) | corpus sintético fundamentado en parámetros: las *métricas* de evaluación son VALIDATED frente a scikit-learn (arriba); el estudio es MODELLED |
| CI | Reproducibilidad multiplataforma | entradas idénticas bit a bit + referencias de forma en 3 OS (sistemas operativos) | matriz de CI Linux / macOS / Windows, referencias SHA-256 |
| CI | Cobertura de pruebas | **~95 % de líneas** en `src/` excluidos `src/*_data.rs` y `src/main.rs`, exigida ≥ 85 % | cargo-tarpaulin (motor LLVM) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Cómo obtiene una capacidad su etiqueta: el requisito se asigna a un módulo en src, a una prueba en tests, a una referencia externa (conjunto de datos real, implementación de referencia independiente o vectores publicados) y a un estado, con una salvaguarda impuesta por la CI de que ninguna capacidad puede ser Validated sin una referencia externa. Recuentos en vivo: 176 Validated, 221 Modelled, 4 Partner, 401 en total" width="900">
  <br><sub>Cómo obtiene una capacidad su etiqueta: la invariante impuesta por la CI, sin referencia externa ⇒ no puede ser Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Cómo se respalda cada afirmación: la columna Validated es 176 de 176 ExternalDataset por construcción (impuesto por la CI); las filas Modelled se etiquetan con honestidad como InternalConsistency, ReferenceImpl o ExternalDataset; las filas Partner no tienen referencia independiente de Kshana" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Error de posición en el peor caso de SGP4/SDP4 frente a la referencia de AIAA 2006-6753 por régimen, escala logarítmica: todos los regímenes están muy por debajo de la tolerancia de AIAA, peor caso 4.12 mm en el régimen de espacio profundo no resonante" width="96%">
  <br><sub>Arriba: cada fila Validated está respaldada por un conjunto de datos externo, por construcción. Abajo: SGP4 coincide con la referencia oficial en todos los regímenes (peor caso 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Estado de verificación de las 401 capacidades: 176 Validated (comprobadas frente a una referencia externa), 221 Modelled, 4 responsabilidad de un Partner" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Dominios de capacidad

Cada capacidad del mapa público, por dominio, con su etiqueta del registro. La tabla de dominios la escribe
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) a partir de `web/capabilities.json`, el mismo archivo que
lee el mapa de todo del Studio.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Capacidades de Kshana por dominio y madurez: capacidades públicas validadas y modeladas por dominio, dibujadas a partir de web/capabilities.json por tools/gen_validation_figures.py" width="900">
</picture>

La tabla completa, dominio a dominio con cada capacidad y su etiqueta, está en [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Instalación

Una línea instala la herramienta de línea de comandos: **`cargo install kshana`**. Todos los canales distribuyen
v0.40.0 desde el mismo commit etiquetado.

<!-- channels:begin -->
| Canal | Instalación | Guía |
|---|---|---|
| Probar en el navegador | abra https://kshana.dev | [Guía del Studio](https://kshana.dev/docs/studio.html) |
| Línea de comandos (Rust) | `cargo install kshana` | [Uso de la línea de comandos](https://kshana.dev/docs/rust.html#usage--cli) |
| Biblioteca de Rust | `cargo add kshana` | [Referencia de la API en docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Guía de la API de Python](https://kshana.dev/docs/python-api.html) |
| JavaScript y WebAssembly | `npm install kshana` | [Guía de npm y WebAssembly](https://kshana.dev/docs/npm.html) |
| Asistente de IA (servidor MCP, cargo) | `cargo install kshana-mcp` | [Guía del servidor MCP](https://kshana.dev/docs/mcp.html) |
| Imagen de Docker | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Guía del servidor MCP: Docker](https://kshana.dev/docs/mcp.html#install) |
| Extensión de Claude Desktop | haga doble clic en el `.mcpb` de su sistema: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (un clic) | [Añadir a Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Añadir a Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (un clic) | [Instalar en VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Instalar en VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Binario precompilado | descargue kshana-mcp-<target> de la versión publicada y compruébelo con SHA256SUMS | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Registro oficial de MCP | busque io.github.ashfordeOU/kshana-mcp | [Todos los fragmentos de instalación de MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Remoto (HTTP en streaming), autoalojado | `kshana-mcp --http 127.0.0.1:8080` | [Guía de autoalojamiento](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Marketplace de plugins de Claude Code | `/plugin marketplace add ashfordeOU/kshana` | [Uso de Kshana desde un agente](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| Plugin para IDE de JetBrains | Settings → Plugins → Marketplace → busque "Kshana" (ID del plugin dev.kshana.ide) | [Guía del plugin](https://kshana.dev/docs/jetbrains.html) |
| Plugin de Signal K | `npm install signalk-kshana-trust` | [Guía del plugin de Signal K](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| Plugin de OpenCPN | descargue el tarball del plugin de la versión publicada | [Envío al catálogo de OpenCPN](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Panel de Grafana | importe kshana-grafana-*.json de la versión publicada | [Fuente del panel](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Imagen de la compilación de referencia | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Integraciones marinas](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana en el JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Se compila con Rust 1.88 o posterior, la rust-version de Cargo.toml"></a></p>

MCP es el Model Context Protocol. Fije una versión con `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` o `npm install kshana@0.40.0`. Para compilar desde el código fuente, véase
[Instalación y compilación](#install--build) en Referencia.

<details>
<summary>Ejecutar un escenario desde Python y desde WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Además de `run`, el módulo expone `run_full` (JSON, SVG y el resumen de una línea a la vez),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` y `error_kind`; véase
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

El paquete de npm es todo el motor compilado a WebAssembly. En Node.js, pase el binario a
`initSync`; en un navegador, `await init()` lo descarga (véase [`README.npm.md`](README.npm.md)).

```js
import { readFileSync } from "node:fs";
import { createRequire } from "node:module";
import { initSync, run, summary, version } from "kshana";

const wasm = createRequire(import.meta.url).resolve("kshana/kshana_bg.wasm");
initSync({ module: readFileSync(wasm) });

const toml = readFileSync("clock-holdover.toml", "utf8");
const result = JSON.parse(run(toml));
console.log(version(), result.quantum.fom.holdover_s, result.classical.fom.holdover_s);
// 0.40.0 6600 2610
console.log(summary(toml));
```

</details>

<a id="architecture"></a>
## Arquitectura

Un motor abierto ocupa el centro, y todas las superficies lo ejecutan: la línea de comandos, la biblioteca
de Rust, Python, WebAssembly y Kshana Studio, el servidor MCP, la imagen de Docker y el
plugin de JetBrains. El mismo archivo de escenario da los mismos bytes en cada una. Kshana Pro se sitúa
encima como una capa separada que depende del motor y nunca lo bifurca.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="La arquitectura de Kshana: un motor abierto en el centro, kshana 0.40.0 bajo la AGPL-3.0, con api::run_toml, un despacho tipado sobre todos los tipos, y el registro de verificación de 401 capacidades (176 VALIDATED, 221 MODELLED, 4 PARTNER). A su alrededor, todas las superficies ejecutan el mismo motor: línea de comandos (cargo install kshana); biblioteca de Rust (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); servidor MCP (cargo install kshana-mcp); imagen de Docker (ghcr.io/ashfordeou/kshana-mcp); plugin de JetBrains (Marketplace: &quot;Kshana&quot;). Debajo, Kshana Pro, una capa propietaria que depende del motor abierto como biblioteca y nunca lo bifurca, y que no añade ningún modelo físico." width="100%">
</picture>

<details>
<summary>Dentro del motor: las capas de dominio y el registro de verificación</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="La arquitectura de Kshana por capas. Cinco puertas de entrada (línea de comandos, Python, JavaScript y WebAssembly, el servidor MCP y el plugin de JetBrains) llegan a un único api::run_toml, un despacho tipado sobre 92 tipos. Debajo hay ocho capas de dominio: tiempo y marcos, relojes y temporización, inercial y fusión, GNSS e integridad, astrodinámica, PNT LEO, Luna, Marte y espacio profundo, y misiones y estudios, sobre un núcleo común, todas con referencias cruzadas en el módulo de verificación, la matriz comprobada automáticamente de 401 capacidades que es la única fuente de verdad de cada etiqueta." width="100%">
</picture>

**Un motor, muchas puertas de entrada.** Un único núcleo en Rust (`kshana`) ejecuta cada escenario,
al que se llega mediante una CLI, una extensión de Python, un módulo WebAssembly en el navegador, un **servidor
MCP** para agentes de IA y un **plugin para IDE de JetBrains**, todos convergiendo en un único despacho
`api::run_toml`. Dentro, los paquetes de sensores se conectan a una interfaz común de modelos
de error; junto a ellos hay una **capa de marcos de referencia** (precesión–nutación IAU 2006/2000A
y la reducción GCRS↔ITRS basada en el CIO), una **capa astrodinámica/numérica**
(SGP4/SDP4 analítico **y** un propagador numérico de Cowell con su
modelo de fuerzas EGM2008/perturbaciones, diseño de maniobras y determinación de órbita), una
**capa de integridad/GNSS** (RAIM/ARAIM, SBAS, el dominio de medición, jamming, cislunar),
una **capa de fusión / PNT alternativo** (los estimadores GNSS/INS y los comparadores de mapas
de gravedad/terreno/magnetismo), una **capa de espacio profundo y lunar** (PNT radiométrico de Marte y el
conjunto PNT lunar, con su nivel de evidencia por pieza en la matriz: tiempo LTC, VLBI, OD+reloj conjunta, realización del marco, volumen de servicio,
PNT diferencial, interoperabilidad), una **capa de análisis de misión** (presupuestos de lanzamiento / reentrada / cobertura /
apuntamiento / pasos / enlace y el entorno de meteorología espacial), y la **capa abierta de estudios
de resiliencia e IA/ML** (puntuación de resiliencia RPCF, la brecha de optimismo de deterioros
de RF y el demostrador de PNT con tecnología cuántica) cuyos artefactos reproducibles se apoyan en los
núcleos validados.

Dos crates independientes y **excluidos del workspace** se sitúan junto al núcleo: `mcp/kshana-mcp`
(el servidor MCP, construido sobre el SDK `rmcp` de la edición 2024) y `xval/anise-frames` (la
comprobación cruzada de marcos con ANISE/SPICE, que incorpora dependencias MPL-2.0 (Mozilla Public License 2.0)), mantenidos fuera del grafo
de dependencias del crate publicado, de `Cargo.lock`, de la comprobación de licencias y de la compilación MSRV (versión mínima de Rust compatible) mediante la lista
`exclude` del `Cargo.toml` raíz. El plugin de JetBrains (`ide/jetbrains`) es un proyecto
Kotlin separado. Véase [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) para el conjunto completo de diagramas.

Los diagramas renderizados (flujo del motor, mapa de módulos, distribución) están en [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagramas

Los diagramas son fuentes Mermaid en [`docs/diagrams/`](docs/diagrams/), renderizadas a SVG y PNG en
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` en Linux, los otros dos
scripts `render-diagram` en otros sistemas), y un registro vincula cada PNG con el SVG exacto del que procede. Las pruebas fijan los
recuentos que indican. Los gráficos de las secciones anteriores los dibujan herramientas a partir de ejecuciones del motor; estos muestran cómo
encajan las piezas.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="El sistema: seis puertas de entrada (línea de comandos, Python, WebAssembly y npm con Kshana Studio, servidor MCP con plugins y skills, plugin de JetBrains, integraciones) llaman todas a un único despacho sobre todos los tipos de escenario, que ejecuta un motor formado por un núcleo común, paquetes de sensores y marcos, y modelos de dominio, y escribe un resultado y un gráfico reproducibles" width="900"><br>
  <sub>Un despacho, un motor, salida reproducible · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · fuente <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Las superficies: un motor determinista y sin conexión alimenta la línea de comandos, la biblioteca de Rust, Python, WebAssembly y npm, y el servidor MCP; el Studio se ejecuta sobre la compilación WebAssembly, los comandos de plugin y las skills sobre el servidor MCP, las integraciones y los kits de despliegue sobre la línea de comandos, y el plugin de JetBrains sobre la biblioteca" width="900"><br>
  <sub>Cada superficie, desde el mismo motor · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · fuente <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Dentro de una ejecución: un archivo de escenario con su semilla y su cronología GNSS alimenta el motor, que en cada paso de tiempo hace evolucionar el modelo de error, ejecuta el estimador y puntúa las cifras de mérito, y escribe un resultado y un gráfico reproducibles" width="900"><br>
  <sub>El bucle interno de una ejecución · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · fuente <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Confianza en el receptor: un registro o flujo de receptor se ingiere en observables por época y en los indicadores propios del receptor, pasa por los monitores y se convierte en una puntuación de confianza consultiva con una banda y motivos, que alimenta el Studio, la telemetría, un paquete de evidencias firmado, la puntuación de Jammertest y de bench, y el informe de cumplimiento" width="900"><br>
  <sub>De un registro de receptor a una puntuación de confianza y lo que la usa · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · fuente <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="El viaje de ida y vuelta al laboratorio: un escenario se exporta con sus eventos y condiciones de prueba, un operador fuera de Kshana reproduce un archivo a través de un simulador de laboratorio, el registro del receptor se puntúa frente a los eventos declarados, y el viaje de ida y vuelta de evidencias vincula los hashes del escenario, de las condiciones y del registro y la puntuación en un paquete firmado" width="420"><br>
  <sub>Del escenario al paquete firmado; Kshana nunca produce ni reproduce una señal · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · fuente <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: el navegador ejecuta localmente el motor compilado a WebAssembly sin subir nada, toma escenarios incluidos o un escenario o registro que usted abra, y muestra el resultado en la vista simple, la vista avanzada y las páginas de tareas, con exportaciones que guarda el usuario" width="900"><br>
  <sub>Cómo se ejecuta el Studio, localmente · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · fuente <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="El flujo de pruebas y publicación: las comprobaciones locales (formato, clippy, la comprobación de ausencia de atribución, el trinquete de cobertura de la documentación y scripts/gate.sh, que ejecuta la suite completa y ejecuciones repetidas y escribe el justificante que comprueba el hook pre-push) conducen a una pull request solo de CI y a una CI completa en verde; el propietario avanza main al commit en verde y una etiqueta anotada se coloca en él tras la comprobación de sincronización de versiones; el flujo de publicación verifica la suite completa en el commit etiquetado antes de publicar nada, compila los binarios con un SBOM, sumas de comprobación y procedencia de compilación, publica en crates.io, PyPI, npm, el registro de contenedores, el registro de MCP y el JetBrains Marketplace, consulta cada registro hasta que sirve la nueva versión y lanza la compilación del sitio desde la etiqueta; una vía separada solo para el sitio lanza el flujo de pages con la etiqueta main y se rechaza salvo que no haya cambiado nada fuera de web/ y .github/ desde la última versión" width="900"><br>
  <sub>Flujo de pruebas y publicación, desde las comprobaciones locales hasta una versión verificada y la vía solo para el sitio · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · fuente <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="El mapa de módulos: la línea de comandos, Python, WebAssembly, el servidor MCP y el plugin de JetBrains llaman al despacho tipado sobre todos los tipos, que llega al núcleo común, tiempo y marcos, paquetes de sensores, astrodinámica, integridad, detección de spoofing, fusión, espacio profundo y lunar, resiliencia, y los módulos de árbitro y de referencia comparativa, todo respaldado por la matriz de verificación" width="1000"><br>
  <sub>Dónde vive el código · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · fuente <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Distribución: un único repositorio distribuye el crate principal, el servidor MCP, el plugin para IDE y los crates de comprobación cruzada en crates.io, PyPI, npm, GitHub Releases, el entorno de pruebas de Pages, el registro de contenedores, el registro de MCP y el JetBrains Marketplace, con un archivo en Zenodo" width="900"><br>
  <sub>Qué se distribuye dónde y qué lo comprueba · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · fuente <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## Asistente de IA

[`kshana-mcp`](mcp/kshana-mcp/) es un servidor MCP: su asistente ejecuta el motor real y
lee su JSON, en lugar de adivinar las matemáticas. Cada una de sus 49 herramientas es un envoltorio fino
sobre una función pública de la biblioteca `kshana`, así que el servidor no contiene ninguna lógica de simulación.

### Instalar el servidor MCP

> Software de carácter consultivo, no un equipo de navegación homologado: el operador sigue siendo responsable de la navegación.
> El servidor se ejecuta en su ordenador; no se envía nada a Ashforde OÜ.

Elija cualquier canal. Cada enlace y fragmento se genera a partir de un único script
(`scripts/gen_mcp_install.py`) y se comprueba en la integración continua; los fragmentos para Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI y Continue están en
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Canal | Comando o botón | Requisitos | Forma fijada |
|---|---|---|---|
| Extensión de Claude Desktop | haga doble clic en el `.mcpb` de su sistema: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | ninguno | `kshana-mcp-<target>.mcpb` de v0.40.0 |
| Cursor (un clic) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node, o Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (un clic) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node, o Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · plugin: `/plugin marketplace add ashfordeOU/kshana` y después `/plugin install kshana@ashforde` | Node (o Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ con uv o pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | fórmula para v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` y después `scoop install kshana-mcp` | Scoop (Windows) | manifiesto para v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Binario precompilado | [la página de la versión](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, comprobados con `SHA256SUMS` y `gh attestation verify` | ninguno | v0.40.0 |
| Registro de MCP | `io.github.ashfordeOU/kshana-mcp` (lo encuentran los clientes compatibles con el registro) | un cliente compatible con el registro | `0.40.0` |
| Remoto (HTTP en streaming) | `kshana-mcp --http 127.0.0.1:8080`, autoalojado: véase [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | su propio servidor | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp en Glama, la puntuación de calidad de su servidor MCP"></a></p>

En Claude Code el mismo servidor llega como plugin: `/plugin marketplace add ashfordeOU/kshana` y después
`/plugin install kshana@ashforde`. El plugin añade comandos de barra sobre las herramientas: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` y `/kshana-jammertest`. Las herramientas de confianza de buques alimentan las integraciones con Signal K y
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

La configuración por cliente está en [`docs/integrations.md`](docs/integrations.md). El servidor figura
en el registro oficial de MCP como `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>Las 49 herramientas</summary>

<br>

**Escenarios e informes**

| Herramienta | Qué hace |
|---|---|
| `run_scenario` | Ejecuta un escenario a partir de una definición TOML (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | Los 92 tipos de escenario integrados con descripciones + campos obligatorios/opcionales, para que el agente pueda construir un escenario válido |
| `validate_scenario` | Comprobación previa: analiza el TOML y detecta su tipo, sin ejecutarlo |
| `list_example_scenarios` | Los escenarios de referencia incluidos, como JSON |
| `get_example_scenario` | El texto TOML de un escenario de referencia incluido, byte a byte el archivo bajo `scenarios/` |
| `report_scenario` | Ejecuta un escenario y devuelve su informe |
| `animate_scenario` | Ejecuta un escenario y devuelve su serie temporal como animación |
| `sky_geometry` | Geometría del cielo bajo un horizonte dependiente del azimut: los satélites visibles y ocultos, el DOP, la covarianza este-norte-arriba y la elipse de error horizontal; o un preajuste de horizonte con su procedencia |

**Exportación e interoperabilidad**

| Herramienta | Qué hace |
|---|---|
| `list_export_formats` | Qué formatos de interoperabilidad se aplican a un escenario (`czml`, `kml`, `geojson`, `stk`, `sigmf`), el motivo cuando uno no se aplica, y la especificación que sigue cada escritor |
| `export_interop` | Exporta un escenario como CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemérides STK (Systems Tool Kit) `.e` o SigMF (Signal Metadata  |
| `import_route` | Escribe una ruta GeoJSON `LineString` en un escenario que recorre una trayectoria de puntos de paso (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`) y devuelve el nuevo TOML |
| `export_sp3` | Exporta la constelación de un escenario `orbit` como efemérides precisas SP3-c (Standard Product 3, revisión c) |
| `export_omm` | Exporta los elementos de un escenario `orbit` como un catálogo OMM (Orbit Mean-elements Message) CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 |
| `export_oem` | Exporta la serie de estados de un escenario `orbit` como efemérides CCSDS OEM (Orbit Ephemeris Message) 2.0: la posición TEME (ecuador verdadero, equinoccio medio) *y*  |
| `export_table_csv` | Ejecuta un escenario y devuelve su tabla de reproducibilidad como CSV (valores separados por comas): la tabla estable byte a byte que la CLI (interfaz de línea de comandos) escribe como `<scenario>.table.csv` |
| `export_test_bench` | El movimiento del vehículo y los eventos de un escenario para un simulador GNSS de laboratorio (`kshana bench-export`) |

**Confianza en el receptor y en el buque**

| Herramienta | Qué hace |
|---|---|
| `assess_receiver_log` | Evalúa la confianza de un registro real de receptor GNSS (sistema global de navegación por satélite) |
| `assess_vessel_stream` | Puntúa un extracto acotado de NMEA 0183 (como máximo 2 MiB y 20,000 épocas |
| `assess_vessel_log` | El registro NMEA 0183 de un buque (como máximo 4 MiB) como ejecución por lotes, con el TOML de sesión indicando los límites del buque |
| `create_evidence_pack` | Un paquete de evidencias firmado para una ventana del registro de un buque (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Vincula un token de sello de tiempo RFC 3161 (base64 de los bytes del `.tsr`) a un paquete, en memoria (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Verifica un paquete (`kshana evidence verify`) |
| `generate_training_nmea` | NMEA 0183 sintético de puente para la formación de la tripulación a partir de un TOML de `nmea-scenario` (jamming, arrastre de posición, spoofing de tiempo, retardo de repetición) con el registro del instructor (`kshana-nmea-training/1`) |
| `build_interference_map` | Un mapa de interferencias GNSS a partir de informes de posición ADS-B o AIS como texto CSV (como máximo 4 MiB) |
| `route_exposure` | La proporción de la longitud de una ruta en celdas degradadas, no degradadas, sin evaluar y no observadas de uno o varios mapas de interferencias, opcionalmente dentro de un intervalo de fechas |
| `trust_telemetry` | Un flujo de confianza (líneas JSON) o un resultado de `receiver-trust` presentado como texto de Prometheus, líneas de syslog CEF o LEEF o una carga útil JSON de OTLP, con los codificadores de `kshana trust-telemetry` |
| `jammertest_import` | Lee el catálogo de pruebas y el plan de transmisión publicados de Jammertest (NPRA/jammertest-plan, MIT) como verdad programada (`kshana jammertest import`): las franjas de un área de pruebas se convierten en eventos de confianza en el receptor con el id del catálogo y el año en cada etiqueta. Franjas planificadas, no tiempos de emisión registrados; no se lee ningún campo de contacto del plan. MODELLED. Véase [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Puntúa un registro de receptor frente a ese calendario (`kshana jammertest score`): por prueba, la latencia de detección, las alarmas omitidas y el tiempo de recuperación, y las falsas alarmas fuera de todas las franjas. Registros de texto como `log`, binarios (`ubx`, `sbf`) como `log_base64`. Un paquete firmado necesita una clave: línea de comandos. Solo consultivo; MODELLED. |
| `fit_imu_log` | Parámetros del acelerómetro y del giróscopo de los escenarios `hybrid` y `fusion` ajustados a partir de un registro de IMU estacionaria (CSV o EuRoC) mediante la desviación de Allan, con una tabla `[accel_classical]` lista para pegar y el SHA-256 del registro (`kshana imu-fit`). Entra texto, sale JSON; MODELLED. |

**IQ GNSS (archivos del directorio de trabajo; desactivado en modo HTTP)**

| Herramienta | Qué hace |
|---|---|
| `iq_signals` | La configuración de la capa IQ GNSS |
| `iq_info` | Describe una grabación IQ (en fase y cuadratura) del directorio de trabajo sin procesarla |
| `iq_scene` | Genera una escena IQ GNSS multisatélite en el directorio de trabajo (`kshana iq scene`) |
| `iq_acquire` | Adquisición por FFT (transformada rápida de Fourier) de uno o varios PRN (códigos de ruido pseudoaleatorio) sobre una grabación (`kshana iq acquire`), opcionalmente tras etapas de frontal |
| `iq_track` | Adquiere y después sigue con el banco de DLL/PLL/FLL (lazos de seguimiento de retardo, fase y frecuencia) (`kshana iq track`), con los lazos de un `kshana.loop-desig |
| `iq_frontend` | Aplica el frontal del receptor y el DSP (procesamiento digital de señales |
| `iq_sweep` | Reproduce una grabación IQ del directorio de trabajo con varios diseños de lazo de seguimiento (`kshana iq sweep`) |
| `iq_monitor` | Ejecuta los monitores de detección de interferencias y de spoofing sobre una grabación IQ del directorio de trabajo (`kshana iq monitor`) |
| `iq_labfit` | Ajusta el modelo de pérdida de enganche del lazo de seguimiento a ejecuciones de laboratorio (`kshana iq labfit`) a partir de un escenario `iq-labfit` cuyos registros están en línea (`text` o `base64` |
| `iq_test_conditions` | Valida un archivo `kshana.test-conditions/1` dado como texto y devuelve las condiciones resueltas con su hash |
| `iq_campaign` | Ejecuta una campaña de repetición de laboratorio (`kshana iq campaign`) |
| `iq_campaign_status` | El progreso de la carpeta de salida de una campaña |

**Correspondencia normativa**

| Herramienta | Qué hace |
|---|---|
| `compliance_report` | La correspondencia con marcos públicos rellenada a partir de documentos de resultados dados como texto (`kshana compliance-report`) |
| `compliance_mapping` | Las tablas de correspondencia estáticas (o, con `sources`, los documentos fuente que citan con versiones y URL) como Markdown, encabezadas por la misma declaración |
| `list_standards_packs` | Los paquetes de normas (`kshana standards-pack list`): conjuntos de escenarios puntuados para los perfiles de prueba del Resilient PNT framework del DHS, IMO MSC.1/Circ.1575 e ICAO Doc 9849 Appendix F |
| `run_standards_pack` | La ejecución de un paquete frente a umbrales declarados antes de la ejecución: cada prueba `MET`, `NOT MET` o `NEEDS INPUT`; MODELLED, no califica ningún producto |
| `lunanet_afs_check` | La LunaNet Augmented Forward Signal comprobada frente a LNIS V5 AD1 Volume A (LSIS-AFS V1.0): los códigos frente a las tablas impresas, o un flujo de símbolos frente al formato de trama; el LDPC y el CRC-24Q de las subtramas 2 a 4 no se verifican |
| `create_round_trip_pack` | El paquete firmado de ida y vuelta al laboratorio: escenario, documento `kshana.test-conditions/1`, registro del receptor y puntuación vinculados por hash |

**Referencia comparativa**

| Herramienta | Qué hace |
|---|---|
| `score_benchmark` | Una propuesta de kshana-bench puntuada frente a un archivo de verdad, ambos como texto JSON (`kshana bench score`, `bench/SPEC.md`): el archivo de resultados con la versión de la especificación, la partición, los hashes de entrada y las métricas de la tarea. MODELLED; describe un registro o un corpus, nunca un producto. |
| `render_leaderboard` | Archivos de resultados de kshana-bench presentados como la página estática de clasificación (texto HTML), validando antes cada uno. |

</details>

<a id="editions"></a>
## Ediciones

Todo el motor es gratuito. Kshana Pro y los estudios a medida son para programas que necesitan más,
y toda vía de pago empieza con un mensaje: aquí no hay precios.

| | Free | Kshana Pro | Estudio a medida |
|---|---|---|---|
| Qué es | todo el motor abierto, los 92 tipos de escenario, sin funciones restringidas | una capa propietaria sobre el mismo motor, bajo contrato | un estudio MODELLED de resiliencia PNT de su sistema, hecho para usted |
| Licencia | AGPL-3.0 (GNU Affero General Public License, versión 3), o una licencia comercial | propietaria | contrato |
| Cómo empezar | [instale](#install) o abra [kshana.dev](https://kshana.dev) | [solicite una evaluación de Pro](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [solicite un estudio](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Qué es Pro, en palabras de [`docs/PRO.md`](docs/PRO.md):

> **Un superconjunto estricto de Kshana abierto.** Pro depende del motor abierto como biblioteca y
> nunca lo bifurca. Todos los tipos de escenario abiertos se ejecutan en Pro sin cambios, y un escenario abierto se ejecuta
> en Pro sin ninguna licencia.
>
> **Ninguna física nueva.** Pro no añade ningún modelo físico ni cambia ninguno. Cada cifra de Pro procede
> de ejecuciones del motor abierto, así que una cifra de Pro es tan fiable como el tipo de escenario abierto
> del que procede, y nunca más.

Pro responde a las siguientes preguntas de un programa: qué diseño volar (un optimizador de diseño y su
frente de Pareto), qué seguridad tiene la respuesta (incertidumbre y sensibilidad) y si la misión
cumple sus requisitos (un dosier de misión, trazabilidad de requisitos, estudios de compromisos, una
comprobación de regresión de escenarios, gemelos digitales de relojes, un dosier de estudio y un servicio
local). También vigila una campaña de cifras y hace fallar un pipeline cuando una empeora,
prueba planes de señal candidatos frente a las señales abiertas de navegación por satélite en ambos
sentidos (coexistencia espectral) y pone en cola estudios en un servicio de trabajos local con un
registro de entregas encadenado por hashes. Cada uno se describe, con lo que produce y lo que no hace, en
[`docs/PRO.md`](docs/PRO.md). Nada de lo que produce Pro es una certificación, y un estudio a medida es
tampoco una certificación.

<details>
<summary>Qué lee Kshana Pro del motor abierto, y el soporte de Ashforde® OÜ</summary>

<br>

**En qué se basa Kshana Pro.** Cada parte de Pro trabaja a partir del motor abierto y lo deja
sin cambios:

- **El optimizador de diseño, el estudio de incertidumbre y el dosier de misión** ejecutan escenarios
  del motor abierto a través de la interfaz pública del motor y calculan cada cifra a partir de los resultados
  de las ejecuciones. Cada salida conserva el nivel VALIDATED, MODELLED o PARTNER que el motor abierto dio a
  cada cifra, nunca uno superior.
- **Los gemelos digitales de relojes** usan el modelo de reloj del motor abierto y su estimador de
  desviación de Allan: un gemelo se calibra con el presupuesto de Allan publicado del dispositivo y después se comprueba
  estimando la desviación de Allan del gemelo con el estimador abierto.
- **Los estudios de compromisos** ejecutan cada opción de arquitectura como un escenario del motor abierto, sin cambios,
  y clasifican las opciones según una cifra de mérito leída del resultado de cada ejecución.
- **La vigilancia de campañas** lee sus cifras de los resultados de ejecuciones del motor abierto de los
  escenarios de un paquete, y las compara con la ejecución anterior aprobada.
- **La coexistencia espectral** lee cada cifra física de ejecuciones del motor abierto de los tipos
  `leo-signal` y `constellation-design`, y añade solo la suma sobre los satélites
  visibles y la clasificación de los planes.
- **El servicio de trabajos local** ejecuta escenarios abiertos y de Pro a través del mismo motor y
  almacena cada resultado tal como lo devolvió la ejecución.
- **Los paquetes de evidencias** registran, para cada ejecución, el hash del escenario que el motor abierto estampa en
  su resultado, de modo que una cifra de un paquete puede reproducirse volviendo a ejecutar su escenario.
- **Herramientas de ingeniería de sistemas y de programa.** Las herramientas de ingeniería de
  sistemas basada en modelos (MBSE) y de programa de Kshana Pro comprueban los requisitos de un programa
  frente a ejecuciones del motor abierto: importan requisitos como valores separados por comas
  (CSV), o como un subconjunto documentado del Requirements Interchange Format (ReqIF) o del
  texto de Systems Modeling Language versión 2 (SysML v2), evalúan cada criterio de
  aceptación, con su unidad, frente a los valores que escribió una ejecución, y producen una matriz de
  referencias cruzadas de verificación (VCRM), un modelo SysML v2, un informe de impacto de cambios y un paquete de
  evidencias sin conexión. No vuelven a ejecutar ni a recalcular nada, y leen solo lo que publica el motor abierto:
  el `result.json` de cada ejecución (los campos que nombra un criterio, sus unidades, el
  sello de reproducibilidad de hash del escenario, semilla, versión del motor y versión del esquema, y
  la etiqueta de la ejecución y los niveles de sus cifras), su `report.json` (tipo, registro de reproducibilidad y
  etiquetas de capacidad), el archivo de escenario (su hash, tipo, semilla y parámetros), el
  esquema de unidades de campos (la unidad, la procedencia y el nivel de evidencia de cada campo) y la
  matriz de verificación (la etiqueta VALIDATED, MODELLED o PARTNER de cada capacidad).

<a id="support--professional-services"></a>
### Soporte y servicios profesionales

Kshana es gratuito y de código abierto bajo la AGPL-3.0, y está **desarrollado y
mantenido profesionalmente por Ashforde® OÜ** (Estonia). El motor abierto está completo y es utilizable por
sí solo. Para las organizaciones que necesitan más, Ashforde® OÜ ofrece:

- **Soporte comercial e integración**: incorporación de Kshana a su cadena de herramientas, escenarios
  a medida y correcciones prioritarias.
- **Modelos de sensores a medida**: calibrados con su hardware, incluidos modelos de resiliencia
  sensibles a la exportación mantenidos en una capa privada.
- **Kshana Pro**: herramientas propietarias de ingeniería de sistemas basada en modelos (MBSE) y de programa
  que comprueban los requisitos de un programa frente a ejecuciones del motor abierto y
  producen una matriz de referencias cruzadas de verificación (VCRM), un modelo Systems Modeling Language
  versión 2 (SysML v2), un informe de impacto de cambios y un paquete de evidencias sin conexión. No
  vuelven a ejecutar nada y leen solo las salidas publicadas del motor: el `result.json`
  y el `report.json` de cada ejecución, el archivo de escenario, el esquema de unidades de campos y las etiquetas de la
  matriz de verificación (la lista completa está en [Ediciones](#editions)).
- **Herramientas de diseño, incertidumbre y misión de Kshana Pro**: el frente de Pareto de un espacio
  de diseño, incertidumbre y sensibilidad sobre miles de ejecuciones, y un dosier de misión
  con un solo comando con una matriz de verificación y un PDF; véase [`docs/PRO.md`](docs/PRO.md).
- **Vigilancia de campañas, coexistencia espectral y servicio de trabajos de Kshana Pro**: un pipeline que
  falla cuando una cifra vigilada empeora, planes de señal probados frente a las señales abiertas de
  navegación por satélite en ambos sentidos, y una cola de trabajos local con un
  registro de entregas encadenado por hashes; véase [`docs/PRO.md`](docs/PRO.md).
- **Formación y consultoría** sobre análisis de prestaciones PNT cuánticas/clásicas.

Este es el modelo open core: el motor tiene, y mantiene, una licencia abierta; el negocio
que lo sostiene es la experiencia, el soporte y las extensiones propietarias, no las tarifas de licencia.
Contacto: **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Investigación

Los estudios basados en el motor abierto se publican en arXiv. Cada uno nombra el comando del motor
en el que se basa, de modo que sus cifras pueden regenerarse a partir de un escenario o un ejemplo de estudio incluidos.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Investigación basada en el motor abierto: seis artículos en arXiv, cada tarjeta con el nombre del artículo, su fecha y categoría, y el comando del motor que regenera sus cifras. Los mismos seis artículos, con enlaces y comandos, están en la tabla siguiente." width="100%">
</picture>

| Artículo | Qué muestra | Comando del motor |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | La caída de la puntuación de un detector de interferencias GNSS cuando cambian las condiciones puede predecirse solo a partir de estadísticos dentro de la distribución, en un banco de pruebas sintético abierto y después en grabaciones de campo abiertas. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Un receptor de temporización GNSS bajo spoofing no tiene una cota incondicional finita del error de tiempo no detectado, así que el artículo da una condicional, calibrada con un spoofing por el aire registrado en la campaña pública JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Una única puntuación compuesta de resiliencia es una base estable para una decisión solo cuando un diseño domina; cuando los diseños compiten, basta con cambiar la ponderación para cambiar el ganador. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | La medición de distancias dentro de una constelación lunar deja inobservable la posición absoluta de una estación de superficie; un retardo de interferometría de muy larga base (VLBI) desde la Tierra la restablece cuando la constelación es escasa, y la precisa cuando es rica. | el tipo `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Las constelaciones planificadas de cuatro a seis satélites dan una geometría pobre en el polo sur lunar, y unas pocas balizas de medición de distancia en la superficie la corrigen con un coste mucho menor que más satélites. | el tipo `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | La dilución de la precisión no está definida para el seguimiento cislunar solo por distancia, porque la velocidad es inobservable en una instantánea, así que el artículo usa el gramiano de observabilidad en cuatro órbitas retrógradas distantes planas: solo con distancia el rango es 2 de 4 en una instantánea y se necesita un arco de unas 2.09 h para que sea totalmente observable, con un condicionamiento que mejora a medida que se alarga el arco; la tasa de distancia (Doppler) da rango 4 de inmediato; y coestimar una estación con los estados y los relojes de los satélites sigue siendo deficiente en rango por uno salvo que se añada un observable interferométrico externo. Los requisitos deben expresarse en presupuestos de longitud de arco, condicionamiento y tipo de medición, no en DOP. | el tipo `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (su tipo hermano `cislunar-arc-recovery` prueba el umbral con un estimador independiente por diferencias finitas) |

Los tres ejemplos de estudio escriben artefactos deterministas byte a byte (semillas fijas) que registran su
versión del motor, sus semillas y un hash de la configuración. Los tres artículos lunares y cislunares se basan en el
conjunto lunar (el nivel de evidencia de cada pieza está en la matriz de verificación); sus afirmaciones de geometría y de dilución de la precisión también se comprueban de forma cruzada
frente a referencias independientes separadas en `tests/validate_p*.rs`. Más información en
[Artefactos de estudio reproducibles](#reproducible-study-artifacts) en Referencia.

<a id="cite"></a>
## Citar

Si usa Kshana en un trabajo académico o técnico, cite la versión que usó, con el
escenario y la semilla. [`CITATION.cff`](CITATION.cff) contiene los metadatos legibles por máquina, y
GitHub muestra a partir de él un botón "Cite this repository". Cada versión se archiva en Zenodo;
el DOI (Digital Object Identifier) conceptual
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) siempre se resuelve a la
última versión.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Los artículos anteriores:

> Baweja, C. (2026). *Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*. arXiv:2606.22054. https://doi.org/10.48550/arXiv.2606.22054
>
> Baweja, C. (2026). *A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*. arXiv:2606.24210. https://doi.org/10.48550/arXiv.2606.24210
>
> Baweja, C. (2026). *How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*. arXiv:2607.05415. https://doi.org/10.48550/arXiv.2607.05415
>
> Baweja, C. (2026). *Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*. arXiv:2607.02566. https://doi.org/10.48550/arXiv.2607.02566
>
> Baweja, C. (2026). *The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*. arXiv:2607.06212. https://doi.org/10.48550/arXiv.2607.06212
>
> Baweja, C. (2026). *Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*. arXiv:2610.23871. https://doi.org/10.48550/arXiv.2610.23871

<a id="licence"></a>
## Licencia

Kshana tiene licencia dual: la GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)) o una
**licencia comercial** de Ashforde® OÜ para integraciones cerradas a las que no se ajusta la AGPL.
[`LICENSING.md`](LICENSING.md) explica cuál se aplica. Las contribuciones se licencian de entrada
bajo la AGPL y además conceden a Ashforde® OÜ el derecho a incluirlas en la edición
comercial; firme cada commit con `git commit -s` (véase [`CONTRIBUTING.md`](CONTRIBUTING.md)).
"Kshana" y sus marcas son marcas comerciales de Ashforde® OÜ: la licencia cubre el código, no el
nombre, así que cambie el nombre de las bifurcaciones.

<a id="reference"></a>
## Referencia

El material extenso, plegado. Todos los documentos figuran en [Documentación](#documentation).

<details>
<summary>Instalación y compilación desde el código fuente</summary>

<a id="install--build"></a>
### Instalación y compilación

Requiere una cadena de herramientas de Rust (≥ 1.88, la `rust-version` de Cargo.toml; desarrollado con 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Uso: la línea de comandos completa</summary>

### Uso

Ejecute cualquier escenario; la CLI despacha según el campo `kind` del escenario y escribe
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` y
`<scenario>.report.json` a su lado, además de `<scenario>.table.csv` para los tipos que
publican una tabla. El informe (una página HyperText Markup Language (HTML) y un documento JSON
con el mismo contenido) incluye un resumen ejecutivo, cada entrada con su unidad, los
resultados y gráficos, las tablas de barrido, Monte Carlo o cadena de una campaña, una cronología de eventos,
la etiqueta VALIDATED / MODELLED / PARTNER y la fuente de cada capacidad que usó la ejecución,
lo que no está modelado y un registro de reproducibilidad (versión del motor, resúmenes Secure Hash
Algorithm 256-bit (SHA-256), semilla, plataforma y el comando exacto). Se imprime a
un archivo PDF (Portable Document Format) limpio desde el navegador en papel A4 o Letter; el
motor no escribe ningún PDF por sí mismo. Véase [`docs/REPORTS.md`](docs/REPORTS.md).

```bash
cargo run -- scenarios/clock-holdover.toml
cargo run -- scenarios/imu-deadreckoning.toml
cargo run -- scenarios/timetransfer.toml
cargo run -- scenarios/hybrid-pnt.toml
cargo run -- scenarios/orbit-gnss-challenged.toml
cargo run -- scenarios/orbit-sgp4-gps.toml
cargo run -- scenarios/orbit-rinex.toml
cargo run -- scenarios/integrity-raim.toml

# Export a propagated constellation to an SP3-c precise-ephemeris file:
cargo run -- scenarios/orbit-sgp4-gps.toml --export-sp3 gps.sp3

# Export the constellation's mean elements to a CCSDS OMM catalogue (one OMM
# message per TLE-defined satellite, with its real NORAD id / COSPAR designator):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-omm gps.omm

# Export the velocity-carrying state to a CCSDS OEM 2.0 ephemeris (GMAT/Orekit/STK):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-oem gps.oem

# Export the geometry for a globe, a map or a mission-analysis tool: CZML, KML,
# GeoJSON, STK .e, or SigMF for the spectrum kind (every format that applies):
cargo run -- scenarios/jamming-demo.toml --export all
```

`--export <czml|kml|geojson|stk|sigmf|all|list>` escribe CZML (el Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), efemérides Ansys STK (Systems Tool Kit) `.e`
y grabaciones SigMF (Signal Metadata Format) junto al escenario, y
`--import-route <route.geojson>` introduce una línea GeoJSON en los tipos que recorren trayectorias. Cada
formato se valida frente a su especificación publicada, y un escenario al que un formato no
se aplica indica por qué: véase [docs/INTEROP.md](docs/INTEROP.md).

**Otros modos de la CLI**: comprobar un escenario, introducir datos reales de orientación de la Tierra o ejecutar una suite completa:

```bash
# Lint a scenario without running it (checks the kind + required fields):
cargo run -- --validate scenarios/integrity-raim.toml

# Feed a real IERS Earth-orientation file (finals2000A) for frame precision:
cargo run -- scenarios/orbit-sgp4-gps.toml --eop tests/fixtures/agency/eop/finals2000A_2022001.txt

# Run a SUITE of scenarios into one aggregated, stamped study artifact
# (writes <suite>.study.json + <suite>.study.html next to the manifest):
cargo run -- --study scenarios/quantum-pnt-demonstrator.suite.toml

# Animate a run's time series: an animated SVG, a self-contained HTML player, and a
# numbered SVG frame sequence with manifest.json (see docs/ANIMATION.md):
cargo run -- scenarios/campaign-jam-spoof-holdover-integrity.toml --animate all
```

**Exportación de animaciones.** `--animate svg|html|frames|all` escribe `<scenario>.animation.svg`
(keyframes de Cascading Style Sheets (CSS), sin script), `<scenario>.animation.html` (reproducir, pausar, desplazarse, velocidad y
paneles sincronizados, sin ningún recurso externo) y `<scenario>.frames/` (`frame_0000.svg`, … además de
`manifest.json` con los fotogramas por segundo y la duración). Una campaña reproduce sus fases y
alarmas, una ejecución de espectro su cascada; el tema sigue `prefers-color-scheme` y
`prefers-reduced-motion` muestra la imagen final. Representa las propias muestras de la ejecución,
idénticas byte a byte al volver a ejecutarla, y no añade evidencia. Véase [docs/ANIMATION.md](docs/ANIMATION.md).

Un manifiesto de **suite** es un pequeño archivo TOML (Tom's Obvious, Minimal Language), un `title` y una matriz `scenarios = [ … ]` de
rutas de escenarios, que el motor ejecuta por turnos, incorporando cada resultado (con sus
etiquetas MODELLED / VALIDATED) en un único artefacto de estudio autodescriptivo. Véase
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Papel en la interoperabilidad.** Kshana es la capa de *simulación de prestaciones* que se sitúa
junto a la cadena de herramientas de posprocesamiento, no un sustituto de ella: introduzca su salida **RINEX**
en RTKLIB o gLAB para obtener una solución de posición, y use su salida **SP3** como
producto de órbitas precisas para herramientas como Ginan. Kshana responde *qué resiliencia aporta una arquitectura
PNT determinada* antes de que usted tenga señales reales, en formatos que esas herramientas ya
ingieren (`--export-sp3`, o `export_sp3 = true` en un escenario `orbit`, escribe
`<scenario>.sp3`). La misma órbita puede publicarse como elementos medios **CCSDS OMM**
normalizados (`--export-omm`, o `export_omm = true`, escribe `<scenario>.omm`):
un mensaje OMM 502.0 KVN (notación palabra clave = valor) por satélite definido por TLE, con el número real de catálogo
NORAD (North American Aerospace Defense Command), el designador internacional COSPAR (Committee
on Space Research) y la época de cada objeto, para cualquier
consumidor compatible con OMM en lugar de un conjunto de elementos de dos líneas a medida.

Salida de ejemplo (holdover del reloj; observe cómo se informan las cifras de mérito de integridad y de seguridad):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

El error de temporización del percentil 95 (p95) del reloj óptico es de 1.20e-4 ns: el resumen
imprime los valores pequeños con cifras significativas en lugar de redondearlos a `0.0`.
`security` indica `n/a (no attack)` porque este escenario no configura ningún ataque, así que no
hay nada que detectar. El resultado JSON sigue incluyendo la cota analítica de detectabilidad del spoofing
de cada reloj en `fom.security` (0.997 para el reloj óptico, 0.000 para el
reloj atómico a escala de chip, cuyo propio ruido durante la ventana de monitorización supera la especificación
de 20 ns), y su bloque `figure_tiers` marca esa cifra como `applicable: false`. El tipo de escenario `spoof`
puntúa la detección frente a un ataque inyectado. `figure_tiers` también da a
cada cifra informada su nivel de verificación, VALIDATED (comprobada frente a una referencia
externa) o MODELLED, y la fila de la matriz de verificación de la que se lee el nivel. El escenario
de órbita informa además de un bloque de geometría (fracción de muestras con posición, y
dilución de la precisión de la posición (PDOP) y precisión de posición mejores/medianas) junto al
resultado del reloj.

> **Lea estas dos cifras con atención.** `security` es una *cota analítica de detectabilidad del spoofing*
> derivada de la estabilidad de cada reloj: solo tiene sentido frente a un
> escenario de spoofing configurado y **no** es un detector RAIM multisatélite. `integrity`
> es aquí la *autocoherencia* del filtro (fracción de muestras de la interrupción dentro de su propia cota
> de k sigmas), **no** una cifra de integridad HPL/VPL de aviación. Véase
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Para una integridad autónoma real en el receptor, el **tipo de escenario `integrity`**
> (`scenarios/integrity-raim.toml`) ejecuta un RAIM real instantáneo y por separación de soluciones
> (estilo ARAIM) sobre la geometría de la constelación propagada: calcula
> **niveles de protección horizontal/vertical (HPL/VPL)** por época e informa de la
> fracción de épocas que cumplen los límites de alerta configurados, con un diagrama de
> integridad de Stanford para la clasificación error frente a PL (nivel de protección).

<a id="reproducible-study-artifacts"></a>
#### Artefactos de estudio reproducibles

Cuatro estudios abiertos regeneran cada uno un artefacto determinista byte a byte (semilla fija) con un
solo comando: las cifras en las que se basan los estudios del cruce cuántico frente a clásico, de la brecha de optimismo
de deterioros de RF, de la puntuación de resiliencia PNT y del nivel de protección de temporización:

```bash
# Quantum-vs-classical resilience crossover map (writes paper/crossover/*.json):
cargo run --release --bin crossover_study -- paper/crossover

# RF-impairment optimism-gap study (13-detector panel, scaling laws, LOO predictor):
cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json

# Framework-aligned PNT-resilience scoring + decision-instability study:
cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json

# Conditional Timing Protection Level, calibrated on a real recorded spoof:
cargo run --release --example tpl_jammertest
```

Cada artefacto registra su versión del motor, sus semillas y un hash de la configuración, y lleva una etiqueta honesta
MODELLED/VALIDATED. Las sondas de datos reales (`*_probe`) ejecutan la misma cadena sobre
grabaciones que usted aporta localmente; el repositorio no incluye ningún conjunto de datos. El estudio de la brecha
de optimismo de deterioros de RF se describe en la preimpresión
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), y el nivel de protección de temporización
condicional (`tpl_jammertest` arriba) en la preimpresión
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (véase [Citar](#cite)).

Los estudios publicados de PNT lunar ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP con balizas de superficie, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) observabilidad
VLBI y [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) observabilidad cislunar según la longitud
de arco) tienen sus afirmaciones de geometría, dilución de la precisión, predicción en tiempo real del marco /
de los parámetros de orientación de la Tierra (EOP), órbitas retrógradas distantes y medición de distancias por RF
comprobadas de forma cruzada e independiente en
`tests/validate_p*.rs` frente a referencias independientes separadas (`scipy.special.j1`, una resolución independiente del DOP
`(HᵀH)⁻¹` con NumPy, un nuevo análisis con NumPy de las mismas filas `finals2000A` del IERS y la
NASA/JPL Three-Body Periodic Orbit Database). Son comprobaciones de regresión adicionales sobre
el conjunto lunar **modelado**; no cambian el recuento de la matriz comprobada automáticamente.

</details>

<details>
<summary>Formato de escenario</summary>

<a id="scenario-format"></a>
### Formato de escenario

Los escenarios son TOML declarativo. Un `kind` de nivel superior selecciona el paquete, **cincuenta** en
total (`clock` es el predeterminado si se omite): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (banco de pruebas de evaluación de la detección de deterioros de RF con IA/ML:
corpus sintético etiquetado + sistema de evaluación ROC/AUC independiente del detector +
brecha de optimismo dentro/fuera de la distribución), `quantum-trade` (compromiso PNT cuántico frente a clásico
con ingesta de ADEV medida + envolvente de resiliencia sin GNSS; MODELLED),
`space-weather` (índices solares/geomagnéticos + temperatura exosférica de Jacchia-71 +
densidad termosférica dependiente de la actividad frente a la atmósfera estática; MODELLED),
`oem-interop` (puente de importación/ida y vuelta CCSDS OEM para efemérides de GMAT/Orekit/STK;
MODELLED), el trío de análisis de misión `launch-window` (azimut de lanzamiento de dos cuerpos /
cambio de plano / oportunidades), `reentry` (corredor de reentrada balística de Allen-Eggers),
`eo-coverage` (geometría de franja / GSD / acceso / revisita de observación de la Tierra), `space-packet` (tramado de Space Packet CCSDS
133.0 TM/TC — telemetría/telecomando —, con la disposición exacta de bits, verificado de ida y vuelta), y
`attitude-budget` (par de gradiente de gravedad de 3-DOF + presupuesto de error de apuntamiento RSS),
`passes` (predicción de pasos de salida/puesta sobre estaciones terrestres: AOS/TCA/LOS, elevación máxima,
acceso) y `link-budget` (ecuación de enlace unidireccional CCSDS/DSN: FSPL / Eb·N₀ /
margen / cierre); `telecom-timing` (error de tiempo en holdover, MTIE y TDEV comprobados
frente a las máscaras del ITU-T); `spectrum` (toda la banda L de GNSS como una densidad espectral de potencia:
una cascada frecuencia-tiempo bajo una cronología programada de inhibidores de onda continua, banda estrecha, barrido o
ruido adaptado, relación inhibidor/señal por banda y densidad portadora-ruido
efectiva a partir del coeficiente de separación espectral, y entrada y salida de grabaciones Signal Metadata
Format (SigMF) con estimaciones espectrales de Welch; los espectros de las señales
VALIDATED frente a valores de manual, el escenario de inhibidores MODELLED; véase
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); el mismo tipo dibuja paneles de las bandas UHF, S y C con
señales diseñadas de órbita terrestre baja); `leo-signal` (diseños de señales de posicionamiento, navegación y
temporización en órbita terrestre baja para cualquier sistema: espectros de banda limitada, fluctuación del seguimiento de código y precisión
de la medición de distancia, búsqueda y tiempo de adquisición, separación espectral frente a GPS y Galileo, tolerancia
a inhibidores y un compromiso entre las bandas UHF y C, a partir de preajustes públicos como Xona Pulsar, Iridium,
Starlink y CentiSpace o de diseños en línea; las formas cerradas y el Doppler LEO VALIDATED, los
diseños MODELLED; véase [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (el Sol, los planetas, Plutón, la Luna y siete lunas
principales en una época: posiciones, constantes, tiempos de luz y trazas orbitales; posiciones de los planetas
VALIDATED frente a JPL Horizons) y `body-pnt` (posicionamiento alrededor de cualquiera de esos cuerpos con una
constelación de navegación local y un enlace de espacio profundo desde la Tierra; MODELLED); `campaign` (tipos existentes combinados en una cronología de misión encadenada
con el estado traspasado entre fases, un barrido de parámetros, un conjunto de Monte Carlo con semilla, o
varios escenarios bajo una condición común; MODELLED, véase
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (patrones Walker delta y en
estrella, listas de elementos y diseños de varias capas con preajustes de GPS, Galileo, BeiDou y GLONASS,
y cobertura y dilución de la precisión sobre una rejilla de latitud/longitud; el
generador y el DOP global de GPS VALIDATED frente a los documentos de servicio publicados, véase
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (un paso de un satélite de
posicionamiento, navegación y temporización (PNT) en órbita terrestre baja (LEO) y su presupuesto de enlace banda a
banda, para cualquier constelación y cualquier diseño de señal: ángulos de observación, Doppler y tasa de Doppler,
pérdidas UIT-R por lluvia, gases, centelleo y entrada en edificios, densidad portadora-ruido frente a los
satélites GNSS MEO visibles, la ionosfera de primer orden y los pares libres de ionosfera, y un
presupuesto de posición de baja energía, sondeo ionosférico a partir de cada par de bandas, y monitores de spoofing por
coherencia del Doppler y de la geometría del paso y por coherencia entre bandas; los términos UIT-R y la
envolvente Doppler para usuarios estáticos VALIDATED, el paso MODELLED, véase
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (el mensaje radiodifundido de efemérides
y de reloj de un satélite PNT en órbita terrestre baja (LEO), para cualquier órbita y
portadora: un ajustador desde una órbita verdadera integrada al conjunto kepleriano de Galileo, ese conjunto
con polinomios de corrección a lo largo de la traza, transversales y radiales, el modelo de 22 parámetros de Liu et al. 2025
o el polinomio ECEF de reloj cero de ATOMIC; error de distancia de la señal en el espacio
(SISRE) frente al intervalo de ajuste y el periodo de actualización, una comprobación de continuidad de una actualización a mitad del paso,
la trama binaria documentada propia de Kshana con una comprobación de redundancia cíclica CRC-24Q y un presupuesto de cuantización, y un
bloque al estilo de RINEX 4 etiquetado como extensión de Kshana; los pesos del SISRE, el algoritmo de usuario
de Galileo y el CRC-24Q VALIDATED, los ajustes MODELLED; preajustes opcionales para Xona Pulsar,
Iridium, Starlink, CentiSpace, un sistema representativo en banda C, ATOMIC y Celeste IOD; véase
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); el trío de **PNT fusionado MEO + LEO**
`leo-pvt` (posicionamiento Doppler a partir de la tasa de distancia en órbita terrestre baja (LEO), posiciones conjuntas
de pseudodistancia GNSS + LEO con sesgos entre sistemas y el DOP frente al número de satélites
LEO, cobertura polar y ártica, y transferencia de tiempo LEO a UTC, sobre cualquier constelación,
con preajustes opcionales como señales de oportunidad de Xona Pulsar, Iridium y Starlink; la
envolvente Doppler LEO VALIDATED frente a las cifras publicadas de Iridium y Xona), `leo-ppp`
(convergencia del posicionamiento preciso de punto solo con GNSS y con aumentación LEO, comparada
con Li et al. 2019) y `ntn-positioning` (posicionamiento en redes no terrestres 5G a partir de la
cota de Cramér-Rao del ancho de banda de la señal), MODELLED salvo esa envolvente, véase
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (un sistema LEO-PNT de extremo
a extremo: un diseño `leo-signal` transportado por una banda de `leo-pass`, la C/N0 del paso y el error de distancia
de la señal en el espacio del mensaje de navegación entregados a una posición fusionada `leo-pvt` y a la convergencia de `leo-ppp`,
con cada traspaso enumerado; MODELLED, véase
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), que es también la visión general de
todos los tipos y escenarios LEO-PNT, incluidas las campañas de resiliencia, un escenario por
área de enfoque de experimentos y uno por vertical de usuario final); el **conjunto PNT lunar** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; el **demostrador de PNT con tecnología cuántica**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; y los
tipos de investigación de **seguridad de la señal, cislunar y resiliencia por capas** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience`: el trío de análisis de misión y estos tipos posteriores son todos MODELLED
(cada uno con un núcleo en forma cerrada validado; véase la matriz).
Campos comunes: `seed`, una rejilla `[time]`, una cronología de disponibilidad `[gnss]` (lo que
provoca la interrupción) y bloques por sensor con cadenas `provenance` que citan la fuente de cada
cifra. Ejemplo (reloj):

```toml
seed = 42
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 7200.0
[gnss]
windows = [
  { t0 = 0.0,   t1 = 600.0,  state = "nominal" },  # 10 min GNSS sync
  { t0 = 600.0, t1 = 7200.0, state = "denied"  },  # ~1.8 h outage
]
[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15 (arXiv:1503.08457)"
y0 = 5.0e-17
q_wf = 1.0e-30   # white FM:  q_wf = sigma_y(1s)^2
q_rw = 0.0       # random-walk FM
drift = 0.0      # linear aging (per second)
[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)=3e-10"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
drift = 0.0
```

Campos opcionales (desactivados si faltan): un reloj puede añadir `flicker_floor` (mínimo de Allan de FM — modulación de
frecuencia — 1/f); un sensor inercial puede añadir `gyro_bias` y `q_arw` (sesgo del giróscopo y paseo aleatorio
angular), y `bias_instability` y `q_aa` (el mínimo de Allan de inestabilidad del sesgo y el
paseo aleatorio de aceleración): en conjunto, un **presupuesto de error de acelerómetro de un solo eje
(1-DOF)** (VRW/ARW — paseo aleatorio de velocidad/angular — e inestabilidad del sesgo). Este es el presupuesto de error que ejecuta el
*paquete* de escenario `inertial` distribuido. Por separado, la biblioteca incluye ahora un
**navegador strapdown de 3 ejes** verificado (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
actitud en cuaterniones con compensación de coning/sculling, una mecanización NED completa
(términos de velocidad de rotación de la Tierra y de transporte, gravedad de Somigliana WGS-84) y un
modelo de error de IMU determinista en el que **se modelan el factor de escala, la desalineación,
la sensibilidad a g, la cuantización y la rampa de velocidad** (IEEE Std 952-1997, la norma del IEEE
de especificación y procedimientos de prueba de giróscopos, §A.2; Groves 2013 §4.3). Esa vía de 3 ejes está ahora **conectada a un paquete
GNSS/INS débilmente acoplado ejecutable** (`kind = "gnss-ins"`): un EKF de estado de error de 15 estados
disciplina la solución strapdown frente a posiciones con ruido mientras hay GNSS, y después
navega libremente durante la interrupción, informando del error horizontal fusionado frente a la
navegación libre en lazo abierto de la INS. También está disponible una actualización de
**pseudodistancia fuertemente acoplada** (forma la innovación en el dominio de la distancia, así que sigue corrigiendo
con menos de cuatro satélites). Un
escenario de holdover del reloj puede añadir `runs` (> 1) para ejecutar un **conjunto de Monte Carlo**: cada
cifra de mérito se informa entonces como una media con una dispersión entre los percentiles 5 y 95, y el
gráfico sombrea la banda de confianza del error (véase `scenarios/clock-ensemble.toml`).

Un escenario `fusion` (los mismos bloques que `hybrid`) ejecuta **dos estimadores de Kalman independientes**
— uno para el estado del reloj y otro para el estado de la posición — disciplinados por GNSS y asistidos por
transferencia óptica de tiempo, e informa de una FoM de holdover combinada. Los dos bloques no comparten
covarianza cruzada: se trata de un par apilado de presupuestos de error, **no** de un verdadero filtro conjunto
acoplado de reloj+posición (la covarianza entre bloques es un elemento de la hoja de ruta). Véase
`scenarios/fusion-pnt.toml`.

Un escenario `spoof` inyecta un spoofing de tiempo, de uno de cuatro tipos `[attack.shape]`
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; un `rate_ns_per_s` aislado se sigue
aceptando como rampa lineal), y ejecuta el detector de spoofing de cada reloj. El detector es una
**prueba de energía χ²₁ / de Neyman–Pearson** bilateral sobre el estadístico del monitor asistido por reloj:
el umbral se fija a partir de un presupuesto objetivo de falsas alarmas `target_pfa`, y la
**probabilidad de detección omitida `P_md`** se informa tanto en forma cerrada como por
Monte Carlo (`mc_runs` ensayos por hipótesis; ambas coinciden dentro de unas pocas veces 1/√N). La
**cifra de mérito de seguridad es `1 − P_md`** en la magnitud operativamente dañina (la de la especificación),
así que un reloj silencioso que detecta un spoofing del tamaño de la especificación puntúa ≈ 1 y uno ruidoso
que a menudo no lo detecta puntúa menos (véanse `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Un escenario `gnss-sim` es una simulación en el **dominio de medición**: para cada satélite
visible sintetiza la pseudodistancia `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` y el Doppler de L1, con la ionosfera de frecuencia única de **Klobuchar**
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) y la troposfera cenital de **Saastamoinen**
proyectada con la función de mapeo de **Niell (1996)** (`[tropo]`). Los
residuos alimentan un **RAIM instantáneo** para el HPL/VPL por época, y la
pseudodistancia, el Doppler, la C/N₀ y las correcciones ionosféricas/troposféricas de cada satélite se emiten en la matriz JSON
`gnss_measurements`. Es un simulador directo (genera mediciones a partir de
una verdad conocida), no un receptor/solucionador: una ejecución sin ruido reproduce la geometría más las
correcciones por debajo del milímetro (véase `scenarios/gnss-sim-raim.toml`).

Un escenario `jamming` modela la interferencia de RF como un **presupuesto de enlace**: un `[jammer]`
(posición ECEF, `power_dbw` de transmisión, tipo) eleva la relación inhibidor/señal en un
`[receiver]` que observa una `[constellation]` Walker. A partir de la geometría (pérdida de trayecto en
espacio libre y la ganancia de la antena receptora por dirección) calcula la `J/S` de cada satélite,
la **C/N₀ efectiva** mediante la ecuación antiinterferencia estándar (ganancia de procesamiento
por desensanchamiento × el factor de separación espectral `Q`; Kaplan y Hegarty §9.4), y
marca la pérdida de enganche por debajo de un umbral de seguimiento configurable, informando de una
cifra de mérito `availability_under_jamming`. Un inhibidor de banda ancha de 10 W a 1 km
anula por completo el receptor (J/S ≈ 72 dB); el mismo inhibidor a 100 km solo
degrada los enlaces (véase `scenarios/jamming-demo.toml`).

Un escenario `sweep` ejecuta un **estudio de compromisos**: varía un `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` o `classical_q_wf`) de `start` a `stop` en `steps`
puntos con una `scale` `lin` o `log`, registra una `metric` (p. ej. `holdover_s`) para ambos
relojes y representa las dos curvas. El escenario base va bajo `[base]` (véase
`scenarios/sweep-clock-stability.toml`).

Un escenario `sweep-nd` generaliza esto a **cualquier paquete y cualquier número de ejes**:
varía claves TOML con puntos de un escenario `[base]` (de cualquier `kind`) sobre el producto
cartesiano de `[[axes]]`, vuelve a ejecutar cada nodo de la rejilla y registra `metrics` dadas como
rutas JSON con puntos dentro del resultado (p. ej. `classical.fom.holdover_s`). Funciona con
todos los paquetes porque opera en la frontera TOML/resultado; las ejecuciones nativas evalúan
la rejilla en paralelo (sin dependencias adicionales; wasm recurre a la ejecución secuencial) y la
salida es determinista y por filas (véase `scenarios/sweep-nd-inertial.toml`).

Un escenario `orbit` deriva la cronología `[gnss]` de la geometría en lugar de escribirla
a mano: indique una órbita `[user]`, una `[constellation]`, una máscara de elevación `mask_deg` y los dos
bloques de reloj. También informa de la precisión de posición a partir de la geometría de los satélites; el
`sigma_uere_m` opcional (error de distancia equivalente del usuario a 1 sigma, 1 m por defecto) escala la
dilución de la precisión de la posición a una sigma de posición. La órbita del usuario puede hacerse
**excéntrica** con `eccentricity` y `argp_deg`, y `j2 = true` añade la deriva secular por el achatamiento
terrestre (véase `scenarios/orbit-molniya.toml`). La constelación puede ser en cambio una
**real**: dé a `[constellation]` un bloque `tle` de conjuntos de elementos de dos líneas y los
satélites se analizan a partir de él (véase `scenarios/orbit-real-tle.toml`). Añada uno o varios
bloques `[[constellations]]` para **multi-GNSS** (p. ej. GPS + Galileo; véase
`scenarios/orbit-multignss.toml`):

```toml
kind = "orbit"
seed = 7
threshold_ns = 5.0
mask_deg = 10.0
sigma_uere_m = 1.0           # optional; position sigma = position-DOP * this
[time]
step_s = 60.0
duration_s = 86400.0
[user]                       # spacecraft (altitude in km, angles in deg)
altitude_km = 8000.0
inclination_deg = 0.0
[constellation]              # Walker-delta GNSS (GPS-like)
altitude_km = 20180.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 1.0
[clock_quantum]  # ... as above
[clock_classical]  # ... as above
```

Los tipos de **PNT alternativo sin GPS** navegan sin ningún GNSS, comparando una secuencia medida
de un campo con un mapa mediante un filtro de partículas. Un escenario `gravity-map` recorre una trayectoria
a través de un campo de anomalías de gravedad en armónicos esféricos y la recupera a partir de la lectura de un
gravímetro de átomos fríos (`scenarios/gps-denied-gravity-nav.toml`); un escenario `terrain-nav`
hace lo mismo frente a un DEM de elevaciones SRTM (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
y un escenario `combined-altpnt` fusiona **gravedad + magnetismo IGRF + terreno** en un solo filtro
(`scenarios/combined-altpnt.toml`).

Un escenario `lunar-integrity` evalúa el PNT **cislunar**: ejecuta un pase de nivel de protección
ARAIM en el polo sur lunar frente a un conjunto de repetidores LunaNet/LNIS e informa con honestidad de la
brecha de integridad: un σ_URE lunar de ~30 m lleva el nivel de protección muy por encima de un límite de alerta
de 50 m, así que el servicio *no está disponible* según reglas de integridad de tipo aeronáutico
(`scenarios/lunanet-araim.toml`).

Un escenario `lunar-time-offset` informa de la **tasa relativista de los relojes Tierra–Luna**, la
base de una escala de Tiempo Coordenado Lunar (LTC/TCL). Una identidad post-newtoniana desde primeros principios
suma la diferencia de autopotencial (el potencial del geoide `L_G` de la IAU menos el autopotencial
de la superficie lunar) y el término cinético de la Luna (Doppler de segundo orden) hasta una tasa secular
de ≈ 57 µs/día, informada junto a la banda publicada de 56–59 µs/día; también da el
desplazamiento LTC−TT acumulado a lo largo de un horizonte y un conjunto por varianza inversa (un
reloj de papel lunar). **MODELLED**: la cifra principal *depende de la referencia* (geoide terrestre
frente a selenoide lunar, ventana de promediado), por lo que se informa de una banda y no de un único número
certificado (`scenarios/lunar-time-offset.toml`).

Véase `scenarios/` para al menos un ejemplo práctico de cada tipo (92 tipos, 193 archivos `.toml`
de escenario + 1 manifiesto de suite; varios tipos incluyen más de un ejemplo). No todos los
tipos tienen un archivo con su nombre: `lunar-integrity` → `scenarios/lunanet-araim.toml` y
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` son dos de varios casos así.
Enumere en cualquier momento los tipos despachables con los errores de `cargo run -- --validate <file>`,
el `list_kinds()` de Python o la herramienta MCP `list_scenario_kinds`.

</details>

<details>
<summary>Salida</summary>

### Salida

El artefacto de resultado es JSON versionado y autodescriptivo: series temporales por paso, las
cifras de mérito puntuadas, las especificaciones de los modelos activos (con su procedencia), la semilla, un
**hash del escenario** (de modo que cualquier gráfico pueda reproducirse a partir del archivo) y, para cada reloj,
una `adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): la desviación de Allan
solapada en tiempos de promediado espaciados por octavas, la forma estándar de leer la
estabilidad de un reloj, ahora con una **banda de confianza del 95% específica del tipo de ruido** por punto (el tipo
de ley de potencias del registro se identifica por su pendiente de Allan modificada, y el intervalo χ² usa los
grados de libertad efectivos correspondientes de NIST SP 1065). El entorno de pruebas del navegador lo representa como un
gráfico log-log "Clock stability (ADEV)". (MDEV, TDEV y HDEV están disponibles como estimadores de la
biblioteca; la curva del resultado exportado es la ADEV solapada.) Cada campo, con sus unidades y un
puntero a su fuente, está documentado en [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Cada gráfico es autodescriptivo.** El entorno de pruebas del navegador, la exportación `*.chart.svg`
de la CLI y la tarjeta de puntuación HTML (HyperText Markup Language) estampan en cada imagen de gráfico un pie que dice
`Kshana v<version> · scenario <hash> · kshana.dev`. El `scenario <hash>` son los primeros
12 caracteres hexadecimales del **hash del escenario** de la ejecución, un resumen SHA-256 (el Secure Hash Algorithm de 256 bits) sobre la definición
canónica del escenario (semilla, umbrales, parámetros del modelo, ventanas GNSS, …); los informes de integridad y lunares,
que no llevan hash propio, recurren a un SHA-256 del código fuente del escenario.
Es la **misma huella** que se muestra en el resumen de una línea y en el JSON del resultado, así que un
gráfico guardado o pegado siempre lleva su versión, el escenario exacto que lo produjo (para
una reproducción bit a bit) y la fuente: si cambia cualquier entrada, cambia el hash.

Las cifras de mérito siguen las cifras de mérito PNT operativas estándar:

| Cifra de mérito | Cómo la calcula Kshana |
|-----------------|------------------------|
| Prestaciones de temporización (paquetes de reloj/órbita) | RMS del error de fase del reloj + percentil 95 durante la interrupción, en **nanosegundos** (`timing_rms_ns`): una métrica de temporización, no de posición |
| Prestaciones de posicionamiento (paquetes inercial/híbrido) | RMS del error de posición de 1-DOF + percentil 95 durante la interrupción, en **metros** (`pos_rms_m`); de un solo eje. Una ejecución única se marca `monte_carlo: false`; fije `runs = N` para un conjunto de Monte Carlo que informe de la media, la dispersión y el IC (intervalo de confianza) bootstrap del 95% de cada métrica. Sigue **sin** ser un CEP/2DRMS 2-D (error circular probable / dos veces la media cuadrática de la distancia) ni una precisión ponderada por DOP (requieren el modelo de 3 ejes: hoja de ruta) |
| Autonomía | duración del holdover: tiempo dentro de la especificación tras la pérdida del GNSS (cuantizado por la rejilla: una cota inferior) |
| Resiliencia | pendiente de crecimiento del error durante la interrupción |
| Disponibilidad | fracción de la ejecución con una solución dentro de la especificación |
| Integridad | **autocoherencia** del filtro: fracción de muestras de la interrupción cuyo error se mantiene dentro de la propia cota de k sigmas del filtro de Kalman. **No** es una cifra de integridad HPL/VPL/RAIM de aviación (véase [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Seguridad | **cota analítica de *detectabilidad* del spoofing** a partir de la estabilidad del reloj: cuán pequeño/lento puede ser un spoofing de tiempo que un monitor de coherencia de un solo reloj podría señalar. Solo tiene sentido con un ataque configurado; **no** es un detector RAIM multisatélite |

¿Es nuevo en estos términos? Cada uno se define en lenguaje sencillo en el [glosario](docs/GLOSSARY.md).

</details>

<details>
<summary>Estructura del repositorio</summary>

### Estructura del repositorio

```
kshana/
├── src/                                       # the kshana core crate (library + CLI)
│   ├── api.rs · main.rs · lib.rs              # typed dispatch (92 kinds) + CLI + crate root
│   ├── python.rs · wasm.rs                    # optional PyO3 / wasm-bindgen bindings
│   ├── types.rs · scenario.rs · allan.rs      # shared core (time grid, GNSS timeline, Allan)
│   │
│   ├── models.rs · estimator.rs · kalman.rs   # Pack 1 — clock holdover + integrity
│   ├── security.rs · detection.rs · spoof.rs · spoof_monitors.rs  # spoof detection
│   ├── filter_health.rs · fom.rs · fom_label.rs · report.rs · chart.rs · run.rs  # health · FoM scoring + labelling · output
│   ├── suite.rs · study.rs                     # scenario suites + aggregated multi-scenario study artifacts (`--study`)
│   ├── inertial/                              # Pack 2 — strapdown INS (attitude · mechanization · imu_errors · quantum_imu)
│   ├── timetransfer.rs · timetransfer_adv.rs · timegeo.rs  # Pack 3 — TWSTFT/CV/PPP/optical, Sagnac
│   ├── hybrid.rs · ensemble.rs · sweep.rs     # Pack 4 — fused PNT, Monte-Carlo, trade sweeps
│   │
│   ├── timescales.rs · jd2.rs · ephem.rs      # time systems, two-part JD, Sun/Moon ephemeris
│   ├── precession.rs · nutation.rs · cio.rs   # IAU 2006/2000A precession-nutation + CIO GCRS↔ITRS
│   ├── frames.rs · *_data.rs                  # TEME↔ECEF + generated nutation/CIO/EGM2008/IGRF tables
│   │
│   ├── orbit.rs · sgp4.rs · tle.rs · walker.rs   # geometry, SGP4/SDP4, TLE, Walker design
│   ├── propagator.rs · forces.rs · gravity_sh.rs · integrator.rs  # Cowell + perturbations (EGM2008 d/o70, GR) + RK4/DOPRI
│   ├── maneuver.rs · batch_ls.rs · orbit_determination.rs  # burns/Lambert/porkchop, Gauss-Newton, OD
│   ├── cr3bp.rs · lunar.rs · lunar_frame.rs · lunar_od.rs  # Earth–Moon CR3BP + halo/NRHO STM corrector, cislunar/LunaNet ARAIM, MCI↔MCMF, lunar OD
│   ├── lunar_time.rs · lunar_vlbi.rs · lunar_combination.rs · lunar_frame_realise.rs · lunar_service.rs · lunar_dpnt.rs · lunar_interop.rs  # tiers per piece in the matrix lunar PNT suite — LTC time · geodetic VLBI · joint OD+clock · frame realisation · Moonlight service-volume · differential PNT · LunaNet/IOAG interop export
│   ├── body.rs · mars_frame.rs · ephem_provider.rs · radiometric.rs · ccsds_tdm.rs  # deep-space: multi-body · Mars frame · ephemeris seam · radiometric obs + CCSDS-TDM
│   ├── deepspace_od.rs · clock_state.rs · mars_atmos.rs · mars_pnt.rs · linkbudget.rs · gse_sim.rs  # SRIF OD · onboard clock · Mars drag · relay-PNT · link budget · GSE sim
│   │
│   ├── fusion/                                # GNSS/INS — EKF · UKF · tightly_coupled(17) · coupled · closed_loop
│   ├── raim.rs · sbas.rs                      # RAIM/ARAIM HPL/VPL, SBAS DO-229E PLs + L1/L5 iono-free
│   ├── gnss_sim.rs · ionex.rs · pvt.rs · jamming.rs  # measurement domain · ionosphere maps · single-point positioning · jamming
│   ├── navsignal.rs                            # nav-signal PSD (BPSK-R/BOC) · spectral-separation → anti-jam Q · DLL code-tracking jitter · multipath envelope
│   ├── gravimeter.rs · igrf.rs · mapmatch.rs · particle_filter.rs · altpnt/  # gravity/magnetic/terrain alt-PNT
│   ├── rinex.rs · rinex_obs.rs · glonass.rs · sp3.rs · oem.rs · omm.rs · permalink.rs  # interop formats
│   ├── launch.rs · reentry.rs · eo_payload.rs · attitude_budget.rs · passes.rs · space_packet.rs  # mission-analysis budgets + CCSDS Space Packet
│   ├── space_weather.rs · holdover.rs · tpl.rs   # space-weather environment · GNSS-denied clock-holdover calculator · conditional Timing Protection Level (under spoofing)
│   ├── resilience/                              # framework-aligned PNT-resilience scoring + decision-instability study (RPCF · Dirichlet · Kendall-τ · diversity collapse · assurance report)
│   ├── impairment_eval.rs · impairment_study.rs · impairment_ml.rs · eval_stats.rs  # AI/ML RF-impairment eval testbed · optimism-gap study · LR/MLP detectors · bootstrap/DeLong/Spearman stats
│   ├── sdr.rs · realdata/                       # software-defined-receiver front end (IQ/IF → E/P/L taps → SQM) + real-data ingest adapters (RINEX · UBX · GnssLogger · JammerTest · Yunnan · SatGrid)
│   ├── crossover.rs · quantum_trade.rs · frugal.rs · integrity_impact.rs  # quantum-vs-classical crossover map · PNT trade · cost-per-coverage ROI · integrity impact
│   ├── quantum_devices.rs · quantum_faults.rs · quantum_nav_od.rs · qtrade.rs · timetransfer_chain.rs · representativeness.rs  # Quantum-Enabled PNT demonstrator — device error models · fault catalogue · GNSS-free quantum OD · unified trade harness · quantum time-transfer chain · representativeness / gaps-to-flight ledger
│   ├── interchange.rs · verification.rs          # KIF artifact envelope · machine-checked verification matrix
│   └── bin/crossover_study.rs · bin/validation_report.rs  # crossover-study artifact generator · release validation-summary HTML
│
├── mcp/kshana-mcp/        # standalone, workspace-EXCLUDED crate — the MCP server (+ Dockerfile, server.json)
├── ide/jetbrains/         # standalone Kotlin/Gradle IntelliJ-Platform plugin
├── xval/                  # standalone, workspace-EXCLUDED external cross-checks: anise-{frames,lunar-od,mars-od,service-geometry} (Rust ANISE/SPICE DE440) + orekit-passes (Java Orekit)
│
├── examples/            # reproducible study generators: tpl_jammertest · resilience_report · optimism_study + real-data probes (jammertest_probe · yunnan_probe · satgrid_probe · texbat_probe · ingest_realdata)
├── paper-artifacts/     # byte-deterministic study artifacts, regenerable from examples/ (optimism-study.json · resilience-study.json); raw datasets stay out
├── scenarios/            # one cited .toml per kind + geometry-driven + GPS-denied
├── scripts/              # reproducibility + repo-hygiene + SBOM guards
├── docs/                 # CONCEPTS, ARCHITECTURE, CAPABILITY, VALIDATION, PROVENANCE, GLOSSARY, …
├── web/                  # the WebAssembly playground + kshana.dev site
├── tools/                # table generators (EGM2008 · IGRF · nutation · CIO) + fetch_tles.sh
├── .github/workflows/    # ci · release · publish · wheels · pages · mcp-publish · jetbrains-plugin · frame-xval
├── pyproject.toml        # Python packaging (maturin)
├── CHANGELOG.md          # Keep a Changelog + SemVer
└── CITATION.cff · ROADMAP.md · CONTRIBUTING.md · SECURITY.md
```

</details>

<details>
<summary>Preguntas frecuentes (FAQ)</summary>

### Preguntas frecuentes

**¿Necesito entender la física cuántica para usar esto?**
No. Si sabe ejecutar una línea de comandos, sabe ejecutar Kshana. Empiece por la
[introducción en lenguaje sencillo](docs/CONCEPTS.md); consulte los términos en el [glosario](docs/GLOSSARY.md).

**¿Es esto un diseño de hardware cuántico o software de vuelo?**
No. Es un *simulador* de prestaciones. La fidelidad del hardware cuántico procede de modelos de error
publicados, no de esta herramienta. Véase [Qué es / qué no es](#what-it-is--is-not).

**¿Son realistas los resultados cuánticos, o son marketing?**
Cada parámetro se cita con una hoja de datos o un artículo, cada modelo se valida frente a una
relación de manual, y la madurez se etiqueta con honestidad en
[VALIDATION.md](docs/VALIDATION.md), incluido que ningún reloj óptico de estroncio ha
volado. El motor es neutral: lo cuántico y lo clásico son el mismo código con distintas
cifras publicadas.

**¿Puedo confiar en que dos ejecuciones coincidan?**
Sí: las ejecuciones son deterministas, `scenario + seed + engine version → bit-identical output`,
impuesto por `scripts/check-reproducible.sh`.

**¿Puedo usarlo desde Python o en un navegador?**
Sí; véase [Instalación](#install): los ejemplos de Python y WebAssembly están ahí. Ambos llaman al mismo motor.

**¿Cómo modelo mi propio sensor?**
Escriba un escenario `.toml` con las cifras publicadas de su sensor en los campos `provenance`.
Véase [Formato de escenario](#scenario-format) y los ejemplos de `scenarios/`.

**¿Es gratuito para uso comercial?**
Sí, bajo la AGPL-3.0, incluso en entornos comerciales, siempre que respete el
copyleft de la AGPL (en particular: si modifica Kshana y lo ofrece a través de una red, debe
ofrecer a esos usuarios su código fuente modificado). Si eso no le conviene (p. ej. necesita
incorporar Kshana en un producto propietario o ejecutar un servicio de red cerrado), hay disponible una
licencia comercial de Ashforde® OÜ; véase [`LICENSING.md`](LICENSING.md) y
[Soporte](#support--professional-services).

</details>

<details>
<summary>Resolución de problemas</summary>

### Resolución de problemas

**`cargo build` falla con una cadena de herramientas antigua.** Kshana necesita Rust ≥ 1.88. Actualice con
`rustup update`.

**La compilación de la extensión de Python falla al enlazar en macOS** (`Undefined symbols … _Py…`).
Una extensión de Python resuelve sus símbolos en el momento de la carga. `maturin` establece automáticamente
la opción correcta del enlazador: use `maturin develop --features python` en lugar de un simple
`cargo build`.

**La compilación de Python indica que el intérprete es más reciente de lo que conoce PyO3.** Fije
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (las wheels abi3 son compatibles hacia delante entre
versiones de CPython).

**La compilación de WebAssembly no encuentra el destino.** Instálelo una vez con
`rustup target add wasm32-unknown-unknown` y después ejecute `wasm-pack build --target web -- --features wasm`.

**¿Dónde ha ido mi salida?** Cada ejecución escribe `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` y `<scenario>.report.json` junto al
`.toml` de entrada, y
también `<scenario>.table.csv` para los tipos que publican una tabla. Todos ellos los
ignora git por diseño.

</details>

<details>
<summary>Versionado y publicaciones</summary>

### Versionado y publicaciones

Kshana sigue el [Versionado Semántico](https://semver.org). Mientras sea anterior a 1.0, el esquema público
de escenarios/resultados aún puede cambiar; los cambios incompatibles se señalan explícitamente en
el [`CHANGELOG.md`](CHANGELOG.md). Cada resultado es reproducible a partir de
`scenario + seed + engine version`.

**Cada etiqueta `vX.Y.Z` publica automáticamente todos los canales, en un orden fijo**: primero se ejecuta la
suite de pruebas completa en el commit etiquetado, no se publica nada hasta que pasa, y
después el pipeline comprueba que cada registro sirve realmente la nueva versión
([`docs/RELEASING.md`](docs/RELEASING.md)). Los canales:

| Canal | Instalación / obtención | Contenido |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | biblioteca de Rust + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | el servidor MCP |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | wheels abi3 (Linux/macOS/Windows) + sdist (distribución del código fuente) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | módulo WebAssembly + envoltorio JS |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | imagen OCI (Open Container Initiative) multiarquitectura, sin necesidad de cadena de herramientas |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | lanzador: descarga el binario de la versión, verifica `SHA256SUMS` y lo ejecuta |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | el mismo lanzador para Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | el binario `kshana-mcp`, generado a partir del `SHA256SUMS` de cada versión |
| Claude Desktop | haga doble clic en `kshana-mcp-<target>.mcpb` de la versión publicada | la extensión, con el binario dentro |
| registro oficial de MCP | descubierto automáticamente por los clientes MCP | `io.github.ashfordeOU/kshana-mcp` (imagen OCI, paquetes de npm y PyPI) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → busque "Kshana" | el plugin para IDE **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | descarga | el binario de línea de comandos `kshana` para Linux x86-64, macOS (Apple silicon e Intel) y Windows x86-64, el binario `kshana-mcp` para cada uno de esos sistemas y para Linux Arm, una extensión `.mcpb` de Claude Desktop por sistema, un **SBOM** CycloneDX, procedencia de compilación **SLSA**, un resumen de validación en HTML y un archivo de sumas de comprobación `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | un archivo citable de cada versión |
| [kshana.dev](https://kshana.dev) | ábralo en un navegador | Kshana Studio, la aplicación WebAssembly en el navegador, recompilada a partir de cada etiqueta de versión (así que la versión que muestra es la versión que ejecuta) |

La versión del crate / la imagen / el registro del servidor MCP sigue al motor (incluye la
biblioteca); el plugin de JetBrains tiene versiones independientes (invoca el binario
`kshana` que usted tenga instalado).

</details>

<details>
<summary>Hoja de ruta</summary>

### Hoja de ruta

Véase [`ROADMAP.md`](ROADMAP.md) para la hoja de ruta por fases, [`CHANGELOG.md`](CHANGELOG.md)
para el historial de versiones publicadas y [`docs/CAPABILITY.md`](docs/CAPABILITY.md) para la
hoja de ruta por capacidad. El orden de prioridad es: **primero, evidencias de temporización y holdover para
infraestructuras críticas** (máscaras de telecomunicaciones, holdover más largo con envejecimiento y ruido
de parpadeo, ingesta de datos de reloj medidos); **en segundo lugar, el método neutral de compromisos cuántico frente a clásico**
(resultados etiquetados como MODELLED hasta que los datos medidos de un socio los promuevan); y
**la navegación lunar / cislunar y de espacio profundo se mantiene**, sin ampliarse como prioridad. La **reducción de marcos con precisión ITRF** ya está entregada: la
cadena completa GCRS↔ITRS IAU 2006/2000A basada en el CIO (movimiento del polo + nutación por debajo del segundo de arco),
validada bit a bit frente a SOFA/ERFA y comprobada de forma cruzada e independiente frente a ANISE
(SPICE en Rust puro) hasta ≤ 3.6 m en la órbita GNSS. Los elementos a corto plazo incluyen la fusión fuertemente acoplada con fase de portadora y la extensión
del navegador GNSS/INS débil/fuertemente acoplado a más paquetes; el motor de **navegación radiométrica
de espacio profundo / Marte** llegó en v0.17.0 (validado por simulación). La
**capa de física cuántica** es un elemento **P2**: el acelerómetro CAI se simula ahora desde
primeros principios (fase de Mach–Zehnder, ruido de proyección, decaimiento del contraste, acoplamiento
de vibraciones), mientras que los sensores de reloj/transferencia de tiempo siguen basándose en coeficientes
publicados de Allan/presupuesto de ruido. TEME&harr;ECEF basado en GMST, los sistemas de tiempo con
segundos intercalares del IERS (UTC/TAI/TT/UT1), la propagación orbital SGP4/SDP4 (v0.7.0,
validada frente a los vectores de AIAA 2006-6753) y el paquete de fusión ejecutable `gnss-ins`
ya se han **distribuido**, y la velocidad inercial se expone aguas abajo. Un detector estocástico
activo de spoofing de tiempo (prueba de energía de Neyman–Pearson / χ²₁ con P_fa/P_md por Monte Carlo
y una FoM de seguridad de 1−P_md), un modelo de jamming por presupuesto de enlace (J/S → C/N₀
efectiva → pérdida de enganche), disponibilidad multiconstelación, un presupuesto de error de IMU
de un solo eje (1-DOF), dos estimadores de Kalman independientes (reloj + posición) informados como una
FoM combinada, geometría real de constelaciones a partir de TLE, un informe HTML de tarjeta de puntuación,
disponibilidad GNSS derivada de la geometría
*y* dilución de la precisión a partir de órbitas keplerianas con excentricidad y deriva J2,
bandas de confianza de Monte Carlo, barridos de parámetros para estudios de compromisos, un entorno de pruebas
WebAssembly en el navegador y enlaces opcionales para Python (PyO3) y WebAssembly (wasm-bindgen) han
llegado a `main`.

</details>

<details>
<summary>Contribuir</summary>

### Contribuir

Véase [`CONTRIBUTING.md`](CONTRIBUTING.md). En resumen: las pruebas pasan (`cargo test`), los
dos scripts de salvaguarda pasan, Conventional Commits y una entrada `[Unreleased]` en `CHANGELOG.md`
para cada cambio visible para el usuario. La participación se rige por nuestro
[Código de conducta](CODE_OF_CONDUCT.md). Para notificar un problema de seguridad, véase la
[Política de seguridad](SECURITY.md); no abra una incidencia pública para vulnerabilidades.

</details>

<details>
<summary>Documentación: cada documento y a quién va dirigido</summary>

<a id="documentation"></a>
### Documentación

| Documento | Para quién | Qué contiene |
|----------|----------|--------------|
| [Introducción a los conceptos](docs/CONCEPTS.md) | todo el mundo, empiece aquí | qué hace Kshana y por qué, desde cero hasta la física |
| [Kshana Studio](web/README.md) | todo el mundo | ejecutar el motor en su navegador (WebAssembly); notas de compilación y despliegue |
| [Glosario](docs/GLOSSARY.md) | todo el mundo | definiciones en lenguaje sencillo de cada término |
| [Tipos de escenario](docs/KINDS.md) | todo el mundo | cada tipo que despacha el motor: qué hace, sus campos, un comando de ejemplo, sus filas del registro y el gráfico que el motor escribe para él |
| [Datos de socios](docs/PARTNER-DATA.md) | laboratorios y fabricantes con datos medidos | qué filas MODELLED podría promover un registro medido de reloj o de IMU, los formatos, cómo se comprueba un envío (`kshana partner check`), cómo se puntúa y cómo se reconoce |
| [Arquitectura](docs/ARCHITECTURE.md) | desarrolladores / revisores | mapa de módulos, cadena del motor, despacho y diagramas |
| [Estado de la validación](docs/VALIDATION.md) | revisores / quienes citan | qué es `validated` frente a `not modeled`, con evidencias |
| [Matriz de verificación](docs/VERIFICATION-MATRIX.md) | revisores / quienes citan | el registro de evidencias comprobado automáticamente: cada fila de capacidad con su estado, módulo, prueba y referencia externa, generado a partir de `src/verification.rs` |
| [Justificación de lo modelado](docs/MODELLED-RATIONALE.md) | revisores | por qué cada fila **Modelled** no tiene referencia externa, fila a fila |
| [Procedencia](docs/PROVENANCE.md) | revisores / quienes citan | cada parámetro de sensor, modelo y conjunto de datos rastreado hasta su fuente publicada, en una tabla citable |
| [Reproducibilidad y procedencia](docs/REPRODUCIBILITY.md) | revisores / empaquetadores | garantías de determinismo, fijación de referencias, SBOM (lista de materiales de software), procedencia de compilación |
| [Etiquetas de plataforma de las wheels](docs/WHEEL_TAGS.md) | empaquetadores | la matriz de wheels de Python abi3: qué etiqueta de plataforma resuelve `pip install kshana` |
| [Posicionamiento](docs/POSITIONING.md) | evaluadores | dónde se sitúa Kshana frente a RTKLIB/gLAB (complementario), y el nivel en el navegador sin instalación |
| [Kshana Pro](docs/PRO.md) | evaluadores / gestores de programas | qué añade la capa propietaria Pro sobre el mismo motor: optimizador de diseño, incertidumbre y sensibilidad, dosier de misión, vigilancia de campañas, coexistencia espectral, servicio de trabajos local, trazabilidad de requisitos; qué produce cada uno y qué no hace |
| [Informe técnico](paper/kshana-technical-report.md) · [Artículo para JOSS](paper/paper.md) | revisores / quienes citan / evaluadores | el artículo de investigación ampliado completo (arquitectura, modelos por dominio, validación, casos de estudio y limitaciones) más el envío conciso a JOSS (Journal of Open Source Software) |
| [Validación de SGP4](docs/SGP4-VALIDATION.md) | revisores / quienes citan | concordancia con la referencia de AIAA 2006-6753 (666 estados, ~4 mm) **y** una comparación directa con el crate independiente `sgp4` (concuerdan por debajo de la micra / 4.12 mm) |
| [Validación del modelo de fuerzas](docs/AGENCY-ORBIT-VALIDATION.md) | revisores / quienes citan | el motor de fuerzas completo (`src/precise_od.rs`) ajustado a efemérides de agencias: metodología y residuos validados |
| [Guía de TLE reales](docs/REAL_TLE_GUIDE.md) | usuarios | alimentar escenarios con TLE reales de constelaciones de Celestrak / Space-Track (frente al conjunto Walker sintético incluido) |
| [FoM de integridad](docs/INTEGRITY.md) | evaluadores | qué significan las cifras `integrity` / `security`, y lo que **no** son frente al HPL/VPL de aviación |
| [Referencia de ARAIM](docs/ARAIM_REFERENCE.md) | revisores / integradores | la implementación abierta del nivel de protección ARAIM MHSS: la proyección del sesgo nominal `b_k`, σ_URA frente a σ_URE, y las probabilidades a priori de los modos de fallo |
| [Modelos cuánticos](docs/QUANTUM.md) · [detalles](docs/QUANTUM-MODELS.md) | revisores | la capa de física del interferómetro de átomos fríos, y dónde se siguen consultando coeficientes |
| [Cumplimiento](docs/COMPLIANCE.md) | evaluadores | alcance de los algoritmos DO-229E / DO-316, y lo que **no** es una afirmación de conformidad |
| [Confianza marítima](docs/MARITIME-TRUST.md) | navegantes / integradores | la puntuación de confianza GNSS de 0 a 100 para el NMEA de un buque, sus monitores y sus límites (consultivo, no un equipo de navegación homologado) |
| [Flujos NMEA de formación](docs/NMEA-TRAINING.md) | formadores marítimos | NMEA sintético de puente con jamming y spoofing programados y un registro del instructor; solo texto, nunca para la navegación en vivo |
| [Mapa de interferencias](docs/INTERFERENCE-MAP.md) | analistas / navegantes | dónde notificaron aeronaves y buques datos de navegación degradados, y qué parte de una ruta afecta |
| [Paquetes de evidencias](docs/EVIDENCE-PACKS.md) | operadores / aseguradoras | registros técnicos firmados de un evento de confianza y cómo verificar uno |
| [Telemetría de confianza](docs/TRUST-TELEMETRY.md) | equipos de operaciones / de seguridad | el flujo de confianza como métricas de Prometheus, eventos SIEM y OpenTelemetry, con un panel de Grafana |
| [Integraciones marinas](docs/MARINE-INTEGRATIONS.md) | propietarios de embarcaciones / integradores | el plugin de Signal K, el modo de compuerta de OpenCPN y la compilación de referencia |
| [Banco de pruebas](docs/TEST-BENCH.md) | fabricantes de receptores | reproducir un escenario exportado a través de un simulador de laboratorio y puntuar el registro del receptor |
| [Correspondencia normativa](docs/compliance/README.md) | evaluadores | marcos públicos de resiliencia asignados a las salidas de Kshana, con fuentes y brechas; `kshana compliance-report` |
| [Cuadernos](notebooks/README.md) | usuarios | tutoriales ejecutables con su texto renderizado |
| [Normas e interoperabilidad](docs/STANDARDS.md) | integradores | los formatos de intercambio GNSS / de dinámica de vuelo / de agencias que Kshana lee y escribe (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [Fusión PNT LEO](docs/LEO-PNT-FUSION.md) | usuarios / evaluadores | posicionamiento, navegación y temporización fusionados MEO + LEO: Doppler, pseudodistancia conjunta, convergencia de PPP, NTN 5G, cobertura polar y transferencia de tiempo LEO sobre cualquier constelación; los preajustes opcionales y sus fuentes públicas |
| [Campañas](docs/CAMPAIGNS.md) | usuarios / evaluadores | combinar escenarios: cronologías de misión encadenadas, barridos de parámetros, conjuntos de Monte Carlo y ejecuciones con condiciones comunes, con las identidades de composición que fijan las pruebas |
| [Catálogo de escenarios](docs/SCENARIOS.md) | usuarios / integradores | cada tipo despachable con sus campos TOML obligatorios y opcionales, generado a partir de `api::list_scenario_kinds()` |
| [Esquema del resultado](docs/SCHEMA.md) | integradores | cada campo del JSON del resultado, con unidades y un puntero a la fuente |
| [API de Python](docs/PYTHON_API.md) | usuarios de Python | la superficie del enlace PyO3: llamar al motor, los tipos de escenario/resultado y ejemplos |
| [Afirmaciones frente a realidad](docs/CLAIMS-VS-REALITY.md) | revisores | el registro de cierre de afirmaciones excesivas + la salvaguarda de CI (`tests/no_overclaims.rs`) que lo mantiene resuelto |
| [Hoja de ruta](ROADMAP.md) | todo el mundo | la hoja de ruta por fases: qué se ha distribuido y qué viene después |
| [Servidor MCP](mcp/kshana-mcp/README.md) · [Plugin de JetBrains](ide/jetbrains/README.md) | agentes / usuarios de IDE | ejecutar Kshana desde un asistente de IA o un IDE de JetBrains |
| [Guía para agentes](docs/AGENTS.md) · [Superficies](docs/SURFACES.md) | agentes / integradores | qué herramienta responde a qué pregunta, qué conservar con cada respuesta; dónde es accesible cada capacidad (CLI, Rust, Python, WASM, MCP, plugin, JetBrains, cuadernos) y por qué una celda es N/A |
| [Registro de cambios](CHANGELOG.md) | todo el mundo | historial de versiones publicadas (Keep a Changelog + SemVer, Semantic Versioning) |
| [Contribuir](CONTRIBUTING.md) | colaboradores | compilación, salvaguardas, disciplina de pruebas/citas, DCO (Developer Certificate of Origin) |
| [Gobernanza](GOVERNANCE.md) | colaboradores / comunidad | cómo se gobierna Kshana: quién decide, cómo, y la frontera entre lo abierto y lo cerrado |
| [Código de conducta](CODE_OF_CONDUCT.md) | comunidad | conducta esperada (Contributor Covenant) |
| [Política de seguridad](SECURITY.md) | quienes notifican | cómo notificar una vulnerabilidad; nota sobre el doble uso |

</details>

<details>
<summary>Referencias clave</summary>

### Referencias clave

**Referencias independientes de validación y normas**: las autoridades externas en las que se anclan las comprobaciones de Kshana:

- Vallado, Crawford, Hujsak y Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [datos de prueba](https://celestrak.org/publications/AIAA/2006-6753/)): el conjunto de verificación SGP4/SDP4 con el que Kshana coincide hasta 4.12 mm, y los ejemplos resueltos de marcos frente a los que se comprueba la cadena TEME→ITRF.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa): las rutinas de referencia de tiempo y marcos frente a las que se validan bit a bit la nutación IAU 2000A y la reducción GCRS↔ITRS basada en el CIO.
- Petit y Luzum (eds.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (normas de orientación de la Tierra, movimiento del polo y marcos).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (relaciones de la desviación de Allan y la serie de referencia NBS14; NBS = el antiguo National Bureau of Standards de EE. UU.).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): las implementaciones de referencia de ROC/AUC, matriz de confusión y precisión/exhaustividad/F1 con las que coincide exactamente el banco de pruebas de evaluación de deterioros de RF (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` y `linalg.expm`, las rutinas de referencia frente a las que se validan el ajuste NNLS de la ADEV medida de quantum-trade, las bandas de coherencia χ² y la covarianza del ruido de proceso del reloj de van Loan (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati y Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): usado tanto como técnica anterior abierta (véase *Comparación y técnica anterior abierta* más abajo) como **referencia independiente de DOP** con la que el cálculo de GDOP/PDOP/HDOP/VDOP/TDOP coincide hasta 1e-6 (`tests/dop_reference.rs`).
- Montenbruck y Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): los modelos de fuerzas en los que se basa el ajuste del modelo de fuerzas a efemérides precisas de agencias.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell y Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (las familias halo/NRHO que reproduce el corrector diferencial del CR3BP).

**Física de los dispositivos y de los métodos**: las fuentes citadas en las que se basan los modelos de sensores:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (reloj óptico de red de estroncio, objetivo orientado al espacio).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (reloj de Sr de laboratorio, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (tríada de acelerómetros cuánticos híbridos).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [tutorial de la IEEE AESS (Aerospace and Electronic Systems Society) (repositorio Discovery del University College London)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (crecimiento del error de la navegación a estima).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (transferencia óptica bidireccional de tiempo y frecuencia; el enlace óptico entre satélites modela su presupuesto de no reciprocidad según estos trabajos).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (la modulación BOC y la teoría de separación espectral en las que se basa `src/navsignal.rs`).
- Kaplan y Hegarty (eds.) — *Understanding GPS/GNSS: Principles and Applications* (3.ª ed., Artech House, 2017): la ecuación antiinterferencia de la C/N₀ efectiva y la fluctuación por ruido térmico del seguimiento de código DLL early–late que usan los modelos de señal de navegación y de jamming.

**Comparación y técnica anterior abierta**: las herramientas y revisiones frente a las que se posiciona Kshana:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (la Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): los parámetros de la batería de pruebas de spoofing frente a los que se caracteriza el detector multicapa.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): los perfiles de error de navegación inercial abiertos y validados que se usan como línea base clásica.
- Iiyama, Casadesús Vila y Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): simulador abierto de PNT lunar.
- Knowles, Kanhere, Neamati y Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): análisis abierto de datos GNSS.
- Li, Zaminpardaz, Kealy y Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): OD de dinámica reducida de GRAIL, el mínimo de aceleración empírica que reproduce el ajuste de LRO.

</details>
