# docs--resilience-crosswalk: translations (nb)

seg-88372b30ed79 = Grense

seg-aab745a65e76 = Modul

seg-ad856ad710eb = Status

seg-b03d56f501c3 = Type

seg-4dbf41c0ec3b = Funksjon

seg-f472e43c1100 = Hva den viser

seg-fa4468d4cb80 = Tilgjengelighet

seg-fe4d868448ef = Kilde: <c1/>

seg-d745715d5332 = Kryssreferanse til rammeverk for PNT-robusthet

seg-aa1c24d63df5 = <b>Innrettet etter, ikke vurdert eller godkjent.</b> Dette kobler Kshanas simulerte funksjoner til de publiserte rammeverkene for PNT-robusthet (PNT: positioning, navigation and timing). Det er en <em>simuleringsbasert egenvurdering innrettet etter</em> Resilient PNT Conformance Framework (RPCF) v2.0 fra DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency), modellen Resist-Detect-Respond-Recover (RDRR) fra RethinkPNT/Firesmith og kriteriene for robust PNT fra Yang Yuanxi. Det er <b>ikke</b> en vurdering, en godkjenning, en akkreditering eller en compliance-erklæring, og det har ingen tilslutning fra DHS, IEEE (Institute of Electrical and Electronics Engineers) eller noen myndighet. Hver rad er merket med sin ærlige verifikasjonsstatus (<c1/> mot en uavhengig ekstern referanse, eller <c2/> fra første prinsipper med tester); selve laget for robusthetsscoring er <b>MODELLED</b>. To av kjernene har sine egne VALIDATED-rader i verifikasjonsmatrisen, kjernen for invers-Simpson-diversitet (<c3/>) og kjernen for rangstatistikk (<c4/>); det validerer regnestykket, ikke scorene bygget på det.

seg-652fcf3ec12d = Scoringsmotoren (<c1/>) bruker disse funksjonene og gir delscorer per dimensjon, aldri ett enkelt fantomtall. Se <c2/> for de maskinkontrollerte statusinvariantene.

seg-7a71de89a9fd = DHS RPCF v2.0: hva rammeverket definerer, og Kshanas egne delscorekategorier

seg-1985dbfe351d = Det publiserte rammeverket (Resilient PNT Conformance Framework, versjon { "2.0" }, { "26" }. april { "2022" }, DHS Science and Technology Directorate med CISA) definerer tre <b>kjernefunksjoner</b> (avsnitt { "5.2" }: Prevent, Respond, Recover), <b>robusthetsnivåer { "0" } til { "4" }</b> (avsnitt { "5.3" }) og <b>åtte nummererte minimumskrav</b> fordelt over nivå { "1" } til { "4" } (avsnitt { "5.3" }, gjentatt i { "5.5" }), pluss en evalueringstilnærming (avsnitt { "8" }). Det definerer <b>ikke</b> en liste med sju teknikkategorier. En tidligere versjon av denne siden og kommentarene i robusthetsmodulen beskrev sju «RPCF-teknikkategorier»; ordene Obfuscate og Diversify forekommer ikke i v2.0. Teksten i det dokumentet ble lest på nytt 2026-10-09, og ingen slik liste ble funnet.

seg-178d1e119dce = De sju delscorenavnene scoringsmotoren gir (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; "OLVIDMR" er vår huskeregel) er derfor <b>Kshanas egne scorekategorier</b>, beholdt for stabile utdata. De er ikke DHS-begreper, og radene nedenfor sier ikke at DHS krever dem. Der en kategori svarer til et krav i rammeverket, sier siste kolonne det; der den ikke gjør det, står det "none".

seg-5a9eb11bb965 = Kshanas delscorekategori

seg-e117e6f71845 = Kshana-funksjon brukt som driver

seg-7677dafa7016 = Nærmeste referanse i RPCF v2.0

seg-27e0f6b39605 = Obfuscate

seg-7327b9cbc106 = Oppgitt teknikk × kildekvalitet (ingen direkte atferdsdriver)

seg-b63e61fa5fa2 = none (en forebyggingsteknikk; avsnitt { "5.2" }, Prevent)

seg-7ed4f2e21189 = Oppgitt teknikk × kildekvalitet

seg-8579207ae2e5 = Verify

seg-30b8cb030965 = AUC (area under the curve) for svekkelsesdetektoren under scenarioet (monitorer for spoofing, jamming og meaconing)

seg-3d358c029f50 = Nivå { "2" } krav { "4" }; nivå { "3" } krav { "7" }

seg-fcb8cb7d4c97 = Isolate

seg-b3cd355743da = Nivå { "3" } krav { "6" }

seg-ffa87d149a20 = Diversify

seg-1282685a888b = Antall uavhengige grupper → effektiv diversitet etter invers Simpson

seg-f0dd4c4ef1c5 = Nivå { "4" } krav { "8" }; avsnitt { "5.5" } (felles modus)

seg-2d91b12a9e56 = Mitigate

seg-d183b552df76 = Tilgjengelighet under fratakelse

seg-c337df73e231 = avsnitt { "5.2" }, Respond

seg-2da4df22d35d = Recover

seg-85d7e3292549 = Holdover-utkjøring × port for avgrenset forringelse

seg-3aec9f076902 = Nivå { "2" } krav { "5" }; avsnitt { "5.2" }, Recover

seg-36958650abc0 = Kartleggingen krav for krav mot det virkelige rammeverket, med hva Kshanas utdata gir belegg for og hva som er til overs, står i <a1>compliance/dhs-rpcf.md</a1>.

seg-a085dd81c769 = Funksjonene RDRR fra RethinkPNT / Firesmith

seg-1b972717180b = Driver

seg-6eaf161f8871 = Resist

seg-6046a8914dc7 = Gjennomsnitt av delscorene Obfuscate/Limit/Isolate/Diversify

seg-242e2c01ebc2 = Detect

seg-45c8da13581f = Delscoren Verify (detektorens AUC)

seg-d29232baaaa6 = Respond

seg-36ab7ce187e6 = Delscoren Mitigate (tilgjengelighet)

seg-f98dc190541c = Holdover × avgrenset port; nøkkelindikatorer (KPI-er) for robusthetstidslinjen (detect/react/recover/loss)

seg-e7190928bed6 = Kriteriene til Yang Yuanxi (delmengden som tids- og deteksjonskvalitetsmålene sier noe om)

seg-52836e247425 = Kriterium

seg-cbbe4c0baf3f = Pålitelighet

seg-32d64f865b21 = Andel filterintegritet

seg-214372f29bd1 = Kontinuitet

seg-ad5e76a596b8 = Holdover × avgrenset port

seg-d92fb15e6dfa = Nøyaktighet

seg-0de1f9119e0f = Tids- og kvalitetsproxy — <b>posisjonsdomenets nøyaktighet er ikke en del av scoren</b>. <c1/> gjør en oppgitt posisjonskovarians og HPL (horizontal protection level) om til CEP/SEP/2DRMS (circular error probable, spherical error probable, twice the distance root mean square), men intet scenario mater det inn i robusthetsscoren

seg-0aa925a09499 = MODELLED (kun tidsdomene)

seg-6b661e6e4399 = Hva denne kryssreferansen ikke hevder

seg-51a48d0c718d = Ingen tildelt RPCF-nivå. Det tildelte nivået er en <em>foreløpig, simuleringsbasert</em> avlesning med en uttrykkelig port for avgrenset forringelse, ikke en tildelt modenhet.

seg-df73b7c76ae5 = Ingen nøyaktighet i posisjonsdomenet i scoren. Robusthetsdelscorene er bygget fra mål i tidsdomenet og for deteksjon. Motoren beregner posisjoner andre steder (typene <c1/>, <c2/> og <c3/>) og beskyttelsesnivåer (typen <c4/>), men scoringslaget bruker dem ikke.

seg-30a1b1a4dfea = Ingen feltvalidering. Referansepanelet og trusselensemblet er syntetiske, parameterforankrede reduksjoner (<c1/>), oppgitt som en førsteklasses begrensning.

seg-83c465cd78b0 = Følgestudien (<c1/>) finnes nettopp for å vise at det å slå disse dimensjonene sammen til én samlet score eller ett nivå gir en vurdering der rangeringen av arkitekturer er ustabil under forsvarlige valg av vekting og trusler — så denne kryssreferansen er et målelag som skal leses per dimensjon, ikke en enkelt karakter å vurdere et produkt mot.

seg-32bd45dc031d = Robusthets- og vertikale scenarioer som bruker disse lagene

seg-4e36adba1c55 = De medfølgende scenarioene nedenfor kjører trussel- og gjenopprettingsmekanikken radene i kryssreferansen peker på. Hvert er en virkelig kjøring av den navngitte typen; hvert eneste er <b>MODELLED</b> (ingen feltdata).

seg-44664e49d449 = Scenario (<c1/>)

seg-44b8d7435bfd = Lagdelt PNT under en felles trussel fra jamming og spoofing: en Monte Carlo-kjøring med seed av lagfratakelse, invers-varians-fusjon av de som overlever, forholdet mellom totaltap med ett lag og lagdelt, og hvordan korrelert fratakelse bryter sammen det forholdet. Identitetene fra Monte Carlo til lukket form og for fusjon kontrolleres av tester i craten; typen har ingen rad i verifikasjonsmatrisen, så den er gitt MODELLED her.

seg-1734506ad287 = GNSS (global navigation satellite system) jammet, et PNT-lag i lav jordbane (LEO) bærer brukeren, integritet opprettholdt (tre faser på én tidslinje).

seg-ff8cc090bdce = Én jammer mot en firebåndsmottaker; hvilken spoofingmonitor som ser hvilken spoofer.

seg-0a93502a4a19 = Marginen mellom jammer og signal (J/S) fra mottatt effekt.

seg-f2230253bdff = Spoofingdeteksjon ved konsistens i Doppler og passasjegeometri.

seg-d8ca900a8c14 = Tidssynkronisering for basestasjoner og kritisk infrastruktur i holdover, med LEO-tid.

seg-2a61d07bf177 = Brukere på vei, bane, sjø, i polare strøk og for tingenes internett (IoT) med et LEO-lag.

seg-8723073167ad = GNSS/INS (treghetsnavigasjonssystem) med dødregning gjennom en urban canyon og gjennom jamming på et lite ubemannet fly.

seg-6ee1ef707b20 = Hvor lenge en INS holder et skip eller et tog innenfor grensen sin med GNSS fratatt.

seg-7ca913e1729b = En maritim jammer; deteksjon av en spoofer som drar skipets rapporterte posisjon bort.

seg-c49548e8393b = <s1>Forrige</s1>Kart over DO-316 / DO-229E

seg-dedf3b53d31f = <s1>Neste</s1>Mottakertillit
