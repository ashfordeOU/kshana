# docs--kinds-lunar-and-cislunar: translations (cs)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Druh

seg-004c56ded47f = Útokový povrch pro zabezpečení signálu při navigaci na povrchu Měsíce (P1): skládá otevřené analýzy zabezpečení signálu do jednoho běhu dosažitelného z binárky. Uvádí ({ "1" }) přijatý výkon AFS a jeho PŘEBYTEK výkonu oproti pozemní referenci GPS, dále pásmo citlivosti 12-18 dB jako skutečný vícerozměrný průchod vstupy spoje (referenční úroveň x EIRP x šikmá vzdálenost) se srovnáním lineárních faktorů 25x zaokrouhleno / 28x nezaokrouhleno. REVIDOVÁNO (pravidlo R4): dříve uvádělo { "15.6" } dB NEDOSTATEK výkonu a faktor 32x/36x, dokud nebyla reference GPS opravena z -125 / -128.5 (což jsou hodnoty v dBm) na -155 / -158.5 dBW, hodnoty ICD-GPS-200, které modul rušení vždy používal. Znaménko se obrací: modelovaný lunární signál AFS je o { "14.4" } dB SILNĚJŠÍ než pozemní GPS L1 C/A, nikoli slabší. Samotný přijatý výkon se nezměnil ani o bit a lineární faktor je původní podělený přesně { "1000" }, což je přesně posun { "30" } dB mezi dBm a dBW; ({ "2" }) požadovaný vysílací výkon útočníka pro spoofing (J/S = { "3" } dB) a pro znemožnění (J/S = { "30" } dB) při každém odstupu, inverzi spoje J/S; ({ "3" }) orbitální záchytnou stopu při skutečném diagramu antény s rovnoměrnou aperturou (Airy [{ "2" } J1(x)/x]^{ "2" }), výškově omezenou podhemisférickou čepici, jejíž okraj NENÍ zachycen; ({ "4" }) vypočtený výsledek strhnutí smyčky sledování při záchytu spoofingu (zda spoofer s odpovídajícím kódem při dané výkonové výhodě a posunu kódu skutečně strhne DLL/PLL), nikoli předpokládaný práh { "3" } dB; ({ "5" }) geometrický dosah horizontu zvýšeného povrchového vysílače na tělese bez atmosféry; a ({ "6" }) rozpočet autentizace OSNMA/TESLA ({ "20" } bit/s režie = ~{ "40" } % zprávy AFS o { "50" } bit/s, latence zveřejnění klíče, padělek { "2" }^-40). Prázdné tělo reprodukuje základ P1; každý vstup má výchozí hodnotu a lze jej přepsat. Dílčí výsledky VALIDATED nesou orákulum svého zdrojového modulu (radiometrie v dB v uzavřeném tvaru; zpětná cesta inverzního J/S; diagram Airy proti Besselovým funkcím z A&S a geometrie kulové úseče; strhnutí DLL/PLL proti Kaplan & Hegarty; identita kulového tečného horizontu proti eo_payload; velikosti polí OSNMA SIS-ICD). MODELLED: reprezentativní velikosti geometrie a výkonu a konkrétní hodnoty buněk mapy záchytu. Nejde o produkt zabezpečení s certifikací.

seg-de295af20c55 = Graf, který engine zapisuje pro scenarios/lunar-attack-surface.toml, druh lunar-attack-surface

seg-142ad48fe422 = Rozšíření lunární orbitální navigační služby o povrchové majáky jako spustitelná tabulka před/po. Uživatel u jižního pólu vidí řídkou orbitální sestavu v úzké části oblohy, takže geometrie měření vzdálenosti je špatně podmíněná; několik ZAMĚŘENÝCH POVRCHOVÝCH MAJÁKŮ dodá řádky přímé viditelnosti s nízkou elevací a širokým azimutem, které sestava celá nad hlavou postrádá, a horizontální faktor DOP (zhoršení přesnosti) se zhroutí. Scénář uvádí tři konfigurace v jedné epoše — samotné družice, družice plus viditelné majáky a větší konstelaci jako alternativní cestu ke stejné geometrii — každou s počty viditelných zdrojů, úplným DOP a dosaženou přesností 1 sigma v METRECH, získanou vynásobením ekvivalentní chybou měření vzdálenosti uživatele na maják, sestavenou jako odmocnina součtu čtverců členů synchronizace hodin, vícecestného šíření a zaměření. Viditelnost majáků je geometrický horizont dvou výšek na Měsíci bez atmosféry (bez atmosféry, takže mez je přesná) a sestavení DOP je totéž jádro, křížově ověřené proti gnss_lib_py v tests/dop_reference.rs. PROČ TENTO DRUH EXISTUJE: modul za ním je v enginu a od L08/L09 je kontrolován nezávislou cestou DOP, ale nebyl dosažitelný z běhu — žádný druh, žádná větev dispečera, žádný přibalený soubor. README tuto schopnost inzerovalo a verifikační matice pro ni neměla ŽÁDNÝ řádek, takže byla současně tvrzena v textu a netvrzena v registru, a přitom v enginu nedosažitelná. Výchozí hodnoty jsou geometrie, která již nese uložený golden (uživatel na -80 deg s anténou { "2" } m, tři majáky na -80/0, -79/+{ "60" } a -79/-60 ve výšce { "2" } km, ilustrativní šestisatelitní snímek LCNS při t={ "0" }, maska { "5" } deg), takže holý běh reprodukuje tabulku, kterou již orákulum pokrývá, místo aby vymýšlel nová čísla. MODELLED: návrh konstelace, rozmístění majáků a každá velikost rozpočtu chyb jsou ilustrativní vstupy, nikoli nasazené zaměření ani změřený spoj; externě zakotveny jsou jen aritmetika DOP, uzavřený tvar horizontu a vztah sigma = DOP x sigma_URE. Nejde o závazek výkonnosti služby.

seg-a53e353706f6 = Graf, který engine zapisuje pro scenarios/lunar-beacon.toml, druh lunar-beacon

seg-8ac5ac006ae7 = Modelovaný lunární DIFERENCIÁLNÍ PNT (analogie lunárního DGNSS/SBAS): referenční stanice třídy NovaMoon na ZNÁMÉM selenografickém místě počítá diferenciální korekce jednotlivých družic z ILLUSTRATIVE konstelace třídy Moonlight/LCNS z veřejných zdrojů (NovaMoon uváděn jen jako TŘÍDA systému, bez spojení s ESA) a uživatel posunutý o baseline_km je aplikuje, takže SPOLEČNÉ orbitální a hodinové chyby se vyruší. Hodinový člen se vyruší PŘESNĚ (algebraická identita); u orbitálního členu zůstane jen projekce rozdílu směrů přímé viditelnosti, která → { "0" } pro základnu → { "0" } (podlaha prostorové dekorelace) a roste ≈ lineárně se základnou. Uvádí 3D chybu polohy uživatele S korekcemi a BEZ nich, faktor snížení, křivku chyby v závislosti na základně a ochrannou úroveň uživatele, která POUŽÍVÁ ZNOVU aparát SBAS DO-229E (crate::sbas) s diferenciálním reziduálním σ. MODELLED — přesná identita zrušení + dekorelační model prvního řádu; neověřeno na reálných datech; bez TRL/heritage/podpory agentury. Deterministický, je-li seedovaný.

seg-8e67df89448a = Graf, který engine zapisuje pro scenarios/lunar-differential-pnt.toml, druh lunar-differential-pnt

seg-55679aff66db = Sedmiparametrový Helmertův (podobnostní) datum rámce řízený SIMULOVANOU POZOROVACÍ KAMPANÍ, nikoli vloženou transformací. Síť pozemních stanic pozoruje katalog lunárních povrchových majáků podle explicitního plánu; parciální derivace zpoždění lunárního VLBI jsou za tento plán akumulovány do Fisherovy informační matice souřadnic majáků přesně tak, jako to dělá lunar-vlbi-fim; a tato informace je přes Helmertovu návrhovou matici A = [I3 | [p]_x | p] v bodech katalogu propagována do kovariance datumu H = A^T M_b A, diagnostikované pomocí crate::fim::crlb. ŽÁDNÁ transformace není vložena a nic se neobnovuje ze zasazené odpovědi, takže uváděná přesnost datumu vychází z pozorovacího programu: poloviční sigma zpoždění ji přesně zpolovičí a prodloužení oblouku ji zlepšuje, protože librace, kterou zpráva MĚŘÍ (sub_earth_direction_sweep_deg), odděluje souřadnici majáku ve směru přímé viditelnosti od souřadnic v rovině oblohy. Hodnost, defekt datumu, číslo podmíněnosti, celé spektrum, nepozorovatelné směry V SEDMIPARAMETROVÉ BÁZI, nejslabší směr i při plné hodnosti a podíl každého parametru na něm se vydávají při každém běhu; parametr, který kampaň neomezuje, se publikuje jako NULL se stavem, nikdy se nevyčte z téměř singulární inverze. Korelace chyb majáků je měřena, nepředpokládána: při pevných stanicích se žádné pozorování nedotýká dvou majáků, takže informační matice je přesně blokově diagonální (offblock_fraction { "0" }), a při odhadovaných stanicích je Schurem marginalizovaný blok svázán, přičemž se vypíše indukovaná korelace a celá propagace se znovu spustí s jejím vypuštěním, takže cena předpokladu nezávislosti je číslo. Stejná propagace při izotropní sigma na souřadnici a chyba obnovy, kterou uvádí scénář lunar-frame-realisation, se zde obě spouštějí a vypisují vedle hodnoty kampaně i s jejich poměry. MODELLED: katalog majáků je ze zdrojů, ale KAMPAŇ je simulovaná — síť stanic a sigma zpoždění jsou ilustrativní vstupy, jednotlivá pozorování zpoždění se pokládají za nezávislá a efemeridy středu Měsíce, hodiny stanic, troposféra a parametry orientace Země jsou drženy PEVNĚ, takže kovariance datumu je Cramerova–Raova mez pro zredukovanou množinu parametrů. Nejde o geodetický produkt.

seg-883d94b321b4 = Graf, který engine zapisuje pro scenarios/lunar-frame-campaign.toml, druh lunar-frame-campaign

seg-0c4c119abfca = Modelovaná realizace lunárního referenčního rámce: fit 7parametrového Helmertova (podobnostního) datumu — { "3" } translace, { "3" } rotace malého úhlu, { "1" } měřítko — který váženými nejmenšími čtverci (crate::batch_ls::gauss_newton) váže odhadovanou množinu souřadnic bodů MCMF odvozených ze selenografických na datum, plus jednoduchou vazbu orientace vyjadřující realizovanou malou rotaci kolem os ICRF vzhledem k orientaci tělesa IAU { "2015" } WGCCRE. Scénář vloží známou malou transformaci (translace ~desítky m, rotace ~µrad, měřítko ~{ "1e-7" }) do dobře rozprostřené syntetické sítě bodů, přidá seedovaný gaussovský šum, obnoví datum a uvádí obnovenou transformaci, chybu obnovy každého parametru vůči vložené pravdě a zbytkové RMS po fitu. MODELLED vnitřní konzistence — obnovuje vloženou podobnostní transformaci (bez šumu přibližně na strojovou přesnost), NENÍ to realizace vůči reálným datům sledování/VLBI; deterministické (seedované); bez TRL/heritage/podpory agentury.

seg-f3a6d69d0225 = Graf, který engine zapisuje pro scenarios/lunar-frame-realisation.toml, druh lunar-frame-realisation

seg-d0fb90f506c9 = MODELLED studie oběžné dráhy a povrchu Měsíce jako navigační a geodetické infrastruktury, pět studií za jedním druhem vybíraným pomocí <c1/>: od-consistency (palubní určování oběžné dráhy z Earth-GNSS na NRHO nebo ELFO proti nezávislému pozemnímu radiometrickému určování oběžné dráhy, posuzované podle jejich vlastních kovariancí přes seedovaný Monte Carlo), carrier-phase (společná dvojitě diferencovaná fáze nosné povrchu a orbiteru a řešení celočíselných nejednoznačností pomocí LAMBDA), frame-coestimation (povrchová stanice a orbitery přidané k měření vzdálenosti z pozemních stanic pro sedmiparametrové datum lunárního rámce), space-tie (GNSS, VLBI a laserové měření vzdálenosti na jedné kosmické lodi, preciznost vazby rámce vůči chybě lokální vazby) a geodesy-sensitivity (Fisherova informace Loveových čísel Měsíce h2, k2, l2 a fyzické librace z laserového měření vzdálenosti, sledování orbiteru, povrchového gravimetru a povrchových hodin). Omezený model tří těles s uvedenými zjednodušeními; numerika je kontrolována nezávislými programy a nic se neporovnává s měřením lunární veličiny.

seg-f3b4a80a739b = bez grafu: příklad nezapisuje žádný graf

seg-4b6daea39f5c = Průchod ochrannou úrovní ARAIM u jižního pólu Měsíce proti reprezentativní sadě reléí LunaNet. sigma_ure_m zpřístupňuje přesnost měření vzdálenosti signálem v prostoru (ochranné úrovně se s ní mění lineárně, takže její průchod odpovídá na otázku, jakou přesnost měření vzdálenosti vyžaduje mezní hodnota výstrahy). Výchozí je historický případ jižního pólu třídy LNIS.

seg-610fa190a393 = Graf, který engine zapisuje pro scenarios/lunanet-araim.toml, druh lunar-integrity

seg-5a4dcb93a643 = Modelovaný export lunární interoperability: vydává lunární referenční rámec, lunární časovou škálu a lunární efemeridy ve výměnných formách zarovnaných s LunaNet/IOAG a založených na CCSDS, s konformitou zpětné cesty / polí. POUŽÍVÁ ZNOVU emitor+parser CCSDS OEM { "2.0" } z balíku (crate::oem) přeznačený pro lunární kontext — REF_FRAME v OEM nese lunární rámec tělesa IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM lunární časovou škálu (LTC / TCL / UTC), CENTER_NAME = MOON — přes ukázkové ilustrativní efemeridy třídy LCNS (polohy z crate::lunar_service, rychlost konečnou diferencí). Vydává také lunární popisovač času zarovnaný s LunaNet/IOAG (id škály, sekulární rychlost µs/den z crate::lunar_time, publikované pásmo, referenční povrch), který projde zpětnou cestou přes serde_json, a artefakty zabalí do existující obálky KIF (crate::interchange) se štítkem čestnosti MODELLED. Uvádí vydané artefakty, počet řádků OEM, konformitu polí (splněno) + seznam přítomných/chybějících polí, zpětnou cestu OEM ok, zpětnou cestu metadat času ok a velikost KIF v bajtech. MODELLED — orákulem je deterministická zpětná cesta + konformita názvů polí vůči publikovanému CCSDS OEM + sémantice polí LunaNet/IOAG; NENÍ to certifikovaný test konformity interoperability; ilustrativní efemeridy z veřejných zdrojů, bez spojení s ESA; bez TRL/heritage/podpory agentury.

seg-0e86ff364c17 = Graf, který engine zapisuje pro scenarios/lunar-interop-export.toml, druh lunar-interop-export

seg-a91a9ad5d8d1 = Lunárně nativní rušení RF (jamming): poměr rušení k signálu pro každou družici, efektivní C/N₀ a ztráta zachycení signálu pro selenografického povrchového uživatele pod lunárním povrchovým (nebo zvýšeným) rušičem nad ilustrativní konstelací třídy Moonlight/LCNS na lunární oběžné dráze z veřejných zdrojů. Skládá existující otevřenou fyziku rušení (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) s existující lunární geometrií oblohy (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); žádná geometrie ani radiometrie se neodvozuje znovu. Na rozdíl od pozemního druhu <c1/> NENÍ signálová větev pevným přijatým výkonem: izotropní přijatý výkon každé družice je její vlastní rozpočet spoje EIRP − FSPL(šikmá vzdálenost), takže J/S se mění od družice k družici s lunární vzdáleností a elevací. Uvádí JEDEN ŘÁDEK NA KAŽDÝ VIDITELNÝ SPOJ (epocha, družice) — azimut, elevaci, šikmou vzdálenost, oba přijaté výkony, jejichž rozdílem je J/S, J/S, nominální a efektivní C/N₀ a stav zachycení — plus souhrnné ukazatele kvality vedle této tabulky (nikdy místo ní) a tutéž tabulku jako artefakt CSV. Každé vydané číselné pole nese jednotku a třídu původu. Dílčí výsledky VALIDATED nesou orákulum svého zdrojového modulu (rovnice protirušení a spoj J/S podle Kaplan & Hegarty §{ "9.4" }, externě odkazované v tests/gnss_denied_jamming_resilience_reference.rs; lunární geometrie z lunar_service). Samotná kompozice je křížově ověřena proti nezávislé cestě se dvěma rozpočty spoje (linkbudget::received_signal_power_dbw, jiný výraz pro ztrátu volným prostorem) na { "1e-9" } dB. MODELLED: ilustrativní konstelace, reprezentativní EIRP / výkon rušiče / zisky antén / šumová teplota a absence stínění terénem, vícecestného šíření, dynamiky AGC a adaptivního nulování. Nejde o produkt zabezpečení s certifikací proti odepření služby. Při nakonfigurovaném rušiči nese zpráva také KONTURU ODEPŘENÍ S PÁSMEM NEJISTOTY, a nikoli konturu odečtenou z jednoho skaláru: celé měřené rozdělení C/N₀ užitečného signálu přes tabulku jednotlivých družic (n, min, p05, p25, medián, p75, p95, max, průměr, výběrová směrodatná odchylka a vlastní asymetrie výběru) a konturu vyhodnocenou v každé z těchto pořadových statistik podle OBOU kritérií odepření, která engine uznává — zavedeného kritéria poměru výkonů (J/S = { "30" } dB, jako v attack-surface a tracking-loop) a kritéria ztráty zachycení (efektivní C/N₀ klesající na tracking_threshold_dbhz, kritérium, které používá sloupec stavu této zprávy) — na obou osách roviny odepření (požadované EIRP rušiče při odstupu scénáře, odstup odepření při EIRP scénáře). Meze pásma JSOU contour(p05) a contour(p95), tatáž mapa v uzavřeném tvaru aplikovaná na vlastní kvantily výběru: nikoli sigma nafitovaná na výběr a nikoli medián ± k·stdev, přičemž stdev se vydává kvůli kontinuitě a nic ho nepoužívá. Kvantil, který je již na úrovni prahu sledování nebo pod ní, nemá žádné konečné odpírající J/S a jeho sloupce ztráty zachycení jsou null s započítaným důvodem, nikdy ořezaný poloměr.

seg-6fe8b3c6c584 = Graf, který engine zapisuje pro scenarios/lunar-jamming.toml, druh lunar-jamming

seg-200e58e189c2 = Modelovaný společný vícetechnikový odhadovač dávky pro lunární určování oběžné dráhy a hodin na SIMULOVANÉ síti: snímkový fit Gauss-Newton, který slučuje geodetická zpoždění VLBI na zemských základnách, lunárně místní vzdálenosti stanice↔družice a vzdálenosti mezi družicemi, aby společně obnovil 3D polohu lunární povrchové stanice, polohy malé konstelace a posun hodin každého prvku z vložené pravdy. Hlavní čestný výsledek — VLBI činí úplnou 3D polohu stanice pozorovatelnou tam, kde samotné lunárně místní měření vzdálenosti ponechává slabě pozorovaný směr — se uvádí jako kontrast chyby stanice s VLBI a bez VLBI. MODELLED simulovaná obnova uzavřenou smyčkou (pravda sdílí model pozorování), deterministické (seedované), NEOVĚŘENO na reálných datech; bez propagace silového modelu uvnitř řešiče; bez TRL/heritage/podpory agentury.

seg-cfa051b87e59 = Graf, který engine zapisuje pro scenarios/lunar-joint-od-clock.toml, druh lunar-joint-od-clock

seg-25455a33523c = Sedmiparametrové Helmertovo datum lunárního rámce řízené SKUTEČNOU, ARCHIVOVANOU pozorovací kampaní místo simulované. Zatímco lunar-frame-campaign odstranil vloženou transformaci, ale síť stanic, plán a sigma na pozorování stále uváděl jako ILLUSTRATIVE vstupy, tento druh bere všechny tři z měření: epochy jsou časy pozemního vysílání archivovaných normálních bodů ILRS Consolidated Laser Ranging Data, pozorování jsou laserová měření vzdálenosti skutečně vystřelená na pět retroreflektorových polí na Měsíci a každá váha pozorování je vlastní archivovaná preciznost onoho normálního bodu bin_rms/sqrt(n_raw) vyčtená ze souboru. Souřadnice stanic pocházejí z řešení SLR IERS ITRF2020 (propagovaného na epochu jejich publikovanými rychlostmi) a souřadnice odražečů z JPL DE430 Table { "7" } v rámci střední Země / střední rotace, který realizuje model IAU { "2015" } WGCCRE. Parciální derivace vzdálenosti se akumulují do společné Fisherovy informační matice souřadnic odražečů a propagují se toutéž Helmertovou návrhovou maticí do kovariance datumu, diagnostikované pomocí crate::fim::crlb. Hodnost, defekt, podmíněnost, spektrum, nepozorovatelné směry v sedmiparametrové bázi, nejslabší směr při plné hodnosti a podíl každého parametru na něm se vydávají při každém běhu a neomezený parametr se publikuje jako NULL se stavem. Korelace mezi poli je MEASURED jako přesně nulová, nikoli předpokládána, protože laserové měření vzdálenosti se dotýká jednoho pole. Záznam, který katalogy neumějí umístit — stanice bez publikované polohy ITRF — je PŘESKOČEN A SPOČÍTÁN, nikdy se mu nedosadí náhradní souřadnice. KTERÉ SPOJE JSOU MEASURED A KTERÉ JSOU MODELLED, TO JE SAMOTNÁ ZPRÁVA, NE POZNÁMKA POD ČAROU: efemeridy středu Měsíce a orientace tělesa IAU zůstávají modelované a jejich společná velikost se vydává jako rozdíl pozorované minus vypočtené jednosměrné vzdálenosti přes každý použitý bod; troposféra, slapy pevného tělesa, excentricita stanice, pohyb pólu, UT1-UTC, relativistické zpoždění a hodiny stanic chybějí a jsou uvnitř tohoto rezidua. Protože chyba efemeridy se do kovariance dostává jen přes směr každé přímé viditelnosti, každý běh také znovu řeší celé datum se všemi parciálními derivacemi nakloněnými o sensitivity_tilt_deg (se střídavým znaménkem) a vydává poměr, takže necitlivost kovariance k modelované efemeridě je číslo, nikoli argument. Vlastní hodnoty simulované kampaně se SPOUŠTÍ a vypisují vedle změřených, nepřepisují se. MODELLED: sedmiparametrové hodnoty jsou Cramerova–Raova mez pro zredukovanou množinu parametrů na skutečném plánu — nikoli vyřešené datum, nikoli analýza LLR a nikoli geodetický produkt. Uložený řez reálnými daty se dodává s repozitářem, ale ne s publikovaným balíkem (crate); nasměrujte data_dir na jeho kopii.

seg-e4da113cbe18 = Graf, který engine zapisuje pro scenarios/lunar-llr-datum.toml, druh lunar-llr-datum

seg-f7ea776e70c9 = Modelované pokrytí lunární referenční stanicí: průchod modelu lunárního diferenciálního PNT metodou Monte Carlo přes uživatelskou mřížku u jižního pólu a den epoch. Diferenciální referenční stanice na známém místě u jižního pólu koriguje uvedenou konstelaci (ilustrativní keplerovskou nebo tabelovanou efemeridu) s uvedenou chybou signálu v prostoru, chybou zaměření, latencí korekce a kvantizací spoje; pro každý bod i pro celou oblast uvádí percentil korigované a nekorigované chyby polohy (3D, horizontální, vertikální), dostupnost, pokrytí vůči uvedenému prahu, ochranné úrovně DO-229E, poloměr pokrytí podle azimutu a rozpočet korekčního spoje na stanici a v nejhorším bodě. Není to tvrzení o výkonnosti žádného skutečného systému; bez spojení s žádnou agenturou ani její podpory. MODELLED.

seg-922b8656fcae = Graf, který engine zapisuje pro scenarios/lunar-station-coverage.toml, druh lunar-station-coverage

seg-cac3a0bcbfc6 = MODELLED celkový rozpočet časové chyby koordinovaného lunárního času (LTC): sedm členů chyby LTC sestavených jako křivky časové chyby x_i(τ) přes celou mřížku dob průměrování, sečtených odmocninou součtu čtverců do x_Σ(τ), a PRŮSEČÍK hodin a rámce τ, ve kterém rostoucí člen hodin převýší konstantní člen realizace rámce v reálném čase (pod ním je rozpočet omezen rámcem, nad ním hodinami) — čestná odpověď na artefakt jediného τ. Sklony τ jsou v uzavřeném tvaru a analyticky ověřitelné (hodiny τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, podlahy τ^{ "0" }, měření τ^{ "{" }-1/2{ "}" }) a řádky hodin reprodukují publikované jednodenní specifikace hodin (crate::clock_specs); VELIKOSTI podlah spoje RF/optického, realizace rámce, relativistického rezidua a efemeridy jsou modelované alokace rozpočtu (zdokumentované výchozí hodnoty, volající je může přepsat), nikoli měření. Přínosem je reprodukovatelný průsečík τ, nikoli hodnota jednotlivého členu s certifikací; bez certifikace pro provozní udržování času.

seg-56fe184f2a12 = Graf, který engine zapisuje pro scenarios/lunar-time-budget.toml, druh lunar-time-budget

seg-7f3e13712f10 = Modelovaná relativistická rychlost chodu hodin Země–Měsíc (lunární souřadnicový čas, LTC/TCL): sekulární rychlost LTC−TT z rozdílu vlastních potenciálů a kinetického členu Měsíce, uváděná spolu s publikovaným pásmem { "56" }–{ "59" } µs/den, plus akumulovaný posun za horizont.

seg-e9deb6ed41c1 = Graf, který engine zapisuje pro scenarios/lunar-time-offset.toml, druh lunar-time-offset

seg-1bc37634ba9f = Kovariance souřadnic stanic lunárního VLBI: parciální derivace zpoždění pozorovatelné lunar-vlbi akumulované přes explicitní PLÁN (základny x epochy) do Fisherovy informační matice, invertované a uváděné jako kovariance souřadnic stanic a sigma stanice pro každou souřadnici — vypočtený výstup enginu, nikoli skalární preciznost zpoždění protlačená předpokládaným izotropním faktorem ekvipartice g = { "3" }. Stav nese souřadnice stanic vázané na Zemi (ITRS), takže Jacobián je inerciální parciální derivace otočená maticí GCRS->ITRS každé epochy: rotace Země je to, co činí tyto souřadnice pozorovatelnými, a zpráva MĚŘÍ zametení přímé viditelnosti vázané na Zemi a deklinaci majáku, místo aby je předpokládala. Jedno pozorování je jedna dvojice (základna, epocha), kdy OBĚ stanice jsou nad elevační maskou, s váhou 1/delay_sigma_s^{ "2" }. Při každém běhu uvádí hodnost, defekt datumu, číslo podmíněnosti, celé informační spektrum, kovarianční matici, sigma stanic po osách i 3D a nulový prostor volné sítě; při nedostatečné hodnosti se hlavní sigma publikuje jako NULL se stavem, nikdy se nevyčte z téměř singulární inverze. Hodnota ekvipartice c<em>delay_sigma_s</em>sqrt(g/N) pro TENTÝŽ plán se vydává vedle vypočtené hodnoty s poměrem, spolu s izotropní stopovou mezí sqrt(p/trace(M)), kterou AM-HM činí pevnou podlahou — takže poměr je anizotropie, kterou předpoklad zahodil. Uzávěr zpoždění tau_ik = tau_ij + tau_jk činí geometricky nezávislými jen n-1 z n(n-1)/2 základen; zpráva uvádí oba počty. MODELLED: efemeridy středu Měsíce, hodiny stanic, troposféra a parametry orientace Země jsou drženy PEVNĚ a pozorování se pokládají za nezávislá, takže kovariance je Cramerova–Raova mez pro zredukovanou množinu parametrů, nikoli předpovězený výsledek relace; sigma zpoždění, souřadnice stanic a plán jsou vstupy. Parciální derivace, kterou Jacobián geometrického zpoždění vynechává (diferencovaný Shapirův člen), je měřena konečnou diferencí a vydávána. Nejde o geodetický produkt.

seg-19c383444296 = Graf, který engine zapisuje pro scenarios/lunar-vlbi-fim.toml, druh lunar-vlbi-fim

seg-e01f77d493a0 = Modelovaná geodetická pozorovatelná zpoždění lunárního VLBI: zemská základna (dvě pozemní stanice, GCRS) pozoruje jednosměrný signál z majáku třídy NovaMoon na lunárním povrchu. Vydává zpoždění jako rozdíl dvou vzdáleností v blízkém poli, jeho rychlost a korekci zakřivení vlnoplochy v blízkém poli přes přelet — křížově ověřeno proti pozorovatelné Δ-DOR s rovinnou vlnou ve stejné kódové základně v limitě dalekého pole, s parciálními derivacemi ověřenými konečnou diferencí. Výchozí analytická cesta je MODELLED a nese výhrady ke konzistenci rámců, k pohybu pólu xp=yp={ "0" } a k rovinné vlně oproti blízkému poli. Nastavení planetary_kernel_path, earth_orientation_kernel_path a moon_orientation_kernel_path spustí místo toho cestu přes jádra (DE440, MOON_PA_DE440, ITRF93; konvergované barycentrické doby letu světla; přidává parciální derivace majáku a stanice v dané epoše), jejíž newtonovské zpoždění a parciální derivace se shodují s konvergovanými dobami letu světla NAIF SPICE na { "0.06" } ps a { "7.4e-9" }. Neověřeno proti skutečným datům VLBI.

seg-07d97fc1abac = Graf, který engine zapisuje pro scenarios/lunar-vlbi.toml, druh lunar-vlbi

seg-28c6a5644152 = Modelovaná analýza objemu služby lunární navigace z ILLUSTRATIVE konstelace třídy Moonlight/LCNS na lunární oběžné dráze z veřejných zdrojů (bez spojení s ESA): prochází mřížku selenografické šířky/délky přes časový horizont a uvádí DOP / pokrytí / dostupnost (≥{ "4" } družic A PDOP < práh) plus obálku zobecněné lunární ochranné úrovně ARAIM (HPL/VPL) přes objem. Geometrie DOP POUŽÍVÁ ZNOVU jádro (crate::orbit::dop) s úrovní VALIDATED vůči gnss_lib_py; ochranná úroveň POUŽÍVÁ ZNOVU aparát lunárního ARAIM LunaNet LNIS (crate::lunar, σ_URE≈{ "30" } m) a jako zvláštní případ se redukuje na existující PL u jižního pólu. MODELLED kompozice: sada relé s kruhovými/eliptickými keplerovskými drahami (nikoli skutečná diferenciálně korigovaná efemerida LCNS/NRHO), Měsíc se střední rotací (bez librace / precesujícího pólu). Deterministické (čistá geometrie). Bez TRL/heritage/podpory agentury.

seg-edb738273a3a = Graf, který engine zapisuje pro scenarios/moonlight-service-volume.toml, druh moonlight-service-volume

seg-f994c81583bf = MODELLED test nezávislého estimátoru prahu pozorovatelnosti podle délky cislunárního oblouku. Tento práh je čtení HODNOSTI z matice pozorovatelnosti sestavené z ANALYTICKÝCH řádků jakobiánu vzdálenosti a z ANALYTICKÉ variační přechodové matice a jeho křížová kontrola filtrem odmocniny informace skládá tytéž řádky: je to kontrola konzistence mezi dvěma numerickými stroji, nikoli potvrzení. Tento druh dodává chybějícího arbitra: dávkový estimátor nejmenších čtverců, který skutečně OBNOVUJE počáteční stav hlavní družice ze simulovaných měření, přičemž parciální derivace měření jsou brány jako CENTRÁLNÍ KONEČNÉ DIFERENCE složeného předního modelu. Nevolá žádný analytický řádek jakobiánu, žádnou variační STM, žádný rozklad podle singulárních ani vlastních čísel, žádnou toleranci hodnosti ani žádný filtr odmocniny informace -- zdrojový strážce v tests/cislunar_arc_recovery_reference.rs to činí vynutitelným --, zatímco dynamika (týž tok RK4 CR3BP), počáteční podmínky (táž diferenciálně korigovaná konstelace), skalární pozorovatelná a mřížka epoch jsou sdíleny záměrně a pojmenovány ve vydaném bloku <c1/>, protože dvě analýzy téhož fyzikálního problému se musí shodovat ve fyzice, aby byly srovnatelné. Dvě kritéria, každé procházené přes pět dekád vlastní meze: OBNOVA BEZ ŠUMU (chyba konečného stavu každého zasetého pokusu nejvýše recovery_factor krát jeho apriorní posun -- analogie hodnosti, bez tolerance singulárních čísel) a ODHADNUTELNOST METODOU MONTE CARLO (naměřená chyba polohy RMS přes soubor zasetého šumu pod uvedenou mezí -- analogie odhadnutelnosti, naměřená, nikoli predikovaná). Podporuje rovinný čtyřstavový a prostorový šestistavový model, rodiny DRO / halo L2 / NRHO L2, pozorovatelné vzdálenost a rychlost změny vzdálenosti a polární parametrizaci se středem v Měsíci, v níž se transformace aplikuje na STAV a přední model se tam znovu derivuje diferencemi. MEASURED na zveřejněné rovinné mřížce DRO: estimátor obnoví čtyřstav od { "0.782609" } h oproti { "2.086957" } h podle kritéria hodnosti při rel_tol { "1e-6" } (poměr { "0.375" }) -- práh hodnosti NENÍ potvrzen jako hranice obnovitelnosti --, zatímco naměřená hranice odhadnutelnosti leží ve stejné buňce mřížky jako formální, { "5.739130" } h, a naměřená křivka chyby reprodukuje formální 1 sigma přes { "21" } délek oblouku s poměrem geometrických průměrů { "0.98" }. MODELLED: návrh konstelace, mřížka epoch, jediný sledovaný spoj, velikost posunu, sigma měření a dvě uvedené meze. Nejde o produkt s certifikací navigačního výkonu.

seg-2fe411ae2153 = Graf, který engine zapisuje pro scenarios/cislunar-arc-recovery.toml, druh cislunar-arc-recovery

seg-7ccd0a3babb8 = MODELLED pozorovatelnost rovinné cislunární konstelace (P6): sleduje konstelaci čtyř družic na diferenciálně korigovaných rovinných drahách DRO s meziddružicovým měřením vzdálenosti a uvádí, jak velká část čtyřstavu [x,y,ẋ,ẏ] družice je na oblouku pozorovatelná. Vydává ({ "1" }) tabulku hodnosti podle délky oblouku pro jediný spoj jen se vzdáleností -- okamžitě hodnost 1, rostoucí k plnému čtyřstavu s prodlužováním oblouku (P6 Table { "1" }); ({ "2" }) spektrum vlastních čísel Gramiánu pozorovatelnosti a číslo podmíněnosti přes oblouk; ({ "3" }) srovnání okamžité hodnosti jen se vzdáleností a se vzdáleností plus její rychlostí změny (návrhová páka Doppler) spolu s hlášením GDOP, které je singulární pro jen vzdálenost a definované pro vzdálenost plus rychlost; a ({ "4" }) nezávislou křížovou validaci SRIF, jejíž posteriorní kovariance se stane konečnou a dobře podmíněnou přesně na oblouku, kde pozorovatelná hodnost dosáhne čtyř. VALIDATED jádro: pozorovatelná hodnost je práh singulárních čísel odhalující hodnost, zkontrolovaný proti hodnosti z vlastních čísel Gramiánu; spektrum vlastních čísel splňuje spektrální invarianty (stopa=Σλ, det=Πλ, Frobenius²=Σλ²); variační STM je STM CR3BP ověřená konečnými diferencemi; řádky jakobiánu vzdálenosti a rychlosti změny vzdálenosti jsou analytické parciální derivace ověřené konečnými diferencemi (zkontrolované proti 3-D pozorovatelné rychlosti změny vzdálenosti v crate); čtyři počáteční podmínky jsou diferenciálně korigované rovinné DRO, které se uzavírají na těsné reziduum periodicity a jsou retrográdní; přechod hodnosti je křížově validován proti filtru odmocniny informace v crate (posteriorní kovariance konečná přesně při plné hodnosti, cond(P)=cond(OᵀO)); snímek s deficitem hodnosti je označen jako GDOP-nedefinované (fim condition=inf), nikdy ne smyšlenou konečnou hodnotou -- stejná ochrana proti singulární geometrii, jakou používá pvt::solve_spp. MODELLED: návrh konstelace (amplitudy a fáze perilunia DRO) a konkrétní postup hodnosti, který vytváří. Nejde o produkt s certifikací navigačního výkonu.

seg-f15bbf30b0dd = Graf, který engine zapisuje pro scenarios/cislunar-observability.toml, druh cislunar-observability

seg-c8a8be4b8894 = Příjem GNSS ze Země v lunární vzdálenosti, vrstva slabého signálu, kterou jmenuje článek o odolnosti v konfliktu a pro niž engine neměl model. Družice GNSS míří anténou na Zemi; přijímač poblíž Měsíce je vzdálen asi patnáctinásobek orbitálního poloměru, takže se projevují tři věci najednou. Země ZAKRÝVÁ OSU ANTÉNY: z { "26,560" } km se jeví pod polovičním úhlem { "13.9" } deg, takže každý paprsek mířící k Měsíci musí vysílač opustit nejméně tolik stupňů od nadiru, což odstraní vrchol svazku ještě před výpočtem jakéhokoli výkonu. Zbývá OKRAJ HLAVNÍHO LALOKU A POSTRANNÍ LALOKY, režim, v němž užitečné zatížení LuGRE v roce { "2025" } skutečně pracovalo. A ztráta ve volném prostoru činí asi { "208" } dB na L1, zhruba o { "25" } dB více, než platí pozemní uživatel. Zpráva vydává jeden řádek na družici (úhel od osy, zakrytí Zemí, vzdálenost, ztráta šířením, zisk vysílače při tomto úhlu, přijatý výkon, poměr nosné k hustotě šumu) a agreguje jen spoje překračující práh sledování. TAKÉ UVÁDÍ PODMÍNĚNOST, protože právě ta vrstvu definuje: každá viditelná družice leží uvnitř kužele širokého z Měsíce několik stupňů, takže zorné přímky jsou téměř rovnoběžné, zhoršení přesnosti je obrovské a určení polohy ze Země-GNSS v lunární vzdálenosti je pozorování třídy ČASU mnohem spíše než třídy polohy. MODELLED, a důvodem je vysílací diagram: zisk v úhlu je rovnoměrná kruhová apertura (Airy), zatímco skutečná anténa GPS L1 je dvanáctiprvkové šroubovicové pole s tvarovaným hlavním lalokem a postranními laloky jiného než Airyho tvaru. Naměřené diagramy existují a nejsou zde přibaleny, takže pořadí a řády velikosti jsou smysluplné, ale dB jednotlivé družice nikoli. Záměrně CHYBÍ, a každé z toho činí rozpočet optimistickým: žádná ionosférická ani troposférická ztráta na paprscích dotýkajících se okraje, žádná polarizační ztráta, ztráta zaměřením ani implementační ztráta a kulová Země bez refrakčního rozšíření. Poloha Měsíce je VSTUP (vzdálenost plus inerciální směr), nikoli vyhledání v efemeridách, protože testovanou veličinou je spoj a geometrie svazku. Povýšení tohoto řádku na stupeň ověřeno proti nezávislé vnější referenci vyžaduje naměřený vysílací diagram a normální body LuGRE; ani jedno není v repozitáři a ani jedno se zde nevymýšlí.

seg-cf1dce5fc824 = Graf, který engine zapisuje pro scenarios/earth-gnss-lunar.toml, druh earth-gnss-lunar

seg-4e31c8daf798 = Registr

seg-efd15cff3d32 = MODELLED (označení výsledku)

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-a240ef37dc6d = Zdroj: <c1/>

seg-befef5f2f8dd = Lunární a cislunární (rodina druhů scénářů)

seg-369e7cfcc1d3 = Tematické stránky: <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. Spusťte jednu: <c1/>. Všechny rodiny: <a4>KINDS.md</a4>.

seg-15b8e26dc24b = Přehledový list grafů, které engine zapisuje pro druhy z rodiny Lunární a cislunární

seg-fd2a12be04c2 = Přelet s ochrannými úrovněmi ARAIM u lunárního jižního pólu oproti reprezentativní sadě relé LunaNet.

seg-240eb5858113 = Modelovaná relativistická rychlost chodu hodin Země–Měsíc (lunární souřadnicový čas, LTC/TCL): sekulární rychlost LTC−TT z rozdílu vlastních potenciálů a kinetického členu Měsíce, uvedená s publikovanými { "56" }–{ "59" }

seg-177bff8d753e = MODELLED kompletní rozpočet časové chyby koordinovaného lunárního času (LTC): sedm chybových členů LTC sestavených jako křivky časové chyby x_i(τ) přes celou mřížku průměrovacích dob, sečtených odmocninou součtu čtverců do x_Σ(τ), a

seg-df0437ef8324 = Modelovaná geodetická lunární pozorovatelná zpoždění VLBI: pozemní základna (dvě pozemní stanice, GCRS) pozoruje jednosměrný signál z majáku třídy NovaMoon na lunárním povrchu.

seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

seg-38254487fb7f = Kovarianční matice souřadnic stanic lunárního VLBI: parciální derivace zpoždění pozorovatelné lunar-vlbi akumulované přes explicitní HARMONOGRAM (základny x epochy) do Fisherovy informační matice, invertované a vyj

seg-23706714da99 = Modelovaný společný vícetechnikový odhadovač lunární OD a hodin v dávkovém režimu na SIMULOVANÉ síti: Gaussův–Newtonův snímkový fit, který slučuje geodetická zpoždění VLBI pozemní základny, lunární lokální vzdálenosti stanice↔družice

seg-2359450b3967 = Modelovaná realizace lunární referenční soustavy: fit datumu 7parametrické Helmertovy (podobnostní) transformace — { "3" } posun, { "3" } rotace malého úhlu, { "1" } měřítko — vázající odhadovanou sadu bodů MCMF odvozených ze selenografických

seg-2a5af9961e99 = Sedmiparametrické Helmertovo (podobnostní) datum soustavy řízené SIMULOVANOU POZOROVACÍ KAMPANÍ místo injektované transformace.

seg-3615bea1ea75 = Sedmiparametrické Helmertovo datum lunární soustavy řízené SKUTEČNOU, ARCHIVOVANOU pozorovací kampaní místo simulované.

seg-5413116b8b42 = Modelovaná analýza servisního objemu lunární navigace z ILLUSTRATIVE konstelace na lunární oběžné dráze ve stylu Moonlight/LCNS z veřejných zdrojů (bez vazby na ESA): prochází mřížku selenografické šířky/délky přes

seg-a0e202b3566c = Modelované lunární DIFERENCIÁLNÍ PNT (analogie lunárního DGNSS/SBAS): referenční stanice třídy NovaMoon na ZNÁMÉM selenografickém místě počítá diferenciální korekce pro jednotlivé družice z ILLUSTRATIVE

seg-ed4ec8b6378c = Modelované pokrytí lunární referenční stanicí: průchod modelu lunárního diferenciálního PNT metodou Monte Carlo přes uživatelskou mřížku u jižního pólu a den epoch.

seg-aeec32be6092 = Augmentace lunární orbitální navigační služby povrchovými majáky, jako spustitelná tabulka před/po.

seg-b28693368acd = Modelovaný lunární interoperabilní export: vydává lunární referenční soustavu, lunární časovou škálu a lunární efemeridy ve výměnných formách odpovídajících LunaNet/IOAG a založených na CCSDS, s kontrolou shody při zpětném převodu / v polích

seg-d88605893c05 = MODELLED pozorovatelnost rovinné cislunární konstelace (P6): sleduje konstelaci čtyř kosmických lodí v rovinných drahách DRO s diferenciální korekcí a s mezidružicovým měřením vzdálenosti a uvádí, jak velká část kosmické lodi

seg-8eaec90d1df5 = MODELLED test nezávislým odhadovačem prahu pozorovatelnosti délky oblouku cislunární dráhy.

seg-9619b3d699c6 = Útočná plocha zabezpečení signálu lunární povrchové navigace (P1): skládá otevřené analýzy zabezpečení signálu do jednoho běhu dosažitelného z binárního programu.

seg-64c78e211181 = Lunární nativní rušení RF: poměr rušič/signál pro jednotlivé družice, efektivní C/N₀ a ztráta zachycení pro selenografického povrchového uživatele při rušičce na lunárním povrchu (nebo zvýšené), nad ilustrativní veřejnou

seg-df68720ee7a5 = Příjem pozemního GNSS v lunární vzdálenosti, slabosignálová vrstva, kterou uvádí studie o odolnosti při konfliktu a pro niž engine neměl žádný model.

seg-e6475fe9f443 = MODELLED studie lunární oběžné dráhy a povrchu jako navigační a geodetické infrastruktury, pět studií za jedním druhem vybíraných pomocí <c1/>: od-consistency (palubní určování oběžné dráhy z pozemního GNSS v

seg-ca4fac406beb = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-da20b48985b9 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-integrity</a1>.

seg-564b491c4bb8 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>.

seg-0f0b2d0ca0b4 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-time-offset</a1>.

seg-128bf57a76d1 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-d6aa5d645fb7 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-time-budget</a1>.

seg-79140f2544ea = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>.

seg-de468e4d4b46 = <b>Registr:</b> MODELLED { "3" } · VALIDATED { "3" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-vlbi</a1>.

seg-7da3c3ff2386 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-3119d4005897 = <b>Registr:</b> MODELLED { "3" } · VALIDATED { "2" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-vlbi-fim</a1>.

seg-6f59a33a35b3 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-142f2253e4d6 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-joint-od-clock</a1>.

seg-32c31af24e1b = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-73c0415efd2f = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-frame-realisation</a1>.

seg-96efcb8d55d1 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

seg-ce2f0f85dda4 = <b>Registr:</b> MODELLED { "2" } · VALIDATED { "3" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-frame-campaign</a1>.

seg-d9e24a9a8c0c = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-4f05fad4b146 = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-llr-datum</a1>.

seg-8d9e0277303e = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>.

seg-6fe67fa619d0 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-c83350735643 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-differential-pnt</a1>.

seg-facc442295f1 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>.

seg-8a2f6f535c4a = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-station-coverage</a1>.

seg-a790c54ac1aa = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-4efffcd615df = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-beacon</a1>.

seg-720d0bbeaf6e = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-019ca0f1051e = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-interop-export</a1>.

seg-28695dd2ecc3 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-af5d871bc69e = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>cislunar-observability</a1>.

seg-f646e9fd7553 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-5e7bd8bb1adf = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>cislunar-arc-recovery</a1>.

seg-3c514f3acc78 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>.

seg-00b06a4fc0e0 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-attack-surface</a1>.

seg-079d2bb805f1 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-63d4157e2294 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-jamming</a1>.

seg-7bb977529f30 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-287f89e6bf6b = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>earth-gnss-lunar</a1>.

seg-f7ed8b60e7d1 = Povinná pole: <c1/>. Volitelná: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-41e50e49da99 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-infrastructure</a1>.

seg-09f7f99d04a6 = <s1>Předchozí</s1>Navigace na nízké oběžné dráze Země

seg-74c6bf83988e = <s1>Další</s1>Analýza misí, spoje a vesmírné operace

seg-ae3053a1f6c8 = MODELLED motorický výstup z jihopolárního povrchového místa na oběžnou dráhu setkání a kovariance polohy a rychlosti, kterou přenáší zpět na dráhu (ve stylu Artemis). Pětistavový inerciální model chyb po osách z lunar-descent (poloha, rychlost, bias akcelerometru, náklon polohy, bias gyroskopu, buzený specifickou silou) běží na všech třech osách místa od povrchového stavu, s nímž fáze vstupuje; určení polohy AFS z viditelných relé ILLUSTRATIVE konstelace třídy LCNS (samostatné, nebo diferenční s využitím rezidua korekčního spoje z lunar-differential-pnt, s podporou hodin, když jsou viditelná jen tři relé) se pořizuje v stanoveném intervalu, přičemž lunární čas vstupuje přes hodiny vozidla a chyba časové značky podél dráhy. Uvádí uzavřené inerciální zdroje, příspěvek podpory, ablaci, navigační 1 sigma po dobu výstupu, rozptyl vypnutí motoru vedle navigační znalosti a úplnou kovarianci 6x6 MCI při vložení se zachovanou korelací polohy a rychlosti. MODELLED: ilustrační třída IMU, specifická síla, sada relé a rozptyl vypnutí; chyby držené v osách místa startu; nominální výstupní stav je zástupný. Bez podpory agentury; software pouze poradního charakteru, nikoli certifikované navigační zařízení.

seg-463a919e84d5 = Graf, který engine zapisuje pro scenarios/lunar-ascent.toml, druh lunar-ascent

seg-2cd0d5385530 = MODELLED rozpočet rozptylu přistání pro motorický sestup na místo u jižního pólu (třída Artemis). Pro každou horizontální osu je pětistavový model inerciální chyby (poloha, rychlost, bias akcelerometru, náklon polohy, bias gyroskopu) řízen měrnou silou sestupu; sekvenční filtr přijímá polohové určení z povolených pomůcek: určení AFS z viditelných relé ILLUSTRATIVE konstelace třídy LCNS (samostatně, nebo diferenciálně s využitím rezidua korekčního spoje z lunar-differential-pnt, s podporou hodin, jsou-li viditelná jen tři relé) a určení podle terénu (porovnávač TERCOM/SITAN v crate na syntetickém reliéfu, nebo Cramérova–Raova mez porovnávání výškového okna skutečného jihopolárního DEM z LOLA). Lunární čas vstupuje přes hodiny vozidla při určeních (posun LTC-TT z lunar-time-offset nebo nejistota jeho zveřejněného pásma) a jako chyba časové značky podél dráhy. Uvádí 3sigma elipsu přistání, R95, inerciální zdroje v uzavřeném tvaru, příspěvek každé pomůcky, ablaci každé kombinace pomůcek, kalibraci elipsy metodou Monte Carlo a předávanou kovarianci. MODELLED: ilustrativní třída IMU, sada relé, profil sestupu a naváděcí člen; navigace podle terénu používá syntetický reliéf v měřítku metrů na Zemi; dostupnost AFS je jedna epocha na plochém prahu. Bez podpory agentury; software pouze poradního charakteru, nikoli certifikované navigační zařízení.

seg-8073ece4c900 = Graf, který engine zapisuje pro scenarios/lunar-descent.toml, druh lunar-descent

seg-2deefd8c547b = MODELLED relativní navigace pro dokování ve stylu Orion–lander na nízké lunární oběžné dráze nebo eliptické polární dráze (třída Artemis). Chaser a cíl létají po téže dráze podle lunárního modelu sil v crate; společný dávkový odhad Gauss–Newton s 21 parametry přes oblouk (dva stavy vozidel a trvalé biasy signálu v prostoru) slučuje absolutní polohové určení pro každé vozidlo ze sady relé ILLUSTRATIVE třídy LCNS (relé za Měsícem se vyřadí, potřeba jsou čtyři, společná složka chyby signálu v prostoru se mezi vozidly vyruší) a křížový odhad vzdálenosti, s přesností měření vzdálenosti danou mezí sledování kódu na pilotu LunaNet AFS. Uvádí formální chybu relativní polohy a rychlosti i chybu metodou Monte Carlo v osách LVLH cíle, dostupnost určení, střední normalizovanou kvadratickou chybu odhadu oproti její očekávané hodnotě a každý pokus, jehož iterace nezkonvergovala, drift vzniklý zanedbáním gravitačních harmonických a úplnou kovarianci 6x6 předávanou dál. Pro kruhový případ platí kontrola v uzavřeném tvaru podle Hilla/Clohessyho–Wiltshirea. MODELLED: ilustrativní sada relé, rozpočet chyb a apriorní hodnoty; skutečnost a odhadovač sdílejí jeden model sil, takže NEES kontroluje vnitřní konzistenci a nikoli chybu modelu. Bez podpory agentury; software pouze poradního charakteru, nikoli certifikované navigační zařízení.

seg-d97b2505ac72 = Graf, který engine zapisuje pro scenarios/lunar-orbit-rendezvous.toml, druh lunar-orbit-rendezvous

seg-6c7d25f672fb = MODELLED dostupnost určování polohy a času na povrchu podle místa a ročního období pro jihopolární místa třídy Artemis. Pro každé místo a období (epochu a okno po ní) uvádí polohování pomocí relé (čtyři a více relé ILLUSTRATIVE konstelace třídy LCNS ve výhledu a PDOP pod prahem, ze stejných funkcí jako moonlight-service-volume a s oddílem terénu také s horizontem vykresleným metodou ray-marching z terénu lunar-station-coverage), zda jsou Země a Slunce nad horizontem místa (analytická poloha Slunce a Měsíce a orientace Měsíce, včetně librace, která se s ročním obdobím mění), a dostupnost času (relé nebo Země ve výhledu) s nejdelším úsekem, kdy není ani jedno, tedy s holdoverem, který musí povrchové hodiny překlenout. Výsledek pro jedno místo se rovná výsledku moonlight-service-volume na bit. MODELLED: ilustrativní keplerovská sada relé na Měsíci s průměrnou rotací; údaj o relé se s ročním obdobím nemění; terén je výřez LOLA { "1200" } m. Bez podpory agentury; software pouze poradního charakteru, nikoli certifikované navigační zařízení.

seg-94b84de6c958 = Graf, který engine zapisuje pro scenarios/lunar-surface.toml, druh lunar-surface

seg-8350d49efd47 = { "24" } druhů scénářů enginu v{ $version }. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-3505720b0990 = MODELLED motorický výstup z jihopolárního povrchového místa na oběžnou dráhu setkání a kovariance polohy a rychlosti, kterou si nese zpět na oběžnou dráhu (třída Artemis).

seg-9d18dfb871ed = MODELLED dostupnost určování polohy a času na povrchu podle místa a ročního období pro jihopolární místa třídy Artemis.

seg-a8d90ed1d52f = MODELLED rozpočet rozptylu přistání pro motorický sestup na místo u jižního pólu (třída Artemis).

seg-737aa6f80fe3 = MODELLED relativní navigace pro dokování ve stylu Orion–lander na nízké lunární oběžné dráze nebo eliptické polární dráze (třída Artemis).

seg-66982ad26e2b = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-ecdaa89c9219 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-ascent</a1>.

seg-6f1fd4e8089d = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-e403a675bcc4 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-surface</a1>.

seg-aa1a7b2ca934 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>.

seg-059a45d0512e = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-descent</a1>.

seg-1618206b62b1 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>.

seg-d1f8d70eb309 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>lunar-orbit-rendezvous</a1>.

seg-f87c103758f3 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>moonlight-service-volume</a1>.
