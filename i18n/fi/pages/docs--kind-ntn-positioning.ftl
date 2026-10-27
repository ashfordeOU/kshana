# docs--kind-ntn-positioning: translations (fi)

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-a849735fcc6e = Aihesivu: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Matalan Maan kiertoradan navigointi</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; tyyppi on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-c5478f572d21 = Perhesivu: <a1>Matalan Maan kiertoradan navigointi</a1>

seg-8dcdfc5da900 = Lähde: <c1/>

seg-d865fd8ceef6 = <c1/> (skenaariotyyppi)

seg-4f0edb786a35 = Paikannus 5G:n ei-maanpäällisen verkon (NTN) alalinkistä mobiilisatelliittipalvelun (MSS) S-kaistalla (3GPP-kaista n256, alalinkki { "2170" }–{ "2200" } MHz; oletuskantoaalto { "2172.5" } MHz): Cramér–Rao-raja (CRB) saapumisajalle, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), jossa beta on tasaisen OFDM-spektrin (B/sqrt({ "12" })) neliöllinen keskiarvo- (Gabor) kaistanleveys, ja kompleksisen sinin Dopplerille, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), kullekin signaalille (oletuksena { "5" } MHz:n New Radio -kanava, jossa { "4.5" } MHz on käytössä, ja { "200" } kHz:n kapeakaistakanava, jossa { "180" } kHz on käytössä); sitten minkä tahansa LEO-tähdistön yli alalinkin saapumisaikapaikannukset tuntemattomalla vastaanottimen kellolla (siemenlukuun perustuva, sigmana raja plus verkon synkronointivirhe), niiden PDOP ja muodollinen 3D-sigma sekä yhden satelliitin Doppler-paikannus pisimmän ylilennon yli korkeus kiinnitettynä. MODELLED: kaistanleveydestä rajaan -askel on oppikirjan suljettu muoto, tarkistettu tasaisten ja kaistarajoitettujen BPSK-spektrien numeerista integrointia vasten (sisäinen johdonmukaisuus, julkaistua laskuesimerkkiä ei ole kiinnitetty), ja paikannustarkkuus on raja monitiettömällä kanavalla ilmoitetulla synkronointivirheellä, ei saavutettu tulos.

seg-fea5da29df00 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: 5G NTN -paikannus { "2172.5" } MHz:llä, C/N0 { "38" }–{ "50" } dB-Hz, { "324" } satelliittia ({ "10.0" } näkyvissä) NR { "5" } MHz: { "4500" } kHz, CRB-alue { "0.26" }–{ "1.03" } m; mediaanin muodollinen 3D { "2.09" } m, RMS-virhe { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB-alue { "6.49" }–{ "25.85" } m; mediaanin muodollinen 3D { "25.94" } m, RMS-virhe { "26.73" } m yhden satelliitin Doppler-ylilento: { "53" } näytettä { "520" } s:n aikana, vaakavirhe { "1.9" } m

seg-145582d62c8c = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-7ff965e77d23 = Esimerkki <c1/> asettaa muun muassa:

seg-409755afa2dd = NR { "5" } MHz

seg-a99a71f7178a = NB { "200" } kHz

seg-d04c7f65307d = indeksi

seg-3a0cde9988c3 = Tuloksen nimike (moottorin oma): MODELLED paikannus Cramér–Rao-rajoista: kaistanleveydestä rajaan -askel on oppikirjan suljettu muoto (tarkistettu numeerista integrointia vasten, ei julkaistua laskuesimerkkiä vasten); tarkkuus on raja monitiettömällä kanavalla ilmoitetulla synkronointivirheellä, ei saavutettu tulos

seg-c200240dd65e = Moottorin kirjoittama kaavio skenaariolle scenarios/ntn-5g-positioning.toml, tyyppi ntn-positioning

seg-056b5f3c8201 = <b>VALIDATED</b> Cramér–Rao-raja saapumisajalle neliöllisestä keskiarvo- (Gabor) kaistanleveydestä, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), tasaiselle OFDM-spektrille (beta = B/sqrt({ "12" })), kaistarajoitetulle BPSK-spektrille (suljetun muodon osoittaja) tai mille tahansa spektrille kvadratuurilla Testit: <a1>leo_fusion_scenarios.rs</a1>.

seg-c188cecaf468 = <b>VALIDATED</b> Cramér–Rao-raja saapumisajalle neliöllisestä keskiarvo- (Gabor) kaistanleveydestä, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), tasaiselle OFDM-spektrille (beta = B/sqrt({ "12" }). Oraakkeli (ExternalDataset): Julkaistut laskuesimerkkiarvot (P1): Bachl, Lei ja Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), NR NTN:n yksittäisten SSB-rajojen toisto 3GPP TS { "38.211" } -SSB-kartasta Kshanan omilla numeerisilla funktioilla (W_rms { "1.9616" } vs. { "1.96" } MHz, sigma_t { "38.755" } vs. { "39" } us, sigma_f 100.79/87.28 vs. 101/87 Hz, sigma_rho 0.5970/0.5831 vs. 0.60/0.58 m, kukin puolen yksikön sisällä painetusta viimeisestä numerosta); Betz { "2001" } taulukko { "1" } BPSK-R:n neliölliset kaistanleveydet (1.128/3.477 vs

seg-baa462153341 = MODELLED paikannus Cramér–Rao-rajoista: kaistanleveydestä rajaan -askel on oppikirjan suljettu muoto (tarkistettu numeerista integrointia vasten, ei julkaistua laskuesimerkkiä vasten); tarkkuus on raja monitiettömällä kanavalla ilmoitetulla synkronointivirheellä, ei saavutettu tulos (tulos <c1/>)

seg-c4a9693d1191 = MODELLED: kaistanleveydestä rajaan -askel on oppikirjan suljettu muoto, tarkistettu tasaisten ja kaistarajoitettujen BPSK-spektrien numeerista integrointia vasten (sisäinen johdonmukaisuus, julkaistua laskuesimerkkiä ei ole kiinnitetty), ja paikannustarkkuus on raja monitiettömällä kanavalla ilmoitetulla synkronointivirheellä, ei saavutettu tulos. (tyyppiluettelo (<c1/>))

seg-e23e35aa1203 = Kaistanleveydestä rajaan -askel on oppikirjan suljettu muoto; paikannustarkkuus on MODELLED (raja monitiettömällä kanavalla, ei saavutettu tulos). (skenaariotiedoston kommentti, rivit { "12" } - { "13" })

seg-ccb921bf73b5 = <s1>Edellinen</s1>moonlight-service-volume

seg-467bd80c37f8 = <s1>Seuraava</s1>oem-interop
