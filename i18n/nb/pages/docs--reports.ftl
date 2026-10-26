# docs--reports: translations (nb)

seg-3ea93ae372ca = Hva det inneholder

seg-245adc6e6766 = <s1>Forrige</s1>Kampanjer

seg-aa5482ac34ff = Begrensninger, oppgitt uten omsvøp

seg-b0dcf3142564 = Kilde: <c1/>

seg-4c412bb0ce63 = Hver kjøring av kommandolinjegrensesnittet (CLI) skriver en rapport ved siden av resultatet: en utskriftsvennlig HyperText Markup Language-side (HTML), <c1/>, og et maskinlesbart JavaScript Object Notation-dokument (JSON), <c2/>, med samme innhold. Rapporten fungerer for enhver scenariotype og for kampanjer.

seg-e26b1a83a86d = Resultatdokumentet svarer på <em>hva motoren beregnet</em>. Rapporten legger til det en leser trenger før hun handler på det: hva som gikk inn, hva tallene hviler på, hva som ble utelatt, og hvordan man får de samme bytene igjen. Den finner ikke opp noe av dette. Hver seksjon leses fra en kilde motoren allerede har, og kilden er navngitt ved siden av det den siterer.

seg-bf0456f18e4f = Byggeren er <c1/> (<c2/>). Den er en ren funksjon av kjøringens utdata, scenariofilens bytes og kommandolinjen: den leser ingen klokke, ingen fil og intet nettverk, og den bygges for WebAssembly.

seg-bed0af192da5 = Seksjoner

seg-fca842769048 = Seksjon

seg-2654051d8292 = Leses fra

seg-5790851a4a5f = Sammendrag for ledelsen

seg-3d34b2ef5988 = hva typen gjør, kjøringens enlinjers sammendrag, hovedtall, ærlighetsetiketten for hele kjøringen, antallet VALIDATED / MODELLED / PARTNER funksjoner som er brukt

seg-923111083001 = typekatalogen (<c1/>), resultatets <c2/>, dets <c3/>-blokk eller blokk med kvalitetsmål, persentilene til en Monte Carlo-kampanje

seg-e1ce0e8d5c61 = hvert felt scenariofilen setter, flatet ut til sin sti, med enheten og hvor enheten kom fra

seg-fbd2e96c92c7 = scenariofilen; enheter fra resultatets <c1/>-blokk (skjemaet for feltenheter, <c2/>), ellers feltnavnets suffiks (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); en enhet ingen av dem oppgir, skrives ut som <b>ikke oppgitt</b>

seg-88ccaef6fc49 = kjøringens diagram, hver skalar i resultatdokumentet med sin enhet, og en oppsummering med antall / minimum / maksimum / første / siste for hver numeriske kolonne

seg-42a82485f8c8 = resultatdokumentet og dets <c1/>-blokk

seg-f554fbcdd85c = Aggregering (kampanjer og sveip)

seg-7c0466805f54 = nodetabellen til et sveip; gjennomsnitt, standardavvik, 5. / 50. / 95. persentil og { "95" } %-konfidensintervallet for gjennomsnittet for en Monte Carlo-kjøring, med et histogram per mål; fasetabellen til en kjede; de felles betingelsene, medlemmene og den samlede oppsummeringen til en sammensetning

seg-7b5f5b635905 = kampanjeresultatets seksjon <c1/>, <c2/>, <c3/> eller <c4/>; rutenettet til et <c5/>- eller <c6/>-resultat

seg-3bf44008fc65 = Animasjon og eksport

seg-64d1073dfadc = kjøringens animerte tegning (utdataene fra <c1/>) innebygd som et inert bilde, eller hvorfor det ikke finnes noen; lenker til animasjons- og interoperabilitetsfilene den samme kommandoen skrev ved siden av rapporten; hvert eksportformat med om det gjelder for scenarioet, hvorfor ikke, og spesifikasjonen

seg-ad7792e04197 = animasjonseksportøren (<c1/>), <c2/> og filene kommandolinjen skrev (<c3/>, <c4/>)

seg-3d3781a3691b = Hendelsestidslinje

seg-f29f1b90edbd = tidsfestede vinduer og punkthendelser, tegnet og tabulert på kjøringens tidsakse

seg-4271c092fa45 = scenariotabeller med <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> eller et starttidspunkt; kjøringens tidsspenn <c7/>; enhver <c8/>-tabell i resultatet; en kampanjes faser og overleveringer

seg-00bee96167aa = Verifikasjonsetiketter

seg-6dea392111a6 = hver rad i verifikasjonsmatrisen som kjøringens typer bruker, med etikett, uavhengig referanse og testbelegg, og nivåene per tall som resultatet oppgir

seg-ca56309b9693 = verifikasjonsmatrisen (<c1/>, <c2/>), gjennom kryssreferansen fra type til rad <c3/>

seg-c19ae28a2355 = Ikke modellert, og forutsetninger

seg-aff7a016c7e2 = hver begrensning, sitert

seg-9be853632d3a = resultatets blokker <c1/>, <c2/> og <c3/>; MODELLED-klausuler i typekatalogen; scenariokommentarer og inndatatekst som sier "not modelled"; matrisens begrunnelse for hvorfor hver MODELLED-rad forblir modellert (<c4/>)

seg-a3ee5ba71183 = Reproduserbarhetsregister

seg-a9746c2f1881 = motorversjon, kildekommit, Secure Hash Algorithm 256-bit (SHA-256)-sjekksummer for scenariofilen og resultatdokumentet, seed, plattform, den nøyaktige kommandoen, regelen for arbeidsmappen, sjekksummen for hver ytterligere inndatafil

seg-ec1f62f6bbd1 = bygget, filene, kommandolinjen

seg-ea460048debd = En seksjon uten noe å liste opp sier hvorfor i én setning (for eksempel "No timed event: the scenario scripts no window or onset time and the result reports no event"). Ingen seksjon er noensinne tom og taus.

seg-b99234469953 = Hva en etikett i rapporten betyr

seg-f9060b1e8077 = En verifikasjonsetikett gir en karakter til <b>funksjonen</b> som er navngitt i en matriserad, slik matrisen registrerer den. Den gir ikke karakter til scenarioets konfigurasjon, og en VALIDATED-rad gjør ikke at inndataene til en kjøring er målt. En PARTNER-rad er en disiplin kjøringen støtter seg på og som Kshana ikke leverer (antennemaskinvare for radiofrekvenstypene, kvantenyttelasten for kvantetypene, romfartøybussen for holdningsbudsjettet); rapporten viser den som <em>støttet på, ikke levert</em>.

seg-da422ae044d2 = Kryssreferansen fra type til rader er en tabell med matrisens <c1/>-strenger. Etiketten, den uavhengige referansen og belegget leses tilbake fra matrisen når rapporten bygges, så å flytte en rad mellom VALIDATED og MODELLED flytter hver rapport med den. En kampanje har raden for sin modus (kjede, sveip eller Monte Carlo, sammensetning) pluss hver rad for hver medlemstype den kjørte; <c2/> har radene for typen den sveipet. Hver kjøring har også raden "Reproducibility & software assurance", som er det reproduserbarhetsregisteret hviler på.

seg-f38434695c28 = En rad som bare gir karakter til én inndatavei for en type, er bare oppført når kjøringen tok den veien (<c1/>): <c2/> og <c3/> har raden "Orbit propagation & determination" bare med en <c4/> (Simplified General Perturbations { "4" }-veien (SGP4); en analytisk bane er en tolegemepropagering), og <c5/> har raden for målt register bare med en <c6/>. Den samme tabellen styrer flerbåndsraden for <c7/> etter om kjøringen tegner <c8/>, og radene for typene i lav jordbane (LEO) etter veien hver kjøring tok: en rad for regn, bygningsinntrengning, lav energi eller spoofer i <c9/> eller <c10/> bare når scenarioet setter det leddet, scintillasjonsraden med mindre scenarioet slår den av, en rad for presis punktposisjonering i <c11/>, <c12/> eller kjede bare for analysen eller modusen resultatet har, og raden for LEO-systemets forhåndsinnstilling bare når en navngitt forhåndsinnstilling brukes. Raden for leseren av Shuttle Radar Topography Mission (SRTM) har ingen type: <c13/> og <c14/> kjører på en syntetisk digital høydemodell (DEM), og intet scenariofelt leser en SRTM-flis. En VALIDATED-rad som kjøringen aldri berørte, ville ellers hevde belegg kjøringen ikke har.

seg-29efeadac5c7 = Reprodusere en kjøring fra rapporten

seg-e859939f0f42 = <c1/> → <c2/> har alt som trengs:

seg-d65ad1b942e3 = Kontroller scenariofilen mot <c1/>, og hver fil i <c2/> (en <c3/>-fil for jordorientering) mot sin sjekksum.

seg-5b3c59266451 = Kjør <c1/> fra mappen den opprinnelige kjøringen ble startet i. Scenariostien, og enhver relativ datasti inne i scenarioet, løses opp mot den.

seg-9f38218af0f0 = Den nye <c1/> har SHA-256-en i <c2/>, og den nye <c3/> og <c4/> er byte-identiske med de gamle.

seg-a04db3e1c7f5 = <c1/> gjør nøyaktig dette for et klokkescenario, en kjedet kampanje, en sveipkampanje og en orbit-kjøring med en <c2/>-fil: den leser kommandoen ut av rapporten, kjører den i en fersk mappe som bare har de registrerte inndataene, og sammenligner bytes.

seg-1e2e9158544d = <c1/> er sjekksummen av filens nøyaktige bytes. Resultatets egen <c2/> er noe annet, typens fingeravtrykk av scenarioet (ofte av en kanonisk form), og rapporten skriver ut begge, merket.

seg-3d72d2059a6c = <b>Seed.</b> Seeden er scenarioets <c1/>, ellers den resultatet oppgir. For en type som ikke tar noen seed, sier rapporten det, og at scenariofilen og motorbygget alene fastsetter resultatet.

seg-50457327734e = <b>Kildekommit.</b> Motoren registrerer kommiten bare hvis den ble bygget med miljøvariabelen <c1/> satt, lest ved kompilering:

seg-3c7ed74729d3 = Et bygg uten den rapporterer kommiten som ikke registrert, og motorversjonen identifiserer utgivelsen. Ingenting gjettes.

seg-86ff67531a0e = <b>Plattform.</b> Operativsystem, arkitektur og familie for bygget. Resultatene er byte-identiske på én plattform; på tvers av plattformer kan flyttallsresultater avvike i de siste sifrene (se <a1>REPRODUCIBILITY.md</a1>).

seg-eeb07da80914 = Determinisme og det ene tidsstempelet

seg-995ad516f5ae = Samme scenariobytes, seed og motorbygg gir en byte-identisk <c1/> og <c2/>. Rapporten har ingen tidsstempel. Den eneste klokkeavlesningen i hele craten er den <c3/> gjør, som setter <c4/> inn i resultatdokumentet; rapporten viser deretter det stempelet og sier at det er det ene feltet en reproduksjon ikke vil stemme overens med. For å unngå det kjører du uten <c5/>. <c6/> bygger rapporten for hver scenariofil under <c7/> (bortsett fra suitemanifestet) to ganger, og kjører seks scenarioer på nytt (blant dem én kampanje av hver av modusene kjede, sveip og sammensetning) for å kontrollere dette fra ende til ende.

seg-8a3fc60a5b54 = Skrive ut til PDF

seg-201bcec2caa3 = Motoren skriver ikke Portable Document Format-filer (PDF). En PDF-skriver som gjengir diagrammene, ville betydd en ny, tung avhengighet, så det finnes ikke noe <c1/>-alternativ. I stedet har <c2/> et utskriftsstilark: åpne den i en nettleser, skriv ut og velg «Lagre som PDF».

seg-13f1f294ede1 = Stilarket er skrevet for både A4 og US Letter. Det setter ingen papirstørrelse (valget i utskriftsdialogen gjelder), beholder marger på { "15" } mm / { "14" } mm som passer begge ark, bytter til svart på hvitt, gjentar tabelloverskrifter på hver side, hindrer at tabellrader, figurer og kort deles over sider, holder overskrifter sammen med teksten som følger, og starter seksjonene for inndata, resultater, verifikasjonsetiketter og reproduserbarhet på en ny side. Navigasjonslinjen er skjult i utskrift.

seg-a25bb320665d = JSON-dokumentet

seg-9d9af39942a7 = <c1/> har <c2/> og <c3/>, deretter <c4/> og <c5/> og én nøkkel per seksjon: <c6/>, <c7/>, <c8/>, <c9/> (bare kampanjer og sveip), <c10/>, <c11/>, <c12/>, <c13/> (seksjon 3b: <c14/>, <c15/> og <c16/>) og <c17/>. En listeseksjon har <c18/>, <c19/> (radene sidegrensen utelot; resultatdokumentet har hver verdi) og, når <c20/> er tom, en <c21/> som sier hvorfor. En verdi beholder sin rå JSON-form i <c22/> og teksten siden viser i <c23/>; en manglende verdi er <c24/> i <c25/> og "no value" i <c26/>.

seg-06cc70ca3601 = <b>Enheter.</b> Der verken skjemaet for feltenheter eller feltnavnet gir en enhet, sier rapporten "not stated" i stedet for å gjette. Inndata nøstet inne i medlemsscenarioene til en kampanje løses opp bare mot kampanjens egen enhetsblokk og feltnavnets suffiks, så flere av dem leses som "not stated" enn i en frittstående kjøring.

seg-023d5a1fbffc = <b>Vurdering av kryssreferansen.</b> Hvilke matriserader en type bruker, er en kuratert tabell, kontrollert av en test for å navngi nøyaktig én eksisterende rad per oppføring og dekke hver innebygde type. Om hver avbildning er den riktige, er en menneskelig vurdering, som matrisens eget valg av uavhengig referanse.

seg-0a7465f4c29a = <b>Grenser.</b> Siden lister høyst { "400" } inndata, { "150" } skalare resultater, { "60" } numeriske kolonner og { "200" } hendelser; <c1/> teller resten. En tabell med mer enn { "24" } rader inne i et scenario (en innlest serie) oppsummeres per kolonne.

seg-1fa26ed86bb8 = <c1/> beholder sin egen <c2/> og <c3/>; den skriver ikke denne rapporten.

seg-1ccdffd389fb = <b>Bindinger.</b> Python- og WebAssembly-bindingene beholder <c1/>, enside-resultatkortet; lekeplassens nedlastbare rapport er sin egen side (<c2/>). Denne rapporten skrives av CLI-en, og Rust-kallere kan bygge den med <c3/>. Serveren for Model Context Protocol (MCP) returnerer den fra verktøyet <c4/>, som JSON eller som HTML-siden; scenariofilnavnet i reproduksjonskommandoen er det kalleren oppgir (standard <c5/>), og den lister ingen ledsagerfil, siden serveren ikke skriver noen.

seg-c8ab7b4605cf = <s1>Neste</s1>Animasjonseksport
