# docs--kind-cislunar-observability: translations (es)

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-6d584e86deba = razón (adimensional)

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
# c1: docs/kinds/by-kind/cislunar-observability.md
seg-258f128cea60 = Fuente: <c1/>

# text
# c1: cislunar-observability
seg-f0c7758e472f = <c1/> (tipo de escenario)

# text
seg-7ccd0a3babb8 = Observabilidad MODELLED de una constelación cislunar plana (P6): sigue una constelación de cuatro naves con DRO plana corregida diferencialmente mediante distancias intersatélite e informa de cuánto del estado de cuatro componentes [x,y,ẋ,ẏ] de una nave hace observable el arco. Emite ({ "1" }) la tabla de rango frente a longitud de arco para un único enlace solo de distancia — instantáneamente de rango 1, creciendo hacia el estado completo de cuatro componentes a medida que el arco se extiende (tabla { "1" } de P6); ({ "2" }) el espectro de valores propios del gramiano de observabilidad y el número de condición a lo largo del arco; ({ "3" }) la comparación del rango instantáneo solo de distancia frente a distancia más velocidad de distancia (la palanca de diseño del Doppler) junto con la notificación del GDOP singular solo de distancia y definido con distancia más velocidad; y ({ "4" }) una validación cruzada independiente con SRIF cuya covarianza a posteriori pasa a ser finita y bien condicionada exactamente en el arco en el que el rango observable alcanza cuatro. Núcleo VALIDATED: el rango observable es un umbral de valores singulares que revela el rango, contrastado con el rango de valores propios del gramiano; el espectro de valores propios obedece a los invariantes espectrales (traza=Σλ, det=Πλ, Frobenius²=Σλ²); la STM variacional es la STM de CR3BP validada por diferencias finitas; las filas jacobianas de distancia y de velocidad de distancia son derivadas parciales analíticas validadas por diferencias finitas (contrastadas con el observable de velocidad de distancia 3-D del crate); las cuatro condiciones iniciales son DRO planas corregidas diferencialmente que cierran con un residuo de periodicidad ajustado y son retrógradas; la transición de rango se valida de forma cruzada con el filtro de información de raíz cuadrada del crate (covarianza a posteriori finita exactamente con rango completo, cond(P)=cond(OᵀO)); una instantánea deficiente en rango se marca como GDOP-indefinido (fim condition=inf), nunca como un valor finito falso — la misma guarda de geometría singular que aplica pvt::solve_spp. MODELLED: el diseño de la constelación (amplitudes y fases del perilunio de las DRO) y la progresión de rango concreta que produce. No es un producto de prestaciones de navegación certificado.

# text
# c1: scenarios/cislunar-observability.toml
seg-a59f2fa9efb9 = Una ejecución de <c1/> se resume así: cislunar-observability | { "4" } s/c ({ "3" } refs) | { "6.0" } h arc, { "24" } epochs | rank { "1" } → { "4" } of { "4" } over arc | Gramian λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | instantaneous rank range-only { "2" } → range+rate { "4" } ({ "3" } links) | GDOP range-only undefined range+rate { "6.353" } | DRO ICs (max periodicity residual { "4.7e-9" }) | SRIF posterior finite at rank-4 epoch { "8" } (Validated rank/STM/DRO-closure/SRIF, Modelled design)

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-fb1601eda130 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/cislunar-observability.toml
seg-f3b5cc590c78 = El ejemplo <c1/> establece, entre otros:

# text
seg-0cc8ab10786b = unidades de tiempo del marco rotatorio

# text
seg-84781b6fff48 = GDOP indefinido (deficiente en rango / singula

# text
seg-856eb311f24b = “undefined” (texto tal como lo indica el documento

# text
seg-fc5d34345fdd = Etiqueta del resultado (la del motor): observabilidad MODELLED de una constelación cislunar plana (P6). Núcleo VALIDATED: el RANGO observable es un umbral de valores singulares que revela el rango, contrastado con el rango de valores propios del gramiano; el espectro de valores propios del gramiano obedece a los invariantes espectrales (traza = suma de valores propios, det = producto de valores propios, Frobenius^{ "2" } = suma de valores propios^{ "2" }

# attr:alt
seg-f15bbf30b0dd = El gráfico que escribe el motor para scenarios/cislunar-observability.toml, tipo de escenario cislunar-observability

# text
seg-4564ad90378b = <b>MODELLED</b> El umbral de observabilidad de la longitud de arco cislunar en el CR3BP ESPACIAL de seis estados en lugar del plano de cuatro estados, en las familias DRO, halo L2 y halo casi rectilíneo L2, con ruido de medida que entra en el gramiano y DOS criterios que informan

# text
seg-9f857ff85800 = <b>MODELLED</b> El umbral de observabilidad de la longitud de arco cislunar en el CR3BP ESPACIAL de seis estados en lugar del plano de cuatro estados, en las familias DRO, halo L2 y halo casi rectilíneo L2. Referencia independiente (InternalConsistency): Un rango independiente por forma escalonada mediante eliminación gaussiana con pivoteo parcial confirma cada veredicto de rango de seis estados — un algoritmo distinto que no comparte código con la vía de valores propios/SVD sometida a prueba. La matriz de transición de estado { "6" }×{ "6" } de CR3BP que esto compone lleva su propia referencia independiente ReferenceImpl frente a la integración variacional de SciPy, y las condiciones iniciales de halo/NRHO proceden de un corrector que reproduce el L2 sur publicado

# text
# c1: label
seg-53c183035bde = Observabilidad MODELLED de una constelación cislunar plana (P6). Núcleo VALIDATED: el RANGO observable es un umbral de valores singulares que revela el rango, contrastado con el rango de valores propios del gramiano; el espectro de valores propios del gramiano obedece a los invariantes espectrales (traza = suma de valores propios, det = producto de valores propios, Frobenius^{ "2" } = suma de valores propios^{ "2" }); la STM variacional es la STM de CR3BP validada por diferencias finitas (crate::cr3bp); las filas jacobianas de distancia / velocidad de distancia (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f6a217f57bec = Observabilidad MODELLED de una constelación cislunar plana (P6): sigue una constelación de cuatro naves con DRO plana corregida diferencialmente mediante distancias intersatélite e informa de cuánto del estado de cuatro componentes [x,y,ẋ,ẏ] de una nave hace observable el arco. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-e5182743fd40 = MODELLED: el diseño de la constelación (amplitudes y fases del perilunio de las DRO) y la progresión de rango concreta que produce. (catálogo de tipos de escenario (<c1/>))

# text
seg-5d3a370f1295 = Honestidad: MODELLED. Núcleo VALIDATED -- el RANGO observable es un umbral de valores singulares que revela el rango, contrastado con el rango de valores propios del gramiano; el espectro de valores propios obedece a los invariantes espectrales (traza = suma de valores propios, det = producto de valores propios, Frobenius^{ "2" } = suma de valores propios^{ "2" }); la STM variacional es la STM de CR3BP validada por diferencias finitas; las filas jacobianas de distancia / velocidad de distancia son derivadas parciales analíticas validadas por diferencias finitas (contrastadas (comentario del archivo de escenario, líneas { "16" } a { "25" })

# text
seg-c68bc1df8975 = La observabilidad de la longitud de arco cislunar espacial, con ruido y de varias familias es MODELLED, no está validada: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-ba3c2a8f0e28 = <s1>Anterior</s1>cislunar-arc-recovery

# text
seg-3adfb78b1f34 = <s1>Siguiente</s1>clock
