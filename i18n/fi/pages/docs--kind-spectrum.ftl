# docs--kind-spectrum: translations (fi)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Ei tarjota — Kshana mallintaa signaalin suorituskykyä, ei hyötykuorma- tai antennilaitteistoa. Oraakkeli (NoneKind): ei mitään: kumppanin omistama osa-alue, jolla ei ole moduulia eikä testiä tarkoituksella

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-304496607bd7 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Häirintä (jamming), harhautus (spoofing) ja spektri</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-5d23d7f8f872 = Perhesivu: <a1>Häirintä (jamming), harhautus (spoofing) ja spektri</a1>

seg-f85a85f0c7e4 = MHz

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

seg-3319b18ac61f = ja { "1" } muu matriisissa.

seg-9ca82c79430e = <b>MODELLED</b> Tyyppi <c1/> laajennettuna L-kaistan ulkopuolelle: kaistat annetaan esiasetettuna signaalisuunnitelmana (piirretty kaikilla komponenteilla, kaistarajoitettu lähetyskaistanleveyteen, C/N0 ja J/S viitattuna seurattuun komponenttiin) tai mukautettuna kantoaaltona ja modulaationa Testit: <a1>leo_signal_reference.rs</a1>.

# text
# c1: docs/kinds/by-kind/spectrum.md
seg-ab8fe1c3cb79 = Lähde: <c1/>

# text
# c1: spectrum
seg-10a4479141b5 = <c1/> (skenaariolaji)

# text
seg-fef00c827c6a = L-kaistan spektrimalli ja vesiputous: koko GNSS:n L-kaista yhtenä tehospektritiheytenä (PSD), taajuus vaakasuunnassa ja aika alaspäin, käsikirjoitetun häirintälähettimien aikajanan yli. SIGNAALIT: GPS L1 C/A ja L2C (BPSK({ "1" })), Galileo E1 open service (MBOC(6,1,1/11) tai BOC({ "1,1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), kukin kantoaallollaan rajapintamäärittelyn vähimmäisvastaanottotehoilla (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), ellei toisin ohiteta; GLONASSia, BeiDouta ja Galileo E6:tä ei mallinneta. HÄIRINTÄLÄHETTIMET: jatkuva siniaaltoääni, tasainen kapeakaistainen kohina, lineaarinen saha-aaltochirppi ja kaistan oman modulaation mukainen laajakaistakohina, kullakin keskitaajuus, kaistanleveys, vastaanotettu teho (suoraan tai EIRP ja etäisyys jamming-lajin vapaan tilan vaimennuksen kautta) sekä päälle- ja poiskytkentäajat. Jokainen häirintälähetin pisteytetään jokaista kaistaa vastaan spektrierotuskertoimellaan kappa vastaanottimen kaistanleveyden yli, ja (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; yhdelle häirintälähettimelle tämä on sama kuin jamming-lajin häirinnänestoyhtälö, kun Q = 1/(R_c kappa), ja raportti sisältää tämän ristiintarkistuksen (sekä jamming-lajin edustavan Q-arvon vieressä). Kohinalattia on k T_sys, kun T_sys = T_ant + { "290" } K (F - { "1" }). Vesiputous keskiarvoistaa jokaisen solun sen lokeron ja rivin yli (chirppien osalta tarkasti, kokonaiset pyyhkäisyt ja osittainen; rivin aikana kytkeytyvät häirintälähettimet työsuhteensa mukaan), joten C/N0-aikajana ja kuva tulevat samoista luvuista; result.json sisältää tehoissa lohkokeskiarvoistetun ruudukon, kaistakohtaiset C/N0:n ja J/S:n riveittäin sekä häirintälähetintä ja kaistaa kohden SSC:n, Q:n, J/S:n, kaistansisäisen J/S:n ja vakaan C/N0:n. Valinnainen [iq]: malli piirrettynä kompleksisena IQ:na yhdellä hetkellä, kirjoitettuna SigMF-tallenteeseen (cf32_le tai ci16_le) ja luettuna siitä takaisin sekä verrattuna Welch-estimaattiin. Valinnainen [recording] (natiivirakennelmat): oikean SigMF-tallenteen Welch-PSD mallin vieressä. VALIDATED: signaalien PSD:t oppikirjojen pääkeilan leveyksiä vastaan (BPSK(n) 2n x { "1.023" } MHz nollasta nollaan; BOC({ "1,1" })-keilat keskitettyinä kohtiin +/-1.023 MHz) ja spektrierotuskertoimet Parsevalin suljettuja muotojaan sekä Kaplanin ja Hegartyn arvoja Q = { "1" } (CW) ja { "1.5" } (sovitettu) vastaan. MODELLED: häirintälähettimien tehot, aikajana, etupään kaistanleveydet, jatkuvaspektrinen (ei koodiviivoja) käsittely sekä AGC:n, blankkauksen ja antennikuvion puuttuminen.

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-92f1d6d2c0f2 = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: scenario spectrum | { "5" } bands | { "3" } jammers | noise floor -202.0 dBW/Hz | worst band gps-l1ca min C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-ed3a383d6f1e = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-fb332c77fd0e = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-df78607f9cdb = Tuloksen tunniste (moottorin oma): MODELLED: L-kaistan tehospektritiheys, joka on rakennettu suljetun muodon signaalispektreistä (VALIDATED oppikirjojen pääkeilan leveyksiä ja spektrierotuskertoimia vastaan), häirintälähettimien spektreistä ja kT-kohinalattiasta ja jonka spektrierotuskerroin pelkistää J/S:ksi ja efektiiviseksi C/N0:ksi. Häirintälähettimien tehot, t

# attr:alt
seg-ea1678eb9e84 = Moottorin kirjoittama kaavio skenaariolle scenarios/l-band-waterfall-jamming.toml, laji spectrum

# text
seg-ce0afea7b030 = <b>VALIDATED</b> GPS L1 C/A:n ja L2C:n (BPSK({ "1" })), GPS L5:n ja Galileo E5a:n (BPSK({ "10" })), sini-BOC({ "1,1" }):n ja Galileo E1 MBOC(6,1,1/11):n yksikköalaiset tehospektritiheydet (navsignal::Modulation::psd, MBOC-variantilla täydennettynä), niiden numeerisesti paikannetut nollat ja

# text
# c1: spectrum
seg-7e315c5675d0 = <b>MODELLED</b> Laji <c1/>: L-kaistan tehospektritiheyden taajuus-aika-ruudukko (terminen lattia k T_sys, kun T_sys = T_ant + { "290" } K (F - { "1" }), signaalit rajapintamäärittelyn vähimmäisvastaanottotehoillaan sekä jatkuva siniaalto, kapeakaistai

# text
seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: Signal Metadata Format -tallenteiden luku ja kirjoitus (JSON .sigmf-meta ytimen global-, captures- ja annotations-kentin; raaka .sigmf-data muodossa cf32_le, ci16_le tai ci8, kokonaislukudekooderit jaettuna kohteen realdata::iqif::load_iq kanssa), kaikki s

# text
seg-4e35cc861b15 = <b>VALIDATED</b> GPS L1 C/A:n ja L2C:n (BPSK({ "1" })), GPS L5:n ja Galileo E5a:n (BPSK({ "10" })), sini-BOC({ "1,1" }):n ja Galileo E1 MBOC(6,1,1/11):n yksikköalaiset tehospektritiheydet (navsignal::M. Oraakkeli (ExternalDataset): Julkaistut oppikirja-arvot: BPSK(n)-pääkeila 2n x { "1.023" } MHz nollasta nollaan ja häirinnänestokertoimet Q = { "1" } kapeakaistaiselle (CW) häirintälähettimelle ja Q = { "1.5" } C/A:han sovitetulle hajaspektrihäirintälähettimelle (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed., kohta { "9.4" }); BOC(m,n)-pääkeilat keskitettyinä kohtiin plus tai miinus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); the

# text
# c1: spectrum
# c2: jamming
seg-287de49e90a8 = <b>MODELLED</b> Laji <c1/>: L-kaistan tehospektritiheyden taajuus-aika-ruudukko (terminen lattia k T_sys, kun T_sys = T_ant + { "290" } K (F - { "1" }), signaalit at the. Oraakkeli (InternalConsistency): Palautus olemassa olevan lajin <c2/> häirinnänestoyhtälöön ja linkkibudjettiin (sama koodi, kutsuttuna samoilla syötteillä) sekä k T0 F -kohinalattian suljettuun muotoon. Alla olevat signaalispektrit ovat yllä oleva validoitu rivi; häirintälähettimien tehot, aikajana ja etupään kaistanleveydet ovat skenaarion syötteitä, spektrit ovat jatkuvia (ei hajautuskoodin viivoja), eikä automaattinen vahvistuksen säätö, blankkaus tai antennikuvio vaikuta j

# text
seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: Signal Metadata Format -tallenteiden luku ja kirjoitus (JSON .sigmf-meta ytimen global-, captures- ja annotations-kentin; raaka .sigmf-data muodossa cf32_le, ci1. Oraakkeli (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) samalla jaksollisella Hann-ikkunalla, limityksellä, tiheysskaalauksella, ilman trendin poistoa ja kaksipuolisella keskiarvolla: jokainen lokero { "1e-12" } suhteellisen virheen sisällä (havaittu { "6.0e-14" }) { "27" } tapauksessa, segmenttien lukumäärät otettu scipyn omasta spektrogrammista. sigmf-python { "1.13.0" } (LGPL-3.0, ajettu työkaluna) kirjoittaa viisi kolmannen osapuolen tallennetta (cf32_le, ci16_le, ci8, kaksi annotaatioita sisältävää tallennetta, nollasta poikkeava fir

# text
# c1: not_modelled[0]
seg-0cbbe567f1c8 = hajautuskoodin viivarakenne (esimerkiksi C/A:n { "1" } kHz:n viivat): äänet pisteytetään tasaista verhokäyrää vastaan (tulos <c1/>)

# text
# c1: not_modelled[1]
seg-2efdae3f5764 = automaattinen vahvistuksen säätö, kvantisointi, pulssien blankkaus ja loviosuodatus (tulos <c1/>)

# text
# c1: not_modelled[2]
seg-f3e58705c9a2 = vastaanottoantennin kuvio kohti häirintälähetintä yhtä vahvistuslukua pidemmälle (tulos <c1/>)

# text
# c1: not_modelled[3]
seg-c0d379cb1ab3 = järjestelmänsisäinen monikäyttöhäiriö yhden kaistan satelliittien välillä (tulos <c1/>)

# text
# c1: not_modelled[4]
seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 ja Galileo E6 (tulos <c1/>)

# text
# c1: not_modelled[5]
seg-249d8a46f95a = suunnitellun signaalin päästöt sen lähetyskaistan ulkopuolella: sen spektri katkaistaan siellä, joten mikään kaistan ulkopuolinen päästö ei yllä viereiselle kaistalle (tulos <c1/>)

# text
# c1: not_modelled[6]
seg-cc83c047f02a = chirpin vaikutus silmukkaan pyyhkäisynopeuksilla, jotka ovat verrattavissa silmukan kaistanleveyteen: sen C/N0 käyttää rivin keskiarvoistettua spektriä (tulos <c1/>)

# text
# c1: label
seg-7155706bc289 = MODELLED: L-kaistan tehospektritiheys, joka on rakennettu suljetun muodon signaalispektreistä (VALIDATED oppikirjojen pääkeilan leveyksiä ja spektrierotuskertoimia vastaan), häirintälähettimien spektreistä ja kT-kohinalattiasta ja jonka spektrierotuskerroin pelkistää J/S:ksi ja efektiiviseksi C/N0:ksi. Häirintälähettimien tehot, aikajana ja etupään kaistanleveydet ovat skenaarion syötteitä, eivät mittauksia. (tulos <c1/>)

# text
seg-95879767c438 = Aihesivu: <a1>LEO-SIGNAL.md</a1>

# text
seg-ce69d8d2d9d1 = <s1>Edellinen</s1>space-weather

# text
seg-ac2c9c25fbb6 = <s1>Seuraava</s1>spoof-detect

seg-a349aa76b0ed = PARTNER
