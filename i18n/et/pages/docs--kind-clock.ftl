# docs--kind-clock: translations (et)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/clock.md
seg-33555d61ddc6 = Allikas: <c1/>

# text
# c1: clock
seg-618393657d01 = <c1/> (stsenaariumi liik)

# text
seg-c61e88721556 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kellad, ajastus ja holdover</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-78cba87823f7 = Kella holdover võrreldes spetsifikatsiooniga; valikuline Monte Carlo ansambel (jooksud > { "1" }).

# text
# c1: scenarios/clock-ensemble.toml
seg-dd2ad570a6c9 = Ühe <c1/> jooksu kokkuvõte: scenario 91d2b6d10d14 | { "200" } jooksu | kvant-holdover 6600s [6600-6600] p95 8.78e-4ns turvalisus n/a (rünnakut ei ole) | klassikaline holdover 844s [220-2130] p95 167.0ns turvalisus n/a (rünnakut ei ole)

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
seg-51820163de28 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
# c2: integrity
seg-80fe14eb5e79 = Valikulised väljad: <c1/>, <c2/>

# text
# c1: scenarios/clock-ensemble.toml
seg-807e7c5a2565 = Näide <c1/> määrab muu hulgas:

# text
seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC andmeleht sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Strontsiumi optiline võrekell, kosmosele suunatud eesmärk sigma_y

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# attr:alt
seg-cb0b7da83f5c = Diagramm, mille mootor kirjutab failile scenarios/clock-ensemble.toml, liik clock

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> Kella liigi valikuline [integrity] jaotis (clock_integrity::run): väljaöeldud jaamast ja konstellatsiooni eelseadistustest (geometry::sky_geometry), igal terviklikkuse epohhil, kui GNSS-i ajajoon ei ole keelatud, hetktõmmis RAIM (raim::snapshot_ Testid: <a1>clock_integrity.rs</a1>.

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: üks parsimiskiht, mis muudab RINEX-i kellafaili (ühe nimetatud kella AS/AR kirjed, versioonid { "2" } ja { "3.00" } kuni { "3.04" }), TimeLab-stiilis ASCII faasi- või sagedusloo või TAPR TICC ajatempli- või intervallilogi ühtseks pha Testid: <a1>clock_log_allantools.rs</a1>.

# text
seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input vormingutega ptp4l, phc2sys, ts2phc, chrony-tracking ja chrony-statistics: linuxptp servorea logitud nihe (ns, rea enda nurksulgudes ajatempel, lugemid enne, kui servo esimest korda teatab s2, jäetud välja a

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Alani / modifitseeritud / Hadamardi hälve + astmeseaduse müra tuvastus χ² usaldusvahemikega. Oraakel (sõltumatu etalon) (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32 etalonhälbed NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Suletud kujul libisemisvea kasv + holdover läveni; kvantkellade klassid. Oraakel (sõltumatu etalon) (ReferenceImpl): Mitmeastmeline clock_state kovariatsioonirekursioon (sama koodibaasi ristkontroll); aluseks olev libisemisdispersiooni ja holdover-i inversiooni tuum on väliselt valideeritud scipy vastu (vt „Clock-holdover coast-variance & threshold inversion“). Klassipõhised punase müra põranda holdover-i arvud jäävad MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> 3-olekuline (faas/sagedus/triiv) van-Loani Kalmani kell, Joseph-stabiliseeritud. Oraakel (sõltumatu etalon) (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), F funktsiooniga scipy.linalg.expm ja Q Van-Loani { "1978" } plokkmaatriksiga — sõltumatu etalonteostus, mis reprodutseerib kshana täieliku filtri trajektoori. Teostustevaheline kooskõla: kella füüsikat / Alani kalibreerimist ei ole väliselt valideeritud, seega jääb see MODELLED. { "0.30" } väline võrdlus, tulemus (jääb MODELLED): IGS-i lõplikel { "30" } s kelladel { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> Kellaga toetatud χ², RAIM, AGC, SQM ühendatud epohhikaupa turvalisuse FoM. Oraakel (sõltumatu etalon) (ExternalDataset): TEXBAT-i stsenaariumi parameetrid (Humphreys { "2012" }) — iseloomustus, mitte fikseeritud vektorid. { "0.30" } väline võrdlus, tulemus (jääb MODELLED): JammerTest { "2024" } (Bleik; GPL-3.0 andmed) ei tõstnud vaatlustaseme monitorid (kellaga toetatud hii-ruut, RAIM, lahenduse ebaõnnestumine) alarmi { "10" } s jooksul ühegi { "8" } hinnatava avaldatud spuufimise alguse suhtes (kus alguseelne aken oli puhas, tuli esimene alarm { "10.2" } kuni { "39" } s pärast pu

# text
seg-e12f672ae71d = GNSS-ita kella holdover on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = Pardakella oleku hindamine on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = Spuufimise tuvastamine on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Perekonna leht: <a1>Kellad, ajastus ja holdover</a1>

# text
seg-ee7dd15019d0 = Teemaleht: <a1>CAMPAIGNS.md</a1>

# text
seg-46ed0b786244 = Teemaleht: <a1>RECEIVER-TRUST.md</a1>

# text
seg-e06f9a5a0291 = <s1>Eelmine</s1>cislunar-observability

# text
seg-aba9395185fa = <s1>Järgmine</s1>combined-altpnt
