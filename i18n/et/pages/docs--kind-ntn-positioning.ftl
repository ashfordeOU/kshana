# docs--kind-ntn-positioning: translations (et)

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
seg-a3697ad561db = Hz

# text
seg-a849735fcc6e = Teemaleht: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Madala Maa orbiidi navigatsioon</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README peatükk Evidence).

# text
seg-c5478f572d21 = Perekonna leht: <a1>Madala Maa orbiidi navigatsioon</a1>

# text
# c1: docs/kinds/by-kind/ntn-positioning.md
seg-8dcdfc5da900 = Allikas: <c1/>

# text
# c1: ntn-positioning
seg-d865fd8ceef6 = <c1/> (stsenaariumi liik)

# text
seg-4f0edb786a35 = Positsioneerimine 5G mittemaapealse võrgu (NTN) allalingi põhjal mobiilsatelliitteenuse (MSS) S-sagedusalas (3GPP riba n256, allalink { "2170" } kuni { "2200" } MHz; vaikimisi kandesagedus { "2172.5" } MHz): Cramér-Rao piir (CRB) saabumisajale, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), kus beta on lameda OFDM-spektri ruutkeskmine (Gabori) ribalaius (B/sqrt({ "12" })), ning kompleksse toonvõnke Dopplerile, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), iga signaali jaoks (vaikimisi { "5" } MHz New Radio kanal, millest { "4.5" } MHz on hõivatud, ja { "200" } kHz kitsasribakanal, millest { "180" } kHz on hõivatud); seejärel mis tahes LEO konstellatsiooni kohta allalingi saabumisaja määrangud tundmatu vastuvõtja kellaga (algväärtustatud, sigmana piir pluss võrgu sünkroniseerimisviga), nende PDOP ja formaalne 3D sigma ning ühe satelliidi Doppleri määrang pikima läbimise kohta, kõrgus fikseeritud. MODELLED: ribalaiuselt piirile üleminek on õpikuline kinnine kuju, kontrollitud lameda ja ribapiiratud BPSK spektri arvulise integreerimisega (sisemine kooskõla, avaldatud läbitöötatud väärtust kinnitatud ei ole), ja positsioneerimistäpsus on piir mitmeteeleviveaba kanalil nimetatud sünkroniseerimisveaga, mitte saavutatud tulemus.

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-fea5da29df00 = Ühe <c1/> käivituse kokkuvõte: 5G NTN positsioneerimine sagedusel { "2172.5" } MHz, C/N0 { "38" } kuni { "50" } dB-Hz, { "324" } satelliiti ({ "10.0" } nähtaval) NR { "5" } MHz: { "4500" } kHz, CRB ulatus { "0.26" } kuni { "1.03" } m; mediaanne formaalne 3D { "2.09" } m, RMS-viga { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB ulatus { "6.49" } kuni { "25.85" } m; mediaanne formaalne 3D { "25.94" } m, RMS-viga { "26.73" } m ühe satelliidi Doppleri läbimine: { "53" } valimit { "520" } s jooksul, horisontaalviga { "1.9" } m

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-145582d62c8c = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-7ff965e77d23 = Näide <c1/> määrab muu hulgas:

# text
seg-409755afa2dd = NR { "5" } MHz

# text
seg-a99a71f7178a = NB { "200" } kHz

# text
seg-d04c7f65307d = indeks

# text
seg-3a0cde9988c3 = Tulemuse silt (mootori oma): MODELLED positsioneerimine Cramér-Rao piiridest: ribalaiuselt piirile üleminek on õpikuline kinnine kuju (kontrollitud arvulise integreerimisega, mitte avaldatud läbitöötatud väärtuse vastu); täpsus on piir mitmeteeleviveabal kanalil nimetatud sünkroniseerimisveaga, mitte saavutatud tulemus

# attr:alt
seg-c200240dd65e = Diagramm, mille mootor kirjutab failile scenarios/ntn-5g-positioning.toml, liik ntn-positioning

# text
seg-056b5f3c8201 = <b>VALIDATED</b> Cramér-Rao piir saabumisajale ruutkeskmisest (Gabori) ribalaiusest, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), lameda OFDM-spektri (beta = B/sqrt({ "12" })), ribapiiratud BPSK spektri (kinnise kujuga lugeja) või mis tahes spektri jaoks kvadratuuri abil Testid: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-c188cecaf468 = <b>VALIDATED</b> Cramér-Rao piir saabumisajale ruutkeskmisest (Gabori) ribalaiusest, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), lameda OFDM-spektri jaoks (beta = B/sqrt({ "12" }). Sõltumatu etalon (sõltumatu etalon; ExternalDataset): avaldatud läbitöötatud väärtused (P1): Bachl, Lei ja Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), NR NTN-i üksiku SSB piirid, mis on reprodutseeritud 3GPP TS { "38.211" } SSB kaardilt Kshana enda arvfunktsioonide kaudu (W_rms { "1.9616" } vs { "1.96" } MHz, sigma_t { "38.755" } vs { "39" } us, sigma_f 100.79/87.28 vs 101/87 Hz, sigma_rho 0.5970/0.5831 vs 0.60/0.58 m, kõik poole ühiku piires trükitud viimasest numbrist); Betz { "2001" } tabel { "1" } BPSK-R ruutkeskmised ribalaiused (1.128/3.477 vs

# text
# c1: label
seg-baa462153341 = MODELLED positsioneerimine Cramér-Rao piiridest: ribalaiuselt piirile üleminek on õpikuline kinnine kuju (kontrollitud arvulise integreerimisega, mitte avaldatud läbitöötatud väärtuse vastu); täpsus on piir mitmeteeleviveabal kanalil nimetatud sünkroniseerimisveaga, mitte saavutatud tulemus (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-c4a9693d1191 = MODELLED: ribalaiuselt piirile üleminek on õpikuline kinnine kuju, kontrollitud lameda ja ribapiiratud BPSK spektri arvulise integreerimisega (sisemine kooskõla, avaldatud läbitöötatud väärtust kinnitatud ei ole), ja positsioneerimistäpsus on piir mitmeteeleviveabal kanalil nimetatud sünkroniseerimisveaga, mitte saavutatud tulemus. (liikide kataloog (<c1/>))

# text
seg-e23e35aa1203 = Ribalaiuselt piirile üleminek on õpikuline kinnine kuju; positsioneerimistäpsus on MODELLED (piir mitmeteeleviveabal kanalil, mitte saavutatud tulemus). (stsenaariumifaili kommentaar, read { "12" }–{ "13" })

# text
seg-ccb921bf73b5 = <s1>Eelmine</s1>moonlight-service-volume

# text
seg-467bd80c37f8 = <s1>Järgmine</s1>oem-interop
