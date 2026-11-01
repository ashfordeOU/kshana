# docs--reproducibility: translations (nb)

seg-03cb5fb3dd8f = Ja

seg-a7d5633dbcc0 = Reproduserbarhet og proveniens

seg-ab939e90efad = Kilde: <c1/>

seg-1c48a3edda84 = Kshana er bygget for å være reproduserbar: de samme inndataene gir de samme resultatene, og byggeartefaktene kan spores tilbake til kilden som produserte dem. Dette dokumentet sier nøyaktig hva som er garantert, hva som ikke er det, og hvordan garantiene håndheves.

seg-95b0eba44abe = Deterministiske garantier

seg-1f637144697d = Motoren har ingen veggklokke, ingen avhengighet av utførelsestråd og ingen tilfeldighet uten seed. Hver stokastiske prosess drives av en <c1/>-strøm nøklet med scenarioets <c2/>, trukket i fast rekkefølge. Konsekvenser:

seg-14df30025491 = Egenskap

seg-f0badf8cb640 = Garantert

seg-9f6678ac42f5 = Håndheves av

seg-cfc934af2c75 = Samme scenario, samme maskin → byte-identisk <c1/>

seg-917da569fdd7 = <c1/> (kjører referansescenarioet to ganger, sammenligner SHA-256 (SHA: Secure Hash Algorithm))

seg-27351cbdc2b5 = Samme scenario → identiske kvalitetsmål felt for felt

seg-bdeaf344acf8 = Ja, per plattform

seg-debbc6540baf = <c1/> fastsetter hvert kvalitetsmål (FoM) for de fire referansescenarioene

seg-f7c5427c88f9 = Scenarioets inndatahash (<c1/>) er plattformuavhengig

seg-2bdf4b2d80be = innholdsadressert SHA-256 av det kanoniske scenarioet, fastsatt i <c1/>

seg-45861afe0994 = Inndatafingeravtrykk + utdataenes <b>form</b> identiske på tvers av OS (operativsystem)

seg-49345663b97c = <c1/> fastsetter en nøyaktig SHA-256 per scenario (ti scenarioer, én <c2/>-fil hver i <c3/>), kontrollert på CI-matrisen (kontinuerlig integrasjon) med 3 OS

seg-e54b5ff80782 = Utdataenes <b>verdier</b> stemmer overens på tvers av OS (ubuntu/macOS/Windows)

seg-271bcbff6287 = Ja, til { "1e-6" }

seg-3c25e00debff = CI-jobben <c1/> kjører <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) og <c4/> på alle tre OS

seg-3876618cc821 = En navigasjonsmeldingsramme for lav jordbane (LEO) er de samme bytene på hver plattform og i hver byggeprofil, WebAssembly-bygget (WASM) medregnet

seg-8aff3ee31c7e = <c1/> (hver transcendente funksjon og hver normalavvik for typen <c2/> går gjennom craten <c3/> i ren Rust); <c4/> fastsetter en hel ramme uten plattformsperre

seg-69750a5db756 = Trekninger av indekser med seed (bootstrap-resampling, stokkinger) er de samme på 32-bits og 64-bits mål

seg-01e0601aa7fc = <c1/> trekker alltid som <c2/>; fastsatt i <c3/>

seg-e42899fd8a4e = Samme verktøykjede overalt

seg-0bdd9769d5fb = <c1/> fastsetter kanalen; <c2/> lar bygget feile ved avvik; CI og utgivelse fastsetter den samme versjonen

seg-b0a3fd993614 = Samme avhengighetssett

seg-5a3daf9f0468 = <c1/> er innsjekket, og <c2/> brukes for SBOM-en (software bill of materials)

seg-3ec3fae0dc5e = Hver kommandolinjekjøring skriver også et reproduserbarhetsregister inn i rapporten sin (<c1/> og <c2/>): motorversjonen, SHA-256 for scenariofilen og for resultatdokumentet, seeden, plattformen og den nøyaktige kommandoen, som <c3/> kjører på nytt til et byte-identisk resultat. Rapporten er selv en ren funksjon av kjøringen: to kjøringer av <c4/> skriver den samme <c5/> byte for byte. Se <a1>REPORTS.md</a1>.

seg-273a66a3584d = Forbeholdet om kryssplattform (og hvordan golden-testene håndterer det)

seg-9f4ec3dc638d = De numeriske resultatene er <b>bit-identiske på en gitt plattform</b>, men kan avvike i de siste få enhetene i siste posisjon (ULP) <b>mellom</b> plattformer. Årsaken er plattformens matematikkbibliotek: <c1/>, <c2/>, <c3/> og lignende er ikke påkrevd av IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) å være korrekt avrundet, så Linux (glibc, GNU C-biblioteket), macOS og Windows kan hver returnere en forskjellig siste bit. Over en lang kjøring akkumuleres disse ~{ "1e-16" }-forskjellene til kanskje ~{ "1e-12" } relativt.

seg-9297c2585419 = To ting gjør at forskjellen i siste posisjon blir større enn den starter som, og begge er målt, ikke antatt. En <b>adaptiv integrator</b> velger sitt neste steg ut fra feilestimatet gjennom en femterot, så én enhet i siste posisjon endrer stegfølgen, og de to plattformene stemmer da overens bare til integrasjonstoleransen. En <b>iterativ estimator</b> (en minstekvadraters tilpasning, et banebestemmelsesfilter) kan ta en annen vei til konvergens. Typer bygget på noen av dem kan avvike mellom plattformer med mer enn { "1e-6" } i enkeltfelt; <c1/> registrerer det samme regimet for enhetstestene.

seg-c6bd20427abc = <b>Byggeprofilen</b> betyr det samme på samme måte, på én maskin. Et optimalisert bygg på macOS slår sammen en sinus og en cosinus av ett argument til ett enkelt kall til systemets kombinerte rutine, hvis sinus avviker fra den alenestående <c1/> i siste bit for { "379" } av { "200 000" } argumenter; et uoptimalisert bygg gjør de to kallene. Målt på aarch64 macOS over de { "138" } scenariofilene gir et debug- og et release-bygg av én kilde byte-identiske resultatdokumenter for { "102" }. De øvrige { "36" } avviker i de siste sifrene: { "28" } innenfor { "1e-6" }, ett (<c2/>) med { "2.8e-6" }, og sju kampanjer bare i sjekksummene for medlemskjøringene sine; ingen avviker i en etikett, et antall eller en konklusjon. Garantien om byte-identitet ovenfor gjelder derfor for ett bygg: den samme binærfilen to ganger.

seg-ff368c627bd2 = De <b>normalfordelte trekningene</b> med seed er en tredje, mye sjeldnere kilde: sampleren kaller vertens eksponential og logaritme i sine sjeldne grener, og omtrent én trekning av en million avviker i siste bit mellom det native og WASM-bygget.

seg-0b7ebca1a5e3 = Der et utdata er <b>diskret</b>, er en forskjell i siste posisjon ikke akseptabel i det hele tatt, og typen beregnes med <c1/> i stedet for vertens bibliotek. Typen <c2/> er den første: den binære rammen er overførte heltall, og det samme scenarioet ble en gang kodet til tre forskjellige rammer: i et release-bygg, i et debug-bygg av samme kilde og i nettleseren. Nå er det de samme bytene i alle tre.

seg-1746a0ea22fe = På grunn av dette fastsetter golden-testene <b>ikke</b> én enkelt kryssplattform-hash av flyttallsutdataene — det ville vært skjørt og ville latt ærlig korrekte bygg feile på et annet OS. I stedet:

seg-9733b0545768 = <b><c1/></b> fastsetter hvert kvalitetsmål med en relativ toleranse på <c2/> — fire størrelsesordener strengere enn enhver virkelig regresjon (som flytter en verdi med hele prosent), men langt løsere enn jitter i matematikkbiblioteket (libm) på tvers av plattformer. Nettbegrensede felt (holdover-sekunder) og felt som er nøyaktig null, fastsettes nøyaktig.

seg-a3dfe1c26401 = <b><c1/></b> — en innholdshash av <em>inndataene</em> — er plattformuavhengig og fastsatt nøyaktig.

seg-571aea9b8115 = <b><c1/></b> fastsetter en nøyaktig SHA-256, innsjekket per scenario i <c2/>, over projeksjonen som <em>er</em> identisk på tvers av plattformer: inndatafingeravtrykket pluss utdataenes <b>form</b> (feltnavn, nøsting, bladtyper, arraylengder — fastsatt av deterministisk nettaritmetikk, aldri flyttallsverdiene). Dette fanger strukturelle regresjoner nøyaktig, mens toleransefastsettelsene ovenfor fanger verdiregresjoner.

seg-8543165b0d7d = <b><c1/></b> håndhever byte-identiske utdata over to kjøringer <em>på samme maskin</em> (determinismegarantien).

seg-8b8b4ba5de30 = <b>CI-jobben <c1/></b> kjører de fire testene ovenfor (<c2/>, <c3/>, <c4/>, <c5/>) på <b>ubuntu-latest, macos-latest og windows-latest</b>, så kryssplattform-reproduserbarhet hevdes ved hver push — form- og inndata-goldens nøyaktig, tallene til { "1e-6" }, og SGP4-tilstandene (Simplified General Perturbations { "4" }) til { "2e-5" } km — i stedet for å stole på ett enkelt OS.

seg-2b9915611f03 = Hvis du må lage de fastsatte tallene på nytt (for eksempel etter en tilsiktet modellendring), kjør hvert referansescenario og kopier de utskrevne FoM-verdiene inn i <c1/>, og før deretter endringen inn i <c2/>.

seg-9310a7af7ff8 = Programvarestykkliste (SBOM)

seg-717baa65bbb2 = <c1/> lager en CycloneDX { "1.5" } SBOM som lister hver crate som følger med i en kshana-artefakt, med eksakt versjon, kilde og lisens. Den er en avhengighetsfri generator bygget på <c2/> (så den fungerer med bare verktøykjeden), og den går gjennom løsningsgrafen fra kshana-pakken, bare gjennom vanlige avhengigheter og byggeavhengigheter. Utviklingsavhengigheter (crater bare for test, som <c3/>) er utelatt fordi ingen artefakt inneholder dem.

seg-a7886c557267 = Grafen er unionen av funksjonssettene de utleverte artefaktene bygges med: standardbygget (biblioteket og CLI (kommandolinjegrensesnittet)), <c1/> (PyPI-hjulet (Python Package Index), der <c2/>-kjeden er dets grense mot fremmed kode) og <c3/> (npm-pakken, som har denne samme SBOM-en inne i tarballen sin). Plattformbetingede avhengigheter for hvert mål er med, siden hjulene leveres for flere operativsystemer og npm-pakken retter seg mot WebAssembly. Ett dokument dekker alle tre artefaktene, så for en enkelt av dem er det en overmengde. Den lister for tiden { "107" } komponenter; antallet er fastsatt i <c4/>. Den frittstående serveren <c5/> har sitt eget manifest og er ikke beskrevet av denne SBOM-en.

seg-4c8948e9ee7d = Utdataene er deterministiske — det samme avhengighetssettet gir et byte-identisk dokument, inkludert et serienummer utledet av den sorterte pakkelisten i stedet for et tidsstempel.

seg-60742bbdc583 = Utgivelsesarbeidsflyten lager SBOM-en (<c1/>) og legger den ved hver merkede utgivelse; publiseringsarbeidsflyten leverer den også ved siden av PyPI-hjulene og inne i npm-pakken.

seg-928c3c0108a1 = Byggeopphav

seg-42752467bfaa = Utgivelsesarbeidsflyten lager en SLSA-attestering (Supply-chain Levels for Software Artifacts) av byggeopphavet (<c1/>) som dekker hver fil den legger ved GitHub-utgivelsen: kommandolinjebinærfilene for hver plattform, serverbinærfilen <c2/>, SBOM-en, valideringssammendraget og <c3/>. En bruker kan med <c4/> verifisere at artefaktene ble bygget av dette depotets utgivelsesarbeidsflyt fra denne kilden — noe som tetter gapet mellom «her er en binærfil» og «her er en binærfil jeg kan spore til kilden». For eksempel for SBOM-en til { "v0.28.0" }:

seg-06515d230d33 = <s1>Forrige</s1>Opphav

seg-c6dba4e40c76 = <s1>Neste</s1>Funksjonskart
