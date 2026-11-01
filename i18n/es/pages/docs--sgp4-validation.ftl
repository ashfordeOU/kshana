# docs--sgp4-validation: translations (es)

# text
seg-3c513ef2fd3b = Magnitud

# text
# c1: docs/SGP4-VALIDATION.md
seg-09da3685124b = Fuente: <c1/>

# text
seg-dd68e234a5cd = Validación de SGP4/SDP4 frente a la referencia de la comunidad

# text
# c1: SGP4-VER.TLE
# c2: tcppver.out
seg-d7567fa218fe = El propagador de órbitas de Kshana se ha validado frente a la <b>referencia canónica de la comunidad</b> para SGP4/SDP4 (SGP4: Perturbaciones Generales Simplificadas { "4" }; SDP4: Perturbaciones Simplificadas de Espacio Profundo { "4" }): los vectores de verificación publicados con Vallado et al., <em>"Revisiting Spacetrack Report #3"</em> (AIAA (Instituto Americano de Aeronáutica y Astronáutica) 2006-6753), distribuidos como <c1/> (los TLE de prueba (conjuntos de elementos de dos líneas)) y <c2/> (el estado TEME (ecuador verdadero, equinoccio medio) esperado en cada instante). Es la misma referencia con la que se validan las implementaciones públicas en C++/Python/MATLAB, de modo que la concordancia aquí es concordancia con el estándar de facto.

# text
seg-b99fb640886c = Estados de referencia comparados

# text
# c1: tcppver.out
seg-b16a220a41b7 = (todas las filas de <c1/>, fijadas en la prueba)

# text
seg-e7d45e243571 = Peor error de posición

# text
# c1: 2e-5
seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satélite { "23333" }; < <c1/> km de tolerancia)

# text
seg-01da72026e56 = Peor error de velocidad

# text
# c1: 1e-6
seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satélite { "23333" }; < <c1/> km/s de tolerancia)

# text
seg-041cbc679ed7 = Casos cubiertos

# text
seg-283f3c571a7c = SGP4 de órbita cercana a la Tierra, SDP4 de espacio profundo (lunisolar + resonancia de { "12" } h/24 h) y los casos deliberados de código de error

# text
seg-75c2bd004348 = Los casos de espacio profundo y de resonancia importan especialmente para este proyecto: los satélites GNSS (sistema global de navegación por satélite) están en órbitas de ~{ "12" } h que son de espacio profundo y resonantes, algo que un modelo de dos cuerpos + J2 secular no puede reproducir; SGP4/SDP4 sí.

# text
seg-613697670501 = Método

# text
# c1: src/sgp4.rs
# c2: improved
# c3: afspc
seg-d753e2f76b4a = La implementación (<c1/>) es un port en Rust, sin dependencias, del algoritmo de Vallado de dominio público; el tratamiento de épocas es en días desde 1950, se usa el modo <c2/> (no <c3/>) y se aplican las constantes de gravedad WGS-72 (WGS: Sistema Geodésico Mundial) tal como establece la referencia.

# text
# c1: tests/sgp4_verification.rs
# c2: SGP4-VER.TLE
# c3: tcppver.out
# c4: tests/fixtures/sgp4/
# c5: 666
seg-ebc18c4cb8ad = La prueba (<c1/>) analiza los archivos <c2/> y <c3/> incorporados (<c4/>), propaga cada satélite de prueba a cada instante de referencia y comprueba que la posición y la velocidad TEME coinciden dentro de las tolerancias indicadas. El recuento de filas comparadas está fijado en exactamente <c5/>, de modo que una regresión en los datos de prueba o en el comportamiento de omisión no pueda reducir la cobertura sin que se note.

# attr:aria-label, text
seg-d0566d4db829 = Reproducirlo

# text
seg-ba3ed7f0aba7 = La prueba imprime el número de filas comparadas y los errores de posición y de velocidad en el peor caso. Los datos de prueba están confirmados en el repositorio, por lo que la comprobación es totalmente fuera de línea y determinista.

# text
# c1: sgp4
seg-4f539e17926e = Comprobación cruzada independiente con el crate <c1/>

# text
# c1: tests/sgp4_crate_comparison.rs
# c2: sgp4
# c3: from_elements
seg-0c2d2752179f = Coincidir con la referencia publicada demuestra la corrección frente a una <em>tabla</em>. Para demostrarla también frente a una <em>implementación independiente</em>, <c1/> ejecuta una biblioteca SGP4 independiente en Rust de uso muy extendido, el crate <a1><c2/></a1> (neuromorphicsystems/sgp4, versión { "2.4" }), sobre los mismos { "666" } vectores de la AIAA y compara las dos bases de código cara a cara. Ambas se ejecutan con el modelo de gravedad <b>WGS72</b> (Sistema Geodésico Mundial { "1972" }) en el que se definen los vectores (el <c3/> predeterminado del crate usa WGS84 (Sistema Geodésico Mundial { "1984" }), que difiere de la referencia WGS72 en ~km: una decisión de modelado, expuesta con honestidad, no un error).

# text
seg-da0e4e6c9e96 = Régimen

# text
seg-a6eefd68c27c = kshana ↔ referencia

# text
seg-e725899898a3 = crate ↔ referencia

# text
seg-427820fec0e7 = kshana ↔ crate

# text
seg-6305527acfa4 = cercano a la Tierra (LEO/MEO (LEO: órbita terrestre baja; MEO: órbita terrestre media))

# text
seg-081e28a39101 = { "7.3e-9" } km

# text
seg-e68c97a6528a = { "4.4e-10" } km

# text
seg-4c34e8e2f4c4 = espacio profundo (no resonante)

# text
seg-12e758e04df0 = { "4.1e-6" } km

# text
seg-db82b835dec9 = { "2.1e-7" } km

# text
seg-d7d4f47417bc = resonancia de espacio profundo (½ día)

# text
seg-17007f8aada3 = { "8.1e-9" } km

# text
seg-895ba7518ab3 = { "7.7e-9" } km

# text
seg-be5a634658e5 = { "2.2e-9" } km

# text
seg-6cf60f32cbcd = resonancia de espacio profundo (1 día)

# text
seg-7698aecab6b4 = { "8.2e-9" } km

# text
seg-60520079d492 = { "7.8e-9" } km

# text
# c1: tests/fixtures/sgp4_comparison.md
# c2: KSHANA_REGEN_FIXTURES=1 cargo test --test sgp4_crate_comparison
seg-c22876d62c29 = Dos implementaciones independientes coinciden a nivel <b>submicrométrico</b> en órbitas cercanas a la Tierra y resonantes y a <b>{ "4.12" } mm en el peor caso</b> en todos los regímenes: los mismos { "4.12" } mm que son la propia desviación de Kshana respecto de la referencia, es decir, la discrepancia <em>es</em> ese único caso de espacio profundo, con el crate situado entre Kshana y la tabla. La tabla completa (con los recuentos de filas por régimen y los cuatro casos patológicos que el crate rechaza en la construcción) está confirmada en <a1><c1/></a1> y se regenera mediante <c2/>.

# text
seg-3aae516df868 = Estado de la «publicación» de este resultado

# text
seg-2dd4b77c49d1 = La validación cruzada en sí está completa y en el repositorio. Presentar el resultado en foros externos (un catálogo de la comunidad, una nota breve, un registro archivado con DOI (identificador digital de objeto)) es una acción de los responsables del mantenimiento que se sigue por separado en la hoja de ruta; este documento es el registro dentro del repositorio al que apuntarían esas presentaciones.

# text
seg-b36bbcc0a0c8 = <s1>Anterior</s1>EN { "16803" }

# text
seg-4d5234d85d9f = <s1>Siguiente</s1>Validación del modelo de fuerzas

# text
seg-6539dbb48bca = Comprobación cruzada independiente con el crate sgp4
