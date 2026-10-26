# docs--positioning: translations (nb)

seg-6555ff9a6d8e = Utdata

seg-0be9b5747c00 = Kshana

seg-94058315dfe4 = Inndata

seg-09721fbcf7fc = Kilde: <c1/>

seg-5b362d7b0903 = Kshana er en åpen, reproduserbar <b>evidensmotor for robusthet i PNT (posisjonering, navigasjon og tidssynkronisering)</b>. Du beskriver et scenario – sensorene eller klokkene, et GNSS-bortfall (global navigation satellite system), et jamming- eller spoofingangrep, et budsjett – og den forteller hvor godt tid og posisjon holder, målt mot operative kvalitetsmål (FoM-er). Hver funksjon bak disse tallene er merket i en maskinkontrollert matrise som <b>VALIDATED</b> (kontrollert mot en uavhengig ekstern referanse), <b>MODELLED</b> (internt konsistent, ikke kontrollert eksternt) eller <b>PARTNER</b> (eid av en maskinvarepartner). Denne siden sier hvor den er ledende, hva den er til for og hva den ikke er.

seg-48d576a345e3 = Hvor den er ledende: tidssynkronisering og holdover for kritisk infrastruktur

seg-f41d8a48ff13 = Den best validerte delen av motoren er tidssynkronisering. Telenett, kraftnett og finansmarkeder henter tiden sin fra GNSS, og hver av dem må dimensjonere <b>holdover</b>: hvor lenge en lokal klokke kan gå fritt gjennom et GNSS-tap før tidsfeilen sprenger budsjettet.

seg-70d00c5fe203 = <b>Hva som er VALIDATED.</b> Estimatorene for frekvensstabilitet som et holdover-svar bygger på – Allan-deviasjon (ADEV), modifisert Allan-deviasjon (MDEV), tidsdeviasjon (TDEV), maksimal tidsintervallfeil (MTIE) og Theo1-estimatoren med utvidet rekkevidde – er kontrollert mot referansedeviasjoner fra Stable32, det uavhengige biblioteket <c1/> og en ekte målt cesiumklokke. Beregningen av holdover-rullingens varians og inversjonen til en holdover-tid er kontrollert mot SciPy. Se <a1><c2/></a1> for hver rad, dens test og dens uavhengige referanse.

seg-9fbedc930565 = <b>Hva som forblir MODELLED.</b> Støygulvene per klokkeklasse (for eksempel langtidsgulvet for en gitt oscillatorklasse) bestemmer svaret for en stabil klokke, og de er representative tall, ikke målinger av enheten din. Oppgi målte gulv for et tall du vil forsvare.

seg-700df4898ede = <b>Telekomenheter.</b> Scenariotypen <c1/> rapporterer MTIE og TDEV, kontrollerer dem mot maskene fra International Telecommunication Union Telecommunication Standardization Sector (ITU-T) – G.8272 for en primær referansetidsklokke (PRTC), G.8272.1 for en forbedret PRTC (ePRTC), G.8273.2 for en teleklokke av typen boundary clock (T-BC) og G.8271.1 for nettverksgrensene ved referansepunkt C – og rapporterer hvor lenge en holdover holder seg innenfor hvert tidsfeilbudsjett. Se <a1><c2/></a1>.

seg-50421d8247ab = Hva som skiller den ut

seg-7ec913b140ed = Fysikken og standardene er ikke forskjellen: Simplified General Perturbations { "4" } (SGP4)-propagering, Allan-deviasjon, referansesystemer og presisjonsfortynning finnes, gratis og korrekt, i andre biblioteker, og Kshana kontrollerer seg selv mot flere av dem. Forskjellen er evidensdisiplinen:

seg-f7d466d5215b = <b>Åpen.</b> Motoren er lisensiert under GNU Affero General Public License (AGPL), slik at hvem som helst kan lese og kjøre den på nytt. En kommersiell lisens finnes for lukket integrasjon.

seg-76ff24c1939b = <b>Reproduserbar.</b> Et resultat er bestemt av <c1/>, bit for bit, og en kjøring kan deles som en lenke til nettleser-playgrounden.

seg-6df34e089b53 = <b>Merket med proveniens.</b> Hver sensorparameter er sporet til en publisert kilde (<a1><c1/></a1>), og hver funksjon bærer sitt VALIDATED / MODELLED / PARTNER-nivå. En vakt for kontinuerlig integrasjon (CI) avviser en VALIDATED-rad uten uavhengig ekstern referanse, slik at en intern selvkontroll ikke kan fremstilles som en validering.

seg-8bccfe110f4c = Vi har ikke funnet et annet åpent verktøy som kombinerer disse på tvers av holdover, integritet, treghetsrulling og kvantesensorer, men et søk som ikke finner noe er ikke bevis for at ingenting finnes; vi hevder ikke å være den eneste.

seg-e942b2474960 = Kvante: en nøytral avveiningsmetode, resultater merket MODELLED

seg-655769464447 = Kshana sammenligner kvante- og klassiske klokker og treghetssensorer på samme scenario med samme kode: hver enhet er en feilmodell, og motoren vet ikke hvilken som er «kvante». Se på det som <b>en nøytral avveiningsmetode mellom kvante og klassisk der resultatene er merket MODELLED</b>. De fleste inndata er publiserte Allan-/støybudsjettkoeffisienter; kaldatom-interferometer-akselerometeret har et lag fra første prinsipper som utleder støykoeffisienten. En partners målte Allan-deviasjonsdata kan mates inn gjennom typen <c1/>, som er veien til å løfte en bestemt enhets tall. Se <a1><c2/></a1> og <a2><c3/></a2>.

seg-eb5d247b42aa = Lunar, cislunar og dypt rom: vedlikeholdt, ikke hovedsaken

seg-4b9bd68b7fb1 = Pakken for lunar/cislunar (integritetsovervåking på månen, tre-legeme-kjernen jord–måne, lunare tidsskalaer, analyse av tjenestevolum) og motoren for radiometrisk navigasjon i dypt rom er vedlikeholdte funksjoner. De fleste radene deres er MODELLED, og dedikerte verktøy dekker allerede lunar navigasjon, så de tilbys som funksjoner i den samme motoren, hver med sitt eget nivå, i stedet for som hovedsaken.

seg-26f242f1bef8 = Resten av motoren

seg-b9b2e29e51d9 = Den samme motoren, med de samme nivåene, dekker også:

seg-89d1923b3ed9 = <b>PNT i lav jordbane (LEO), fra ende til ende.</b> Signalutforming (<c1/>), passering og linkbudsjett per bånd (<c2/>), kringkastet navigasjonsmelding (<c3/>), fusjonert posisjonering i middels og lav jordbane (<c4/>), konvergens for presis punktposisjonering (PPP) med LEO-støtte (<c5/>), posisjonering fra et ikke-terrestrisk 5G-nett (<c6/>) og <c7/>, som gir hvert trinns utdata videre til neste for ett system.

seg-2e5b57ccd454 = <b>Spektrum.</b> Et vannfall av effekttetthetsspekter i L-bånd (og UHF-, S- og C-bånd) under en skriptet tidslinje for jammere, med forholdet mellom jammer og signal per bånd og effektiv bærebølge-til-støy-tetthet (<c1/>), og opptak i Signal Metadata Format (SigMF) inn og ut.

seg-0e7fd993a838 = <b>Solsystemet og et hvilket som helst sentrallegeme.</b> Posisjoner og fysiske konstanter for planetene og de store månene (<c1/>), posisjonering rundt hvert av disse legemene (<c2/>), og utforming av Walker-konstellasjoner og konstellasjoner med publiserte slots, med dekning og presisjonsfortynningskart rundt hvert av dem (<c3/>).

seg-9d993a356eb0 = <b>Kampanjer.</b> Eksisterende typer kjedet på én felles tidslinje, sveipet, kjørt som Monte Carlo-ensembler med seed eller kjørt side om side under felles betingelser (<c1/>).

seg-905a9aa8c47c = <b>Utdata.</b> Hver kjøring skriver et resultatdokument, et diagram og en rapport i HTML (HyperText Markup Language) og JSON (JavaScript Object Notation); <c1/> skriver en animasjon som SVG (Scalable Vector Graphics), HTML eller bildesekvens; <c2/> skriver CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON eller STK-efemeride (Systems Tool Kit) for typene som plasserer ting på jorden, og SigMF for <c3/>.

seg-75206591a52a = De fleste av disse radene er MODELLED; verifikasjonsmatrisen nevner de få som er VALIDATED (for eksempel anbefalingene fra International Telecommunication Union for regn og scintillasjon, algoritmen for Galileos kringkastede efemeride, rammekontrollen CRC-24Q (24-biters syklisk redundanssjekk) og løseren for planetenes lysgangstid).

seg-785218a0ea66 = Hva Kshana ikke er

seg-fae54ec38477 = <b>Ikke en simulator for radiofrekvenssignaler (RF) eller en hardware-in-the-loop-rigg (HIL).</b> Kshana styrer ingen radiomaskinvare og sender ingenting. Det meste av den virker på nivået feilmodeller og linkbudsjetter, før maskinvare eller labtid kjøpes. På signalnivå er den bare programvare: GNSS-IQ-laget (<c1/>) skriver IQ-sampelfiler (in-phase/quadrature) i basebånd med legitime GNSS-signaler for programvaremottakere og kjører sin egen programvaremottaker på dem; avsnittet <c3/> i typen <c2/> (siden { "0.29.0" }) skriver et SigMF-øyeblikksbilde (Signal Metadata Format) av den analytiske modellen som inkluderer de konfigurerte jammerne (støylignende jammere bin for bin, toner og chirper som bølgeformer); og <c4/> summerer en ekte og en spoofer-kopi av signalet i minnet for å teste sløyfens fangst, uten å skrive det ut. Å teste en maskinvaremottaker mot ekte RF-stimulus er jobben til en RF-simulator.

seg-ca243f3f8e8d = <b>Ikke en erstatning for MATLAB/Simulink, STK eller Orekit.</b> Den står ved siden av dem. Den leser og skriver utvekslingsformatene de bruker – CCSDS-baneefemeridemeldinger (Consultative Committee for Space Data Systems), SP3 (Standard Product { "3" }) presise baner, RINEX (Receiver Independent Exchange Format) – skriver CZML, KML, GeoJSON og STK-efemeride til visningsprogrammene deres, og den numeriske kraftmodellen krysskontrolleres mot Orekit i stedet for å tilbys som erstatning.

seg-8fa4e93c3d0e = <b>Ikke en prosesseringsmotor for GNSS-bærebølgefase eller en posisjoneringstjeneste</b> (se nedenfor).

seg-8ba4b67bc813 = <b>Ikke en sertifiseringsinstans.</b> Merkelappen VALIDATED betyr at en funksjon stemmer med en ekstern uavhengig referanse; det er ikke en sertifisering av noe produkt eller noen operatør.

seg-362b857140b9 = Hva Kshana er, og ikke er, ved siden av en prosesseringsmotor for GNSS

seg-f50951b2e9c8 = Kshana er <b>ikke</b> en <em>prosesseringsmotor</em> for GNSS-bærebølgefase, og ingen scenariotype er en posisjoneringstjeneste. Den har derimot en fot i målingsdomenet, som bibliotekkode som ytelsesstudien bygger på og som er kontrollert mot uavhengige referanser. Sanntids kinematisk posisjonering (RTK) over korte grunnlinjer med heltallsfastsetting med LAMBDA (least-squares ambiguity decorrelation adjustment) kjører på ekte tofrekvente RINEX-observasjoner, det samme gjør et statisk float-filter for presis punktposisjonering (PPP) med endelige IGS-baner og -klokker, og mottakerklokken som filteret estimerer er en tidsløsning mot IGS' endelige stasjonsklokke. Hver av de tre er en VALIDATED-rad i <a1>verifikasjonsmatrisen</a1>, mot IGS-stasjonsdataene som er nevnt der, og hver kjører på statiske, korte observasjonsvinduer, ikke som en strømmende tjeneste med flertydighetsløsning over lange grunnlinjer, bærebølgeutjevning eller en kinematisk rover. Typen <c1/> kjører et float-PPP-filter på kode og bærebølgefase, men på målinger den simulerer selv, for å studere konvergenstid med og uten LEO-støtte; den behandler ikke en observasjonsfil. Typen <c2/> (posisjon, hastighet og tid) løser en mottakerposisjon fra ekte RINEX-kodepseudoranger pluss kringkastet efemeride, validert mot en oppmålt koordinat fra International GNSS Service (IGS) (stasjon ABMF, 2018-05-13) til <b>{ "5.7" } m 3-D RMS (rot av middelkvadrat) / { "1.1" } m horisontalt</b>. Men produktet er ytelsesstudien, ikke posisjoneringstjenesten, og rammen nedenfor er ment å spare en tenkt bruker for skuffelsen over feil verktøy.

seg-169dd778c45f = En prosesseringsmotor for GNSS (RTKLIB, et åpent bibliotek for kinematisk posisjonering i sanntid; gLAB, GNSS-laboratoriets verktøysuite fra gruppen gAGE ved det tekniske universitetet i Catalonia)

seg-4faa1de0ef70 = et scenario: sensorfeilmodeller, bortfallsvinduer, geometri – eller, for <c1/>, en ekte RINEX-observasjonsfil pluss kringkastet navigasjon

seg-ae60d0def8af = ekte GNSS-observasjoner (RINEX), efemerider, korreksjoner

seg-5fce99bb803d = ytelseskvalitetsmål: holdover, feil i tid og posisjon, tilgjengelighet, grenser for integritet og sikkerhet – pluss en posisjon fra enkeltpunktsposisjonering med kode (SPP) fra typen <c1/>

seg-b752bb5c3f64 = en <b>løsning</b> for posisjon, hastighet og tid (SPP, PPP, RTK)

seg-dd8a47d4f618 = Spørsmålet den svarer på

seg-b52fd8e0c856 = «hvor god <em>ville</em> denne arkitekturen vært, og hvor svikter den?»

seg-09672ca004ac = «gitt disse målingene, hvor er jeg <em>nå</em>?»

seg-00d5ebd56088 = Kvante-/optiske sensorer

seg-a55f2bd6c1bf = modellert som feilmodeller (optiske klokker, kaldatom-treghetsmåleenhet (IMU), optisk tidsoverføring), resultater merket MODELLED

seg-7ccfb3395d84 = ikke modellert

seg-ec21dbf4b910 = Prosessering av ekte observasjoner

seg-324ef9a933d5 = SPP med kode fra ekte RINEX-observasjoner (<c1/>, meternivå); RTK over korte grunnlinjer med LAMBDA og statisk float-PPP på ekte bærebølgefase, som bibliotekkode kontrollert mot IGS-stasjoner (VALIDATED, statiske og korte vinduer, ikke en strømmende tjeneste); pluss geometri / presisjonsfortynning (DOP) / tilgjengelighet

seg-e15db8a33a9a = kjernekompetansen, helt til PPP/RTK med bærebølgefase

seg-e6df7ccdba96 = null – kjører i en nettleserfane (WebAssembly)

seg-812c1c70ce63 = native bygg / verktøykjede

seg-58df67617e1a = Utfyllende, ikke konkurrerende – RTKLIB og gLAB

seg-29aeb97bd509 = <a1>RTKLIB</a1> og <a2>gLAB</a2> er modne, mye brukte prosesseringssuiter for GNSS. De tar ekte målinger og produserer en posisjoneringsløsning (SPP/PPP/RTK; gLAB er også et fremragende undervisningsverktøy med sterk arv ved European Space Agency (ESA) og European Geostationary Navigation Overlay Service (EGNOS)). Kshana erstatter dem <b>ikke</b> og prøver ikke å gjøre det. Observasjonsbanen er smal: enkeltpunktsposisjonering med kode (<c1/>) og, som kontrollert bibliotekkode, RTK over korte grunnlinjer med heltallsfastsetting med LAMBDA og et statisk float-PPP-filter på ekte tofrekvente observasjoner, hver VALIDATED mot IGS-stasjonsdata (PPP-filteret også mot en RTKLIB-kjøring på de samme inndataene). Den har ingen bærebølgeutjevning, ingen kinematisk eller strømmende prosessering og ingen flertydighetsløsning over lange grunnlinjer, og <c2/> estimerer ikke troposfæren eller ionosfæren – den bruker troposfæremodellene Saastamoinen/Niell og den ionosfærefrie L1/L2-kombinasjonen, den løser ikke for dem som tilstander.

seg-9c4e70ce8a55 = Rørledningen er utfyllende:

seg-01f43da4858c = <b>RTKLIB / gLAB</b> svarer på <em>«hvor er jeg, ut fra disse signalene?»</em>

seg-f5370894cdd1 = <b>Kshana</b> svarer på <em>«hvor lenge beholder jeg et godt svar når disse signalene opphører – og hvor mye kjøper en bedre klokke eller treghetssensor, klassisk eller kvante, meg?»</em>

seg-2403d6b115de = En naturlig arbeidsflyt bruker en prosesseringsmotor for segmentet der GNSS er tilgjengelig og Kshana for å studere <b>holdover</b>-oppførselen og sensoravveiningene rundt den. Hvis du trenger en posisjoneringstjeneste med bærebølgefase – kinematisk PPP eller RTK, lange grunnlinjer, flertydighetsløsning i nettverk – bruk RTKLIB eller gLAB; hvis du trenger reproduserbar, merket evidens om robusthet og holdover, er det den jobben Kshana er bygget for.

seg-21631e5c6be3 = Et nettleserlag uten installasjon

seg-9b01dd6721ed = De fleste simuleringsverktøy på dette feltet (RTKLIB, gLAB, General Mission Analysis Tool (GMAT), Orekit, STK) krever en native installasjon eller en lisens, og en læringskurve før det første resultatet. Kshana kompileres til WebAssembly og kjører <b>helt i nettleseren</b> – <a1>playgrounden</a1> laster et gjennomarbeidet scenario, kjører den ekte motoren hos klienten (ingenting lastes opp) og viser resultatet i løpet av sekunder. Veiledede glidere og scenarioer med ett klikk gjør at det første nyttige resultatet verken trenger TOML (Tom's Obvious Minimal Language, filformatet for scenarioer) eller en verktøykjede.

seg-b1cb4b8f0ef1 = Dette laget uten installasjon er en bevisst posisjon:

seg-33b361bde50d = <b>Rekkevidde</b> – en gjennomgangsperson, student eller innkjøper kan prøve selve motoren fra en lenke, på hvilken som helst enhet, uten oppsett.

seg-a4a4ebf89cee = <b>Reproduserbarhet</b> – den samme motoren som leveres i nettleseren er biblioteket som leveres på crates.io, Python Package Index (PyPI) og npm; et resultat kan gjenskapes fra <c1/>, og en kjøring kan deles som en URL (nettadresse).

seg-3d3d4bda606c = <b>Ærlighet</b> – å kjøre motoren selv, åpent, er det sterkeste motargumentet mot «stol på tallene»: nettleserlaget <em>er</em> revisjonsflaten.

seg-6095bcacb725 = Nettleserlaget gjør ikke Kshana til en erstatning for en prosesseringssuite på skrivebordet – det gjør spørsmålet om avveiningsstudier av ytelse tilgjengelig for folk som aldri ville installert en.

seg-938ca8eab04c = <a1><c1/></a1> – kartet over omfanget rad for rad (hele omfanget og residualene til <c2/>-løseren står i raden <b>GNSS / PNT processing</b>).

seg-9e94b1740386 = <a1><c1/></a1> – hva som er validert, med evidens.

seg-3a02f39bd90a = <a1><c1/></a1> – typen for telekomtidssynkronisering og maskene den bruker.

seg-c5aa08e4ca55 = <a1><c1/></a1> – definisjoner på vanlig språk av begrepene som brukes her.

seg-85aaaa34ea7c = <a1><c1/></a1> – playgrounden i nettleseren.

seg-54e2deeffc7d = <s1>Forrige</s1>Arkitektur

seg-b2f93c49d5c6 = <s1>Neste</s1>Endringslogg
