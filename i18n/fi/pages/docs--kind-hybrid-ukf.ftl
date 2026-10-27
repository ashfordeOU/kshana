# docs--kind-hybrid-ukf: translations (fi)

seg-debc2f07db78 = true

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-7b2721b7588d = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Inertia-, fuusio- ja kvanttianturit</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-451a304052c4 = <b>MODELLED</b> Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN). Oraakkeli (ExternalDataset): Julkaistut CAI:n alkuperäisartikkelien numeeriset vektorit (Cheinet { "2008" } siirtofunktio; Peters/Freier-herkkyys): k_eff·T² täsmää tarkasti, shot-kohinan ASD yksipuolinen lattia ~{ "2" }× sisällä kustakin julkaistusta instrumentista (todelliset laitteet kantavat teknistä kohinaa kvanttilattian yläpuolella). Haarukka, ei pariteetti. { "0.30" } kierros { "2" } (ennakkorekisteröity fcb9ac64), havainto (jää tasolle MODELLED): pelkkä QPN-kiertokohina mitattua Gauguet ym.

seg-9955b1b1c018 = Kvanttiinertiaanturin suorituskyky on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Perhesivu: <a1>Inertia-, fuusio- ja kvanttianturit</a1>

seg-ea4498cc0324 = <b>VALIDATED</b> 15-tilainen virhetila-EKF, löyhästi kytketty (validoitu todellisella IMU/GNSS-ajolla NaveGo-työkalua vastaan); tiukasti kytketty pseudoetäisyys/Doppler-UKF ja kytketty kello+paik. Oraakkeli (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, ajettu työkaluna ympäristössä GNU Octave, ei koskaan linkitettynä): sen löyhästi kytketty ins_gnss omalla todellisella Ekinox IMU/GNSS -maa-ajoneuvoajollaan, molemmat ratkaisut pisteytettynä Ekinox-vertailuradalla. Molemmat suodattimet lukevat saman { "20" } Hz float32-syötteen, ja Kshana-konfiguraatio on kuvattu mekaanisesti aineiston julkaistuista parametreista. Kshana-suodattimen vaaka- ja pystypaikan RMS ja sen

seg-4b84d9846715 = Lähde: <c1/>

seg-d8da1a3f1798 = <c1/> (skenaariotyyppi)

seg-c6edf89eb8d4 = 17-tilainen hybridi kvantti+klassinen tiukasti kytketty GNSS/INS-UKF (MODELLED): { "15" } INS-virhetilaa + CAI-johdettu kiihtyvyysanturin harhakorjaus + 2-tilainen (vaihe+taajuus) kello q-parametrikellomoottorista, jota ohjaa haarukoitu CAI-virhemalli. Laatumittari on suodattimen itsejohdonmukaisuus (NEES + innovaatioiden valkoisuus vs χ²-rajat) — itsejohdonmukaisuusväite, EI todellisen maailman tarkkuustakuu. Vain simulaatio; ei TRL>{ "3" }, ei lentoperintöä, ei ulkoista validointia.

seg-d43a562eb9c2 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

seg-be1b25b8551d = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-139800576fb7 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-40773fa1ab5f = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-5e9c8b22ed24 = Kylmäatomi-(Rb-87 D2)-interferometrinen kiihtyvyysanturi; haarukoit

seg-4c8e2caeba5b = Ultravakaa/optinen laitteen sisäinen oskillaattoriluokka, valkoinen FM sigm

seg-2968660fa880 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/hybrid-ukf.toml, skenaariotyyppi hybrid-ukf

seg-5719161d0b2a = <b>MODELLED</b> Haarukoitu (paras/nimellinen/konservatiivinen) kylmäatomi-interferometrin suorituskyky — harhan epävakaus, nopeuden/kulman satunnaiskävely, asteikkokertoimen vakaus, kyselyaika. Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus: lainattu VRW-haarukka ristiintarkistettu CaiAccelerometer::accel_asd-fysiikkaa vasten + raaka dynaaminen alue laskettuna interferenssijuovan epäselvyysrajasta; luvut ovat MODELLED kirjallisuuskatsaushaarukoita (needs_source_confirmation), yhtään laitetta ei ole validoitu, ei validointihalo

seg-8632967dc5f8 = MODELLED SIMULAATIO. Suodattimen itsejohdonmukaisuus (NEES + innovaatioiden valkoisuus) haarukoiduilla CAI- ja kellokohinasyötteillä — itsejohdonmukaisuusväite, EI todellisen maailman tarkkuustakuu. Ei kenttä-/lentotuloksia; ei TRL>{ "3" }, ei lentoperintöä, ei ulkoista validointia. CAI-laitteisto on kumppanin omistama. (tulos <c1/>)

seg-e55c8e2bc619 = 17-tilainen hybridi kvantti+klassinen tiukasti kytketty GNSS/INS-UKF (MODELLED): { "15" } INS-virhetilaa + CAI-johdettu kiihtyvyysanturin harhakorjaus + 2-tilainen (vaihe+taajuus) kello q-parametrikellomoottorista, jota ohjaa haarukoitu CAI-virhemalli. (tyyppiluettelo (<c1/>))

seg-b06538ca3a8c = 17-tilainen hybridi kvantti + klassinen tiukasti kytketty GNSS/INS-UKF (MODELLED). (skenaariotiedoston kommentti, rivi { "1" })

seg-b5fc96916b4e = LAATUMITTARI — suodattimen itsejohdonmukaisuus (NEES + innovaatioiden valkoisuus), ainoa asia, minkä simulaatio voi rehellisesti väittää estimaattorista. Monte Carlo -ensemblessa, jonka totuus generoidaan täsmälleen suodattimen olettamasta kohinasta, yhdistettyjen NIS (valkoisuus)- ja NEES-keskiarvojen on osuttava niiden { "95" }% khiin neliö -kaistojen sisään. Tämä on ITSEJOHDONMUKAISUUSVÄITE, EI todellisen maailman tarkkuustakuu. (skenaariotiedoston kommentti, rivit { "21" }–{ "25" })

seg-91afdc2d3ee2 = REHELLISYYS: kaikki tässä on MODELLED / SIMULAATIO. CAI- ja kellosyötteet ovat haarukoituja, kirjallisuudesta edustavia arvoja, ei mitattua laitteistoa; CAI-laitteisto ja sen avainhenkilö (Key-Person) pysyvät kumppanin omistuksessa. Ei TRL>{ "3" }, ei lentoperintöä, ei ulkoista validointia. (skenaariotiedoston kommentti, rivit { "27" }–{ "29" })

seg-9b94bd3ce7df = Monte Carlo -siemenluvut, joiden yli johdonmukaisuusoraakkeli yhdistää, sekä suodattimen väärävirityskertoimet. { "24" } siemenlukua antavat ajopohjaiset khiin neliö -NEES-kaistat ({ "8" }*{ "24" } DOF), jotka ovat riittävän tiukat erottamaan viritetyn suodattimen väärin viritetystä pitäen ajon edullisena. Aseta q_factor / r_factor poispäin arvosta { "1.0" } virittääksesi suodattimen väärin ja katso johdonmukaisuusportin hylkäävän sen (q_factor skaalaa oletettua prosessikohinaa, r_factor oletettua mittauskoh (skenaariotiedoston kommentti, rivit { "44" }–{ "48" })

seg-496b17a8d3b9 = Aihesivu: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Aihesivu: <a1>QUANTUM.md</a1>

seg-963425965e64 = <s1>Edellinen</s1>hybrid-optical-rf

seg-437eb2e463b3 = <s1>Seuraava</s1>hybrid
