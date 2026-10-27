# docs--kind-lunar-interop-export: translations (pt-BR)

# text
seg-debc2f07db78 = true

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

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
seg-5a4dcb93a643 = Exportação de interoperabilidade lunar modelada: emite o referencial lunar, a escala de tempo lunar e as efemérides lunares em formas de intercâmbio baseadas em CCSDS e alinhadas com LunaNet/IOAG, com ida e volta e aderência à norma dos campos. REAPROVEITA o emissor+analisador CCSDS OEM { "2.0" } do crate (crate::oem), reetiquetado para o contexto lunar — o REF_FRAME do OEM leva o referencial do corpo lunar WGCCRE da IAU { "2015" } (MOON_ME / MOON_PA), o TIME_SYSTEM a escala de tempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON — sobre uma efeméride de amostra ilustrativa da classe LCNS (posições de crate::lunar_service, velocidade por diferença finita). Também emite um descritor de tempo lunar alinhado com LunaNet/IOAG (id da escala, taxa secular em µs/dia de crate::lunar_time, banda publicada, superfície de referência) que faz ida e volta via serde_json, e envolve os artefatos no envelope KIF existente (crate::interchange) com o rótulo de honestidade MODELLED. Informa artefatos emitidos, contagem de linhas do OEM, êxito na aderência à norma dos campos + lista de campos presentes/ausentes, ida e volta do OEM ok, ida e volta dos metadados de tempo ok, e tamanho do KIF em bytes. MODELLED — ida e volta determinística + aderência à norma dos nomes de campo contra o CCSDS OEM publicado + a semântica de campos do LunaNet/IOAG é a referência independente; NÃO é um ensaio certificado de aderência à norma de interoperabilidade; efeméride ilustrativa de fonte pública, sem afiliação com a ESA; sem TRL, herança nem endosso de agência.

# text
# c1: scenarios/lunar-interop-export.toml
seg-1726861e444f = Uma execução de <c1/> resume-se assim: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } states, OEM { "23" } lines | conformance PASS ({ "9" } present / { "0" } missing) | OEM round-trip ok | time-meta round-trip ok | KIF { "1640" } bytes | MODELLED

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
seg-98acb538942f = <b>MODELLED</b> Exportação de referencial lunar + tempo + efemérides alinhada com LunaNet/IOAG (CCSDS OEM + KIF) com aderência à norma na ida e volta. Referência independente (InternalConsistency): a exportação OEM lunar do kshana reanalisada pela biblioteca independente de terceiros <c1/> (R. J. Anderson): os tokens de referencial e de tempo e o estado por época concordam até a precisão de escrita ({ "1" } mm / { "1e-9" } km/s) e uma exportação sem TIME_SYSTEM é rejeitada — uma ida e volta estrutural de intercâmbio; a semântica física do referencial e do tempo lunares é validada pelas suas próprias linhas, de modo que esta continua MODELLED. { "0.30" } comparação externa, um achado (continua MODELLED): um

# text
# c1: honesty
seg-c9a1d76625d6 = MODELLED (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-633bcd62ce93 = Emite também um descritor de tempo lunar alinhado com LunaNet/IOAG (id da escala, taxa secular em µs/dia de crate::lunar_time, banda publicada, superfície de referência) que faz ida e volta via serde_json, e envolve os artefatos no envelope KIF existente (crate::interchange) com o rótulo de honestidade MODELLED. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-0e91697e3036 = MODELLED — ida e volta determinística + aderência à norma dos nomes de campo contra o CCSDS OEM publicado + a semântica de campos do LunaNet/IOAG é a referência independente; NÃO é um ensaio certificado de aderência à norma de interoperabilidade; efeméride ilustrativa de fonte pública, sem afiliação com a ESA; sem TRL, herança nem endosso de agência. (catálogo de tipos de cenário (<c1/>))

# text
seg-11d0ccba5ee7 = O QUE src/lunar_interop.rs faz: * export_lunar_oem — REAPROVEITA o emissor CCSDS OEM { "2.0" } do crate (crate::oem), reetiquetado para o contexto lunar: REF_FRAME = o referencial do corpo lunar WGCCRE da IAU { "2015" } (MOON_ME / MOON_PA), TIME_SYSTEM = a escala de tempo lunar (LTC / TCL / UTC), CENTER_NAME = MOON, sobre uma efeméride de amostra da classe LCNS, ILLUSTRATIVE (posições de crate::lunar_service, velocidade por diferença finita central). * export_ (comentário do arquivo de cenário, linhas { "6" } a { "19" })

# text
seg-f730e8f789cf = HONESTIDADE: MODELLED. Os NOMES e as unidades dos campos estão alinhados com normas PUBLIC (CCSDS 502.0-B OEM, referenciais lunares WGCCRE da IAU { "2015" }, Especificação de Interoperabilidade LunaNet / arquitetura lunar do IOAG). A ida e volta determinística e a aderência à norma dos nomes de campo são a referência independente. Isto NÃO é um ensaio certificado de aderência à norma de interoperabilidade. A efeméride é ilustrativa, de fonte pública, SEM afiliação com a ESA, e não implica nenhum TRL (comentário do arquivo de cenário, linhas { "21" } a { "26" })

# text
seg-254d48fe58a5 = A exportação de interoperabilidade lunar é MODELLED, não validada: verificada contra a sua própria identidade analítica ou de forma fechada, o que detecta erros de transcrição e de coeficientes, mas não é uma referência externa independente. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-07d6cc44724f = <s1>Anterior</s1>lunar-integrity

# text
seg-9669cd9b1d04 = <s1>Próximo</s1>lunar-jamming
