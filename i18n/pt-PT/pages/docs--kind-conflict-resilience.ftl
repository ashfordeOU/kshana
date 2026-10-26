# docs--kind-conflict-resilience: translations (pt-PT)

# text
seg-c4ed27a559df = Página do tópico: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-216efc4e6fba = Tipo de cenário do motor v{ $version }, família <a1>PNT alternativo sem GPS</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-98133e74f88a = Página da família: <a1>PNT alternativo sem GPS</a1>

# text
# c1: docs/kinds/by-kind/conflict-resilience.md
seg-34f14aa2ee0b = Fonte: <c1/>

# text
# c1: conflict-resilience
seg-a80556cfe1a9 = <c1/> (tipo de cenário)

# text
seg-c8f93431680a = Resiliência a conflitos MODELLED de PNT em camadas (P7): um utilizador em ambiente contestado dispõe de várias camadas de PNT (GNSS de serviço aberto, GNSS de banda larga, uma constelação autenticada, um relé de aumentação), cada uma com uma disponibilidade-base, uma exatidão de 1σ e uma vulnerabilidade de negação por vetor à ameaça partilhada de jamming/spoofing. Um Monte Carlo COM SEMENTE, varrido em intensidade, nega cada camada com probabilidade clamp(vulnerabilidade·intensidade·peso_do_vetor,{ "0,1" }), funde as sobreviventes pela regra de forma fechada de variância inversa σ_fused=(Σ 1/σ_i²)^(−1/2), e indica a probabilidade de perda total (todas as camadas negadas), o erro fundido mediano e estatísticas de utilizável/negada por camada em função da intensidade. A razão de resiliência principal (probabilidade de perda total de camada única contra em camadas) chega a cerca de 7x sob a hipótese de INDEPENDÊNCIA; um varrimento de negação correlacionada por cópula gaussiana de um fator mostra então esse ~7x a colapsar para { "1" } à medida que a correlação da negação aumenta (a correlação derrota a estratificação em camadas). Um bloco de sensibilidade a priors varia o valor principal sobre os priors de vulnerabilidade COM FONTE por meio do tornado mcda + uma realocação de esforço de ameaça de Dirichlet + ICs por percentis. Núcleo VALIDATED: a perda total por Monte Carlo converge para o produto independente de forma fechada Π_i p_deny_i (dentro do erro-padrão do MC com semente fixa e N grande); a fusão por variância inversa é uma identidade de forma fechada; em ρ={ "0" } a cópula reduz-se ao modelo independente e qualquer ρ preserva a taxa de negação marginal de cada camada. MODELLED: as magnitudes de vulnerabilidade/disponibilidade/exatidão por camada são entradas com fonte, porém modeladas (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — ver conflict_threat_params), e a magnitude específica de ~7x e a forma da curva razão-versus-correlação decorrem dessa parametrização. Uma decomposição da sobrevivência por vetor, na secção § { "4.2" }, resolve então a ameaça de RF partilhada nos quatro vetores nomeados (jamming/spoofing/cinético/cibernético) e indica a curva de degradação gradual de PNT utilizável de cada vetor S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibilidade_i,v·x,{ "0,1" }))) — VALIDATED: o Monte Carlo por camada com semente converge para essa forma fechada; o jamming é o vetor mais severo para a linha de base de RF correlacionada e a camada inercial, imune a RF, é a sobrevivente decisiva. Não é um produto de disponibilidade de navegação certificado.

# text
# c1: scenarios/conflict-resilience.toml
seg-dd10a00edc2f = Uma execução de <c1/> resume-se assim: conflict-resilience | { "4" } camadas ({ "0" } linha de base) | intensidade de referência { "1.00" } | razão de resiliência forma fechada 6.73x MC 6.19x (em camadas contra camada única) | a correlação derrota a estratificação em camadas: razão 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | IC dos priors [5.51-8.48]x | sobrevivência por vetor @ ref jam { "26" }% spoof { "80" }% cinético { "100" }% cibernético { "99" }% (jamming mais severo) | valor principal de ~7x MODELLED, VALIDATED MC->forma fechada / identidade de fusão / marginais da cópula / sobrevivência por vetor

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-674bafccbaf7 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/conflict-resilience.toml
seg-71fcff68edaf = O exemplo <c1/> define, entre outros:

# text
seg-4e3b5bb5a5e7 = GNSS L1 C/A (serviço aberto)

# text
seg-bd3832c8215d = Rótulo do resultado (o do motor): resiliência a conflitos MODELLED de PNT em camadas (P7). Núcleo VALIDATED: a probabilidade de perda total por Monte Carlo converge para o produto independente de forma fechada Pi_i p_deny_i (verificada dentro do erro-padrão do Monte Carlo com semente fixa e N grande); a fusão de posição por variância inversa sigma_fused = (sum_i 1/sig

# attr:alt
seg-4dd2bcc206db = O gráfico que o motor gera para scenarios/conflict-resilience.toml, tipo de cenário conflict-resilience

# text
seg-c0e69524f05d = <b>MODELLED</b> Subpontuações por dimensão sobre as sete categorias de resiliência próprias do Kshana (não termos do DHS), as funções RDRR do RethinkPNT e os critérios de Yang, cada uma marcada como modelada com i. Referência independente (InternalConsistency): Fórmulas por métrica derivadas à mão: diversidade de Simpson inversa, composto de média ponderada, durações de cronologia limitadas/ilimitadas, escada de níveis pelo elo mais fraco

# text
# c1: label
seg-2ca37a78e899 = Resiliência a conflitos MODELLED de PNT em camadas (P7). Núcleo VALIDATED: a probabilidade de perda total por Monte Carlo converge para o produto independente de forma fechada Pi_i p_deny_i (verificada dentro do erro-padrão do Monte Carlo com semente fixa e N grande); a fusão de posição por variância inversa sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) é uma identidade de forma fechada; com correlação rho={ "0" } a cópula gaussiana reduz-se exatamente ao modelo indepen (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-d0d834e377ee = Resiliência a conflitos MODELLED de PNT em camadas (P7): um utilizador em ambiente contestado dispõe de várias camadas de PNT (GNSS de serviço aberto, GNSS de banda larga, uma constelação autenticada, um relé de aumentação), cada uma com uma disponibilidade-base, uma exatidão de 1σ e uma vulnerabilidade de negação por vetor à ameaça partilhada de jamming/spoofing. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-3ca12700b54c = A razão de resiliência principal (probabilidade de perda total de camada única contra em camadas) chega a cerca de 7x sob a hipótese de INDEPENDÊNCIA; um varrimento de negação correlacionada por cópula gaussiana de um fator mostra então esse ~7x a colapsar para { "1" } à medida que a correlação da negação aumenta (a correlação derrota a estratificação em camadas). (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-70e4fdff099f = MODELLED: as magnitudes de vulnerabilidade/disponibilidade/exatidão por camada são entradas com fonte, porém modeladas (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — ver conflict_threat_params), e a magnitude específica de ~7x e a forma da curva razão-versus-correlação decorrem dessa parametrização. (catálogo de tipos de cenário (<c1/>))

# text
seg-33541cca61b6 = Um utilizador em ambiente contestado dispõe de quatro camadas de PNT por RF que usam todas a mesma banda e, portanto, partilham o vetor de negação por jamming/spoofing — o caso frágil e correlacionado. O cenário indica: * a probabilidade de perda total em função da intensidade da ameaça (Monte Carlo contra o produto independente de forma fechada para o qual converge), * a razão de resiliência de ~7x entre camadas e camada única sob a hipótese de independência, * como esse ~7x colapsa para (comentário do ficheiro de cenário, linhas { "3" } a { "15" })

# text
# c1: layers
seg-83badfe4784d = Cada magnitude por camada é uma entrada MODELLED com proveniência; ver src/conflict_threat_params.rs para os priors [mín, nominal, máx] com fonte e os perfis de suscetibilidade por vetor (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Omitir <c1/> executa a mesma linha de base de quatro camadas com fonte; ela é escrita aqui — inclusive o vector_profile de cada camada — por transparência. (comentário do ficheiro de cenário, linhas { "17" } a { "22" })

# text
seg-bb182ed41520 = A pontuação alinhada a frameworks de resiliência de PNT é MODELLED, não validada: conferida contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6a42653a8a0f = <s1>Anterior</s1>combined-altpnt

# text
seg-2bd3e9d1505c = <s1>Seguinte</s1>constellation-design
