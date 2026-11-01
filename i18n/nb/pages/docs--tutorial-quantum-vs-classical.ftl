# docs--tutorial-quantum-vs-classical: translations (nb)

seg-501d3a72ea43 = Integritet

seg-8980b5ae869b = Tall

seg-e5f926d1055b = Fallgruver og enheter

seg-cb457294fc53 = Veien videre

seg-a3686dd6817d = Kilde: <c1/>

seg-0c2365600795 = Veiledning { "3" } — Kvante mot klassisk GNSS-robusthet (avslutningsoppgave)

seg-cc4017642043 = <c1/> + <c2/> · <b>Scenarioer:</b> <c3/>, <c4/> (undervisningskopier: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Vanskelighetsgrad:</b> middels · <b>~{ "35" } min</b>

seg-5de2e6656527 = Avslutningsoppgaven. Du kjører et scenario med spoofing-detektor og en full fusjonert pakke for posisjonering, navigasjon og tidssynkronisering (PNT), og lærer å lese <b>sikkerhet</b>, <b>integritet</b> og <b>dødregning</b> sammen — hele tesen: kvanteinertial og optisk tidssynkronisering gir en robusthet som GNSS-nekting (Global Navigation Satellite System) ellers ville tatt bort.

seg-ffa5242638c2 = Del A — Sikkerhet: å fange en tidsspoofing

seg-23c18da1415f = En angriper injiserer en sakte stigende falsk GNSS-tid ({ "0.1" } ns/s, fra t = { "60" } s). Mottakeren krysskontrollerer den påståtte tiden mot sin egen klokkes predikerte forløp og flagger spoofingen når avviket passerer deteksjonsgrensen. Detektoren er en tosidig <b>χ²₁ / Neyman–Pearson-energitest</b> med falsk alarm-sannsynlighet P_fa = { "0.01" }; sikkerhetsmålet er <b><c1/></b> (én minus sannsynligheten for udetektert feil) ved en spoofing på spesifikasjonsstørrelse ({ "20" } ns).

seg-46aa0e01b330 = <b>Kvante: <c1/>, oppdaget ved { "70" } s.</b> Den optiske klokkens deteksjonsgulv er en brøkdel av et nanosekund, så den flagger spoofingen nesten umiddelbart — langt under spesifikasjonen på { "20" } ns.

seg-022573b3dcc4 = <b>Klassisk: <c1/>, oppdaget ved { "430" } s.</b> Atomklokken på brikkenivå (CSAC) har egen seilingsstøy over vinduet som er på størrelse med { "20" } ns, så den kan ofte ikke skille spoofingen fra sin egen drift — den bommer i { "44" } % av tilfellene.

seg-27b2b715efcb = Den ikke-sirkulære referansen: analytisk mot Monte Carlo P_md

seg-c85651eebd32 = Detektorens sannsynlighet for udetektert feil beregnes på <b>to uavhengige måter</b> som må stemme overens: en <b>lukket χ²₁-hale</b> (Neyman–Pearson-resultatet) og et <b>Monte Carlo</b>-estimat (MC). For CSAC-en er den analytiske P_md <c1/> og MC-ens P_md <c2/> — de stemmer til { "0.002" }, godt innenfor samplingsfeilen <c3/>. For den optiske klokken er begge { "0.000" }. At to atskilte beregninger av den <em>samme</em> sannsynligheten stemmer, er den ikke-sirkulære krysskontrollen (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; standard NP-/χ²-deteksjon). <c4/> krever <c5/> for begge klokkene og <c6/>.

seg-5cf0d909bac7 = Del B — Hybrid PNT: den fulle fusjonerte pakken

seg-498a57aae11d = Nå fusjonerer avslutningsscenarioet en optisk klokke + en kaldatom-treghetsmåleenhet (IMU) (kvantepakken) mot en CSAC + en IMU i navigasjonsklassen (den klassiske pakken), gjennom det samme GNSS-utfallet på { "6600" } s ({ "1.83" } h), mot en tidsspesifikasjon på { "20" } ns og en posisjonsspesifikasjon på { "100" } m. Begge pakkene forankrer klokkene sine på nytt hvert { "60" } s over den samme optiske tidsoverføringslinken mellom satellitter, modellert med { "1" } ps jitter per ny synkronisering (<c1/> i scenarioet; <c2/> bygger én <c3/>-link for begge pakkene).

seg-61934559c7a0 = Les delingen <c1/> — tids-holdover mot posisjons-holdover:

seg-dee5b1a35bdd = <b>Kvante: PNT-holdover { "6600" } s</b> — holder både tid (t { "6600" } s) og posisjon (p { "6600" } s) hele utfallet.

seg-6441dfa026dc = <b>Klassisk: PNT-holdover { "350" } s</b> — <em>tiden</em> holder hele { "6600" } s (t { "6600" } s), fordi den optiske tidsoverføringens nye synkronisering holder selv den <em>klassiske klokken</em> låst. Pakken er <b>begrenset av posisjonen ved p { "350" } s</b>: IMU-en i navigasjonsklassen er det svake leddet. Dette er fusjonstesen — isoler feilen i den klassiske pakken til dens inertielle sensor.

seg-12e9b7192733 = <b><c1/> for kvantepakken er ekte og er ikke en feil.</b> Det er filterets selvkonsistens over støyende ny synkronisering — <b>ikke</b> et integritetstall i luftfartens forstand (horisontalt eller vertikalt beskyttelsesnivå, HPL/VPL). Ikke les for mye i ordet «integritet» her; se <a1><c2/></a1>.

seg-587efcdcbc13 = Den ikke-sirkulære referansen: posisjons-holdoveren på { "350" } s

seg-a70ad8fc122f = Tallet { "350" } s er dødregningsfysikk, ikke et tilpasset tall. En konstant akselerometerbias <c1/> driver posisjonsfeilen som <b>½·b·T²</b>. Kryssing av spesifikasjonen på { "100" } m:

seg-778e817e3e9b = Motoren rapporterer { "350" } s, det siste punktet i { "10" } s-rutenettet før kryssingen og { "2" } % under de { "357" } s som bare bias gir: scenarioets akselerometre har også hastighetsrandomvandringsstøy (<c1/>), som kommer i tillegg til biasdriften, så den modellerte feilen når { "100" } m litt tidligere.

seg-e105a8ab605b = Autoritativ lov: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2. utg.), vekst av dødregningsfeil. Disse to ½bT²-verdiene forklarer motorens deling { "350" } s / { "6600" } s: en lukket fysikkontroll, ekstern for filteret.

seg-c2515e55dffa = Du kan se det inertielle svake leddet direkte i dødregningsscenarioet (<a1><c1/></a1>, type <c2/>): <c3/>: føringen i navigasjonsklassen divergerer til titalls kilometer.

seg-6c688f2e7136 = Hvordan du leser de tre tallene sammen

seg-4f1a49d61cee = Hva det betyr her

seg-2e91989b1a89 = Hva det <b>ikke</b> betyr

seg-b403ce86b14d = analytisk grense for spoofing-<em>detekterbarhet</em> (<c1/>) for et satt opp angrep; oppsummeringen for <c2/> skriver ut <c3/> fordi det scenarioet ikke setter opp noe

seg-e04c25dd278d = ikke en RAIM-detektor (receiver autonomous integrity monitoring) for flere satellitter

seg-7e678dd4409e = filterets selvkonsistens (sampler innenfor k-σ-grensen)

seg-1643e7e71209 = ikke integritet i luftfartens forstand (HPL/VPL/RAIM)

seg-4095f7ab4b14 = tid innenfor spesifikasjonen etter GNSS-tap, delt i tid og posisjon

seg-5b90536cdfd5 = ikke en 2-D-nøyaktighet som CEP (circular error probable) eller 2DRMS (twice the distance root mean square)

seg-4b11ef3b6dba = Den ekte mottakerautonome integriteten — ekte HPL/VPL med varslingsgrenser og et Stanford-diagram — finnes i pakken <c1/> (<a1><c2/></a1>); det er leseøvelsen på nivå 3.

seg-28cddec341ed = Hva testene fester

seg-a27c3195acf3 = <c1/> — analytisk mot MC P_md stemmer til < { "0.05" } for begge klokkene; <c2/>.

seg-78a5a0066e09 = Hybridoppsummeringen ({ "6600" } s / { "350" } s) og den inertielle delingen er festet gjennom undervisningsscenarioene sine (<a1><c1/></a1>, <a2><c2/></a2>) av <c3/>, som sammenligner hver motoroppsummering med linjen <c4/> som filen registrerer. ½bT²-referansen ovenfor er fysikkontrollen av disse tallene.

seg-a4371822e379 = <b>Tidsmålet (FoM) er i nanosekunder; posisjonsmålet er i meter og 1-DOF</b> (én frihetsgrad: én akse, ikke CEP/2DRMS).

seg-1331ea80a427 = <c1/> er selvkonsistens, ikke integritet i luftfartens forstand.

seg-87c49084032c = Den klassiske pakkens <em>tid</em> overlever bare på grunn av den nye synkroniseringen over optisk tidsoverføring; les delingen <c1/>, ikke bare hoved-PNT-holdoveren.

seg-1c93115bf118 = Kjør tilfellet med ærlig svikt: <c1/> (type <c2/>) rapporterer en ARAIM-passering (advanced RAIM) ved sørpolen der beskyttelsesnivåene <em>overstiger</em> varslingsgrensen (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } av { "24" } epoker tilgjengelige), så systemet rapporteres som <b>utilgjengelig</b>: en egenskap, ikke en feil.

seg-ac70d3131064 = Ta historien med til lav jordbane (LEO): <c1/> (type <c2/>) kjeder en GNSS-jamming-fase, et LEO-posisjoneringslag som bærer brukeren gjennom den, og en integritetskontroll på én tidslinje. Se <a1>de nyere funksjonene</a1> for de andre scenarioene for robusthet og vertikaler.

seg-063422d3c70b = Forsvar et resultat: gjør <a1>øvelsen på nivå 3</a1> — Monte Carlo-bånd, reproduserbarhet og å lese et beskyttelsesnivå.

seg-4f7275a21f44 = <s1>Forrige</s1>{ "2" } · Klokkens holdover

seg-8b0c90f82aab = <s1>Neste</s1>Gjennomgått eksempel: pipeline med flere verktøy
