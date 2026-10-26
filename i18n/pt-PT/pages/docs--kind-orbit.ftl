# docs--kind-orbit: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-a4f1e7d2041e = Página da família: <a1>Constelações, cobertura e geometria</a1>

# text
seg-be831b52a339 = e mais { "4" } na matriz.

# text
seg-a8d92406e428 = Relógio ótico de rede de estrôncio, meta para uso espacial sigma_y

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Desvio de Allan/modificado/Hadamard + identificação de ruído de lei de potência com ICs de χ². Referência independente (ExternalDataset): NIST SP { "1065" } (Riley) / desvios de referência do Stable32 em NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crescimento do erro em inércia de forma fechada + holdover até ao limiar; classes de relógios quânticos. Referência independente (ReferenceImpl): Recursão de covariância multipasso de clock_state (conferência cruzada na mesma base de código); o núcleo subjacente de variância de deriva e inversão de holdover é validado externamente contra o scipy (ver 'Clock-holdover coast-variance & threshold inversion'). Os valores de holdover por classe com patamar de ruído vermelho permanecem MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Relógio de Kalman de 3 estados (fase/frequência/deriva) de van Loan, estabilizado por Joseph. Referência independente (ReferenceImpl): KalmanFilter do filterpy { "1.4.5" } (R. Labbe, MIT), com F via scipy.linalg.expm e Q via a matriz em blocos de Van Loan { "1978" } — uma implementação de referência independente que reproduz a trajetória completa do filtro do kshana. Consistência entre implementações: a física do relógio / a calibração de Allan não são validadas externamente, por isso isto permanece MODELLED. Comparação externa { "0.30" }, um achado (permanece MODELLED): em relógios finais do IGS de { "30" } s de { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> χ² auxiliado pelo relógio, RAIM, AGC e SQM fundidos numa figura de mérito de segurança por época. Referência independente (ExternalDataset): parâmetros de cenário do TEXBAT (Humphreys { "2012" }) — caracterização, não vetores fixados. Comparação externa { "0.30" }, um achado (permanece MODELLED): no JammerTest { "2024" } (Bleik; dados GPL-3.0) os monitores em nível de observável (qui-quadrado auxiliado pelo relógio, RAIM, falha de solução) não levantaram alarme em até { "10" } s de nenhum dos { "8" } inícios de spoofing publicados avaliáveis (onde a janela anterior ao início estava limpa, o primeiro alarme veio de { "10.2" } a { "39" } s após o pu

# text
seg-e12f672ae71d = O holdover do relógio sem GNSS é MODELLED, não validado: conferido contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = A estimativa do estado do relógio a bordo é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = A deteção de spoofing é MODELLED, não validada: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-d291f20074f0 = <b>VALIDATED</b> Rotação da Terra a partir de uma data juliana UT1 em duas partes no caminho da órbita, de modo que a posição fixa à Terra preserva o microssegundo que uma data num único f64 perde (cerca de { "3e-9" } rad perto de { "2020" }): jd2::gmst82 (GMST da IAU { "1982" }, a convenção TEME, sobre as duas partes), cio:

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP a partir da geometria de linha de visada via Q=(HᵀH)⁻¹ com divisão ENU local. Referência independente (ExternalDataset): DOP do gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — biblioteca independente, coincidente a { "1e-6" } relativo

# text
seg-53a78e98af12 = Página do tópico: <a1>SKYLINE.md</a1>
