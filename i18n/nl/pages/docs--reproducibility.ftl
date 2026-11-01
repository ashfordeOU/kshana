# docs--reproducibility: translations (nl)

seg-03cb5fb3dd8f = Ja

seg-a7d5633dbcc0 = Reproduceerbaarheid en herkomst

seg-ab939e90efad = Bron: <c1/>

seg-1c48a3edda84 = Kshana is gebouwd om reproduceerbaar te zijn: dezelfde invoer levert dezelfde resultaten, en de buildartefacten zijn terug te voeren op de bron die ze heeft voortgebracht. Dit document vermeldt precies wat wordt gegarandeerd, wat niet, en hoe de garanties worden afgedwongen.

seg-95b0eba44abe = Determinismegaranties

seg-1f637144697d = De engine kent geen systeemklok, geen afhankelijkheid van de uitvoeringsthread en geen ongezaaide willekeur. Elk stochastisch proces wordt aangedreven door een <c1/>-stroom die door de <c2/> van het scenario wordt gesleuteld en in vaste volgorde wordt getrokken. Gevolgen:

seg-14df30025491 = Eigenschap

seg-f0badf8cb640 = Gegarandeerd

seg-9f6678ac42f5 = Afgedwongen door

seg-cfc934af2c75 = Hetzelfde scenario, dezelfde machine → byte-identiek <c1/>

seg-917da569fdd7 = <c1/> (voert het referentiescenario tweemaal uit en vergelijkt de SHA-256 (SHA: Secure Hash Algorithm))

seg-27351cbdc2b5 = Hetzelfde scenario → identieke kwaliteitsmaten veld voor veld

seg-bdeaf344acf8 = Ja, per platform

seg-debbc6540baf = <c1/> legt elke kwaliteitsmaat (figure of merit, FoM) voor de vier referentiescenario's vast

seg-f7c5427c88f9 = De hash van de scenarioinvoer (<c1/>) is platformonafhankelijk

seg-2bdf4b2d80be = inhoudsgeadresseerde SHA-256 van het canonieke scenario, vastgelegd in <c1/>

seg-45861afe0994 = Invoervingerafdruk + <b>vorm</b> van de uitvoer identiek over besturingssystemen (OS)

seg-49345663b97c = <c1/> legt per scenario een exacte SHA-256 vast (tien scenario's, elk één <c2/>-bestand in <c3/>), gecontroleerd op de CI-matrix (continuous integration) met 3 OS

seg-e54b5ff80782 = <b>Waarden</b> van de uitvoer komen overeen over OS (ubuntu/macOS/Windows)

seg-271bcbff6287 = Ja, tot { "1e-6" }

seg-3c25e00debff = de CI-job <c1/> voert <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) en <c4/> uit op alle drie de OS

seg-3876618cc821 = Een berichtframe voor navigatie via een lage aardbaan (LEO) bestaat op elk platform en in elk buildprofiel uit dezelfde bytes, de WebAssembly (WASM)-build inbegrepen

seg-8aff3ee31c7e = <c1/> (elke transcendente functie en elke normale afwijking van de soort <c2/> gaat via de pure-Rust-crate <c3/>); <c4/> legt een heel frame vast zonder platformpoort

seg-69750a5db756 = Gezaaide indextrekkingen (bootstrap-herbemonstering, schudden) zijn gelijk op 32-bits- en 64-bitsdoelen

seg-01e0601aa7fc = <c1/> bemonstert altijd als <c2/>; vastgelegd in <c3/>

seg-e42899fd8a4e = Overal dezelfde toolchain

seg-0bdd9769d5fb = <c1/> legt het kanaal vast; <c2/> laat de build mislukken bij afwijking; CI en release leggen dezelfde versie vast

seg-b0a3fd993614 = Dezelfde set afhankelijkheden

seg-5a3daf9f0468 = <c1/> is vastgelegd en <c2/> wordt gebruikt voor de SBOM (software bill of materials)

seg-3ec3fae0dc5e = Elke run vanaf de opdrachtregel schrijft ook een reproduceerbaarheidsverslag in zijn rapport (<c1/> en <c2/>): de engineversie, de SHA-256 van het scenariobestand en van het resultaatdocument, de seed, het platform en de exacte opdracht, die <c3/> opnieuw uitvoert tot een byte-identiek resultaat. Het rapport is zelf een zuivere functie van de run: twee runs van <c4/> schrijven dezelfde <c5/> byte voor byte. Zie <a1>REPORTS.md</a1>.

seg-273a66a3584d = Het voorbehoud over platforms (en hoe goldens ermee omgaan)

seg-9f4ec3dc638d = De numerieke resultaten zijn <b>bitidentiek op een gegeven platform</b> maar kunnen <b>tussen</b> platforms in de laatste paar eenheden van de laatste plaats (ULP) verschillen. De oorzaak is de wiskundebibliotheek van het platform: <c1/>, <c2/>, <c3/> en verwante functies hoeven volgens IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) niet correct afgerond te zijn, zodat Linux (glibc, de GNU C library), macOS en Windows elk een andere laatste bit kunnen teruggeven. Over een lange run lopen deze verschillen van ~{ "1e-16" } op tot misschien ~{ "1e-12" } relatief.

seg-9297c2585419 = Twee dingen maken dat verschil in de laatste plaats groter dan het begint, en beide zijn gemeten en niet aangenomen. Een <b>adaptieve integrator</b> kiest zijn volgende stap uit de foutschatting via een vijfdemachtswortel, zodat één eenheid in de laatste plaats de stapvolgorde verandert en de twee platforms dan alleen nog overeenkomen tot de integratietolerantie. Een <b>iteratieve schatter</b> (een kleinstekwadratenfit, een filter voor baanbepaling) kan een ander pad naar convergentie nemen. Soorten die op een van beide steunen kunnen tussen platforms in afzonderlijke velden met meer dan { "1e-6" } verschillen; <c1/> legt hetzelfde regime voor de unittests vast.

seg-c6bd20427abc = Het <b>buildprofiel</b> speelt op dezelfde manier een rol, op één machine. Een geoptimaliseerde build op macOS voegt een sinus en een cosinus van één argument samen tot één aanroep van de gecombineerde routine van het systeem, waarvan de sinus voor { "379" } van { "200 000" } argumenten in de laatste bit afwijkt van de losse <c1/>; een niet-geoptimaliseerde build doet de twee aanroepen. Gemeten op aarch64 macOS over de { "138" } scenariobestanden geven een debug- en een releasebuild van één bron voor { "102" } byte-identieke resultaatdocumenten. De overige { "36" } verschillen in de laatste plaatsen: { "28" } binnen { "1e-6" }, één (<c2/>) met { "2.8e-6" }, en zeven campagnes alleen in de digests van hun ledenruns; geen enkele verschilt in een label, een aantal of een verdict. De garantie van byte-identiteit hierboven geldt dus voor één build: dezelfde binary tweemaal.

seg-ff368c627bd2 = De gezaaide <b>normale trekkingen</b> vormen een derde, veel zeldzamere bron: de sampler roept in zijn zeldzame takken de exponentiële en logaritmische functie van de host aan, en ongeveer één trekking op een miljoen verschilt in de laatste bit tussen de native build en de WASM-build.

seg-0b7ebca1a5e3 = Waar een uitvoer <b>discreet</b> is, is een verschil in de laatste plaats helemaal niet acceptabel, en wordt de soort berekend met <c1/> in plaats van met de hostbibliotheek. De soort <c2/> is de eerste: haar binaire frame bestaat uit verzonden gehele getallen, en hetzelfde scenario werd eens gecodeerd tot drie verschillende frames: in een releasebuild, in een debugbuild van dezelfde bron, en in de browser. Het zijn nu in alle drie dezelfde bytes.

seg-1746a0ea22fe = Daarom leggen de golden tests <b>niet</b> één platformoverschrijdende hash van de uitvoer met drijvende komma vast — dat zou fragiel zijn en zou eerlijk correcte builds op een ander OS laten mislukken. In plaats daarvan:

seg-9733b0545768 = <b><c1/></b> legt elke kwaliteitsmaat vast met een relatieve tolerantie van <c2/> — vier ordes van grootte strakker dan elke echte regressie (die een waarde met hele procenten verschuift) maar veel ruimer dan de jitter van de wiskundebibliotheek (libm) tussen platforms. Velden begrensd door het raster (holdover-seconden) en velden die exact nul zijn, worden exact vastgelegd.

seg-a3dfe1c26401 = <b><c1/></b> — een inhoudshash van de <em>invoer</em> — is platformonafhankelijk en wordt exact vastgelegd.

seg-571aea9b8115 = <b><c1/></b> legt een exacte SHA-256 vast, per scenario vastgelegd in <c2/>, over de projectie die <em>wél</em> identiek is over platforms: de invoervingerafdruk plus de <b>vorm</b> van de uitvoer (veldnamen, nesting, bladtypen, arraylengten — vastgelegd door deterministische rasterrekenkunde, nooit de waarden met drijvende komma). Dit vangt structurele regressies exact op, terwijl de toleranties hierboven waardenregressies opvangen.

seg-8543165b0d7d = <b><c1/></b> dwingt byte-identieke uitvoer af over twee runs <em>op dezelfde machine</em> (de determinismegarantie).

seg-8b8b4ba5de30 = <b>De CI-job <c1/></b> voert de vier tests hierboven uit (<c2/>, <c3/>, <c4/>, <c5/>) op <b>ubuntu-latest, macos-latest en windows-latest</b>, zodat platformoverschrijdende reproduceerbaarheid bij elke push wordt vastgesteld — de vorm-/invoergoldens exact, de numerieke waarden tot { "1e-6" }, en de SGP4-toestanden (Simplified General Perturbations { "4" }) tot { "2e-5" } km — in plaats van op één enkel OS te vertrouwen.

seg-2b9915611f03 = Als u de vastgelegde getallen opnieuw moet genereren (bijvoorbeeld na een opzettelijke modelwijziging), voer dan elk referentiescenario uit en kopieer de afgedrukte FoM-waarden naar <c1/>, en noteer de wijziging in <c2/>.

seg-9310a7af7ff8 = Software bill of materials (SBOM)

seg-717baa65bbb2 = <c1/> genereert een CycloneDX { "1.5" }-SBOM met elke crate die in een kshana-artefact wordt meegeleverd, met haar exacte versie, bron en licentie. Het is een generator zonder afhankelijkheden, gebouwd op <c2/> (zodat hij met alleen de toolchain werkt), en hij doorloopt de resolutiegraaf vanaf het kshana-pakket via alleen normale afhankelijkheden en build-afhankelijkheden. Dev-afhankelijkheden (crates alleen voor tests, zoals <c3/>) zijn uitgesloten omdat geen enkel artefact ze bevat.

seg-a7886c557267 = De graaf is de vereniging van de featuresets waarmee de meegeleverde artefacten worden gebouwd: de standaardbuild (bibliotheek en opdrachtregelinterface (CLI)), <c1/> (het PyPI-wheel (Python Package Index), waarvan de keten <c2/> zijn foreign-function-grens is) en <c3/> (het npm-pakket, dat dezelfde SBOM in zijn tarball meedraagt). Platformvoorwaardelijke afhankelijkheden voor elk doel zijn inbegrepen, omdat de wheels voor meerdere besturingssystemen worden geleverd en het npm-pakket op WebAssembly mikt. Eén document dekt alle drie de artefacten, dus voor elk afzonderlijk is het een superset. Het vermeldt momenteel { "107" } componenten; het aantal is vastgelegd in <c4/>. De losstaande server <c5/> heeft zijn eigen manifest en wordt door deze SBOM niet beschreven.

seg-4c8948e9ee7d = De uitvoer is deterministisch — dezelfde set afhankelijkheden levert een byte-identiek document op, met een serienummer dat is afgeleid van de gesorteerde pakketlijst in plaats van van een tijdstempel.

seg-60742bbdc583 = De releaseworkflow genereert de SBOM (<c1/>) en voegt die toe aan elke getagde release; de publicatieworkflow levert hem ook mee naast de PyPI-wheels en in het npm-pakket.

seg-928c3c0108a1 = Herkomst van de build

seg-42752467bfaa = De releaseworkflow produceert een SLSA (Supply-chain Levels for Software Artifacts)-attestatie van de buildherkomst (<c1/>) die elk bestand dekt dat hij aan de GitHub Release toevoegt: de opdrachtregelbinaries voor elk platform, de serverbinary <c2/>, de SBOM, de validatiesamenvatting en <c3/>. Een gebruiker kan met <c4/> verifiëren dat de artefacten zijn gebouwd door de releaseworkflow van deze repository uit deze bron — waarmee de kloof wordt gedicht tussen "hier is een binary" en "hier is een binary die ik naar zijn bron kan herleiden". Bijvoorbeeld voor de SBOM van { "v0.28.0" }:

seg-06515d230d33 = <s1>Vorige</s1>Herkomst

seg-c6dba4e40c76 = <s1>Volgende</s1>Capabilitykaart
