# docs--kind-cislunar-observability: translations (pt-BR)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-6d584e86deba = razão (adimensional)

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
# c1: docs/kinds/by-kind/cislunar-observability.md
seg-258f128cea60 = Fonte: <c1/>

# text
# c1: cislunar-observability
seg-f0c7758e472f = <c1/> (tipo de cenário)

# text
seg-7ccd0a3babb8 = Observabilidade MODELLED de constelação cislunar planar (P6): rastreia uma constelação planar de DRO corrigida diferencialmente, com quatro espaçonaves e alcance intersatélites, e informa quanto do estado de quatro componentes [x,y,ẋ,ẏ] de uma espaçonave o arco torna observável. Emite ({ "1" }) a tabela de posto contra comprimento de arco para um único enlace só de distância — de posto 1 instantâneo, crescendo em direção ao estado completo de quatro componentes à medida que o arco se estende (P6 Tabela { "1" }); ({ "2" }) o espectro de autovalores do gramiano de observabilidade + o número de condição ao longo do arco; ({ "3" }) a comparação de posto instantâneo só de distância contra distância + taxa de distância (a alavanca de projeto do Doppler) mais o relato de GDOP singular só com distância / definido com distância + taxa; e ({ "4" }) uma validação cruzada independente por SRIF cuja covariância a posteriori se torna finita / bem condicionada exatamente no arco em que o posto observável chega a quatro. Núcleo VALIDATED: o posto observável é um limiar de valor singular revelador de posto, verificado de forma cruzada contra o posto de autovalores do gramiano; o espectro de autovalores obedece aos invariantes espectrais (traço=Σλ, det=Πλ, Frobenius²=Σλ²); a STM variacional é a STM do CR3BP validada por diferenças finitas; as linhas do jacobiano de distância/taxa de distância são derivadas parciais analíticas validadas por diferenças finitas (verificadas de forma cruzada contra o observável de taxa de distância em 3-D do crate); as quatro condições iniciais são DROs planares corrigidas diferencialmente que fecham com um resíduo de periodicidade estreito e são retrógradas; a transição de posto é validada de forma cruzada contra o filtro de informação em raiz quadrada do crate (covariância a posteriori finita exatamente em posto completo, cond(P)=cond(OᵀO)); um instantâneo com deficiência de posto é sinalizado como GDOP indefinido (fim condition=inf), nunca como um valor finito espúrio — a mesma guarda de geometria singular que pvt::solve_spp aplica. MODELLED: o projeto da constelação (amplitudes e fases do perilúnio dos DROs) e a progressão específica de posto que ele produz. Não é um produto de desempenho de navegação certificado.

# text
# c1: scenarios/cislunar-observability.toml
seg-a59f2fa9efb9 = Uma execução de <c1/> resume-se assim: cislunar-observability | { "4" } s/c ({ "3" } refs) | arco de { "6.0" } h, { "24" } épocas | posto { "1" } → { "4" } de { "4" } ao longo do arco | λ do gramiano [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | posto instantâneo só distância { "2" } → distância+taxa { "4" } ({ "3" } enlaces) | GDOP só distância indefinido distância+taxa { "6.353" } | CIs de DRO (resíduo máximo de periodicidade { "4.7e-9" }) | a posteriori do SRIF finita na época { "8" } de posto 4 (posto/STM/fechamento de DRO/SRIF validados, projeto modelado)

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
seg-fb1601eda130 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/cislunar-observability.toml
seg-f3b5cc590c78 = O exemplo <c1/> define, entre outros:

# text
seg-0cc8ab10786b = unidades de tempo do referencial rotativo

# text
seg-84781b6fff48 = GDOP indefinido (posto deficiente / singula

# text
seg-856eb311f24b = “indefinido” (texto como o documento declara

# text
seg-1767b216650d = definido

# text
seg-fc5d34345fdd = Rótulo do resultado (o do motor): observabilidade MODELLED de constelação cislunar planar (P6). Núcleo VALIDATED: o POSTO observável é um limiar de valor singular revelador de posto, verificado de forma cruzada contra o posto de autovalores do gramiano; o espectro de autovalores do gramiano obedece aos invariantes espectrais (traço = soma dos autovalores, det = produto dos autovalores, Frobenius^{ "2" } = soma dos autovalores^{ "2" }

# attr:alt
seg-f15bbf30b0dd = O gráfico que o motor gera para scenarios/cislunar-observability.toml, tipo de cenário cislunar-observability

# text
seg-4564ad90378b = <b>MODELLED</b> O limiar de observabilidade cislunar por comprimento de arco no CR3BP ESPACIAL de seis estados, em vez do planar de quatro estados, nas famílias DRO, halo L2 e halo quase retilíneo L2, com o ruído de medição entrando no Gramiano e DOIS critérios reportam

# text
seg-9f857ff85800 = <b>MODELLED</b> O limiar de observabilidade cislunar por comprimento de arco no CR3BP ESPACIAL de seis estados, em vez do planar de quatro estados, nas famílias DRO, halo L2 e halo quase retilíneo L2. Referência independente (InternalConsistency): Um posto independente por escalonamento (eliminação gaussiana com pivotamento parcial) confirma cada veredito de posto de seis estados — um algoritmo diferente, que não compartilha código com a rota de autovalores/SVD sob teste. A matriz de transição de estados do CR3BP de { "6" }×{ "6" } que isto compõe tem a sua própria referência independente ReferenceImpl contra a integração variacional do SciPy, e as condições iniciais de halo/NRHO vêm de um corretor que reproduz o L2 sul publicado

# text
# c1: label
seg-53c183035bde = Observabilidade MODELLED de uma constelação cislunar planar (P6). Núcleo VALIDATED: o POSTO observável é um limiar de valores singulares que revela o posto, conferido com o posto dos autovalores do Gramiano; o espectro de autovalores do Gramiano obedece aos invariantes espectrais (traço = soma dos autovalores, det = produto dos autovalores, Frobenius^{ "2" } = soma dos autovalores^{ "2" }); a STM variacional é a STM do CR3BP validada por diferenças finitas (crate::cr3bp); as linhas jacobianas de distância / taxa de distância (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f6a217f57bec = Observabilidade MODELLED de uma constelação cislunar planar (P6): acompanha uma constelação de quatro espaçonaves em DRO planar com correção diferencial e medição de distância entre satélites, e informa quanto do estado de quatro componentes [x,y,ẋ,ẏ] de uma espaçonave o arco torna observável. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-e5182743fd40 = MODELLED: o projeto da constelação (amplitudes e fases do perilúnio da DRO) e a progressão de posto específica que ele produz. (catálogo de tipos de cenário (<c1/>))

# text
seg-5d3a370f1295 = Transparência: MODELLED. Núcleo VALIDATED -- o POSTO observável é um limiar de valores singulares que revela o posto, conferido com o posto dos autovalores do Gramiano; o espectro de autovalores obedece aos invariantes espectrais (traço = soma dos autovalores, det = produto dos autovalores, Frobenius^{ "2" } = soma dos autovalores^{ "2" }); a STM variacional é a STM do CR3BP validada por diferenças finitas; as linhas jacobianas de distância / taxa de distância são derivadas parciais analíticas validadas por diferenças finitas (cross-che (comentário do arquivo de cenário, linhas { "16" } a { "25" })

# text
seg-c68bc1df8975 = A observabilidade cislunar por comprimento de arco, espacial, ruidosa e de várias famílias, é MODELLED, não validada: conferida contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ba3c2a8f0e28 = <s1>Anterior</s1>cislunar-arc-recovery

# text
seg-3adfb78b1f34 = <s1>Próximo</s1>clock
