# docs--kind-lunar-interop-export: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/lunar-interop-export.md
seg-d36e6d7d8a10 = Fonte: <c1/>

# text
# c1: lunar-interop-export
seg-fdf560e675f4 = <c1/> (tipo de cenário)

# text
seg-5a4dcb93a643 = Exportação de interoperabilidade lunar modelada: emite o referencial lunar, a escala de tempo lunar e as efemérides lunares em formas de intercâmbio alinhadas com LunaNet/IOAG e baseadas em CCSDS, com aderência à norma de ida e volta e dos campos. REAPROVEITA o emissor e analisador CCSDS OEM { "2.0" } da crate (crate::oem), reetiquetado para o contexto lunar — o REF_FRAME do OEM transporta o referencial do corpo lunar segundo o WGCCRE da IAU de { "2015" } (MOON_ME / MOON_PA), o TIME_SYSTEM a escala de tempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON — sobre umas efemérides de amostra ilustrativas da classe LCNS (posições de crate::lunar_service, velocidade por diferença finita). Emite também um descritor de tempo lunar alinhado com LunaNet/IOAG (id da escala, taxa secular em µs/dia de crate::lunar_time, banda publicada, superfície de referência) que faz ida e volta via serde_json, e envolve os artefactos no envelope KIF existente (crate::interchange) com a etiqueta de honestidade MODELLED. Indica os artefactos emitidos, o número de linhas do OEM, a aderência dos campos à norma (resultado positivo) e a lista de campos presentes/em falta, a ida e volta do OEM correta, a ida e volta dos metadados de tempo correta e o tamanho em bytes do KIF. MODELLED — a referência independente é a ida e volta determinística e a aderência dos nomes de campos à norma face ao CCSDS OEM publicado e à semântica de campos do LunaNet/IOAG; NÃO é um ensaio certificado de aderência à norma de interoperabilidade; efemérides ilustrativas de fontes públicas, sem afiliação à ESA; sem TRL, herança de voo nem aval de agências.

# text
# c1: scenarios/lunar-interop-export.toml
seg-1726861e444f = Uma execução de <c1/> resume-se assim: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } estados, OEM com { "23" } linhas | aderência à norma PASS ({ "9" } presentes / { "0" } em falta) | ida e volta do OEM correta | ida e volta dos metadados de tempo correta | KIF { "1640" } bytes | MODELLED

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-f8353e15aabd = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-interop-export.toml
seg-169f9446e90d = O exemplo <c1/> define, entre outros:

# text
seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

# text
seg-3f36bd2ec5ea = LTC

# text
seg-2ac27c1e55c0 = octeto

# attr:alt
seg-0e86ff364c17 = O gráfico que o motor escreve para scenarios/lunar-interop-export.toml, tipo de cenário lunar-interop-export

# text
# c1: oem
seg-98acb538942f = <b>MODELLED</b> Exportação de referencial lunar + tempo + efemérides alinhada com LunaNet/IOAG (CCSDS OEM + KIF) com aderência à norma de ida e volta. Referência independente (InternalConsistency): a exportação OEM lunar do kshana voltou a ser analisada pela biblioteca independente de terceiros <c1/> (R. J. Anderson): os tokens de referencial/tempo e o estado por época concordam até à precisão de escrita ({ "1" } mm / { "1e-9" } km/s) e uma exportação sem TIME_SYSTEM é rejeitada — uma ida e volta estrutural de intercâmbio; a semântica física do referencial/tempo lunar é validada pelas suas próprias linhas, pelo que esta continua a ser MODELLED. { "0.30" } comparação externa, uma constatação (continua a ser MODELLED): uma se

# text
# c1: honesty
seg-c9a1d76625d6 = MODELLED (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-633bcd62ce93 = Emite também um descritor de tempo lunar alinhado com LunaNet/IOAG (id da escala, taxa secular em µs/dia de crate::lunar_time, banda publicada, superfície de referência) que faz ida e volta via serde_json, e envolve os artefactos no envelope KIF existente (crate::interchange) com a etiqueta de honestidade MODELLED. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-0e91697e3036 = MODELLED — a referência independente é a ida e volta determinística e a aderência dos nomes de campos à norma face ao CCSDS OEM publicado e à semântica de campos do LunaNet/IOAG; NÃO é um ensaio certificado de aderência à norma de interoperabilidade; efemérides ilustrativas de fontes públicas, sem afiliação à ESA; sem TRL, herança de voo nem aval de agências. (catálogo de tipos de cenário (<c1/>))

# text
seg-11d0ccba5ee7 = O QUE faz src/lunar_interop.rs: * export_lunar_oem — REAPROVEITA o emissor CCSDS OEM { "2.0" } da crate (crate::oem), reetiquetado para o contexto lunar: REF_FRAME = o referencial do corpo lunar segundo o WGCCRE da IAU de { "2015" } (MOON_ME / MOON_PA), TIME_SYSTEM = a escala de tempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON, sobre umas efemérides de amostra ILLUSTRATIVE da classe LCNS (posições de crate::lunar_service, velocidade por diferença finita central). * export_ (comentário do ficheiro de cenário, linhas { "6" } a { "19" })

# text
seg-f730e8f789cf = HONESTIDADE: MODELLED. Os NOMES dos campos e as unidades estão alinhados com normas PUBLIC (CCSDS 502.0-B OEM, referenciais lunares do WGCCRE da IAU de { "2015" }, LunaNet Interoperability Specification / arquitetura lunar do IOAG). A ida e volta determinística e a aderência dos nomes de campos à norma são a referência independente. Isto NÃO é um ensaio certificado de aderência à norma de interoperabilidade. As efemérides são ilustrativas, de fontes públicas, SEM afiliação à ESA, e não implicam TRL (comentário do ficheiro de cenário, linhas { "21" } a { "26" })

# text
seg-254d48fe58a5 = A exportação de interoperabilidade lunar é MODELLED, não validada: verificada face à sua própria identidade analítica de forma fechada, deteta erros de transcrição e de coeficientes, mas não é uma referência independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-07d6cc44724f = <s1>Anterior</s1>lunar-integrity

# text
seg-9669cd9b1d04 = <s1>Seguinte</s1>lunar-jamming
