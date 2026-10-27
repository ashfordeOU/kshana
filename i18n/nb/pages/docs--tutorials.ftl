# docs--tutorials: translations (nb)

seg-501402fc366f = Klokkens holdover

seg-cae10fb9bff8 = Scenario

seg-a0b63210b807 = Les mer

seg-a7cfe6f135f1 = Bane og geometri

seg-835df2d05f2a = Målingsdomenet i GNSS

seg-3a0e724a8a2b = Nivå

seg-28e87f407a10 = Område

seg-d6476863f862 = Funksjon

seg-029de6b99be0 = Treghetsnavigasjon (dead-reckoning)

seg-9ef8f99ca6e4 = Tidsoverføring

seg-b03d56f501c3 = Type

seg-ec26df467b88 = Felles Kalman-sensorfusjon for PNT over de samme hybride inndataene.

seg-4f19d4fb1341 = Generisk N-D-sveip over en vilkårlig pakke via TOML-nøkler med punktum / JSON-metrikkstier.

seg-e7ab7b55c969 = 1-D-sveip for avveiningsstudie over en parameter i klokkepakken.

seg-e43910de5fd8 = Notebooks

seg-d78822583c64 = Notebook

seg-3959aefa12be = Kilde: <c1/>

seg-a5ebe4befda8 = Praktiske, gjennomgåtte eksempler som tar deg fra «kjør et medfølgende scenario» til «tallfest og forsvar et resultat». Hvert tall i de tre veiledningene er et ekte motorutdata, forankret i en ekstern (ikke-sirkulær) autoritativ referanse, og <b>festet av en integrasjonstest</b> (<c1/>), så en veiledning aldri i det stille kan drive bort fra det motoren faktisk gjør. Hvis en veiledning sier at den optiske klokken holder { "6600" } s, får bygget feil den dagen det slutter å være sant.

seg-1c045624a6be = Kshana er en simulator for posisjonering, navigasjon og tidssynkronisering (PNT). Veiledningene bruker noen flere forkortelser, hver skrevet ut der den først forekommer: GNSS (Global Navigation Satellite System), GPS (Global Positioning System), CLI (command-line interface) og TOML (Tom's Obvious Minimal Language, scenariofilformatet).

seg-7a84a80b57d5 = Ny i prosjektet? Les <a1>konseptintroduksjonen</a1> og <a2>ordlisten</a2> først, og kom så tilbake hit.

seg-b4cd44590347 = De tre gjennomgåtte eksemplene

seg-eebeab9693b2 = Veiledning

seg-a0bc6e585d71 = Hva du lærer

seg-b6cc01b76947 = Scenariotype

seg-429bab0a0e05 = Vanskelighetsgrad

seg-0e188f9c0f65 = ~Tid

seg-bcf40448e55d = Min første bane: hvor er GPS-satellittene

seg-de1032024a69 = propager en ekte GPS-konstellasjon, les tilgjengelighet, presisjonsfortynning for posisjon (PDOP) og posisjonsnøyaktighet, og eksporter hvor satellittene faktisk er (presist baneformat SP3)

seg-e7b6c262333e = nybegynner

seg-d6042fb74a5f = { "15" } min

seg-07a8d6cfc1ae = Klokkens holdover: hvor lenge kan du seile på egen kraft

seg-0e9c77468fb2 = kjør en klokke-holdover uten GNSS, les tidskvalitetsmålet og forstå vekstloven √(q_wf·T) bak det

seg-0f6fba31626a = { "20" } min

seg-7973e9c54366 = Kvante mot klassisk GNSS-robusthet

seg-4d8036091b37 = avslutningsoppgaven: en spoofing-detektor (<c1/>) og en full fusjonert PNT-pakke (<c2/>), og hvordan du leser sikkerhet / integritet / dødregning sammen

seg-1b39d4927602 = middels

seg-ea37ac575235 = { "35" } min

seg-1d56222dfd25 = Kjørbare Jupyter-notatbøker, på syntetiske data og offentlige elementsett som bare ligger i depotet, finnes i <a1><c1/></a1>:

seg-9aae3a4e10dc = Fartøytillit og trening

seg-1d680d635c6d = generer en syntetisk NMEA-strøm fra en bro med en skriptet hendelse, og skår den deretter med fartøyets tillitsmonitorer (veiledende, ikke typegodkjent navigasjonsutstyr)

seg-739f8f5a9082 = hvor navigasjonsdata har sett degradert ut, og hvor stor del av en rute det berører

seg-443c908ff49b = Compliance-kartlegging og testbenk-eksport

seg-0d639065192a = hvilke offentlige rammeverksrader et sett kjøringer gir belegg for (aldri at et rammeverk er oppfylt), og et scenarios bevegelse og hendelser eksportert som tekst for en GNSS-simulator i laboratoriet (ingen signaler skrives)

seg-981a3238794d = Kvante mot klassisk GDOP

seg-228ce150ee80 = den samme konstellasjonsgeometrien med en kvantesensor og en klassisk sensor, sammenlignet ved presisjonsfortynning

seg-4b82b5edd4ff = Himmelgeometri under en horisontlinje

seg-1186b6cd6149 = satellittene et sted ser under en gate- eller kaihorisont, deres DOP og feilellipse, en datert himmel fra elementsett og en seedet Monte Carlo mot kovariansen (MODELLED)

seg-d9d06cb8e237 = Hvordan du kjører en veiledning

seg-ffc4ddfc9426 = Hver veiledning kjører det samme scenarioet på tre måter; velg den som passer deg. De kaller alle <em>den ene</em> motoren, så tallene er identiske (speiler README-avsnittet <a1>Usage</a1>).

seg-e7ba76a06aa6 = <b>Kommandolinje.</b> CLI-et velger ut fra scenarioets felt <c1/> og skriver <c2/>, <c3/>, <c4/> og <c5/> ved siden av inndataene (JSON er JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Noen få typer publiserer også en reproduserbarhetstabell som <c6/> (kommaseparerte verdier): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> og <c12/> når et eksportsted er satt. Ingen av de tre veiledningene er blant dem, så du ser ikke den filen her.

seg-5ee6f15d3b08 = <c1/> bygger CLI-et fra denne utsjekkingen. Med en installert binærfil (<c2/>) er den samme kommandoen <c3/>. Uten utsjekking følger de fleste medfølgende scenarioene med i binærfilen: <c4/> lister dem (og navngir de få som ikke følger med, med begrunnelse), og <c5/> skriver ut ett: kopien av <c6/> som binærfilen ble bygget med.

seg-1b7e851749d5 = <b>Python.</b> Bygg utvidelsen fra denne utsjekkingen én gang med maturin, inne i et aktivt virtuelt miljø, og kall deretter <c1/>:

seg-3aa10d551694 = <c1/> installerer det publiserte hjulet i stedet. Det kan ligge etter denne utsjekkingen: <c2/> forteller deg hvilke scenariotyper bygget ditt har.

seg-333b7956b06b = <b>Lekeplass i nettleseren.</b> Ingen installasjon: åpne <a1>Studio</a1>, velg et scenario, rediger parameterne og les resultatet. Ingenting lastes opp; motoren kjører hos klienten som WebAssembly.

seg-2cd8bbd1e7f0 = Veiledningene siterer <b>CLI-et</b>, men hver kommando har Python- og lekeplassekvivalenten ovenfor. Hvert resultat kan gjengis fra <c1/>: kjør det to ganger, og du får bit-identiske utdata.

seg-d497caeb889a = Kommenterte undervisningsscenarioer

seg-c966709a600d = For hvert funksjonsområde finnes én rikt kommentert <c1/> under <a1><c2/></a1>: en <em>undervisningskopi</em> av et kanonisk scenario med hvert felt forklart i teksten, den siterte referansen navngitt og den forventede oppsummeringen på én linje registrert som en <c3/>-kommentar. Feltverdiene er identiske med forelderens i depotets <c4/>-katalog på toppnivå (<c5/> sammenligner den tolkede TOML-en), så de dokumenterte utdataene forblir riktige. De gylne hashene er heller ikke rørt: en kommentar endrer aldri en scenariohash.

seg-871fcecc5ee1 = Undervisningsfil

seg-4e852a6a1581 = Utledet fra

seg-e74e1c9b387e = Integritet (RAIM, receiver autonomous integrity monitoring)

seg-95b6cceb76e6 = Sikkerhet (spoofing)

seg-dab48471c270 = Hybrid PNT

seg-c889e5e77121 = Undervisningsfilen for <b>sikkerhet</b> bruker <c1/> inni: sikkerhetsmålet (<c2/>, én minus sannsynligheten for udetektert feil) produseres av spoof-pakken. Filnavnet følger <em>funksjonen</em> (sikkerhet), mens <c3/> følger <em>pakken</em> (spoof). Overskriften i den filen påpeker dette.

seg-89fef83a9d54 = Den fullstendige katalogen over scenariotyper

seg-648bb07212cd = Motoren velger ut fra scenarioets <c1/>. Tabellen nedenfor lister de mest brukte typene (de åtte veiledningsområdene ovenfor pluss deres nærmeste naboer). Den er <b>ikke</b> det fullstendige settet: <c2/> returnerer alle <c3/> innebygde typer. Den funksjonen (eksponert som <c4/> i bindingene for Python og WebAssembly (WASM), og som <c5/> på kommandolinjen) er den autoritative, alltid oppdaterte katalogen, og <a1><c6/></a1> er den genererte oppregningen av den, ett avsnitt per type med de påkrevde og valgfrie TOML-feltene. <c7/> sørger for at hver type en veiledning dokumenterer, er en ekte type, så ingenting i denne tabellen kan navngi en type som ikke finnes.

seg-0f744a3a7193 = Klokkens holdover mot spesifikasjonen; valgfritt Monte Carlo-ensemble (<c1/>).

seg-9a2564fdc86a = 1-DOF (én frihetsgrad) inertiell dødregning under et GNSS-utfall.

seg-62f0400581b3 = GNSS-tilgjengelighet + presisjonsfortynning (DOP) fra en konstellasjon (Walker / two-line elements / RINEX, Receiver Independent Exchange-formatet).

seg-59fc8330ba12 = Snapshot / solution-separation / ARAIM (advanced RAIM) med horisontale og vertikale beskyttelsesnivåer (HPL/VPL) + Stanford-diagram.

seg-22c598d57e77 = ARAIM-passering med beskyttelsesnivå ved månens sørpol mot et sett LunaNet-reléer.

seg-f97d8fb3b6fa = Optisk mot radiofrekvent (RF) toveis tids-/frekvensoverføring.

seg-8af1c652d854 = Hybrid PNT som avslutningsoppgave: klokke + treghetsmåleenhet (IMU) + hjelp fra tidsoverføring.

seg-d24a9596f53e = Løst og tett koblet GNSS/INS (treghetsnavigasjonssystem) utvidet Kalman-filter med feiltilstand.

seg-3c915870476a = Simulering av pseudoavstand i måledomenet (Klobuchar-ionosfære, Saastamoinen/Niell-troposfære) + RAIM.

seg-72284bad54e4 = Jamming med linkbudsjett: jammer-til-signal-forhold (J/S) → effektiv bærebølge-til-støytetthet (C/N₀) → tap av lås.

seg-2ead4d42b427 = Stokastisk detektor for tidsspoofing (Neyman–Pearson / χ²₁) med Monte Carlo-sannsynligheter for falsk alarm og udetektert feil (P_fa/P_md).

seg-5f2f9e63093a = Utover veiledningene: nyere funksjoner

seg-3d6a8fd31402 = De tre veiledningene holder seg til de klassiske pakkene for klokke, bane og sikkerhet. Motoren har vokst langt forbi dem. Hver rad nedenfor er et medfølgende scenario du kan kjøre som det er (<c1/> eller <c2/>); oppsummeringen er den første linjen kshana { "0.35.0" } skrev ut for det den 2026-10-10. I motsetning til tallene i veiledningene er disse linjene en registrering av én kjøring, ikke festet av <c3/>: kjør scenarioet på nytt for å få gjeldende verdi. Resultatene oppgir sitt eget virkeområde (de fleste har en <c4/>), og <a1>verifikasjonsmatrisen</a1> sier hvilke funksjoner som er VALIDATED mot en ekstern uavhengig referanse og hvilke som er MODELLED.

seg-2dc1d8680abb = Første linje i oppsummeringen

seg-abd799395f27 = L-bånd-spekter og jamming-fossefall

seg-33453b2cfdf3 = Solsystemet ved én epoke

seg-23bc4ff7f741 = Posisjonering rundt et annet himmellegeme

seg-c135b151e469 = Konstellasjonsutforming i stor skala

seg-065995e9bd5e = Kampanjer: typer kjedet på én tidslinje

seg-dbae357e7e34 = Ett LEO-PNT-system fra ende til ende

seg-9d3d72ea03df = Fusjonert MEO- og LEO-posisjonering

seg-acc2793d1721 = LEO-signaler, passeringer og navigasjonsmeldinger

seg-db2626e54a24 = <c1/> (passeringen)

seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

seg-aa93235e8c6d = PPP-konvergens med et LEO-lag; 5G-posisjonering

seg-01160980ce50 = Robusthet: GNSS jammet, LEO bærer brukeren

seg-adf8453bc035 = Vertikaler: bane, sjøfart, telekom, kjøretøy, Arktis

seg-15a5098b5045 = <c1/> (og de andre <c2/>-filene)

seg-e6494ed83ee3 = Telekom-holdover mot klokkegrensene i ITU-T (International Telecommunication Union, Telecommunication Standardization Sector) G.8272

seg-dfc04f1abe82 = LEO er lav jordbane og MEO middels høy jordbane; PVT er posisjon, hastighet og tid; PPP er presis punktposisjonering; 5G er femte generasjon mobilstandard; TDB er Barycentric Dynamical Time; JD er juliansk dato; TE er tidsfeil.

seg-1d45d94f2e5b = CLI-et legger til tre utdata oppå enhver kjøring:

seg-893276648fec = <b>Rapporter.</b> Hver kjøring skriver <c1/> og <c2/> (se <a1>REPORTS.md</a1>). <c3/> kjører en suite av scenarioer inn i én <c4/> og <c5/>, for eksempel <c6/>.

seg-e9f06d47c82c = <c1/> gjengir kjøringens tidsserier, for eksempel skriver <c2/> på <c3/> filen <c4/>. En type uten samplet tidsakse (som <c5/>) avvises med en feil; se <a1>ANIMATION.md</a1>.

seg-f037fe5d7ffa = Interop-eksporter.

seg-3977722b8517 = <c1/> skriver resultatet for andre verktøy: CZML (Cesium Language), KML (Keyhole Markup Language, for Google Earth), GeoJSON (geografisk JSON), en STK-efemeride (Systems Tool Kit) eller en SigMF-registrering (Signal Metadata Format). <c2/> sier hvilke formater som gjelder for et scenario; SigMF gjelder bare <c3/>. Baneskjemaet eksporterer også <c4/>, <c5/> og <c6/> (CCSDS, Consultative Committee for Space Data Systems, banemeldinger). Se <a1>INTEROP.md</a1>.

seg-3abd51182cc0 = Gradelte øvelser

seg-9513af4fb862 = Arbeid deg gjennom stigen. Hvert nivå er vanskeligere og mer forsvarlig enn det forrige; referanseløsningene ligger i <a1><c1/></a1>.

seg-89ad8eb64a54 = Mål

seg-0a824838ef57 = Hva du gjør

seg-2463a86470b8 = Referanseløsning

seg-7ce3ac2347b9 = Nivå { "1" } — kjør og les

seg-e1dee35aedff = kjør et medfølgende scenario uendret og les ett kvalitetsmål

seg-296694716b3b = Kjør <c1/>; skriv ut <c2/> for kvante mot klassisk. CLI, lekeplass eller et Python-kall på én linje.

seg-bad6d3afb6a0 = Nivå { "2" } — rediger og sveip

seg-c18da238e470 = endre én parameter og observer en monoton effekt

seg-598ca8efea83 = Stram inn klokkespesifikasjonen (<c1/>) eller forleng utfallet og se holdoveren falle; eller bruk <c2/>/<c3/> til å tabulere den.

seg-1d9dfecce6fa = Nivå { "3" } — tallfest og forsvar

seg-5b57f2c8ffb9 = Monte Carlo, konfidensbånd, reproduserbarhet og et beskyttelsesnivå

seg-0fac2036b289 = Kjør et klokkeensemble (<c1/>), les båndet [p05–p95], bekreft at to kjøringer gir en identisk <c2/>, og les et integritets-/Stanford-resultat.

seg-45dc753da682 = Referanseløsningene bruker Python-utvidelsen (først <c1/>). Kjørt fra depotets rot skriver <c2/> ut at holdoveren til atomklokken på brikkenivå faller fra { "2610" } s ved en spesifikasjon på { "20" } ns til { "1140" } s ved { "5" } ns.

seg-e59b1beadb98 = Vil du ha ferske data?

seg-530db2e609d0 = Hovedtallene i disse veiledningene kjører helt og holdent fra scenarioer som allerede ligger i depotet. Ingenting hentes, og det er det som gjør dem reproduserbare og trygge å kjøre i kontinuerlig integrasjon (CI). For øvelsene «utvid det» kan du hente levende data:

seg-6a20ec96cb92 = <b>GPS two-line elements (TLE-er)</b> (oppdater baneskonstellasjonen): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, rene elementsett med 3 linjer (navn + linje { "1" } + linje { "2" }). Hjelper: <c1/>. Åpne data (katalog fra US Space Force 18th Space Defense Squadron, videredistribuert av Celestrak, Dr T. S. Kelso).

seg-9bcea1d9eb12 = <b>Verifikasjonsreferanse for SGP4 (Simplified General Perturbations { "4" })</b> (allerede inkludert, ikke hent på nytt): testvektorene i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 «Revisiting Spacetrack Report #3», <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, brukt av <c1/>; se <a2><c2/></a2>.

seg-d33aa34b2762 = <b>Referanse for klokkestabilitetssammenhenger</b>: NIST (National Institute of Standards and Technology) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, sammenhengene mellom σ_y(τ) og fase bak veiledning { "2" }.

seg-36be39f17e35 = <s1>Forrige</s1>Studio-veiledning

seg-6f6204737a87 = <s1>Neste</s1>{ "1" } · Din første bane
