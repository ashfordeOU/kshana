# docs--deceived-time: translations (es)

# text
# c1: docs/DECEIVED-TIME.md
seg-d46702617926 = Fuente: <c1/>

# text
seg-f44d01df7b1c = Un comando firmado aplicado en un tiempo engañado sigue encaminándose mal

# text
seg-6497012e401e = Una nota técnica para operadores de redes indexadas en el tiempo: constelaciones que encaminan, asignan tareas o traspasan según una planificación, donde cada nodo actúa cuando su propio reloj alcanza un instante programado.

# text
seg-714bce435435 = Abreviaturas: GNSS, sistema global de navegación por satélite; TPL, nivel de protección de temporización; PNT, posicionamiento, navegación y temporización.

# text
seg-a7208323de1c = La afirmación

# text
# c1: δ
# c2: T
# c3: T + δ
# c4: |δ|
seg-246715a1c559 = Autenticar los mensajes de control, también con firmas poscuánticas, demuestra quién envió un mensaje y que no fue alterado. No demuestra <b>cuándo actúa el receptor sobre él</b>. Un nodo ejecuta un comando indexado en el tiempo frente a su propio reloj. Si ese reloj ha sido desplazado en <c1/>, un comando válido para el instante <c2/> se ejecuta en el tiempo verdadero <c3/>, con todas las firmas intactas. Cuando <c4/> supera la guarda de la ranura, el tráfico cae en la ranura equivocada, un enlace conmuta mientras el otro extremo sigue apuntando a otro lugar o un traspaso se produce antes de tiempo. La red encamina mal, y todas las comprobaciones de integridad de la ruta del comando informan de éxito.

# text
seg-8683f0749042 = Por qué el reloj es el blanco fácil

# text
seg-1af5aea2ef5b = <b>El tiempo GNSS es la referencia habitual, y se puede suplantar.</b> Un nodo que disciplina su reloj con el GNSS hereda cualquier hora que sirva el receptor. Un suplantador que mantenga en verde los propios indicadores de calidad del receptor puede desplazar esa hora poco a poco.

# text
# c1: T + w
seg-354a4c706264 = <b>Las comprobaciones de frescura usan el mismo reloj.</b> Una ventana de validez («acepte este comando hasta <c1/>») o un contador anti-repetición vinculado al tiempo se juzga frente al reloj local, de modo que un reloj desplazado también puede ensanchar la ventana en la que se acepta un comando firmado capturado.

# text
seg-a4b8a5db0975 = <b>El ataque no necesita ninguna clave.</b> No se toca nada del canal firmado. Una criptografía más fuerte eleva el coste de falsificar un comando y deja este coste sin cambios.

# text
seg-e514b03fbae3 = Esto se sitúa junto al trabajo poscuántico, no frente a él: los dos cierran agujeros distintos. Las firmas detienen un comando falsificado. La integridad del tiempo impide que un comando genuino se ejecute en el momento equivocado.

# text
seg-09f493386dbc = Qué lo acota

# text
# c1: slot-timing
# c2: SLOT-TIMING.md
seg-750bd90b0ee1 = Cuatro medidas, cada una cuantificada por el tipo de escenario <c1/> (<a1><c2/></a1>):

# text
seg-77cf39b434b5 = <b>Un monitor asistido por reloj.</b> Compare la hora GNSS con el propio reloj del nodo en marcha libre durante una ventana, y dé alarma cuando la diferencia sea demasiado grande para ser ruido del reloj. El TPL condicional acota el error que puede pasar inadvertido antes de la alarma.

# text
seg-e58f7fb94ac5 = <b>Comprobaciones independientes, programadas.</b> Una transferencia bidireccional de tiempo con una estación terrestre o una comparación por enlace cruzado con un vecino fuera del alcance del suplantador limita cuánto puede durar un desplazamiento lento. Su intervalo de revisita es un parámetro de seguridad, no solo de operación.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-69590f56817c = <b>Geometría.</b> Un suplantador terrestre solo alcanza un satélite de órbita terrestre baja mientras este está por encima del horizonte del suplantador, de modo que el desplazamiento queda limitado por la velocidad de rampa del suplantador multiplicada por esa ventana. En aritmética: una rampa de { "10" } ns/s mantenida durante { "600" } s son { "6" } µs. El ejemplo incluido (<c1/>: órbita de { "550" } km, rampa máxima de { "10" } ns/s) notifica una exposición al suplantador de { "732" } s y un desplazamiento limitado por la rampa de { "7 321" } ns.

# text
seg-e8e52ce05943 = <b>Una guarda dimensionada a partir de la cota, y una acción segura ante la alarma.</b> La guarda de la ranura debe cubrir el mayor error no detectado que permitan el monitor y las comprobaciones, no solo el ruido de marcha libre del reloj. Ante una alarma, un nodo debe mantener su última planificación buena en su reloj en marcha libre en lugar de seguir al GNSS.

# text
seg-c11b66f214ac = Lo que esta nota no afirma

# text
seg-8b0ed39ead25 = No afirma que se haya observado un satélite suplantado encaminando mal; no estima la exposición de ningún operador; y las cotas a las que remite son MODELLED, condicionadas a la detección y a los supuestos de amenaza indicados. Argumenta una composición: una firma válida y un tiempo de ejecución correcto son propiedades separadas, y una red indexada en el tiempo necesita ambas.

# text
seg-c1bf6467e3c9 = <s1>Anterior</s1>Temporización de telecomunicaciones

# text
seg-d4e9bfd42982 = <s1>Siguiente</s1>Prueba de holdover y hardware de temporización en el bucle
