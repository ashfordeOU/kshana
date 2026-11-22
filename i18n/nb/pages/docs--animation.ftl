# docs--animation: translations (nb)

seg-8428c41646b0 = Kilde: <c1/>

seg-a61d094894fd = <c1/> gjør en kjørings tidsserie om til noe som beveger seg: en animert SVG-fil (Scalable Vector Graphics), én enkelt selvstendig HTML-spiller (HyperText Markup Language) eller en nummerert sekvens av SVG-bilder for en videoenkoder. En kampanje spilles av som sine faser (jamming, spoofing, holdover, integritetsalarm) med alarmene markert; en spektrumkjøring spiller av sin waterfall rad for rad; en passering i lav jordbane (LEO) spiller av lenken per bånd og, med en spoofer, monitorstatistikken epoke for epoke.

seg-39d69331035d = Kode: <c1/>. Tester: <c2/>.

seg-0b708f65d8d3 = Hva det er, og hva det ikke er

seg-ad8c12a3b510 = Eksportøren leser resultatdokumentet kjøringen allerede har skrevet. Den kjører ikke fysikken på nytt, den resampler, glatter eller interpolerer ikke mellom sampler (bortsett fra det ene rette linjesegmentet som avslutter et spor ved markøren), og den legger ikke til noe tall av sitt eget. En animasjon er derfor akkurat så god som kjøringen bak den. Dens nivå er <b>MODELLED, intern konsistens</b>: det er en gjengivelse, aldri evidens, og den har ingen egen rad i verifikasjonsmatrisen.

seg-f37311ad7ef0 = Utdata

seg-0c21f772932e = Hvert format skrives ved siden av scenarioet, ved siden av de vanlige <c1/>, <c2/> og <c3/>:

seg-f2ce7fc60cdf = Format

seg-51a8df15f356 = Skrevet som

seg-3ea93ae372ca = Hva det inneholder

seg-3603593b9799 = Én SVG animert med CSS-nøkkelbilder (Cascading Style Sheets) og uten skript: sporene tegnes inn bak en bevegelig tidsmarkør, hendelser vises på sitt tidspunkt, waterfall-radene avsløres i tidsrekkefølge. Den går i løkke, med { "1.5" } s hold på det ferdige bildet.

seg-6c91078b434e = Én fil med innebygd skript og stil og uten eksterne ressurser: spill av og pause, en glidebryter, hastighet (0.25x til 4x), hvert panel på én synkronisert markør, en levende verdi per spor, fasestripen og en hendelsesliste som hopper til tidspunktet ved klikk. Mellomrom spiller av eller pauser, piltastene går steg for steg, Home og End hopper.

seg-df02d37cd729 = <c1/>, <c2/>, … og <c3/>.

seg-2e5ebd60cad0 = <c1/> kan gjentas og tar en kommaliste (<c2/>) eller <c3/>. <c4/> ({ "1" } til { "60" }, standard { "12" }) og <c5/> ({ "0.5" } s til { "600" } s, standard { "8" } s) setter avspillingen; bildesekvensen er begrenset til { "7,200" } bilder.

seg-7e012ab53f45 = Når <c1/> kjøres i den samme kommandoen, lister HTML-spilleren eksportfilene som er skrevet ved siden av den (CZML, KML, GeoJSON, STK, SigMF) som relative lenker til de søskenfilene; en lenke skrives bare for et rent filnavn, slik at ingen kan forlate mappen eller nå nettverket. Den avanserte rapporten (<c2/>) bygger inn den animerte tegningen når resultatet har en tidsserie, uansett om <c3/> ble kjørt.

seg-9c1d2204edab = Når <c1/> kjøres, får <c2/> en <c3/>-blokk: formatene, bilder per sekund (fps), varighet, antall bilder, tidsspennet, paneltitlene, JSON-stiene hvert spor ble lest fra (<c4/>) og eventuelle serier som ble funnet, men ikke tegnet (<c5/>). Uten <c6/> er resultatet byte-identisk med en vanlig kjøring.

seg-fa8388ae976e = Bildesekvensen

seg-db4b53abe7d6 = Sekvensen har nøyaktig <c1/> bilder. Bilde <em>i</em> viser tidslinjen frem til <c2/>, så det første bildet er starten og det siste er det ferdige bildet. <c3/> registrerer <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), pikselstørrelsen, <c9/>, <c10/>, oppdragstiden for hvert bilde (<c11/>), fasene, hendelsene og kildene. En ny eksport til den samme mappen fjerner først alle <c12/> som allerede ligger der (og ingenting annet), slik at en kortere sekvens aldri etterlater bilder fra en lengre sekvens som koderen kan lese.

seg-13b57b6d3c14 = Bildene er SVG, ikke Portable Network Graphics (PNG). En <c1/> bygget med biblioteket <c2/> leser dem direkte, med den raten sekvensen ble skrevet med ({ "24" } i eksempelet ovenfor; manifestets <c3/>):

seg-b20beeb45fac = En <c1/> uten <c2/> stopper med «no decoder found for: svg». Rasteriser bildene først, for eksempel med <c3/>, og kod PNG-ene:

seg-fc61f546f605 = Tilgjengelighet og tema

seg-7015f7ed77dc = <b>Fargeskjema.</b> Spilleren følger <c1/> og tegner på nytt når det endres; den animerte SVG-en bærer en lys variant av paletten under det samme mediespørsmålet. Bildene bruker den mørke paletten fra de statiske diagrammene, fordi en video ikke har noe skjema.

seg-c3b1f19f191b = <b>Redusert bevegelse.</b> Under <c1/> slår den animerte SVG-en av alle animasjoner og viser det ferdige bildet (basisstilene er sluttilstanden, så ingenting er skjult), og spilleren åpnes satt på pause på det ferdige bildet i stedet for å spille av; brukeren kan fortsatt skrubbe eller trykke Play.

seg-f8dd26194eec = SVG-en har en <c1/> og <c2/>; spillerens kontroller er merkede knapper, et områdefelt med en uttalt tidsverdi og en nedtrekksliste.

seg-f5356cbf3675 = Hva som regnes som en tidsserie

seg-ba43cf36ac20 = Resultatdokumentene er forskjellige fra type til type, så eksportøren gjenkjenner formene motoren sender ut, i stedet for en liste over typer:

seg-952d09156712 = <b>En tabell av poster med et tidsfelt</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, eller <c6/> i en <c7/>-tabell) som øker strengt langs tabellen. Hvert annet numerisk felt blir et spor; det samme feltet under to røtter (<c8/> og <c9/>) deler et panel.

seg-2c3abce3f70a = <b>Et objekt med en strengt økende tidstabell</b> (<c1/>, <c2/>, <c3/>, …) ved siden av tabeller av samme lengde: numeriske søskentabeller, et <c4/>-kart av <c5/>-poster (tidslinjen <c6/>), en tabell av poster som inneholder slike tabeller (båndene i <c7/>, en konstellasjons satellittspor), og en todimensjonal tabell hvis rader samsvarer med tidsaksen, med en frekvensakse <c8/> som søsken (waterfallen <c9/>).

seg-0edf8c38f9eb = Ved siden av denne tidstabellen blir <c1/> (<c2/>, <c3/>, <c4/>) til fasestripen og <c5/> (<c6/>, <c7/>, <c8/>) til markørene. Et bånds skalarer <c9/> (første tap av lås, laveste forhold mellom bærebølge og støytetthet) markeres også.

seg-608c4fed9e98 = Spor med en enhet deler et panel når størrelsene ligger innenfor en faktor på { "100" }, slik at en vakt på { "50" } ns ikke flater ut en feil på { "2" } ns. Høyst { "6" } paneler med { "6" } spor tegnes; resten listes under <c1/>. Spor over { "2,400" } sampler tynnes ut med et jevnt steg som beholder det siste samplet, og en waterfall over { "96" } × { "120" } celler midles ned (i effekt, for desibelceller, slik at en smal jammer ikke fortynnes).

seg-c386389e4f1d = Blant LEO-typene animeres hvert medfølgende scenario av typene <c1/>, <c2/> og <c3/>. <c4/> animeres i modusene Doppler, felles posisjonsbestemmelse og tidssynkronisering (en tidssynkroniseringskjøring trenger <c5/>, som gjør at hver rad rapporterer sin tidsfeil og predikerte sigma i hver epoke) og avvises i modusen for polardekning. <c6/> animerer sin oppdatering midt i passeringen og avvises for analysene av koding, tilpasningsintervall og modellsammenligning. Resultater av <c7/> og <c8/> bærer ingen tidsakse og avvises.

seg-eb31ec7a07b7 = Determinisme

seg-82bcf8a5b042 = Utdataene er en ren funksjon av resultatdokumentet og valgene: ingen klokke, ingen tilfeldige tall, ingen iterasjon over hash-kart, ingen fil- eller nettverkstilgang i biblioteket og ingen tidsstempel noe sted, så det samme scenarioet, seedet og valgene gir byte-identiske filer. Modulen bygges for WebAssembly uendret; bare kommandolinjegrensesnittet skriver filer.

seg-77e1f459f3d3 = Bruk som bibliotek

seg-b3fa41e48ea5 = <c1/> animerer et resultatdokument du allerede har, og <c2/> returnerer det som ville blitt tegnet, uten å gjengi det.

seg-0857a94a948e = Begrensninger

seg-02f0f03af2fb = Python-hjulet og WebAssembly-modulen eksponerer ikke eksportøren ennå; den kan nås fra kommandolinjen, Rust-biblioteket og verktøyet <c1/> i Model Context Protocol-serveren (MCP) (som returnerer høyst { "120" } bilder i ett svar).

seg-cd3ec7b403ba = Aksene er lineære. En serie som spenner over mange tiere (en klokkes feilvekst fra { "0.1" } ns til et mikrosekund) ser flat ut til sent i kjøringen.

seg-ed21d370a73c = Den animerte SVG-en bygger på CSS-animasjon av et klipperektangel; dagens motorer i Chromium, Firefox og Safari spiller den av, mens en visning uten CSS-animasjon viser det ferdige bildet.

seg-9dfb9596ecf3 = Kampanjer for sveip, Monte Carlo og compose bærer ingen tidsakse og avvises; sammendragsstatistikken for et sveip eller et ensemble er ikke en tidsserie. En lenket kampanje animeres.

seg-be1f1afe7424 = <s1>Forrige</s1>Kjøringsrapporter

seg-6817433f69f6 = <s1>Neste</s1>Interoperabilitetseksporter og -importer
