# docs--validation: translations (cs)

seg-70860389903a = Hodiny

seg-583dc9ff6178 = Knihovna

seg-d01db1c2710a = Reference

seg-2db69c58f694 = Měsíční diferenční PNT

seg-2eb6d1b0483d = RAIM / ARAIM

seg-da3532b1444d = SBAS / DO-229E

seg-d3af26f389f5 = IONEX / Klobuchar

seg-d6476863f862 = Schopnost

seg-ad856ad710eb = Stav

seg-4bcec6e2dd9f = Objem služby lunární navigace

seg-c04a3591074c = Export pro lunární interoperabilitu

seg-20fee61b3107 = Knihovna chybových modelů kvantových zařízení

seg-eaf341ff4522 = Kvantová navigace bez GNSS

seg-75636f9419b2 = Známá omezení

seg-5ed34a5b402e = Lunární společné vícetechnikové určování oběžné dráhy a hodin

seg-619f89bf160c = Realizace lunární referenční soustavy

seg-d12d4565b01d = Lunární geodetická VLBI, cesta jádra

seg-b03d56f501c3 = Druh

seg-9c0eb89a2fbe = Balíček

seg-f63dd3d7aad4 = Zdroj

seg-638b8d451550 = Senzor

seg-04f69a0edb2f = typ

seg-35bf9a48e566 = Veličina

seg-f3526b0d95f8 = Změřeno

seg-7634c6f4b32c = Spoj

seg-b966dd26caa6 = Datová sada

seg-4fe4920a3fa1 = Norma

seg-84430d202cd4 = Zdroj: <c1/>

seg-028f26d1374e = <b>K tolerancím.</b> „Ověřeno“ níže znamená, že kalibrační test potvrzuje, že simulovaná statistika odpovídá referenčnímu vztahu v rámci <b>vynucené brány (gate)</b>, v současnosti <b>relativní chyby { "20" }–{ "25" } %</b> (průměrované přes seedy) pro vztahy Allanovy odchylky a rozpočtu šumu. Medián pozorované shody je často mnohem těsnější (několik procent), ale <em>zaručenou</em> mezí je brána, nikoli medián. Kde se objeví číslo jako „~{ "2" } %“, jde o typické pozorování, nikoli o vynucenou toleranci. Viz <a1>Tvrzení versus realita</a1>.

seg-94a480ed9ccb = Pravidlo povýšení

seg-a550784412a6 = Řádek strojově kontrolované verifikační matice (<c1/>) je VALIDATED pouze tehdy, když orákulum <b>nezávislé na Kshana</b> souhlasí s implementací <b>v rámci tolerance stanovené před spuštěním porovnání</b>, v testu, který běží v bráně. Tato část je jediným místem, kde je pravidlo zapsáno; matice, text u jednotlivých řádků i poznámky k vydání se na ni odvolávají.

seg-5e14faed9f05 = Přijímané druhy orákul

seg-4297b6a1b385 = Co se počítá

seg-a42c0c36b37f = Příklady, které již jsou v matici

seg-e39aeb132e03 = Skutečná naměřená data veličiny, kterou řádek tvrdí: pozorování fyzického světa, nikoli výstup modelu.

seg-e77977db9de1 = Zadržené dvě třetiny skutečného záznamu cesiových hodin; archivované normální body laserového měření vzdálenosti k Měsíci; řada UTC(k) Circular T z BIPM (Mezinárodní úřad pro míry a váhy); dlaždice terénu SRTM (Shuttle Radar Topography Mission).

seg-6325fe1fafaf = Nezávislá knihovna nebo nástroj třetí strany, který počítá <b>jednoznačně definovanou</b> veličinu na stejných vstupech, kde knihovna sama implementuje výpočet z dané oblasti. Shoda knihovny s knihovnou je skutečnou kontrolou jen proto, že veličina má jednu správnou odpověď.

seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, statistická rozdělení SciPy.

seg-056adffae706 = Publikované referenční vektory, tabulky nebo ověřovací příklady: čísla, která norma, agentura nebo referenční text uvádí, aby bylo možné implementace proti nim kontrolovat.

seg-991fb822e99c = Vektory SOFA/ERFA (Standards of Fundamental Astronomy), ověřovací vektory SGP4 od AIAA (Americký institut pro letectví a kosmonautiku), ověřovací příklady ITU-R (Mezinárodní telekomunikační unie, sektor radiokomunikací), pracovní příklad ARAIM z Pracovní skupiny C, JPL (Jet Propulsion Laboratory) Horizons.

seg-2a774e48055a = Dvě další pravidla rozhodují hraniční případy. Obě jsou přijata pro vydání { "0.30" }.

seg-f5c6cf536ba1 = <b>P1, publikovaná pracovní hodnota.</b> Publikovaná pracovní hodnota vypočtená ze stejného uzavřeného vztahu, který řádek implementuje, se počítá jako publikovaný referenční vektor, pokud je publikace nezávislá na Kshana a porovnání zafixuje stanovenou toleranci. Hodnota musí být v publikaci vytištěna jako číslo (hodnota odečtená z grafu se počítá, jen pokud je nejistota odečtu uvnitř stanovené tolerance) a test musí přimět Kshana, aby ji vypočetla ze vstupů publikace; porovnání konstanty s dokumentem, z něhož byla zkopírována, je kontrola přepisu, nikoli P1.

seg-0b043b552e76 = <b>P2, nezávislá numerická knihovna.</b> Nezávislá numerická knihovna, například numpy nebo LAPACK (Linear Algebra PACKage), která přepočítá jednoznačně definovanou veličinu lineární algebry na stanovených vstupech, se počítá jako nezávislá knihovna. Knihovna musí provést rozklad, inverzi, řešení nebo krok nejmenších čtverců vlastním algoritmem, na vstupech uložených spolu s fixturou; ověřeným tvrzením je pak lineární algebra na těchto vstupech, nikoli fyzikální velikosti reprezentativního scénáře. Skript, který znovu vyhodnotí skalární uzavřený vztah aritmetikou numpy, je druhou implementací našeho vlastního kódu, nikoli P2.

seg-b7911d589f7a = Podmínky platné pro každý druh: orákulum nepíše, nespouští ani nepublikuje tento projekt (vlastní řada článků tohoto repozitáře proto na něm není nezávislá); tolerance je v testu a byla stanovena před prvním porovnáním; test podmíněný daty, který se přeskočí, když chybí jeho veřejná data, to při přeskočení oznámí.

seg-7e6057a2cad7 = Co se nepočítá

seg-80cfbb204767 = <b>Naše vlastní druhá implementace</b>: druhá cesta kódu v tomto crate (<c1/>) nebo skript v tomto repozitáři, který znovu vyhodnocuje stejný uzavřený vztah.

seg-d6efaf8399f9 = <b>Shoda s naším vlastním dřívějším výstupem</b>: goldeny, regresní zámky, snímky nebo tabulka z vlastních článků tohoto projektu.

seg-4d0365b383e5 = <b>Přepis konstant z citace</b>: kontrola koeficientu, předvolby, údaje z datasheetu nebo listu parametrů proti dokumentu, z něhož byl zkopírován.

seg-3bf8025077fb = <b>Návrhová volba</b>: alokace, váhování, práh, mez poplachu nebo reprezentativní scénář. Pro volbu neexistuje žádná vnější pravda.

seg-4f0aafd7166e = <b>Vnitřní identita</b>: číselný integrál proti vlastnímu analytickému tvaru, zpáteční převod, inverze, test vlastnosti nebo monotónnosti.

seg-4f4408e4ebab = <b>Integrační běh proti skutečnému hostiteli</b> (<c1/>): načtení pluginu do skutečného serveru Signal K nebo OpenCPN, nebo předání výstupu skutečné brány konzumentovi TCP a kontrola, že hostitel vstup přijme a ukáže očekávaný stav. Ukazuje, že instalace funguje. Hostitel není orákulem pro žádnou hodnotu, kterou integrace nese, takže není s čím externě porovnávat a takový řádek (řádek námořních integrací) je MODELLED, nikoli VALIDATED. <c2/> je samostatný druh orákula, povolený pouze u řádků MODELLED: <c3/> v <c4/> selže, pokud jej nese řádek VALIDATED, a <c5/> již vyžaduje, aby každý řádek VALIDATED byl <c6/>.

seg-a39a87c56a16 = <b>Věrohodnost na skutečných vstupech</b>: skutečná data použitá pouze jako vstup, s tvrzeními o řádové velikosti místo porovnání s vnější hodnotou.

seg-db6f5d98b4ef = Tolerance zvolená po zhlédnutí porovnání.

seg-f4f18b7549df = Jak se pravidlo vynucuje

seg-19a62c7e0aee = Každý řádek VALIDATED deklaruje v <c1/> v <c2/>, o jaký druh se opírá (Measured, Library, Reference, P1 nebo P2), nezávislý zdroj (citovaný z vlastního textu orákula řádku) a jediný test, který nese porovnání. Jednotkové testy vedle tabulky selžou, když řádek VALIDATED není deklarován nebo je deklarován dvakrát, když deklarace jmenuje řádek, který není VALIDATED, když deklarovaný zdroj není tím, který jmenuje text orákula řádku, nebo je jím sám Kshana, když deklarovaný test není tím, který řádek cituje, nebo když řádek P2 nejmenuje žádnou nezávislou numerickou knihovnu. <c3/> pak vyžaduje, aby deklarovaný test existoval na disku jako skutečný <c4/>, který není ignorován. Co stroj zkontrolovat nemůže, je, zda pojmenovaný test porovnává proti deklarovanému zdroji; to zůstává lidskému čtení. Počty podle druhů se zde nepíší: zdrojem je tabulka.

seg-e8ae3e380f40 = Stávající řádky VALIDATED znovu přezkoumané podle pravidla

seg-1dd44545a67a = Pravidlo bylo použito na stávající řádky stejně jako na budoucí povýšení.

seg-38db7b6e7053 = <b>Řádky P1 jmenované validační studií { "0.30" }, každý podložený:</b> Rozpočet jednosměrného spoje (návrhová tabulka řízení Galileo X-band JPL Pub 82-76, znovu sestavená z dílčích položek na { "4.6e-3" } dB ztráty ve volném prostoru); Uzavřené vztahy omezené pásmem pro libovolný určovací signál ({ "90.3" } procenta výkonu hlavního laloku a publikovaný koherentní jitter early-late); Maximální Doppler navigační družice na nízké oběžné dráze Země (publikované údaje Xona Pulsar X1 a Iridium); Maximální Doppler, který vidí statický uživatel z oběžné dráhy LEO nebo MEO (Tabulka { "1" } v článku o Pulsaru, { "20" } hodnot); Doppler, se kterým se musí vyrovnat pozemní přijímač od navigační družice LEO (stejné publikované údaje z letově ověřené dráhy). Každá publikace je nezávislá na Kshana, uvádí svá čísla a test stanoví svou toleranci.

seg-8e38103d05d6 = <b>Další řádky opírající se o P1, nalezené při přezkoumání, každý podložený:</b> Kompromis návrhu určovacího kódu (publikovaná zlatá křížová korelace −{ "23.9" } dB); Měsíční souřadnicový čas (Ashby a Patla { "2024" }, jejichž křížová kontrola rychlosti Měsíce proti DE440 je kontrolou Library); Uzavřené vztahy spektrální hustoty výkonu signálu v pásmu L (hodnoty Q podle Kaplana a Hegartyho); Ionosférické zpoždění prvního řádu pro každé pásmo (poměr skupinového zpoždění IS-GPS-200); Globálně průměrné váhy chyby signálu v prostoru (tabulka Montenbruck, Steigenberger a Hauschild { "2018" }).

seg-0014c53752ac = <b>Řádky P2 jmenované studií, každý podložený:</b> Fisherova informace a pozorovatelnost Cramér–Rao (numpy <c1/>/<c2/>); Identifikovatelnost měsíčního data; Spřažený měsíční rámec a měřítko časové stupnice; Autonomní potrubí pozorovatelnosti poruch ve volné síti (numpy/SciPy SVD, rozklad na singulární hodnoty). Každý přepočítá jednoznačně definovanou veličinu lineární algebry na uložených vstupech jiným algoritmem než Jacobiho řešič vlastních čísel v Kshana.

seg-e9d01633d002 = <b>Další řádky opírající se o P2, nalezené při přezkoumání, každý podložený:</b> Odvození priorit MCDA (vícekriteriální rozhodovací analýza) (vlastní vektor AHP, analytický hierarchický proces, pomocí SciPy/LAPACK; tabulka Random Index, kterou rovněž reprodukuje, je přepis a nepočítá se); Rozptyl setrvání hodin (SciPy <c1/> rozšířené matice Van Loan); Realizace měsíční referenční soustavy (řešení Umeyama pomocí numpy SVD); Beamforming CRPA (anténa s řízeným příjmovým diagramem) (komplexní řešení LAPACK); Jádro ochranných úrovní ARAIM pro Měsíc (inverze LU z RTKLIB s kvantily SciPy); Konzistence měsíčních rámců/dynamiky napříč poskytovateli (aproximace nejmenších čtverců pomocí numpy SVD tří publikovaných efemerid).

seg-1fd94e94e89d = <b>Označeno v prvním průchodu, znovu podloženo ve kole { "2" } běhu { "0.30" }.</b> Tři řádky byly označeny jako nepodložené napsaným pravidlem. Každý se nyní opírá o porovnání předregistrované před stažením jeho fixtury, takže žádný řádek není označen; jednotkový test vedle <c1/> zafixuje (nyní prázdný) seznam.

seg-3ef9479dea55 = <b>Integrita (RAIM/ARAIM/SBAS).</b> Citované testy dříve tvrdily pouze věrohodnost na skutečné geometrii IGS (Mezinárodní služba GNSS). Řádek se nyní opírá o tři knihovní orákula: separaci řešení více hypotéz ARAIM z Airborne Design Document v4.2 proti Stanford MAAST pro ARAIM { "2" } ({ "270" } skutečných případů, nejhorší rozdíl VPL { "2.2e-3" } m proti { "0.05" } m); detekci a vyloučení snapshotového RAIM proti RTKLIB <c1/> ({ "2016" } z { "2016" } rozhodnutí shodných) s ochrannou úrovní sklonu; a ochranné úrovně SBAS DO-229E L1 proti Stanford MAAST na skutečných vysíláních WAAS ({ "2868" } dvojic v rámci { "1.6e-5" } m). Řádek výslovně uvádí, že funkce s jednotnou sigmou <c2/> a <c3/> nejsou v souladu s ADD a že porovnání dvoufrekvenčního SBAS L5 je zjištění.

seg-16a4261c77ec = <b>Polohy planet napříč sluneční soustavou z keplerovských elementů JPL Standish.</b> Dodatečný práh dvojnásobku nominální chyby je nahrazen předregistrovaným prahem: RMS nejvýše hodnota z tabulky { "8.10.1" } Explanatory Supplement na planetu a složku, proti JPL Horizons DE441, s rozdělením Země a pokrytím rotace ICRF.

seg-8d5b51a942e0 = <b>Světelný čas mezi tělesy sluneční soustavy.</b> Řešič světelného času se nyní porovnává se světelnými časy Horizons v rámci { "1e-6" } s na polohách DE441, předregistrovaný práh, který nedědí práh pro polohy.

seg-e96900bc322f = <b>Řádky MODELLED, které dvě pravidla činí povýšitelnými</b> (pouze prostřednictvím běhu { "0.30" } po jednotlivých řádcích, nikdy tímto textem): podle P1 mez geolokace zdroje pomocí TDOA/FDOA (rozdíl času a frekvence příchodu), vazba relativistické rychlosti hodin na rámec, synchronizační masky ITU-T (sektor telekomunikační standardizace) (pouze pro hodnoty masek, které doporučení uvádějí jako čísla; přepsané zlomové body kontrolované samy proti sobě se nepočítají) a mez určování polohy v nepozemních sítích 5G (pouze pokud se najde publikovaná pracovní hodnota); podle P2 slepota integrity v souhlasném režimu, skalární ochranná úroveň časování MHSS (separace řešení více hypotéz) a bělení GLS (zobecněné nejmenší čtverce). Dva řádky benchmarku integrity časování (klasifikátor Stanfordova diagramu integrity a hodnotitel pokrytí integrity) jsou klasifikace založená na pravidlech, nikoli lineární algebra, takže P2 se jich netýká; potřebují nezávislý nástroj a jediný nalezený (gLAB) nese nekomerční licenci.

seg-50a08fe5918b = <b>Soulad s dřívějšími odmítnutími.</b> Kontrola Vallado u řádku okna startu by nyní podle P1 vyhověla, pokud její test počítá vytištěný pracovní příklad; plán { "0.30" } ji místo toho povyšuje přes Orekit. Tabulka průsečíků měsíčního času podle třídy hodin zůstává MODELLED: tabulka, kterou reprodukuje, pochází z vlastního článku tohoto projektu, který není nezávislý.

seg-02423542480f = Šumový člen

seg-2bd49b92f14b = Shoda odhadů Allanovy odchylky (ADEV/MDEV/TDEV/OHDEV (ADEV: Allanova odchylka; MDEV: modifikovaná Allanova odchylka; OHDEV: překrývající se Hadamardova odchylka))

seg-c429a25d17ae = Dvě kontroly proti primárnímu zdroji <b>NIST (Národní institut standardů a technologie) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), obě s relativní tolerancí <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: překrývající se ADEV, modifikovaná ADEV, časová odchylka a překrývající se Hadamardovy odhady reprodukují odchylky pro kanonický 10bodový datový soubor <b>NBS14</b> (<b>SP { "1065" } tabulka 29/30, s. { "107" }</b>) při tau = { "1" }, { "2" } — shoda je ve skutečnosti ~{ "1e-6" } (např. překrývající se ADEV (OADEV) při τ = { "2" }: { "85.952868" } vs { "85.95287" }). ({ "2" }) <c2/>: stejné čtyři odhady reprodukují <b>1000bodový datový soubor z SP { "1065" } §{ "12.4" }</b> (<b>tabulka { "31" }, s. { "108" }</b>) při průměrovacích faktorech { "1" } / { "10" } / { "100" }, kde je datový soubor v kódu znovu vygenerován z LCG podle SP { "1065" } (rov. { "73" }) — hermeticky, bez fixtury. Stejná data a čísla z tabulky 31 jsou regresním cílem v aewallin/allantools (<c3/>), zde reprodukovaným bez kódu třetích stran. Tím se zafixuje <em>matematika odhadů</em> proti referenci, odlišně od řádků <em>kalibrace</em> šumu níže.

seg-79e6f7d1e7f0 = Shoda odhadů Allanovy odchylky na <b>skutečném naměřeném hardwaru</b>

seg-8c72a9df2547 = <c1/>: překrývající se Allanův a překrývající se Hadamardův odhad reprodukují referenční odchylky <b>Stable32</b> pro <b>skutečný cesiový primární normál 5071A měřený proti vodíkovému maseru</b> ({ "556 990" } fázových vzorků při τ₀ = { "1" } s; { "1" } PPS (impuls za sekundu) do čítače 53230A, únor { "2014" }; sbíral A. Wallin, distribuováno s <c2/>). Zkontrolováno napříč <b>celým dekadickým žebříčkem τ ({ "16" } průměrovacích faktorů, τ = { "1" } s … { "4" }×10⁴ s)</b>: dobře vzorkované faktory s relativní bránou <b>{ "1e-3" }</b> (pozorovaná shoda je ve skutečnosti ≤ { "3e-5" }, např. OADEV({ "1" } s) { "3.317111e-10" } vs Stable32 { "3.3171e-10" }), řídké faktory při dlouhém τ musí ležet uvnitř vytištěného pásma spolehlivosti { "1" }‑σ ze Stable32. Toto doplňuje syntetickou shodu NBS14 výše o kontrolu na naměřených hodinách. Surový fázový soubor jsou data třetí strany bez licence k redistribuci, proto je ignorován gitem; <c3/> jej reprodukuje a test vypíše oznámení o přeskočení (CI (kontinuální integrace) zůstává zelená), když chybí. Uloženy jsou pouze veřejná referenční čísla Stable32 (<c4/>); nepoužívá se žádný kód třetích stran.

seg-1a7f0e741913 = Shoda odhadů Allanovy odchylky na <b>kanonickém Stable32 PHASE.DAT</b>

seg-00e382874a00 = <c1/>: překrývající se Allanův, modifikovaný Allanův a časový odhad reprodukují referenční odchylky <b>Stable32</b> pro <b>PHASE.DAT</b> — 1001bodovou řadu distribuovanou se Stable32, kterou nezávislé nástroje (např. <c2/>) používají jako svůj standardní regresní cíl — napříč <b>celým žebříčkem průměrovacích faktorů ({ "139" } faktorů)</b> s relativní bránou <b>{ "1e-3" }</b> (pozorováno ≤ { "5e-5" }). Druhá, nezávislá skutečná referenční řada vedle kontroly naměřeného cesia výše. PHASE.DAT se dodává s komerčním nástrojem Stable32, proto je surová řada ignorována gitem; <c3/> ji reprodukuje a test se přeskočí zeleně (CI zůstává zelená), když chybí. Uloženy jsou pouze veřejná referenční čísla Stable32 (<c4/>); nepoužívá se žádný kód třetích stran.

seg-9dde9e0c8055 = Stabilita optických hodin na <b>skutečné naměřené křivce</b>

seg-ea908ba3a79f = <c1/>: inverze parametrů šumu hodin (<c2/>) reprodukuje <b>publikovanou σ_y(τ) optických mřížkových hodin ⁸⁸Sr od Norcia a kol., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), křivka uložena v <c3/>): získaný koeficient bílého frekvenčního šumu √q_wf ≈ { "4.33e-16" } odpovídá krátkodobé stabilitě ≈4.7e-16/√τ z článku (~{ "10" } % RMS (střední kvadratická hodnota) přes křivku) a fit zjistí nenulovou naměřenou podlahu (q_rw > { "0" }). Tím se zafixuje <b>inverze naměřené ADEV → parametry šumu proti skutečným optickým hodinám</b>; přínos holdoveru k prahu, který je na ní postaven, zůstává MODELLED.

seg-e1e930dcd0a1 = ROC (provozní charakteristika přijímače) AUC (plocha pod křivkou) detekce anomálií na <b>skutečné telemetrii ESA (Evropská kosmická agentura) OPS-SAT</b>

seg-2b637daa985c = <c1/> (reprodukuje štítky)

seg-c667434b580d = <c1/>: na datové sadě <b>OPSSAT-AD</b> (Ruszczak a kol. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — skutečné segmenty housekeepingu OPS-SAT s pravdivými štítky anomálií — Mann–Whitneyho ROC AUC z Kshana (<c2/>) reprodukuje <b>scikit-learn <c3/></b> s přesností <b>< { "1e-9" }</b> na zadržené testovací části ({ "529" } segmentů, { "113" } anomálií), pro dvě deterministická skóre: transparentní detektor s jedním příznakem (počet vrcholů segmentu, <b>AUC ≈ { "0.851" }</b>) a skóre diagonální Mahalanobisovy vzdálenosti s 8 příznaky natrénované na normálních trénovacích segmentech (AUC ≈ { "0.556" }); <c4/> obklopuje bodový odhad intervalem, jehož dolní mez překračuje náhodu. Tím se ověřuje <b>výpočet AUC na skutečných datech ESA</b> a <b>označená separace</b> transparentního detektoru — <b>nereprodukuje</b> to nejlepší publikovanou metriku z článku OPSSAT-AD (supervizovaná FCNN (plně propojená neuronová síť), F1 ≈ { "0.95" }), která potřebuje jejich natrénovaný model. Data CC-BY uložena (<c5/>, hermeticky); orákulum znovu generuje <c6/>.

seg-5f2d41617fb2 = Syntéza funkcionálů gravitačního pole (gravitačně podporovaná / bez GNSS (GNSS: globální družicový navigační systém) navigační mapa)

seg-4c1126137428 = <c1/>: jádro funkcionálu gravitace ve sférických harmonických (<c2/> / <c3/>) — „čtečka mapy“, proti které se gravitačně podporovaný navigátor porovnává — je ověřeno proti <b>normálnímu tíhovému standardu GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, přijatému IAG (IAG: Mezinárodní asociace geodézie)). Sestavení normálního pole GRS80 z jeho publikovaných sudých zonálních harmonických J₂…J₈ a syntéza tíže (gravitace + odstředivá) na elipsoidu reprodukuje uzavřenou <b>Somiglianovu</b> normální tíži a publikované rovníkové/polární hodnoty γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s² s relativní přesností <b>{ "3.5e-12" }</b> napříč všemi šířkami (brána { "1e-9" }). Stejné jádro načítá vlajkový <b>skutečný model Země z ICGEM (Mezinárodní centrum pro globální modely Země) EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA (Národní geoprostorová zpravodajská agentura) volné dílo přes ICGEM; čtečka <c4/> je také vyzkoušena na měsíčním poli GRAIL (Gravity Recovery and Interior Laboratory) v <c5/>) a vytváří fyzikálně omezenou mapu tíhové poruchy (RMS ≈ { "26" } mGal, max ≈ { "89" } mGal při d/o { "70" }). Ověřuje <b>správnost kódu syntézy</b>; <em>přesnost navigačního řešení</em> podporovaného gravitací zůstává MODELLED (neexistuje veřejná trajektorie s gravimetrem na platformě a s pravdivými daty).

seg-7dc3ff4c6eea = Edf specifické pro typ šumu (intervaly spolehlivosti)

seg-7e8a93fb2eea = <c1/>: pásmo χ² spolehlivosti u každého bodu překrývající se ADEV používá efektivní stupně volnosti specifické pro typ šumu (uzavřené vztahy z tabulky { "5" } NIST SP { "1065" } pro bílou a flicker fázovou modulaci, bílou a flicker frekvenční modulaci a náhodnou procházku frekvenční modulace (WPM/FPM/WFM/FFM/RWFM) — jednoduchá sada Stable32), přičemž typ mocninného zákona záznamu je určen ze sklonu jeho MDEV v log-log. Tři nezávislé kontroly: (a) pět vzorců reprodukuje ručně vyhodnocené hodnoty při N={ "64" },m={ "4" } na { "1e-12" }; (b) <b>soubor Monte Carlo s bílou FM (FM: frekvenční modulace)</b> ({ "4 000" } záznamů) měří skutečné edf chí-kvadrát odhadu = { "2" }·průměr²/Var(σ²) a shoduje se se vzorcem v rámci { "20" } % (a podstatně překonává konzervativní počet bez překryvu); (c) <c2/> reprodukuje vytištěné edf z <b>SP { "1065" } tabulky { "32" } (s. { "109" })</b> = { "146.177" } pro 1000bodový datový soubor při m={ "10" } (bílá FM) na { "5e-3" } a { "95" }% meze spolehlivosti z tabulky ({ "8.223942e-2" } / { "1.035201e-1" }) na <{ "0.2" } % (malá zbytková odchylka je aproximace Wilson-Hilferty pro χ² oproti přesnému χ² z NIST). Exportovaná křivka ADEV nese pro každé τ určený typ šumu, edf a { "95" }% pásmo.

seg-7048ac695b99 = Bílá FM (krátkodobá)

seg-b6982cb2ca25 = <c1/>: simulovaná překrývající se ADEV reprodukuje publikovanou sigma_y({ "1" } s) — typicky v rámci několika procent, <b>vynucená brána { "20" } %</b> (CSAC a cíl optických mřížkových hodin) — a křivku bílé FM sigma_y(tau)=sigma_y(1s)/sqrt(tau) napříč tau = { "1" }, { "10" }, { "100" } s v rámci <b>brány { "25" } %</b> (odpovídá datasheetu CSAC (čipové atomové hodiny) { "3e-10" } / { "1e-10" } / { "3e-11" }).

seg-11fc7c4b61ff = Náhodná procházka FM (dlouhodobá)

seg-1e211f342e79 = <c1/>: simulovaná ADEV odpovídá sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) s přesností ~{ "20" } % (průměrováno přes seedy).

seg-dcfca4041429 = Stárnutí / lineární drift

seg-2d5c6a44cbdb = <c1/> + vykalibrováno

seg-492f91ba2f79 = Deterministické; odhadovač holdoveru odstraňuje offset a stárnutí kvadratickým prediktorem, takže zbytek je stochastická mez. Testováno v <c1/> / <c2/>.

seg-2ea6a14cac1c = Kalmanův odhadovač + mez integrity

seg-8c8f8a5eba5a = <c1/>: dvoustavový (fáze, frekvence) filtr, jehož přesný procesní šum podle van Loana odpovídá pravdivému modelu; setrvání reprodukuje analytický rozptyl holdoveru <c2/> na { "1e-9" }. Aktualizace kovariance je v <b>Josephově stabilizovaném tvaru</b> <c3/>, který zůstává pozitivně semidefinitní (ověřeno Choleského rozkladem) po { "500" } krocích predikce/aktualizace při extrémním poměru <c4/> a shoduje se s naivním tvarem na { "1e-9" } tam, kde je ten dobře podmíněný. Vrstva běhu hlásí integritu jako podíl vzorků výpadku uvnitř ochranné meze 3 sigma (<c5/>).

seg-f332f06e80f9 = Vnitřní konzistence filtru (NIS (normalizovaný čtverec inovace) / NEES (normalizovaný čtverec chyby odhadu))

seg-333e1701b6d0 = <c1/> (model)

seg-c1304de95180 = <c1/>: hodnocení konzistence metodou Monte Carlo (Bar-Shalom §{ "5.4" }). Sdružené <b>NIS → { "1" }</b> a <b>NEES → { "2" }</b> shodného filtru leží uvnitř svých { "95" }% pásem χ² (pásmo NIS používá sdružený počet bílých inovací; pásmo NEES používá počet nezávislých běhů, protože chyby odhadu jsou v čase korelované). Test <b>proměření nesouladu Q/R</b> ověřuje, že monitor hlásí <c2/> pouze při jednotkovém naladění a <c3/> při rozladění ×0.1/×0.5/×2/×{ "10" }, přičemž NIS se mění jako ≈1/q_factor, jak bylo odvozeno. Zobrazeno jako <c4/> ve výsledku hodin v JSON (JavaScript Object Notation) a na kartě playgroundu. Pásma χ² používají kvantil Wilson–Hilferty (<c5/>, ověřeno proti tabulce).

seg-078c4009b24f = Model obousměrného přenosu času

seg-22f8cdeda335 = <c1/>: vzájemné souhlasné zpoždění se v odhadu <c2/> přesně vyruší (odvozeno ručně, přesně) a dvě jednosměrná měření se průměrují na <c3/> (průměrováno přes seedy); nevzájemné diferenční zpoždění je barevný proces bílé FM + náhodné procházky FM, jehož Allanova odchylka sleduje <c4/> (průměrováno přes seedy, ~{ "20" } %, prostřednictvím vlastního <c5/> spoje). <em>Parametry</em> (<c6/>, <c7/> pro každý spoj) jsou reprezentativní údaje TWSTFT/optického přenosu (TWSTFT: obousměrný družicový přenos času a frekvence), nikoli přizpůsobené konkrétnímu terminálu.

seg-6ab219622143 = Bezpečnost (skóre detekce spoofingu)

seg-29dd10011ed1 = <c1/>: 1-sigma práh monitoru <c2/> a z něj vyplývající minimálně detekovatelný offset <c3/>-sigma a skóre <c4/> jsou odvozeny ručně a testovány jednotkovými testy. Model (detekce podporovaná hodinami ve stylu inovace / RAIM (RAIM: autonomní monitorování integrity přijímačem)) je věcně správný; <em>parametry</em> (okno monitorování <c5/>, detekční násobitel <c6/>, šum měření <c7/>) jsou reprezentativní, nikoli přizpůsobené konkrétnímu přijímači.

seg-ca51e4f1e19c = Detekce útoku spoofingem

seg-e991f5b2fdb2 = <c1/>: narůstající spoofing falešného času je označen, když jeho offset překročí detekční mez hodin; doba detekce odpovídá ručně odvozenému <c2/> na jeden krok mřížky a hodiny, jejichž mez překračuje specifikaci, nechají spoofing dosáhnout prahu nezjištěný. Stejné upozornění <c3/> jako u skóre bezpečnosti.

seg-3d2f6d2b7722 = Flicker FM (podlaha)

seg-55697d598918 = <c1/> (ve výchozím stavu vypnuto)

seg-55000870c060 = Syntetizováno jako součet logaritmicky rozmístěných Ornsteinových–Uhlenbeckových (OU) procesů kalibrovaných na nastavitelnou plochou podlahu ADEV; <c1/> ověřuje, že podlaha je plochá napříč průměrovacím časem a leží na nastavené úrovni (průměrováno přes seedy). Zapíná se pro každé hodiny pomocí <c2/>. Citované referenční scénáře jej nechávají vypnutý: CSAC je v celém rozsahu svého datasheetu (1-1000 s) dominován bílou FM a systematická podlaha optických hodin (~{ "5e-17" }) je zastoupena jejich údajem o přesnosti.

seg-e2e3de9a61a4 = Statistiky souboru Monte Carlo

seg-9785d05ec5a7 = <c1/> (agregace)

seg-cc6c6bb5eb83 = <c1/>: percentily podle nejbližší pořadové hodnoty a průměr přes <c2/> reprodukovatelných realizací; jediný běh rozptyl zhroutí, pásmo na každý časový krok je uspořádáno <c3/> a opakované běhy jsou bitově shodné. Jde o statistickou agregaci nad již ověřeným jediným během, nikoli o nový fyzikální model.

seg-72a9d5de61f5 = sigma_y({ "1" } s)

seg-ebbe708d9cbc = csac-sa45s (CSAC)

seg-c43fe67d4200 = datasheet Microchip SA65 / SA.45s

seg-e3bde4355d78 = optical-sr-lattice (mřížka Sr)

seg-87793f684233 = stronciové optické mřížkové hodiny, cíl orientovaný na kosmos, arXiv:{ "1503.08457" }

seg-b03f5856d451 = Stav: bílá FM a náhodná procházka FM ověřeny; stárnutí modelováno a vykalibrováno; flicker FM modelována a ověřena (v citovaných scénářích ve výchozím stavu vypnuta).

seg-c5ff448dcb88 = Zralost: údaje o optických hodinách jsou <em>cílem orientovaným na kosmos</em> na pozemním hardwaru -- žádné stronciové optické hodiny dosud nelétaly. Laboratorní hodiny Sr dosahují { "4.8e-17" } (Oelker a kol. { "2019" }, Nature Photonics). Údaje CSAC pocházejí z nasazeného komerčního dílu.

seg-b59a4b8e6d88 = Vztahy: Riley, NIST SP { "1065" }, rov. { "67" } -- bílá FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); náhodná procházka FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, rovnocenně q_rw*tau/3 pro frekvenční Wienerův proces s difuzí q_rw.

seg-dca7ee671d91 = Balíček { "2" } — inerciální dead-reckoning (kvantová inerciální měřicí jednotka)

seg-98452a081241 = Konstantní/zbytkové zkreslení -> poloha

seg-6aa386251acf = chyba polohy = { "0.5" }<em>b</em>T^{ "2" } (rodina; Groves AESS (Aerospace and Electronic Systems Society) Tutorial); ručně odvozený diskrétní test v <c1/>.

seg-c60c0b54c485 = Náhodná procházka rychlosti (bílé zrychlení)

seg-7ce1f40566cf = <c1/>: simulovaná směrodatná odchylka (SD) chyby polohy odpovídá sigma_x(T)=sqrt(S_a*T^3/3) (Groves rov. 54) s pozorovanou přesností ~{ "12" } % (průměrováno přes seedy; vynucená brána { "20" } %).

seg-8ac776795d40 = Fyzika akcelerometru s interferometrem studených atomů (CAI) (z prvních principů)

seg-4eafc81873ed = <c1/>: třípulzní Mach-Zehnderův interferometr studených atomů. Ručně ověřeno proti učebnicové geometrii — Rb-87 <c2/>; <c3/> při { "1" } g, <c4/>; projekční šum <c5/> při <c6/>, <c7/>; <c8/> na jeden výstřel; zákony škálování <c9/> a <c10/>; exponenciální pokles kontrastu. <c11/> <b>odvozuje</b> spektrální hustotu výkonu (PSD) bílého zrychlení, kterou spotřebovává klasický <c12/>. Poctivý rozsah: pouze <b>podlaha kvantového projekčního šumu</b> (zde ~{ "0.09" } ug/sqrtHz) — hluboko pod skutečnými zařízeními omezenými vibracemi (1-50 ug/sqrtHz); tenzor vibrací, Coriolisova síla a systematické vlivy světelného posunu zatím nejsou modelovány (viz <a1><c13/></a1>).

seg-ed78f40a8d80 = Zkreslení gyroskopu + náhodná procházka úhlu (ARW) -> náklon -> vazba na gravitaci

seg-a73e97ac4a0e = Zbytkové zkreslení gyroskopu a ARW způsobují chybu orientace; náklon převádí gravitaci (<c1/>) na chybu horizontální specifické síly. <c2/> přesně ověřuje kubický růst polohy při čistém zkreslení a růst chyby orientace způsobený ARW jako Wienerův proces (průměrováno přes seedy). Zapíná se pro každý senzor pomocí <c3/> a <c4/>; v citovaných scénářích jen s akcelerometry je vypnuto.

seg-e68d093e952a = Nestabilita zkreslení (podlaha flicker 1/f)

seg-5ad1e7d55d07 = <c1/>: proces flicker 1/f (stejná syntéza OU ověřená pro hodiny), jehož plochá podlaha Allanovy odchylky leží na koeficientu nestability zkreslení; nula je bez účinku, nenulová podlaha mění trajektorii, obojí reprodukovatelně. Zapíná se pro každý senzor pomocí <c2/>.

seg-b631c1bfce05 = Náhodná procházka zrychlení (náhodná procházka rychlosti změny)

seg-4a4a70363412 = <c1/>: zkreslení je Wienerův proces s <c2/>, ověřený s průměrováním přes seedy na ~{ "20" } %. Zapíná se pro každý senzor pomocí <c3/>.

seg-49c4a2532dca = Křížová validace NaveGo (koeficienty šumu IMU (inerciální měřicí jednotka))

seg-e558aa705560 = <c1/>: externí křížová kontrola proti <b>NaveGo</b> (R. Gonzalez, open-source sada nástrojů INS/GNSS (INS: inerciální navigační systém), <c2/>). Reprodukuje syntetický zpáteční test z <c3/> NaveGo na jeho <b>publikovaném referenčním profilu Microstrain 3DM-GX3-35</b>: řízením našeho (NBS14/Stable32 ověřeného) odhadu překrývající se ADEV bílým šumem senzoru na úrovních 1-σ podle NaveGo se obnoví koeficienty náhodné procházky rychlosti a úhlu (VRW, ARW) (<c4/>) s přesností <c5/> (skutečně ~{ "0.4" } %), přičemž větev bílého šumu leží na sklonu −1/2. Potvrzuje, že náš postup Allanovy odchylky a definice VRW/ARW v NaveGo se shodují. Zaznamenaný záznam STIM300 <c6/> o velikosti { "40" } MB není načítán (omezeno binárním formátem).

seg-171b215f0526 = Činitel měřítka, jemnější členy křížových os

seg-b690ed87f493 = <c1/> v tomto 1-DOF (jeden stupeň volnosti) balíčku

seg-c1bd4e24c091 = Starší jednoosý balíček nemá chybu činitele měřítka ani křížové vazby. Tříosá strapdown knihovna a balíček <c1/> modelují činitel měřítka, nesouosost, citlivost na g, kvantování a rampu rychlosti (<c2/>; viz tabulka tvrzení níže).

seg-ce2b3237acfe = stabilita zkreslení

seg-129dc6af8f10 = odmocnina PSD šumu

seg-7109e60b8c9b = cold-atom-quat (kvantové)

seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

seg-b52686064c43 = Templier a kol. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

seg-09b42bed82c9 = nav-grade-quartz (klasické)

seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

seg-79fc524162b5 = Poctivé zarámování: výhodou studených atomů je <b>dlouhodobá stabilita zkreslení</b> (~2600x nižší), která při dlouhém výpadku GNSS převládá přes { "0.5" }<em>b</em>T^{ "2" }. Krátkodobý šum je srovnatelný (kvantový ~{ "22" } vs. klasický ~{ "20" } ug/sqrtHz) — kvantový senzor vyhrává maraton, nikoli sprint. Zralost: akcelerometry na studených atomech jsou laboratorní/raného stadia (JRC122785), křemenné navigační třídy jsou nasazeny.

seg-e02e93f4f30a = Balíček { "3" } — přenos času (optický vs. rádiofrekvenční (RF), optický mezidružicový spoj)

seg-2b87e5f0ba7e = Bílý časový jitter -> přesnost synchronizace

seg-229295aa1f70 = <c1/>: simulovaná RMS synchronizace reprodukuje jitter spoje sigma_j; výběrový průměr se průměruje jako sigma/sqrt(N) s přesností <{ "20" } % (průměrováno přes seedy).

seg-4325ec478bca = Časování -> jednosměrné určování vzdálenosti

seg-aa7a1f463683 = vzdálenost = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (přesně, ručně odvozený test).

seg-7ad8bb95bf35 = Podlaha flicker/TDEV, zbytek vzájemnosti obousměrného přenosu

seg-5bf72778b6c2 = <c1/> (druh <c2/>): fázový šum flicker (Kasdin–Walter, plochá TDEV), denní nevzájemnost a konstantní zbytek vzájemnosti na obousměrné řadě; balíček <c3/> s bílým jitterem zůstává beze změny.

seg-dae3fa0375fe = jitter jednoho vzorku

seg-4a141a45a8ff = zdroj

seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

seg-c78abd60ec97 = cíl věrohodný na oběžné dráze

seg-9dfc1d4334a3 = optický mezidružicový spoj, cíl synchronizace na úrovni pikosekund; laboratorní O-TWTFT (TWTFT: obousměrný přenos času a frekvence) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

seg-0e730e8e2237 = naměřeno v jedné relaci

seg-b9faad47d802 = TWSTFT od BIPM/PTB/NIST (BIPM: Mezinárodní úřad pro míry a váhy; PTB: Physikalisch-Technische Bundesanstalt, německý národní metrologický ústav)

seg-51e2e5782c96 = Poctivé zarámování: optický údaj je cíl synchronizace na úrovni pikosekund na oběžné dráze (nelétal). Pozemní optická laboratorní podlaha je ~{ "1" } fs (mnohem lepší); dobře zkonstruovaný mikrovlnný spoj (mikrovlnný spoj ACES (Atomic Clock Ensemble in Space) (MWL), ~{ "0.3" } ps) se může optickému vyrovnat, takže základ „RF = { "0.5" } ns“ je výslovně běžný TWSTFT. Převod na vzdálenost je jednosměrný (vzdálenost = c<em>dt); obousměrný/okružní jej půlí (vzdálenost = c</em>dt/2).

seg-5fa72f18f983 = Balíček { "4" } — hybridní fúze (vrcholový)

seg-3de12b094504 = Skládá balíček { "1" } (hodiny), balíček { "2" } (inerciální) a balíček { "3" } (přenos času) do jedné sady PNT (určování polohy, navigace a času). Sada musí udržet OBOJÍ, časování (< specifikace časování) i polohu (< specifikace polohy), v mezích; <c1/> je doba, než jedno z toho překročí mez. Volitelný optický mezidružicový spoj (ISL) pro přenos času znovu synchronizuje hodiny během výpadku (pouze podpora času — poloha se znovu nesynchronizuje, protože přenos času dává čas, nikoli polohu).

seg-4f7cd8f86565 = Aspekt

seg-19deb2a3537c = Kombinované hodnocení PNT (časování A poloha)

seg-77a7595ffad7 = <c1/> ručně odvozený test <c2/> (pnt_holdover = první z časování/polohy, který mez překročí).

seg-d0e39bf123d8 = Integrita + bezpečnost pro hybridní balíček

seg-3fb63eb2b6b8 = <c1/>: Kalmanův odhadovač času disciplinovaný k pravdě (nominálně) a znovu ukotvený při každé optické resynchronizaci; integrita je zahrnutí do ochranné meze (mez zahrnuje podlahu jitteru spoje), bezpečnost je skóre detekce spoofingu. Testováno pro obě sady včetně případu s podporou spoje.

seg-c3be96b7cb41 = Společný fúzní odhadovač

seg-e9d5448ea06c = <c1/>: jediný společný Kalmanův filtr ([fáze, frekv.] ⊕ [pol., rychl.]) je navigátorem, disciplinovaným GNSS (učí se offsety z nenulové počáteční kovariance) a podporovaným přenosem času; společná kovariance dává společnou integritu, která je testována jako spolehlivá (≥{ "0.9" }) pro obě sady se senzory konzistentními v šumu. Balíček sleduje polohu a čas <b>odděleně</b>, pro což je optimální filtr blokově diagonální; odhad konstantního zkreslení v rozšířeném stavu a dynamická vzájemná podpora jsou budoucí práce.

seg-915ec766439f = Spřažený filtr hodin + polohy (kovariance mezi bloky)

seg-fd718a51859a = <c1/>: jediný skládaný Kalmanův filtr <c2/> (aktualizace v Josephově tvaru), jehož měření <b>pseudovzdálenosti</b> <c3/> spojuje bloky polohy a hodin. Testy: sdílená pseudovzdálenost činí <c4/> nenulovou (oddělené filtry ji drží přesně na { "0" }); dvě odlišné geometrie společně rozliší vložené offsety polohy a hodin, které jedna vzdálenost oddělit nedokáže; oprava pouze <b>hodin</b> zpřesní <b>polohu</b> prostřednictvím křížové kovariance (přínos, který spřažení poskytuje a oddělené filtry ne); a <b>NEES z Monte Carlo je konzistentní s χ²({ "4" })</b> (Bar-Shalom §{ "5.4" }, pásmo založené na bězích). 1-DOF (rozměrnost balíčku); zatím není zapojeno do spustitelného balíčku a 3D rozšíření na 8 stavů je budoucí práce.

seg-31ecf062b941 = Složení z ověřených dílčích modelů

seg-9b849cb4fe8d = zdědí

seg-4e1c8b6791f3 = členy hodin/inerciální/přenosu času jsou ověřeny ve svých vlastních balíčcích.

seg-b672e5499976 = Volně vázané GNSS/INS (balíček <c1/>)

seg-277425f2cbcf = <c1/>: 15stavový chybový EKF (δp, δv, ψ, zkreslení akcelerometru/gyroskopu; Groves §{ "14" }) řídí tříosý strapdown navigátor se zpětnou vazbou. Testy: vložená chyba polohy se při dokonalé podpoře pravdou vynuluje; podporované řešení zůstává omezeno na metry, zatímco volně běžící INS se rozbíhá za { "100" } m; a fúzovaná poloha RMS během výpadku { "60" } s překoná nepodporovaný dead-reckoning o mez testu souboru (~{ "4" }×, měřeno před { "0.27.3" }; rozdíl je po níže uvedené opravě větší). Vazba zkreslení gyroskopu je kontrolována proti samotnému strapdownu: známé zbytkové zkreslení gyroskopu musí vytvořit chybu orientace, kterou filtr předpovídá (<c2/>), a široký apriorní odhad se musí naučit zkreslení gyroskopu třídy řadiče letu a zůstat omezený; oba selžou při znaménku před 0.27.3. <b>Revidováno ve { "0.27.3" }:</b> tato vazba měla chybné znaménko, takže odhady zkreslení gyroskopu tlačily špatným směrem a balíček stabilizoval jen těsný apriorní odhad; publikované údaje o výpadku se změnily (CHANGELOG, Fixed). Poctivá mez: u volně vázaného systému jsou zkreslení akcelerometru a náklon slabě oddělitelné, proto se kalibrace jednotlivých zkreslení netvrdí.

seg-1c9a9f76a432 = Těsně vázané GNSS/INS (pseudovzdálenost)

seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: inovace se tvoří v oblasti vzdáleností (Jacobián přímé viditelnosti na δp). Testy: čtyři družice vynulují vloženou horizontální chybu { "8" } m/−{ "5" } m na < { "0.1" } m; <b>dvě družice</b> (řešení polohy, rychlosti a času (PVT) není možné) přesto sníží horizontální chybu o > { "5" }×; jediná družice v zenitu pozoruje pouze složku podél přímé viditelnosti (vertikální) a horizontální nechává nedotčenou; nesprávně utvořené vstupy jsou odmítnuty. Pouze pseudovzdálenost — fáze nosné a explicitní stav hodin přijímače jsou v plánu.

seg-240b681b6021 = Věrnost vzájemné podpory senzorů (úplná fúze Kalman/faktorový graf)

seg-efe7e288276b = <c1/> v balíčku <c2/>

seg-e5371874c57d = Hybridní balíček je skladba na úrovni systému + podpora časem, nikoli optimální odhadovač. Filtry existují jinde: volně i těsně vázaný EKF (rozšířený Kalmanův filtr) v balíčku <c1/> (řádky výše) a 17stavový UKF (nevonný Kalmanův filtr) druhu <c2/>. Žádný vyhlazovač s faktorovým grafem není modelován.

seg-189758709fd2 = Výsledek: čistě kvantová sada drží plné PNT po celý výpadek { "1.8" } h; čistě klasická sada je <b>omezena polohou</b> (IMU navigační třídy překročí mez jako první). Optický přenos času mezidružicovým spojem drží zachycené i klasické HODINY, čímž vyčleňuje inerciální senzor jako slabý článek klasické sady — jádro argumentu pro kvantovou inerciální techniku a optické časování dohromady.

seg-a4c5b45ea8a5 = Geometrie — dostupnost GNSS z oběžných drah

seg-d347bb63c1fd = Kruhová propagace dvou těles

seg-60c369fbbd97 = <c1/>: perioda <c2/> (mu = { "3.986004418e14" }), poloha se vrací po jedné periodě, rovníková/polární rovinnost — ručně odvozené testy.

seg-1260a2fef95f = Excentrická (keplerovská) propagace

seg-49df9d526f9c = <c1/>: Keplerova rovnice <c2/> řešená Newtonovou metodou (reziduum < { "1e-12" }); poloměry perigea/apogea <c3/>; kruhový případ se shoduje s uzavřenou cestou na { "1e-9" }.

seg-958f03424508 = Sekulární drift uzlu/apsid vlivem J2

seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); uzel couvá (prográdní) / postupuje (retrográdní) / je stacionární (polární) a apsidy zamrznou při kritické inklinaci { "63.4" } stupně — ručně odvozené testy znaménka/nuly. Pouze dvě tělesa + sekulární, nikoli oskulační.

seg-dcba8d368326 = Přímá viditelnost (zákryt Zemí + elevační maska)

seg-2eee9a8f894b = Antipodální družice zakryta, radiálně ven směřující družice v elevaci { "90" } stupňů, tečná družice na obzoru — přesné ručně odvozené testy.

seg-f251c75eb367 = Viditelnost -> stav GNSS -> časová osa

seg-70fbb9f3cc2b = <c1/> viditelné = nominální, 1-3 zhoršené, { "0" } odepřeno; generátor Walker-delta; integrační test řídí běh holdoveru hodin z odvozené časové osy.

seg-988d3fedb7f5 = Optimalizátor návrhu konstelace + geometrie streets-of-coverage

seg-2a636487a4e6 = <c1/>: <c2/> prohledává mřížku <c3/> a vrací buňku, která nejlépe splňuje <c4/> (nejméně družic pro cíl pokrytí / maximální pokrytí / minimální nejhorší PDOP (PDOP: faktor zhoršení přesnosti polohy)) — test ověřuje, že výběr se rovná nezávislému hrubému prohledání téhož proměření, a pracovní příklad potvrzuje, že návrh GPS (Global Positioning System) Walker 24/6/1 pokrývá alespoň stejně dobře jako zředěný návrh s 18 družicemi. Analytické uzavřené tvary <b>streets-of-coverage</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) jsou ručně ověřeny proti učebnicové geometrii (GPS při masce { "5" }°: λ ≈ { "71.16" }°, poloviční šířka ulice pro 4 družice ≈ { "62.83" }°) a zjišťují mezeru z nedostatečného obsazení (<c9/>). Úplný Riderův řešitel minimálního počtu družic pro <em>globální</em> pokrytí (počet rovin citlivý na švy) zatím není implementován.

seg-a1c1364cc45a = Faktor zhoršení přesnosti (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometrický faktor zhoršení přesnosti; HDOP: horizontální faktor zhoršení přesnosti; VDOP: vertikální faktor zhoršení přesnosti; TDOP: časový faktor zhoršení přesnosti)) -> přesnost polohy

seg-a1706d47f895 = <c1/>: <c2/> z návrhové matice přímé viditelnosti. <b>Externí orákulum</b> (<c3/>): pět faktorů DOP reprodukuje ty, které vypočetla <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — nezávislá, recenzovaná knihovna GNSS, použitá zde tak, jako se pro soustavy používá ERFA (Essential Routines for Fundamental Astronomy)) napříč <b>{ "8" } geometriemi</b> od dobře podmíněných po téměř singulární (DOP v řádu stovek), s relativní přesností <b>{ "1e-6" }</b>; původ a regenerace v <c4/>. Jako další kontrola v uzavřeném tvaru reprodukuje geometrie pravidelného čtyřstěnu analytické hodnoty DOP (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) na { "1e-9" }. Sigma polohy = PDOP × ekvivalentní chyba měření vzdálenosti uživatele.

seg-504d5aa92cbc = Chyba polohy = σ_UERE × DOP pro vlastní řešení nejmenších čtverců enginu

seg-fc3443210358 = <c1/>, <c2/>: seedované Monte Carlo (N = { "20,000" } epoch na geometrii, σ = { "1.5" } m, seed ChaCha8 { "36" } + i) <c3/> s jednotkovými vahami, řešené z pravdivé polohy, na <b>{ "8" } geometriích <c4/></b> (těch, jejichž DOP je shodný s gnss_lib_py), proti σ²·Q, kde Q je kovarianční faktor samotného jádra <c5/> (<c6/>, stejná aritmetika). <b>Tolerance předregistrované</b> (commit e50c88d2, před prvním během, podle návrhové poznámky ke geometrii { "0.36" }, část { "5.2" }), každá jako počet směrodatných chyb: rozptyly východ, sever, nahoru a hodin v rámci { "5" } %; RMS H/V/P v rámci { "2.5" } %; korelace východ–sever v rámci { "0.035" }; střední hodnoty v rámci { "5" } směrodatných chyb; podíl { "95" }% horizontální elipsy v rámci { "0.95" } ± { "0.0077" }. První běh: všech { "104" } kontrol projde (nejhorší rozptyl { "3.2" } %, RMS { "1.6" } %, korelace { "0.012" }, střední hodnota { "2.2" } směrodatné chyby, elipsa { "0.0039" }). <b>Negativní kontroly</b> selžou, jak je požadováno: zdvojnásobený PDOP selže na každé geometrii; chyby rostoucí jako 1/sin(elevace) proti nevážené Q selžou na kontrole rozptylu u každé geometrie, jejíž nejnižší družice je pod { "20" }°. <b>Jak se skládá s řádkem výše:</b> tento řádek ověřuje DOP těchto geometrií proti gnss_lib_py; tento přidává krok od těchto faktorů k metrům prostřednictvím řešiče enginu. <b>První samostatná kontrola je ponechána vedle něj</b> (<c7/>, <c8/>, spuštěna před předregistrací a tak uvedena): čtyři ručně zvolené oblohy (otevřená, shluková, kaňon, poloviční obloha; σ { "1" } m) s intervaly spolehlivosti chí-kvadrát při celkových { "1e-6" } na { "20" } kontrol; poměry { "0.987" } až { "1.009" } a vlastní negativní kontroly (chyba DOP { "10" } %, chyby 1/sin(elevace)) selžou, jak je požadováno. <b>Proč MODELLED:</b> žádný externí soubor dat; neukazuje, že chyba skutečného přijímače sleduje model, a σ_UERE je vstup.

seg-94bffbd8385b = Dostupnost při více konstelacích

seg-a40eab03bbbe = <c1/>: další <c2/> jsou sloučeny do jedné sady družic pro viditelnost/DOP; test sloučeného počtu potvrzuje sjednocení.

seg-0b905100d91c = Vysílaná ionosféra (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → šikmé zpoždění L1

seg-05e278f04770 = <c1/>: <c2/>, osmikoeficientní vysílaný jednofrekvenční model. <b>Externí orákulum</b> (<c3/>): šikmé zpoždění L1 reprodukuje <b><c4/> z RTKLIB (open-source knihovna pro kinematické určování polohy v reálném čase)</b> (tomojitakasu/RTKLIB, <c5/> — de facto otevřená reference GNSS, přeložená ze zdrojů a spuštěná nezávisle) napříč <b>{ "10" } případy</b> pokrývajícími elevaci, azimut, místní čas a dvě sady koeficientů (výchozí z kshana + z RTKLIB), s přesností <b>< { "1e-4" } m</b>. Čtečka map TEC (TEC: celkový obsah elektronů) IONEX (IONosphere map EXchange format) pro soubory GIM (globální ionosférická mapa) nyní existuje (<c6/>, <c7/> s bilineární prostorovou a časovou interpolací a šikmým mapováním, testovaná jednotkově v crate); křížová kontrola této interpolace proti skutečnému produktu GIM z CODE (Center for Orbit Determination in Europe) je stále navazující práce. Samotný vysílaný model je vnějšně ověřen.

seg-39e235557ecc = Detekční jádro RAIM/ARAIM (ARAIM: advanced receiver autonomous integrity monitoring) (χ² / necentrální χ² / normální rozdělení) → prahy a násobitele

seg-8906f922b9b9 = <c1/>: detekční práh snapshot / solution-separation / ARAIM (<c2/>), necentralita pro nezachycenou událost <c3/> (<c4/>) a násobitele K_fa/K_md/K_V (<c5/>) se všechny vyhodnocují z regularizované neúplné funkce gama bez závislostí. <b>Externí orákulum</b> (<c6/>): <b>{ "171" } případů</b> reprodukuje <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> – nezávislá implementace Cephes/Boost, tedy jiný algoritmus) napříč provozními rozsahy P_fa / P_md / redundance, s relativní odchylkou <b>≤ { "1e-6" }</b>. Geometrie, která jádro obklopuje (sklon/kovariance z <c11/>), je jádro DOP ověřené proti gnss_lib_py. <b>Rozsah:</b> tento řádek ukotvuje <em>statistické jádro</em>. <em>Hodnota</em> ochranné úrovně v alokaci ARAIM MHSS (multiple-hypothesis solution separation) je ukotvena samostatně proti zveřejněnému propočtenému příkladu technické podskupiny ARAIM pracovní skupiny WG-C (Working Group C) (<c12/>, VPL (vertical protection level) { "18.2926" } m oproti { "18.3" } m, HPL (horizontal protection level) { "13.4063" } m oproti { "13.45" } m, v rámci vlastní tolerance reference { "0.05" } m; viz poznámka o normách níže a <a1><c13/></a1>).

seg-b17f1501a267 = Ochranná úroveň SBAS (satellite-based augmentation system) (DO-229E, příloha J) → horizontální / vertikální ochranná úroveň (HPL / VPL)

seg-abe00b67e4cb = <c1/>: <c2/>, vážená LS (LS: least squares) matice <c3/> → hlavní poloosa horizontální chybové elipsy + vertikální σ, škálované K-faktory z DO-229E. <b>Externí orákulum</b> (<c4/>): HPL enginu kshana reprodukuje <b>fork RTKLIB SBAS-PL</b> (<c5/> <c6/>, implementace „DO-229D Appendix J“ od Sikiho a Takácse { "2017" }), spuštěný příkazem <c7/> na <b>skutečných datech EGNOS (European Geostationary Navigation Overlay Service)</b> (vysílané zprávy GEO (geostationary orbit) PRN120 + skutečný RINEX (Receiver Independent Exchange Format) stanice BUTE/Budapešť, 2017-02-19), napříč <b>{ "6" } epochami</b> s odchylkou <b>< { "2e-3" } m</b>. Hodnota σ pro každou družici je vlastní úplný rozpočet SBAS orákula (UDRE (user differential range error) + GIVE (grid ionospheric vertical error) iono + tropo + airborne). ESA gLAB { "v6.0.0" } (<c8/>) byl přeložen a potvrzeno, že používá shodnou konvenci. <b>Poznámka ke K_V:</b> obě orákula zaokrouhlují MOPS (minimum operational performance standards) K_V → { "5.33" }; kshana používá přesnou hodnotu <c9/> (VPL o ~{ "0.06" } % menší), takže vertikální složka je validována jako <c10/> bez K-faktoru (= VPL orákula / { "5.33" }). HPL se porovnává přímo (K_H = { "6.0" } na obou stranách).

seg-fd16d642cafd = Skutečná geometrie konstelace z TLE (řádek 2 / Keplerovy elementy)

seg-1311ef1cb4bb = <c1/> (parsování)

seg-5117debbce89 = <c1/>: parsuje střední Keplerovy elementy z řádku 2 (hlavní poloosa ze středního pohybu); známá sada elementů ISS (International Space Station) projde zpětným převodem na správné elementy a periodu. Pro blok pouze s řádkem 2 je propagací dvoutělesová úloha enginu (+ volitelně J2) nad <em>středními</em> elementy – vhodná pro snímek ze společné epochy, v čase se odchyluje od SGP4 (Simplified General Perturbations { "4" }).

seg-26d22e76e28d = Propagace SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (úplné TLE)

seg-1099f1bffa01 = <c1/>: úplný SGP4 pro blízkou Zemi + SDP4 pro hluboký vesmír (lunisolární sekulární/periodické členy + rezonance geopotenciálu { "12" } h / { "24" } h). Ověřeno v <c2/> proti oficiálním vektorům AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 („Revisiting Spacetrack Report #3“) – všech { "666" } referenčních stavů (blízká Země, hluboký vesmír, rezonance, případy chybových kódů) souhlasí s nejhorší chybou polohy ≈ { "4.1" } mm. Úplná dvouřádková sada (řádek { "1" } + řádek { "2" }) se propaguje pomocí SGP4; samotný řádek 2 zůstává keplerovský; obojí lze kombinovat. Soustavou je TEME (true equator, mean equinox), použitá konzistentně pro uživatele i družice (bez redukce TEME→ECEF (ECEF: Earth-centred, Earth-fixed) – postačuje pro geometrii dostupnosti/DOP).

seg-c8fc6a49d249 = Nutace IAU (International Astronomical Union) 2000A / 2000B + redukce TEME→GCRS (GCRS: Geocentric Celestial Reference System)

seg-b31c49596100 = <c1/>: <b>úplná řada IAU 2000A</b> ({ "678" } lunisolárních + { "687" } planetárních členů, <c2/>) a 77členné zkrácení 2000B (<c3/>) jsou každé ověřeny <b>bit po bitu</b> proti zveřejněným referenčním vektorům SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) při JD_TT { "2453736.5" } – <c4/> dává Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> dává Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } – obojí s odchylkou <b>{ "1e-13" } rad</b>. Tabulka 2000A je strojově generována ze zdroje ERFA <c6/> nástrojem <c7/> (reprodukuje odevzdaný <c8/> bit po bitu). Matice nutace (<c9/>), rovnice ekvinokcií a celý řetězec TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) (<c10/>, Vallado AIAA-2006-6980) jsou testovány na vlastnosti vlastní rotace/zpětného převodu/precese plus nutace, matice nutace proti ERFA <c11/> prvek po prvku s odchylkou { "1e-14" } a celý řetězec TEME→GCRS proti zveřejněnému Valladovu příkladu TEME→GCRF (AIAA 2006-6753, 2004-04-06) s odchylkou <b>{ "0.11" } m</b> (<c12/>); než byla přidána tato kontrola od začátku do konce, nesla matice nutace Δψ se špatným znaménkem, tedy otočení o { "2" }·Δψ (zhruba { "25" }″), které vlastnostní testy nemohly zachytit (viz CHANGELOG, Unreleased, Fixed); 2000A a 2000B souhlasí na < { "1" } mas, jak se vyžaduje. Řetězec je založen na ekvinokciu/GMST (GMST: Greenwich mean sidereal time); redukce CIO (X,Y,s) bez ekvinokcia a její nezávislá numerická křížová kontrola pomocí ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris – čistě rustový nástroj pro planetární geometrii; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m na oběžné dráze GNSS, hluboko pod cílem < { "10" } m) jsou v řádku CIO níže.

seg-0be3c40cc81a = Model hlavního geomagnetického pole IGRF-14 (IGRF: International Geomagnetic Reference Field)

seg-9dbb3b1b18a1 = <c1/>: Schmidtovsky normalizované sférickoharmonické pole IAGA (International Association of Geomagnetism and Aeronomy) (stupeň/řád { "13" }, { "2025.0" } + sekulární variace; koeficienty strojově generované z oficiálního <c2/> nástrojem <c3/>, reprodukují <c4/> bit po bitu). Ověřeno na pěti nezávislých frontách: ({ "1" }) přesné kontroly koeficientů proti souboru IAGA (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) syntéza stupně 1 reprodukuje <b>přesné uzavřené vyjádření pole nakloněného dipólu</b> <c5/> s odchylkou { "1e-6" }; ({ "3" }) <b>úplné analytické pole stupně 13 se rovná −∇V</b> skalárního potenciálu (konečné diference, s odchylkou { "1e-4" }) – to prověřuje Legendrovy derivace a člen 1/sinθ od začátku do konce; ({ "4" }) osa dipólu reprodukuje známý <b>geomagnetický severní pól</b> (~{ "80.7" }°N, −{ "72.7" }°E) a <b>sílu dipólu</b> (~{ "29.7" } µT) a globální pole leží ve fyzikálním pásmu { "22" }–{ "67" } µT se správným znaménkem inklinace na obou polokoulích; a ({ "5" }) <b>externí orákulum</b> – úplná syntéza reprodukuje hodnoty z oficiální <b>webové služby British Geological Survey IGRF-14</b> pro { "2025.0" } (geodetická, výška WGS-84 (WGS: World Geodetic System)) s odchylkou <b>< { "2" } nT</b> na X/Y/Z/F a <c6/> na D/I ve čtyřech bodech včetně výšky { "400" } km (<c7/>).

seg-c1027d5ffc44 = Redukce GCRS↔ITRS (ITRS: International Terrestrial Reference System) IAU 2006/2000A založená na CIO

seg-aad81285e8cf = <c1/>: řetězec od nebeské k pozemské soustavě bez ekvinokcia. Souřadnice CIP (Celestial Intermediate Pole) <c2/> a 66členná řada lokátoru CIO <c3/> jsou ověřeny <b>bit po bitu</b> proti zveřejněnému vektoru SOFA/ERFA <c4/> při JD_TT { "2453736.5" } – X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); matice GCRS→CIRS (CIRS: Celestial Intermediate Reference System) proti <c5/> (všech devět prvků s odchylkou { "1e-12" }); úhel rotace Země (ERA) proti <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). Tabulka <c7/> je strojově generována z reference ERFA <c8/> nástrojem <c9/> (reprodukuje <c10/> bit po bitu). Úplná <c11/> (CIO <c12/> = polární pohyb · ERA · GCRS→CIRS) je testována na vlastní rotaci a zpětný převod a je prokázána její shoda se starší redukcí TEME založenou na ekvinokciu/GMST-1982 do { "1" } m na poloměru { "7 000" } km (konvence se tam liší asi o { "5" } cm). <b>Nezávislá křížová kontrola třetí stranou (<c13/>):</b> táž <c14/> se porovnává s <b>ANISE</b> (čistě rustová reimplementace NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)), která otáčí GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) podle souboru <c15/> z JPL (Jet Propulsion Laboratory), přičemž <b>oběma stranám jsou předány totožné parametry orientace Země IERS (International Earth Rotation and Reference Systems Service) <c16/></b>, v osmi čtvrtletních epochách { "2020" }–{ "2023" }. Obě nezávislé realizace soustavy souhlasí s <b>maximální relativní rotací { "0.028" }″ – ≤ { "0.86" } m na zemi, ≤ { "0.93" } m na LEO (low Earth orbit), ≤ { "3.6" } m na oběžné dráze GNSS</b> (střední úhel { "0.023" }″). Toto je křížová kontrola soustav „< { "10" } m“ z ROADMAP, <b>dodaná</b>; zbytek je očekávaný rozdíl modelu/datumu ITRF93 oproti IERS-2010-CIO, nikoli vada (bit po bitu zůstává kotvou výše uvedené vektory SOFA/ERFA). ANISE je crate s licencí MPL-2.0 (MPL: Mozilla Public License) / edition-2024, proto kontrola žije v samostatném podcrate vyloučeném z workspace, který se nikdy nedotkne grafu závislostí publikovaného <c17/> ani žádné výchozí brány CI.

seg-fa5889f379d2 = Zpětný převod exportu SP3 (Standard Product { "3" }, formát přesných drah) (konstelace → SP3-c → opětovné parsování)

seg-cd53434eba3a = <c1/>: skutečný snímek Celestrak <c2/> ({ "30" } družic GPS) se propaguje pomocí SGP4, exportuje do SP3-c (<c3/> → <c4/>), znovu parsuje (<c5/>) a obnovené polohy ECEF se v každé epoše po dobu { "24" } h porovnávají s pravdou SGP4 – nejhorší reziduum <b>< { "0.5" } m</b> (milimetrová serializace zapisovače; milník s tolerancí { "10" } m na úrovni TLE (TLE: two-line element set) je splněn s velkou rezervou). Pokryta je i cesta CLI (command-line interface) <c6/>: přibalený orbitální scénář exportuje znovu parsovatelný SP3 s 30 družicemi a neorbitální scénář je odmítnut.

seg-fa5ee52e59aa = Skutečná geometrie konstelace GPS z TLE (SGP4 → ECEF)

seg-1329a53ca94c = <c1/>: autentický <b>snímek Celestrak <c2/></b> (2021-07-28, { "30" } provozních družic GPS; původ v <c3/>) se parsuje a každá družice je propagována ověřeným jádrem SGP4 do společného okamžiku a otočena z TEME do ECEF. Ověřuje, že celá konstelace leží na slupce GPS MEO (medium Earth orbit) s odchylkou do { "1" }% a že ze stanoviště ve středních šířkách s otevřenou oblohou dává skutečný souhrn všech družic v dohledu (devět družic) PDOP { "1.64" } a vertikální faktor zhoršení přesnosti převyšuje horizontální (jak tomu u pozemního uživatele musí být). Tím se SGP4 prověřuje na skutečné konstelaci, vedle reálných datových cest SP3 (přesné) a RINEX (vysílané).

seg-a1b7d74bbe02 = Generátor Walkerových konstelací ze středních elementů SGP4

seg-01f1635b75e4 = <c1/>: navržený vzor Walker-delta se vydává jako střední elementy SGP4 (Kozaiův střední pohyb zvolený tak, aby hlavní poloosa SGP4 dosáhla cílové slupky) a propaguje se ověřeným jádrem. Testy: 24družicový Walker podobný GPS leží na slupce MEO s odchylkou do { "1" }%, roviny jsou rozmístěny přesně o { "90" }° v RAAN (right ascension of the ascending node) obnoveném z normál drah a střední pohyb reprodukuje periodu slupky GPS ~{ "718" } min.

seg-6e8c472ec9fa = Průchod PDOP konstelací + ukazatele kvality pokrytí/návštěvnosti (figures of merit)

seg-dcdbf9c78ca5 = <c1/> (monotonie)

seg-5a70f090db45 = <c1/>: <c2/> tabelovaně udává pokrytí a mediánový/nejhorší PDOP nad mřížkou <c3/>; <c4/> uvádí podíl pokrytí a mezery mezi návštěvami v pozemním bodě. Ověřeno fyzikálními monotónnostmi, které musí návrhový kompromis dodržet: přidání družic nikdy nesníží pokrytí a přísně sníží mediánový PDOP (plný návrh s 24 družicemi pokrývá nepřetržitě při PDOP ~{ "1.7" }) a zahuštění prořídlé konstelace přísně zmenší nejhorší mezeru mezi návštěvami. Průměrná mezera mezi návštěvami nikdy nepřekročí maximum. Jde o tabulky geometrických kompromisů, nikoli o rozpočet spoje/pokrytí s formální certifikací.

seg-9f0747d71ecc = Upřímné vymezení: toto je deterministická geometrická vrstva (kruhové dráhy, kulová Země se středním poloměrem { "6371" } km, čistá přímá viditelnost). Z reálné geometrie stanovuje <em>dostupnost</em> a <em>geometrickou</em> přesnost polohy (faktor zhoršení přesnosti × reprezentativní rozpočet chyby vzdálenosti), nikoli navigační řešení z přesných efemerid. Reference <c1/> umisťuje kosmickou loď dovnitř slupky GNSS: určení polohy udrží jen ~{ "59" }% dne, kvantové hodiny udrží časové řešení { "5" } ns přes každou mezeru (dostupnost { "1.0" }), zatímco čipové hodiny dosahují ~{ "0.73" }.

seg-e2c433c35ba8 = Numerický (Cowellův) propagátor a model sil

seg-20ace4e0a710 = Numerický propagátor (<c1/>) integruje hierarchický model sil (<c2/>) pomocí adaptivních integrátorů (<c3/>). Každý člen níže je ověřen proti analytické pravdě nebo ručně odvozenému uzavřenému tvaru; poruchy jsou <b>ve výchozím stavu vypnuté</b>, takže vydané zlaté reference zůstávají nedotčeny. Složený model je rovněž křížově ověřen jiným nástrojem: <c4/> spouští { "11" } případů LEO a GTO (geostationary transfer orbit), { "275" } hodinových epoch, proti propagátoru DormandPrince853 z Orekit { "12.2" }, a konzervativní vrstvy (dvoutělesová úloha → J2–J6 → Slunce/Měsíc → SRP dělové koule) souhlasí s nejhorší odchylkou { "0.08" } m za { "24" } h (VALIDATED v matici); vrstva odporu je pouze charakterizována ({ "333" } m) a zůstává MODELLED.

seg-ec74e57ff801 = Cowellův propagátor oproti analytické keplerovské pravdě

seg-8d773778ff0e = <c1/>: neporušená (dvoutělesová) dráha reprodukuje <b>přesné řešení Keplera v univerzálních proměnných s chybou pod metrem po dobu { "24" } h dráhy LEO</b> (přísnější brána než „oproti numerické referenci < { "10" } m“); měrná energie a moment hybnosti se zachovávají s relativní odchylkou ~{ "1e-9" }; nodální regrese J2 reprodukuje uzavřený tvar <c2/> podle teorie prvního řádu (do { "2" } %, zbytek O(J2²)). <c3/> vrací <c4/> místo tiše chybné odpovědi, když Newtonova metoda nekonverguje (blízko perigea e = { "0.999" }). Robustní <c5/> (startér Markley { "1995" }, <c6/>) tam konverguje i v celém rozsahu { "0" } ≤ e ≤ { "0.999999" }, do { "0.9" } ε·|E| od 50místných kořenů z mpmath (<c7/>).

seg-549d15780f79 = Adaptivní integrátory (RK4 (Runge–Kuttův čtvrtého řádu) s půlením kroku + vnořená dvojice Dormand–Prince RK5({ "4" }), níže DP5({ "4" }))

seg-1fcc7553c627 = <c1/>: RK4 integruje <c2/> s chybou < { "1e-9" }, vykazuje pokles chyby ~{ "16" }× při každém zmenšení kroku na polovinu (konvergence 4. řádu) a zachovává harmonický oscilátor po dobu periody. Vnořený odhad chyby DP5({ "4" }) je <b>O(h⁵)</b> (zmenšení kroku na polovinu jej sníží ~{ "32" }×), integruje oscilátor po dobu { "50" } period se zachováním energie na < { "1e-6" } a při stejné toleranci dosáhne téhož koncového bodu s <b>menším počtem vyhodnocení funkce</b> než půlení kroku; <c3/> splňuje touž submetrovou bránu Keplera a souhlasí s cestou RK4 na < { "1" } m na dráze J2..J6. <b>DOP853</b> (<c4/>): Hairerova dvojice { "8" }({ "5,3" }) s hustým výstupem reprodukuje DOP853 ze SciPy { "1.18.1" } krok po kroku (jeden krok s odchylkou do { "5.6e-15" }; shodné počty kroků v během e = { "0.7" } a Arenstorf, jedno převrácení přijetí/zamítnutí v { "501" } krocích na běhu LEO; koncové stavy do { "1.6e-12" }) a shoduje se s přesným řešením Keplera stejně dobře jako SciPy (<c5/>).

seg-345ae1eb05ec = Zonální harmonické pole J2–J6

seg-a88e67186e69 = <c1/>: <c2/> je kontrolováno třemi způsoby – <b>redukuje se na <c3/> ověřené 666 vektory s přesností stroje</b>, pokud se omezí na <c4/>; <b>shoduje se s numerickým gradientem vlastního zonálního potenciálu</b> přes celé pole J2..J6 (zlatý standard konzervativního pole); a liché členy <c5/> oproti sudým <c6/>/<c7/> vykazují charakteristickou severojižní (anti)symetrii při <c8/>. Propagovaná dráha J2..J6 zachovává celkovou energii s odchylkou ~{ "1e-8" } za den.

seg-5536986d9c8f = Gravitace třetího tělesa (Slunce a Měsíc)

seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>se shoduje s přesným gradientem svého rušivého potenciálu</b>, v geocentru zaniká a trefuje učebnicové velikosti pro LEO (~{ "5e-7" } m/s² Slunce, ~{ "1.1e-6" } m/s² Měsíc). Nízkopřesná efemerida Slunce Montenbruck–Gill trefuje ručně odvozené kotvy J2000 (vzdálenost v perihéliu ≈ { "1.471e11" } m, deklinace při slunovratu ~−{ "23" }°, pohyb ~{ "1" }°/den); efemerida Měsíce zůstává uvnitř své obálky perigea/apogea, obnovuje střední vzdálenost ~{ "384 400" } km, nikdy nepřekročí sklon { "5.3" }° a po jednom siderickém měsíci se vrací do { "1" }°. Zapojení pravé strany (RHS (right-hand side)) řízené epochou je <b>bitově přesné</b> (člen RHS se rovná <c4/> ve vzorkované poloze při t = { "0" } a t = { "1" } den) a posun epochy o čtvrt roku dává jinou trajektorii.

seg-9c8756f9d534 = Tlak slunečního záření (SRP) + kuželový stín

seg-e6110e015204 = <c1/>: <c2/> (dělová koule <c3/>) je <b>bitově shodné</b> s uzavřeným tvarem na plném slunci, ukotvuje <b>tlak záření na 1 AU (AU: astronomická jednotka) na ≈ { "4.5398e-6" } N/m²</b>, leží v pásmu LEO ~{ "1.36e-7" } m/s² a tlačí od Slunce, při zdvojnásobení vzdálenosti od Slunce se čtvrtí (nepřímá úměra druhé mocnině) a je <b>přesně nulové</b> hluboko v umbře. <c4/> dává <c5/> na plném slunci a <c6/> v úplné umbře (přesně), s hladkou monotónní polostínem rostoucím { "0" } → { "1" } přes pásmo <c7/>, které <b>přesahuje umbrální válec</b>.

seg-17b48db4038b = Atmosférický odpor (první člen závislý na rychlosti)

seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado, tabulka 8-4, po částech exponenciální) <b>se ukotvuje na { "1.225" } kg/m³ na úrovni moře</b>, pod povrchem se ořezává, v LEO klesá monotónně, ve výšce { "400" } km leží v pásmu ~{ "1e-12" } kg/m³ s fyzikálně obnovenou výškovou stupnicí ~{ "58" } km; <c3/> působí proti relativní rychlosti spolu rotující atmosféry s velikostí ~{ "2e-6" } m/s² typickou pro LEO. Rozhodující kontrola: dráha ve výšce { "300" } km ztrácí měrnou energii <b>monotónně</b> a její hlavní poloosa klesá ohraničeně o ~km/den, zatímco vakuový základ zachovává energii na < { "1e-9" }.

seg-133eed361425 = Relativistická korekce postnewtonovská (Schwarzschildova)

seg-c8e26480f148 = <c1/>: <c2/> (tvar IERS <c3/> <c4/>) se na kruhové dráze zhroutí na uzavřený tvar <c5/> (radiální, <b>směrem ven</b>, složky mimo osu přesně nulové), ukazuje učebnicový <b>poměr <c6/> k dvoutělesové úloze na LEO</b>, shoduje se s ručně zjednodušeným tvarem s radiální rychlostí <c7/> na < { "1e-12" } a v propagátoru <b>dráhu poruší, ale hlavní poloosu udrží pod metrem za den</b> – konzervativní opak úbytku způsobeného odporem.

seg-d39e75019595 = Poctivý rozsah: vydané výchozí <c1/> integrují zonální pole. Vysokostupňové <b>tesserální</b> pole EGM2008 (<c2/>, stupeň/řád { "70" }), pevninové/oceánské/atmosférické <b>slapy</b> (<c3/>) a člen strhávání rámce <b>Lense–Thirring</b> jsou nyní implementovány a zahrnuty do přesného modelu sil pro fitování efemerid (<c4/> – viz níže). Tesserální pole je rovněž volitelným členem Cowellova <c5/> (<c6/>, ve výchozím stavu vypnuto), ověřeným proti Orekit { "12.2" } <c7/> do stupně/řádu { "70" } ({ "6" } případů za { "24" } h, nejhorší |Δr| { "0.036" } m; <c8/>). Existují dva vyhodnocovače pole: historický <c9/> (sférické parciální derivace; platný do stupně ~{ "180" } mimo póly; výstupy zafixovány) a <c10/> (Holmes–Featherstone { "2002" }, modifikovaný dopředný sloupec, gradient bez 1/cos φ; platný do stupně { "2190" } na každé šířce). EGM2008 do { "2190" } se načítá za běhu (<c11/>, <c12/>, není přibaleno). <c13/> souhlasí s Orekit { "12.2" } na { "7.3e-17" } m/s² v osmi bodech do stupně { "2190" }; zůstává MODELLED, protože pyshtools nesplnil předregistrovaný práh poblíž pólu (kontrola v mpmath klade chybu do pyshtools; <c14/>). Dráha { "200" }×{ "200" } za { "24" } h souhlasí s Orekit na { "0.13" } m, ale její předregistrovaná kontrola citlivosti na stupeň 70 nebyla splněna ({ "0.73" } m < { "1" } m), takže stupně { "71" }–{ "200" } jsou na dráze charakterizovány, nikoli ověřeny (<c15/>). Termosférická hustota NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) je portována (<c16/>: bitově shodná s portem v C ve veřejné doméně na { "720" } bodech, v rámci relativní odchylky { "1.9e-6" } od pymsis, { "17" } zveřejněných testovacích případů reprodukováno; <c17/>) a je volitelnou vrstvou hustoty pro odpor (<c18/>, <c19/>; výchozí zůstává statický model Vallado). Tím se ověřuje port, nikoli přesnost modelu proti naměřené hustotě. Slunce a Měsíc z DE440 (DE: Development Ephemeris) jsou volitelnou efemeridovou vrstvou (<c20/>). Stín SRP oblé Země WGS-84 je volitelný (<c21/>), s poměrem osvětlení souhlasícím s Orekit { "12.2" } do { "7.4e-9" } přes { "2400" } geometrií (<c22/>); jeho varianta s okrajovým ztmavením nemá externí orákulum (MODELLED). Vrstva odporu NRLMSISE-00 souhlasí s vlastním odporem NRLMSISE-00 v Orekit { "12.2" } za { "24" } h na { "0.03" } m při posunu odporem až { "142" } km (<c23/>, VALIDATED za sdílených konvencí). Křížová kontrola s GMAT (General Mission Analysis Tool) zůstává navazujícím úkolem.

seg-46d06796e0e4 = Slapy na geopotenciálu (<c1/>)

seg-81b18c4caad3 = Časově proměnné korekce ΔC̄_nm, ΔS̄_nm ke Stokesovým koeficientům (IERS Conventions { "2010" }, kapitola { "6" }), ověřené proti číslům zveřejněným v samotných konvencích – nikoli proti jinému nástroji.

seg-78dc5baf4d9d = Příspěvek

seg-7c6c910bbf89 = Pevninový slap (IERS rov. { "6.6" } / 6.8b / { "6.14" })

seg-ac1dbcc895f0 = <c1/>: stálý (nulofrekvenční) slap ΔC̄₂₀ leží do { "1" } % od hodnoty zveřejněné IERS −{ "4.1736" }×{ "10" }⁻⁹ (anelastická Loveova čísla); <b>propracovaný příklad K1 v kroku 2 je reprodukován bit po bitu</b> (sin/cos amplitudy { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² s odchylkou { "0.1" }×{ "10" }⁻¹²); cesta normalizovaného Legendrova polynomu je ukotvena uzavřenými ručními hodnotami nezávislými na rekurenci.

seg-f2e2c5334721 = Oceánský slap (IERS rov. { "6.15" }, FES2004 (Finite Element Solution { "2004" }, atlas slapů), { "8" } složek)

seg-0369f153806f = Přibalená podmnožina FES2004 (<c1/> → <c2/>, parsování Doodson→násobitel) přesně reprodukuje zdrojové koeficienty M2 ({ "2,2" }); Doodsonova fáze K1 se rovná θ_g + π; velikost sektoriální složky stupně 2 je fyzikální a o řád menší než pevninový slap.

seg-52a19a291a41 = Atmosférický vzdušný slap S2 (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

seg-86b3d3a39bc7 = Přibalené harmonické členy Raye se převádějí vztahem povrchového zatížení (rov. { "6.21" }) na vrcholovou hodnotu ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % oceánského členu M2). Poctivá výhrada: <b>pro vzdušný slap neexistuje žádné zveřejněné orákulum koeficientů geopotenciálu</b>, a je tedy ověřen integritou zdroje + velikostí, což je slabší práh než u pevninových/oceánských slapů.

seg-63ac45ba51dc = Manévry a návrh trajektorie (<c1/>)

seg-a2ff4b0619d4 = Impulzní ΔV + propagace kovariance

seg-12f469864d28 = Skok rychlosti s dále neseným kovariančním členem { "6" }×{ "6" } (deterministické zážehy ⇒ jednotková STM (state-transition matrix); kovariance chyby provedení se otáčí ze soustavy zážehu – ECI (Earth-centred inertial) nebo LVLH (local vertical, local horizontal) – do bloku rychlosti).

seg-f3f0e4a7ec05 = Integrace konečného zážehu oproti Ciolkovského rovnici

seg-f7b35b7acdba = Integrace konstantního tahu po oblouku zážehu (hmotnost jako stav), jejíž dosažené ΔV se shoduje s uzavřenou raketovou rovnicí <b>Ciolkovského</b> s odchylkou <b>menší než { "0.01" } %</b>.

seg-46ae334a0604 = Zpětný převod řešiče Lambertovy úlohy (Izzo { "2015" })

seg-3e2b483cd1b7 = Výstup Lambertovy úlohy pro jednu otáčku (<c1/>, <c2/>, doba letu ⇒ <c3/>, <c4/>) je <b>převeden zpět přesným keplerovským propagátorem v univerzálních proměnných</b> – musí dopadnout zpět na <c5/>.

seg-04d69337acb3 = Průchod porkchop oproti Hohmannově spodní hranici

seg-fb5298b7983c = Minimum mřížky C3 startu × příletu / příletového V∞ se kontroluje proti <b>analytické spodní hranici C3 Hohmannova přechodu</b> pro dvě koplanární kruhové dráhy.

seg-bf2eb36e3eb6 = Řešič Lambertovy úlohy oproti nezávislé knihovně

seg-40511ea76e12 = <c1/>: { "13" } přechodů s jednou otáčkou od LEO přes GEO až po heliocentrické, prográdních i retrográdních, proti lamberthub { "1.0.0" } <c2/>; nejhorší rozdíl okrajové rychlosti { "7e-12" } m/s.

seg-164d7ea14d4e = Poctivý rozsah: žádný optimalizátor trajektorie, žádné větve Lambertovy úlohy s více otáčkami a syntetický koplanární kruhový heliocentrický model (žádná planetární efemerida DE, takže křížová kontrola C3 Země–Mars proti GMAT nebyla provedena).

seg-9d2d78ad22c4 = Určování oběžné dráhy (OD) (<c1/>, <c2/>)

seg-95d5ac7f6c29 = Dávkový korektor Gauss–Newton

seg-3fe29c4621b2 = Obecný řešič <c1/> dosáhne přesného řešení vážených nejmenších čtverců na lineárním fitu, obnoví skutečné parametry na nelineárním fitu <c2/> a vyřeší 3D multilateraci z vzdáleností bez šumu.

seg-b31d1ffa99b1 = Dávkové určování oběžné dráhy ze vzdáleností

seg-0b37139dffa9 = <c1/> obnoví <c2/> ze sledování vzdálenosti pozemními stanicemi (propagováno modelem sil dvoutělesové úlohy + J2) na <b>submetrovou přesnost / mm·s⁻¹ ze vzdáleností bez šumu</b> a na <b>~{ "2" } m s reziduem po fitu na úrovni šumového dna { "5" } m</b> – což je znak konzistentního fitu nejmenších čtverců.

seg-fb29199bf8bd = Sekvenční OD (s unscented filtrem)

seg-3c1f33052d48 = <c1/> rekurzivně obnoví stav s přesností na desítky metrů při téže dynamice a témž modelu vzdáleností.

seg-7a636cc9eef0 = Dávkové a sekvenční OD oproti nezávislému estimátoru

seg-68bf6e73c582 = <c1/>: { "8" } scénářů ({ "6" } bez šumu LEO/MEO/excentrické se { "3" }–{ "4" } stanicemi, { "2" } při σ = { "5" } m) proti dávkovým estimátorům nejmenších čtverců a Kalmanovým estimátorům z Orekit { "12.2" } na shodném modelu sil; nejhorší dávkové { "1e-3" } m / { "1e-6" } m/s, sekvenční { "0.9" } m.

seg-55a86bc79831 = | Dávkové OD z rychlosti změny vzdálenosti / az-el s elevační maskou | <c1/> (externí srovnání, jeden předregistrovaný práh nesplněn) | <c2/>: { "8" } scénářů proti dávkovým nejmenším čtvercům Orekit { "12.2" } s vlastními okamžitými geometrickými měřeními; viditelné množiny shodné, hodnoty měření do { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, matice přechodu stavu do { "1.2e-14" }, zašuměné stavy do { "1.74" } cm a RMS podle typu do { "2.7e-4" }; předregistrovaný práh pro stav bez šumu ≤ { "1" } cm je nesplněn u { "2" } ze { "4" } scénářů ({ "1.46" } a { "1.74" } cm; vlastní odhad Orekitu leží tak daleko od jeho simulované pravdy, odhad enginu kshana do { "1e-8" } m). Viz <c3/>. |

seg-35a85fb744cd = Poctivý rozsah: výukové OD používá pevné inerciální stanice, topocentrickou soustavu kulové Země a okamžitá geometrická měření (bez doby šíření světla, aberace, refrakce a rotace Země); matice přechodu stavu pro cestu rychlosti změny vzdálenosti/úhlů je variační (integrovaná RK4 s analytickými parciálními derivacemi dvoutělesové úlohy + J2), nikoli v uzavřeném tvaru; pro rychlost změny vzdálenosti ani úhly neexistuje sekvenční filtr. Cesta jen se vzdálenostmi si ponechává Jacobián z konečných diferencí. (Engine pro fitování efemerid s plnými silami níže nese vlastní variační matici přechodu stavu.)

seg-8f425e278f7c = Ověření modelu sil fitováním efemerid (<c1/>)

seg-9207d7139b87 = Přesný dávkový estimátor nejmenších čtverců z pozorování polohy s plnými silami: tesserální geopotenciál EGM2008 (vyhodnocovaný v soustavě pevné se Zemí přes redukci CIO) složený s třetím tělesem Slunce/Měsíc, SRP, odporem, relativitou Schwarzschild/Lense–Thirring GR (general relativity) a slapy výše, fitovaný na trasu inerciálních určení polohy s Jacobiánem tvořeným variační maticí přechodu stavu. Ověřeno na <b>syntetických</b> datech, kde pravdou je vlastní integrátor Kshana, takže každé reziduum patří estimátoru a ne dynamice.

seg-fc676106563e = Skladba přesného modelu sil

seg-57726d970436 = <c1/>: pole stupně 0 je v každé epoše přesná hmotnostní bodová hmota (centrální člen je invariantní vůči rotaci); stupeň 8 přidává zploštění pásma J2; člen třetího tělesa Slunce a slapový člen jsou zapojeny bitově věrně; konstantní radiální empirické zrychlení je v RTN (radiální, příčné, normálové) čistě radiální.

seg-98b036354077 = Variační matice přechodu stavu

seg-71787d9334db = Každý sloupec Φ přes půl oběhu LEO (geopotenciál stupně 8 + Slunce + Měsíc) souhlasí s nezávislou re-propagací <b>centrálními konečnými diferencemi (FD) přes celý oblouk</b> s <b>relativní odchylkou < { "1" }×{ "10" }⁻⁶</b> v odezvě polohy i rychlosti – zdokumentovaná křížová kontrola STM↔FD. Φ({ "0" }) = I; rozšířený a prostý propagátor souhlasí na submilimetrové úrovni.

seg-0b453776136b = Sebeobnova dávkových nejmenších čtverců

seg-c651db308332 = 1hodinový oblouk Kshana (stupeň 6 + Slunce + Měsíc) pozorovaný bez šumu je obnoven z posunu { "150" } m / { "0.1" } m·s⁻¹ na <b>stav epochy do { "1" }×{ "10" }⁻² m</b> s téměř nulovým RMS po fitu; při bílém šumu { "5" } m se 3D RMS po fitu ustálí na <b>úrovni šumového dna ~σ</b>, bez zkreslení. SRP <b>C_R je obnoveno z { "1.0" } s přesností do { "1" } %</b> od pravdy { "1.4" }.

seg-06bd2857f832 = Editace odlehlých hodnot a hlášení v RTN

seg-8b9dea5c0727 = Hrubá chyba { "500" } m je zamítnuta editací po fitu na 5 σ (právě jedno pozorování), takže zůstane čistý fit na milimetrové úrovni; rezidua se uvádějí rozložená na radiální/příčnou/normálovou složku i jako 3D.

seg-e3969a15df96 = Vrstva empirického zrychlení (RTN konstanta + 1-CPR (CPR: cycle-per-revolution))

seg-c46af7926511 = Devět empirických parametrů s omezením a priori zůstává pod { "1" }×{ "10" }⁻⁸ m·s⁻² na pravdě bez empirických členů, aniž by narušilo fit; konstantní příčné zrychlení { "3" }×{ "10" }⁻⁸ m·s⁻² vložené do pravdy je obnoveno s přesností do { "20" } %.

seg-fd79199b52d1 = Poctivý rozsah: syntetická vlna používá nominální parametry orientace Země (EOP: UT1 (Universal Time { "1" }, čas rotace Země) ≈ TT (Terrestrial Time), bez polárního pohybu) – přesné pro sebeobnovu, protože týž model oblouk generuje i fituje. Validace na datových sadách agentur vrství <b>skutečné</b> EOP finals2000A a pravdu SP3/SPK (SPK: planetární efemeridové jádro) nad tento engine přes řetězec soustav CIO (<c1/>, <c2/>, <c3/>, <c4/>).

seg-934f0f8e4f5f = Skutečné přesné dráhy agentur (<c1/>, <c2/>, <c3/>)

seg-721a27294813 = Galileo MEO – < { "5" } m GREEN

seg-14a2999d0739 = Engine Kshana s plnými silami fitovaný na doslovný výřez <b>vlastní finální dráhy ESA/ESOC (ESOC: European Space Operations Centre)</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) pro Galileo <b>E11</b> po dobu { "8" } h, každé určení v ITRF otočeno do GCRS pomocí skutečných EOP finals2000A: <b>3D RMS po fitu { "0.133" } m</b> čisté síly + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> s empirickou vrstvou, z hrubého překryvu { "78.7" } km. Úplný oblouk { "24" } h je <b>{ "0.611" } m</b>. Vše hluboko uvnitř prahu { "5" } m. Pole je gravitačně konvergované už při d/o-8 (shodné při d/o 8/10/12); úloha <c4/> spouští úplné d/o-70. Původ + SHA-256 (SHA: Secure Hash Algorithm) v <c5/>; úplný záznam v <c6/>.

seg-d5ed0783432e = Swarm-A LEO – < { "5" } m GREEN

seg-403b15ec1b9b = Engine s plnými silami (+ atmosférický odpor) fitovaný na doslovný výřez <b>vlastní redukovaně dynamické přesné dráhy Swarm-A od ESA</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) po dobu { "3" } h při d/o-70, skutečné EOP finals2000A přes řetězec CIO: <b>dynamická</b> vrstva (pouze stav, statická hustota, <c2/>={ "1" }) 3D RMS po fitu <b>{ "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m – reziduum ≈ čistý odpor ve směru dráhy), <b>redukovaně dynamická</b> vrstva (+ empirická zrychlení CPR) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) – ~{ "10" } cm oproti dráze ESA ~{ "2" } cm. Původ + SHA-256 v <c4/>; úplný záznam v <c5/>.

seg-3be5a6bee187 = Lunární LRO (Lunar Reconnaissance Orbiter) – ověřeno, nad { "5" } m (poctivě)

seg-d2be90186a89 = Fit modelu sil <b>vzhledem ke Měsíci</b> (<c1/>): gravitační pole GRAIL <b>GRGM660PRIM</b> (d/o { "100" }) v lunární soustavě pevné s tělesem v hlavních osách (<c2/>, IAU { "2015" } mean-Earth + pevný posun DE421 (Development Ephemeris { "421" }) mean-Earth → hlavní osy (ME→PA), aplikovaný, jak jej definuje SPICE, od verze { "0.36" }: do té doby se aplikoval opačným směrem, asi o { "208" }″ vedle) + třetí těleso Země/Slunce, fitované <em>týmž</em> obecným estimátorem Gauss–Newton jako datové sady Země na skutečnou rekonstruovanou dráhu <b>JPL Horizons LRO</b> (NAIF −{ "85" }), { "4" } h / { "241" } epoch, ~{ "98" } km. Poctivě po fitu ({ "0.36" }): <b>dynamicky { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>redukovaně dynamicky { "6.67" } m</b> (RTN 3.41/4.58/3.44, empirické { "1" }+2 na oběh), z hrubého překryvu { "39.9" } m (před opravou ME→PA: { "12.6" } m, { "6.65" } m, { "53.8" } m) – <b>nad</b> prahem < { "5" } m, nikoli kvůli estimátoru (shodné při d/o 100/150 a <c3/> 1e-6/1e-9). <b>Křížová validace na úrovni DE</b> (<c4/>: lunární orientace v hlavních osách DE440 (Development Ephemeris { "440" }) + efemerida DE440 přes ANISE) <b>opravila</b> tvrzení o limitujícím faktoru – dala { "12.0" } m dynamicky a { "6.67" } m redukovaně dynamicky, čemuž opravený analytický zásobník nyní odpovídá v obou vrstvách (dřívější dynamická mezera, { "12.6" } → { "12.0" } m, byla chyba posunu ME→PA), takže provozní spodní hranicí <b>není</b> analytická orientace/efemerida, nýbrž reziduum nesnížitelné v empirické vrstvě (nejlépe odpovídající nemodelované negravitační dynamice LRO na krátkém oblouku); štíhlý analytický zásobník už odpovídá úrovni DE pro redukovaně dynamickou dráhu. Původ + SHA-256 v <c5/>; úplný záznam v <c6/>. <b>Ověřeno proti skutečné pravdě agentur: { "3" } ze { "3" }; splnění < { "5" } m: { "2" } ze { "3" }.</b>

seg-3d3cbf5f043d = Navigace podle gravitační mapy / alt-PNT (<c1/>, <c2/>, <c3/>, <c4/>)

seg-89f2cbf55842 = Sférickoharmonické pole gravitačních anomálií

seg-76cae5c530f2 = <c1/>: pole nízkého stupně, plně normalizované, kontrolované proti uzavřeným Legendrovým funkcím (<c2/>, <c3/>, <c4/>) a ručně odvozené jednočlenné anomálii { "1.897" } mGal.

seg-f00f82b70e6e = Model měření studeného atomového gravimetru

seg-49090598c525 = Úroveň bílého šumu je odvozena z ASD akcelerometru CAI (<c1/>) a vložena jako deterministická sekvence se seedem (porovnávač nikdy nedostane pravdu bez šumu, a přesto je běh bitově reprodukovatelný).

seg-0556db62c45f = Částicový filtr se sekvenčním váženým převzorkováním

seg-3df4251aedbd = <c1/>: deterministické jádro je ukotveno přesně – ESS (effective sample size) v rozsahu { "1" }…N, systematické převzorkování vybírající indexy úměrně váze, konvexní kombinace váženého průměru, gaussovská věrohodnost přitahující odhad k měření a determinismus predikce se seedem.

seg-7dca80b16a00 = Věrohodnost shody s mapou + obnova

seg-eb40ab2607ae = <c1/>: <c2/> dosahuje vrcholu (= { "1" }) při dokonalé shodě a klesá na <c3/> při jedné sigmě; částicový filtr nad výraznou záplatou syntetického terénu obnoví skutečnou polohu s přesností do { "0.1" }.

seg-446d9f03a860 = 60minutový benchmark bez GPS

seg-ed29fb24d9d5 = <c1/> (<c2/>): výpadek ~{ "700" } km / jedna hodina, při němž inerciální řešení driftuje na <b>≈ { "70" } km</b>, je hierarchickým porovnávačem od hrubého k jemnému obnoven na <b>≈ { "145" } m (< { "500" } m)</b> – bitově reprodukovatelně, stabilně napříč realizacemi šumu a prokazatelně omezeně zjemňováním (samotná hrubá mřížka uvázne na ~{ "2" } km).

seg-81a2963c26cc = Načítač DEM (digital elevation model) SRTM (Shuttle Radar Topography Mission) <c1/> + bilineární vzorkování (ORÁKULUM A)

seg-5e7bbf951faf = <c1/> / <c2/>: ručně sestavený <c3/> buffer { "2" }×{ "2" } s rohy [{ "100,200" };{ "300,400" }] se bilineárně interpoluje přesně na <b>{ "250.0" }</b> ve středu buňky (orákulum v uzavřeném tvaru), 16bitový zpětný převod big-endian je přesný a převrácení řádků umisťuje nejsevernější řádek souboru na nejvyšší uloženou šířku – vše proti <b>specifikaci ovladače GDAL (Geospatial Data Abstraction Library) SRTMHGT (Shuttle Radar Topography Mission height-file format)</b> (16bitové se znaménkem big-endian, po řádcích, severní řádek první, prázdná hodnota -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Odevzdaná fixtura { "11" }×{ "11" } (<c4/>) prověřuje parser v CI; a <b>odevzdaná skutečná dlaždice NASA/USGS (USGS: United States Geological Survey) SRTM v3 ve veřejné doméně</b> (N36W117, Death Valley, decimovaná na 6 obloukových sekund, { "722" } KB, <c5/>) se v CI čte (neignorovaná, <c6/>) a umisťuje <b>Badwater Basin na ≈ −{ "78" } m v dokumentovaném pásmu [−{ "95" },−{ "70" }] m</b> (měření NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) ≈ −{ "86" } m) s maximem dlaždice ≈ { "2161" } m – zdrojem pravdy je měření, testuje se DEM (nikoli kruhem). Větší zveřejněné výškové body (Mount Whitney { "4421" } m) zůstávají v testech celých dlaždic za bránou <c7/>.

seg-80f985ea3e11 = Konvergence terénní navigace (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) (ORÁKULUM B)

seg-9ad7bf3a8c3e = <c1/> (<c2/>): <b>ručně odvozený</b> vložený drift INS ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km při ~{ "12" }° š., vypočteno jako drift° × M_na_stupeň × cos šířky) je obnoven na <b>< { "500" } m</b> (v rámci spodní hranice rozlišení mřížky <c3/>), tedy více než { "100" }násobné snížení oproti volné inerciální navigaci – kontrolováno proti <em>vloženému</em> číslu, nikdy proti DEM (nikoli kruhem), bitově reprodukovatelné a stabilní napříč seedy šumu.

seg-5b7c1dc72436 = Zisk fúze gravitace + magnetismu + terénu (ORÁKULUM C)

seg-7e3818f2ee2b = <c1/> (<c2/>): tři skalární kanály (Δg · krustální anomálie |B| · výška) sloučené jako součin věrohodností dávají <b>ohraničené reziduum < { "500" } m</b> během 60minutového výpadku, které je po zprůměrování přes seedy <b>ne horší než nejlepší jednotlivý kanál</b> (aditivita informace / nižší CRLB (Cramér–Rao lower bound)). Leží v zveřejněném režimu TERCOM / terénní referenční navigace (TRN) „desítky metrů“ CEP (circular error probable) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: error-state Kalman filter), <a2>https://peerj.com/articles/cs-3118/</a2>).

seg-fe23ff839bce = Poctivý rozsah: gravitační pole je nízkého stupně + syntetické mascony, <b>nikoli</b> úplná sada koeficientů EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques); magnetický kanál se opírá o hladké hlavní pole IGRF plus <b>syntetické</b> mascony krustálních anomálií (skutečná vysokofrekvenční krustální mapa je navazující úkol); terénní pole v CI pro benchmarky <em>navigačního určení polohy</em> je samostatný syntetický DEM, zatímco samotný čtečka <c1/> je nyní v CI ověřena proti odevzdané skutečné dlaždici SRTM v3 (výše); skutečné dlaždice v plném rozlišení zůstávají za bránou <c2/>. Monte Carlo chyby reprezentace mapy zůstává navazujícím úkolem. Všechny tři navigátory jsou nyní zapojeny do enginu scénářů přes <c3/> (<c4/>, <c5/>, <c6/>).

seg-d9f7e199e5d0 = Model chyb INS / IMU – ověření vztažené k datovým listům (<c1/>)

seg-48266c2faaed = Stochastický model chyb IMU je ověřen proti <b>zveřejněným specifikacím datových listů výrobců / datových sad</b> – nikdy proti hodnotě, kterou vyprodukovala sama Kshana. Most od specifikace v polních jednotkách k šumovému modelu v SI (International System of Units) tvoří standardní identifikace přes Allanovu odchylku (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): koeficient náhodné procházky <c1/> je překrývající se ADEV odečtená při τ = { "1" } s na sklonu τ⁻¹ᐟ² a koeficient nestability předpětí je plochá Allanova plošina (<c2/>, hermeticky – bez stahování).

seg-702de63000d2 = Důkaz / orákulum

seg-c3fed48b98b1 = Vrstva převodu jednotek (riziko nekruhovosti č. 1)

seg-6cdc88d36bfd = Ručně ověřeno: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

seg-75afa5abcd08 = Úhlová náhodná procházka gyroskopu

seg-d5fd60857e4d = ADIS16465 ARW { "0.15" } deg/√hr (datový list Analog Devices) obnoveno z ADEV({ "1" } s) na < { "5" }%.

seg-c5e2d361b83f = Rychlostní náhodná procházka akcelerometru

seg-4413d3bb39b4 = ADIS16465 VRW { "0.1" } m/s/√hr obnoveno na < { "5" }%.

seg-ebeb0bb0e0fb = Allanův sklon bílého šumu

seg-f674ce82dc2c = ADIS16460 bílá větev, log-log sklon −{ "0.5" } ± { "0.05" }.

seg-40afd130f31d = Plošina nestability předpětí za chodu

seg-94acb18a94cb = Nestabilita předpětí gyroskopu ADIS16465 (BI) { "2.0" } deg/hr obnovena jako plochý Allanův minimum na < { "15" }%.

seg-b359e0e92e20 = Druhý profil IMU

seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) obojí obnoveno na < { "5" }%.

seg-fea9287d6533 = Poctivý rozsah: toto ověřuje <b>stochastický model chyb</b> proti Allanovým koeficientům z datových listů. Datová sada vozidla i2Nav-WHU (WHU: Wuhan University) <b>KF-GINS</b> se používá jako samostatná kontrola řízená dostupností dat: volně vázaný uzavřený EKF chybového stavu s modelem páky GNSS je řádek VALIDATED <a1>verifikační matice</a1> (<em>Volně vázaný EKF GNSS/INS s pákou na datové sadě KF-GINS</em>), porovnávaný s referenční trajektorií KF-GINS v C++ podle prahů zaregistrovaných před během. Běží jen tam, kde je datová sada dodána (<c1/>); bez ní běží syntetický načítač a testy páky. Těsně vázané varianty a varianty s fází nosné tento řádek nepokrývá (řádek těsně vázaného GNSS/INS s fází nosné je MODELLED).

seg-f0ab98c1a79d = Hluboký vesmír a PNT na Marsu – základ D0 (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-bd222b27949c = První milník enginu pro navigaci v hlubokém vesmíru: zobecnění jádra napevno vázaného na Zemi na libovolné centrální těleso, přidání dynamiky Marsu, rozhraní poskytovatele efemerid, času pod mikrosekundu a primitiv doby šíření světla / relativistického zpoždění. <b>Každý existující scénář Země je bajt po bajtu shodný</b> – zlaté reference reprodukovatelnosti napříč platformami (<c1/>, <c2/>) procházejí beze změny bez regenerace, vynuceno při každém commitu.

seg-e0cdbfcbb28a = Abstrakce centrálního tělesa (Země bajt po bajtu shodná)

seg-7d20649189fa = <c1/>: <c2/> s <c3/>. <c4/> ověřuje, že <c5/> a <c6/> se rovnají starším funkcím pro Zemi s <b>přesnou bitovou shodou</b> (<c7/>), a oblouk Země s výchozím <c8/> je bajt po bajtu shodný – zlaté reference reprodukovatelnosti jsou beze změny (stejné SHA, bez regenerace).

seg-658acc8112e3 = Gravitace Marsu (GMM-3 (GMM: Goddard Mars Model) tesserální, pevná s tělesem)

seg-9b058665cf4b = <c1/>: zonální členy C̄20/C̄30/C̄{ "40" } z MRO110 (gravitační řešení Mars Reconnaissance Orbiter) J2/J3/J4 (<c2/>, J2 se zpětným převodem vrací na { "1.9604e-3" }) + sektoriální/tesserální členy MRO110B2 C̄22/S̄{ "22" }, C̄32/S̄{ "32" } (Konopliv a kol. { "2011" }; tabelováno v Liu, Baoyin & Ma { "2012" }), vyhodnocené v soustavě IAU pevné s Marsem. <c3/> kontroluje zpětný převod, odchylku v měřítku J2 od hmotného bodu a že pole je skutečně pevné s tělesem (přeorientování o čtvrt marsovského dne mění inerciální zrychlení). Vyšší stupeň/řád se načítá z přibaleného <c4/> přes <c5/>.

seg-1dcbee768418 = Soustava pevná s Marsem (pól IAU)

seg-0708e5b37d69 = <c1/>: rotace IAU 3-1-3 <c2/> (konvence WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), tatáž jako <c3/>). Testy: ortonormální do { "1e-12" } s det +{ "1" }, identita zpětného převodu, hlavní poledník postupuje o <c4/> za den.

seg-5b6355a143c7 = Propagace vzhledem k Marsu / Slunci

seg-4ab87f666765 = <c1/> (vnitřní konzistence)

seg-12e3d173340b = <c1/>: nízká oběžná dráha kolem Marsu se po jedné keplerovské periodě vrací na začátek (uzavření); měrná energie ε=v²/2−μ/r driftuje < { "1e-9" } přes oblouk; sekulární nodální regrese Mars-J2 souhlasí s analytickou Valladovou rychlostí (nezávisle vypočtenou ≈ −{ "5.15" } °/den při sklonu { "60" }°) na { "3" }%; heliocentrická dráha obnoví ~687denní marsovský rok (vis-viva + nezávislé obnovení periody z oblouku). Žádná externí data.

seg-acff4c016089 = Křížová validace DE440 (heliocentrický Mars)

seg-ed164e298754 = <c1/> (VYLOUČENO z workspace; ANISE s MPL-2.0 uzavřen ve vlastním Cargo.lock; zrcadlí <c2/>): porovnává sluncocentrickou propagaci Marsu v Kshana proti JPL DE440 (přes ANISE), pravda z Horizons citována doslovně (původ + SHA-256). <b>Reprodukovaný výsledek</b> (výchozí JD (Julian date) { "2459580.5" } TDB (Barycentric Dynamical Time), <c3/> SHA-256 <c4/>): reziduum polohy <b>{ "137" } m při 1denním oblouku</b> ({ "5.97" }×{ "10" }⁻¹⁰ heliocentrické vzdálenosti { "2.299" }×10¹¹ m), rostoucí na { "3.3" } km při { "5" } d, { "87.9" } km při { "30" } d, { "1.71" } Mm při { "90" } d – reziduum <em>roste</em> s délkou oblouku, protože sluncocentrický dvoutělesový model záměrně vynechává planetární poruchy (zejména Jupiteru) a vnitřní pohyb v systému Marsu, který nese barycentrická efemerida DE440, takže růst je poctivým znakem nemodelované dynamiky n těles, nikoli chyby integrátoru; krátký oblouk, který zůstává nepatrným zlomkem heliocentrické vzdálenosti, potvrzuje, že sluncocentrický aparát je správný. Běží jen tehdy, je-li přítomno jádro DE440 (<c5/>, nebo automaticky stažených ~{ "32" } MB) – manuální kontrola / <c6/> na úrovni DE, <b>nikoli</b> výchozí brána CI, takže publikovaný crate a každá výchozí brána zůstávají bajt po bajtu nedotčeny.

seg-a7d79066a53b = Doba šíření světla + Shapirovo zpoždění

seg-798148171dab = <c1/>: iterativní řešení doby šíření světla v retardované epoše (konverguje |Δτ|<{ "1e-12" } s, s horní mezí) a Shapirovo zpoždění Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Testy: Země–Slunce ≈ { "499" } s a Země–Měsíc ≈ { "1.28" } s přes vestavěnou efemeridu; syntetický emitor s konstantní rychlostí obnoví analytické retardované řešení na <{ "1e-9" } s (řešič prokazatelně nezávislý na jakékoli skutečné efemeridě); Shapiro se přesně shoduje s ručně vypočtenou hodnotou a dává ~{ "100" }–{ "250" } µs pro paprsek s dotykem při horní konjunkci Země–Mars.

seg-1bc28f6bdc8f = Rozhraní poskytovatele efemerid

seg-34d6a07ad252 = <c1/>: <c2/> + <c3/> bez jader (Montenbruck–Gill Slunce/Měsíc, geocentricky); pro tělesa, pro něž nemá řadu (např. Mars), vrací <c4/>, a pro ně slouží poskytovatel ANISE na úrovni DE – stejné rozdělení vestavěné efemeridy a ANISE jako u <c5/>/<c6/>.

seg-5e1fed7a98c0 = Dvoudílný čas + TT↔TDB

seg-5ebca9b5f2db = <c1/>: <c2/> s Knuthovou akumulací two-sum obnovuje intervaly pod mikrosekundu, které jednoduché JD v f64 poblíž J2000 ztrácí (>{ "1000" }× lépe, testováno); <c3/>/<c4/> používají dominantní periodické řady Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, ručně ověřeno v J2000). Aditivní – stávající cesta času s jedním f64 je beze změny.

seg-d2da2e1d1711 = Radiometrické observable hlubokého vesmíru a zpráva CCSDS Tracking Data Message – D1 (<c1/>, <c2/>)

seg-b98f508f2375 = Druhý milník enginu pro navigaci v hlubokém vesmíru: <b>model observable</b>, který mění jádro doby šíření světla / relativistického zpoždění z D0 na skutečné veličiny, jaké hlásí průchod sledovaný sítí Deep Space Network (DSN) nebo ESTRACK (European Space Tracking network) – vzdálenost, jedno-/dvou-/třícestný Doppler, koherentní obrat transpondéru, regenerativní měření vzdálenosti/PN (PN: pseudo-noise), Δ-DOR (DOR: differential one-way ranging) a prostředí šíření – plus vstup/výstup <b>CCSDS (Consultative Committee for Space Data Systems) 503.0-B Tracking Data Message (TDM)</b>, který načítá/vydává standardní sledovací soubor agentur. <b>Poctivý rozsah:</b> jde o <b>přesné geometrické modely</b> podle konvencí Moyer / CCSDS; <em>šum</em> měření je <c1/> dodávané volajícím pro každé pozorování, nikoli zabudované v modelu. Reprodukce <em>konkrétního skutečného průchodu sledování</em> vyžaduje skutečná data TDM plus řešič určování oběžné dráhy v hlubokém vesmíru – to je <b>D2</b>, nikoli D1. Vše níže je aditivní (zlaté reference reprodukovatelnosti jsou beze změny; stejné SHA, bez regenerace).

seg-d1d2dc7906c8 = Vzdálenost a 1/2/3cestný Doppler (dvouetapové řešení Moyer)

seg-e2176b844df8 = <c1/>: <c2/>/<c3/> skládají retardovaná (sestupná větev) a předstihová (vzestupná větev) řešení doby šíření světla z D0; konvence úplné cesty tam a zpět je <c4/> (m), zdokumentovaná a konzistentní. <c5/>/<c6/>/<c7/> tvoří posun nosné <c8/> (Hz) z rychlosti změny vzdálenosti ve směru zorné osy, <b>konvence znaménka: přibližující se kosmická loď dává kladný (modrý) posun</b>. Testy: dvoucestná vzdálenost = součet úseků s odchylkou <{ "1" } mm (~{ "2" } AU oběh Země–Slunce tam a zpět); jednocestná vzdálenost = <c9/> přesně; jednocestný Doppler se shoduje s analytickým <c10/> pro radiální emitor s konstantní rychlostí na ppt; třícestný se stanicemi na stejném místě se bajt po bajtu zhroutí na dvoucestný.

seg-638697be5b5b = Koherentní obrat transpondéru (přesné poměry DSN)

seg-781aa4041c58 = <c1/>: přesná racionální čísla obratu DSN/CCSDS <c2/> (Moyer §{ "13" }; DSN 810-005 modul 201/214) – S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testováno na přesnou rovnost; nedefinovaná dvojice pásem <b>vyvolá panic</b> (selže nahlas, poměr si nikdy nevymýšlí). <c3/> aplikuje nosnou pásma + poměr od začátku do konce a rovná se explicitnímu <c4/> s přesností stroje.

seg-f24f9da1570c = Regenerativní / PN měření vzdálenosti (CCSDS { "414" }; nejednoznačnost)

seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (jednoznačný dosah v měřítku rozlišení na čip) a <c4/> = to × délka kódu (úplný jednoznačný dosah kódu PN <c5/>) podle CCSDS 414.1-B. Testováno: rozsahové hodiny { "1" } MHz dávají ~{ "149.9" } m; kód PN s váženým hlasováním podle CCSDS-414.1 ({ "1 009 470" } čipů) při { "1" } Mchip/s dává návrhový jednoznačný dosah ~{ "151 000" } km; zdvojnásobení čipové rychlosti zpolovičí nejednoznačnost na čip.

seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" }, rovina oblohy)

seg-93055e944306 = <c1/>: diferenciální zpoždění v rovině oblohy <c2/> (s) pro interferometrickou základnu <c3/> (CCSDS 506.1-B). Testováno: shoduje se s přesnou analytickou projekcí <c4/> pro známý posun zarovnaný se základnou na { "1e-15" } s, s velikostí v malých úhlech <c5/> a s <b>nulou</b> (kosmická loď zarovnaná s kvasarem dává přesně nulové diferenciální zpoždění).

seg-4e5258bb04d5 = Dvoufrekvenční kalibrace plazmatu 1/f²

seg-e3b340103825 = <c1/>: <c2/> = <c3/> (disperzní <c4/> skupinové zpoždění nabitých částic, <c5/>); <c6/> sloupec koróny <c7/> třídy Cassini (analytická náhrada, nikoli kalibrovaná koróna); <c8/> disperzní inverze <c9/>, kterou DSN používá k odstranění plazmatu. Testováno: zákon 1/f² <c10/>; koróna roste směrem ke konjunkci; a <b>vložený TEC je obnoven na <{ "1" } %</b> (ve skutečnosti ≪ { "1e-9" } bez šumu) – <c11/>.

seg-e1e265ab499a = Média tropo / iono (využití modelů GNSS)

seg-2d9aa52f318b = <c1/>/<c2/>: pozemní segment hlubokého vesmíru prochází toutéž zemskou atmosférou, kterou balíček GNSS již modeluje, takže tyto funkce delegují na <c3/> (Saastamoinen-zenit + mapování Niell, nedisperzní) a <c4/> (vysílaná iono). Testováno zapojení a fyzikální znaménka: tropo kladné a větší při nízké elevaci než v zenitu; iono nezáporné šikmé zpoždění (numerická věrnost patří k vlastním testům balíčku GNSS vztaženým k datovým listům).

seg-44ba6e0411fd = Parsování / vydávání CCSDS-TDM { "503" } + radiometrický most

seg-18eafe936dcb = <c1/>: čtečka <b>i</b> zapisovač CCSDS 503.0-B-2 KVN (keyword-value notation) (hlavička + segmenty <c2/> / <c3/>; záznamy <c4/>/<c5/>/<c6/>/<c7/>). Testy (<c8/> + <c9/>): referenční fixtura se parsuje na očekávaná pojmenovaná pole; <b>parsování→vydání→parsování dává stejnou strukturu</b> (sémantický zpětný převod); most <c10/> mapuje jednoznačné záznamy <c11/>/<c12/> na <c13/> (cesta z <c14/> <c15/>/<c16/>/<c17/>, pásmo z <c18/>, km→m); soubor s více segmenty vynuluje stavový automat. <b>Poctivé přeskočit-nehádat:</b> úhly/frekvence, neznámá pásma, epochy ve formě dne v roce a nerozpoznané časové soustavy se <b>přeskočí</b>, nikdy se chybně nenamapují, a <c19/> se ponechá <c20/> pro vážení volajícím.

seg-e8ca55dd29b1 = Benchmark DSN/ESTRACK (preciznost modelu ≫ zveřejněná spodní hranice)

seg-247b9e7b2be8 = <c1/>: observable jsou přesné geometrické výpočty, takže poctivým benchmarkem je, že <b>vlastní numerická chyba modelu je hluboko pod zveřejněnou spodní hranicí měření DSN/ESTRACK</b> – úzkým hrdlem přesnosti není model, nýbrž σ dodané volajícím. Každý test vypočte observable dvěma nezávislými způsoby (nebo obnoví vloženou pravdu) a ověří, že reziduum je pod spodní hranicí: <b>vzdálenost</b> se zpětným převodem vrací na <{ "1" } mm ≪ ~{ "1" } m spodní hranice měření vzdálenosti PN (DSN 810-005 mod. { "214" } / CCSDS 414.1-B); <b>Doppler</b> se shoduje s přesnou uzavřenou rychlostí změny retardované vzdálenosti <c2/> na ~{ "10" }⁻⁶ m/s, několikanásobně pod spodní hranicí ~{ "0.05" } mm/s v pásmu X (DSN 810-005 mod. { "203" } / Moyer) – reziduum je spodní hranice diferencování vzdálenosti v f64 při ~{ "1" } AU, numerická charakteristika, nikoli chyba modelování; <b>Δ-DOR</b> reprodukuje uzavřenou projekci s ekvivalentním úhlem v rovině oblohy ≪ { "1" } nrad ≪ spodní hranice ~{ "1" }–{ "10" } nrad (DSN 810-005 mod. { "210" } / CCSDS 506.1-B); dvoufrekvenční <b>plazma</b> obnoví vložené zpoždění na ≪ { "1" } %; a zpoždění <b>Shapiro</b> leží ve zveřejněném pásmu ~{ "100" }–{ "250" } µs pro konjunkci Země–Mars. Zveřejněné údaje jsou uvedeny a označeny jako specifikace DSN <b>řádového charakteru</b>, nikoli vymyšlená přesná čísla, a dokumentace modulu výslovně uvádí, že toto je benchmark PRECIZNOSTI MODELU, nikoli reprodukce skutečného průchodu (to je D2 + skutečná TDM).

seg-2a25e6a8a5b1 = Redukovaně dynamické OD v hlubokém vesmíru – D2 (<c1/>, <c2/>, <c3/>)

seg-0d7a1b75a0ea = Třetí milník enginu pro navigaci v hlubokém vesmíru: <b>estimátor</b>, který mění radiometrické observable z D1 na obnovenou trajektorii – numericky robustní filtr Square-Root Information Filter (SRIF) s redukovaně dynamickými empirickými zrychleními, třístavovým stavem palubních hodin, modelem odporu na Marsu a radiometrickými parciálními derivacemi, které spojují vzdálenost/Doppler se stavem filtru, uzavřený od začátku do konce syntetickým obnovením určení oběžné dráhy nízké oběžné dráhy kolem Marsu (LMO). <b>Poctivý rozsah:</b> obnovení je <b>syntetická uzavřená smyčka</b> (pravda a filtr sdílejí týž propagátor Marsu a pozorování jsou tentýž geometrický model observable, který filtr invertuje, plus vložený gaussovský šum) – ověřuje <b>aparát estimátoru</b>, nikoli absolutní věrnost modelu sil Marsu; externí křížová kontrola na úrovni DE je crate <c1/> řízený dostupností jádra (D0.8b). Vše níže je aditivní (zlaté reference reprodukovatelnosti jsou beze změny; stejné SHA, bez regenerace).

seg-51f203291066 = Jádro SRIF (square-root information filter)

seg-9d5fd8c1d37d = <c1/>: ručně napsaný odmocninový informační filtr Biermanova typu – horní trojúhelníková <c2/> s <c3/>, informační vektor <c4/>, aktualizace měření/času Householderovou metodou, aritmetika holého <c5/> (bez nalgebra). Testy: sekvenční SRIF se shoduje s řešením dávkových vážených nejmenších čtverců (<c6/>) <b>ve stavu i kovarianci na { "1e-9" }</b> na navrženém lineárně gaussovském problému (<c7/>); obnovená kovariance <c8/> je po dlouhé posloupnosti aktualizací měření/času <b>symetrická ({ "1e-12" }) a z konstrukce kladně definitní</b> (<c9/>, Choleského rozklad uspěje); a informace se hromadí (stopa <c10/> monotónně klesá, jak se zahrnují měření se shodnou geometrií).

seg-f9ffa1ef4688 = Redukovaně dynamická empirická zrychlení (ladění plavba↔LMO)

seg-b0612a7140c3 = <c1/>: devítistavový filtr <c2/> s empirickými zrychleními RTN jako stavy procesu Gauss–Markov prvního řádu, redukovaně dynamická technika JPL/ESOC zpřístupněná jako jediný knoflík <c3/> (téměř dynamický ⇒ vyhlazuje šum na balistickém oblouku; téměř kinematický ⇒ empirická vrstva pohltí nemodelovaný manévr/odpor). Testy: téměř kinematický filtr sleduje <b>skokový (tryskový) manévr</b> s reziduem <½ oproti téměř dynamickému, zatímco téměř dynamický filtr <b>vyhlazuje zašuměný balistický oblouk</b> lépe (<c4/>); změna těsnosti posouvá reziduum po fitu <b>monotónně</b>, jde o kontinuum, nikoli přepínač (<c5/>).

seg-9d5db4d63990 = 3stavové palubní hodiny (fáze/frekvence/drift, van Loan Q, Allan)

seg-fe5beef74e24 = <c1/>: chybový stav fáze + relativní frekvence + driftu frekvence s <b>přesným diskrétním procesním šumem van Loana</b> a Josephovou stabilizovanou aktualizací. Testy: diskretizované <c2/> se shoduje s ručně odvozeným van Loanovým polynomem <b>na { "1e-12" }</b> a <b>přesně se redukuje na dvoustavové Q KalmanClock, když drift = { "0" }</b> (striktní nadmnožina); vícekrokové doběhnutí zvětšuje rozptyl fáze podle analytického vztahu holdover z NIST SP { "1065" } přes člen náhodného běhu <c3/>; stav driftu <b>obnoví skutečnou rampu stárnutí na <{ "5" } %</b>; <b>profil Allan třídy USO je obnoven</b> (překrývající se ADEV při τ={ "1" } s v rámci kalibrační brány) a estimátor zůstává konzistentní podle NEES (>{ "95" } % uvnitř 3σ) a PSD i během běhu s tvrdým <c4/>. <c5/> nese citované hodnoty CSAC/USO/DSAC (USO: ultra-stable oscillator; DSAC: Deep Space Atomic Clock) <c6/> a spodní hranici Doppleru <c7/>.

seg-8666d18daa2b = Atmosférický odpor na Marsu (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

seg-6a64c2b9e553 = <c1/>: po částech exponenciální profil neutrální hustoty Marsu (povrch ~{ "0.020" } kg/m³, výšková stupnice u povrchu ~{ "11" } km, nízkoprachový průměr Mars-GRAM { "2010" } / MCD (Mars Climate Database)) a kvadratické zrychlení odporu vztažené k atmosféře Marsu <b>rotující spolu s planetou</b>, plus varianta <c2/>, kterou může SRIF násobit. Testy: hustota klesá monotónně a spojitě napříč pásmy, obnovená výšková stupnice u povrchu je fyzikální ~{ "11" } km, odpor je <b>přísně antiparalelní k relativní rychlosti</b> (vektorový součin zaniká na { "1e-12" }) s rozumnou velikostí ~{ "3e-4" } m/s² na LMO a je lineární v balistickém členu. <b>Poctivý rozsah:</b> reprezentativní inženýrská atmosféra, nikoli letově ověřený Mars-GRAM/MCD se závislostí na prachu/ročním období/místním čase.

seg-452f32dace80 = Radiometrické parciální derivace měření (vzdálenost/Doppler) pro SRIF

seg-6661d241cdaf = <c1/> / <c2/>: parciální derivace vzdálenosti <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) a rychlosti změny vzdálenosti <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) ve směru zorné osy, které spojují observable z D1 se stavem filtru, plus parciální derivace frekvence hodin pro jednocestný Doppler <c5/>. Testy: obě parciální derivace se shodují s <b>centrální konečnou diferencí observable na { "1e-6" }</b> (<c6/>, <c7/>); jediná aktualizace vzdálenosti <b>zmenší kovarianci v pozorovaném směru (zorná osa, LOS) o ≫{ "1000" }×</b> a ponechá ji kladně definitní (PD) a aktualizace Dopplerem zmenší rozptyl <b>rychlosti</b> ve směru LOS (<c8/>, <c9/>).

seg-9a2cb6292477 = Úplné OD na Marsu/LMO z radiometrických dat

seg-6318968b683a = <c1/>: pravdivý oblouk nízké oběžné dráhy kolem Marsu propagovaný s gravitací <c2/> generuje zašuměnou dvoucestnou <b>vzdálenost (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> vůči dvěma sledovacím stanicím; redukovaně dynamický SRIF ji obnoví z počátečního stavu <b>vychýleného o ~{ "2.7" } km</b>. Dosaženo: konvergovaná poloha <b>RMS ≈ { "0.2" } m</b> (submetrově, hluboko uvnitř kritéria metry až desítky metrů) na oblouku se 3 oběhy a kadencí { "30" } s, s <b>faktorizovanou kovariancí kladně definitní v každé epoše</b> (záruka SRIF, ověřováno po celou dobu). <b>Kontinuum ladění plavba→LMO</b> je prověřeno od začátku do konce: s pravdou s nemodelovaným odporem, který šablona filtru nemá, se redukovaně dynamický knoflík (těsnost { "1" }) obnoví na ~{ "14" } m oproti ~{ "677" } m u téměř dynamického běhu (těsnost { "0" }) – zlepšení { "48" }× tím, že empirická vrstva pohltí odpor. <b>Poctivý rozsah:</b> syntetická uzavřená smyčka (pravda = týž propagátor, jaký filtr používá); externí křížová kontrola na úrovni DE je <c3/> řízená dostupností jádra (D0.8b), zde nikdy nespuštěná, bez sítě.

seg-559176eb1a82 = Scénář PNT v hlubokém vesmíru a fúze jednocestného + dvoucestného měření – D3 (<c1/>, <c2/>)

seg-bdb5da496071 = Čtvrtý milník enginu pro navigaci v hlubokém vesmíru: spustitelný <b>produktový scénář Mars-PNT</b>, který spojuje těleso/soustavu Marsu z D0, radiometrické observable z D1 a redukovaně dynamické OD z D2 do jediného druhu scénáře <c1/>. Modeluje malou <b>konstelaci reléí ve stylu MARCONI</b>, která vysílá jednocestný (vázaný na hodiny) signál ve vesmíru a zároveň přenáší dvoucestný (koherentní, bez hodin) spoj do stanice hlubokého vesmíru, a naviguje tři referenční uživatele (přechod k Marsu, orbiter na nízké oběžné dráze kolem Marsu, pevný bod na povrchu) pomocí <b>společného jednocestného + dvoucestného fúzního estimátoru D3.1</b> – dvanáctistavového SRIF, který rozšiřuje redukovaně dynamický orbitální/empirický blok z D2 o třístavový stav palubních hodin. <b>Poctivý rozsah:</b> každý ukazatel kvality je <b>formální kovarianční mez</b> estimátoru (1σ / 3σ polohy v každé epoše) a dosažené RMS vůči <b>syntetické uzavřené</b> pravdě (pravda a filtr sdílejí touž dynamiku Marsu a týž geometrický model observable, plus vložený gaussovský šum) – simulovaný navigační ukazatel, <b>NE</b> ochranná úroveň s leteckou certifikací a <b>NE</b> tvrzení pro let (žádný model poruch s certifikací, žádný monitor integrity, žádná skutečná sledovací data). Vše níže je aditivní (zlaté reference reprodukovatelnosti jsou beze změny; stejné SHA, bez regenerace).

seg-b81920d2df82 = Společná jednocestná + dvoucestná radiometrická fúze (fúzovaná předčí kterýkoli samostatný typ)

seg-cd9d2a7dd08f = <c1/>: redukovaně dynamický SRIF z D2.2 rozšířený o tři stavy palubních hodin (<c2/>), zpracovávající smíšenou časovou řadu <b>dvoucestné</b> (bez hodin, fixující dráhu – nulové sloupce hodin v parciální derivaci) a <b>jednocestné</b> (vázané na hodiny – parciální derivace frekvence <c3/>) vzdálenosti/Doppleru přes <c4/>. Struktura kalibruj-pak-dobíhej: dvoucestné průchody fixují dráhu, jednocestná data pak kalibrují hodiny a drží dráhu mezi průchody s chybou ohraničenou Allanovou stabilitou hodin. Testováno v <c5/> <c6/>: <b>fúzované</b> řešení předčí <b>kterýkoli samostatný typ spoje</b>; chyba doběhu jen s jednocestnými daty roste s mezerou mezi dvoucestnými průchody v souladu s Allanovou mezí třídy hodin; společná kovariance zůstává SPD (symetrická kladně definitní) po celou dobu.

seg-26a4bfa8e6ad = Konstelace MARCONI (areostacionární poloměr, zákryt)

seg-f2c2e1b83411 = <c1/>: pětirelé uspořádání – tři <b>areostacionární</b> relé na <c2/> (marsovský synchronní poloměr z publikovaných μ/rychlosti rotace; testováno v pásmu <b>{ "20 400" }–{ "20 500" } km</b>) rovnoměrně rozmístěná po { "120" }° v délce se sklonem { "5" }°, plus dvě relé na vyšší ({ "1.4" }× areostacionární) kruhové dráze se sklonem { "60" }° pro pokrytí roviny oblohy. Stavy relé v každé epoše se dopředně integrují s gravitací <c3/>; test viditelnosti kvůli <b>zákrytu Marsem</b> je geometrie „tětiva míjí kouli“ (<c4/>, testováno: diametrálně protilehlé relé je zakryto, relé v nadhlavníku je viditelné). <b>Poctivý rozsah:</b> minimální reprezentativní geometrie vysílání plus relé sestavená z publikovaných konstant Marsu – nikoli návrh konkrétní letové konstelace.

seg-b53ea4dd9f7d = Scénář <c1/> dostupný přes CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

seg-3a01d13ad2e7 = <c1/> / <c2/> je zapojeno jako scénář <c3/> napříč všemi povrchy (D3.3): spouštěč CLI, vazba pro Python, sestavení WASM/playground i dispečer serveru MCP všechny směřují k němu (zpětný převod <c4/>, test <c5/>). Dodané referenční scénáře: <c6/>, <c7/>, <c8/>. Výsledek nese explicitní <c9/>, který označuje ukazatel kvality jako kovarianční mez (nikoli PL s certifikací), a výstupy <c10/> / <c11/> opakují označení poctivosti.

seg-28a49a455a74 = Cíle MARCONI / LightShip reprodukovány: <b>orbiter < { "100" } m</b>, <b>rover < { "15" } m</b>

seg-28da71940857 = <c1/>: zveřejněné cíle programu MARCONI / LightShip (orbiter < { "100" } m, povrch/rover < { "15" } m) reprodukované v simulaci. <b>Sdílené předpoklady:</b> výchozí pětirelé konstelace MARCONI; každé relé v dohledu dává v každé epoše jednocestnou vzdálenost+Doppler; koherentní dvoucestný průchod stanice každých <b>{ "30" } min</b>; šum třídy DSN (<b>σ vzdálenosti = { "1" } m, σ Doppleru = { "0.1" } mm/s</b>); společný redukovaně dynamický filtr fúze oběžné dráhy + 3stavových hodin inicializovaný z a priori stavu <b>vychýleného o ~{ "2.7" } km</b> (těsnost { "0.1" }); ukazatel kvality = konvergované 3D RMS polohy ve druhé polovině oblouku vůči syntetické pravdě. <b>Orbiter</b> (LMO ~{ "400" } km / sklon { "60" }°, hodiny <b>USO</b>, kadence { "60" } s, ~{ "2" } h ≈ oblouk jedné oběžné dráhy): dosažené konvergované RMS <b>≈ { "0.40" } m</b> ≪ cíl { "100" } m (průměrně { "3.1" } relé v dohledu, kovariance SPD po celou dobu). <b>Rover</b> (pevný rovníkový bod na povrchu, hodiny <b>USO</b>, kadence { "30" } s, oblouk ~{ "2" } h): dosažené konvergované RMS <b>≈ { "5.1" } m</b> < cíl { "15" } m (průměrně { "3.0" } relé v dohledu, kovariance SPD). <b>Oba cíle splněny bez uvolnění jakéhokoli tvrzení</b> – USO je <em>méně</em> schopná z realistických tříd palubních hodin (DSAC by jen pomohl) a 30minutová dvoucestná kadence je pro rutinní plán reléové sítě konzervativní, takže předpoklady jsou pro systém třídy MARCONI fyzikálně férové, nikoli vyladěné tak, aby prošly. <b>Poctivý rozsah:</b> simulovaná reprodukce za uvedených předpokladů, NE tvrzení pro let ani ochranná úroveň s certifikací; syntetická uzavřená pravda sdílí s filtrem dynamiku Marsu a model observable.

seg-37b2bad62854 = Lunární souřadnicový čas – relativistický chod hodin Země–Měsíc (<c1/>)

seg-787705fa0fac = Lunární souřadnicová časová škála (LTC/TCL (TCL: Temps-Coordonnée Lunaire, francouzský název Lunar Coordinate Time)) vyžaduje sekulární rychlost, jakou běží hodiny na lunárním povrchu vůči hodinám na zemském geoidu (TT). <c1/> ji počítá z prvních principů: první postnewtonovská identita sčítající <b>rozdíl vlastních potenciálů</b> (konvenční potenciál geoidu IAU <c2/> <c3/> minus vlastní potenciál povrchu Měsíce <c4/>) a <b>kinetický člen (Dopplerův druhého řádu)</b> <c5/> z geocentrické rychlosti Měsíce (konečnými diferencemi z lunární řady Montenbruck-Gill v <c6/>). Dominantní člen vlastního potenciálu dává <b>≈ { "57.5" } µs/den</b>, kinetický člen <b>≈ −{ "0.5" } µs/den</b>, celkem <b>≈ { "57" } µs/den</b>. Scénář <c7/> hlásí tuto rychlost, nahromaděný posun LTC−TT za horizont a podporuje minimální soubor s inverzním rozptylem (lunární papírové hodiny); převody TT↔LTC se zpětným převodem vracejí na < { "1" } ns/den.

seg-beeb6561ef6b = Orákulum / poctivý rozsah

seg-4500e65ede97 = Relativistický chod hodin Země–Měsíc (LTC/TCL)

seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Orákulum: vnitřní relativistická identita v uzavřeném tvaru</b> (geopotenciál IAU <c6/> / konvencí IERS a vlastní potenciál GM/r (GM: gravitační parametr, G krát hmotnost)), <b>křížově kontrolovaná proti zveřejněnému pásmu chodu lunárních hodin [{ "56" }, { "59" }] µs/den</b>. Testy (<c7/>): člen vlastního potenciálu ≈ { "57.5" } µs/den, rychlost Měsíce ≈ { "1" } km/s, kinetický člen malé záporné číslo, celek v pásmu s pojmenovanými členy, které se k němu sčítají, posun LTC−TT za 1 den ≈ { "57" } µs a zpětný převod TT↔LTC < { "1" } ns/den. <b>Poctivý rozsah:</b> hlavní údaj v µs/den je <b>závislý na referenci</b> – závisí na zvolených referenčních plochách (geoid Země <c8/> oproti lunárnímu selenoidu), na okně časového průměrování a na zanedbaných odstředivých korekcích/J₂ pod µs/den – proto je zveřejněným výstupem <b>pásmo</b>, nikoli jediné číslo s certifikací. Jde o kontrolu vnitřní konzistence <c9/>, <b>NE</b> o externí validaci, <b>NE</b> o absolutní přesnost pod nanosekundu a <b>NE</b> o stav s certifikací pro provozní určování času.

seg-b4e3228c84b8 = Lunární geodetické VLBI – blízké pole zpoždění pro zemskou základnu pozorující lunární maják (<c1/>)

seg-bbb634953ebf = Geodetická observable VLBI (very-long-baseline interferometry) pro dvě pozemní stanice na Zemi (základnu) pozorující jednocestný signál z vysílače třídy NovaMoon na povrchu Měsíce. Měsíc je v <b>blízkém poli</b>, nikoli rovinná vlna, takže geometrické zpoždění je přesný rozdíl dvou vzdáleností <c1/> místo projekce do roviny oblohy. Úplná observable přidává rozdíl posunů hodin stanic a diferencovaný člen Shapiro zemského potenciálu (převzatý z <c2/>). Stanice se umísťují do geocentrických inerciálních (GCRS) souřadnic přes <c3/> + <c4/>; maják přes <c5/> (geocentrický Měsíc) + <c6/> (selenografické→MCMF (MCMF: Moon-centred, Moon-fixed)) + <c7/> (IAU-2015 ME pevná s tělesem→inerciální). Scénář <c8/> vzorkuje zpoždění, jeho rychlost z konečných diferencí a korekci blízkého pole během průchodu.

seg-b2b758337ebc = <b>Orákulum</b> je rovinnovlnná observable Δ-DOR <c1/> ve stejné kódové základně v <c2/>: v limitě dalekého pole (syntetický maják v { "1e15" } m) se geometrické zpoždění musí s přesností stroje zhroutit na <c3/>; při skutečné lunární vzdálenosti je korekce blízkého pole způsobená zakřivením vlnoplochy nenulová (desítky až stovky µs). Parciální derivace majáku <c4/> (a parciální derivace stanic) jsou ověřeny centrální konečnou diferencí (relativní chyba < { "1e-5" }).

seg-107b9d328f69 = Lunární geodetické zpoždění VLBI + parciální derivace

seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Orákulum: <c8/></b> – rovinnovlnné <c9/> ve stejné kódové základně (<c10/>) v limitě dalekého pole, plus <b>parciální derivace z konečných diferencí</b>. Testy (<c11/>): velikost polohy stanice ≈ poloměr Země, vzdálenost majáku při lunární vzdálenosti ({ "356" }–{ "407" } Mm), geometrické zpoždění v dalekém poli se shoduje s <c12/> na < { "1e-9" } s, nenulová korekce blízkého pole při lunární vzdálenosti, parciální derivace majáku/stanice z FD do relativní odchylky { "1e-5" }, přesný člen hodin a konečný běh scénáře předaný přes <c13/>. <b>Poctivý rozsah:</b> <c14/>, <b>NE</b> ověřeno proti skutečným datům VLBI. Polární pohyb je zanedbán (<c15/>), takže inerciální polohy stanic nesou chybu soustavy několik metrů; maják kombinuje řadu Měsíce se středním rovníkem dne s posunem pevným s tělesem v ICRF (International Celestial Reference Frame) (<c16/>), tedy nesoulad konzistence soustav pod věrností modelu, ale nikoli rigorózní; a neexistuje iterace doby šíření světla, rotace Země během doby šíření světla, členy médií (tropo/iono/plazma) ani aberace nad rámec diferencovaného členu Shapiro. Netvrdí se žádné TRL (technology readiness level), letová historie ani podpora agentury. { "0.30" }: proti dobám šíření světla z ANISE přes DE440 žádné zpoždění této analytické cesty neleží do { "1" } ps (největší mezera { "24" } µs); zjištění je zafixováno.

seg-d90c67f098f7 = <c1/> (Země a Měsíc z DE440, lunární hlavní osy z DE440, orientace Země ITRF93, každá doba šíření světla zkonvergovaná v barycentrické soustavě), spouští scénář <c2/>, jsou-li nastaveny tři cesty k jádrům. <b>Orákulum: knihovna</b> – doby šíření světla zkonvergované v NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) k DSS-14/43/63, předregistrováno: { "75" } zpoždění do { "1" } ps (nejhorší { "0.06" } ps), parciální derivace majáku a stanic do { "1e-6" }, v { "25" } epochách poblíž J2000 (dodatek poté, co { "2024" } epoch selhalo na vlastní dvojité přesnosti epochy vyslání v SPICE, asi { "6" } ps, zveřejněno a zafixováno). Diferencovaný člen Shapiro, rychlost změny zpoždění a korekce blízkého pole scénáře se neporovnávají.

seg-8bed75c5402d = Lunární společné vícetechnikové OD + hodiny – simulované obnovení uzavřenou smyčkou (<c1/>)

seg-d518eead07c4 = Jednoepochový (snapshot) dávkový fit nejmenších čtverců (<c1/>, krok Householderova QR od { "0.30" }), který <b>slučuje techniky geodetické VLBI, radiometrického/lunárního místního měření vzdáleností a měření vzdáleností mezi družicemi</b> na SIMULOVANÉ lunární síti, aby <em>společně</em> obnovil 3D polohu lunární povrchové stanice, polohy jednotlivých družic malé konstelace a posun hodin každého aktiva. Observable jsou: ({ "1" }) zpoždění geodetické VLBI na zemní základně k lunární stanici zacházené jako s majákem (využívá <c2/>, geocentricky inerciálně) – hlavní technika; ({ "2" }) geocentrické radiometrické vzdálenosti stanice na Zemi→družice (které multilaterují konstelaci z dobře rozmístěných stanic na Zemi) a lunární místní vzdálenosti stanice↔družice (euklidovská vzdálenost v MCI (Moon-centred inertial) plus diferencovaný člen hodin); ({ "3" }) vzdálenosti mezi družicemi (stejný tvar); plus jediné synchronizační pseudo-pozorování hodin stanice, které ukotvuje jinak nepozorovatelný společný posun hodin. Stavový vektor je <c3/>. <b>Uvnitř řešiče není žádná propagace modelem sil</b> – družice jsou pevné, odlišné, ilustrační body na reprezentativní lunární dráze; jde o záměrně čistý fit snapshotu. Uvnitř jsou polohy škálovány a hodiny odhadovány v metrech ekvivalentních vzdálenosti, aby normální matice zůstala v f64 dobře podmíněná; vzdálenosti VLBI a lunární vzdálenosti jsou zbaveny průměru kolem nominální geometrie, aby Jacobián z konečných diferencí netrpěl katastrofickým krácením. Scénář <c4/> spouští řešení s větvemi VLBI i bez nich na stejném seedu/pravdě a hlásí obě řešení plus faktor zlepšení pozorovatelnosti stanice.

seg-f634e976b583 = <b>Hlavní poctivý výsledek</b>: lunární místní měření vzdáleností z polární stanice k hrstce družic, které leží všechny na jedné straně oblohy, ponechává polohu stanice <b>slabě pozorovanou podél jednoho směru</b>, takže řešení jen ze vzdáleností je špatně podmíněné a obnovená 3D chyba stanice je velká (nebo řešení nekonverguje). <b>Přidání zpoždění VLBI na zemní základně činí celou 3D polohu stanice pozorovatelnou</b> a obnovená chyba stanice klesne na úroveň metrů. Test <c1/> ověřuje, že chyba stanice s VLBI je výrazně (≥{ "5" }×) menší než chyba jen ze vzdáleností při téže vložené pravdě – smyslem této fáze je, že VLBI obnovuje jinak nepozorovatelný směr stanice.

seg-d5feea2381b7 = <b>Orákulum</b> je vnitřní konzistence: vložený pravdivý stav (stanice ~{ "50" } m/osu, družice ~{ "30" } m/osu, hodiny ~{ "1e-7" } s, se seedovaným kolísáním po složkách) se mapuje na syntetické observable <em>týmž</em> geometrickým modelem, který řešič invertuje, přidá se seedovaný gaussovský šum (ilustrační výchozí hodnoty: VLBI σ ≈ { "1e-11" } s, σ vzdálenosti ≈ { "0.1" } m, ISL σ ≈ { "0.1" } m; váhy <c1/>) a estimátor musí obnovit vloženou pravdu v rámci šumu z nulového počátečního odhadu. Průměrné NEES metodou Monte Carlo <c2/> přes seedy (<c3/>) leží v volném pásmu kolem <c4/>, kontrola realističnosti kovariance.

seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: lineární algebra řešení)

seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Orákulum { "0.30" }: P2</b> – numpy { "2.4.6" } (LAPACK gelsd a inv) přepočítá každý krok Gauss-Newton, zkonvergované vážené řešení, formální sigmy a chybu stanice na odevzdaných Jacobiánech šesti sítí (<c4/>, kroky do { "2.4e-11" }, sigmy do { "1.3e-11" }); fyzikální modely pozorování a velikosti zůstávají MODELLED. <b>Dřívější orákulum: <c5/></b> – obnovení vložené simulované pravdy + konzistence kovariance podle NEES. Testy (<c6/>): plná fúze obnoví pravdu (stanice < { "5" } m, RMS družic < { "5" } m, hodiny < { "1e-8" } s, zkonvergováno); VLBI obnoví 3D pozorovatelnost stanice (chyba stanice ≥{ "5" }× menší s VLBI než jen ze vzdáleností při téže pravdě); deterministické (stejný seed → bitově shodné řešení, jiný seed → odlišné, ale obnovené); průměrné NEES v volném pásmu kolem <c7/>; konečná/ošetřená hlášená čísla i tehdy, když je řešení jen ze vzdáleností špatně podmíněné; scénář předaný přes <c8/>. <b>Poctivý rozsah:</b> jde o <b>simulované obnovení uzavřenou smyčkou</b> – pravda sdílí model pozorování – <b>NE</b> o validaci na skutečných datech; uvnitř řešiče není propagace modelem sil; polohy družic a geometrie stanic na Zemi/Měsíci jsou ilustrační. Netvrdí se žádné TRL, letová historie ani podpora agentury.

seg-7620f3a821f6 = Realizace lunární referenční soustavy – 7parametrový fit datumu Helmertovou transformací (<c1/>)

seg-240271b9d7de = Zatímco <c1/> <em>aplikuje</em> orientaci lunárního tělesa IAU { "2015" } WGCCRE (dopředný model), tento modul <em>odhaduje</em> (realizuje) lunární referenční soustavu ze sítě odhadnutých souřadnic bodů vázaných na datum. Jádrem odhadu je klasická <b>7parametrová podobnostní (Helmertova) transformace</b> – tři translace, tři rotace v malých úhlech a jeden parametr měřítka – která mapuje body <c2/> (odhadovaná soustava) na <c3/> (soustava datumu) jako <c4/>, přičemž <c5/> je sestaveno z <c6/>. Sedm parametrů <c7/> se odhaduje z ≥ { "3" } nekolineárních dvojic bodů váženými nejmenšími čtverci přes <c8/>: dopředný model předpovídá každé <c9/> z jeho <c10/> a zplošťuje všechny tři složky všech bodů do vektoru observable, pozorované souřadnice datumu tvoří <c11/>, váhy jsou <c12/> a řešení startuje z <c13/>. Úhly rotace se odhadují v µrad a měřítko v ppb, aby Jacobián z konečných diferencí zůstal dobře škálovaný při velikosti souřadnic na lunárním povrchu (~{ "1.7e6" } m). Malé <c14/> skládá realizovanou malou rotaci přes orientaci IAU těleso→ICRF (<c15/>) a vrací zbytkový posun realizované soustavy v malých úhlech kolem os ICRF – záměrně jednoduchá změna soustavy vyjádření, <b>nikoli</b> nezávislý odhad lunárního pólu.

seg-75769fc9671c = <b>Orákulum</b> je vnitřní konzistence: známá Helmertova transformace (translace ~desítky m, rotace ~µrad, měřítko ~{ "1e-7" }) je <em>vložena</em> do dobře rozprostřené syntetické sítě bodů (různé selenografické šířky/délky → MCMF, některé body ve výšce), přidá se seedovaný gaussovský šum a fit musí vložené parametry obnovit. Na datech bez šumu je obnovení na ~přesnost stroje (translace < { "1e-6" } m, rotace < { "1e-9" } rad, měřítko < { "1e-12" }); s šumem na úrovni metrů leží obnovené parametry v rámci několikanásobku formálního σ a RMS reziduum po fitu leží poblíž úrovně šumu. Scénář <c1/> hlásí obnovené datum, chybu obnovení po parametrech vůči vložené pravdě, RMS reziduum po fitu a vazbu orientace realizované rotace na ICRF.

seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Orákulum: <c6/></b> – obnovení vložené 7parametrové podobnostní transformace plus algebraická identita zpětného převodu <c7/>. Testy (<c8/>): obnovení vložené transformace bez šumu (translace < { "1e-6" } m, rotace < { "1e-9" } rad, měřítko < { "1e-12" }); obnovení se šumem v rámci několikanásobku σ a RMS reziduum poblíž úrovně šumu; zpětný převod aplikuj-pak-invertuj; deterministické (stejný seed → bitově shodné, jiný seed → odlišné, ale obnovené); vazba na ICRF při nulové rotaci je nulová a vazba zachovává velikost rotace; scénář předaný přes <c9/>. <b>Poctivý rozsah:</b> jde o kontrolu <b>vnitřní konzistence</b> – obnovuje <em>vloženou</em> transformaci na <em>syntetické</em> síti – <b>NE</b> o realizaci lunární referenční soustavy proti skutečným sledovacím datům / VLBI a netvrdí žádnou absolutní přesnost soustavy. Vazba orientace na ICRF je jednoduchá změna vyjádření, nikoli nezávislý odhad pólu. Netvrdí se žádné TRL, letová historie ani podpora agentury.

seg-f14930d33f47 = Servisní objem lunární navigace – DOP / pokrytí / dostupnost + zobecněná lunární ochranná úroveň ARAIM (<c1/>)

seg-9b4f13e138e4 = Tento modul <em>skládá</em> již hotové části do analýzy lunárního navigačního <b>servisního objemu</b>: prochází mřížku selenografických šířek/délek v časovém horizontu vůči <b>ilustrační konstelaci na lunárních drahách třídy Moonlight / LCNS z veřejných zdrojů</b> (LCNS: Lunar Communications and Navigation Services) a hlásí DOP / pokrytí / dostupnost plus zobecněnou obálku ochranné úrovně lunárního ARAIM. Obě opětovná použití jsou nosná a výslovná. <b>Geometrie DOP</b> je jádro <c1/> <b>VALIDATED</b> (proti gnss_lib_py) – <c2/> je tenký filtr elevační masky plus toto jádro a test ověřuje identitu (<c3/> se rovná přímému <c4/> na týchž viditelných polohách). <b>Integrita</b> využívá lunární aparát ARAIM LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> zobecňuje stávající ochrannou úroveň u jižního pólu na libovolný povrchový bod a test ověřuje, že se <b>redukuje na případ jižního pólu</b> (na jižním pólu se stejnou geometrií/rozpočtem vrací přesně stávající výsledek <c8/> do < { "1e-9" }).

seg-456bf257f689 = Parametry konstelace jsou <b>ilustrační aproximací veřejných popisů ESA</b> této třídy systému (≈ { "4" } družice na eliptických lunárních zamrzlých drahách upřednostňujících pokrytí jižního pólu – apolunium nad jižní polokoulí; { "4" } je výchozí hodnota knihovny a přibalený <c1/> nastavuje { "8" }, protože ochranná úroveň potřebuje v dohledu alespoň { "6" }). <b>Nejsou</b> to skutečné efemeridy Moonlight/LCNS a nenaznačují <b>žádnou</b> spřízněnost, podporu, letovou historii, certifikaci ani TRL. Složení (pokrytí / dostupnost / integrita) je <b>MODELLED</b>: sada relé na kruhových/eliptických keplerovských drahách (nikoli efemerida LCNS / NRHO { "9" }:{ "2" } (near-rectilinear halo orbit) s diferenciální korekcí), Měsíc se střední rotací (bez fyzikální librace / precesujícího pólu) a zveřejněné parametry integrity LunaNet LNIS. Ukazuje <em>metodu</em> servisního objemu, nikoli provozní číslo dostupnosti. Deterministické (čistá geometrie, žádná náhodnost). Scénář <c2/> hlásí procento pokrytí, obálky počtu viditelných družic a PDOP, obálku HPL/VPL přes objem a dostupnost ochranné úrovně vůči mezi poplachu.

seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Geometrie DOP ověřena opětovným použitím</b> jádra <c7/> ověřeného proti gnss_lib_py; integrita využívá zveřejněný lunární ARAIM LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Testy (<c9/>): <c10/> je identita na ověřeném jádru; <c11/> na jižním pólu se rovná stávající PL <c12/> do < { "1e-9" } (redukuje se na případ jižního pólu); pokrytí s velikostí konstelace neklesá; viditelnost respektuje elevační masku; scénář je deterministický a předává se přes <c13/>. <b>Poctivý rozsah:</b> konstelace je <b>ilustrační, z veřejných zdrojů, NE spjatá s ESA</b> – nikoli skutečné efemeridy Moonlight/LCNS; složení pokrytí/dostupnosti/integrity je <b>MODELLED</b> (kruhová/eliptická keplerovská relé, Měsíc se střední rotací, zveřejněné parametry LNIS), <b>NE</b> provozní číslo dostupnosti Moonlight. Netvrdí se žádné TRL, letová historie ani podpora agentury.

seg-4ff4929f71df = Lunární diferenciální PNT – zrušení společné složky + reziduum rostoucí se základnou + diferenciální ochranné úrovně DGNSS (<c1/>)

seg-8f94c4bf3fe6 = Lunární analogie DGNSS (differential satellite navigation) / SBAS: <b>referenční stanice třídy NovaMoon</b> na <em>známém</em> selenografickém místě počítá diferenciální korekce pro jednotlivé družice z <b>ilustrační konstelace třídy Moonlight / LCNS z veřejných zdrojů</b> a pohybující se uživatel odsazený od ní o základnu je aplikuje, takže se <b>společné</b> chyby vysílaných efemerid ruší. Každá družice <c1/> nese vložený společný 3D vektor chyby dráhy <c2/> a společnou chybu hodin <c3/>. Reziduum pseudovzdálenosti referenční stanice je korekce <c4/>; surová chyba uživatele je <c5/>; opravená chyba uživatele je jejich rozdíl <c6/>. <b>Člen hodin <c7/> se ruší přesně</b> (je v obou pozorováních shodný) a <b>člen dráhy se zhroutí na projekci na rozdíl dvou jednotkových vektorů zorné osy</b>, který → { "0" } pro základnu → { "0" } (spodní hranice prostorové dekorelace) a roste ≈ lineárně se základnou. Opravené chyby vzdálenosti jednotlivých družic se mapují přes geometrii uživatele malým řešením snapshotu váženými nejmenšími čtverci s nízkými závislostmi (stav <c8/> přes <c9/>; konstantní zkreslení vzdálenosti pohltí neznámá hodin, místo aby narušilo určení polohy) a dávají chybu <b>polohy</b> uživatele. <b>Ochranná úroveň uživatele využívá aparát ochranné úrovně SBAS DO-229E</b> (<c10/>, K-faktory Precision-Approach) s diferenciálním reziduálním σ jako rozpočtem chyby 1σ každé družice.

seg-06978cfaebe3 = NovaMoon se uvádí <b>pouze jako třída systému</b> (veřejný popis lunární referenční stanice); konstelace využívá ilustrační <c1/> z veřejných zdrojů. Jde o ilustrační parametry k vyzkoušení diferenciální <em>metody</em>, <b>nikoli</b> o skutečnou efemeridu, a nenaznačují <b>žádnou</b> spřízněnost, podporu, letovou historii, certifikaci ani TRL. Scénář <c2/> hlásí chybu polohy uživatele s korekcemi a bez nich, faktor snížení, křivku chyby v závislosti na základně a ochrannou úroveň. Ve výchozí konfiguraci je opravená chyba uživatele při základně { "50" } km ≈ { "0.008" } m oproti ≈ { "24" } m bez oprav (snížení ~{ "3000" }×) a ≈ { "0" } při nulové základně.

seg-6bb4dbe998f9 = <b>Orákulum</b> je vnitřní konzistence: zrušení společné složky je <b>přesná algebraická identita</b> (s <c1/> je opravená chyba < { "1e-6" } m při nulové základně; člen hodin se ruší s přesností stroje při libovolné základně), reziduum <b>roste monotónně se základnou</b> a ochranná úroveň je <b>týž algoritmus DO-229E</b>, proti němuž je zafixován zásobník SBAS. Reziduum prostorové dekorelace je <b>geometrický model prvního řádu</b>, <b>nikoli</b> fitovaný model dekorelace ze skutečného lunárního sledování.

seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Orákulum: <c6/></b> – identita diferenciálního rušení chyb plus opětovné použití aparátu ochranné úrovně SBAS DO-229E (<c7/>). Testy (<c8/>): při nulové základně jsou opravená chyba uživatele i každá opravená chyba vzdálenosti jednotlivých družic ~{ "0" } (< { "1e-6" } m) a ≪ neopravená chyba; člen hodin se ruší přesně při libovolné základně (případ s nulovou chybou dráhy); opravená chyba roste monotónně se základnou a přitom zůstává ≪ neopravené při skromných základnách; diferenciální režim jasně předčí samostatný (> { "2" }×); ochranná úroveň se rovná přímému volání <c9/> a škáluje s reziduálním σ; podurčená geometrie vrací <c10/>; scénář je deterministický (se seedem) a předává se přes <c11/>. <b>Poctivý rozsah:</b> <b>MODELLED</b> – zrušení společné složky je přesná identita, ale reziduum prostorové dekorelace je <b>geometrický model prvního řádu</b>, <b>NE</b> fitovaný model dekorelace ze skutečného lunárního sledování, a toto <b>NENÍ</b> ověřeno na skutečných datech. NovaMoon se uvádí <b>pouze jako třída systému</b> (ilustrační, z veřejných zdrojů, <b>nespjatá s ESA</b>). Netvrdí se žádné TRL, letová historie ani podpora agentury.

seg-08e8a73f3426 = Export pro lunární interoperabilitu – CCSDS OEM + KIF ve shodě s LunaNet/IOAG se zpětným převodem pro ověření shody (<c1/>)

seg-39b875078d27 = Lunární referenční soustava, lunární časová škála a lunární efemerida se exportují ve <b>formách výměny založených na CCSDS a sladěných s LunaNet/IOAG (IOAG: Interagency Operations Advisory Group)</b>. Tato fáze <b>nevymýšlí</b> drátový formát: <b>využívá</b> stávající emitor a parser CCSDS OEM (Orbit Ephemeris Message) { "2.0" } v crate (<c1/> / <c2/>) a obálku Kshana Interchange Format (<c3/>), přeznačené pro lunární kontext. <c4/> nastavuje <c5/> v OEM na <b>lunární těleso IAU { "2015" } WGCCRE</b> (<c6/> mean-Earth nebo <c7/> hlavní osy), <c8/> na <b>lunární časovou škálu</b> (<c9/> / <c10/> / <c11/>) a <c12/> na <c13/>, nad vzorkem <b>ilustrační efemeridy třídy LCNS z veřejných zdrojů</b> (polohy z <c14/>, rychlost centrální konečnou diferencí). <c15/> vydává deskriptor lunárního času sladěný s LunaNet/IOAG (identifikátor škály, sekulární rychlost µs/den z <c16/>, zveřejněné pásmo { "56" }–{ "59" } µs/den, referenční plocha), který projde zpětným převodem přes serde_json. <c17/> zabalí OEM + deskriptor + označení soustavy do stávající obálky KIF s označením poctivosti MODELLED.

seg-bbfce5323abb = <b>Orákulum</b> je zpětný převod / shoda polí. Protože <c1/> dodává <em>oba</em> směry, OEM prochází zpětným převodem přes <c2/> (zpět na stejný segment, se zachovanou lunární soustavou/časem a počtem stavů) <b>a</b> nezávisle jej kontroluje <c3/>, který ověřuje, že je přítomno každé požadované klíčové slovo hlavičky CCSDS/LunaNet, že <c4/> nese lunární token <c5/> a <c6/> je neprázdné, že platí rámování <c7/> a že datové řádky polohy+rychlosti jsou správně utvořené – vrací strukturovaný výsledek o úspěšném průchodu plus seznam přítomných/chybějících polí, takže porušený export (např. vynechané <c8/>) je zachycen a pojmenován. Metadata času procházejí zpětným převodem přes <c9/> a obálka KIF prochází zpětným převodem přes <c10/> na stejné artefakty nesoucí označení MODELLED.

seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Orákulum: <c7/></b> – deterministický zpětný převod (CCSDS OEM přes <c8/>; KIF přes <c9/>; metadata času přes serde_json) plus shoda názvů polí se zveřejněnou sémantikou polí CCSDS OEM + LunaNet/IOAG. Testy (<c10/>): exportovaný OEM nese lunární tokeny <c11/> (<c12/>/<c13/>) a <c14/> (<c15/>/<c16/>), <c17/>, objekt a správně utvořené datové řádky; metadata lunárního času procházejí zpětným převodem (rychlost/pásmo/reference) a odmítají nesmysly; obálka KIF se serializuje a deserializuje na stejnou hodnotu s přítomným označením poctivosti MODELLED; záměrně porušený OEM (chybí <c18/>) neprojde <c19/> a je hlášen jako chybějící; scénář se předává přes <c20/>. <b>Poctivý rozsah:</b> <b>názvy/jednotky</b> polí jsou sladěny s <b>veřejnými</b> standardy (CCSDS 502.0-B OEM, lunární soustavy IAU WGCCRE { "2015" }, LunaNet Interoperability Specification / lunární architektura IOAG); export je <b>MODELLED</b> – orákulem je deterministický zpětný převod + shoda názvů polí, toto <b>NENÍ</b> test shody interoperability s certifikací, efemerida je <b>ilustrační, z veřejných zdrojů, nespjatá s ESA</b> a netvrdí se žádné TRL, letová historie ani podpora agentury.

seg-69a214b7236d = Předregistrované předpovědi

seg-343fe86f6a50 = Předregistrovaná předpověď je výsledek MODELLED zmrazený dříve, než existují jakákoli data, jimiž by šel ohodnotit, se současně pevně stanoveným protokolem hodnocení. Není to validace a nepřidává řádek do registru. Každá žije v <c1/> se svými zmrazenými vstupy, svým výsledkem a jejich hashi SHA-256 a <c2/> selže, pokud se pohne jakýkoli zmrazený bajt; změněný předpoklad se řeší novou, datovanou předpovědí vedle staré, nikdy její úpravou.

seg-e65d79893e2c = Předpověď

seg-f9e2d4b52b79 = Zmrazeno

seg-dd68891f75e2 = Hodnoceno proti

seg-d5a09f26a028 = Pokrytí lunární referenční stanice

seg-c68f124a16e7 = c05dac1d, 2026-10-12

seg-293404a9cb92 = zveřejněná přesnost, dostupnost, pokrytí a ochranné úrovně jihopolární lunární diferenciální stanice, kýmkoli

seg-4e7d9449a880 = dosud nehodnoceno (žádné zveřejněné výsledky)

seg-ad1995b3ed17 = Evidence reprezentativnosti ukázky a mezer k letu (<c1/>)

seg-86b70551c37f = Výsledek simulace je užitečný jako důkaz, jen pokud na první pohled uvádí, k čemu je ukotven, co předpokládá a co jej ještě dělí od letového systému. Evidence reprezentativnosti z toho činí plnohodnotný, strojově kontrolovaný výstup: záznam <c1/> nese externí <c2/> ukázky, její modelované předpoklady, její <c3/> k letu (každou s fází/aktivitou, která by ji uzavřela) a pásmo TRL, pro které je reprezentativní. Je to protějšek k matici <c4/> na úrovni schopností, určený pro jednotlivý výsledek.

seg-ccd039d5e6a4 = <b>Orákulum</b> je sada invariantů v uzavřeném tvaru vynucovaných <c1/>: záznam <c2/> musí uvádět alespoň jednu kotvu <c3/> (simulace nemůže být ověřena sama proti sobě); záznam <c4/> musí uvádět alespoň jednu mezeru k letu a nemůže si nárokovat reprezentativní pásmo TRL nad { "4" } (zrání nad tuto úroveň vyžaduje hardwarové/letové důkazy, což je mezera, nikoli výstup simulace); pásmo TRL musí být správně utvořeno; a záznam <c5/> nesmí nic tvrdit. Tyto invarianty uvádějí do praxe kázeň „reprezentativnost zdůvodněna + zbývající mezery k letu jasně určeny“.

seg-6b29111096ca = Registr reprezentativnosti a mezer k letu (gaps-to-flight)

seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Orákulum: <c8/></b> — invarianty poctivosti v uzavřeném tvaru, vázané na hranici mezi stavem <c9/> a druhem orákula. Testy (<c10/>): záznam s ověřením (Validated) bez vnější kotvy selže; vnitřní kotva (ReferenceImpl) ověření (Validated) nesplňuje; záznam z modelu (Modelled) bez mezery selže; záznam z modelu (Modelled) nad TRL { "4" } selže; chybně zadaná pásma TRL jsou zachycena; záznam se serializuje do JSON s očekávanými poli a vykreslí čitelnou zprávu. <b>Poctivý rozsah:</b> registr kontroluje <em>klasifikaci</em> důkazů výsledku — nedokazuje, že pojmenované kotvy odkazují na živé testy (ty jsou vedeny ručně, stejně jako matice <c11/>); tvrzení „kontrolováno strojově“ se vztahuje jen na invarianty stavu, kotvy, mezery a TRL.

seg-7e9190395eb6 = Jednotné důkazy srovnání kvantového a klasického řešení (<c1/>)

seg-534e48755e2c = Každá oblast kvantového PNT odpovídá na stejnou otázku stejným způsobem: zafixuje jeden srovnávací rámec (scénář + seed + verze enginu), provede kvantového kandidáta i klasický základ jednou neutrální cestou kódu, ohodnotí je podle společných ukazatelů kvality a uvede — s intervalem spolehlivosti a poctivým označením ověřeno/z modelu — kde kvantové řešení vítězí a kde ne. <c1/> dává této odpovědi jednotný tvar, takže vertikály časování, navigace a detekce anomálií vydávají <b>stejný</b> reprodukovatelný, poctivě označený objekt. Žádné srovnání znovu neimplementuje: čísla pro jednotlivé ukazatele pocházejí z existujících enginů (<c2/>, <c3/> a modulů vertikál); toto je kontrakt plus obálka reprodukovatelnosti a reprezentativnosti, postavená na registru reprezentativnosti a štítcích verifikace.

seg-5a52fb6670d1 = <b>Orákulum</b> tvoří identity přínosu a vítěze v uzavřeném tvaru plus věrné obalení existujícího výstupu srovnání. <c1/>: poměr přínosu má správnou polaritu (orientován tak, že <c2/> vždy znamená, že kvantová strana je lepší, a to jak pro ukazatele typu čím víc, tím líp, např. holdover, tak pro ukazatele typu čím méně, tím líp, např. chyba); objekt důkazů sestavený ze skutečného <c3/> reprodukuje své poměry přínosu; nepoctivé důkazy jsou odmítnuty (reprezentativnost z modelu (Modelled) bez mezery, nebo ukazatel <c4/>, jehož záznam srovnání nenese žádnou vnější kotvu); JSON je deterministický a nese pole rámce, seedu, enginu, ukazatele kvality a reprezentativnosti.

seg-ae87cea429ba = Důkazy srovnání kvantového a klasického řešení

seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Orákulum: <c5/></b> — identity přínosu a vítěze v uzavřeném tvaru + věrné obalení <c6/>; poctivost vázaná na registr reprezentativnosti a na hranici mezi stavem verifikace a druhem orákula. Testy (<c7/>) jako výše. <b>Poctivý rozsah:</b> testovací rámec standardizuje, <em>jak</em> se srovnání uvádí a reprodukuje; fyzika jednotlivých ukazatelů je taková, jakou poskytuje přispívající engine, a nese vlastní označení ověřeno/z modelu — <c8/> nepovyšuje ukazatel z modelu na ověřený.

seg-ce13223e04d0 = Knihovna chybových modelů kvantových zařízení (<c1/>)

seg-c206fc7d58d6 = Jediné místo, které zpřístupňuje kvantová zařízení PNT, mezi nimiž demonstrátor srovnává — optické hodiny, hodiny z uvězněných iontů, hodiny z rtuťových iontů, klasické referenční hodiny, studený atomový interferometr a spoje pro přenos času —, každé jako <c1/> s hlavní specifikací a záznamem reprezentativnosti. Většina fyziky zařízení je <b>převzatá</b> (stability hodin z <c2/> a <c3/>; studený atomový interferometr z <c4/>/<c5/>; klasické optické a rádiové spoje z <c6/>). Jediným skutečně novým modelem je <b>spoj pro přenos času s provázanými fotony / jednotlivými fotony</b>, jehož časová preciznost je omezena šumem výstřelu: <c7/> v závislosti na detekované četnosti koincidencí <c8/> a integraci <c9/>, zhoršená penalizací za temné počty <c10/> a omezená neodstranitelnou systematickou složkou.

seg-7e8f4f3a5442 = <b>Orákulum</b> tvoří převzaté, publikované koeficienty hodin a CAI plus identity šumu výstřelu a ztrát v uzavřeném tvaru. <c1/>: převzaté pořadí stabilit hodin je rozumné (optická mřížka < rtuťové ionty < CSAC v σ_y({ "1" } s)); preciznost provázaného spoje se zlepšuje jako <c2/> ({ "4" }násobná integrace sníží σ na polovinu), je-li omezena šumem výstřelu; detekovaná četnost koincidencí klesá { "10" }krát na každých { "10" } dB ztráty spoje; temné počty preciznost monotónně zhoršují; systematická dolní mez preciznost zdola omezuje; každá karta zařízení je platný záznam reprezentativnosti z modelu (Modelled).

seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Orákulum: <c5/></b> — převzaté publikované koeficienty hodin a CAI + identity šumu výstřelu a ztrát v uzavřeném tvaru pro provázaný spoj. Testy (<c6/>) jako výše. <b>Poctivý rozsah:</b> parametry zařízení hodin a CAI jsou převzaty z existujících modelů enginu s publikovanými koeficienty; model provázaného spoje je MODELLED podle publikovaného chování kvantové synchronizace hodin s ilustračními veřejně dostupnými hodnotami četnosti párů, účinnosti a ztrát — <b>není</b> ověřen proti změřenému spoji a skutečný hardware zdroje, kanálu a detektoru je uvedenou mezerou k letu (gap-to-flight).

seg-f6d8e7ad6bec = Důvěryhodné kvantové časování — celý řetězec, zabezpečená distribuce, anomálie a srovnání (<c1/>)

seg-3160cfec0d1f = Scénář <c1/> sestavuje časovací řetězec, který kvantový demonstrátor PNT potřebuje: celkový rozpočet času uživatele (chyba dobíhání referenčních hodin a preciznost časování spoje sloučené kvadraticky) pro <b>kvantový</b> řetězec (hodiny s optickou mřížkou + provázaný spoj / spoj s jednotlivými fotony) oproti <b>klasickému</b> řetězci (CSAC + rádiový obousměrný spoj); <b>časovou ochrannou úroveň</b> (TPL, převzatou z <c2/>), která omezuje nedetekovanou časovou chybu; <b>ukazatel kvality zabezpečení proti útoku zpožděním/přehráním</b> <c3/> při uvedené míře falešných poplachů (převzatý z <c4/>); <b>pravděpodobnost detekce anomálie hodin + latenci detekce změny pomocí CUSUM (kumulativní součet)</b>; a srovnání kvantového a klasického řešení jako poctivé <c5/> se záznamem reprezentativnosti a mezer k letu.

seg-6fa095264bdc = <b>Orákulum</b> tvoří rozpočet v uzavřeném tvaru, sloučený kvadraticky, nad převzatými, samostatně ověřenými jádry (ADEV proti Stable32/NIST; mez TPL; <c1/>/<c2/>). <c3/>: kvantová preciznost se s dobou integrace zlepšuje; kvantový řetězec může ukazatel preciznosti vyhrát <em>i</em> prohrát (poctivě — nejde o univerzální výhru; velmi ztrátový spoj výsledek obrátí); ochranná úroveň je konečná a kladná; ukazatel zabezpečení leží v [{ "0,1" }] a s rostoucím zpožděním útoku roste; pravděpodobnost detekce anomálie je monotónní vzhledem k velikosti poruchy; a důkazy srovnání jsou vnitřně poctivé (<c4/>).

seg-42a7d1170cc3 = Důvěryhodné kvantové časování (řetězec + zabezpečená distribuce + anomálie + srovnání)

seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Orákulum: <c5/></b> — rozpočet v uzavřeném tvaru, sloučený kvadraticky, nad převzatými ověřenými jádry (ADEV/Stable32-NIST, mez TPL, analytické Pd/Pmd detekce); poctivost vázaná na registr reprezentativnosti. Testy (<c6/>) jako výše. <b>Poctivý rozsah:</b> parametry hodin a spoje jsou ilustrační, z veřejných zdrojů; provázaný spoj je model MODELLED omezený šumem výstřelu z <c7/>; modeluje se <em>třída</em> systémů důvěryhodného časování — <b>není</b> ověřen proti změřenému spoji od začátku do konce a skutečný hardware hodin, spoje a vesmírného kanálu je uvedenou mezerou k letu (gap-to-flight); neuplatňuje se žádné TRL, letová historie ani certifikace.

seg-c6ae292a6331 = Kvantová navigace bez GNSS (<c1/>)

seg-f34f784e928c = Scénář <c1/> srovnává navigaci výpočtem polohy ze známého pohybu (dead-reckoning) při výpadku GNSS mezi <b>kvantovým</b> inerciálním rozpočtem (akcelerometr se studeným atomovým interferometrem, převzatý z <c2/>/<c3/>, jehož bílošumová mez CAI je ověřena na přibližně { "2" } řády vůči Freier et al. { "2016" }) a <b>klasickou</b> inerciální navigací (INS) navigační třídy. Uvádí růst polohové chyby během dobíhání, dobu holdover do polohové meze a srovnání kvantového a klasického řešení jako poctivé <c4/>. Pozorovatelnost je uvedena poctivě: bez vnější opravy během výpadku je zkreslení akcelerometru nepozorovatelné, takže polohová chyba roste bez omezení (≈ ½·bias·t² plus člen náhodné procházky rychlosti); kvantový senzor s nižším zkreslením tento růst <em>zpomalí</em>, ale mezeru neuzavře — to dokáže jen vnější oprava.

seg-4cfde3de8f94 = <b>Orákulum</b> tvoří převzaté inerciální rozpočty (<c1/>/<c2/>, oba implementující rys <c3/>) plus identity driftu v uzavřeném tvaru. <c4/>: kvantový rozpočet při dlouhém výpadku klasický překoná (nižší chyba, delší holdover); chyba s délkou výpadku roste u obou (mezera pozorovatelnosti); výhoda závisí na délce výpadku a není konstantním faktorem (kvantová křivka je při krátkém dobíhání dominována šumem, při dlouhém zkreslením); důkazy srovnání jsou vnitřně poctivé.

seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Orákulum: <c5/></b> — převzaté inerciální rozpočty (CAI ověřeno převzetím, na ~{ "2" } řády vůči Freier { "2016" }; klasický drift v uzavřeném tvaru); poctivost vázaná na registr reprezentativnosti. Testy (<c6/>) jako výše. <b>Poctivý rozsah:</b> statické srovnání rozpočtů navigace výpočtem polohy ze známého pohybu (dead-reckoning), nikoli dynamický filtr na skutečných trajektoriích; nepozorovatelnost zkreslení bez opravy je uvedena; parametry zařízení jsou ilustrační, z veřejných zdrojů; modeluje se <em>třída</em> kvantové navigace bez GNSS — skutečný hardware IMU se studenými atomy, dynamická platforma a letové prostředí jsou uvedenými mezerami k letu (gaps-to-flight); neuplatňuje se žádné TRL, letová historie ani certifikace.

seg-e23e583ecf21 = Detekce poruch a anomálií pro kvantové systémy PNT (<c1/>)

seg-6e6df91ae779 = Scénář <c1/> definuje označený katalog poruch kvantového PNT (skok frekvence hodin, drift, ztráta zámku; skok zkreslení senzoru, výpadek), ohodnotí detekční statistiku na nominálních a postižených oknech a uvádí rozlišovací schopnost detektoru jako ROC AUC a nejmenší detekovatelnou poruchu při pevné míře falešných poplachů. Srovnání kvantového a klasického řešení: stabilnější kvantová referenční hodiny snižují šum monitoru σ, takže detekují menší poruchy — výstup je poctivé <c2/> se záznamem reprezentativnosti.

seg-eeb3c7d1f507 = <b>Orákulum</b> tvoří AUC v uzavřeném tvaru pro gaussovskou detekční statistiku (nominální <c1/>, porucha <c2/> ⇒ <c3/>), křížově zkontrolované s externě ověřeným <c4/> (ověřeno proti scikit-learn) a analytickými prahy <c5/>. <c6/>: analytické AUC odpovídá známým hodnotám ({ "0.5" } při μ={ "0" }, →{ "1" } pro velké μ/σ, monotónní); empirický bootstrapový interval spolehlivosti AUC uzavírá hodnotu v uzavřeném tvaru; kvantový monitor má vyšší AUC a menší nejmenší detekovatelnou poruchu; výhoda mizí u obrovských poruch (obě řešení detekují dokonale — nejde o univerzální náskok); katalog má pět označených tříd; srovnání je vnitřně poctivé.

seg-9dda4ab0647a = Detekce poruch a anomálií pro kvantové PNT

seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Orákulum: <c7/></b> — gaussovské AUC v uzavřeném tvaru, křížově zkontrolované s externě ověřeným bootstrapovým AUC z <c8/> (proti scikit-learn) a analytickými prahy <c9/>. Testy (<c10/>) jako výše. <b>Poctivý rozsah:</b> detekční statistika je gaussovský model, nikoli skutečná telemetrie; katalog poruch je označený a syntetický; úrovně šumu kvantového a klasického monitoru jsou ilustrační, z veřejných zdrojů; modeluje se <em>třída</em> detekce anomálií kvantového PNT — skutečná hardwarová telemetrie s referenčními označeními je uvedenou mezerou k letu (gap-to-flight); neuplatňuje se žádné TRL, letová historie ani certifikace.

seg-24ad75143bed = Shoda se standardy — výměnné formáty, rozpočet spoje a integrita (kontroly s externím orákulem)

seg-9d31773e0ecd = Tyto standardy jsou ověřeny tím, že se z nich obnoví <b>doslovné řešené příklady a referenční hodnoty publikované přímo ve standardech</b> (nebo v nezávislé referenční implementaci), nikoli zpětným převodem (round-trip) samotného Kshana. Obnovení vlastního příkladu z přílohy standardu je nejsilnější dostupnou kontrolou shody pro parser výměnného formátu.

seg-7ec3d508c64f = Externí orákulum

seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

seg-65de0a1335d6 = <c1/>: <c2/> obnoví přesné epochy a stavové vektory X/Y/Z/Ẋ/Ẏ/Ż příkladu OEM ve formátu KVN z <b>CCSDS 502.0-B-3, příloha G §G6, obrázek G-11</b> („OEM Example with No Acceleration, No Covariance“, s. G-10) — oba segmenty efemerid, včetně zdrojových hodnot s úvodními nulami (<c3/>). Testovací soubor <c4/> je znak po znaku převzat z oficiální Blue Book (redakční značky „< intervening data records omitted here >“, které nejsou platnými záznamy OEM, nejsou zahrnuty).

seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

seg-a5c6b58e0053 = <c1/>: <c2/> obnoví všech { "41" } záznamů RANGE (první { "3198.03679519614" } km, poslední { "3270.46440460551" } km) a metadata příkladu TDM ve formátu KVN z <b>CCSDS 503.0-B-2, příloha E, obrázek E-9</b> („Range Data with TIMETAG_REF=TRANSMIT“, s. E-9). Testovací soubor <c3/> je převzat doslova z Blue Book. (Toto je orákulum z publikované Blue Book vedle dříve existujícího ručně vytvořeného zpětného převodu (round-trip) <c4/> v <c5/>.)

seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

seg-aaffd3d25c5f = <c1/>: kodér reprodukuje bajtové testovací vektory primární hlavičky nezávislé <b>knihovny <c2/></b> (us-irs/spacepackets-py, <c3/>) — např. <c4/> a hlavičku se všemi maximálními hodnotami <c5/> — plus kanonický případ telemetrie (TM) samých jedniček, každý převedený zpět přes dekódování. Šířky a pořadí bitových polí podle <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (rozpočet spoje, DSN 810-005)

seg-c6caa639e1c6 = <c1/>: řetězec FSPL (ztráta volným prostorem) a C/N₀ reprodukuje publikovanou návrhovou kontrolní tabulku telemetrie v hlubokém vesmíru z <b>J. H. Yuen (ed.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), tabulka 1-1</b> — downlink Galileo v pásmu X ({ "8420.43" } MHz) při { "6.37" } AU: ztráta volným prostorem <b>{ "290.54" } dB</b> (<{ "0.05" } dB) a přijaté <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). Středy pásem leží uvnitř alokací downlinku DSN/CCSDS-401 pro hluboký vesmír (DSN 810-005, modul { "201" }). <em>Výchozí parametry mise</em> zůstávají reprezentativní (nejde o kalibrovaný transpondér); co se zde ukotvuje, je <em>rovnice spoje</em>.

seg-c2cee7d5c7b1 = Standardy GNSS — stav externího orákula a poctivé zbývající mezery:

seg-d8f653b3c955 = Stav a poctivé upozornění

seg-fff735bd32a1 = <b>Jádro, geometrie a ochranná úroveň ARAIM jsou externě ověřeny.</b> <em>Jádro</em> detekce — práh detekce poruchy χ², necentralita nezachycené události podle necentrálního χ² a K-násobitele normálního rozdělení — reprodukuje <b>SciPy</b> (<c1/>, { "171" } případů, ≤ { "1e-6" } rel.) a obalová geometrie reprodukuje <b>gnss_lib_py</b> (DOP). Nově je ukotvena i <em>hodnota</em> ochranné úrovně (PL) ARAIM: proti číselnému příkladu „LPV-200 (LPV: localizer performance with vertical guidance)“ z WG-C (WG: Working Group) ARAIM Reference ADD (Algorithm Description Document) v3.1 dávají <c2/> / <c3/> VPL { "18.2926" } m oproti { "18.3" } m, HPL { "13.4063" } m oproti { "13.45" } m a σ_v,acc { "1.3694" } m oproti { "1.3694" } m, uvnitř vlastní <c4/> = { "0.05" } m reference (druh <c5/>). Rozsah: režimy poruch až do jedné družice nebo jedné konstelace (<c6/>); podmnožiny poruch s více událostmi a vyloučení nejsou implementovány a klasický RAIM stále nemá <b>žádný kanonický publikovaný testovací vektor vstup→HPL</b>. Viz <a1><c7/></a1>.

seg-e6a47dfb7e54 = <b>Algoritmus ochranné úrovně je nově externě ověřen.</b> Při daných hodnotách (el, az, σ) pro jednotlivé družice reprodukuje <c1/> v kshana <b>fork RTKLIB SBAS-PL</b> (<c2/> <c3/>, Siki & Takács { "2017" }, „DO-229D Appendix J“) — při zadání <b>vlastních</b> σ tohoto nástroje, vypočtených ze <b>skutečných</b> vysílaných zpráv EGNOS + skutečného RINEX z BUTE — s přesností na <b>< { "2e-3" } m HPL</b> v { "6" } epochách (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) potvrdil totožnou konvenci. K-faktory (<c6/>, <c7/>, <c8/>) odpovídají DO-229E Appendix J. <b>Co je ověřeno a co ne:</b> ukotvuje se <em>algoritmus</em> PL (σ na vstupu → HPL/VPL na výstupu); <em>modelování</em> σ ze surových zpráv UDRE/GIVE je mimo rozsah kshana — právě tam se nezávislé nástroje pro <em>celý řetězec</em> na skutečných datech stále liší o metry. K_V souhlasilo při zaokrouhlené hodnotě orákula { "5.33" } (přesné <c9/> v kshana → VPL o ~{ "0.06" } % menší; vertikála je ověřena bez K-faktoru jako <c10/>).

seg-4ef39e8ea75c = <b>Vysílaný model je externě ověřen.</b> Model Klobuchar L1 reprodukuje <b><c1/> z RTKLIB</b> (<c2/>, < { "1e-4" } m) — <em>shodu implementace</em> s de facto otevřenou referencí, protože žádný oficiální řešený příklad s <em>naměřenou pravdou</em> neexistuje. Čtečka map TEC IONEX nyní existuje (<c3/>, testována jednotkově); zbývající mezerou je její křížová kontrola proti skutečnému produktu GIM, nikoli vysílaný model. Viz řádky Klobuchar v <a1>Tvrzení vs. realita</a1>.

seg-fa3058dffb2a = Rozprostírací kód GPS L1 C/A (IS-GPS-200)

seg-53ac231770fb = Generování kódu je externě ověřeno.

seg-04db7c613bd5 = <c1/> (<c2/>): generátor kódu C/A s G1/G2 LFSR (posuvný registr s lineární zpětnou vazbou) reprodukuje <b>publikované přiřazení fáze kódu v IS-GPS-200 tabulce 3-Ia</b> — osmičkový zápis prvních deseti chipů pro PRN (pseudonáhodný šum) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }) — přesně. Tím se proti rozhraní GPS ukotvuje <b>posloupnost chipů rozprostírací kódu</b>; okolní části modulace, spektrální separace a sledování kódu smyčkou DLL (delay-locked loop) (<c3/>) zůstávají MODELLED.

seg-e5f1b960777a = Časování pro sítě, spektrum, sluneční soustavu, konstelace, kampaně a LEO-PNT

seg-c5bf3b23d688 = Schopnosti přidané v řadě { "0.28" } jsou hodnoceny řádek po řádku ve vygenerovaném <a1><c1/></a1>; tato část shrnuje, které z nich mají externí orákulum. Řádek je VALIDATED pouze s nezávislým externím orákulem; vše ostatní je MODELLED.

seg-d791a48b3895 = Schopnost (kind)

seg-d4779be2efd8 = Externí orákulum, nebo důvod, proč zůstává z modelu

seg-0d7bb0fc1c5e = Telekomunikační MTIE (maximální chyba časového intervalu) a TDEV (časová odchylka) na řadě holdover (<c1/>)

seg-18894b55b6c1 = <c1/>: { "17" } faktorů průměrování MTIE a { "12" } TDEV na zapsané řadě holdover čipových hodin (chip-scale) o { "2" } 048 vzorcích proti allantools { "2024.06" }, na < { "1e-12" } / < { "1e-9" } relativně. Verdikty masek ITU-T (International Telecommunication Union Telecommunication Standardization Sector) PASS/FAIL a přednastavení oscilátorů z datových listů zůstávají MODELLED. Viz <a1><c2/></a1>.

seg-ff9cb967ae08 = Predikce holdover z naměřeného záznamu hodin (<c1/>)

seg-7821227795d8 = <c1/>: fit na první třetině skutečného záznamu cesiových hodin 5071A, predikce času překročení jedné sigma při šesti prazích, měření na vyčleněných dvou třetinách; práh faktor { "1.5" } na obě strany, pozorované poměry { "0.84" } až { "1.03" }. Rozpočet ochranného intervalu slotu a kadence oprav, které na tom stojí, zůstávají MODELLED.

seg-2667e3ddf829 = Spektrální hustoty výkonu v pásmu L v uzavřeném tvaru a spektrální separace (<c1/>)

seg-1a0c6ef49f98 = Uzavřené tvary <c1/> proti publikovaným hodnotám (řádek matice „Closed-form L-band signal power spectral densities…“). Vodopádový diagram s J/S (poměr rušení k signálu) po pásmech a efektivním C/N0 (poměr nosné k hustotě šumu) a vstup/výstup SigMF (Signal Metadata Format) zůstávají MODELLED.

seg-46278e9c03c1 = Polohy planet z prvků Standish od JPL (Jet Propulsion Laboratory) a doba světla mezi tělesy (<c1/>)

seg-43cfeb9f2403 = { "0.30" }, předregistrováno proti JPL Horizons (DE441): <c1/> a <c2/>, RMS na planetu a složku nejvýše na hodnotě z Explanatory Supplement, tabulka { "8.10.1" } (nejhorší { "0.778" }), včetně rozdělení Země a rotace ICRF; <c3/>, řešič doby světla na polohách DE441 do { "1e-6" } s od doby světla z Horizons (nejhorší { "6.7e-9" } s). Dřívější srovnání s dvojnásobkem nominální hodnoty (<c4/>), jehož práh byl stanoven až po prvním srovnání, je ponecháno jako neblokující regresní test. Uran/Neptun z tabulky { "1" }, Pluto, měsíce, konstanty těles a <c5/> zůstávají MODELLED.

seg-b96d8ea13c87 = Geometrie Walker a publikované sloty GPS, Galileo a GLONASS (GLObal NAvigation Satellite System); globální faktor DOP pro GPS (<c1/>)

seg-85c293b8d235 = <c1/>: Walker 24/3/1 reprodukuje definiční tabulku otevřené služby Galileo s přesností { "1e-9" }°, vzorec slotů z řídicího dokumentu rozhraní GLONASS a rovníkové průchody GPS; medián HDOP základu GPS { "0.940" } proti hodnotě { "0.94" } z normy výkonnosti Standard Positioning Service. Libovolné mapy pokrytí více konstelacemi kolem jakéhokoli tělesa zůstávají MODELLED.

seg-f0187be4b97f = Kampaně: řetězené mise, průchody parametrů, ansámbly Monte Carlo, běhy se sdílenými podmínkami (<c1/>)

seg-b5c45fc12e5f = <c1/> ({ "11" } testů): jednofázová kampaň reprodukuje samostatný běh bajt po bajtu, jednouzlový průchod parametru načte stejné číslo, ansámbl se seedem je bajtově stabilní. Jde o identity skládání, nikoli o externí orákulum.

seg-bc25d20125e7 = Fyzika spoje LEO (nízká oběžná dráha Země): koeficienty deště ITU-R (ITU Radiocommunication Sector) P.838, útlum deštěm a scintilace P.618, ztráta průnikem do budov P.2109, ionosféra prvního řádu, maximální Doppler

seg-b1f3bd37d169 = <c1/>, <c2/>: vlastní tabulky doporučení ITU-R a validační příklady Study Group { "3" } (zapsané se zdrojem a datem získání), poměr skupinového zpoždění z IS-GPS-200 pro ionosféru a publikovaná tabulka maximálního Doppleru od Leclere, Marathe a Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

seg-492917f11386 = Navigační zpráva LEO: uživatelský algoritmus vysílaných efemerid podle Galileo ICD (dokument řízení rozhraní), CRC-24Q (24bitová cyklická redundantní kontrola), globálně průměrné váhy SISRE (chyba dosahu signálu ve vesmíru) (<c1/>)

seg-514a7da01582 = <c1/>: uživatelský algoritmus Galileo reprodukuje RTKLIB (open-source knihovnu pro kinematické určování polohy v reálném čase) na { "1" } mm na čtyřech skutečných vysílaných efemeridách Galileo; CRC-24Q dává katalogovou kontrolní hodnotu 0xCDE703 a kontrolní bajty příkladového rámce RTCM (Radio Technical Commission for Maritime Services) { "1005" }; váhy SISRE reprodukují publikovanou tabulku MEO/GEO. Fitovací nástroj, aktualizace uprostřed průchodu, binární kódování, textový formát ve stylu RINEX-4/CSV (hodnoty oddělené čárkami) a volitelné modely efemerid zůstávají MODELLED.

seg-94bbcd43e03a = Návrh signálu LEO, průchod a rozpočet spoje, Doppler a společné určování polohy GNSS+LEO, konvergence PPP (přesné určování polohy bodu), určování polohy 5G NTN (neterestrické sítě), přenos času LEO (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-4c37a8cfac87 = <c1/>, <c2/>: uzavřené tvary, konzistence filtru (například NEES filtru PPP zprůměrované přes běh uvnitř jeho { "95" }% pásma) a srovnání s publikovanými trendy; žádná terénní data.

seg-91cf4e399f0a = Jeden systém LEO-PNT od začátku do konce (<c1/>)

seg-fb947da2e8b4 = <c1/>: každá předaná hodnota se rovná vlastnímu výstupu předchozí fáze a změna vstupu v předchozí fázi pohne každým navazujícím údajem, který na ní závisí.

seg-7e230aa73770 = Odolnost LEO a vertikály (spoofing podle Dopplera a podle konzistence mezi pásmy, sondování ionosféry)

seg-ab2542cfc295 = <c1/> ({ "10" } testů). Scénáře odolnosti a vertikál jsou uvedeny v <a1><c2/></a1>.

seg-2d3ead293658 = Výstupy, které jsou vykreslením, a ne důkazem, mají testy, ale nemají řádek v matici: výměnné exporty (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemeridy STK (Systems Tool Kit), SigMF (Signal Metadata Format)), z nichž každý je načten zpět validátorem napsaným podle specifikace formátu (<c1/>, { "13" } testů; viz <a1><c2/></a1>); animace (<c3/>: bajtově shodné opakované běhy, přesné počty snímků, správně utvořené SVG (Scalable Vector Graphics), žádná externí adresa v přehrávači HTML (HyperText Markup Language)); a zpráva o běhu (<c4/>, <c5/>: každý přibalený scénář se vykazuje bez prázdné sekce či zástupné hodnoty, štítky odpovídají matici a zaznamenaný příkaz reprodukuje <c6/> i zprávu bajt po bajtu).

seg-903e4e51dda1 = Provozní obálka

seg-e226ad523a3d = Každý balíček je prověřen v celé své uvedené vstupní obálce pomocí <c1/>, který ověřuje, že každý číselný výstup je konečný (žádné NaN/Inf (NaN: not a number)) a omezený. Tabulka uvádí pro každý balíček testovaný rozsah vstupu, očekávané chování výstupu a pokrývající test.

seg-8bd4f586f3c7 = Procházený vstup

seg-3ebc1201a545 = Testovaný rozsah

seg-a1198518d667 = Očekávaný výstup

seg-7bf563f5420a = Pokrývající test

seg-4906c027a805 = <c1/> (časovací specifikace)

seg-d91e18ce3773 = { "1" } – { "500" } ns

seg-10cf765fdd75 = konečné ukazatele kvality holdover/časování/zabezpečení

seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (od studených atomů po hrubé MEMS (micro-electro-mechanical systems))

seg-456c32a126a2 = konečné, omezené polohové RMS/p95

seg-dae96fd3a01b = <c1/> (elevační maska)

seg-a54c3c8933c6 = konečný DOP/dostupnost; omezené

seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

seg-b6d0d587046e = konečné P_md / zabezpečení, omezené

seg-fda0b32d7784 = { "10" } – { "1000" } m

seg-132fdea2270f = konečný holdover času/polohy

seg-c9099375b99f = oběžná dráha (skutečná)

seg-952b94eda0ff = skutečné TLE z Celestrak <c1/>

seg-60009932477c = snímek 30 družic, přísná kontrola kontrolních součtů

seg-deb16d50741e = načte se jen se správnými kontrolními součty; omezená geometrie

seg-c46d726e35b3 = hodiny (flicker)

seg-15939085bf3a = <c1/> zap/vyp

seg-504a95f55b88 = { "0" } oproti { "1e-12" }

seg-e1cce0c2028e = zapnutí dolní meze 1/f <b>zhoršuje</b> dobíhání podle p95 časování

seg-bdd4e56bdef9 = fúze (realističnost)

seg-09af9dd78fe3 = <c1/> { "0" } oproti { "5.88e-7" } m/s²

seg-0a6723be642c = nula oproti realistické nenulové hodnotě

seg-a9eb04be2b9f = filtr stále konverguje, do { "3" }násobku chyby při nulovém zkreslení

seg-2a839953aa6a = Řádky flicker-FM a zkreslení fúze uzavírají dvě konkrétní mezery v realističnosti: členy šumu jsou <b>ve výchozím stavu vypnuty, ale po zapnutí prokazatelně ovlivňují výstup</b>, a společný fúzní filtr <b>nezávisí na tom, že jsou zkreslení vynulována</b> — konverguje i s realistickým zbytkovým zkreslením na úrovni studených atomů.

seg-4f0e9f9d4cdf = Kvantové a klasické běhy nyní používají nezávislé seedy RNG (generátor náhodných čísel) (klasický seed = seed + 0x9e3779b97f4a7c15), takže jejich realizace šumu jsou nekorelované — opraveno po revizi.

seg-3b6b785f401a = <c1/> respektuje segmenty: časové osy výpadků se při opětovném získání GNSS dělí na souvislé segmenty a uváděnou hodnotou je nejhorší (nejkratší) dobíhání mezi nimi. Zůstává omezeno rozlišením časové mřížky (jde o dolní mez).

seg-4a830113b13d = Opětovná synchronizace přenosu času ISL modeluje zbytkovou nejistotu spoje jako nový jitter s nulovou střední hodnotou v každém měřicím kroku plus znovukotvení v nastaveném intervalu.

seg-30c4d89aa433 = Tvrzení vs. realita — rychlý přehled

seg-27a22de7b8c0 = Kontrolní seznam nepřátelského recenzenta. Pro každý pojem, který lze číst jako víc, než ve skutečnosti je: co Kshana dělá dnes a kde na plánu rozvoje leží skutečná verze.

seg-759eb0cfafe4 = Pojem, na který můžete narazit

seg-6a2d3691d642 = Čím ve skutečnosti dnes je

seg-bbd0145bfb95 = Čím <b>není</b> (zatím)

seg-a6fdb038b003 = „hybridní kvantový/klasický simulátor PNT“

seg-4421f8bd0967 = klasický stochastický simulátor řízený publikovanými koeficienty Allanovy odchylky a šumu kvantových senzorů

seg-3885661aafff = kvantová fyzika z prvních principů (fáze Mach–Zehnder, projekční šum, systematické vlivy) — viz <a1><c1/></a1>

seg-1d28debd0302 = „společná kalmanovská fúze“ / balíček fúze

seg-d13beba21ba7 = spustitelný balíček <c1/> pozoruje hodiny a polohu <b>odděleně</b> (přímá oprava času a přímá oprava polohy), pro což je optimální odhadovač skutečně blokově diagonální — dva dvoustavové filtry se společným ukazatelem kvality

seg-25c2fe6fa6d3 = <em>vázaný</em> filtr pro případ <b>pseudovzdálenosti</b> nyní <b>existuje</b> jako <c1/> (4stavový zřetězený <c2/>, nenulová kovariance mezi bloky, ověřeno pomocí NEES), ale <b>zatím není zapojen do spustitelného balíčku</b> a balíček je <b>1-DOF (jeden stupeň volnosti)</b> — 3D rozšíření s 8 stavy je budoucí práce

seg-5cce1ca5b86f = Ukazatel kvality zabezpečení (druh <c1/>)

seg-d55c30f63023 = <c1/> <b>stochastického detektoru časového spoofingu</b>: oboustranný test χ²₁ / Neymanův–Pearsonův na statistice monitoru podporované hodinami, práh nastavený z cílového <c2/>, <c3/> vyhodnocené <b>při specifikované velikosti</b> jak v uzavřeném tvaru, tak metodou Monte Carlo (obojí se shoduje na několik ×1/√N)

seg-dbf2039a4a8e = vícedružicový detektor RAIM/ARAIM — viz <a1><c1/></a1>; statistika monitoru je gaussovský model se σ odvozenou z PSD hodin, nikoli korelace na úrovni signálu

seg-32bcb801e49c = „detekce spoofingu podporovaná hodinami“

seg-58e4d22075e9 = <b>jednohodinový</b> monitor časové odchylky (gaussovská statistika, σ z PSD hodin), NIKOLI vícedružicový RAIM v SV (SV: space vehicle, tedy družice)

seg-f3f6f95bc559 = RAIM v oblasti vzdáleností s více SV a ochrannými úrovněmi

seg-a5faedaab13e = P_md detektoru spoofingu (uzavřený tvar vs. Monte Carlo)

seg-0362489c341a = analytické <c2/> založené na <c1/> a empirický odhad z <c3/> pokusů se shodují v rámci výběrové chyby (≈ 1/√N); ověřeno v testech <c4/> / <c5/> při zátěžové výchylce (μ/σ = { "2" })

seg-8fa5c9468ff5 = změřená ROC detektoru proti zaznamenaným datům spoofingu

seg-8f895aa1c657 = model pseudovzdálenosti <c1/>

seg-a5e5e1e7a0e9 = <b>přímá simulace</b>: <c1/>. Každý model atmosféry je jednotkově testován proti ručně spočteným hodnotám (ZHD (zenitové hydrostatické zpoždění) ≈ { "2.3" } m, Niell = { "1" } v zenitu, šikmost Klobuchar) a úplný vysílaný model Klobuchar je <b>křížově zkontrolován s referenční implementací <c2/> z RTKLIB</b> na submilimetry (<c3/>, { "6.1278" } m pro případ výchozích koeficientů RTKLIB — žádný oficiální publikovaný testovací vektor Klobuchar neexistuje, takže jde o shodu implementace, nikoli o naměřenou pravdu); <b>běh bez šumu reprodukuje geometrii + korekce na submilimetry</b> (zbytek RAIM ≈ { "0" })

seg-adc8a5d89cbd = polohové <b>řešení</b> ze skutečných signálů (PPP/RTK (PPP: precise point positioning)), dvoufrekvenční kombinace bez vlivu ionosféry nebo řešení nejednoznačností fáze nosné — nemodelováno

seg-a56533528c6e = model rušení (druh <c1/>)

seg-0a4a28fcd53a = řetězec <b>rozpočtu spoje</b>: J/S ze ztráty volným prostorem + zisku antény v daném směru → efektivní C/N₀ pomocí rovnice odolnosti proti rušení (zisk zpracování × spektrální separace <c1/>) → ztráta zámku na prahu (Kaplan & Hegarty §{ "9.4" })

seg-b53e210487fb = vícecestné šíření, dynamika AGC (automatické řízení zesílení) v čase, samotné vyhledávání při akvizici (volitelná hystereze <c1/> je dvojice prahů); ztráta kvantizace u volitelného <c2/> odpovídá gaussovskému vstupu a neplatí pro rušič CW; volitelné pole <c3/> je úzkopásmové a ideální (bez vazby či nepřizpůsobení) a volitelné stínění <c4/> je jedna ostrá hrana na jedné dlaždici SRTM; <c5/> je reprezentativní konstanta podle typu, nikoli odvozená ze změřené PSD rušiče

seg-523d66d56f97 = Ukazatel kvality integrity (balíčky hodin/holdover)

seg-d0702ee52d37 = <b>vnitřní konzistence</b> filtru (podíl vzorků výpadku uvnitř jeho vlastní meze k·σ)

seg-b4b68065e521 = HPL/VPL, riziko integrity / P_HMI, meze alarmu, DO-229E/316/ED-259A — ty uvádí samostatně druh <c1/> (RAIM / ARAIM) a funkce SBAS a nikdy se nezapočítávají do tohoto ukazatele kvality

seg-d5b1f858f0e3 = ukazatel kvality zděděného <b>balíčku</b> scénáře <c1/>

seg-e9fe365d7318 = <b>jednoosý (1-DOF)</b> rozpočet chyb akcelerometru/gyroskopu (VRW/ARW, nestabilita zkreslení) s resetem na pravdu (truth-snap)

seg-604e8d96c2c2 = <em>zděděný</em> balíček je 1-DOF; <b>3osá varianta je dodávána v balíčku <c1/></b> (další řádek)

seg-e2a4a1c47f2c = 3osá strapdown <b>knihovna</b> + <b>balíček</b> <c1/> (<c2/>, <c3/>)

seg-01e5672a37a4 = ověřený navigátor s kvaterniony/NED (NED: north-east-down) s deterministickým chybovým modelem IMU — modelován <b>činitel měřítka, nesouosost, citlivost na g, kvantizace, nárůst rychlosti</b> (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }) — nyní <b>řízený balíčkem scénáře <c1/></b> a <b>nastavitelný pro každý senzor z TOML (Tom's Obvious Minimal Language, formát scénářů)</b> (<c2/>)

seg-acecd6b81859 = <b>nemodelováno:</b> chyba usměrnění vibrací, drift teplotního gradientu. Chyba fúzovaného dobíhání je zdola omezena chybou orientace při předání (náklon/zkreslení akcelerace jsou odlišitelné jen slabě), takže kalibrace po jednotlivých zkresleních se netvrdí

seg-6b04fc376c0d = „Hybridní integrace PNT“ (balíček <c1/>)

seg-cd3125081b5c = navigace výpočtem polohy ze známého pohybu (dead-reckoning) s otevřenou smyčkou, ohraničená resety GNSS na pravdu (truth-snap)

seg-578c93c67ae7 = vázaná (volná/těsná) kalmanovská směs GNSS–INS — to je samostatný balíček <c1/> (EKF) a druh <c2/>

seg-57f603da0331 = „Výkonnost určování polohy“ (balíčky hodin)

seg-278aafe7fadf = RMS <b>časování</b> fáze hodin v ns (<c1/>)

seg-a6af364cbcdc = přesnost v oblasti polohy vážená RMS/CEP/SEP/DOP (SEP: spherical error probable, sférická pravděpodobná chyba)

seg-b68c5a4363a5 = ukazatel kvality inerciální polohy (<c1/>)

seg-850e030bb5e3 = <b>jednoosé</b> polohové RMS/p95 v metrech z jednoho seedu, pokud <c1/> nežádá ansámbl (pak průměr, rozptyl a bootstrapový { "95" }% interval spolehlivosti pro každou metriku)

seg-be77929afa2c = rozdělení CEP / 2DRMS (dvojnásobek RMS vzdálenosti) z ansámblu (plán rozvoje: CEP metodou Monte Carlo)

seg-75f239679dc2 = „ověřeno na ~{ "2" } %“

seg-2d593a99a2b1 = <em>typická</em> pozorovaná shoda; <b>vynucovaná brána je { "20" }–{ "25" } %</b> relativní chyby

seg-34cfd0e08235 = zaručená mez přesnosti { "2" } %

seg-d3402cc1ebd5 = „reprodukovatelné / bitově shodné“

seg-46ea210bcdad = bitově shodný opakovaný běh na <b>stejném OS (operační systém) + připnuté toolchain</b>; napříč Linuxem, macOS a Windows CI kontroluje zapsaný SHA-256 vstupního otisku a tvaru každého výsledku (<c1/>) a číselné hodnoty na { "1e-6" } (<c2/>)

seg-38c6528122a8 = bajtově shodný úplný výsledek napříč operačními systémy (rozdíly libm v poslední číslici)

seg-b0e21aea4ccd = scénář SGP4 GPS (<c1/>)

seg-1131aa869f1d = skutečný snímek Celestrak <c1/> (2021-07-28, { "30" } družic, přísné kontrolní součty), každá družice propagována od své vlastní epochy TLE

seg-21c2f1b5d7e2 = aktuální konstelace — snímek obnovíte pomocí <c1/> (viz <a1><c2/></a1>); katalogová čísla NORAD (North American Aerospace Defense Command) jsou skutečná

seg-6948bd06c7e5 = Křížové kontroly článků o lunárním PNT (regresní důkazy, nikoli řádky matice)

seg-9ee0faf0b359 = Lunární/cislunární sada (schopnosti „Lunar & cislunar“ a „Lunar PNT suite“ v README) má tvrzení z publikovaných článků nezávisle křížově zkontrolována v <c1/>, každé proti orákulu z <em>jiné</em> implementace:

seg-b4edbf832fe6 = <b>orbitální stopa vysílání/zachycení</b> vs. <c1/> (Besselova funkce J1 z Cephes);

seg-c856d319a46e = <b>DOP geometrie povrchových majáků</b> vs. nezávislé řešení <c1/> v NumPy;

seg-33ee672d98d7 = <b>růst predikční chyby perzistence UT1/EOP</b> vs. opětovné načtení týchž doslovných řádků IERS <c1/> v NumPy;

seg-9b6e59789117 = <b>rovinná rodina retrográdních drah vzdálených od tělesa</b> vs. Three-Body Periodic Orbit Database od NASA/JPL;

seg-c77384abd1cc = <b>rozpočet preciznosti rádiového určování vzdálenosti</b> vs. referenci z prvních principů.

seg-a451dbe09e10 = Testovací soubory a skripty generátorů orákul jsou umístěny v <c1/>. Posilují důkazy za schopnostmi, které v strojově kontrolované matici (<c2/>) zůstávají <b>MODELLED</b>; jsou to regresní kontroly, <b>nikoli</b> nové řádky matice VALIDATED, takže samy o sobě počet v strojově kontrolované matici nemění. Tento počet zde není znovu uváděn, protože ručně opsaná kopie se rozchází: aktuální rozdělení je ve vygenerované hlavičce <a1><c3/></a1>, kterou <c4/> zapisuje z <c5/> a <c6/> ji připíná.

seg-a353a63661de = <s1>Předchozí</s1>Exporty a importy pro interoperabilitu

seg-fdae3b73ab67 = <s1>Další</s1>Verifikační matice

seg-59c12422e6e7 = Slapy na geopotenciálu (src/tides.rs)

seg-10f0b4616abe = Manévry a návrh trajektorie (src/maneuver.rs)

seg-56cdbd59ce5d = Určování oběžné dráhy (OD) (src/orbit_determination.rs, src/batch_ls.rs)

seg-3a2c69fcbb86 = Validace silového modelu fitováním efemerid (src/precise_od.rs)

seg-05a25c6ef750 = Skutečné přesné oběžné dráhy agentur (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

seg-279f4619bc2d = Gravitační mapy / navigace alt-PNT (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

seg-7b512df70323 = Chybový model INS / IMU — validace podle datových listů (src/inertial/)

seg-b385e665cfff = PNT v hlubokém vesmíru a na Marsu — základ D0 (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

seg-5887e7e1a218 = Radiometrické pozorovatelné v hlubokém vesmíru a CCSDS Tracking Data Message — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

seg-a9cf84a14301 = Redukovaně dynamické OD v hlubokém vesmíru — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

seg-dc406cb825db = Scénář PNT v hlubokém vesmíru a fúze jednosměrných + obousměrných měření — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

seg-7784f9436dd2 = Lunární souřadnicový čas — relativistický chod hodin Země–Měsíc (src/lunar_time.rs)

seg-8a34cb900611 = Lunární geodetická VLBI — zpoždění v blízkém poli pro pozemní základnu pozorující lunární maják (src/lunar_vlbi.rs)

seg-d47906a347b3 = Lunární společné vícetechnikové OD + hodiny — simulované zpětnovazební obnovení (src/lunar_combination.rs)

seg-17b9f0ae9dee = Realizace lunární referenční soustavy — fit datumu 7parametrickou Helmertovou transformací (src/lunar_frame_realise.rs)

seg-3cfffa3eeb79 = Objem služby lunární navigace — DOP / pokrytí / dostupnost + zobecněná PL lunárního ARAIM (src/lunar_service.rs)

seg-d80bf3320a15 = Lunární diferenční PNT — zrušení společného módu + zbytek rostoucí se základnou + ochranné úrovně DGNSS (src/lunar_dpnt.rs)

seg-23c3d8a79acf = Lunární export pro interoperabilitu — CCSDS OEM + KIF ve shodě s LunaNet/IOAG se zpětným převodem (round-trip) (src/lunar_interop.rs)

seg-a697f4f424b8 = Registr reprezentativnosti demonstrátoru a mezer k letu (gaps-to-flight) (src/representativeness.rs)

seg-4c924153299d = Jednotné důkazy srovnání kvantového a klasického řešení (src/qtrade.rs)

seg-bd1a5835c5db = Knihovna chybových modelů kvantových zařízení (src/quantum_devices.rs)

seg-6b1bb731f966 = Důvěryhodné kvantové časování — celý řetězec, zabezpečená distribuce, anomálie a srovnání (src/timetransfer_chain.rs)

seg-3332c6c1ae86 = Kvantová navigace bez GNSS (src/quantum_nav_od.rs)

seg-9b46a5add4ab = Detekce poruch a anomálií pro kvantové systémy PNT (src/quantum_faults.rs)
