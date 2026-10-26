# docs--claims-vs-reality: translations (nb)

seg-a47934361f43 = NMEA-strømmer for mannskapstrening

seg-ee2e250497f9 = Eksport til testbenk

seg-ad856ad710eb = Status

seg-98d0bc6b40ce = Compliance-kobling til offentlige rammeverk

seg-80f3f0aae42c = Interferenskart

seg-28b1885c4ca7 = Kilde: <c1/>

seg-bf5c2811ce29 = Påstander mot virkelighet — register over overpåstander

seg-592e007bc3cf = En uavhengig revisjon av en tidligere Kshana-versjon katalogiserte fjorten <b>overpåstander</b> (<c1/>…<c2/>): steder der en offentlig flate (README, lekeplass, etiketter for FoM (kvalitetsmål), scenariopakker) beskrev en funksjon sterkere enn koden leverte. Denne siden er lukkingsregisteret: hver rad oppgir den opprinnelige overpåstanden, hvordan den ble løst og evidensen. To typer løsning forekommer:

seg-39250970dbbf = <b>Påstand trukket tilbake</b> — ordlyden ble rettet slik at den stemmer med koden (ærlig omformulering, ingen endring i funksjonen). «Ingen kode = ingen påstand.»

seg-fb7da0f79ead = <b>Erstattet</b> — funksjonen ble deretter bygget og testet, slik at den sterke påstanden ble <em>riktig</em>.

seg-5292f7162e2b = En regresjonsvakt (<c1/>) skanner de levende offentlige flatene (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> og forsidene for crates.io, PyPI (Python Package Index) og npm <c8/>, <c9/>, <c10/>) ved hver CI-kjøring (kontinuerlig integrasjon) og feiler hvis noen av de tilbaketrukne, bare overpåstandsformuleringene dukker opp igjen uten forbehold — slik at en rad ikke i det stille kan gå tilbake fra GREEN.

seg-dafc6f322f34 = Alle fjorten rader er <b>GREEN</b>.

seg-5cf7bf2d1889 = OC (overpåstand)

seg-0e01d4053d7f = Opprinnelig overpåstand

seg-36bf87638923 = Løsning

seg-70a952c4150b = «felles Kalman-fusjonsestimator» antydet ett enkelt filter med krysskovarians; koden kjørte to uavhengige estimatorer

seg-d5682a7fdb11 = <b>Erstattet</b> — et ekte Kalman-filter med koblet klokke+posisjon og krysskovarians ble bygget

seg-1008020cd9e4 = <c1/> ({ "7" } tester, blant dem et koblet-mot-frakoblet-ensemble med 100 forsøk som krever at den koblede posisjons-RMS (kvadratisk middelverdi) er under { "0.6" }× den frakoblede og at det koblede filteret vinner i minst { "90" } av de { "100" } forsøkene); CAPABILITY «Sensor fusion» → full

seg-334fc345d501 = «klokkestøttet spoofdeteksjons-RAIM (receiver autonomous integrity monitoring)» antydet en RAIM-detektor med flere satellitter

seg-cf0795c2ee02 = <b>Påstand trukket tilbake → Erstattet</b> — omformulert som en grense for spoofdetekterbarhet ut fra klokkestabilitet; den ekte RAIM/ARAIM (HPL/VPL (HPL: horisontalt beskyttelsesnivå; VPL: vertikalt beskyttelsesnivå)) kom deretter

seg-f46432acbfa0 = <c1/> ({ "30" } tester — øyeblikks- og løsningsseparasjons-ARAIM, HPL/VPL, FDE (feildeteksjon og -utelatelse), Stanford-diagrammer); <c2/>

seg-8b47f69dbb76 = «jamming-demonstrator» uten noen jamming-kode bak

seg-bfff34d5a250 = <b>Erstattet</b> — en jamming-modell med linkbudsjett J/S → effektiv C/N₀ → tap av lås ble bygget

seg-5f75628b8201 = <c1/> ({ "10" } tester); README-raden «Resilience»

seg-bae512770cd6 = «Full IMU-støymodell (inertial measurement unit) med Allan-varians på en IMU-triade» — modellen var énaksed

seg-50c0b5855cb9 = <b>Påstand trukket tilbake → Erstattet</b> — omformulert som et 1-DOF-feilbudsjett (DOF: frihetsgrad); en treaksed strapdown-INS (inertial navigation system) ble deretter levert

seg-501bf7d8fff0 = <c1/> treaksed strapdown (kvaternionattityde, NED-mekanisering (north-east-down), coning/sculling); ROADMAP «Inertial»

seg-ad250a99b05f = «Hybrid PNT-integrasjon (posisjonering, navigasjon og tidssynkronisering)» antydet et koblet GNSS/INS-filter (GNSS: globalt navigasjonssatellittsystem); det var et feilbudsjett for dødregning

seg-85fb58d37a5d = <b>Påstand trukket tilbake → Erstattet</b> — omformulert som dødregning med en konfigurerbar ny lås; ekte tett koblet GNSS/INS-fusjon ble deretter levert

seg-9e6b092d5656 = <c1/> (17-tilstands UKF (unscented Kalman filter) med kvante-CAI (CAI: kaldt-atom-interferometer) dødregning); CAPABILITY «Sensor fusion» → full

seg-46a637f8e967 = «validert ~{ "2" }%» antydet en stram, håndhevet grense

seg-5e98d7664558 = <b>Påstand trukket tilbake</b> — <c1/> angir den <em>håndhevede</em> grensen ({ "20" }–{ "25" }% gjennomsnitt over seeds); «~{ "2" }%» betegnet en typisk observasjon, ikke grensen

seg-84f4fcdc7e50 = <c1/>, overskriften «On tolerances»

seg-85ec2fe9c7f7 = «deterministisk på tvers av plattformer» uten innsjekket evidens

seg-6e516f04db89 = <b>Påstand trukket tilbake</b> — verktøykjeden er festet til en eksakt utgivelse; gylne hasher per scenario er innsjekket med en reproduserbarhetsgrense. (Bit-identiske resultater <em>på tvers av</em> OS/arkitektur (OS: operativsystem) er fortsatt en åpen sak, oppgitt ærlig.)

seg-9db327be56c3 = <c1/> (kanal <c2/>); <c3/> (numeriske verdier til { "1e-6" }); <c4/> (hash av hvert resultats inndatafingeravtrykk og form, kjørt på CI-matrisen for Linux, macOS og Windows); <c5/>

seg-2708139388ed = «hybrid kvante-klassisk PNT-simulator» antydet kvantefysikk fra første prinsipper

seg-717167714e83 = <b>Påstand trukket tilbake → Erstattet</b> — omformulert som en simulator for PNT-robusthet som bruker ytelsesmodeller for kvantesensorer; CAI-fysikk fra første prinsipper med Mach–Zehnder kom deretter

seg-c67fb22add4b = <c1/> ({ "26" } tester — Mach–Zehnder-fase, projeksjonsstøy <c2/>, vibrasjonsoverføringsfunksjon, Coriolis + AC-Stark (AC: vekselstrøm) systematikk); <c3/>

seg-5c6b7d4f2029 = kvalitetsmålet «Integrity Performance» antydet integritet for luftfart med HPL/VPL/RAIM

seg-ee5487da890c = <b>Påstand trukket tilbake + Erstattet (lagdelt)</b> — kvalitetsmålet per kjøring i scenarioet er ærlig merket <em>filterets indre konsistens</em> (<b>ikke</b> integritet for luftfart); den ekte ARAIM HPL/VPL vises <em>separat</em>, slik at de to aldri blandes sammen

seg-31aacdf17b02 = <c1/> (<c2/>: indre konsistens, med forbehold); <c3/> + <c4/> (ekte ARAIM)

seg-0686fa147c96 = Sikkerhetsmålet presentert som alltid meningsfullt, selv uten angrep

seg-d6d9296422fc = <b>Påstand trukket tilbake</b> — sikkerhetsmålet (<c1/>) er rammet inn i spoofdetektorens kontekst og er bare meningsfullt når et angrepsscenario er konfigurert

seg-8f7b211b5a0c = README-raden «Resilience»; sikkerhetsmålet er definert ved det operativt skadelige spesifikasjonspunktet

seg-d66421174e94 = kvalitetsmålet «Positioning Performance» antydet full nøyaktighet i posisjonsdomenet

seg-9eeb13a16350 = <b>Påstand trukket tilbake</b> — merket som en 1-DOF <c1/> for de inertielle/hybride pakkene, uttrykkelig <b>ikke</b> en 2D CEP/2DRMS (CEP: sirkulær sannsynlig feil) eller DOP-vektet (DOP: presisjonsfortynning) nøyaktighet

seg-e8115df73c10 = README-tabellen over kvalitetsmål (raden «Positioning Performance»)

seg-5c73759a2454 = inertielle FoM-tall lest som ensemblestatistikk fra enkelt-seeds

seg-3db3a41ce848 = <b>Påstand trukket tilbake</b> — en enkelt kjøring er flagget <c1/>; <c2/> rapporterer gjennomsnitt/spredning/bootstrap-KI på { "95" }%

seg-bf737455e6f2 = README-tabellen over FoM; tester av omhyllingen for scenariodekning

seg-aa362992b5da = scenarioet «SGP4 (Simplified General Perturbations { "4" }) GPS (Global Positioning System)-konstellasjon» brukte syntetiske plassholder-TLE-er (to-linjers elementsett)

seg-ebae20813a52 = <b>Erstattet</b> — scenarioet bygger nå inn et ekte, datostemplet Celestrak-<c1/>-øyeblikksbilde med strenge sjekksummer

seg-2d49f6101571 = <c1/> (ekte <c2/>, <c3/>); <c4/>

seg-cdefa4ee436a = versjonsstrengen i README drev bort fra <c1/>

seg-8e66b9485565 = <b>Påstand trukket tilbake</b> — en CI-grense hevder at statusmerket i README stemmer med <c1/>

seg-347fd8c1f334 = { "0.35" }: påstandene holdt smale, og én rettelse

seg-946ff389cec5 = Funksjonene i { "0.35" } ble skrevet med grensene sine oppgitt ved siden av påstanden, og de samme vaktene (<c1/>, og ordlydsvakten i <c2/>) skanner sidene som beskriver dem. Denne tabellen er ikke en del av registeret med fjorten rader ovenfor; for de nye flatene oppgir den hva som påstås og hva som ikke påstås.

seg-6ac3f9b26aad = Hva som påstås

seg-6f558815da86 = Hva som ikke påstås

seg-d0964d2f9bbc = Tillitsscore for fartøy (<c1/>, <c2/>, gate, Signal K, OpenCPN)

seg-ee4d75006bfc = en score på 0-100 og begrunnelser fra en mottakers egen NMEA, MODELLED

seg-59ff27c84fe4 = veiledende, ikke typegodkjent navigasjonsutstyr; en score for én logg er ikke en uttalelse om andre mottakere; den gjør ikke en posisjonsbestemmelse mer nøyaktig

seg-8869e6a5c10b = syntetisk bro-NMEA med skriptede hendelser og en instruktørlogg

seg-bc4ba77bc569 = bare tekst, ingen radiofrekvensutgang; aldri for et fartøys levende navigasjonssystemer; veiledende, ikke typegodkjent navigasjonsutstyr

seg-9482ecbb2748 = en signert teknisk registrering som kan verifiseres frakoblet

seg-20ae6dd2b780 = ikke en juridisk vurdering; sier ikke hva som forårsaket en hendelse, hvem som var ansvarlig, eller at loggen viser det mottakeren faktisk mottok

seg-4132fc36f1d3 = aggregerte celler med forringet navigasjon fra rapporter med åpen lisens

seg-c64960abf9fb = ikke en prognose; en rutes eksponering er en andel celler, ikke en risiko

seg-ed6d268e0291 = et scenarios kjøretøybevegelse og hendelser i filer en laboratoriesimulator kan lese

seg-85c8ad22ef03 = ingen signal skrives; ingen ytelse hos simulator eller mottaker påstås

seg-1bba9a883650 = hvilke rader et sett med kjøringer gir belegg for, med et hull på hver rad

seg-f2a836780831 = aldri at et rammeverk er oppfylt eller et produkt godkjent; en typeetikett alene er ikke evidens

seg-31c7009c9914 = <b>Rettelse registrert i { "0.35" }.</b> En tidligere versjon av <c1/> og av kommentarene i resiliensmodulen beskrev sju «teknikkategorier» i DHS Resilient PNT Conformance Framework. Versjon { "2.0" } av det rammeverket definerer kjernefunksjoner (Prevent, Respond, Recover), nivåer fra { "0" } til { "4" } og åtte nummererte krav, og ingen liste med sju kategorier. De sju delscorenavnene som scoringsmotoren sender ut er Kshanas egne, og krysskoblingen sier nå det.

seg-f70787ecb194 = Hvordan en rad forblir GREEN

seg-f2c599e8882a = De sterke påstandene (OC-0/2/7/8 og de erstattede halvdelene av OC-1/3/4/12) er GREEN fordi funksjonen er <b>levert og testet</b> — ikke fordi ordlyden ble myket opp. Radene der påstanden er trukket tilbake er GREEN fordi den levende ordlyden stemmer med koden. Vakttesten gjør den andre kategorien håndhevbar: hvis en tilbaketrukket overpåstandsformulering kommer tilbake på en offentlig flate, blir CI rød. Se <c1/>.

seg-39e475441b60 = <s1>Forrige</s1>Hvorfor rader forblir modellert

seg-07ef8e1e862e = <s1>Neste</s1>Opphav
