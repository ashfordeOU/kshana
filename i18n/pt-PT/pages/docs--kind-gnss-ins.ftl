# docs--kind-gnss-ins: translations (pt-PT)

# text
seg-b054c73f22e5 = sem valor

# text
seg-ee7dd15019d0 = Página do tópico: <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN). Referência independente (ExternalDataset): Vetores numéricos de artigos primários publicados de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincide exatamente, o piso unilateral de ASD de ruído de disparo dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais têm ruído técnico acima do piso quântico). Um intervalo, não uma paridade. { "0.30" } ronda { "2" } (fixada antecipadamente fcb9ac64), um achado (permanece MODELLED): o ruído de rotação somente por QPN contra o medido por Gauguet et al.

# text
seg-9955b1b1c018 = O desempenho de sensores inerciais quânticos é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
# c1: docs/kinds/by-kind/gnss-ins.md
seg-fd8fad481c81 = Fonte: <c1/>

# text
# c1: gnss-ins
seg-e726a6d74d81 = <c1/> (tipo de cenário)

# text
seg-38df285a3f25 = EKF de estado de erro GNSS/INS com acoplamento fraco e forte.

# text
# c1: scenarios/gnss-ins.toml
seg-e1e235215947 = Uma execução de <c1/> resume-se assim: cenário c55a6246bd6f | gnss-ins | RMS na interrupção quântico fundido 1.9m contra livre 130.7m (hold 60s, disp { "1.00" }) | clássico fundido 3.1m contra livre 314.3m (hold 60s, disp { "1.00" })

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
seg-e3112eac77af = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: fix_interval_s
# c2: sigma_pos_m
# c3: sigma_vel_mps
# c4: lat_deg
# c5: lon_deg
# c6: alt_m
# c7: trajectory
# c8: tight
seg-6c128eb60a91 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/gnss-ins.toml
seg-79c75d3e461d = O exemplo <c1/> define, entre outros:

# text
seg-ca448daf5ec7 = nominal

# text
seg-49f2fa051719 = denied

# text
seg-327a2c4885bd = Unidade inercial MEMS/quartzo de grau tático: viés residual maior

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# attr:alt
seg-7d993b676006 = O gráfico que o motor gera para scenarios/gnss-ins.toml, tipo de cenário gnss-ins

# text
seg-ea4498cc0324 = <b>VALIDATED</b> EKF de estado de erro de 15 estados, com acoplamento fraco (validado num percurso real de IMU/GNSS contra o NaveGo); um UKF de pseudodistância/Doppler com acoplamento forte e um relógio+pos acoplado. Referência independente (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, executado como ferramenta no GNU Octave, nunca ligado): o seu ins_gnss de acoplamento fraco no próprio percurso real de veículo terrestre com IMU/GNSS Ekinox, ambas as soluções pontuadas contra a trajetória de referência do Ekinox. Os dois filtros leem a mesma entrada float32 de { "20" } Hz, e a configuração do Kshana é mapeada mecanicamente a partir dos parâmetros publicados do conjunto de dados. O RMS de posição horizontal e vertical do Kshana e o seu

# text
seg-742a29ca1fb7 = Página do tópico: <a1>TEST-BENCH.md</a1>

# text
seg-f3cc3d82aba8 = <s1>Anterior</s1>fusion

# text
seg-af503aa1d900 = <s1>Seguinte</s1>gnss-sim
