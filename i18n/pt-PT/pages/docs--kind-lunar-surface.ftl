# docs--kind-lunar-surface: translations (pt-PT)

# text
seg-f942b36a11c4 = Ainda não está no GitHub

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os demais estão em <a1><c1/></a1>.

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Toda etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga o contrário (como uma etiqueta é obtida: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-6a26b9ab59fe = Página do tópico: <a1>MISSION-THREAD.md</a1>

# text
seg-2d84b341a41f = Etiqueta do resultado (a do motor): MODELLED

# text
# c1: label
seg-626ab55f0424 = MODELLED (resultado <c1/>)

# text
seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

# text
seg-bf92597fdba4 = Software de caráter consultivo, não um equipamento de navegação certif

# text
# c1: docs/kinds/by-kind/lunar-surface.md
seg-feea03a2c628 = Fonte: <c1/>

# text
# c1: lunar-surface
seg-6c0eff9f9211 = <c1/> (tipo de cenário)

# text
seg-6c7d25f672fb = Disponibilidade MODELLED de posicionamento e temporização na superfície por local e estação para locais polares sul de classe Artemis. Para cada local e estação (uma época e uma janela após ela) indica o posicionamento por relés (quatro ou mais relés de uma constelação ILLUSTRATIVE de classe LCNS à vista e PDOP abaixo de um limite, a partir das mesmas funções de moonlight-service-volume e, com uma secção de terreno, o horizonte por traçado de raios do terreno de lunar-station-coverage), se a Terra e o Sol estão acima do horizonte do local (Sol, Lua e orientação lunar analíticos, libração incluída, que é o que varia com a estação) e a disponibilidade de temporização (um relé ou a Terra à vista) com o maior intervalo sem nenhum dos dois, o holdover que um relógio de superfície precisa atravessar. Um resultado de local único é igual, bit a bit, ao de moonlight-service-volume. MODELLED: conjunto de relés kepleriano ilustrativo numa Lua de rotação média; o valor dos relés não muda com a estação; o terreno é o recorte de { "1200" } m do LOLA. Sem aval de agência; software de caráter consultivo, não um equipamento de navegação certificado.

# text
# c1: scenarios/lunar-surface.toml
seg-3c13aefe4093 = Uma execução de <c1/> é resumida assim: lunar-surface | { "4" } locais x { "4" } estações | posicionamento { "41" }% a { "41" }% | pior disponibilidade de temporização { "100.0" }% | maior lacuna de temporização { "0.0" } h (MODELLED)

# text
# c1: sites
# c2: season_dates
# c3: window_days
# c4: step_min
# c5: stay_days
# c6: timing_floor_s
# c7: n_sats
# c8: sma_km
# c9: eccentricity
# c10: inc_deg
# c11: argp_deg
# c12: mask_deg
# c13: pdop_threshold
# c14: earth_mask_deg
# c15: sun_mask_deg
# c16: terrain
seg-02bc245c436e = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/lunar-surface.toml
seg-4e5ed02a85e1 = O exemplo <c1/> define, entre outros:

# text
seg-0ceb87f45323 = polar sul { "89.9" }

# text
seg-94a405fadf2d = mci

# text
seg-8c3e0f75ab98 = passa sem alteração

# attr:alt
seg-94b84de6c958 = O gráfico que o motor escreve para scenarios/lunar-surface.toml, tipo lunar-surface

# text
# c1: lunar-surface
# c2: moonlight-service-volume
seg-25040e105bf7 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: disponibilidade de relés e PDOP, visibilidade da Terra e do Sol e um relógio de superfície disciplinado para cada local e estação, com o perfil do horizonte do terreno de <c2/>; uma execução de local único é igual ao do tipo

# text
# c1: lunar-surface
seg-70f63c99a478 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: disponibilidade de relés e PDOP, visibilidade da Terra e do Sol e um relógio de superfície disciplinado para cada local e estação, com o perfil do hori. Referência independente (ReferenceImpl): Igualdade exata com o tipo de cenário existente para um local, e verificações de monotonicidade, nos testes. O conjunto de relés é ILLUSTRATIVE e nenhuma medição de superfície é comparada

# text
# c1: kshana kinds --json
seg-ab29e0e308d0 = Disponibilidade MODELLED de posicionamento e temporização na superfície por local e estação para locais polares sul de classe Artemis. (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-3f948092eba6 = MODELLED: conjunto de relés kepleriano ilustrativo numa Lua de rotação média; o valor dos relés não muda com a estação; o terreno é o recorte de { "1200" } m do LOLA. (catálogo de tipos de cenário (<c1/>))

# text
seg-5b217c0bb606 = HONESTIDADE: MODELLED. O conjunto de relés é ilustrativo e kepleriano, com a Lua a rodar à taxa média para os relés (sem libração), como em moonlight-service-volume; a Terra e o Sol usam a orientação analítica, de modo que os dois referenciais diferem por essa omissão. O valor de posicionamento por relés não muda com a estação neste modelo; os da Terra e do Sol mudam. Nenhuma concordância com qualquer serviço ou local real é afirmada. Cons (comentário do ficheiro de cenário, linhas { "11" } a { "15" })

# text
# c1: lunar-surface
seg-958f00c2d647 = A disponibilidade de posicionamento e temporização na superfície por local e estação nos polos lunares (<c1/>) é MODELLED, não validada: verificada face a uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-988e99fc26be = <s1>Anterior</s1>lunar-station-coverage

# text
seg-625c1973128e = <s1>Seguinte</s1>lunar-time-budget
