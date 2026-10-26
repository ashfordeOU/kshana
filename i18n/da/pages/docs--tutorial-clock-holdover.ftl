# docs--tutorial-clock-holdover: translations (da)

seg-b59f529012a6 = Kilde: <c1/>

seg-e66a5042182e = Vejledning { "2" } — Urets holdover: hvor længe kan du glide

seg-889112bc4c09 = <c1/> · <b>Scenarie:</b> <c2/> (undervisningskopi: <a1><c3/></a1>) · <b>Sværhedsgrad:</b> begynder · <b>~{ "20" } min</b>

seg-a4bdf55d96be = Til sidst har du kørt en urholdover med GNSS-signaler (Global Navigation Satellite System) nægtet, læst tidssynkroniseringens kvalitetsmål og forstået driftsloven √(q_wf·T), der forklarer, <em>hvorfor</em> det optiske ur holder længere end det i chipstørrelse; loven er hentet fra NIST (det amerikanske National Institute of Standards and Technology) og ikke opfundet.

seg-51ae9468b92a = Hvad dette scenarie er

seg-87334505b228 = Når GNSS-signalerne forsvinder, holder et system tiden på sit eget ur om bord. Urets fase driver langsomt, og når driften overskrider den driftsmæssige tidsspecifikation, er du ude af drift. <b>Holdover</b> er, hvor længe du holder dig inden for specifikationen efter tab af GNSS — det centrale kvalitetsmål for autonomi.

seg-798ac031b5c6 = Scenariet kører en tidslinje på { "2" } timer: { "10" } min GNSS-synkronisering, derefter { "6600" } s ({ "1.83" } timer) nægtet, mod en tidsspecifikation på { "20" } ns, samplet hver { "10" } s. Det sammenligner to ure på identisk kode med deres <em>egen</em> offentliggjorte støj:

seg-3d53622dbe12 = <b>Kvante</b>: et optisk strontiumgitterur, rummål σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), et mål for en jordbaseret demonstrator, ikke fløjet. σ_y(τ) er Allan-deviationen, det almindelige mål for et urs frekvensstabilitet ved middelværditiden τ.

seg-e25af6d0752f = <b>Klassisk</b>: et Microchip SA.45s atomur i chipstørrelse (CSAC), σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (datablad) — en kommerciel del i drift.

seg-08f3fdc9252a = Læs opsummeringen på én linje

seg-baa0cc808987 = Med seed = { "42" }, specifikationen på { "20" } ns og udfaldet på { "6600" } s:

seg-76f7739f8b17 = <b><c1/></b> — det optiske ur holder hele udfaldet på { "6600" } s uden at overskride { "20" } ns. Dets 95.-percentil af fasefejlen er { "1.20e-4" } ns, omkring en titusindedel af en nanosekund: det bevæger sig næsten ikke.

seg-0ba48fccffae = <b><c1/></b> — CSAC overskrider specifikationen på { "20" } ns ved ~{ "2610" } s, mindre end halvdelen af udfaldet. Dets p95 af fasefejlen ({ "19.7" } ns) ligger lige ved specifikationslinjen.

seg-b745d05e2bf1 = <b><c1/></b> — dette scenarie konfigurerer intet angreb, så der er intet at opdage, og opsummeringen udskriver ikke et tal. JSON'en bærer stadig hvert urs analytiske grænse for spoof-detekterbarhed i <c2/> ({ "0.997" } for det optiske ur; { "0.000" } for CSAC, hvis egen støj under glidet over vinduet allerede overstiger { "20" } ns), markeret <c3/> i blokken <c4/>. At score detektion mod et reelt angreb er historien i <a1>Vejledning { "3" }</a1>.

seg-510e1cd8ed40 = <b><c1/></b> — her er dette <em>filterets selvkonsistens</em> (andelen af udfaldets sampler inden for Kalman-filterets eget k-sigma-bånd), <b>ikke</b> et beskyttelsesniveau i luftfarten for vandret eller lodret (HPL/VPL). Se <a1><c2/></a1>.

seg-7cc0ba5e5d13 = Den ikke-cirkulære uafhængige reference: hvorfor { "2610" } s for CSAC?

seg-2958401e00ca = For et ur med hvid frekvensmodulation (hvid FM) vokser 1-σ-fasefejlen som <b>σ_x(T) ≈ √(q_wf · T)</b>, hvor <c1/> har enheden s². Denne sammenhæng stammer fra <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — sammenhængene σ_y(τ)↔fase — den <em>samme</em> SP-1065-sammenhæng, som <c2/> validerer motorens Allan-deviation mod med cirka { "2" } %.

seg-d6c8f68b42b9 = For CSAC er <c1/>. Løs for den tid, hvor 1-σ-fasen når { "20" } ns = { "2" }×{ "10" }⁻⁸ s:

seg-0f28d1a1163f = Motorens { "2610" } s er ikke den 1-σ-tid, og det skal den heller ikke være. <c1/> er det første gitterpunkt på { "10" } s (<c2/>), hvor <em>denne seedede realisations</em> absolutte fasefejl overstiger { "20" } ns (<c3/>). En random walks første krydsning af et niveau kommer ofte længe før det tidspunkt, hvor dens 1-σ-indhylling når det niveau, og realisationen bærer også den resterende frekvensfejl, filteret er efterladt med efter synkroniseringen på { "600" } s. Så loven fastlægger skalaen, nogle få tusinde sekunder for et ur på { "3" }×{ "10" }⁻¹⁰ mod { "20" } ns, ikke den nøjagtige værdi. Testen hævder et <b>bånd på { "2000" }–{ "3200" } s</b> omkring den, ikke tallet.

seg-2e7cbdefa9b7 = Selve datablads-ankrene er eksterne og citeret i scenariets <c1/>-strenge: optisk Sr-gitter, mål { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (datablad). Og den eksporterede <c2/> svarer til databladets σ_y(τ) til cirka { "2" } % (<c3/>, NIST SP { "1065" }). Plot den som et log-log-diagram "Clock stability (ADEV, Allan deviation)" i playground'en.

seg-def5271a207d = Hvad testen fastlåser

seg-ebddc1f5ffe2 = <c1/> (det optiske ur skal holde mindst lige så længe),

seg-8e570268f107 = <c1/> (holder hele udfaldet),

seg-d60483c1af2e = <c1/> — et tolerancebånd omkring SP-1065's white-FM-skala, <em>ikke</em> et magisk tal. Den uafhængige reference er loven, ikke værdien.

seg-e5f926d1055b = Faldgruber og enheder

seg-0f57e35ed833 = <b>Tidsangivelserne er i nanosekunder</b>, aldrig i meter. (Holdover for position er en <em>anden</em> pakke — se afsnittet om inertinavigation i Tutorial { "3" }.)

seg-2e476b213141 = <b><c1/> har enheden s² og er lig med σ_y({ "1" } s)².</b> Det er broen fra et Allan-tal i et datablad til modellen.

seg-75951a150b44 = <b>Holdover er en nedre grænse, kvantiseret til tidsgitteret</b> (<c1/>). Læs ikke for meget i den præcise værdi; læs <em>båndet</em>.

seg-959eb86066f1 = <c1/> er her filterets selvkonsistens, ikke integritet i luftfartsforstand.

seg-cb457294fc53 = Hvad så

seg-aa3e50f2c699 = <b>Niveau { "2" }:</b> skærp <c1/> fra { "20" } til { "10" } og se CSAC-holdover <em>falde</em> ({ "2610" } s → { "1300" } s, målt med <c2/>), eller brug <c3/> til at stille holdover op i en tabel mod CSAC-støjniveauet <c4/> (<c5/>: { "25" } punkter fra { "10" }⁻²⁴ til { "10" }⁻¹⁸ s², klassisk holdover { "2610" } s → { "250" } s).

seg-cb31f104d104 = <b>Niveau { "3" }:</b> tilføj <c1/> for at gøre dette til et Monte Carlo-ensemble og læs [p05–p95]-båndet for holdover (<c2/> udskriver <c3/>).

seg-9cb56e10f0fd = Derefter slutstenen: <a1>Tutorial { "3" } — Kvante mod klassisk modstandsdygtighed</a1>.

seg-7dc19a98c7ee = <s1>Forrige</s1>{ "1" } · Din første bane

seg-c274e92fdcb5 = <s1>Næste</s1>{ "3" } · Kvante mod klassisk
