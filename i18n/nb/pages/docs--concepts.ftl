# docs--concepts: translations (nb)

seg-501402fc366f = Klokkens holdover

seg-9c0eb89a2fbe = Pakke

seg-41b3740e1db9 = Kilde: <c1/>

seg-8ab3fd09812d = Konsepter — en forklaring i klart språk

seg-0f86d0a815d2 = Denne siden forklarer <em>hva { -brand } gjør og hvorfor</em>, fra null og opp til fysikken. Ingen forkunnskaper forutsettes i den første delen; de senere delene legger til de presise sammenhengene for spesialister. For definisjoner av enkeltord, se <a1>ordlisten</a1>.

seg-34f76bad58cb = { "1" }. Problemet, i ett avsnitt

seg-45c0199e2224 = Nesten alt som trenger å vite <em>hvor det er</em> eller <em>hva klokka er</em> — telefoner, fly, skip, satellitter, strømnett, finanssystemer — støtter seg på signaler fra navigasjonssatellitter (GPS (Global Positioning System) og dets søsken, samlet <b>GNSS</b> (global navigation satellite system)). Disse signalene er svake og lette å miste: jammet, blokkert eller rett og slett utenfor syne i verdensrommet. Når det skjer, må et system <b>klare seg selv</b> med sensorer om bord — en klokke som holder tiden, og treghetssensorer som følger bevegelsen. Spørsmålet { -brand } besvarer, er enkelt å stille og vanskelig å måle: <b>hvor lenge, og hvor godt, kan det klare seg?</b>

seg-ea1895772e76 = { "2" }. Hvorfor «kvante»?

seg-dd6871645f37 = Sensorer om bord driver. En klokke mister sakte tiden; en treghetssensor mister sakte oversikten over posisjonen. <b>Kvante</b>klokker og -treghetssensorer driver <em>langt saktere</em> enn de klassiske delene som brukes i dag — så et kjøretøy kunne seile gjennom et mye lengre GNSS-bortfall og fortsatt holde seg innenfor nøyaktighetsgrensene. Den fordelen er hele løftet med kvante-PNT (posisjonering, navigasjon og tidssynkronisering). Men «langt saktere» må gjøres om til <b>tall</b>: hvor mange ekstra minutter med holdover? hvor mange færre meter drift? Disse tallene avgjør om en kvantenyttelast er verdt kostnaden, massen og effekten.

seg-a5d9dc0fb159 = { "3" }. Hva { -brand } faktisk gjør

seg-cb3a35ba696f = { -brand } er en <b>simulator</b>, ikke maskinvare og ikke et maskinvaredesign. Den:

seg-cb7fdaf6738b = Tar et <b>scenario</b> — en tidslinje med en strekning med GNSS-bortfall, og de publiserte ytelsestallene til en sensor.

seg-701c8c6d0e55 = Kjører en <b>feilmodell for sensoren</b> gjennom tidslinjen: mens GNSS er tilgjengelig, disiplineres modellen mot referansen; under bortfallet går den fritt og samler opp feil nøyaktig slik fysikken tilsier.

seg-bc68e3d54e4c = <b>Skårer</b> resultatet mot operative kvalitetsmål (hvor stor feilen blir, hvor lenge den holder seg innenfor spesifikasjonen, hvor pålitelig estimatet er).

seg-32d31a9beb71 = For sensorpakkene gjøres dette <b>to ganger</b> — én gang for en kvantesensor, én gang for den klassiske motparten — på <em>samme</em> scenario, så sammenligningen er rettferdig.

seg-07d8c6eb84e9 = Avgjørende er at motoren ikke vet noe om «kvante» mot «klassisk». Begge er bare feilmodeller med ulike (publiserte, siterte) parametere. Forskjellen du ser i utdataene, er forskjellen i den publiserte fysikken — ingenting er håndjustert til fordel for noen av sidene.

seg-e20a7d3f32dc = { "4" }. De fire byggeklossene («pakkene»)

seg-638b8d451550 = Sensor

seg-f891ee876b96 = Hva den besvarer

seg-d1b122c389d4 = atomklokke

seg-768230c2eb02 = Hvor lenge holder <em>tiden</em> seg nøyaktig uten GNSS?

seg-029de6b99be0 = Treghetsnavigasjon (dead-reckoning)

seg-f66f2d7b1d6d = akselerometer (+ gyro)

seg-e067a035f656 = Hvor fort driver <em>posisjonen</em> uten GNSS?

seg-9ef8f99ca6e4 = Tidsoverføring

seg-1267f82791f9 = optisk / RF-link (radiofrekvens)

seg-6f240700790d = Hvor presist kan to fartøy dele tid?

seg-90be2a6a29b1 = Hybrid fusjon

seg-780cf1f1127e = alt det ovennevnte

seg-6080a05ace19 = Holder den <em>kombinerte</em> PNT-løsningen?

seg-3f74a708a746 = Hybridpakken er poenget: en navigasjonsløsning trenger <em>både</em> god tid <em>og</em> god posisjon. Den viser at en optisk tidslink kan holde selv en beskjeden klokke låst — noe som gjør at <b>treghetssensoren</b> blir det svakeste leddet, og det er nettopp der et kvanteakselerometer lønner seg.

seg-5f55bb0fd7c5 = Utover de fire pakkene

seg-60191a2cd150 = Den samme motoren kjører mange flere scenario<em>typer</em>; <c1/> lister dem alle. De rekker forbi sensorene til signalene og geometrien sensorene er avhengige av:

seg-995ed414d83d = <b>Hvor satellittene er</b> — banepropagering, konstellasjonsdesign rundt jorden, månen eller et annet legeme, og posisjonene til legemene i solsystemet.

seg-bc8abce2a748 = <b>Hva mottakeren kan se</b> — en azimutavhengig horisontlinje (en gate, en kai, en fjord) over elevasjonsmasken, og himmelgeometrien den etterlater: satellittene i sikte, deres presisjonsforringelse (DOP) og feilellipsen.

seg-b7a2c252c41c = <b>Hva mottakeren hører</b> — L-bånd-spekteret under en jammer, jamming og spoofing, og tap av lås i sporingssløyfen.

seg-f354743045c4 = <b>Om svaret kan stoles på</b> — integritetsovervåking (RAIM, receiver autonomous integrity monitoring, og dens avanserte form ARAIM) med beskyttelsesnivåer.

seg-69aa01a29a49 = <b>Alternativer til GNSS</b> — tilpasning mot gravitasjons- og terrengkart, og posisjonering, navigasjon og tidssynkronisering fra satellitter i lav jordbane (LEO), fra signaldesign via linkbudsjett og navigasjonsmelding til posisjonsbestemmelsen.

seg-297c98214b5b = <b>Tidssynkronisering for nett</b> — telekom-holdover kontrollert mot de internasjonale maskene, og slottidssynkronisering for tidsindekserte tidsplaner.

seg-7eba216a9bf2 = <b>Utover jorden</b> — måne-tid og referansesystemer, tjenestevolumer på månen og navigasjon med reléer på Mars.

seg-b796f49570ed = <b>Mange kjøringer samtidig</b> — kampanjer kjeder sammen typer på én tidslinje, sveiper en parameter eller kjører et Monte Carlo-ensemble.

seg-ef7f4e025018 = { "5" }. Ærlighet i konstruksjonen

seg-65fb8703baf9 = En simulator er bare nyttig hvis du kan stole på den. { -brand } er bygget slik at du kan det:

seg-de8fd160db6d = <b>Hver parameter er sitert.</b> Hvert sensortall har en <c1/>-streng som navngir databladet eller artikkelen det kommer fra. Ingen anonyme konstanter.

seg-09d5cd11b127 = <b>Hver modell er kontrollert mot en lærebokrelasjon,</b> ikke bare mot seg selv — for eksempel må den simulerte klokkens Allan-deviasjon stemme med det publiserte stabilitetstallet, og treghetsdriften må stemme med den vanlige feilveksloven. En funksjon kalles <em>validated</em> bare der en uavhengig ekstern referanse (et virkelig datasett, en uavhengig implementasjon eller publiserte referansevektorer) er enig; resten er <em>modellert</em>, og <a1>verifikasjonsmatrisen</a1> sier hva som er hva.

seg-ccb5b2fe93c4 = Modenhet er merket.

seg-5a0ac98febed = <a1>VALIDATION.md</a1> merker hver effekt som <c1/>, <c2/> eller <c3/>, og sier rett ut at tallene for optiske klokker er <em>laboratorie- og romtall som mål</em> — ingen optisk strontiumklokke har flydd.

seg-de463596fcdb = <b>Resultatene er reproduserbare helt ned til bitnivå:</b> det samme scenarioet, seedet og versjonen gir alltid det samme svaret på samme plattform; på tvers av operativsystemer stemmer tallene med { "1e-6" } relativt (se <a1>REPRODUCIBILITY.md</a1>).

seg-f87dad1ffc98 = { "6" }. Fysikken, for spesialister

seg-8fc6db9faf83 = Sammenhengene { -brand } implementerer og tester (full detalj og toleranser i <a1>VALIDATION.md</a1>):

seg-ea61f869c266 = <b>Klokke-holdover.</b> To-tilstands fase-/frekvensmodell med hvit frekvensmodulasjon (hvit FM, effekttetthetsspekter <c1/>), random-walk-FM (<c2/>), flicker-FM (en sum av logaritmisk fordelte Ornstein–Uhlenbeck-prosesser kalibrert til et flatt Allan-gulv) og deterministisk aldring. Validert med overlappende Allan-deviasjon mot den publiserte <c3/> (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

seg-4f46754c399f = <b>Treghetsnavigasjon (dead-reckoning).</b> Gjenværende akselerometerbias → <c1/>; hastighets-random-walk → <c2/>; valgfri gyrobias og vinkel-random-walk gir en helningsfeil som kobler tyngdekraften (<c3/>) inn i horisontal akselerasjon (Groves).

seg-d59595d00f0a = <b>Tidsoverføring.</b> Hvit tidsjitter → synkroniseringspresisjon → énveis avstandsmåling (<c1/>, { "1" } ps ≈ { "0.3" } mm); utvalgsgjennomsnittet midles som <c2/>.

seg-0eb7a53fb4a6 = <b>Fusjon og integritet.</b> Et Kalman-filter med to tilstander der prosessstøyen svarer til sannhetsmodellen; under coasting vokser faseestimatets varians til nøyaktig <c1/> — den analytiske holdover-relasjonen — og 1-σ-grensen mater kvalitetsmålet for integritet.

seg-80daa7cb8641 = <b>Geometri.</b> Kepler-propagering for to legemer (valgfritt med sekulær J2) eller SGP4 (Simplified General Perturbations { "4" }) fra virkelige tolinjers elementsett, Walker-konstellasjoner og synlighet langs siktlinjen (jordokkultasjon + elevasjonsmaske) utleder GNSS-tilgjengelighet fra banegeometri i stedet for håndskrevne vinduer.

seg-4ce4c6b79b93 = { "7" }. Veien videre

seg-7c8344a26230 = Arbeid deg gjennom: <a1>veiledningene</a1> — tre gjennomgåtte eksempler + øvinger med stigende vanskelighetsgrad.

seg-277f1b435cf6 = Kjør den: se hurtigstarten i <a1>README</a1>.

seg-c349981bd4f1 = Forstå strukturen: <a1>ARCHITECTURE.md</a1>.

seg-f7acbf857c57 = Sjekk hva som er og ikke er validert: <a1>VALIDATION.md</a1>.

seg-04a86ea674a5 = Slå opp et begrep: <a1>GLOSSARY.md</a1>.

seg-4a73b906888b = <s1>Forrige</s1>Oversikt

seg-2f14e84bfc99 = <s1>Neste</s1>Ordliste
