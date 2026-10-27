# docs--kind-oem-interop: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
# c1: docs/kinds/by-kind/oem-interop.md
seg-4abcbdaddcf8 = Fonte: <c1/>

# text
# c1: oem-interop
seg-a92dcafd670e = <c1/> (tipo de cenário)

# text
seg-dbffff25b57f = Ponte de interoperabilidade CCSDS OEM: importa uma Orbit Ephemeris Message produzida por uma ferramenta externa de dinâmica de voo (GMAT/Orekit/STK emitem todas OEM) e indica os seus segmentos/objetos/referenciais/intervalo de épocas, mais uma verificação de consistência da velocidade; sem entrada, faz a ida e volta de uma órbita de referência gerada e indica a fidelidade importação↔exportação. Verificação de ingestão estrutural/física MODELLED, NÃO uma validação da exatidão orbital da origem.

# text
# c1: scenarios/oem-interop.toml
seg-21eb1c9d7571 = Uma execução de <c1/> resume-se assim: oem-interop: ida e volta de { "2" } segmento(s), { "12" } estados; erro máximo de ida e volta de { "4.88e-7" } km / { "4.61e-10" } km/s (interop MODELLED)

# text
# c1: oem_text
seg-54c35d9fbfd9 = Campos opcionais: <c1/>

# text
# c1: scenarios/oem-interop.toml
seg-d4117f615cd8 = O exemplo <c1/> define, entre outros:

# text
seg-d7db74d14617 = KSHANA

# text
seg-b16f858574ca = Etiqueta do resultado (a do motor): MODELLED — ponte de interoperabilidade de importação/ida e volta CCSDS OEM (GMAT/Orekit/STK emitem OEM); uma verificação de ingestão estrutural + física, NÃO uma validação da exatidão orbital da origem

# attr:alt
seg-5db5a7c812ca = O gráfico que o motor escreve para scenarios/oem-interop.toml, tipo de cenário oem-interop

# text
seg-cd29f08ef235 = <b>VALIDATED</b> Importador CCSDS { "502.0" } OEM (parse_oem), tolerante a linhas COMMENT / palavras-chave de metadados adicionais / blocos de covariância e a inversa exata do escritor; ida e volta + ingestão de ficheiros externos com uma verificação de consistência da velocidade. Ensaios: <a1>ccsds_oem_interop_reference.rs</a1>.

# text
# c1: oem
seg-20071a16b316 = <b>VALIDATED</b> Importador CCSDS { "502.0" } OEM (parse_oem), tolerante a linhas COMMENT / palavras-chave de metadados adicionais / blocos de covariância e a inversa exata do escritor; ida e volta + . Referência independente (ExternalDataset): Analisador CCSDS-502 independente de terceiros <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — uma base de código separada que descodifica byte a byte de forma idêntica o OEM EME2000/UTC emitido pelo kshana ({ "24" } estados em { "2" } ficheiros de ensaio, Δ pos/vel = { "0" }) e cujo leitor estrito confirma os tokens de metadados; o analisador do kshana concorda igualmente com ele num OEM externo incluído. Duas constatações honestas de interoperabilidade (a biblioteca oem rejeita o mu por satélite do kshana

# text
# c1: label
seg-7ab6bb7a1b8a = MODELLED — ponte de interoperabilidade de importação/ida e volta CCSDS OEM (GMAT/Orekit/STK emitem OEM); uma verificação de ingestão estrutural + física, NÃO uma validação da exatidão orbital da origem (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-343a56c07d02 = Verificação de ingestão estrutural/física MODELLED, NÃO uma validação da exatidão orbital da origem. (catálogo de tipos de cenário (<c1/>))

# text
seg-44aba1ad1d37 = ÂMBITO HONESTO: verificação de ingestão estrutural + física MODELLED, NÃO uma validação da exatidão orbital das efemérides de origem. Execução: kshana scenarios/oem-interop.toml (comentário do ficheiro de cenário, linhas { "11" } a { "13" })

# text
seg-833df8eedc34 = <s1>Anterior</s1>ntn-positioning

# text
seg-28254e1b38d4 = <s1>Seguinte</s1>optical-atmosphere
