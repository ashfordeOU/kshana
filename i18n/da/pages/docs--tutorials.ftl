# docs--tutorials: translations (da)

seg-501402fc366f = Urets holdover

seg-cae10fb9bff8 = Scenarie

seg-a0b63210b807 = Læs mere

seg-a7cfe6f135f1 = Bane og geometri

seg-835df2d05f2a = GNSS-måledomæne

seg-3a0e724a8a2b = Niveau

seg-28e87f407a10 = Domæne

seg-d6476863f862 = Funktion

seg-029de6b99be0 = Inertial dødregning

seg-9ef8f99ca6e4 = Tidsoverførsel

seg-b03d56f501c3 = Type

seg-ec26df467b88 = Fælles Kalman-sensorfusion til PNT over de samme hybride input.

seg-4f19d4fb1341 = Generisk N-D-sweep over en vilkårlig pakke via punkterede TOML-nøgler / JSON-metrikstier.

seg-e7ab7b55c969 = 1-D-sweep til afvejningsstudie over en parameter for en urpakke.

seg-e43910de5fd8 = Notebooks

seg-d78822583c64 = Notebook

seg-3959aefa12be = Kilde: <c1/>

seg-a5ebe4befda8 = Praktiske, gennemarbejdede eksempler, der fører dig fra “kør et medfølgende scenarie” til “kvantificér og forsvar et resultat.” Hvert tal i de tre tutorials er et rigtigt motoroutput, forankret i en ekstern (ikke-cirkulær) autoritativ uafhængig reference og <b>fastlåst af en integrationstest</b> (<c1/>), så en tutorial aldrig i det skjulte kan glide væk fra det, motoren faktisk gør. Hvis en tutorial siger, at det optiske ur holder { "6600" } s, får testen buildet til at fejle den dag, det holder op med at være sandt.

seg-1c045624a6be = Kshana er en simulator til positionering, navigation og tidssynkronisering (PNT). Tutorials bruger nogle få flere forkortelser, hver især skrevet ud, hvor den først optræder: GNSS (Global Navigation Satellite System), GPS (Global Positioning System), CLI (kommandolinjegrænseflade) og TOML (Tom's Obvious Minimal Language, scenariernes filformat).

seg-7a84a80b57d5 = Ny i projektet? Læs først <a1>begrebsintroduktionen</a1> og <a2>ordlisten</a2>, og vend så tilbage hertil.

seg-b4cd44590347 = De tre gennemarbejdede eksempler

seg-eebeab9693b2 = Tutorial

seg-a0bc6e585d71 = Hvad du lærer

seg-b6cc01b76947 = Scenarietype

seg-429bab0a0e05 = Sværhedsgrad

seg-0e188f9c0f65 = ~Tid

seg-bcf40448e55d = Min første bane: hvor er GPS-satellitterne

seg-de1032024a69 = propagér en rigtig GPS-konstellation, aflæs tilgængelighed, præcisionsfortynding for position (PDOP) og positionsnøjagtighed, og eksportér, hvor satellitterne faktisk er (SP3, det præcise baneformat)

seg-e7b6c262333e = begynder

seg-d6042fb74a5f = { "15" } min

seg-07a8d6cfc1ae = Ur-holdover: hvor længe kan du holde dig i gang

seg-0e9c77468fb2 = kør en GNSS-nægtet ur-holdover, aflæs kvalitetsmålet for tid og forstå vækstloven √(q_wf·T) bag det

seg-0f6fba31626a = { "20" } min

seg-7973e9c54366 = Kvante mod klassisk GNSS-modstandsdygtighed

seg-4d8036091b37 = slutstenen: en spoofing-detektor (<c1/>) og en komplet fusioneret PNT-suite (<c2/>), og hvordan du aflæser sikkerhed / integritet / dødregning sammen

seg-1b39d4927602 = mellem

seg-ea37ac575235 = { "35" } min

seg-1d56222dfd25 = Kørbare Jupyter-notebooks på syntetiske data og offentlige elementsæt, som kun ligger i repositoriet, findes i <a1><c1/></a1>:

seg-9aae3a4e10dc = Fartøjstillid og træning

seg-1d680d635c6d = frembring en syntetisk NMEA-strøm fra en bro med en scriptet hændelse, og vurdér den derefter med fartøjets tillidsmonitorer (vejledende, ikke typegodkendt navigationsudstyr)

seg-739f8f5a9082 = hvor navigationsdata har set forringede ud, og hvor meget af en rute det berører

seg-443c908ff49b = Compliance-kortlægning og eksport til testbænk

seg-0d639065192a = hvilke rækker i offentlige rammeværker et sæt kørsler leverer belæg for (aldrig at et rammeværk er opfyldt), og et scenaries bevægelse og hændelser eksporteret som tekst til en GNSS-simulator i laboratoriet (der skrives intet signal)

seg-981a3238794d = Kvante mod klassisk GDOP

seg-228ce150ee80 = den samme konstellationsgeometri med en kvante- og en klassisk sensor, sammenlignet ved præcisionsfortynding

seg-4b82b5edd4ff = Himmelgeometri under en skyline

seg-1186b6cd6149 = de satellitter, et sted ser under en gade- eller kajskyline, deres DOP og fejlellipse, en dateret himmel ud fra elementsæt og en Monte Carlo med seed mod kovariansen (MODELLED)

seg-d9d06cb8e237 = Sådan kører du en tutorial

seg-ffc4ddfc9426 = Hver tutorial kører det samme scenarie på tre måder; vælg den, der passer dig. De kalder alle den <em>ene</em> motor, så tallene er identiske (spejler afsnittet <a1>Brug</a1> i README).

seg-e7ba76a06aa6 = <b>Kommandolinje.</b> CLI'en vælger efter scenariets felt <c1/> og skriver <c2/>, <c3/>, <c4/> og <c5/> ved siden af inputtet (JSON er JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Nogle få kinds udgiver også en reproducerbarhedstabel som <c6/> (kommaseparerede værdier): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> og <c12/>, når der er angivet et eksportsted. Ingen af de tre tutorials hører til dem, så du ser ikke den fil her.

seg-5ee6f15d3b08 = <c1/> bygger CLI'en fra dette checkout. Med en installeret binær (<c2/>) er den samme kommando <c3/>. Uden et checkout er de fleste medfølgende scenarier indbygget i den binære: <c4/> viser dem (og nævner de få, der ikke er indbygget, med begrundelsen), og <c5/> skriver ét ud: den kopi af <c6/>, som den binære blev bygget med.

seg-1b7e851749d5 = <b>Python.</b> Byg udvidelsen fra dette checkout én gang med maturin i et aktivt virtuelt miljø, og kald derefter <c1/>:

seg-3aa10d551694 = <c1/> installerer i stedet det udgivne wheel. Det kan hænge bagud i forhold til dette checkout: <c2/> fortæller dig, hvilke scenarietyper dit build har.

seg-333b7956b06b = <b>Legeplads i browseren.</b> Ingen installation: åbn <a1>Studio</a1>, vælg et scenarie, redigér parametrene og aflæs resultatet. Intet uploades; motoren kører hos klienten som WebAssembly.

seg-2cd8bbd1e7f0 = Tutorials citerer <b>CLI'en</b>, men hver kommando har en tilsvarende Python- og legepladsvariant ovenfor. Hvert resultat kan gengives ud fra <c1/>: kør det to gange, og du får bit-identisk output.

seg-d497caeb889a = Kommenterede undervisningsscenarier

seg-c966709a600d = For hvert funktionsområde er der én kraftigt kommenteret <c1/> under <a1><c2/></a1>: en <em>undervisningskopi</em> af et kanonisk scenarie, hvor hvert felt er forklaret i linjen, den anførte uafhængige reference er nævnt, og den forventede opsummering på én linje er optaget som en kommentar <c3/>. Feltværdierne er identiske med forældrenes i repoets mappe <c4/> på øverste niveau (<c5/> sammenligner den parsede TOML), så det dokumenterede output forbliver sandt. De gyldne hashes er heller ikke rørt: en kommentar ændrer aldrig et scenaries hash.

seg-871fcecc5ee1 = Undervisningsfil

seg-4e852a6a1581 = Afledt af

seg-e74e1c9b387e = Integritet (RAIM, receiver autonomous integrity monitoring)

seg-95b6cceb76e6 = Sikkerhed (spoofing)

seg-dab48471c270 = Hybrid PNT

seg-c889e5e77121 = Undervisningsfilen for <b>sikkerhed</b> bruger <c1/> indeni: kvalitetsmålet for sikkerhed (<c2/>, én minus sandsynligheden for en overset detektion) frembringes af spoof-pakken. Filnavnet følger <em>funktionen</em> (sikkerhed), mens <c3/> følger <em>pakken</em> (spoof). Filens header gør opmærksom på det.

seg-89fef83a9d54 = Det fulde katalog over scenarietyper

seg-648bb07212cd = Motoren vælger efter scenariets <c1/>. Tabellen nedenfor viser de mest brugte kinds (de otte tutorial-områder ovenfor og deres nærmeste naboer). Den er <b>ikke</b> den komplette mængde: <c2/> returnerer alle <c3/> indbyggede kinds. Den funktion (tilgængelig som <c4/> i bindingerne til Python og WebAssembly (WASM) og som <c5/> på kommandolinjen) er det autoritative, altid opdaterede katalog, og <a1><c6/></a1> er dens genererede oversigt, ét afsnit pr. kind med de påkrævede og valgfrie TOML-felter. <c7/> sikrer, at hver kind, en tutorial dokumenterer, er en rigtig dispatch-kind, så intet i denne tabel kan nævne en kind, der ikke findes.

seg-0f744a3a7193 = Ur-holdover mod specifikation; valgfrit Monte Carlo-ensemble (<c1/>).

seg-9a2564fdc86a = 1-DOF (én frihedsgrad) inertial dødregning under et GNSS-udfald.

seg-62f0400581b3 = GNSS-tilgængelighed + præcisionsfortynding (DOP) ud fra en konstellation (Walker / two-line elements / RINEX, Receiver Independent Exchange-formatet).

seg-59fc8330ba12 = Snapshot / solution-separation / ARAIM (advanced RAIM) med horisontale og vertikale beskyttelsesniveauer (HPL/VPL) + Stanford-diagram.

seg-22c598d57e77 = ARAIM-gennemløb for beskyttelsesniveau ved månens sydpol mod et LunaNet-relæsæt.

seg-f97d8fb3b6fa = Optisk mod radiofrekvent (RF) tovejs overførsel af tid/frekvens.

seg-8af1c652d854 = Slutsten for hybrid PNT: ur + inertimåleenhed (IMU) + støtte fra tidsoverførsel.

seg-d24a9596f53e = Løst og tæt koblet GNSS/INS (inertialt navigationssystem) fejltilstands-extended Kalman-filter.

seg-3c915870476a = Pseudoafstandssimulering i måledomænet (Klobuchar-ionosfære, Saastamoinen/Niell-troposfære) + RAIM.

seg-72284bad54e4 = Jamming med link-budget: forhold mellem jammer og signal (J/S) → effektiv bærebølge-til-støj-tæthed (C/N₀) → tab af lås.

seg-2ead4d42b427 = Stokastisk detektor for tids-spoofing (Neyman–Pearson / χ²₁) med Monte Carlo-sandsynligheder for falsk alarm og oversete detektioner (P_fa/P_md).

seg-5f2f9e63093a = Ud over tutorials: nyere funktioner

seg-3d6a8fd31402 = De tre tutorials holder sig til de klassiske pakker for ur, bane og sikkerhed. Motoren er vokset langt ud over dem. Hver række nedenfor er et medfølgende scenarie, du kan køre, som det er (<c1/> eller <c2/>); opsummeringen er den første linje, kshana { "0.35.0" } udskrev for det den 2026-10-10. I modsætning til tutorial-tallene er disse linjer en optegnelse af én kørsel og ikke fastlåst af <c3/>: kør scenariet igen for at få den aktuelle værdi. Resultater angiver selv deres omfang (de fleste har en <c4/>), og <a1>verifikationsmatrixen</a1> angiver, hvilke funktioner der er VALIDATED mod en ekstern uafhængig reference, og hvilke der er MODELLED.

seg-2dc1d8680abb = Første linje af opsummeringen

seg-abd799395f27 = L-bånd-spektrum og jamming-vandfald

seg-33453b2cfdf3 = Solsystemet ved én epoke

seg-23bc4ff7f741 = Positionering omkring et andet legeme

seg-c135b151e469 = Konstellationsudformning i stor skala

seg-065995e9bd5e = Kampagner: kinds kædet på én tidslinje

seg-dbae357e7e34 = Ét LEO-PNT-system fra ende til anden

seg-9d3d72ea03df = Fusioneret MEO- + LEO-positionering

seg-acc2793d1721 = LEO-signaler, gennemløb og navigationsmeddelelser

seg-db2626e54a24 = <c1/> (gennemløbet)

seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

seg-aa93235e8c6d = PPP-konvergens med et LEO-lag; 5G-positionering

seg-01160980ce50 = Modstandsdygtighed: GNSS jammet, LEO bærer brugeren

seg-adf8453bc035 = Vertikaler: bane, søfart, telekommunikation, køretøjer, Arktis

seg-15a5098b5045 = <c1/> (og de andre <c2/>-filer)

seg-e6494ed83ee3 = Holdover i telekommunikation mod urgrænserne i ITU-T (International Telecommunication Union, Telecommunication Standardization Sector) G.8272

seg-dfc04f1abe82 = LEO er lav jordbane og MEO mellemhøj jordbane; PVT er position, hastighed og tid; PPP er præcis punktpositionering; 5G er femte generation af mobilstandarden; TDB er barycentrisk dynamisk tid; JD er juliansk dato; TE er tidsfejl.

seg-1d45d94f2e5b = CLI'en tilføjer tre outputs oven på enhver kørsel:

seg-893276648fec = <b>Rapporter.</b> Hver kørsel skriver <c1/> og <c2/> (se <a1>REPORTS.md</a1>). <c3/> kører en suite af scenarier ind i én <c4/> og <c5/>, for eksempel <c6/>.

seg-e9f06d47c82c = <c1/> gengiver kørslens tidsserie, for eksempel skriver <c2/> på <c3/> filen <c4/>. En kind uden en samplet tidsakse (såsom <c5/>) afvises med en fejl; se <a1>ANIMATION.md</a1>.

seg-f037fe5d7ffa = Interop-eksporter.

seg-3977722b8517 = <c1/> skriver resultatet til andre værktøjer: CZML (Cesium Language), KML (Keyhole Markup Language, til Google Earth), GeoJSON (geographic JSON), en STK-efemeride (Systems Tool Kit) eller en SigMF-optagelse (Signal Metadata Format). <c2/> fortæller, hvilke formater der gælder for et scenarie; SigMF gælder kun for <c3/>. Bane-pakken eksporterer også <c4/>, <c5/> og <c6/> (CCSDS, Consultative Committee for Space Data Systems, banemeddelelser). Se <a1>INTEROP.md</a1>.

seg-3abd51182cc0 = Graderede øvelser

seg-9513af4fb862 = Arbejd dig igennem stigen. Hvert niveau er sværere og mere forsvarligt end det forrige; referenceløsninger findes i <a1><c1/></a1>.

seg-89ad8eb64a54 = Mål

seg-0a824838ef57 = Hvad du gør

seg-2463a86470b8 = Referenceløsning

seg-7ce3ac2347b9 = Niveau { "1" } — kør og aflæs

seg-e1dee35aedff = kør et medfølgende scenarie uændret og aflæs ét kvalitetsmål

seg-296694716b3b = Kør <c1/>; udskriv <c2/> for kvante mod klassisk. CLI, legeplads eller et Python-kald på én linje.

seg-bad6d3afb6a0 = Niveau { "2" } — redigér og sweep

seg-c18da238e470 = ændr én parameter og iagttag en monoton virkning

seg-598ca8efea83 = Skærp urets specifikation (<c1/>) eller forlæng udfaldet og se holdover falde; eller brug <c2/>/<c3/> til at stille det op i en tabel.

seg-1d9dfecce6fa = Niveau { "3" } — kvantificér og forsvar

seg-5b57f2c8ffb9 = Monte Carlo, konfidensbånd, reproducerbarhed og et beskyttelsesniveau

seg-0fac2036b289 = Kør et urensemble (<c1/>), aflæs [p05–p95]-båndet, bekræft, at to kørsler giver en identisk <c2/>, og aflæs et integritets-/Stanford-resultat.

seg-45dc753da682 = Referenceløsningerne bruger Python-udvidelsen (først <c1/>). Kørt fra repositoriets rod udskriver <c2/> chipskala-atomurets holdover faldende fra { "2610" } s ved en specifikation på { "20" } ns til { "1140" } s ved { "5" } ns.

seg-e59b1beadb98 = Vil du have friske data?

seg-530db2e609d0 = Hovedtallene i disse tutorials kører helt og holdent fra scenarier, der allerede ligger i repoet. Intet hentes, og det er det, der gør dem reproducerbare og sikre at køre i continuous integration (CI). Til øvelserne “udvid det” kan du hente levende data:

seg-6a20ec96cb92 = <b>GPS two-line elements (TLE'er)</b> (opdatér bane-konstellationen): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, elementsæt i ren tekst med 3 linjer (navn + linje { "1" } + linje { "2" }). Hjælper: <c1/>. Åbne data (katalog fra US Space Force 18th Space Defense Squadron, videredistribueret af Celestrak, Dr T. S. Kelso).

seg-9bcea1d9eb12 = <b>Uafhængig verifikationsreference for SGP4 (Simplified General Perturbations { "4" })</b> (allerede medleveret, hent ikke igen): testvektorerne fra AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 “Revisiting Spacetrack Report #3”, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, brugt af <c1/>; se <a2><c2/></a2>.

seg-d33aa34b2762 = <b>Uafhængig reference for urstabilitetsrelationer</b>: NIST (National Institute of Standards and Technology) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, relationerne σ_y(τ)↔fase bag Tutorial { "2" }.

seg-36be39f17e35 = <s1>Forrige</s1>Studio-guide

seg-6f6204737a87 = <s1>Næste</s1>{ "1" } · Din første bane
