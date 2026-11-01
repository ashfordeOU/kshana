# docs--tutorial-clock-holdover: translations (nb)

seg-b59f529012a6 = Kilde: <c1/>

seg-e66a5042182e = Veiledning { "2" } — Klokkens holdover: hvor lenge kan du seile på egen kraft

seg-889112bc4c09 = <c1/> · <b>Scenario:</b> <c2/> (undervisningskopi: <a1><c3/></a1>) · <b>Vanskelighetsgrad:</b> nybegynner · <b>~{ "20" } min</b>

seg-a4bdf55d96be = Til slutt har du kjørt en klokke-holdover med GNSS-signaler (Global Navigation Satellite System) nektet, lest tidskvalitetsmålet og forstått driftsloven √(q_wf·T) som forklarer <em>hvorfor</em> den optiske klokken holder lenger enn den på brikkenivå, med loven hentet fra NIST (det amerikanske National Institute of Standards and Technology), ikke funnet på.

seg-51ae9468b92a = Hva dette scenarioet er

seg-87334505b228 = Når GNSS-signalene forsvinner, holder et system tiden på sin egen klokke om bord. Klokkens fase driver sakte, og når driften overstiger den operative tidsspesifikasjonen, er du ute av drift. <b>Holdover</b> er hvor lenge du holder deg innenfor spesifikasjonen etter GNSS-tap — det sentrale tallet for autonomi.

seg-798ac031b5c6 = Scenarioet kjører en tidslinje på { "2" } h: { "10" } min GNSS-synkronisering, deretter { "6600" } s ({ "1.83" } h) nektet, mot en tidsspesifikasjon på { "20" } ns, samplet hvert { "10" } s. Det sammenligner to klokker på identisk kode med deres <em>egne</em> publiserte støy:

seg-3d53622dbe12 = <b>Kvante</b>: en optisk strontium-gitterklokke, romsmål σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), et mål for en bakkedemonstrator, ikke flydd. σ_y(τ) er Allan-avviket, standardmålet for klokkens frekvensstabilitet ved midlingstid τ.

seg-e25af6d0752f = <b>Klassisk</b>: en Microchip SA.45s-atomklokke på brikkenivå (CSAC), σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (datablad) — en kommersiell del i bruk.

seg-08f3fdc9252a = Les oppsummeringen på én linje

seg-baa0cc808987 = Med seed = { "42" }, spesifikasjonen på { "20" } ns og utfallet på { "6600" } s:

seg-76f7739f8b17 = <b><c1/></b> — den optiske klokken holder hele utfallet på { "6600" } s uten å bryte { "20" } ns. Dens 95-persentil av fasefeilen er { "1.20e-4" } ns, omtrent en titusendel av et nanosekund: den beveger seg knapt.

seg-0ba48fccffae = <b><c1/></b> — CSAC-en bryter spesifikasjonen på { "20" } ns ved ~{ "2610" } s, mindre enn halvparten av utfallet. Dens p95-fasefeil ({ "19.7" } ns) ligger rett ved spesifikasjonslinjen.

seg-b745d05e2bf1 = <b><c1/></b> — dette scenarioet setter ikke opp noe angrep, så det er ingenting å oppdage, og oppsummeringen skriver ikke ut et tall. JSON-en har likevel hver klokkes analytiske grense for spoof-detekterbarhet i <c2/> ({ "0.997" } for den optiske klokken; { "0.000" } for CSAC-en, hvis egen seilingsstøy over vinduet allerede overstiger { "20" } ns), merket <c3/> i blokken <c4/>. Å skåre deteksjon mot et ekte angrep er historien i <a1>veiledning { "3" }</a1>.

seg-510e1cd8ed40 = <b><c1/></b> — her er dette <em>filterets selvkonsistens</em> (andelen utfallssampler innenfor Kalman-filterets egen k-sigma-grense), <b>ikke</b> et horisontalt eller vertikalt beskyttelsesnivå for luftfart (HPL/VPL). Se <a1><c2/></a1>.

seg-7cc0ba5e5d13 = Den ikke-sirkulære referansen: hvorfor { "2610" } s for CSAC-en?

seg-2958401e00ca = For en klokke med hvit frekvensmodulasjon (white-FM) vokser 1-σ-fasefeilen som <b>σ_x(T) ≈ √(q_wf · T)</b>, der <c1/> har enheten s². Denne sammenhengen er fra <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — sammenhengene mellom σ_y(τ) og fase — den <em>samme</em> SP-1065-sammenhengen som <c2/> validerer motorens Allan-avvik mot til ~{ "2" } %.

seg-d6c8f68b42b9 = For CSAC-en er <c1/>. Løs for tiden 1-σ-fasen når { "20" } ns = { "2" }×{ "10" }⁻⁸ s:

seg-0f28d1a1163f = Motorens { "2610" } s er ikke den 1-σ-tiden, og skal ikke være det. <c1/> er det første punktet i { "10" } s-rutenettet (<c2/>) der <em>denne seedede realisasjonens</em> absolutte fasefeil overstiger { "20" } ns (<c3/>). En tilfeldig vandrings første kryssing av et nivå kommer ofte langt før tiden 1-σ-omhyllingskurven når det nivået, og realisasjonen bærer også restfrekvensfeilen filteret sitter igjen med etter synkroniseringen på { "600" } s. Så loven fastsetter størrelsesorden, noen tusen sekunder for en klokke på { "3" }×{ "10" }⁻¹⁰ mot { "20" } ns, ikke den eksakte verdien. Testen krever et <b>{ "2000" }–{ "3200" } s-bånd</b> rundt den, ikke tallet.

seg-2e7cbdefa9b7 = Databladankrene selv er eksterne, sitert i scenarioets <c1/>-strenger: optisk Sr-gittermål { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (datablad). Og den eksporterte <c2/> stemmer med databladets σ_y(τ) til ~{ "2" } % (<c3/>, NIST SP { "1065" }). Plott den som et log-log-diagram «Clock stability (ADEV, Allan deviation)» i lekeplassen.

seg-def5271a207d = Hva testen fester

seg-ebddc1f5ffe2 = <c1/> (den optiske klokken må holde minst like lenge),

seg-8e570268f107 = <c1/> (holder hele utfallet),

seg-d60483c1af2e = <c1/> — et toleransebånd rundt SP-1065 white-FM-størrelsen, <em>ikke</em> et magisk tall. Referansen er loven, ikke verdien.

seg-e5f926d1055b = Fallgruver og enheter

seg-0f57e35ed833 = <b>Tidstall er i nanosekunder</b>, aldri meter. (Posisjons-holdover er en <em>annen</em> pakke — se det inertielle avsnittet i veiledning { "3" }.)

seg-2e476b213141 = <b><c1/> har enheten s² og er lik σ_y({ "1" } s)².</b> Det er broen fra et Allan-tall i et datablad til modellen.

seg-75951a150b44 = <b>Holdover er en nedre grense kvantisert til rutenettet</b> (<c1/>). Ikke les for mye i den eksakte verdien; les <em>båndet</em>.

seg-959eb86066f1 = <c1/> her er filterets selvkonsistens, ikke integritet i luftfartens forstand.

seg-cb457294fc53 = Veien videre

seg-aa3e50f2c699 = <b>Nivå { "2" }:</b> stram inn <c1/> fra { "20" } til { "10" } og se CSAC-holdoveren <em>falle</em> ({ "2610" } s → { "1300" } s, målt med <c2/>), eller bruk <c3/> til å tabulere holdover mot CSAC-ens støynivå <c4/> (<c5/>: { "25" } punkter fra { "10" }⁻²⁴ til { "10" }⁻¹⁸ s², klassisk holdover { "2610" } s → { "250" } s).

seg-cb31f104d104 = <b>Nivå { "3" }:</b> legg til <c1/> for å gjøre dette om til et Monte Carlo-ensemble og les holdover-båndet [p05–p95] (<c2/> skriver ut <c3/>).

seg-9cb56e10f0fd = Så avslutningsoppgaven: <a1>Veiledning { "3" } — Kvante mot klassisk robusthet</a1>.

seg-7dc19a98c7ee = <s1>Forrige</s1>{ "1" } · Din første bane

seg-c274e92fdcb5 = <s1>Neste</s1>{ "3" } · Kvante mot klassisk
