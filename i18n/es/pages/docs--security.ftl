# docs--security: translations (es)

# text
seg-4609cf7fb790 = Política de seguridad

# text
# c1: SECURITY.md
seg-ff991a587e4b = Fuente: <c1/>

# text
seg-7315b27c34f8 = Cómo informar de una vulnerabilidad

# text
seg-2f06a8b277b7 = Infórmenos de forma privada, por cualquiera de estas vías:

# text
seg-31999fe1b838 = <b>Informe privado de vulnerabilidades de GitHub</b>: el botón <em>Report a vulnerability</em> de la <a1>pestaña Security</a1> del repositorio. El informe solo lo ven los responsables del mantenimiento, y puede prepararse una corrección en una bifurcación privada y publicarse como GitHub Security Advisory.

# text
seg-7bdcc2ffe39e = <b>Correo electrónico</b>: <b><a1>contact@ashforde.org</a1></b>, con los detalles y los pasos para reproducirlo.

# text
seg-fbc3db22c061 = No abra una incidencia pública para informes sensibles desde el punto de vista de la seguridad. Nuestro objetivo es acusar recibo en pocos días laborables.

# text
seg-4c11dabdd8f6 = Versiones con soporte

# text
seg-19c99cf3a67e = Antes de la 1.0: solo se mantiene la última versión etiquetada.

# text
seg-1379eab9a8e3 = Seguridad de memoria

# text
# c1: #![forbid(unsafe_code)]
# c2: src/lib.rs
# c3: unsafe
# c4: cfg
# c5: --features python
# c6: --features wasm
seg-cf966fa35408 = El crate de la biblioteca declara <c1/> en su raíz (<c2/>), de modo que un bloque <c3/>, fn, impl o extern en cualquier punto de la biblioteca es un error de compilación y no algo que un revisor deba detectar. El atributo no depende de un <c4/>, por lo que se aplica a todas las configuraciones en las que se distribuye la biblioteca, y las tres compilan sin errores con él: la compilación predeterminada de Rust, el módulo de extensión de Python (<c5/>) y el módulo WebAssembly (<c6/>).

# text
# c1: forbid
seg-3f9e707e7d0b = Alcance, indicado con precisión, porque <c1/> actúa por crate:

# text
# c1: src/main.rs
# c2: src/bin/
# c3: kshana-mcp
# c4: xval/
# c5: unsafe
seg-e7e22e711c53 = Rige solo para el crate de la biblioteca. El binario de la CLI (<c1/>), los binarios auxiliares de <c2/>, el crate <c3/> publicado por separado y los crates de validación cruzada <c4/> excluidos del espacio de trabajo son raíces de crate distintas y no quedan cubiertos por él. Ninguno de ellos contiene hoy <c5/>, pero eso es disciplina, no una propiedad impuesta por el compilador.

# text
# c1: cargo deny check advisories licenses bans sources
seg-b8f1e374d873 = No dice nada sobre las dependencias. Estas se controlan por separado con <c1/> en la CI (para el crate raíz y, en un trabajo propio, para el crate del servidor MCP excluido del espacio de trabajo) y se vigilan mediante las alertas y las actualizaciones de seguridad de Dependabot en el repositorio.

# text
seg-df3008a05522 = Nota sobre control de exportaciones y doble uso

# text
seg-0782e60d11fa = La resiliencia de PNT y la detección cuántica pueden estar sujetas a controles de exportación de doble uso. Este repositorio público se limita a modelos y métodos genéricos y publicados. No aporte aquí detalles de resiliencia o de antispoofing sensibles para la exportación; corresponden a una capa privada. En caso de duda, escriba primero por correo electrónico.

# text
seg-f6bb0582f6f2 = <s1>Anterior</s1>Licencias

# text
seg-834cbd4e96d3 = <s1>Siguiente</s1>Contribuir
