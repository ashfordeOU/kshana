# docs--integrity: translations (nb)

seg-668241606715 = Kilde: <c1/>

seg-9a8c218ce054 = Integritet og sikkerhet: hva Kshana modellerer, og hva den ikke modellerer

seg-52038c93765d = Kshana rapporterer to kvalitetsmål (FoM-er), <b>Integritet</b> og <b>Sikkerhet</b>, som lett forveksles med størrelsene med samme navn i luftfartskvalitet. Denne siden sier rett ut hva de er i dag, hva de <em>ikke</em> er, og hva veikartet legger til. Hvis du vurderer Kshana til bruk der liv og sikkerhet står på spill, eller der det kreves formell attestering, bør du lese dette først.

seg-fb6e93a107e7 = I dag ({ "v0.37.0" })

seg-ecd20ae1a05d = Integritets-FoM: filterets selvkonsistens

seg-153391e55508 = Integritets-FoM er andelen av avbruddsepokene der den sanne tidsfeilen holder seg innenfor Kalman-filterets eget k-sigma-beskyttelsesnivå:

seg-ac2413a97a7b = Dette måler om filterets <em>selvrapporterte</em> usikkerhet er ærlig om filterets <em>egen</em> feil under et GNSS-avbrudd (GNSS: globalt navigasjonssatellittsystem). Det er en nyttig intern konsistenssjekk.

seg-c9f80760ea53 = Det er <b>ikke</b>:

seg-8899525ad177 = et <b>horisontalt/vertikalt beskyttelsesnivå (HPL/VPL)</b>: det finnes ikke noe beskyttelsesnivå i posisjonsdomenet i det hele tatt (klokkepakkene er i tidsdomenet);

seg-dd9a3e58e10b = en <b>integritetsrisiko / sannsynlighet for farlig villedende informasjon (P_HMI)</b>;

seg-31fa92b3271d = en sammenligning med en <b>varslingsgrense</b>;

seg-ee998b974e6f = i samsvar med <b>RTCA DO-229E / DO-316</b> eller <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation Equipment) eller noen annen sertifiseringsstandard.

seg-f84a56b6fe10 = Sikkerhets-FoM: analytisk grense for spoofing-detekterbarhet

seg-e532288ed262 = Sikkerhets-FoM er en <b>klokkestabilitetsbasert grense for detekterbarhet av spoofing</b>: gitt en klokkes støy (hvit frekvensstøy og random-walk-PSD-er (effekttetthetsspektre)) og et overvåkingsvindu er den den analytiske deteksjonsmarginen til en enkeltklokke-konsistensmonitor mot en sakte stigende falsk-tid-spoofing. En roligere klokke (for eksempel en optisk klokke) oppdager en mindre og tregere spoofing enn en mer støyfull (for eksempel en CSAC (chip-scale atomklokke)). Denne kontrasten er poenget med demonstratoren.

seg-fc718a805b28 = Den er <b>ikke</b> en RAIM-detektor (receiver autonomous integrity monitoring, mottakerautonom integritetsovervåking) med flere satellitter. Det finnes ingen pseudoavstandsresidualer på tvers av satellitter, intet beskyttelsesnivå og ingen P_HMI. Innovasjon-mot-sigma-testen har samme matematiske form som klassisk RAIM-feildeteksjon (Brown), men tallet er en analytisk grense for en gitt klokke, ikke en RAIM-implementering, og det har bare mening i sammenheng med et konfigurert spoofing-scenario (se scenariotypen <c1/>, som injiserer et faktisk stigende angrep).

seg-ae770e25031e = Utdataene sier fra om dette. Typene <c1/>, <c2/>, <c3/> og <c4/> konfigurerer ikke noe angrep, så enlinjeoppsummeringen deres skriver <c5/> i stedet for et tall, og resultatdokumentet deres markerer <c6/> som <c7/>, med begrunnelse, i blokken <c8/>. Selve verdien blir stående i dokumentet for den som vil ha grensen.

seg-960bd91a2b3a = Ekte snapshot-, løsningsseparasjons- og ARAIM-RAIM (<c1/>)

seg-3d31ec251ac0 = En ekte RAIM i posisjonsdomenet er implementert i <c1/>, adskilt fra selvkonsistens-FoM-en over:

seg-0e8240812c16 = <b>Residualovervåking med flere satellitter</b>: den bygger geometrimatrisen for siktlinjer til de synlige satellittene, danner minste kvadraters posisjons- og klokkeløsning og tester summen av kvadrerte residualer.

seg-69f1535596e0 = <b>χ²-feildeteksjon</b>: <c1/> (SSE: sum av kvadrerte residualer) er χ²(n−{ "4" }) under hypotesen om ingen feil; en feil erklæres over <c2/>. χ²-tersklene kommer fra en avhengighetsfri regularisert ufullstendig gammafunksjon (eksakt, uten tabeller).

seg-6721779048f5 = <b>Stigningsbasert HPL / VPL</b>: <c1/>, der <c2/> er posisjonsfeilfølsomheten per satellitt fra hatt-matrisen og <c3/> er den ikke-sentrale-χ²-skjevheten som oppfyller den konfigurerte sannsynligheten for udetektert feil <c4/>.

seg-8dd60e98088d = <b>Løsningsseparasjons-RAIM (MHSS: multiple-hypothesis solution separation)</b>: for løsningen med alle satellitter i sikte og hver delløsning med én satellitt utelatt både <b>oppdager og identifiserer</b> den nøstede estimatorseparasjonen <c1/> den feilbehengte satellitten og mater grensen for beskyttelsesnivået.

seg-719e27fdd2c1 = <b>ARAIM-budsjett for integritetsrisiko (P_HMI)</b> (ARAIM: advanced receiver autonomous integrity monitoring): <c1/> løser ut det minste HPL/VPL der den summerte sannsynligheten for farlig villedende informasjon <c2/> (Blanch m.fl., <em>Baseline ARAIM</em>) holder seg innenfor en eksplisitt allokering av integritetsrisiko, og rapporterer risikoen nivåene oppnår. Dermed kan integritet veies direkte mot varslingsgrensen, i stedet for å bli liggende implisitt i en fast <c3/>-multiplikator.

seg-2f99acf45203 = <b>Stanford–ESA-integritetsdiagram</b> (ESA: European Space Agency): en akkumulator per epoke klassifiserer <c1/> i regionene Tilgjengelig / Systemet utilgjengelig / Villedende / Farlig villedende for en tilgjengelighetsoppsummering.

seg-33d01969fb0f = <b>Nåbar fra ende til ende</b>: scenariotypen <c1/> kjører det ovenstående over en SGP4-konstellasjon (Simplified General Perturbations { "4" }) eller en keplersk konstellasjon, eller en som er lest fra ekte TLE-er (two-line element sets) eller en RINEX-navigasjonsfil (Receiver Independent Exchange Format), og gir et HPL/VPL-tilgjengelighetskart per epoke mot de konfigurerte varslingsgrensene (<c2/>). Den samme kjøringen <b>eksporterer et vertikalt Stanford-diagram</b>: i hver beskyttet epoke blir et seedet, reproduserbart feilfritt avstandsfeiltrekk avbildet gjennom geometrien til en faktisk vertikal feil og klassifisert mot VPL og den vertikale varslingsgrensen, slik at JSON-resultatet (JavaScript Object Notation) og CLI-oppsummeringen (kommandolinjegrensesnitt) viser antall i hver region (integritetshendelser og HMI: farlig villedende informasjon), ikke bare en tilgjengelighetsandel. På den medfølgende <c3/> rapporterer kjøringen { "344" } av { "361" } epoker tilgjengelige ({ "95.3" } %) ved en horisontal varslingsgrense på { "40" } m og en vertikal på { "50" } m, med { "0" } integritetshendelser og { "0" } HMI.

seg-54e778eceef4 = <b>ARAIM med to konstellasjoner og en integritetsstøttemelding</b>: <c1/> legger til <b>feilmodusen for hele konstellasjonen</b>: ved siden av hypotesene om ingen feil og feil på én satellitt bidrar hver konstellasjon med én hypotese som fjerner alle satellittene sine, med a priori-sannsynlighet <c2/>, til den samme MHSS-integritetsrisikosummen. <c3/> (ISM) bærer brukerens avstandsnøyaktighet for integritet (<c4/>), nøyaktighetens kvadratiske middelverdi (<c5/>), den største nominelle skjevheten <c6/> som legges ensidig inn i hver modus, og a priori-sannsynlighetene <c7/> og <c8/>. Referansesettet fra WG-C (Working Group C i samarbeidet mellom EU og USA om satellittnavigasjon, hvis tekniske ARAIM-undergruppe utgir referansen) er σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } og P_const = { "1e-4" }. <c9/> gjengir enkeltfeil-resultatet fra <c10/> bit for bit. Typen <c11/> tar denne veien med <c12/> (<c13/>: GPS + Galileo, { "48" } satellitter, { "145" } av { "145" } epoker tilgjengelige ved de samme varslingsgrensene).

seg-1f06bc1976bd = <b>Beskyttelsesnivåer mot publiserte referansevektorer</b>: typen <c1/> kjører motorens <c2/> og <c3/> på de gjennomregnede eksemplene til WG-C-undergruppen for ARAIM selv (Reference Airborne Algorithm Description Document v3.1, { "2019" }, vedlegg D, og Milestone { "3" } Report, { "2016" }, vedlegg A). Den største forskjellen i vertikalt/horisontalt beskyttelsesnivå på akseptvektoren er { "0.0437" } m mot dokumentenes egen toleranse på { "0.05" } m. Denne raden er VALIDATED i <a1><c4/></a1>: den kontrollerer ligningen for beskyttelsesnivået, ikke en operativ ISM eller en mottaker.

seg-1dda7b318c5f = Det gjenstående gapet (veikart)

seg-e27215296e1a = Hva <c1/> <b>ikke</b> gjør ennå:

seg-964c0634eae0 = den er <b>ikke innfelt i FoM-en for klokke-/holdover-scenarioene</b>: disse pakkene rapporterer fortsatt filterets selvkonsistens-integritetstall over, ikke et HPL/VPL;

seg-eecf2f9f181e = feilhypotesene er det feilfrie tilfellet, <b>enkeltsatellitter</b> og <b>hele konstellasjoner</b>; samtidige feil på <b>delmengder av to eller flere satellitter (SV: space vehicle, det vil si en satellitt)</b> er ikke modellert;

seg-fd0f9fb2de83 = ISM er et konfigurerbart parametersett (med referanseverdiene fra WG-C), ikke en operativ kringkastet melding eller en validert trusselmodell;

seg-88f5242b0809 = <b>feildeteksjon og eksklusjon (FDE)</b> finnes bare for enkeltsatellitter og snapshot: løsningsseparasjon peker ut den feilbehengte satellitten, og <c1/> løser på nytt hver eksklusjon av én satellitt og returnerer den utelatte satellitten sammen med khikvadrattesten og beskyttelsesnivåene for den gjenværende delmengden, men ingen eksklusjonsbeskyttet posisjon rapporteres, og scenariotypen <c2/> kjører ikke eksklusjonssteget.

seg-c85aa5dedc86 = Snapshot-, løsningsseparasjons- og ARAIM-kjernene er prøvd på <b>ekte presis baneinformasjon fra IGS (International GNSS Service) (SP3: Standard Product { "3" }) som geometri</b>, ikke bare på syntetiske konstellasjoner: <c1/> danner siktlinjegeometrien fra den første epoken i et ekte IGS SP3-produkt ved en reell bakkestasjon, og kontrollerer at beskyttelsesnivåene er endelige og innenfor APV-I-varslingsgrensene (approach with vertical guidance) på { "40" } m horisontalt og { "50" } m vertikalt, at en pseudoavstandsskjevhet på { "60" } m utløser χ²-monitoren, at løsningsseparasjon <b>identifiserer</b> den feilbehengte satellitten, og at ARAIMs nivåer holder den allokerte <c2/>. <c3/> kjører veien for to konstellasjoner på de ekte katalogene for GPS og Galileo fra Celestrak av 2026-06-07, propagert til én felles epoke (se <a1><c4/></a1> §{ "3" }). En dypere kryssjekk, der beskyttelsesnivåene sammenlignes epoke for epoke med gLAB (GNSS-Lab Tool, en programvarepakke for GNSS-databehandling distribuert av ESA) over en full RINEX-observasjonsbue, ville gitt paritet i mottakerdomenet. Den er ikke gjort: typen <c5/> beregner en kode-enkeltpunktsposisjon fra ekte RINEX-observasjoner, men intet beskyttelsesnivå fra den løsningen er sammenlignet med gLAB.

seg-f5fac2e836a6 = <c1/> er altså en ekte kjerne for beskyttelsesnivå og integritetsrisiko, nåbar fra scenariotypene <c2/> og <c3/>, prøvd på geometri fra ekte referansebaner og kontrollert mot WG-C-referansevektorene. Feil i delmengder av flere satellitter, gLAB-paritet i mottakerdomenet og integrasjon i klokke-FoM-en står igjen som veikartpunkter, og ingenting av dette er sertifiseringsbevis.

seg-487f24ed92d8 = <a1><c1/></a1>: énlinjedefinisjoner av hver FoM og forkortelse.

seg-7d3c12cf802e = <a1><c1/></a1>: ISM-parametrene og WG-C-referansevektorene.

seg-04532ba5288f = <a1><c1/></a1>: tidsbeskyttelsesnivået (TPL) for en klokke i fri gange, som er betinget av deteksjon.

seg-43cea496da93 = <a1><c1/></a1>: hvilke størrelser som er validert mot en referanse, og hvilke som er selvkonsistenssjekker.

seg-3037dde8135f = <c1/>: utledningen av grensen for spoofing-detekterbarhet.

seg-04d63778ca7f = RAIM ved siden av kvalitetsmålene for klokke-holdover ({ "0.36" }, må velges)

seg-744e95749978 = Et klokkescenario kan ha en <c1/>-seksjon (<c2/>): et sted (<c3/>, <c4/>, <c5/>), forhåndsinnstillinger for konstellasjoner (<c6/>, standard <c7/>), en maske, en sigma for avstandsresidual, sannsynlighetene for falsk alarm og udetektert feil, de horisontale og vertikale varslingsgrensene, en epokeavstand og en valgfri oppgitt skjevhet på én satellitt. Kjøringen rapporterer da en egen <c8/>-blokk: per epoke satellittene i sikte, snapshot-RAIM-beskyttelsesnivåene og en konklusjon (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>), samt antall og tilgjengelighet over kjøringen. Så lenge tidslinjen sier at GNSS er nektet, er RAIM utilgjengelig og ingenting ekstrapoleres; et degradert vindu vurderes som nominelt. Kvalitetsmålene for holdover er uendret, og uten seksjonen er utdataene byte-identiske. MODELLED: en representativ himmel fra forhåndsinnstillinger, syntetiske residualer og oppgitte grenser. Den trenger <c14/>.

seg-139639263c90 = Gjengivelsen av maksimal URA fra EU-USAs WG-C ARAIM Milestone { "3" } (CAP-05c)

seg-97906754d4c8 = En tidligere plan lovet en sammenligning med «Table A-3» i et teknisk EU-ARAIM-notat. Ingen offentlig kilde til den tabellen lot seg finne (de offentlige Milestone { "1" }- til { "3" }-rapportene fra ARAIM-undergruppen til EU-USAs Working Group C har ingen Table A-3), så den sammenligningen er <b>trukket tilbake</b>, og ingenting lovet under det navnet.

seg-b61607c477f2 = I stedet forsøkes den rapporten som er offentlig: <b>Milestone { "3" } Report</b> ({ "25" } februar { "2016" }, kopi fra GPS.gov, SHA-256 <c1/>), tabellene { "5" }, { "6" } og { "7" }, som for hver konstellasjonskonfigurasjon og for både RNP { "0.1" } og RNP { "0.3" } oppgir den største <c2/> som gir { "99.5" } % tilgjengelighet for { "90" } % av brukerne. Tolv oppgitte oppføringer (radene Depleted og Baseline i tabellene for to frekvenser) kontrolleres, under terskler som er forhåndsregistrert i <a1><c3/></a1> før noen poengsatt kjøring, med de avvikene som ikke kan fjernes oppgitt der: ingen almanakkfiler, Walker-skall i stedet for de virkelige slottene, et grovere rutenett og trinn, og motorens ADD v4.2-horisontalvei i stedet for rapportens egen tekst. Tabellene { "8" } til { "13" } (én frekvens) og radene Optimistic forsøkes ikke, av årsakene som er oppgitt der. <b>Resultat: { "8" } av { "12" } oppføringer gjengitt, { "4" } NOT MET (festet):</b> oppføringene for to konstellasjoner og alle oppføringer for bare Galileo stemmer (inkludert N/A-radene), oppføringen for to konstellasjoner Depleted RNP { "0.1" } når dekning { "0.847" } ved { "9" } m mot oppgitt { "9" } m (trenger { "0.90" }), og tre oppføringer for bare GPS bommer vidt (dekning { "0.70" } ved { "4" } m, { "0.58" } ved { "6" } m, { "0.65" } ved { "10" } m mot oppgitt { "4" } m, { "6" } m og «>{ "10" } m»). Bommene for bare GPS kan skyldes at det jevne Walker-skallet står i stedet for de virkelige GPS-slottene (D1); det er en hypotese, ikke et funn. Resultatet forblir MODELLED uansett hva det er. Studien er <c4/>; de målte dekningene står i <c5/> og er poengsatt av <c6/>. Selve rapporten siteres, ikke medlevert.

seg-0e98826cedcc = <s1>Forrige</s1>Maskinvaresikkerhet

seg-e6f1e38977b7 = <s1>Neste</s1>Spektrum og fossefall

seg-38ab3bb65327 = Ekte snapshot-, løsningsseparasjons- og ARAIM-RAIM (src/raim.rs)
