# docs--leo-navmsg: translations (pt-PT)

# text
seg-cc651d9cef3b = Código

# text
seg-cbf0f9bcd2d8 = Referência independente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-e305279d5b11 = Conteúdo

# text
seg-4d208b6c0eb8 = dia

# text
seg-a7d59ba6e225 = rad

# text
seg-02dc0d42fb21 = sfu

# text
# c1: docs/LEO-NAVMSG.md
seg-0f2d3faa9934 = Fonte: <c1/>

# text
# c1: leo-navmsg
seg-d8aaee95aa44 = O tipo de cenário <c1/> constrói a mensagem difundida de efemérides e relógio de um satélite de posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO) e responde às perguntas que um projetista de mensagens coloca: durante quanto tempo pode uma mensagem cobrir, o que compra cada parâmetro adicional, o que vê um utilizador quando a mensagem muda a meio de uma passagem e quantos bits são necessários para a transportar com precisão centimétrica.

# text
seg-e61283b1e1a5 = É independente do sistema. Qualquer órbita, qualquer portadora e qualquer dos quatro modelos de efemérides funcionam sem nenhuma predefinição; as predefinições com nome são dados opcionais (ver <a1>Presets</a1>).

# text
# c1: kshana example <name>
# c2: kshana scenarios/<name>.toml
# c3: leo-navmsg-fit-interval-trade
# c4: leo-navmsg-model-comparison
# c5: leo-navmsg-midpass-update
# c6: leo-navmsg-encode-decode
# c7: leo-pnt-chain
# c8: leo-focus-data-services
seg-1271cd4ad822 = Imprima um exemplo incluído com <c1/> (um nome por chamada) e execute-o com <c2/>: <c3/>, <c4/>, <c5/> e <c6/>. O tipo é também a fase de mensagem do tipo <c7/> (<a1>LEO-PNT.md</a1>) e o membro da campanha <c8/>, que compõe quatro configurações de mensagem e indica o comprimento da trama de cada uma ({ "146" }, { "154" }, { "159" } e { "171" } bytes).

# text
# c1: src/leo_navmsg/
# c2: elements.rs
# c3: truth.rs
# c4: fit.rs
# c5: sisre.rs
# c6: services.rs
# c7: codec.rs
# c8: text.rs
# c9: presets/
# c10: mod.rs
seg-51da9ffaa0ec = Código: <c1/> — <c2/> (registos e algoritmo do utilizador), <c3/> (órbita e relógio de referência), <c4/> (ajustador), <c5/> (erro de distância do sinal no espaço), <c6/> (ionosfera e Tempo Universal Coordenado (UTC)), <c7/> (formato binário), <c8/> (exportações em estilo Receiver Independent Exchange Format (RINEX) e em valores separados por vírgulas (CSV)), <c9/> (um ficheiro por predefinição), <c10/> (o tipo).

# text
seg-0505113a62e3 = O que uma mensagem transporta

# text
seg-6752521002b2 = Parte

# text
seg-cf6ae60eea4f = Auxiliar

# text
seg-00eae74cb1e6 = identificador do veículo espacial (SVID), edição de dados (IOD), identificador de banda, estado de saúde do sinal (convenção Galileo: { "0" } OK, { "1" } fora de serviço, { "2" } operações alargadas, { "3" } em ensaio)

# text
seg-0bdbdd2c923b = Sincronização

# text
# c1: af0 + af1·(t − toc) + af2·(t − toc)²
seg-8120237b02ea = número da semana, tempo da semana (TOW) de transmissão e um polinómio de relógio de segunda ordem <c1/>

# text
seg-b09dc4b322d3 = Efemérides

# text
seg-bbb3225e1d19 = um dos quatro modelos abaixo

# text
seg-3a835a49b43f = Outros serviços

# text
# c1: ai0, ai1, ai2
# c2: A0, A1, ΔtLS, t0t, WNot, WNLSF, DN, ΔtLSF
seg-2a13461cb60c = um conjunto ionosférico difundido de Klobuchar, coeficientes NeQuick-G do Galileo <c1/> com cinco indicadores de tempestade e parâmetros de tempo do sistema para UTC <c2/>

# text
seg-6b899ef63047 = Modelos de efemérides

# text
seg-60cd077d82a7 = Modelo

# text
seg-2afa300864a9 = Parâmetros

# text
# c1: √A, e, i0, Ω0, ω, M0, Δn, Ω̇, i̇, Cuc, Cus, Crc, Crs, Cic, Cis, toe
seg-3e8a1cf183cc = o conjunto kepleriano do Documento de Controlo de Interface do Sinal no Espaço do Serviço Aberto do Galileo (OS SIS ICD): <c1/>

# text
# c1: a0…
# c2: c0…
# c3: r0…
# c4: τ = tk / tau_s
# c5: tau_s
# c6: rac_degrees
seg-b1416ba3472f = o mesmo, mais polinómios de correção ao longo da trajetória, transversais e radiais (RAC) <c1/>, <c2/>, <c3/> em <c4/>, coeficientes em metros, <c5/> a potência de dois igual ou superior a metade do intervalo de ajuste (transmitida), graus definidos por <c6/> (predefinição { "7" }, { "5" }, { "6" })

# text
seg-9c0643152bbf = { "16" } + { "21" } por predefinição, mais a escala de tempo

# text
# c1: ȧ, ṅ, Crs3, Crc3, Crs1, Crc1
seg-e0afd541d64c = o modelo de 22 parâmetros de Liu, Su, Xie, Zhou e Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): os { "16" } mais <c1/>

# text
# c1: τ = (t − t_ref) / 64 s
seg-a6042071a03f = o modelo ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations) de "relógio zero": um polinómio em coordenadas cartesianas fixas à Terra e centradas na Terra (ECEF) por eixo em <c1/> (grau predefinido { "6" }), sem termos de relógio porque o relógio do satélite é controlado para o tempo do sistema (<a1>InsideGNSS</a1>)

# text
seg-5869d6f65796 = { "22" } por predefinição

# text
# c1: elements::sat_state
# c2: kepler-rac
# c3: F·e·√A·sin E
# c4: ecef-poly
# c5: −2 r·v / c²
seg-6663aa3eeebc = O algoritmo do utilizador (<c1/>) é a sequência do ICD do Galileo (equação de Kepler, correções de segundo harmónico, nodo fixo à Terra) seguida, para <c2/>, pelos três polinómios ao longo do próprio referencial da órbita kepleriana: radial ao longo da posição calculada, transversal ao longo da normal à órbita a partir da inclinação e do nodo corrigidos, e ao longo da trajetória a completar a tríade. O relógio acrescenta o termo relativista do ICD <c3/>; para <c4/> é a forma geral <c5/> a partir do polinómio e da sua derivada.

# text
# c1: A = A0 + ȧ·tk
# c2: n = √(μ/A0³) + Δn + ṅ·tk
# c3: ½·ṅ·tk
# c4: ṅ
# c5: Crs1·sin Φ + Crc1·cos Φ + Crs3·sin 3Φ + Crc3·cos 3Φ
# c6: Φ
# c7: ṅ
# c8: ṅ
# c9: nDot
seg-b3935a85a7b2 = Os termos de Liu et al. seguem o algoritmo do utilizador do artigo (Secção { "2.2" }, Eq. 1-7): <c1/>, <c2/> (as versões anteriores à { "0.30" } usavam a convenção de navegação civil do Global Positioning System (GPS) <c3/>, pelo que um <c4/> por elas escrito é o dobro do do artigo) e <c5/> somado ao raio, sendo <c6/> o argumento de latitude não corrigido. A convenção de escala de <c7/> é transcrita da Eq. { "1" } do artigo; a comparação com o artigo em órbitas reais não depende dela (um fator ½ em <c8/> deixa inalterados todos os valores ajustados), pelo que o significado de um valor <c9/> transmitido não está aí validado.

# text
seg-9a83292bffcf = Duas leituras são do próprio Kshana e são indicadas como tal:

# text
# c1: τ = tk / tau_s
seg-0e42fd0d5cf9 = O referencial RAC e a normalização <c1/>. Nenhum documento público define um referencial de correção LEO para uma mensagem difundida.

# text
seg-1b8aaed09de8 = O relógio de uma mensagem de relógio zero é zero no total: considera-se que o ciclo de controlo mantém o relógio aparente, termo relativista incluído, no tempo do sistema.

# text
seg-3472ce139588 = O ajustador

# text
# c1: truth.rs
# c2: θ(t) = θ0 + Ω̇e·t
# c3: gravity_degree = 0
seg-4404a677d185 = <c1/> integra a órbita com um Runge–Kutta de quarta ordem de passo fixo num referencial que passa a eixos fixos à Terra por uma rotação, <c2/>, a mesma rotação única que um algoritmo de utilizador de difusão aplica. A gravidade é de dois corpos (<c3/>), os harmónicos zonais J2 a J6 ({ "2" } a { "6" }) ou o campo do Earth Gravitational Model { "2008" } (EGM2008) até ao grau e ordem { "7" } a { "70" }, cujos termos tesserais transportam a assinatura de curto período que torna difícil um ajuste LEO. A resistência atmosférica é opcional (densidade exponencial estática). O relógio é de funcionamento livre (desvio, deriva, taxa de deriva e ruído branco de frequência com um desvio de Allan indicado a um segundo, mais o termo relativista periódico) ou controlado (um resíduo de Gauss–Markov de primeira ordem).

# text
# c1: fit.rs
# c2: e·cos ω
# c3: e·sin ω
# c4: λ0 = M0 + ω
# c5: ω
# c6: M0
# c7: toe
# c8: liu22
seg-ae3052e66b2a = <c1/> ajusta o conjunto kepleriano com Levenberg–Marquardt em elementos não singulares (<c2/>, <c3/>, <c4/>): uma órbita LEO é quase circular, pelo que <c5/> e <c6/> sozinhos são quase indistinguíveis. Parte do estado osculador em <c7/> com a taxa do nodo por J2. Prioris fracos centrados em zero limitam as taxas e os harmónicos que um arco curto não consegue resolver; com um peso de observação de { "1" } cm, atuam apenas nessas direções nulas. O ajuste <c8/> adota, em vez disso, o arranque e o estimador da Secção { "2.3" } do artigo: começa com todos os termos de correção a zero, não tem prioris (mínimos quadrados simples) e mantém o limite de 100 iterações do artigo. Pára pela regra própria do Kshana de convergência de parâmetros, quando cada passo de parâmetro é inferior a { "1e-3" } do seu desvio-padrão formal; o artigo pára, em vez disso, quando o RMS varia menos de { "0.1" } mm. Os polinómios RAC são depois ajustados aos resíduos ao longo da trajetória, transversais e radiais por mínimos quadrados lineares, e o polinómio de relógio ao relógio de referência menos o termo relativista que o utilizador voltará a somar.

# text
# c1: src/celeste_iod.rs
# c2: toe
# c3: toc
seg-020f45edcae1 = Uma conclusão que as predefinições codificam: após um ajuste kepleriano por mínimos quadrados, o resíduo é, por construção, aquilo que os { "16" } parâmetros não conseguem abranger, pelo que oscila ao longo da janela (vários cruzamentos por zero em cada componente) em vez de derivar. Um polinómio de correção só o remove quando o seu grau excede o que o conjunto kepleriano já abrange: ao longo da trajetória { "7" }, transversal { "5" } e radial { "6" } reduzem um resíduo de 15 minutos de centímetros para cerca de um milímetro, enquanto graus transversais mais baixos quase nada removem (o resíduo transversal é ímpar em torno do centro da janela). Um sistema que obtenha a sua parte kepleriana de outra forma deixa um resíduo de forma diferente, e os graus de que precisa decorrem disso. Os graus de correção próprios da predefinição Celeste (mais baixos do que estes; existem apenas no ficheiro da predefinição, <c1/>) são aqui executados sobre a base de mínimos quadrados do Kshana, razão pela qual os seus termos transversais contribuem pouco neste motor: uma afirmação sobre o ajustador do Kshana, não sobre qualquer sistema real. <c2/> e <c3/> são segundos inteiros, tal como o formato binário os transporta.

# text
seg-f3538e6651fa = Cada mensagem é usada durante um período centrado na sua janela de ajuste (a primeira tabela de compromisso usa a janela inteira). O que os valores do erro de distância do sinal no espaço (SISRE) medem é o <b>erro de representação</b> da mensagem face à referência a que foi ajustada, como raiz do valor quadrático médio (RMS) e máximo ao longo do intervalo. O erro de determinação e de previsão de órbita, que um segmento real em terra ou a bordo acrescenta por cima, não é modelado.

# text
seg-c2b181269367 = Erro de distância do sinal no espaço

# text
# c1: sisre.rs
seg-63462a1abc95 = <c1/> usa o SISRE de média global de Montenbruck, Steigenberger e Hauschild ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

# text
# c1: cos² η
# c2: ½ sin² η
# c3: η
seg-c4f654264c42 = Os pesos são as médias sobre utilizadores distribuídos uniformemente na calote visível da Terra de <c1/> e <c2/>, sendo <c3/> o ângulo de nadir da linha de visada no satélite, calculado para o raio e a máscara de elevação da própria órbita. Com uma máscara de { "0" }° o cálculo reproduz a tabela do artigo para a órbita terrestre média (GPS { "0.98" } e 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) e para a órbita geoestacionária ({ "0.99" } e 1/126): essa é a verificação <b>VALIDATED</b>. Em LEO a mesma média dá

# text
seg-66b488889b10 = Altitude

# text
seg-c07128592d7b = ângulo de nadir do horizonte

# text
seg-a4e04d9a23a5 = { "320" } km

# text
seg-002adc24471f = { "510" } km

# text
seg-fe2f70c29806 = { "550" } km

# text
seg-4dee38ff0811 = { "786" } km

# text
seg-cfc3c6939861 = { "1080" } km

# text
seg-102de0413553 = { "1336" } km

# text
seg-1b11819c8b2f = pelo que um utilizador LEO, que vê o satélite longe do nadir, sente muito mais os erros ao longo da trajetória e transversais do que um utilizador de órbita média.

# text
seg-b7a844ab6135 = Análises

# text
# c1: analysis = [...]
seg-17111fe25e04 = <c1/> escolhe qualquer das quatro (predefinição: todas).

# text
seg-d0c1b335af73 = Compromisso do intervalo de ajuste

# text
# c1: [trade]
# c2: scenarios/leo-navmsg-fit-interval-trade.toml
seg-f65e99c0d8b2 = <c1/> define o intervalo, os intervalos de ajuste, os períodos de atualização e os modelos. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 até ao grau { "20" } e resistência atmosférica, { "30" } minutos de mensagens) dá, com o período de utilização igual ao intervalo de ajuste:

# text
seg-f1a94c795c18 = Intervalo de ajuste

# text
seg-c6b034712788 = RMS da órbita SISRE

# text
seg-55c287c93940 = Máximo da órbita SISRE

# text
seg-ad604a608329 = RMS do SISRE com relógio

# text
seg-28723ab60ae0 = RMS radial / ao longo da trajetória / transversal

# text
seg-911a62245e80 = { "60" } s

# text
seg-1a35a89c1a34 = { "0.041" } cm

# text
seg-7cf9e6e3178f = { "0.179" } cm

# text
seg-d8a7f4c080dd = { "0.069" } cm

# text
seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

# text
seg-64015edf42d8 = { "120" } s

# text
seg-a1070c338686 = { "0.032" } cm

# text
seg-cdacf90f8ce8 = { "0.160" } cm

# text
seg-29aeee696ad2 = { "0.079" } cm

# text
seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

# text
seg-8fa4e4ccc5cc = { "180" } s

# text
seg-13182ae6d536 = { "0.093" } cm

# text
seg-fc692062aaa8 = { "0.540" } cm

# text
seg-9ef760f0777c = { "0.134" } cm

# text
seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

# text
seg-bbd4f2685bee = { "300" } s

# text
seg-93410318239b = { "0.310" } cm

# text
seg-4af8f1c977eb = { "1.033" } cm

# text
seg-0921a535896a = { "0.329" } cm

# text
seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

# text
seg-8de43db30454 = { "450" } s

# text
seg-ec7f9ca7654b = { "1.690" } cm

# text
seg-1ad55674fab9 = { "7.542" } cm

# text
seg-a022913c956d = { "1.696" } cm

# text
seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

# text
seg-21b0c99fbda4 = { "600" } s

# text
seg-6840aea9ff12 = { "2.875" } cm

# text
seg-798c8c1d0190 = { "10.219" } cm

# text
seg-6b3b442069d8 = { "2.866" } cm

# text
seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

# text
seg-4dabf1faddfc = { "900" } s

# text
seg-d733d3fdac02 = { "9.345" } cm

# text
seg-3334d120521b = { "34.032" } cm

# text
seg-4d4a2cc180d0 = { "9.349" } cm

# text
seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

# text
seg-f1d733b03f45 = { "0.000" } cm

# text
seg-81a60d921ce9 = { "0.057" } cm

# text
seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

# text
seg-c8a720a6f160 = { "0.074" } cm

# text
seg-b13f5539e4b1 = { "0.001" } cm

# text
seg-1c9d3ee30ac7 = { "0.090" } cm

# text
seg-7dd08c671dc7 = { "0.004" } cm

# text
seg-740e69fcd85e = { "0.014" } cm

# text
seg-c0db4312d8a0 = { "0.106" } cm

# text
seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

# text
seg-f3bda174cbef = { "0.037" } cm

# text
seg-5a5bb868e8ff = { "0.176" } cm

# text
seg-02b99fcb9fee = { "0.127" } cm

# text
seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

# text
seg-ec1e77bc5be9 = { "0.214" } cm

# text
seg-d3c1ed834802 = { "0.643" } cm

# text
seg-23482e7c028f = { "0.229" } cm

# text
seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

# text
seg-bfec9407ffae = { "1.015" } cm

# text
seg-f295ad6efcf4 = { "3.695" } cm

# text
seg-2cd92d16edfc = { "1.062" } cm

# text
seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

# text
seg-4e19f776d1b7 = E com um ajuste de { "300" } s, variando a frequência com que uma nova mensagem assume:

# text
seg-89810ffbeff3 = Período de atualização

# text
seg-d4d1fa05e1a8 = { "0.314" } cm

# text
seg-828b7488993b = { "0.850" } cm

# text
seg-edb934c1419f = { "0.288" } cm

# text
seg-52c8f821a7d2 = { "0.859" } cm

# text
seg-e135107af135 = { "150" } s

# text
seg-e7ce46d74f3e = { "0.219" } cm

# text
seg-3391df1cf909 = { "0.830" } cm

# text
seg-d6eb4f554461 = { "0.009" } cm

# text
seg-22c68874002b = { "0.010" } cm

# text
seg-2172d9ea618e = O conjunto kepleriano de 16 parâmetros degrada-se de { "0.04" } cm a { "60" } s para { "9.35" } cm a { "900" } s: um conjunto kepleriano com harmónicos de duas vezes por revolução não consegue seguir os termos de gravidade de frequência mais alta nem a resistência atmosférica de um arco LEO durante mais do que alguns minutos, e o seu resíduo de mínimos quadrados oscila ao longo da janela. Os polinómios ao longo da trajetória/transversais/radiais (graus { "7" }, { "5" }, { "6" }) absorvem o que resta: { "1.01" } cm a { "900" } s, { "0.21" } cm a { "600" } s. Nos intervalos mais curtos, os valores keplerianos são submilimétricos e já não estão estritamente ordenados (o ajuste é então limitado pelo condicionamento, não pelo modelo).

# text
seg-aca262796570 = Comparação de modelos

# text
# c1: scenarios/leo-navmsg-model-comparison.toml
seg-fdf2368d0210 = <c1/> executa os quatro modelos a { "1" }, { "5" } e { "10" } minutos na mesma órbita, com o número de parâmetros e os bits de efemérides e relógio na codificação do Kshana:

# text
seg-7d3c6c43390d = Bits de efemérides + relógio

# text
seg-f7f60c66d89e = { "0.022" } cm

# text
seg-f7bcb8a44fde = { "0.049" } cm

# text
seg-2972b631701e = { "0.230" } cm

# text
seg-cc42e8dc7238 = { "0.260" } cm

# text
seg-67e50069c6f7 = { "3.061" } cm

# text
seg-780954ab9d7f = { "3.071" } cm

# text
seg-de81d6550264 = { "0.044" } cm

# text
seg-fb171bf75f27 = { "0.005" } cm

# text
seg-c8c067631f7a = { "0.120" } cm

# text
seg-2dc41855c245 = { "0.208" } cm

# text
seg-6ef79938dd22 = { "0.046" } cm

# text
seg-7e96d7e34e63 = { "0.142" } cm

# text
seg-c43199891163 = { "0.258" } cm

# text
seg-f9a9fdebc114 = { "0.290" } cm

# text
# c1: ecef-poly
seg-f157ff5b40b1 = <c1/> (relógio zero)

# text
seg-9474a775dc5e = { "28.784" } cm

# text
seg-5098c8b6f813 = { "0.561" } cm

# text
seg-5e7fdc441b03 = { "28.774" } cm

# text
seg-82d3fa2e27ef = A linha de relógio zero é pontuada face a um relógio controlado com um resíduo de { "0.24" } m (o valor do ATOMIC); as outras, face ao relógio de funcionamento livre que ajustam.

# text
seg-769db176020f = <b>Liu et al. { "2025" }, SISRE em função da altitude (MODELLED).</b> O mesmo cenário ajusta o modelo de 22 parâmetros do Kshana em arcos de 20 minutos às cinco altitudes do artigo, na inclinação de cada satélite:

# text
seg-01e587427a7e = Satélite

# text
seg-f6bbd3d5d75c = Inclinação

# text
seg-c54d0bd7d498 = Liu et al. { "2025" }

# text
seg-16c489b75f44 = Kshana (RMS só da órbita)

# text
seg-ee4816ca13c1 = razão

# text
seg-510349500d23 = { "8.88" } cm

# text
seg-a97bde451ec2 = { "4.25" } cm

# text
seg-b6c1d48847d9 = { "475" } km

# text
seg-f79249e9bd75 = { "6.21" } cm

# text
seg-9b6757a674a5 = { "2.87" } cm

# text
seg-62008169ca69 = { "2.20" } cm

# text
seg-06a4bcde0ea3 = { "966" } km

# text
seg-9e5e06ec23c3 = { "2.11" } cm

# text
seg-41ce80bc0b62 = { "1.25" } cm

# text
seg-c9f63cd8bd07 = { "0.75" } cm

# text
seg-f11a960a1d52 = { "0.51" } cm

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-0376cf5f98f0 = Isto <b>não</b> é uma validação. O artigo ajustou órbitas científicas precisas reais dos satélites indicados (com o seu histórico completo de gravidade, resistência atmosférica e forças não gravitacionais); o Kshana ajusta a sua própria órbita integrada, calcula os seis parâmetros acrescentados como descrito acima e usa os seus próprios pesos SISRE. A comparação mostra a tendência e a ordem de grandeza. A comparação nas mesmas órbitas reais que o artigo ajustou é <c1/> (desde a { "0.30" } o ajuste de 22 parâmetros concorda aí dentro do fator { "1.5" } fixado antecipadamente, nos dias do artigo e em oito dias reservados).

# text
seg-d82887c766e3 = Atualização a meio da passagem

# text
# c1: [midpass]
# c2: search_s
# c3: update_period_s
# c4: threshold_m
# c5: scenarios/leo-navmsg-midpass-update.toml
seg-d1104b6ea7fa = <c1/> coloca um utilizador (predefinição { "45" }° N, { "10" }° E), encontra a passagem mais alta acima da máscara dentro de <c2/> e agenda mensagens a cada <c3/>. Em cada comutação dentro da passagem indica o salto de posição, o salto de relógio, o salto de pseudodistância do utilizador (mensagem nova menos a antiga), o maior salto que qualquer utilizador visível poderia ver (forma fechada sobre o cone de nadir), o erro de distância antes e depois, e PASS ou FAIL face a <c4/>. <c5/> (ajustes de { "300" } s atualizados a cada { "150" } s):

# text
seg-7d91304c87e3 = A passagem mais alta num dia atinge { "43.7" }° e dura { "455" } s. As suas comutações:

# text
seg-289e8da49cc8 = Comutação

# text
seg-e80d12ee2259 = Elevação

# text
seg-b16789d14338 = Salto de posição

# text
seg-b3c252609532 = Salto de relógio

# text
seg-8239a390ec71 = Salto de distância do utilizador

# text
seg-4153faf7969d = Salto na pior geometria

# text
seg-14402c7fb332 = IOD { "270" } → { "271" }

# text
seg-7862a97ac55f = { "0.07" } mm

# text
seg-4cfe934c881f = { "0.19" } mm

# text
seg-9e9752920165 = -0.17 mm

# text
seg-4267557786be = { "0.27" } mm

# text
seg-46872e8925b2 = IOD { "271" } → { "272" }

# text
seg-4c803fd2ccc9 = { "0.14" } mm

# text
seg-cc9a8388f6bc = -0.24 mm

# text
seg-0549f7fd0633 = IOD { "272" } → { "273" }

# text
seg-ad1afcf9a466 = -0.22 mm

# text
seg-c1b30171b4f0 = { "0.35" } mm

# text
seg-f93647402fa9 = { "0.48" } mm

# text
seg-69b35182807c = Maior salto de distância do utilizador { "0.35" } mm face a um limiar de { "5" } cm: <b>PASS</b>.

# text
seg-96dcb456600d = Codificação e descodificação

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
seg-1b3674a0e041 = <c1/> codifica a primeira de três mensagens, descodifica-a, verifica o CRC e rejeita uma cópia corrompida, imprime o orçamento de quantização e escreve e volta a ler o bloco em estilo RINEX e a tabela CSV:

# text
# c1: 0x19105F
seg-480eb9ffc333 = trama: { "171" } bytes ({ "1310" } bits de carga útil, dos quais { "1045" } são de efemérides e relógio), verificação de redundância cíclica de 24 bits (CRC-24Q) <c1/>;

# text
# c1: af0
seg-0e2a64a063fd = maior efeito de meio passo de qualquer campo isolado: <c1/>, { "0.545" } mm;

# text
seg-a1875f7088b0 = mensagem completa após a quantização: posição a menos de { "1.126" } mm e relógio a menos de { "0.185" } mm da mensagem exata; SISRE { "0.113" } cm exato, { "0.129" } cm descodificado;

# text
seg-6e818708b695 = uma trama com um bit invertido é rejeitada: verdadeiro;

# text
seg-31fe0f6b133d = ida e volta em estilo RINEX a menos de { "5.0e-06" } m, ida e volta em CSV a menos de { "0.0e+00" } m.

# text
seg-405cf34090cc = Independência da plataforma

# text
# c1: libm
# c2: src/portable_math.rs
# c3: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c4: leo-navmsg
seg-7f2193f6ff06 = Uma trama é composta por inteiros transmitidos, pelo que tem de ser os mesmos inteiros onde quer e como quer que o cenário seja executado: o binário nativo em qualquer sistema operativo, uma compilação de depuração ou de produção, e a compilação WebAssembly (WASM) num navegador. Três coisas se interpunham. O seno, o cosseno, o arco-tangente e a exponencial da biblioteca matemática de um anfitrião não têm de ser corretamente arredondados e diferem entre anfitriões na última casa. Uma compilação otimizada em macOS obtém um seno e um cosseno de um argumento a partir da rotina combinada do sistema, que nem sempre devolve o valor do seno isolado, pelo que uma compilação de depuração e uma de produção também diferiam. E o amostrador normal habitual chama a exponencial e o logaritmo do anfitrião nos seus ramos raros. O ajuste transforma uma diferença tão pequena em campos quantizados diferentes. O tipo inteiro (órbita e relógio de referência, ajuste, algoritmo do utilizador, erro de distância do sinal no espaço (SISRE), codec) calcula, por isso, todas essas funções com a biblioteca <c1/> em Rust puro através de <c2/>, potências inteiras como produtos explícitos e desvios normais pelo método polar sobre a saída bruta do gerador. <c3/> fixa a trama de 171 bytes do cenário de codificação e descodificação abaixo e um valor de verificação por modelo de efemérides; uma compilação de depuração, uma de produção e a compilação WASM dão documentos de resultados idênticos byte a byte para os cinco cenários <c4/> incluídos.

# text
seg-1ef00467df17 = Formato binário

# text
seg-af2dae9e9e7c = <b>Esta é a codificação documentada própria do Kshana.</b> Transporta os componentes que as descrições publicadas das mensagens de navegação LEO referem, modelada no conjunto de campos do ICD do Galileo. <b>Não</b> é a disposição de bits do Celeste nem de qualquer outro sistema: nenhuma é pública.

# text
# c1: 0xA7
# c2: kepler16
# c3: kepler-rac
# c4: liu22
# c5: ecef-poly
# c6: 0x1864CFB
# c7: 0xCDE703
# c8: 123456789
seg-6a730c01ad1c = Trama: preâmbulo <c1/> ({ "8" } bits), versão { "1" } ({ "4" }), modelo ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), comprimento da carga útil em bytes ({ "12" }), carga útil preenchida com zeros até um byte, CRC-24Q (uma verificação de redundância cíclica de 24 bits, { "24" } bits) sobre todos os bytes anteriores. O CRC-24Q é a verificação da norma da Radio Technical Commission for Maritime Services RTCM { "10403" } e do ICD do Galileo (polinómio <c6/>, valor inicial { "0" }); o código reproduz o valor de verificação de catálogo <c7/> para <c8/> e os bytes de verificação da trama de exemplo do tipo de mensagem { "1005" } da RTCM { "10403" } (<b>VALIDATED</b>).

# text
# c1: Crs
# c2: Cuc
# c3: af0
seg-a31d899eb435 = Os passos do ICD do Galileo foram escolhidos para a órbita terrestre média e são demasiado grosseiros para uma mensagem LEO de nível centimétrico: <c1/> em passos de { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm ao raio LEO), os ângulos { "2" }⁻³¹ semicírculos ({ "1.0" } cm) e <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). O Kshana mantém as unidades do ICD e a convenção do semicírculo, refina os passos de modo que o erro de meio passo de cada campo fique abaixo de { "1" } mm de posição ou distância numa janela de 15 minutos, e alarga os campos para manter os intervalos de que um ajuste LEO necessita:

# text
seg-caddc6f5b9a7 = Bloco

# text
seg-b548b723c201 = Bits

# text
seg-d00b65801e9b = Passo

# text
seg-2085d172bec3 = auxiliar e sincronização

# text
seg-7e9018f82811 = semana

# text
seg-45cbfedb6f0e = relógio (bit indicador { "0" })

# text
seg-05d274f5ce99 = s/s^{ "2" }

# text
seg-9d6d5136e12a = kepleriano (modelos 1-3)

# text
seg-3fb59c8238cb = semicírculo

# text
seg-d173e8d7026c = m^{ "0.5" }

# text
seg-48c8bfb6e914 = correções ao longo da trajetória/transversais/radiais (modelo { "2" })

# text
seg-131652f53721 = extras de Liu et al. { "2025" } (modelo { "3" })

# text
seg-fccf37a24fc4 = semicírculo/s^{ "2" }

# text
seg-ebde561c17ab = polinómio ECEF (modelo { "4" })

# text
seg-822c7482547c = Klobuchar (bit indicador { "1" })

# text
seg-7dd6e8bcaf43 = s/semicircle^{ "2" }

# text
seg-09408b08c481 = s/semicircle^{ "3" }

# text
seg-734162101b2d = NeQuick-G (bit indicador { "2" })

# text
seg-ddbb363f4593 = sfu/deg^{ "2" }

# text
seg-e2744b31e5d3 = UTC (bit indicador { "3" })

# text
# c1: deltaN
# c2: OmegaDot
# c3: aDot
# c4: nDot
# c5: nDot
# c6: kepler-rac
# c7: quantisation_budget
seg-545755e7b26f = Um valor fora do intervalo do seu campo é recusado, não é enrolado. Os intervalos foram verificados codificando ajustes a { "300" } a { "2000" } km, com inclinações de { "0" }° a { "140" }° e intervalos de ajuste até { "20" } minutos: <c1/> e <c2/> são largos porque, numa órbita quase equatorial, o nodo é mal definido e o ajuste reparte entre eles a deriva por J2 do argumento de latitude, e <c3/> e <c4/> porque o ajuste de 22 parâmetros ao longo de { "20" } minutos absorve parte da oscilação de curto período do semieixo maior. Desde a { "0.30" }, o ajuste de 22 parâmetros é o de mínimos quadrados simples do artigo, sem prioris, e um ajuste equatorial a { "800" } km necessita então de <c5/> de cerca de { "6.3e-10" } semicírculo/s^{ "2" }, pelo que a sua escala passou de { "2" }^-60 para { "2" }^-58. As correções de grau 7 ao longo da trajetória de <c6/> cabem no intervalo de coeficientes de 22 bits até { "15" } minutos; um ajuste mais longo pode excedê-lo e é então recusado. <c7/> indica, para cada campo de efemérides e de relógio, a maior variação de posição e de distância que uma variação de meio passo provoca ao longo do período de utilização, e a variação da mensagem completa após a quantização.

# text
seg-1ad17f3d3643 = Exportações de texto

# text
# c1: text.rs
# c2: > EPH
# c3: D19.12
# c4: L
# c5: KP16
# c6: KRAC
# c7: LU22
# c8: APOL
seg-81fb376aa1e1 = <b>O RINEX { "4.02" } não define registos de navegação LEO</b> (as suas letras de sistema são G, R, E, J, C, I e S; <a1>RINEX { "4.02" } do International Global Navigation Satellite System (GNSS) Service (IGS)</a1>). O bloco que <c1/> escreve toma emprestada a forma do RINEX { "4" } — um cabeçalho de registo <c2/>, uma linha de satélite e época com três termos de relógio, linhas de órbita difundida de quatro campos <c3/> — e é uma <b>extensão documentada do Kshana</b>: letra de sistema <c4/>, tipos de registo <c5/>, <c6/>, <c7/>, <c8/>, e três comentários de cabeçalho que o indicam. Trabalho anterior sobre órbitas LEO em registos de navegação de estilo RINEX 4: <a2>arXiv { "2401.17767" }</a2>.

# text
# c1: kepler16
# c2: kepler-rac
# c3: SVID, IOD, Band, WeekNumber, ToW, Health, toc, af0, af1, af2, toe, M0, sqrtA, e, deltaN, Omega0, OmegaDot, iDot, i0, omega, Crc, Crs, Cic, Cis, Cuc, Cus, a0…, c0…, r0…, racTau
# c4: csv_schema
seg-9a3016441bce = A tabela CSV transporta mensagens <c1/> e <c2/>, uma por linha. As colunas predefinidas usam os nomes do ICD do Galileo (<c3/>); <c4/> seleciona, em vez disso, a grafia de uma predefinição. Ambos os formatos podem ser lidos de volta.

# text
seg-4a26902d2771 = Ionosfera e UTC

# text
# c1: gnss_sim::klobuchar_delay_m
# c2: (f_L1 / f)²
seg-c4d4dd2bac45 = <b>Klobuchar</b>: o modelo L1 do motor (<c1/>, verificado face ao RTKLIB) escalado para a portadora pela lei de primeira ordem <c2/>.

# text
# c1: effective_ionisation_level
# c2: Az = ai0 + ai1·μ + ai2·μ²
# c3: μ
# c4: Az
seg-0d3973f04ee5 = <b>NeQuick-G</b>: os coeficientes viajam na mensagem e <c1/> devolve <c2/> para uma latitude de inclinação modificada <c3/>, com as regras do algoritmo (coeficientes todos nulos dão { "63.7" } unidades de fluxo solar, sfu; o resultado é limitado a [{ "0" }, { "400" }] sfu). O modelo de densidade eletrónica NeQuick e a sua integração oblíqua, que transformam <c4/> num atraso, <b>não</b> estão implementados.

# text
seg-66dbd447dfeb = Um satélite a algumas centenas de quilómetros voa dentro da ionosfera. Nenhum dos modelos difundidos tem em conta o conteúdo eletrónico acima do satélite e não é aplicada nenhuma correção para ele.

# text
# c1: system_to_utc
seg-7befd59b2ac6 = <b>UTC</b>: <c1/> aplica os três casos do §{ "5.1.7" } do ICD do Galileo (antes, a menos de seis horas e depois de um evento de segundo intercalar); um segundo inserido lê-se { "86400" }.

# text
seg-2b0d77219437 = Predefinições

# text
# c1: src/leo_navmsg/presets/
seg-d2908020db08 = As predefinições são dados, um ficheiro cada em <c1/>, com as suas fontes. O motor e todos os cenários incluídos, exceto o Celeste, funcionam sem elas.

# text
seg-c353e7bec219 = Chave

# text
seg-5566e1d71a4f = Órbita

# text
seg-33f4c7af9c53 = Portadora

# text
seg-f4510e898031 = Modelo de mensagem

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-890aa92157e4 = { "1080" } km, { "53" }°

# text
seg-1eca13ba2309 = X1 { "1593.3225" } MHz

# text
seg-ee9947222a30 = não publicado

# text
seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

# text
seg-f016786d7755 = { "520" } km, { "97" }°

# text
seg-780e931bf88d = PUBLIC, <a1>relatório da RNTF</a1>, descrição da constelação

# text
seg-d5df094a5f89 = { "781" } km, { "86.4" }°

# text
seg-94bc78cee128 = { "1621" } MHz (banda de { "1616" }–{ "1626" } MHz)

# text
seg-3f5de7f74502 = nenhuma difundida

# text
seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, descrição da constelação

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-2ef501f97eff = banda Ku, valor de meio da banda (representativo)

# text
seg-567fab40bd24 = nenhuma (sinais de oportunidade)

# text
seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

# text
seg-f5dd5086eedd = { "700" } km, { "55" }°

# text
seg-5fa6b60f66b4 = perto de B1 (ocultado na fonte; L1 como substituto)

# text
seg-5ebbf0042d7c = REPRESENTATIVE

# text
seg-4f3e5a683682 = { "600" } km, { "97.8" }°

# text
seg-c06f62ca5173 = { "5020" } MHz (centro da banda C RNSS)

# text
seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

# text
seg-3b1fd041f9ba = { "500" } km (representativo)

# text
seg-522c85402d84 = L1 (representativo)

# text
# c1: ecef-poly
seg-064b03765e4d = <c1/>, grau { "6" }, { "60" } s, renovado a cada { "30" } s, relógio zero, resíduo de controlo de { "0.24" } m

# text
seg-5619bc61b958 = WORKSHOP e PUBLIC

# text
seg-20572d7e348d = { "510" } km, { "97.4" }°

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
# c1: kepler-rac
seg-fad0950a2d67 = <c1/>, graus e espaçamento dos registos no ficheiro da predefinição

# text
seg-e881ffc4e14b = RNSS é o serviço de satélite de radionavegação; RNTF a Resilient Navigation and Timing Foundation.

# text
# c1: navmsg
# c2: src/celeste_iod.rs
# c3: scenarios/leo-navmsg-celeste-iod.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-e9524c71636d = <b>Celeste IOD.</b> A predefinição da demonstração em órbita (IOD) Celeste da Agência Espacial Europeia (ESA) é a única que usa material apresentado no workshop LEO-PNT do Navigation Innovation and Support Programme (NAVISP) da ESA, { "2026" }: a estrutura da mensagem (conjunto kepleriano do Galileo mais polinómios de correção ao longo da trajetória/transversais/radiais, polinómio de relógio, SVID, saúde, IOD, parâmetros ionosféricos e de UTC), o espaçamento dos registos e os nomes das colunas CSV. A órbita ({ "510" } km, quase polar heliossíncrona) e a portadora provêm de fontes públicas citadas no ficheiro. A disposição de bits do Celeste não é pública e não é reproduzida; fases posteriores do Celeste e o sistema LEO-PNT da União Europeia (UE) podem diferir. Todos os valores derivados do workshop encontram-se no módulo <c1/> de <c2/>, usado por <c3/>. Como a predefinição é retida: todos os números do motor derivados do workshop encontram-se num único ficheiro, <c4/>, que <c5/> só compila quando ele existe, e nos cenários exclusivos do repositório <c6/>. Eliminar esse ficheiro e esses cenários retém a predefinição sem qualquer edição de código; todos os outros testes, referências independentes e cenários funcionam sem ela, e a contagem de ficheiros de cenário do README continua a contar os ficheiros retidos.

# text
seg-906da2752f76 = Verificação

# text
seg-7338b6210228 = Linha

# text
seg-c5ce76c91ff7 = Etiqueta

# text
seg-cfe0d596296e = Pesos do SISRE

# text
seg-3e0059048a0d = tabela de Montenbruck et al. { "2018" } (GPS, GLONASS, Galileo, BeiDou, geoestacionária)

# text
seg-0f5e73171fe0 = Algoritmo do utilizador do ICD do Galileo

# text
# c1: eph2pos
# c2: tests/leo_navmsg_reference.rs
seg-29ad977ef423 = <c1/> do RTKLIB em quatro efemérides difundidas reais do Galileo, { "1" } mm por eixo (<c2/>)

# text
# c1: 0xCDE703
seg-ecec254e8219 = valor de verificação de catálogo <c1/>; trama de exemplo { "1005" } da RTCM { "10403" }

# text
seg-388633e4e785 = Compromisso entre ajustador e SISRE

# text
seg-8b85c3277e66 = referência de dois corpos recuperada a { "1" } mm; ajuste J2–J6 corrigido a { "1" } mm; crescimento monótono com o intervalo

# text
seg-4de7f2b173c5 = Continuidade a meio da passagem

# text
seg-bdbd2771c7f5 = identidade do salto; limite de cone em forma fechada face à amostragem

# text
seg-468a92a2caf7 = Formato binário e orçamento

# text
seg-ba26f5f63172 = ida e volta; meio passo de cada campo abaixo de { "1" } mm

# text
seg-9be43cbef131 = Estilo RINEX e CSV

# text
seg-a7748156fd6e = ida e volta

# text
seg-88b5cda10923 = Modelo e ajuste de 22 parâmetros de Liu et al. { "2025" }

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-7272ebdc1fec = órbitas precisas ITSG da TU Graz de quatro satélites face às Tabelas { "4" }, { "5" }, { "6" } e { "8" } do artigo: razões ao longo da trajetória, transversal, radial e SISRE de { "0.755" } a { "1.138" } nos dias do artigo e de { "0.683" } a { "1.186" } em oito dias reservados, dentro de 1.5x (<c1/>)

# text
seg-94066142a642 = polinómio de relógio zero do ATOMIC e a tabela de cinco altitudes

# text
seg-205cdc6a3696 = factos do ATOMIC a partir do InsideGNSS; a tabela de Liu publicada impressa ao lado do ajuste de órbita integrada do Kshana, não fixada

# text
seg-8c00ed11609c = formas fechadas do ICD; o modelo de Klobuchar verificado face ao RTKLIB

# text
seg-d5653e0958b5 = O SISRE é apenas erro de representação: sem erro de determinação ou de previsão de órbita.

# text
seg-4968d9fcbc19 = A referência é uma integração do Kshana (sem terceiro corpo, pressão de radiação solar nem marés), não a órbita precisa de um satélite real.

# text
seg-6a4a1bf21b50 = O formato binário e o bloco em estilo RINEX são do próprio Kshana.

# text
seg-26c0a2693081 = O NeQuick-G é transportado, não integrado num atraso; não há correção para um satélite dentro da ionosfera.

# text
seg-2a0c8190c38e = A comparação com Liu et al. difere nas órbitas, na leitura dos parâmetros e nos pesos.

# text
seg-4abe216f987a = <s1>Anterior</s1>Passagem LEO e orçamento de ligação

# text
seg-59d9bf4735d8 = <s1>Seguinte</s1>Posicionamento fundido MEO e LEO
