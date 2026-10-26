# docs--python-api: translations (da)

seg-5ad814c7ef9e = Noter

seg-2bd2101ce454 = Flade

seg-fffbeccd4266 = Symbol

seg-a129b9e613d0 = Type

seg-ce0b6a889a87 = Kilde: <c1/>

seg-aea4d3625c20 = Kshana leveres med et førsteklasses Python-programmeringsinterface (API), bygget med <a1>PyO3</a1> og <a2>maturin</a2>. Dets <c1/>-wheels bygges mod den stabile Python-ABI (application binary interface), så ét wheel pr. platform virker på tværs af CPython ≥ { "3.9" }; wheels dækker Linux, macOS og Windows, hver på x86-64 og 64-bit ARM (se <a3>WHEEL_TAGS.md</a3>). Et medfølgende typestub (<c2/> + <c3/>) giver editorer og <c4/>/<c5/> fuld typeinformation.

seg-8b0ad6639bd5 = Hurtig start

seg-28e092a5a781 = Kør disse kodestykker fra roden af en checkout af repositoriet: de læser scenariefiler under <c1/>. NumPy-linjen kræver <c2/>.

seg-8c83544270b5 = Signatur

seg-fa90b5cd182b = Returnerer

seg-6f62744a47df = typet resultat (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

seg-67cd4e7f6ad0 = resultatdokument som en JSON-streng (JavaScript Object Notation)

seg-8246b2be7aaf = tilgængelige scenarietyper + metadata (fortolket)

seg-b5ad97d3ec18 = de samme metadata som ÉN JSON-array-streng, ikke en liste (bevaret for eksisterende kaldere; brug <c1/> til den fortolkede liste)

seg-8ce669f8e1d0 = fejlmeddelelser (tom, hvis gyldig)

seg-6017d21f52dd = mærke for fejlkategori (<c1/>, <c2/>, <c3/> eller <c4/>), eller <c5/> ved succes

seg-c62c5ab99132 = motorens version

seg-fdaaf33250d1 = vurdér en virkelig modtagerlog, beskrevet af et <c1/>-scenarie: resultatdokument, tillids-CSV for hver epoke, diagram og sammenfatning; en <c2/>-tabel tilføjer de maritime monitorer og tillidsscoren 0-100 med begrundelser (vejledende)

seg-0fb76af3d043 = et afgrænset NMEA-uddrag scoret på samme måde som live-tilstand scorer: tilstand for hver epoke, score 0-100 og begrundelser, en sammenfatning (ingen socket, ingen gate; vejledende)

seg-6ecd9bb3a1cd = et fartøjs NMEA-log som batchkørsel: scoremodellen og hver epokes score med dens fradrag (vejledende)

seg-7cd62f15bc3c = det offentliggjorte Jammertest-katalog og -program som hændelser med planlagt reference (<c1/>, <c2/>); planlagte tidspunkter, ikke registrerede tidspunkter i æteren

seg-1e2faf2894e3 = en modtagerlog scoret mod det program: ventetid, oversete, tid til genopretning og falske alarmer for hver test (MODELLED; en signeret pakke kræver kommandolinjen)

seg-f94eaef45f04 = en signeret bevispakke for et vindue af loggen, i hukommelsen: <c1/>, <c2/>, <c3/> (hold den privat); en teknisk registrering, ikke en juridisk vurdering

seg-ebd10aea2f6f = verificér en pakke: hashes, kæde, signatur, eventuelt den betroede underskriver, den fulde log og et tidsstempel; <c1/> er <c2/>, <c3/> (ingen offentlig nøgle angivet: intakt, underskriver ikke fastslået) eller <c4/>

seg-bf13e70f1d5c = CLI'ens <c1/>-artefakter som tekst

seg-1e5eb44bec6f = hvilke interoperabilitetsformater der gælder for et scenarie, uden at køre det

seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> eller <c5/> i hukommelsen: <c6/>, hver fil <c7/> (<c8/>-tekst eller <c9/>)

seg-bef8250e8453 = en GeoJSON-rute skrevet ind i et scenarie med waypoint-spor (<c1/>)

seg-e25bcb6342db = kørslens tidsserie som en animeret SVG, en HTML-afspiller eller op til { "120" } SVG-billeder: <c1/>

seg-9b24b9cf0510 = de medfølgende referencescenarier og deres TOML

seg-f62c11fe1e7d = bind et RFC { "3161" }-token (bytes eller base64) til en pakke i hukommelsen: <c1/>; pakken skal stadig kunne verificeres; myndighedens signatur kontrolleres ikke

seg-95fe54b500a7 = en ny signeringsnøgle i hukommelsen: <c1/> (PRIVAT), <c2/>, <c3/>, <c4/>; kun Python

seg-646e6aba13db = afspil én optagelse på tværs af udformninger af løkker (<c1/>): for hver udformning og PRN jitter i stabil tilstand, låsandele og C/N0; én erhvervelse pr. PRN, alle kanaler på de samme sampler

seg-08d46de5e7cd = beskriv én optagelse, eller hver optagelse i en mappe (læser filer; <c1/> læser dem fuldt)

seg-7d9cc8394e65 = et scenaries køretøjsbevægelse og hændelser til en GNSS-simulator i laboratoriet, i hukommelsen: <c1/>; typerne <c2/>, <c3/>, <c4/>; intet signal skrives, behold <c5/> sammen med filerne

seg-e215c7242eb2 = kortlægningen til offentlige rammer, udfyldt ud fra resultattekster: <c1/> er en liste af <c2/>-dicts (tekst, højst { "64" }); returnerer <c3/>; hver rækkes <c4/> siger, at kørslerne leverer belæg for dens funktioner, ikke at en ramme er opfyldt; medtag <c5/> ved enhver visning

seg-18d57e4920dd = de statiske kortlægningstabeller (eller kildedokumenterne) som Markdown, indledt med erklæringen

seg-8284e10dce6a = standardpakkerne (id, titel, ramme, antal tests) og en meddelelse; en pakke måler modellerede scenarier mod tærskler, der er angivet før kørslen

seg-ce6b819604a9 = én pakkekørsel: hver test <c1/>, <c2/> eller <c3/> med målte og forventede værdier, plus rapporten som Markdown under <c4/>; rejser <c5/> for et ukendt id

seg-0f701bc523c6 = LunaNet AFS-implementeringen kontrolleret mod de trykte tabeller og gennemregnede eksempler i LSIS-AFS V1.0 (tærskler B1 til B10; B4 rapporterer ét fastlåst miss)

seg-82aecf261c46 = en AFS-symbolstrøm (tekst med { "0" } og { "1" }) kontrolleret for synkroniseringsmønster, SB1-afkodning, FID, kontinuitet og afstand for TOI; LDPC og CRC-24Q for delrammerne { "2" } til { "4" } verificeres ikke

seg-f72ab45ae10b = en teststrøm af symboler med pladsholder-delrammer (ikke en signalform)

seg-1da34527bb64 = den signerede rundturspakke fra laboratoriet, der knytter scenarie, testbetingelser (<c1/>), modtagerlog og score sammen via hash; som <c2/>

seg-dd3726fec672 = en kshana-bench-resultatfil (JSON-tekst) ud fra en reference-fil og en forudsigelsesfil; MODELLED

seg-b82a110c324c = kshana-bench-resultatfiler gengivet som den statiske ranglisteside (HTML)

seg-58b8aa919eaf = Galileo OSNMA-autentificering af I/NAV-sider eller en UBX-strøm i hukommelsen: den dict, <c1/> udskriver, med den vejledende meddelelse i feltet <c2/>; kun vejledende, ikke en tjeneste for navigationsintegritet

seg-15e4601cd88c = de satellitter, et sted ser under en azimutafhængig horisontprofil: for hver satellit <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, øst-nord-op-kofaktoren og -kovariansen og de horisontale fejlellipser; <c3/> er JSON- eller TOML-tekst eller en dict (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); afgørelsen om synlighed og ellipsen er kontrolleret mod uafhængige biblioteker, resten er MODELLED, og resultatet bærer den vejledende meddelelse (<c14/>, <c15/> siger, om himlen er repræsentativ eller stammer fra elementsæt)

seg-51ac7cd68154 = <c1/> ({ "1" } til { "5000" }) fejl fra mindste kvadraters metode med seed på den synlige mængde i <c2/>, med deres empiriske kovarians, RMS og andelen inden for ellipsen på { "95" } %

seg-8bba3099379a = horisontprofilens forudindstillinger (<c1/>, <c2/>, <c3/>, <c4/>) med deres label REPRESENTATIVE, proveniens og afskæringen for hver grad af azimut; repræsentative geometrier, ikke opmålinger

seg-f900de61f6e9 = et horisontprofilafsnit (tabel, gadekløft, sektorer, terræn) reduceret til den normaliserede tabel med 360 poster, som motoren bruger

seg-824f3c5951fa = skyplottet for <c1/> som statisk SVG-tekst

seg-0ffb65c8f5f3 = en tillidsstrøm (<c1/>) eller et <c2/>-resultat som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP-JSON-nyttelast, med <c3/>-encoderne; intet sendes, og intet ur læses (syslog-linjer bærer intet tidsstempel)

seg-c1ab3dbbe2f2 = et GNSS-interferenskort ud fra ADS-B- eller AIS-CSV-tekst: én dict pr. UTC-dag med <c1/>-GeoJSON (kun aggregeret; en degraderet celle udpeger ikke interferens som årsag)

seg-ff4bc7fdbce7 = andelen af en rute gennem degraderede celler på de kort, som JSON-tekst (ikke en prognose; celler uden observationer er ikke belæg for en fri rute)

seg-d70bccba0e03 = syntetisk bro-NMEA til besætningstræning plus instruktørloggen (<c1/>, <c2/>, <c3/>); kun tekst, aldrig til et fartøjs levende navigationssystemer

seg-3fe13851ac82 = navnene på GNSS IQ-signaler, som <c1/>, <c2/> og <c3/> accepterer (<c4/>, <c5/>, <c6/>, ...)

seg-50bf4ad4e23a = en GNSS IQ-scene med flere satellitter i hukommelsen: <c1/> / <c2/> og <c3/> for hver epoke

seg-b3199839a37c = det samme, med hver GPS-satellit i sin broadcast-efemeridegeometri fra en RINEX-navigationsbesked (Receiver Independent Exchange Format)

seg-8f0f9efea46b = FFT-erhvervelse (fast Fourier transform) af hver PRN (pseudorandom noise code): Doppler, kodefase, statistik, tærskel

seg-3bf994f3f1bf = hele erhvervelsesoverfladen for én PRN (<c1/>): korrelationseffekt i <c2/>, toppen og to finere Doppler-forfininger (<c3/>, <c4/>)

seg-393572e31421 = erhverv, og følg derefter hver PRN: Doppler, kodefase, låsindikatorer, C/N0 og prompt-korrelator for hver epoke

seg-bc39efdb015a = modtagerens front-end-kæde (båndpas, notch, blanking, excision, AGC (automatic gain control), kvantiserer) over komplekse sampler

seg-ead1b81c712f = tilpas modellen for tab af lås i sporingsløkken til en tillidstidslinje for en modtager (et <c1/>-scenarie)

seg-0ab8531d0465 = fortolk en <c1/>-fil (en sti eller TOML-tekst) til dens opløste udformninger, hver med sin <c2/> og <c3/>; <c4/> ved en ugyldig fil

seg-9c3467d4451e = læs en binær sporingsepokefil (<c1/>, som <c2/> skriver den): <c3/> og én dict pr. epoke i <c4/>

seg-469303e33d2a = IQ-detektionsmonitorerne over en optagelse i ét streamingløb (<c1/>): <c2/>, <c3/>, <c4/> og <c5/>; læser en fil

seg-bb5c5008f1a8 = validér en testbetingelsesfil til laboratoriet (<c1/>, TOML eller JSON, en sti eller tekst) og returnér den opløst, med dens <c2/>

seg-d2441bf762b4 = kør en kampagne med genafspilning i laboratoriet (<c1/>) ind i <c2/>, som <c3/> gør; færdige celler springes over; returnerer antallet af celler, fejl og <c4/>, når hver celle er færdig

seg-7b6d264d9c7f = genopbyg en kampagnes scorekort, HTML-rapport og digest ud fra dens celler: antallet af celler og rækker, de rækker, der ikke når en tærskel, og <c1/>

seg-e3956268cf1c = Signaturer for GNSS IQ og modtagertillid

seg-817bd0898d46 = De fulde signaturer, som <c1/> angiver dem (hvert nøgleord efter de påkrævede argumenter har en standardværdi; docstrings i stubben giver hvert nøgleords betydning). Pak listerne <c2/> / <c3/> og inputtene <c4/> / <c5/> ind med <c6/> for arrays.

seg-2dd9323829ce = En kampagne med genafspilning i laboratoriet fra Python, derefter dens rapport (kampagnefilen og dens optagelser er dine; en færdig celle springes over ved næste kald; <c1/> læser en sporingsepokefil, som en <c2/>-kørsel har skrevet):

seg-5f48b88438df = <c1/>s <c2/> angiver, over hvor mange kodeperioder overleveringserhvervelsen integrerer koherent. Fra { "0.33.0" } er standardværdien <c3/>, hvilket betyder auto: omkring { "4" } ms ({ "4" } perioder for en kode på { "1" } ms som GPS L1 C/A, { "1" } for en kode på { "4" } ms eller længere), så kanalen starter tæt nok på til, at frekvensløkken kan trække ind; <c4/> beholder søgningen med én periode fra { "0.32" }.

seg-012a83181bd3 = Typer

seg-0b4f4c6c6014 = <c1/> typer de lukkede ordforråd til kontrolværktøjer (mypy, pyright): <c2/> (hvert typenavn, en <c3/>), <c4/> (de fire mærker, <c5/> returnerer), <c6/> og <c7/>-typerne <c8/> (hvad <c9/> returnerer en liste af) og <c10/> (en post i et resultats <c11/>-blok, som udvider basen med påkrævede nøgler <c12/>). De findes kun for typekontrolværktøjer og kan ikke importeres ved kørsel; <c13/> holder dem lig med motorens lister.

seg-b5ad0d8e1456 = Medlem

seg-2698ab8436e6 = fuldt resultatdokument (JSON)

seg-7eccc8361120 = selvstændig diagram-SVG (Scalable Vector Graphics)

seg-38c8d20ca07a = menneskelæsbar sammenfatning på én linje

seg-e21e82ad3fe8 = reproducerbarhedstabellen for de typer, der udsender en (se nedenfor)

seg-aadcc1cc4c79 = resultatet fortolket til en Python-dict (se noten om formen nedenfor)

seg-409504363c4c = den numeriske liste ved <c1/> (med punktum, <c2/>, eller en JSON Pointer, <c3/>): 1-D for tal, 2-D for numeriske lister af samme længde

seg-b6d5d7e5271a = listen af poster ved <c1/> (en tidsserie), ét array for hvert felt, der er et tal i hver post

seg-adb2d15f9f74 = hver liste af poster med et numerisk felt, nøglet efter sti med punktum, hver som <c1/>

seg-7f053ad96880 = skriv den tabel til <c1/>; returnerer de skrevne bytes, eller { "0" } (og skriver intet), når typen ikke udsender nogen tabel

seg-276104139e73 = Reproducerbarhedstabellen

seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> og <c5/> udgiver altid en tabel; <c6/> udgiver en, når et eksportsted (<c7/> + <c8/>) er konfigureret. Hver anden type returnerer <c9/>. Teksten er de samme bytes, som CLI'en (command-line interface) skriver som <c10/>, så en reviewer, der gengiver en offentliggjort tabel fra wheel'en, aldrig behøver at gå over til kommandolinjen:

seg-3ad2987110ee = Resultatets form

seg-57c7066d3522 = Kvalitetsmålene og tidsserierne findes <b>for hver side af kørslen</b>, ikke på øverste niveau. For en urkørsel er dokumentet:

seg-cb19f961de2b = så kvalitetsmålene er <c1/>, aldrig <c2/>. Andre typer udsender deres egne pakker; den fulde reference for hvert felt, med enheder og en kildehenvisning, er <a1><c3/></a1>, og læserens vejledning er <a2><c4/></a2>.

seg-bfd984e0407b = <c1/> og <c2/> <b>udfører</b> scenariet, så de afslører fejl i fortolkning, konfiguration <em>og</em> kørsel. De rejser aldrig en undtagelse.

seg-0ca0a1da8356 = <c1/> / <c2/> rejser <c3/> ved et ugyldigt scenarie.

seg-901c2ede0cd0 = Resultater kan gengives: et scenarie bærer sin <c1/>, og motoren registrerer en <c2/>, så det samme input giver identisk output byte for byte på samme platform (se <a1><c3/></a1>).

seg-8c0c32fcba2b = <c1/>, <c2/> og <c3/> returnerer præcis <c4/> af de samme værdier, som <c5/> giver (samme dtype, bitidentisk; <c6/>). De importerer NumPy, når de kaldes, og rejser <c7/> uden det; NumPy holdes uden for pakkens krav ved kørsel. <c8/> betyder, at stien mangler, <c9/> at værdien dér ikke er et numerisk array (eller ikke en liste af poster). Notebooks, der kan køres, findes i <a1><c10/></a1>.

seg-00a3cf088cde = Ikke i Python: langvarige processer

seg-3780dd4973f0 = <c1/> (en strømproces med en gate og en valgfri <c2/> TCP-server) og telemetrieksportørerne (Prometheus, OTLP, syslog; <c3/>) og <c4/>-streaming findes kun på kommandolinjen: en binding vender tilbage, når kaldet vender tilbage, og holder ingen socket åben. Python dækker batchformen af hver: <c5/> for en log, <c6/> for et strømuddrag (scorer og tilstande; gaten anvendes ikke), <c7/> for den genererede tekst.

seg-82379c29d438 = <s1>Forrige</s1>Kold-atom-interferometer

seg-4a457afc63fb = <s1>Næste</s1>npm og WebAssembly

seg-dbbce10a12d2 = RunOutput
