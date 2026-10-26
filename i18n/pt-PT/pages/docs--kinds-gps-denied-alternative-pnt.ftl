# docs--kinds-gps-denied-alternative-pnt: translations (pt-PT)

# text
seg-b03d56f501c3 = Tipo

# text
seg-f496b7f4c63a = Navegador combinado de gravidade + campo magnético + terreno sem GPS: três canais de campo escalares fundidos a cada ponto de passagem para uma correção de deriva mais precisa (CRLB menor) do que qualquer campo isolado.

# attr:alt
seg-498b1aea3770 = O gráfico que o motor gera para scenarios/combined-altpnt.toml, tipo de cenário combined-altpnt

# text
seg-c8f93431680a = Resiliência a conflitos MODELLED de PNT em camadas (P7): um utilizador em ambiente contestado dispõe de várias camadas de PNT (GNSS de serviço aberto, GNSS de banda larga, uma constelação autenticada, um relé de aumentação), cada uma com uma disponibilidade-base, uma exatidão de 1σ e uma vulnerabilidade de negação por vetor à ameaça partilhada de jamming/spoofing. Um Monte Carlo COM SEMENTE, varrido em intensidade, nega cada camada com probabilidade clamp(vulnerabilidade·intensidade·peso_do_vetor,{ "0,1" }), funde as sobreviventes pela regra de forma fechada de variância inversa σ_fused=(Σ 1/σ_i²)^(−1/2), e indica a probabilidade de perda total (todas as camadas negadas), o erro fundido mediano e estatísticas de utilizável/negada por camada em função da intensidade. A razão de resiliência principal (probabilidade de perda total de camada única contra em camadas) chega a cerca de 7x sob a hipótese de INDEPENDÊNCIA; um varrimento de negação correlacionada por cópula gaussiana de um fator mostra então esse ~7x a colapsar para { "1" } à medida que a correlação da negação aumenta (a correlação derrota a estratificação em camadas). Um bloco de sensibilidade a priors varia o valor principal sobre os priors de vulnerabilidade COM FONTE por meio do tornado mcda + uma realocação de esforço de ameaça de Dirichlet + ICs por percentis. Núcleo VALIDATED: a perda total por Monte Carlo converge para o produto independente de forma fechada Π_i p_deny_i (dentro do erro-padrão do MC com semente fixa e N grande); a fusão por variância inversa é uma identidade de forma fechada; em ρ={ "0" } a cópula reduz-se ao modelo independente e qualquer ρ preserva a taxa de negação marginal de cada camada. MODELLED: as magnitudes de vulnerabilidade/disponibilidade/exatidão por camada são entradas com fonte, porém modeladas (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — ver conflict_threat_params), e a magnitude específica de ~7x e a forma da curva razão-versus-correlação decorrem dessa parametrização. Uma decomposição da sobrevivência por vetor, na secção § { "4.2" }, resolve então a ameaça de RF partilhada nos quatro vetores nomeados (jamming/spoofing/cinético/cibernético) e indica a curva de degradação gradual de PNT utilizável de cada vetor S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibilidade_i,v·x,{ "0,1" }))) — VALIDATED: o Monte Carlo por camada com semente converge para essa forma fechada; o jamming é o vetor mais severo para a linha de base de RF correlacionada e a camada inercial, imune a RF, é a sobrevivente decisiva. Não é um produto de disponibilidade de navegação certificado.

# attr:alt
seg-4dd2bcc206db = O gráfico que o motor gera para scenarios/conflict-resilience.toml, tipo de cenário conflict-resilience

# text
seg-9a58a7b09423 = Navegação por correspondência com mapa de gravidade sem GPS: um gravímetro de átomos frios recupera uma deriva constante do INS a partir da sequência de anomalias de gravidade pela qual voa.

# attr:alt
seg-c42d90057e9f = O gráfico que o motor gera para scenarios/gravity-map-nav.toml, tipo de cenário gravity-map
