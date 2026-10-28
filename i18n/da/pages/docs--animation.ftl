# docs--animation: translations (da)

seg-8428c41646b0 = Kilde: <c1/>

seg-a61d094894fd = <c1/> omsætter en kørsels tidsserie til noget, der bevæger sig: en animeret Scalable Vector Graphics-fil (SVG), én selvstændig HyperText Markup Language-afspiller (HTML) eller en nummereret række SVG-frames til en videoindkoder. En kampagne afspilles som sine faser (jamming, spoofing, holdover, integritetsalarm) med sine alarmer markeret; en spektrumkørsel afspiller sit vandfald række for række; en passage i lav jordbane (LEO) afspiller sit link pr. bånd og, med en spoofer, monitorstatistikkerne epoke for epoke.

seg-39d69331035d = Kode: <c1/>. Tests: <c2/>.

seg-0b708f65d8d3 = Hvad den er, og hvad den ikke er

seg-ad8c12a3b510 = Eksportøren læser det resultatdokument, kørslen allerede har skrevet. Den kører ikke fysikken igen, den resampler, udjævner eller interpolerer ikke mellem sampel (bortset fra det ene lige linjestykke, der afslutter et spor ved markøren), og den tilføjer intet tal af sig selv. En animation er derfor præcis lige så god som den kørsel, der ligger bag. Dens niveau er <b>MODELLED, intern konsistens</b>: den er en gengivelse, aldrig evidens, og den bærer ingen egen række i verifikationsmatrixen.

seg-f37311ad7ef0 = Output

seg-0c21f772932e = Hvert format skrives ved siden af scenariet, ved siden af de sædvanlige <c1/>, <c2/> og <c3/>:

seg-f2ce7fc60cdf = Format

seg-51a8df15f356 = Skrevet som

seg-3ea93ae372ca = Hvad det indeholder

seg-3603593b9799 = Én SVG animeret med Cascading Style Sheets-keyframes (CSS) og uden script: sporene tegnes bag en bevægelig tidsmarkør, hændelser vises på deres tidspunkt, vandfaldsrækker afsløres i tidsrækkefølge. Den går i løkke med en pause på { "1.5" } s på det færdige billede.

seg-6c91078b434e = Én fil med inline script og style og uden eksterne aktiver: afspil og pause, en scrubber, hastighed (0.25x til 4x), hvert panel på én synkroniseret markør, en live værdi pr. spor, fasestrimlen og en hændelsesliste, der søger ved klik. Mellemrum afspiller eller pauser, piletasterne trin for trin, Home og End hopper.

seg-df02d37cd729 = <c1/>, <c2/>, … og <c3/>.

seg-2e5ebd60cad0 = <c1/> kan gentages og tager en kommasepareret liste (<c2/>) eller <c3/>. <c4/> ({ "1" } til { "60" }, standard { "12" }) og <c5/> ({ "0.5" } s til { "600" } s, standard { "8" } s) fastsætter afspilningen; frame-rækken er begrænset til { "7,200" } frames.

seg-7e012ab53f45 = Når <c1/> kører i den samme kommando, viser HTML-afspilleren de eksportfiler, der er skrevet ved siden af den (CZML, KML, GeoJSON, STK, SigMF), som relative links til de søskendefiler; et link skrives kun for et rent filnavn, så ingen kan forlade mappen eller nå netværket. Den avancerede rapport (<c2/>) indlejrer den animerede tegning, når resultatet har en tidsserie, uanset om <c3/> kørte.

seg-9c1d2204edab = Når <c1/> kører, får <c2/> en blok <c3/>: formaterne, frames pr. sekund (fps), varighed, antal frames, tidsspændet, panelernes titler, de JSON-stier, hvert spor blev læst fra (<c4/>), og enhver serie, der blev fundet, men ikke tegnet (<c5/>). Uden <c6/> er resultatet bytemæssigt identisk med en almindelig kørsel.

seg-fa8388ae976e = Frame-rækken

seg-db4b53abe7d6 = Rækken har præcis <c1/> frames. Frame <em>i</em> viser tidslinjen op til <c2/>, så den første frame er starten, og den sidste er det færdige billede. <c3/> registrerer <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), pixelstørrelsen, <c9/>, <c10/>, missionstiden for hver frame (<c11/>), faserne, hændelserne og kilderne. En ny eksport til den samme mappe fjerner først hver <c12/>, der allerede ligger der (og intet andet), så en kortere række aldrig efterlader frames fra en længere, som indkoderen kan læse.

seg-13b57b6d3c14 = Frames er SVG, ikke Portable Network Graphics (PNG). En <c1/> bygget med biblioteket <c2/> læser dem direkte, med den rate, rækken blev skrevet med ({ "24" } i eksemplet ovenfor; manifestets <c3/>):

seg-b20beeb45fac = En <c1/> uden <c2/> stopper med "no decoder found for: svg". Rasteriser først frames, for eksempel med <c3/>, og indkod PNG-filerne:

seg-fc61f546f605 = Tilgængelighed og tema

seg-7015f7ed77dc = <b>Farveskema.</b> Afspilleren følger <c1/> og tegner igen, når det ændres; den animerede SVG bærer en lys variant af sin palet under den samme media query. Frames bruger den mørke palet fra de statiske diagrammer, fordi en video ikke har noget skema.

seg-c3b1f19f191b = <b>Reduceret bevægelse.</b> Under <c1/> slår den animerede SVG hver animation fra og viser det færdige billede (dens basisstile er sluttilstanden, så intet skjules), og afspilleren åbner på pause på det færdige billede i stedet for at afspille; brugeren kan stadig scrubbe eller trykke på Play.

seg-f8dd26194eec = SVG'en har en <c1/> og en <c2/>; afspillerens betjeningselementer er mærkede knapper, et områdeinput med en oplæst tidsværdi og en select.

seg-f5356cbf3675 = Hvad der tæller som en tidsserie

seg-ba43cf36ac20 = Resultatdokumenterne er forskellige fra type til type, så eksportøren genkender de former, motoren udsender, i stedet for en liste af typer:

seg-952d09156712 = <b>Et array af poster med et tidsfelt</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> eller <c6/> på et <c7/>-array), der strengt vokser langs arrayet. Hvert andet numerisk felt bliver et spor; det samme felt under to rødder (<c8/> og <c9/>) deler et panel.

seg-2c3abce3f70a = <b>Et objekt med et strengt voksende tidsarray</b> (<c1/>, <c2/>, <c3/>, …) ved siden af arrays af samme længde: søskende-numeriske arrays, et <c4/>-map af <c5/>-poster (tidslinjen <c6/>), et array af poster med sådanne arrays (båndene <c7/>, en konstellations satellitspor) og et todimensionalt array, hvis rækker svarer til tidsaksen, med en søskende frekvensakse <c8/> (vandfaldet <c9/>).

seg-0edf8c38f9eb = Ved siden af det tidsarray bliver <c1/> (<c2/>, <c3/>, <c4/>) til fasestrimlen og <c5/> (<c6/>, <c7/>, <c8/>) til markørerne. Et bånds skalarer <c9/> (dets første tab af lås, dets laveste forhold mellem bærebølge og støjtæthed) markeres også.

seg-608c4fed9e98 = Spor med en enhed deler et panel, når deres størrelser ligger inden for en faktor { "100" }, så en vagt på { "50" } ns ikke fladtrykker en fejl på { "2" } ns. Højst { "6" } paneler med { "6" } spor tegnes; resten opregnes under <c1/>. Spor over { "2,400" } sampel tyndes ud med et jævnt stride, der bevarer det sidste sampel, og et vandfald over { "96" } × { "120" } celler midles ned (i effekt, for decibelceller, så en smal jammer ikke fortyndes).

seg-c386389e4f1d = Blandt LEO-typerne animerer hvert medfølgende scenarie <c1/>, <c2/> og <c3/>. <c4/> animerer i sine tilstande Doppler, fælles positionering og tidssynkronisering (en tidskørsel kræver <c5/>, som får hver række til at rapportere sin tidsfejl og forudsagte sigma ved hver epoke) og afvises i sin tilstand for polardækning. <c6/> animerer sin opdatering midt i passagen og afvises for analyserne af kodning, tilpasningsinterval og modelsammenligning. Resultater fra <c7/> og <c8/> har ingen tidsakse og afvises.

seg-eb31ec7a07b7 = Determinisme

seg-82bcf8a5b042 = Outputtet er en ren funktion af resultatdokumentet og indstillingerne: intet ur, intet tilfældigt tal, ingen iteration over hash-map, ingen fil- eller netværksadgang i biblioteket og intet tidsstempel noget sted, så det samme scenarie, seed og de samme indstillinger giver bytemæssigt identiske filer. Modulet bygges uændret til WebAssembly; kun kommandolinjegrænsefladen skriver filer.

seg-77e1f459f3d3 = Brug som bibliotek

seg-b3fa41e48ea5 = <c1/> animerer et resultatdokument, du allerede har, og <c2/> returnerer det, der ville blive tegnet, uden at gengive det.

seg-0857a94a948e = Begrænsninger

seg-02f0f03af2fb = Python-wheel'en og WebAssembly-modulet udstiller endnu ikke eksportøren; den kan nås fra kommandolinjen, Rust-biblioteket og værktøjet <c1/> i Model Context Protocol-serveren (MCP) (som højst returnerer { "120" } frames i ét svar).

seg-cd3ec7b403ba = Akserne er lineære. En serie, der spænder over mange dekader (et urs fejlvækst fra { "0.1" } ns til et mikrosekund), ser flad ud, indtil sent i kørslen.

seg-ed21d370a73c = Den animerede SVG bygger på CSS-animation af et klip-rektangel; nuværende motorer i Chromium, Firefox og Safari afspiller den, mens en fremviser uden CSS-animation viser det færdige billede.

seg-9dfb9596ecf3 = Sweep-, Monte Carlo- og compose-kampagner har ingen tidsakse og afvises; oversigtsstatistikkerne for en sweep eller en ensemble er ikke en tidsserie. En kædet kampagne animerer.

seg-be1f1afe7424 = <s1>Forrige</s1>Kørselsrapporter

seg-6817433f69f6 = <s1>Næste</s1>Interoperabilitetseksport og -import
