# docs--licensing: translations (es)

# text
# c1: LICENSING.md
seg-a1bee28d1dfd = Fuente: <c1/>

# text
seg-b8dd205e82c4 = Kshana tiene <b>licencia dual</b>. Puede usar el motor abierto bajo <b>una</b> licencia abierta (AGPL-3.0) <b>o bien</b> bajo una <b>licencia comercial</b> de Ashforde OÜ. Elija la que se ajuste al uso que pretende darle.

# text
# c1: LICENSE
seg-5faea0aba960 = Este documento explica el modelo en lenguaje llano. Es una guía, no asesoramiento jurídico, y no modifica las licencias en sí. Los términos vinculantes están en <a1><c1/></a1> (la GNU AGPL-3.0) y en cualquier acuerdo comercial que firme con Ashforde OÜ. Si ambos entran en conflicto alguna vez, prevalecen esos documentos.

# text
seg-89bd60937f0b = Opción A — código abierto: GNU AGPL-3.0-only

# text
# c1: LICENSE
seg-785200a5419a = La opción predeterminada. El texto completo está en <a1><c1/></a1>. En resumen, la AGPL le permite usar, estudiar, modificar y redistribuir Kshana de forma gratuita, <b>siempre que</b>:

# text
seg-5bc05999ee9d = si <b>distribuye</b> Kshana o una obra derivada, ponga a disposición el <b>código fuente completo correspondiente</b> bajo la AGPL; y

# text
seg-5c9136766fdf = si permite que los usuarios interactúen con una versión <b>modificada</b> de Kshana <b>a través de una red</b> (la cláusula distintiva de la AGPL, §{ "13" }), debe ofrecer a <b>esos usuarios</b> el código fuente correspondiente de su versión modificada bajo la AGPL.

# text
seg-234be920d38f = La AGPL es una <a1>licencia de código abierto aprobada por la OSI</a1> y de copyleft fuerte. Es la opción adecuada para el trabajo académico, los proyectos de código abierto, la evaluación y la investigación internas, y para quien acepte de buen grado mantener abierta su propia obra derivada.

# text
seg-16c9cc91e4eb = Opción B — licencia comercial (de Ashforde OÜ)

# text
seg-197bfc5a5166 = Si la AGPL no le conviene, Ashforde OÜ licenciará el mismo motor con condiciones comerciales. Es la opción adecuada cuando quiera:

# text
seg-6de2b04016e5 = <b>incorporar Kshana a un producto propietario o de código cerrado</b> sin publicar su propio código fuente;

# text
seg-e31db28c1e09 = <b>ofrecer un servicio en red</b> basado en una versión modificada de Kshana <b>sin</b> la obligación de divulgar el código fuente del §{ "13" };

# text
seg-9d3578395a59 = integrar Kshana en un sistema mayor cuyos demás componentes no pueden ser AGPL (por ejemplo, la cadena de herramientas propietaria de un contratista principal); o bien

# text
seg-99d049c650a3 = obtener una garantía, una indemnización o condiciones de soporte que la AGPL excluye expresamente.

# text
seg-f68b536b93c0 = Una licencia comercial elimina las obligaciones de copyleft para su uso, en las condiciones acordadas. <b>Contacto: <a1>contact@ashforde.org</a1>.</b>

# text
seg-55f1a2f687d9 = Por qué se aplica esta licencia dual

# text
seg-42c1ce05ca5c = El objetivo es ser <b>verificable públicamente</b> (de modo que cualquier revisor pueda ejecutar y auditar el motor) <b>sin</b> permitir que un competidor con muchos recursos bifurque el motor validado, lo cierre y lance un competidor propietario que no devuelve nada. El copyleft de red de la AGPL lo consigue: un derivado cerrado o alojado debe volver al código abierto o bien obtener una licencia comercial nuestra. Credibilidad pública y un núcleo defendido, a la vez.

# text
seg-32b1d38914fe = Qué <b>no</b> queda cubierto por esta licencia dual

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
# c3: integrations/
seg-27636d757dba = <b>El complemento nativo de OpenCPN</b> (<c1/>) se licencia bajo <b>GPL-3.0-or-later</b> (véase el archivo <c2/> de ese directorio), no bajo AGPL-3.0, y <b>no</b> se ofrece con la licencia comercial. Se carga en OpenCPN y se compila contra la cabecera de su API de complementos GPL-2.0-or-later, que es la base habitual de los complementos de OpenCPN. El resto de <c3/> (el complemento de Signal K y el relé TCP de OpenCPN) sigue siendo solo AGPL-3.0.

# text
seg-f90c983e0ee3 = <b>Kshana Pro</b> y otras capas propietarias son productos <b>distintos y de código cerrado</b> con sus propias condiciones comerciales. No forman parte de este repositorio y no se ofrecen bajo la AGPL.

# text
# c1: deny.toml
seg-e340445b7f17 = Las <b>dependencias</b> conservan sus propias licencias (permisivas). Mantenemos deliberadamente permisivo el árbol de dependencias (Apache-2.0 / MIT / BSD / ISC / …) precisamente para poder ofrecer la edición comercial sin problemas: una dependencia con copyleft la contaminaría. Véase <a1><c1/></a1>.

# text
# c1: C7_E1B.txt
# c2: C8_E1C.txt
# c3: scripts/fetch_galileo_e1_codes.sh
# c4: KSHANA_GALILEO_E1B
# c5: KSHANA_GALILEO_E1C
# c6: src/iq/signals/galileo.rs
# c7: data/galileo-os-sis-icd/PROVENANCE.md
seg-810191f19d4d = <b>Códigos de memoria primarios de Galileo E1</b> (<c1/>, <c2/>; <b>no incluidos desde { "0.36" }</b>: cada usuario aporta su propia copia, <c3/> o <c4/> / <c5/>, leída por <c6/>). Son los códigos primarios E1-B y E1-C de los Anexos C.7 y C.8 del Documento de Control de Interfaz de la señal en el espacio del Servicio Abierto de Galileo (OS SIS ICD), edición { "2.0" }, enero de { "2021" }, © Unión Europea { "2021" }, extraídos sin modificar de los adjuntos del PDF (la URL de origen, el SHA-256 y una comprobación cruzada con la edición { "1.3" } están en <a1><c7/></a1>). <b>No</b> están cubiertos por la AGPL-3.0 ni por la licencia comercial, y ninguna de las dos licencias concede nada sobre ellos. Lo que dice el propio ICD, citado de la edición { "2.0" }:

# text
seg-daef032cbe43 = Condiciones de uso §{ "3" }: "La información contenida en el OS SIS ICD, incluidos sus anexos, está sujeta a derechos de propiedad intelectual". "El OS SIS ICD solo puede reproducirse y/o transmitirse a un tercero, en parte o en su totalidad, de acuerdo con el uso permitido aquí descrito y en las siguientes condiciones: que las presentes “Condiciones de uso y exenciones de responsabilidad”, así como los términos del Anexo G, se acepten, se reproduzcan y se transmitan íntegramente y sin modificar junto con la información reproducida y/o transmitida; que el aviso de derechos de autor “© Unión Europea { "2021" }” no se elimine de ninguna página." Y: "El uso de la información contenida en el OS SIS ICD, incluidos los códigos de ensanchamiento sujetos a derechos de propiedad intelectual, está autorizado en los términos y condiciones establecidos en el Anexo G."

# text
seg-0fb25fafd9a2 = El Anexo G (edición { "2.0" }; Anexo H en la edición { "2.1" }, con idéntica redacción) define los "Datos técnicos del OS SIS ICD" de modo que incluyan los "códigos de memoria de E1 y E5", y concede un compromiso de no hacer valer derechos que es "no exclusivo y libre de regalías" y "intransferible y no sublicenciable". Su lista del §G.3, que califica de exhaustiva, abarca: "a) el uso de los Datos técnicos del OS SIS ICD, incluida su integración e incorporación en cualesquiera Productos"; "b) el almacenamiento de los Datos técnicos del OS SIS ICD, siempre que se reconozca la fuente"; "c) la reproducción del OS SIS ICD, total o parcialmente, su distribución y su publicación con fines y a escala no comerciales y sin ánimo de lucro, sin modificar el documento ni añadirle ningún elemento"; y "d) facilitar enlaces al sitio web de la UE donde se publica el documento". Por "Productos" se entiende el software, los dispositivos y los servicios de valor añadido "que hagan uso de la señal OS". También dice: "La Persona Autorizada no declarará ni dará a entender en ningún material promocional ni en ningún otro lugar que los Productos han sido desarrollados por la UE, son utilizados por la UE o para ella, o han sido aprobados o refrendados por la UE".

# text
seg-8531368368ba = <b>Decisión ({ "0.36" }): no se redistribuye.</b> No se indica ninguna licencia abierta explícita. El uso dentro de un producto de software (G.3 a) y el almacenamiento con reconocimiento de la fuente (G.3 b) quedan cubiertos por los términos del propio ICD, pero la redistribución (G.3 c) solo con fines no comerciales y sin ánimo de lucro y con las Condiciones y el Anexo G reproducidos sin modificar a su lado. Dado que Kshana se ofrece también con una licencia comercial, los archivos se retiraron del repositorio y de sus paquetes; el motor lee la copia del propio usuario en tiempo de ejecución y, sin ella, las señales Galileo E1 devuelven un error que indica cómo aportarlos. Cada usuario se ampara directamente en la autorización de la UE; Kshana no puede transmitirla. Kshana no ha sido desarrollado por la Unión Europea, ni es utilizado, aprobado o refrendado por ella.

# text
# c1: NOTICE
seg-e18986aeab7f = <b>Marcas.</b> "Kshana" y sus marcas son marcas comerciales de Ashforde OÜ. Ninguna de las dos licencias concede derechos sobre el nombre ni las marcas; las bifurcaciones y las distribuciones derivadas deben usar un nombre distinto. Véase <a1><c1/></a1>.

# text
seg-f6b7345c2c60 = Contribuciones

# text
# c1: CONTRIBUTING.md
seg-1709eb19c2c5 = Las contribuciones se aceptan según las condiciones de contribución entrante del proyecto, que licencian su contribución bajo la AGPL <b>y</b> conceden a Ashforde OÜ el derecho de incluirla en la edición con licencia comercial (para que la licencia dual siga funcionando). Véase <a1><c1/></a1>.

# text
seg-940c8cce5137 = Preguntas

# text
seg-e678f2ecc571 = Preguntas sobre licencias, presupuestos comerciales y «¿qué opción se aplica a nosotros?» → <b><a1>contact@ashforde.org</a1></b>.

# text
seg-05d34a27a0ba = <s1>Anterior</s1>Registro de cambios

# text
seg-4f7f660eea0a = <s1>Siguiente</s1>Seguridad

# text
seg-2d2b32369c30 = Qué no queda cubierto por esta licencia dual
