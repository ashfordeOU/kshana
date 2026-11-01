# docs--contributing: translations (es)

# text
seg-c3c260b7063e = Pruebas

# text
# c1: CONTRIBUTING.md
seg-5dce5694e6ec = Fuente: <c1/>

# text
seg-3fa173b79e8f = Contribuir a Kshana

# text
seg-c3a47c614836 = Gracias por su interés. Kshana aspira a ser una referencia <b>neutral, reproducible y validada con honestidad</b> para el PNT híbrido cuántico/clásico. Las contribuciones se someten a ese listón: corrección, citas y reproducibilidad por encima de la amplitud.

# text
# c1: GOVERNANCE.md
seg-5a82a55f7fb2 = La forma en que se gobierna el proyecto (quién decide, el listón técnico y la frontera entre lo abierto y lo cerrado) está documentada en <a1><c1/></a1>.

# text
seg-cc8491af7a6f = Desarrollo

# text
seg-0163ccdfaa2b = Los enlaces opcionales a lenguajes están controlados por características y desactivados por defecto (de modo que la compilación anterior y la puerta de auditoría de dependencias nunca los tocan). Para trabajar con ellos:

# text
seg-edc8bbab6e92 = Antes de cada commit: el bucle rápido

# text
# c1: ci.yml
# c2: check
seg-6a7eda7d82b7 = Estos tardan segundos. Son un subconjunto del trabajo <c2/> de <c1/>, en el mismo orden, de modo que un fallo aquí es un fallo allí:

# text
# c1: (scenario, seed, version)
seg-d62c1fe22fc4 = <b>La reproducibilidad es un invariante estricto.</b> Un cambio que haga no determinista <c1/> es un fallo. La aleatoriedad debe pasar por el generador con semilla; las ejecuciones cuánticas y clásicas usan semillas independientes derivadas de forma determinista.

# text
seg-66ea0748c10f = <b>Higiene del repositorio.</b> Los commits y el contenido no deben llevar líneas finales ni pies de atribución de herramientas automáticas, ni nombrar a un asistente de IA como autor en ninguna parte del contenido, los nombres de archivo o el historial. La salvaguarda lo aplica.

# text
seg-fbf423f6fb31 = Antes de hacer push: la puerta completa

# text
# c1: scripts/gate.sh
# c2: cargo test --all
# c3: scripts/check-repeatability.sh
# c4: .gate-receipt.json
seg-a9176352d3b4 = <c1/> es la puerta canónica: ejecuta <c2/> sin abreviar y luego <c3/> para volver a ejecutar unas cuantas veces más el conjunto de la biblioteca, porque una condición de carrera por entrelazado de hilos es invisible en una sola ejecución. Solo si tiene éxito escribe <c4/> (sin seguimiento: estado de la máquina sobre una ejecución, no contenido).

# text
# c1: scripts/gate.sh
seg-29815bd89ce2 = Es lenta a propósito (62-79 minutos en el régimen estacionario sano, según la cabecera de <c1/>, que lleva la cifra vigente) y no hay tiempo límite, porque un tiempo límite lo bastante corto para ser útil mataría una ejecución sana. Una ejecución parcial que salió en verde no es una puerta: los dos defectos para los que existe este mecanismo la atravesaron así.

# text
# c1: gate.sh
seg-408da9a8b8bb = Quienes trabajan desde una bifurcación no necesitan el gancho del recibo: es una puerta local de mantenimiento, y <b>lo que realmente controla una pull request es la CI</b>. Ejecutar <c1/> antes de abrir una significa simplemente que la CI no le dirá nada que usted no supiera ya.

# text
seg-9394727b21c3 = Añadir o cambiar un modelo de sensor

# text
# c1: provenance
seg-d9c891ca6827 = <b>Cada parámetro numérico necesita procedencia.</b> Ponga la cita en la cadena <c1/> del modelo y en el archivo de escenario. Ninguna constante anónima.

# text
seg-d30cb836d4c4 = <b>Valide frente a la relación estándar,</b> no solo frente a la coherencia interna; por ejemplo, la desviación de Allan para los relojes, el crecimiento del error de navegación a estima de Groves para los inerciales, la conversión temporización→distancia para la transferencia de tiempo. Añada una prueba de que la salida simulada reproduce el valor publicado o de la relación dentro de una tolerancia indicada.

# text
# c1: src/verification.rs::verification_matrix()
# c2: Modelled
# c3: cargo run --bin gen_validation_artifacts
# c4: docs/VERIFICATION-MATRIX.md
# c5: docs/MODELLED-RATIONALE.md
# c6: web/data/verification-matrix.json
# c7: docs/VALIDATION.md
seg-b52dd0dd550e = <b>Sea honesto sobre la madurez.</b> El registro de estado es <c1/>: añada o modifique allí la fila, nombre su referencia independiente externa (o diga con claridad que no hay ninguna, lo que la convierte en <c2/>) y luego regenere los artefactos publicados con <c3/>. <c4/>, <c5/> y <c6/> se generan todos a partir de esa función y dicen «do not edit by hand» por una razón. Actualice también la narrativa de <c7/> cuando la prosa lo necesite, y etiquete como tales las cifras que son objetivos o resultados de demostradores en tierra.

# text
seg-34b9c8b6f70c = Guiado por pruebas: escriba primero la prueba que falla, con el valor esperado <b>derivado a mano</b> de la física o de la relación antes de implementar.

# text
seg-5322d5b2188c = Las pruebas deterministas afirman valores exactos (derivados a mano); las pruebas estadísticas afirman una tolerancia indicada y, idealmente, promedian sobre semillas para controlar la dispersión.

# text
seg-7f76a26c4d5f = Commits y versionado

# text
# c1: feat:
# c2: fix:
# c3: docs:
# c4: test:
# c5: chore:
seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

# text
seg-1a13616ca0ac = <b>Semantic Versioning.</b> Antes de la 1.0, el esquema de escenarios/resultados puede cambiar; señale los cambios incompatibles.

# text
# c1: vX.Y.Z
# c2: main
# c3: cargo publish
# c4: docs/RELEASING.md
seg-0e3036c27aa8 = <b>Las versiones se cortan con una etiqueta <c1/>, y la publicación es automática pero ordenada.</b> El flujo de trabajo Auto-tag empuja la etiqueta cuando la CI está en verde en <c2/> con un aumento de versión. El flujo de trabajo Release ejecuta la verificación completa sobre el commit etiquetado y solo si pasa publica en crates.io, el Python Package Index (PyPI), npm, ghcr.io, el registro del Model Context Protocol (MCP) y el JetBrains Marketplace; después comprueba que cada canal sirve la versión y reconstruye kshana.dev a partir de la etiqueta. Nadie ejecuta <c3/> a mano. Los pasos, y cómo reintentar una publicación fallida, están en <a1><c4/></a1>.

# text
seg-18ca89a2c573 = Mantenimiento del registro de cambios (obligatorio)

# text
# c1: CHANGELOG.md
seg-1f7e1d73c2ef = Todo cambio visible para el usuario actualiza <a1><c1/></a1>:

# text
# c1: [Unreleased]
# c2: Added
# c3: Changed
# c4: Fixed
# c5: Removed
# c6: Documented
# c7: Planned
seg-1448e96afbbc = Añada una entrada en la sección <b><c1/></b>, en el grupo correspondiente (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

# text
# c1: [Unreleased]
# c2: [x.y.z] - YYYY-MM-DD
# c3: [Unreleased]
# c4: version
# c5: Cargo.toml
# c6: engine_version
# c7: vx.y.z
seg-76ddc53c752e = Al publicar una versión, renombre <c1/> a la nueva <c2/>, inicie un <c3/> nuevo, aumente <c4/> en <c5/> (para que <c6/> en el JSON de resultados coincida), actualice los enlaces de comparación del final y etiquete <c7/>.

# text
seg-ed680e59377c = Mantenga las entradas concisas y orientadas al usuario; enlace incidencias/PR cuando sea útil.

# text
seg-fe83216ebeed = Una pull request que cambia el comportamiento sin una entrada en el registro de cambios está incompleta.

# text
seg-776cd2ef0b0c = Control de exportaciones

# text
seg-d0f1db9798a6 = La resiliencia PNT y la detección cuántica pueden afectar a los controles de exportación de doble uso. Mantenga el repositorio público en modelos y métodos genéricos y publicados. Todo lo que se parezca a una profundidad de resiliencia/antispoofing sensible a la exportación pertenece a la capa privada, no aquí. Si tiene dudas, pregunte antes de contribuirlo.

# text
seg-506a29aafc12 = Licencia

# text
# c1: LICENSING.md
seg-c0409a1226ca = Kshana tiene doble licencia (AGPL-3.0 <b>o</b> una licencia comercial de Ashforde OÜ; véase <a1><c1/></a1>). Para que eso siga funcionando, las contribuciones deben poder usarse bajo <b>ambas</b> licencias. Por ello, al contribuir, usted acepta que:

# text
seg-da7b02ac890c = su contribución se licencia de entrada bajo la <b>AGPL-3.0-only</b>; y

# text
seg-8d6ed0d3a17f = usted <b>concede además a Ashforde OÜ</b> una licencia perpetua, mundial, libre de regalías e irrevocable para usar, modificar y <b>relicenciar su contribución como parte de la edición con licencia comercial de Kshana</b> (es decir, para distribuirla también con términos comerciales no AGPL). Usted conserva los derechos de autor de su contribución.

# text
seg-3b1a0dd6b5aa = Esta concesión ligera de doble licencia, que no es una cesión de derechos de autor, es lo que permite que el proyecto siga siendo abierto <em>y</em> ofrezca una edición comercial. Si no puede conceder ({ "2" }) (por ejemplo, código propiedad del empleador), dígalo en su pull request antes de contribuir.

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
seg-6630d0ac4ad5 = <b>Excepción: <c1/>.</b> Ese directorio tiene licencia <b>GPL-3.0-or-later</b> (véase su <c2/>) y queda fuera de la licencia comercial. Las contribuciones a él se licencian de entrada <b>únicamente</b> bajo GPL-3.0-or-later; la concesión ({ "2" }) no se les aplica.

# text
# c1: git commit -s
# c2: Signed-off-by
seg-0a78a12b1188 = Firme cada commit para dar fe del <a1>Developer Certificate of Origin</a1>: <c1/> (añade una línea <c2/>).

# text
seg-9f86d8f58b17 = <s1>Anterior</s1>Seguridad

# text
seg-fc760238e9a5 = <s1>Siguiente</s1>Gobernanza
