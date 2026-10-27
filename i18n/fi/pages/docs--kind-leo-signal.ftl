# docs--kind-leo-signal: translations (fi)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-1918189ac2bf = ppm

seg-49964654d5f4 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Matalan Maan kiertoradan navigointi</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; tyyppi on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-c5478f572d21 = Perhesivu: <a1>Matalan Maan kiertoradan navigointi</a1>

seg-ae15d15bf151 = Aihesivu: <a1>LEO-PASS.md</a1>

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sini-integraali (sine_integral), BPSK-R:n tehon osuus kaksipuolisen kaistan sisällä suljetussa muodossa (bpsk_power_in_band_closed_form), kaistarajoitettu. Oraakkeli (ExternalDataset): Ulkoisesti lukittu: { "90.3" } prosenttia pääkeilan tehosta, koherentti early-late-jitter ilmoitetussa toimintapisteessä, sini-integraalin taulukka-arvot ja BPSK:n itse-spektrierotuskerroin 2/({ "3" } R_c) nollasiirtymällä. Vain sisäisiä ristiintarkistuksia, ei ulkoista validointia: kaistarajoitetun BPSK:n Gabor-kaistanleveyden suljettu muoto ja sen asymptootti sekä siirretyn BPSK:n spektrierotuskerroin nollasta poikkeavilla siirtymillä, molemmat

seg-faf2775f3003 = <b>MODELLED</b> Tyyppi <c1/>: parametrisoidut signaalisuunnitelmat (kaista, lähetyskaistanleveys, ITU-allokaatio; hankinta-, data- ja pilottikomponentit BPSK(n)-, BOC(m,n)-, MB. Oraakkeli (InternalConsistency): Yllä olevien kahden rivin validoidut suljetut muodot, neliölaki-väärän hälytyksen identiteetti P_d(snr = { "0" }) = P_fa ja Holmesin keskimääräinen hankinta-aika sekä palautuminen spectrum-tyypin omaan SSC-ketjuun (sama Jammer::ssc-koodi). Suunnitelmat itse ovat syötteitä: esiasetukset, jotka on merkitty REPRESENTATIVE tai WORKSHOP, eivät ole julkaistuja spesifikaatioita, parannettu Feher-QPSK, code shift keying ja OFDM-spektrit approksimoidaan, ja muoto

seg-051999733048 = Lähde: <c1/>

seg-16ae2a08d3c8 = <c1/> (skenaariotyyppi)

seg-97b8d07150d4 = LEO-PNT-signaalisuunnitelmat: parametrisoidut matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys (PNT) -signaalit mille tahansa järjestelmälle, kaistalle ja rakenteelle. SIGNAALI on kaista (keskitaajuus, lähetyskaistanleveys, ITU-allokaatio RNSS/RDSS/MSS/EESS/non-RNSS/other) ja komponentit (hankinta, data, pilotti; mikä tahansa osajoukko), kullakin modulaatio (BPSK(n) murtoluku-n:llä, BOC(m,n), MBOC({ "6,1" },p) tai tasainen OFDM-tyyppinen kaista), tehoosuus, valinnaiset FDMA-alikantoaaltosiirtymät, koodin pituus ja datanopeus. Signaalit tulevat käännökseen sisällytetyistä julkisista esiasetustiedostoista (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; kullakin lähde-URL ja jokainen julkaisematon arvo merkitty REPRESENTATIVE) tai kirjoitetaan sisäisesti. SIGNAALIA KOHDEN: kaistarajoitettu tehospektritiheys ja kunkin komponentin tehosta lähetyskaistan läpäisevä osuus (BPSK:n suljettu muoto numeerisen arvon rinnalla), RMS-kaistanleveys (Gabor), viivelukitun silmukan koodinseurannan terminen jitter C/N0:n ja early-late-välin funktiona Betzin ja Kolodziejskin { "2009" } kaistarajoitetusta koherentista (tai epäkoherentista) early-late-kaavasta rajoittamattoman kaistan oppikirjamuodolla ja katoavan välin Gabor-rajalla, etäisyysmittaustarkkuus metreinä, hankinnan hakuavaruus (Doppler-lokerot radan suurimmasta Dopplerista sekä oskillaattori- ja käyttäjätermit, kertaa koodilokerot), neliölakiin perustuva havaitsemistodennäköisyys sekä keskimääräinen sarja- ja koodirinnakkaishankinta-aika, signaalin spektrierotuskerroin signaaleihin GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b ja E5 AltBOC ja kunkin niistä signaaliin C/N0-heikkenemisellä, sekä CW-, laajakaistainen ja sovitettu J/S, jonka seurattu komponentti sietää, spectrum-tyypin oman SSC-koneiston avulla. KAISTAVERTAILU: ensimmäisen kertaluvun ionosfääriviive ({ "40.3" } TEC/f^{ "2" }), vapaan tilan häviö, etäisyysmittaustarkkuus yhtä suurella C/N0:lla ja yhtä suurella EIRP:llä sekä häirinnän sieto. Valinnaiset MUOTOTARKISTUKSET vertaavat suunnitelman spektriä kuvattuun mittaukseen (MODELLED johdonmukaisuus). VALIDATED: BPSK:n teho kaistalla ({ "90.3" } % pääkeilassa) ja Gabor-kaistanleveyden suljetut muodot, kaistarajoitettu jitter palautuu oppikirjan koherenttiin early-late-muotoon ja sen Gabor-rajaan, siirretyn BPSK:n spektrierotuskerroin Parsevalin suljettua muotoa vastaan, AltBOC-spektrin yksikköpinta-ala sekä suurin LEO-Doppler julkaistuja Xona Pulsar (32-34 kHz) ja Iridium ({ "36" } kHz) -lukuja vastaan. MODELLED: jokainen suunnitelma, tehojako, C/N0 ja häirintätaso; EFQPSK-, CSK- ja OFDM-spektrit approksimoidaan.

seg-37e5fdff9d4d = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: skenaario leo-signal | { "5" } signaalia | kohinalattia -202.0 dBW/Hz | hienoin etäisyysmittaus generic-c-wide { "0.022" } m arvolla { "45.0" } dB-Hz

seg-b538d3ff9fdb = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-6aaf62f55e65 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-9fd02351d844 = ms

seg-05e8854de548 = chip

seg-d12bc1d2b815 = coherent

seg-0f29946fe4fb = Tuloksen nimike (moottorin oma): MODELLED: parametrisoidut matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys (PNT) -signaalisuunnitelmat, kaistarajoitettuina lähetyskaistanleveyteensä. Taustalla olevat suljetut muodot ovat VALIDATED (BPSK:n teho kaistalla ja Gabor-kaistanleveys, kaistarajoitettu early-late-koodinseurannan jitter, joka palautuu oppikirjan

seg-8bf45b6989d1 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-band-trade.toml, tyyppi leo-signal

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: sini-integraali (sine_integral), BPSK-R:n tehon osuus kaksipuolisen kaistan sisällä suljetussa muodossa (bpsk_power_in_band_closed_form), kaistarajoitettu BPSK:n Gabor-kaistanleveys suljetussa muodossa (bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: suurin satelliitin Doppler yläpuolelta kulkevalla ohituksella korkeuskulmamaskissa ympyräradalle, v R_E cos(el) / (R_E + h) kertaa f / c, kunkin esiasetuksen omasta kantoaallosta ja ratakorkeudesta; tyyppi <c1/> lisää o

seg-e0a4f53c5a96 = <b>MODELLED</b> Tyyppi <c1/>: parametrisoidut signaalisuunnitelmat (kaista, lähetyskaistanleveys, ITU-allokaatio; hankinta-, data- ja pilottikomponentit BPSK(n)-, BOC(m,n)-, MBOC- tai tasaisilla spektreillä, tehojaot, FDMA-alikantoaallot, koodien pituudet ja datanopeudet Testit: <a1>leo_signal_reference.rs</a1>.

seg-9ca82c79430e = <b>MODELLED</b> Tyyppi <c1/> laajennettuna L-kaistan ulkopuolelle: kaistat annetaan esiasetettuna signaalisuunnitelmana (piirretty kaikilla komponenteilla, kaistarajoitettu lähetyskaistanleveyteen, C/N0 ja J/S viitattuna seurattuun komponenttiin) tai mukautettuna kantoaaltona ja modulaationa Testit: <a1>leo_signal_reference.rs</a1>.

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: suurin satelliitin Doppler yläpuolelta kulkevalla ohituksella korkeuskulmamaskissa ympyräradalle, v R_E cos(el) / (R_E + h) kertaa f / c,. Oraakkeli (ExternalDataset): Julkaistut luvut: Xona Pulsar X1:n suurin Doppler { "32" } – { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridiumin Doppler enintään +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Maan pyöriminen on jätetty pois, mikä siirtää lukua enintään noin { "2.3" } kHz; molemmat julkaistut luvut täyttyvät ilman sitä.

seg-1ab79cdbd269 = enhanced Feher QPSK:n, code shift keyingin ja OFDM:n tarkat spektrit: tilalla on suorakulmasirun BPSK-verhokäyrä tai tasainen kaista, kuten kukin esiasetus ilmoittaa (tulos <c1/>)

seg-0561c3ed88fb = levityskoodin viivarakenne ja koodien välinen monikäyttöristikorrelaatio (tulos <c1/>)

seg-8b4df054a7b3 = lähetys- ja vastaanottosuodattimet idealisoitua suorakulmaista kaistanrajausta pidemmälle lähetyskaistanleveydellä: ei kaistan ulkopuolista emissiota, ei suodattimen ryhmäviivettä (tulos <c1/>)

seg-ad5f7cc4a439 = monitie-eteneminen, vastaanottimen kvantisointi ja automaattinen vahvistuksen säätö (tulos <c1/>)

seg-e38fc1a121ab = Maan pyöriminen Doppler-rajassa (enintään noin { "0.46" } km/s etäisyyden muutosnopeutta päiväntasaajalla) (tulos <c1/>)

seg-32a132809a9b = ionosfääriviive ensimmäistä kertalukua pidemmälle sekä elektronipitoisuuden jako LEO-satelliitin ylä- ja alapuolelle: vino TEC on syöte (tulos <c1/>)

seg-8189e06f4a56 = ilmakehän, sateen ja polarisaation häviöt: vain vapaan tilan häviötä verrataan (sade on merkityksellinen C-kaistalla) (tulos <c1/>)

seg-445cecb7370c = hankinta yhtä dwell-jaksoa pidemmälle väärän hälytyksen rangaistuksella: ei monidwell-varmistuslogiikkaa, tasainen koodivaiheen priori, pahin mahdollinen jakoraja (tulos <c1/>)

seg-8eefe4197d7f = <s1>Edellinen</s1>leo-pvt

seg-60423e1ed0ca = <s1>Seuraava</s1>link-budget
