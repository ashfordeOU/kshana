# docs--receiver-trust: translations (cs)

seg-adc34608c46b = Třída

seg-2247a2344710 = Význam

seg-fdbb9db68f1d = žádné

seg-f63dd3d7aad4 = Zdroj

seg-98151954f217 = false

seg-c353e7bec219 = Klíč

seg-cc38b40eb7a5 = Monitor

seg-7670cf4ceda3 = Výchozí hodnota

seg-a0cc45088f5f = GSV

seg-26ab8544afba = Skóre důvěry během jednoho syntetického přechodu, ze skutečného běhu enginu v{ $version } na examples/maritime-trust (vymyšlený záznam NMEA z trajektu na trase Tallinn–Helsinki, { "3001" } epoch při { "1" } Hz). Tři dráhy sdílejí jednu časovou osu. Nahoře: vzdálenost mezi polohou hlášenou přijímačem a skutečnou polohou plavidla, která zůstává v rozmezí několika metrů do asi { "1576" } s, kdy ji skriptované odtažení polohy v záznamu odtáhne, zatímco přijímač dál hlásí platný fix. Uprostřed: skóre důvěry od { "0" } do { "100" }, nepočítané během prvních { "300" } s kalibrace, v pásmu nominal (alespoň { "90" }) do odtažení, poté klesající skrz pásmo degraded (alespoň { "55" }) do pásma untrusted. Dole: pásmo každé epochy jako barevná stuha s jeho názvem. Skóre je poradní. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel. Záznam je vymyšlen, aby ukázal formát a monitory; není to měření a nic nevypovídá o tom, jak by si jakýkoli přijímač vedl.

seg-7000c522cc93 = Vlastní příznak spoofingu přijímače proti poplachům Kshana, ze skutečného běhu enginu v{ $version } na vymyšleném záznamu UBX ({ "200" } epoch při { "1" } Hz). C/N0 klesá o { "20" } dB v { "80" } až { "90" } s a { "120" } až { "130" } s; přijímač příznak nastavuje v { "120" } až { "130" } s a { "160" } až { "165" } s. Ze { "140" } epoch porovnaných po kalibraci jich { "11" } označily oba, { "6" } jen přijímač, { "11" } jen Kshana a { "112" } žádný. Žádná strana není referenční pravda a shoda není validace. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

# c1: docs/RECEIVER-TRUST.md
seg-caadaad98cf6 = Zdroj: <c1/>

seg-4f10c2397fcc = Důvěra v přijímač: posuzování skutečného záznamu přijímače GNSS

# c1: kshana receiver-trust
seg-2596bdcdaf8e = <c1/> čte záznam ze skutečného přijímače globálního družicového navigačního systému (GNSS), provozuje nad ním monitory důvěry epochu po epoše a říká, kdy a proč přestalo být určení polohy přijímače důvěryhodné. Umí také ohodnotit záznam proti událostem a předpovědím, které stanovíte <b>před</b> během: zda byla každá událost detekována včas a zda modelovaný pokles hustoty nosné k šumu (C/N0) souhlasí s tím, co přijímač naměřil.

seg-63f24d5f2d5e = Pozorované veličiny jsou vlastní veličiny přijímače; monitory a jejich prahy jsou vlastní enginu a vaše. Každý výsledek nese toto označení, SHA-256 záznamu a každý práh, s nímž běžel, takže běh lze opakovat a auditovat.

# c1: MARITIME-TRUST.md
seg-6f5014b93fbc = Pro plavidlo za plavby, s živým skóre a volitelnou bránou před systémem map, viz <a1><c1/></a1>.

# c1: session.result.json
# c2: session.trust.csv
# c3: session.trust.svg
# c4: path
seg-82cdabb6086f = Zapíše <c1/>, <c2/> (jeden řádek na epochu) a <c3/> (průměrné C/N0 v čase se stavem důvěry pod ním) vedle scénáře a vypíše jednořádkový verdikt. Příkladový záznam je syntetický, vytvořený k ukázce formátu; v <c4/> nasměrujte na záznam vlastního přijímače.

# c1: MARITIME-TRUST.md
seg-ec2be1ea73f5 = Obrázek výše je ukázka plavidla z <a1><c1/></a1>: vymyšlený záznam, poradní skóre.

# c1: kshana.receiver_trust(toml)
# c2: receiver_trust(toml)
# c3: assess_receiver_log
seg-0f24c5cf4b9b = Tentýž scénář běží z Pythonu (<c1/>), z balíčku WebAssembly (<c2/>, se záznamem vloženým přímo) a z nástroje <c3/> serveru Model Context Protocol (MCP).

seg-1f3cc12b6230 = Záznamy, které čte

seg-23fd4a5bf5dd = Co se čte

seg-2e1a655cf846 = Binární formát u-blox

# c1: jamInd
# c2: spoofDetState
# c3: self_report
seg-cb31da7b7d88 = NAV-SAT C/N0, elevace a azimut po družicích, poloha NAV-PVT, MON-RF automatické řízení zesílení (AGC) a indikátor rušení <c1/>, týden NAV-TIMEGPS a vlastní příznaky přijímače: NAV-STATUS <c2/> a SEC-SIG (<c3/>, viz <a1>RECEIVER-PROTOCOLS.md</a1>)

seg-cec582f4afa5 = Pozorovací soubor RINEX { "3" }

# c1: S
# c2: nav
seg-57708a636148 = kódy <c1/> (C/N0) na družici a signál; s vysílaným navigačním souborem (<c2/>) pseudovzdálenosti pro vlastní určení polohy enginu

seg-176c2493782e = CSV z Android GnssLogger

# c1: Raw
# c2: AgcDb
# c3: Fix
seg-d69b9dd6ebad = řádky <c1/>: C/N0 a <c2/> na družici; řádky <c3/>: poloha

seg-d390120374a9 = Text NMEA { "0183" }

seg-9eb885aa79af = GSV poměr signálu k šumu na družici (dB-Hz, s ID signálu { "4.10" } nebo bez něj) a její elevace a azimut, GSA faktor DOP (zhoršení přesnosti) a použité družice, GGA a RMC čas a poloha

seg-7864926ce37e = Binární formát Septentrio ({ "0.38" }, pouze čtení)

seg-44675c4bdf40 = poloha PVTGeodetic, C/N0 MeasEpoch na družici a signál, počet pásem RFStatus; viz <a1>RECEIVER-PROTOCOLS.md</a1>

# c1: .pos
seg-a5367d75c5ee = Soubor řešení RTKLIB (<c1/>)

seg-37d28ca5ed00 = čas, poloha (zeměpisná šířka/délka nebo ECEF, převedeno) a použité družice na epochu; soubory ve stupních, minutách a vteřinách jsou odmítnuty se zprávou

seg-5e10ecb93f96 = Textové nebo binární záznamy NovAtel OEM7

# c1: BESTPOS
# c2: RANGE
# c3: RXSTATUS
# c4: self_report
# c5: receiver-self-report
seg-a630fbcf7425 = poloha <c1/> (pouze vypočtené řešení), C/No <c2/> na družici a signál; příznaky rušiček <c3/> se stávají <c4/> epochy (stav rušení { "2" }, když přijímač označí rušičku, { "1" }, když ne; v RXSTATUS neexistuje příznak spoofingu), postavené proti poplachům Kshany srovnáním <c5/>

seg-d4735b581cbf = Proudy GNSS-SDR Monitor a PVT-monitor jako řádky JSON

# c1: integrations/gnss-sdr/relay.py
seg-053235d67fb3 = C/N0 po kanálech, určení polohy, použité družice, HDOP, azimut a elevace; vytváří <c1/>

# c1: MACHINE-INPUTS.md
seg-2e9033aa4e9d = Podrobnosti, zdroje a omezení těchto tří: <a1><c1/></a1>.

# c1: source_span
# c2: [start, end)
# c3: >
# c4: Raw
# c5: Fix
# c6: Raw
seg-8987b2c46eb0 = Každá epocha, kterou čtečky vytvoří, nese také <c1/>, bajtové posuny <c2/> do vstupu: nejmenší souvislý rozsah obsahující záznamy, které k ní přispěly, takže přesný surový výřez lze zahashovat pro okno události. NMEA: každý řádek přečtený, dokud je epocha aktuální (nadmnožina tam, kde mezi jejími větami stojí nesouvisející řádek). UBX: rámce epochy. RINEX { "3" }: záznamy epochy od každého řádku <c3/> do dalšího. Android: řádky <c4/> epochy (řádek <c5/> jen pro epochu bez řádků <c6/>). Chybí u živého proudu a všude tam, kde není dobře definováno (RINEX { "2" }).

# c1: path
# c2: text
# c3: base64
seg-cea9532b57a2 = Soubor se předává přes <c1/> (vyhodnoceno vůči složce samotného scénáře), nebo vložený jako <c2/> či <c3/> (jediné možnosti v prohlížeči).

seg-3bc4f9c91950 = Záznam IMU jako druhý senzor

# c1: [log.imu]
seg-49b10ad5928e = <c1/> přidává inerciální záznam na stejných hodinách:

# c1: heading0_deg
# c2: heading-course
# c3: heading_sensor = true
# c4: hdg_cog_tol_deg
# c5: csv
# c6: MACHINE-INPUTS.md
# c7: text
# c8: base64
# c9: path
seg-9e0560b09f5a = Úhlová rychlost stáčení se integruje z <c1/> a doplňuje kurz všude, kde záznam přijímače žádný nenese, takže monitor <c2/> (který na platformě potřebuje <c3/>) srovnává kurz z gyroskopu s kurzem nad zemí. Gyroskop driftuje: kurz je tak dobrý, jak dobré je okno integrace, a <c4/> rozhoduje, co se považuje za neshodu. Rozložení <c5/> je zdokumentováno v <c6/>. Bajty IMU jsou součástí hashe scénáře i hashe scénáře balíčku důkazů. Vložení (<c7/>/<c8/>) funguje na každém povrchu; <c9/> je odmítnuta tam, kde se soubory nečtou.

seg-fd3e6ef1cd93 = Platforma: statická nebo plavidlo

# c1: [platform]
# c2: static
seg-b67c0d57dc1d = Výše uvedené monitory předpokládají pevnou anténu. Scénář stanoví platformu před během v tabulce <c1/> nejvyšší úrovně; bez ní je platforma <c2/> a nic se nemění.

seg-3d6bc18bd83e = Proč tato hodnota

seg-32f339f63acf = Nad provozní rychlostí obchodních trupů a většiny osobních plavidel, takže jí skutečné plavidlo nikdy nedosáhne; daleko pod rychlostí, kterou implikuje odtažení polohy. Pomalejší plavidlo má stanovit nižší limit: čím nižší limit, tím dříve se odtažení zachytí.

seg-9506e8601857 = Velká loď mění rychlost o mnohem méně než { "0.1" } m/s²; malé rychlé plavidlo dosáhne při prudké změně plynu několika desetin.

seg-b0b6baaee456 = Velká loď se otáčí rychlostí hluboko pod { "1" } °/s a malé plavidlo při prudké zatáčce několika.

seg-53d0fffb3c09 = Vlastnost instalace; odhad by byl skrytým prahem.

# c1: true
seg-ac48403443f9 = Deklarováno <c1/> a v záznamu chybí je chyba, takže chybějící senzor nemůže projít jako čistá kontrola.

# c1: kind = "static"
# c2: position-jump
# c3: monitor_config
seg-8266739dc26b = Klíče plavidla jsou pod <c1/> odmítnuty. Pro plavidlo monitor <c2/> neběží, protože měří vzdálenost od kalibračního průměru, což je u pohybující se antény chybné; <c3/> výsledku zaznamenává platformu a použité limity.

# c1: kshana nmea-scenario
seg-7551792a0cb4 = Syntetické proudy NMEA z <a1><c1/></a1>, vytvořené pro výcvik posádek, čtečka NMEA přijímá a lze je tímto druhem spustit jako jakýkoli záznam NMEA.

seg-18d7538bc56d = Monitory

# c1: monitors_run
# c2: calibration_s
seg-e5c1cb89f0b3 = Každý monitor potřebuje svá data; monitor, jehož data v záznamu nejsou, neběží a není uveden v <c1/>. Prvních <c2/> sekund (výchozí { "60" }) stanoví základ a nikdy nevyvolá poplach.

seg-3be9ee05f087 = Poplach při

seg-98ead58c671d = Potřebuje

# c1: cn0_drop_db
seg-f6e6df453260 = průměrné C/N0 přes družice společné se základem klesne o <c1/> nebo více (výchozí { "6" } dB)

# c1: sats_lost
seg-d9bf6efc6835 = sledované družice klesnou o <c1/> nebo více pod medián základu (výchozí { "4" })

# c1: agc_k_sigma
seg-60c7a99f9819 = hodnota AGC se odchýlí od svého základu o více než <c1/> směrodatných odchylek (výchozí { "5" })

# c1: AgcDb
seg-7c1c65e64418 = UBX MON-RF nebo Android <c1/>

# c1: jamInd
# c2: jam_ind_threshold
seg-a5a5252417cb = <c1/> u-blox překročí <c2/> (výchozí { "80" } z { "255" })

seg-8bca191bf4c4 = UBX MON-RF

# c1: position_jump_m
seg-0ac4898d81cf = vlastní určení polohy přijímače je od svého kalibračního průměru vzdáleno více než <c1/> (výchozí { "50" } m)

seg-6a3fec1214b9 = hlášená poloha

seg-4c05faf783eb = paritní autonomní monitorování integrity v přijímači (RAIM) na vlastním jednobodovém určení polohy enginu zamítne sadu měření

# c1: nav
seg-037ab193613c = záznam RINEX s <c1/>

seg-8890a4ebf231 = jednobodové určení polohy enginu selže při pěti nebo více družicích

seg-0a5a708ac75b = hodiny přijímače se odchýlí od své předpovězené přímky o více než minimální detekovatelný posun jejich kalibračního šumu

seg-31b64b635261 = Kalibrovaný profil (dobrovolný).

# c1: [monitors] profile = "jammertest-2024-calibrated"
# c2: cn0_drop_db = 1.5
# c3: agc_k_sigma = 3.5
# c4: jam_ind_threshold = 29
# c5: xval/jammertest-trust/PREREGISTRATION.md
# c6: cn0_drop_db
# c7: xval/jammertest-trust/RESULTS.md
# c8: profile_note
seg-a73f2c2dfc9a = <c1/> nahrazuje tři prahy interference hodnotami kalibrovanými na veřejné datové sadě JammerTest { "2024" } (jeden u-blox ZED-F9P na scénář; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. Kalibrace byla předregistrována (<c5/>) a profil je MODELLED, nafitovaný na jedné veřejné kampani: jeho práh <c6/> <b>nesplnil</b> předregistrovaný práh falešných poplachů na utajené sadě ({ "0.0231" } proti { "0.02" }); prahy AGC a indikátoru rušení a práh sjednocení (falešné poplachy { "0.033" }, detekce { "0.81" }) splněny byly (<c7/>). Platí pro tento typ přijímače při dané události, proti plánovaným slotům útoků, a byl kalibrován na záznamech CSV této sady (její záznamy UBX dávají více falešných poplachů ve dvou složkách). Výsledek spuštěný s profilem zrcadlí uplatněné prahy a nese <c8/>, který říká toto všechno. Bez profilu platí výše uvedené výchozí hodnoty a každý výstup je beze změny.

# c1: vessel
# c2: [maritime]
# c3: src/receiver_trust/maritime.rs
# c4: monitors_run
seg-1fa8c4bd1a18 = Pro platformu <c1/> běží také monitory pohybující se platformy (prahy v tabulce <c2/> nejvyšší úrovně, každá výchozí hodnota je zdokumentována v <c3/>); každý potřebuje svá data a v <c4/> je uveden, jen když rozhodl:

seg-4b2840d9d0af = změna polohy se neshoduje s hlášenou rychlostí a kurzem, nebo implikuje rychlost, zrychlení či úhlovou rychlost otáčení nad limity plavidla

seg-656c19cb5b52 = určení polohy; rychlost a kurz (RMC nebo VTG) pro část s dead reckoningem

# c1: hdg_cog_tol_deg
# c2: min_speed_kn
seg-cedefd52998d = kurz z gyroskopu a kurz nad zemí se liší o více než <c1/> (rychlost nad <c2/>)

# c1: heading_sensor = true
seg-c66704cbdd02 = kurz HDT, THS nebo VHW, <c1/>

# c1: stw_sog_tol_kn
seg-1bbbf0033234 = rychlost vůči vodě a rychlost nad zemí se liší o více než <c1/>

seg-c9101740b235 = VHW nebo VBW a rychlost nad zemí

# c1: antenna_height_m
# c2: sea_level_tol_m
seg-42ac59072099 = výška GGA se od <c1/> liší o více než <c2/>

# c1: antenna_height_m
seg-811ec460249c = výška GGA, <c1/>

# c1: cn0_spread_frac
seg-854ea9c26df4 = rozptyl C/N0 přes družice klesne na <c1/> svého kalibračního mediánu

# c1: cn0_rise_db
# c2: cn0_rise_frac
seg-837fc4cb832c = C/N0 společných družic vzrostlo v průměru o <c1/> a vzrostlo u <c2/> z nich

seg-faae07674361 = po sobě jdoucí časy epoch skáčou nepravidelně, běží pozpátku nebo se odchylují od hodin hostitele

seg-f799a53897ed = čas NMEA; u poslední části hodiny hostitele

seg-ee4913c9f2ed = přijímač hlásí selhání autentizace OSNMA (čte se hlášený stav; nic se neověřuje; k ověření OSNMA ze samotných stránek I/NAV viz <a1>docs/OSNMA.md</a1>)

seg-3fad5fcde4dc = Stavová věta <c1/>

seg-ce072f2ebb6c = Epocha je <b>nedůvěryhodná</b>, pokud alarm vyvolá RAIM, monitor hodin, selhání řešení nebo skok polohy, nebo pokud pokles C/N0 dosáhne dvojnásobku svého prahu; <b>zhoršená</b> při jakémkoli jiném alarmu; a jinak <b>nominální</b>.

seg-4124ff6013a0 = Cesta enginu (<c1/>, <c2/>, <c3/>) je tentýž výpočet jako orákulum spoofingu JammerTest { "2024" } v <c4/>: <c5/> ověřuje, že u všech osmi zveřejněných nástupů připadne první alarm na stejnou epochu a je téhož druhu.

seg-83be3c22a577 = Skóre důvěryhodnosti (platforma plavidla)

seg-812991f245cd = U plavidla získá každá epocha po kalibraci také skóre od { "0" } do { "100" } a důvody, proč není { "100" }. Mapování je deterministické a pevně dané dříve, než se jakýkoli záznam skóruje: žádné učení, nic přizpůsobeného událostem. Každý monitor převede své důkazy na poměr <c1/> (alarm při hodnotě { "1" } nebo vyšší); poměr stojí skóre

seg-ada5a0a52315 = takže monitor nestojí nic, dokud je pod <c1/> svého prahu (výchozí { "0.5" }), stojí polovinu své váhy na svém prahu a celou ji při <c2/> násobku prahu (výchozí { "1.5" }); skóre je nerostoucí v každé statistice. Zdroj, který v dané epoše nehlásí, si ponechá svou poslední statistiku po dobu <c3/> (výchozí { "10" } s: dva cykly věty C/N0 odesílané každých { "5" } s), jako alarm i jako srážku.

seg-6c06de24ebfe = Zaokrouhluje se směrem nahoru od poloviny (<c1/>), pásmo se určuje podle zaokrouhleného skóre a omezení rozsahu předchází zaokrouhlení. Ve srážkách jsou uvedeny jen monitory, jejichž body jsou nad nulou, spolu s jejich poměrem a nezaokrouhlenými body, nejvíce bodů jako první; srážky se stejným počtem bodů jsou řazeny v pořadí názvů monitorů <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. Monitoru, jehož test končí úspěchem nebo selháním (selhání řešení, selhání autentizace), se přiřadí poměr { "1.5" }, tedy plná váha. Uvedené body jsou body před omezením rozsahu na { "0" }.

seg-e36961d46c41 = Váha (body)

seg-673f6adcd681 = Proč

seg-399be3301faf = selhání autentizace je tvrzení, nikoli statistika

seg-69cfc61477d6 = padělaná poloha musí odporovat fyzice nebo vlastním kontrolám přijímače a čas nemůže běžet pozpátku; jedno porušení v plné síle ({ "1.5" } násobek prahu: { "60" } bodů, skóre { "40" }) je nedůvěryhodné a na prahu ({ "30" } bodů, skóre { "70" }) zhoršené

seg-7fa1e6e67411 = jeden nezávislý senzor, který nesouhlasí, je zhoršený stav; dva v plné síle jsou nedůvěryhodné

seg-4c4825d2957a = signálové prostředí nebo slabě vypovídající kontrola

seg-b5a364a03714 = prostředí je nepřátelské; to samo o sobě neukazuje, že určení polohy je chybné

seg-4e3749965405 = až { "15" }, <c1/>

seg-1e595dbcf96f = není to váha na této rampě: nic, pokud není obloha špatná, poté až <c1/> ({ "15" }); samotná geometrie dosáhne nejvýše zhoršeného stavu, nikdy nedůvěryhodného, a nevyvolá žádný alarm (viz „Geometrie“ níže)

seg-9902ca062070 = Hranice pásem vyplývají z vah: nejlehčí monitor, který vyvolá alarm, stojí na svém prahu { "12.5" } bodu, takže každý alarm opustí nominální pásmo; žádný jednotlivý monitor pod { "60" } bodů nemůže sám dosáhnout nedůvěryhodného pásma (několik společně může). Výsledek zaznamenává model skóre (<c1/>) a každá epocha nese <c2/>: které monitory srážely, jejich poměry a jejich body. U plavidla je stav epochy dán pásmem jejího skóre.

seg-6f620668ee85 = Geometrie: přirozené zhoršení odlišené od nesrovnalostí podobných útoku

seg-93257d87e0d4 = Přijímač u kontejnerového jeřábu, v plavební komoře nebo pod vysokým trupem ztrácí družice a jeho určení polohy se zhoršuje z jiného důvodu než kvůli útoku. Od verze { "0.36" }, podle návrhové poznámky ke geometrii (<c1/>, oddíl { "4" }), nese každá epocha svou <b>geometrii družic</b>, skóre plavidla má <b>monitor geometrie</b> a každá srážka nese <b>třídu</b>: <c2/> (obloha), <c3/> (signálové prostředí) nebo <c4/> (důkaz podobný útoku).

seg-17d13c39b5aa = <b>Odkud geometrie pochází.</b> Elevace a azimut každé sledované družice (NMEA GSV, UBX NAV-SAT), z nichž se odvodí faktor DOP (zhoršení přesnosti) jediným jádrem DOP enginu (<c1/>, VALIDATED proti gnss_lib_py): <c2/>. Pokud ty nejsou, použije se DOP a družice použité podle stavu přijímače (NMEA GSA): <c3/>. Polohy na obloze a GSA se počítají po dobu <c4/> skóre (výchozí { "10" } s), protože mnoho sběrnic posílá GSV jednou za několik sekund; sada GSV neúplná v dané epoše (konec výřezu, ztracená věta) se nepoužije. Záznam, který nemá ani jedno, například NMEA jen s GGA a RMC nebo záznamy Android a RINEX v současnosti, získá stav <b><c5/></b> s poznámkou „geometry unknown“: engine si geometrii, kterou nedostal, nevymýšlí, a monitor geometrie neběží.

seg-a267da42ac3d = dostatek družic a DOP v mezích prahů

seg-dabcd392914a = jeden nebo více důvodů: <c1/>, <c2/>, <c3/> a (informativně, do skóre se nepočítá) <c4/>, pokud se všechny sledované družice nacházejí v jedné polovině obzoru

seg-c255a66d3813 = záznam pro tuto epochu neuvádí žádnou geometrii družic

seg-0a50145c2bfa = Stav je popisný a pro skóre rozhoduje štítek (níže): <c1/> zahrnuje informativní případ <c2/>, který se může objevit i s dobrým nebo uspokojivým DOP, a skóruje se pouze štítek <c3/>.

seg-93e49a562493 = <b>Štítek</b> (vždy se uvádí, nikdy se neskóruje). <c1/> každé epochy je <c2/> (HDOP nejvýše <c3/> { "2" }, PDOP nejvýše <c4/> { "3" } a alespoň <c5/> { "6" } družic), <c6/> (HDOP nad <c7/> { "4" }, PDOP nad <c8/> { "6" } nebo méně než <c9/> { "5" } družic), <c10/> mezi tím, nebo <c11/>. Poznámka epochy vždy začíná štítkem a čísly, například „geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)“, a při výskytu přidá „, signal loss“.

seg-13838e036fae = <b>Monitor geometrie</b> (skóre plavidla). Srazí <b>nic, pokud není geometrie špatná</b>: jeho poměr je <c1/> a dokud je nejvýše { "1" } (dobrá nebo uspokojivá geometrie, včetně otevřené oblohy jen pro GPS s { "8" } družicemi), nestojí nic, takže takový záznam dostane přesně stejné skóre jako ve verzi { "0.35" }. Nad hodnotou { "1" } srážka lineárně roste až na <c2/> ({ "15" }) při <c3/> ({ "1.5" } násobek prahů: HDOP { "6" }, PDOP { "9" }, { "3" } družice): { "7.5" } bodu při poměru { "1.25" } (HDOP { "5" } nebo { "4" } družice), { "15" } od { "1.5" } výše (skóre { "85" }, zhoršený stav). Samo o sobě nikdy nesníží skóre pod <c4/> (výchozí: <c5/> skóre, { "55" }), takže samotná geometrie dosáhne nejvýše zhoršeného pásma a nikdy nedůvěryhodného: platný strop je <c6/>, takže tabulka <c7/>, která zvýší <c8/> (například tabulka verze { "0.35" } s <c9/> { "90" }), sníží strop na <c10/>, místo aby byla odmítnuta, a <c11/> nastavená pod <c12/> je odmítnuta. Monitor nevyvolává žádný alarm; je uveden jako poslední v <c13/>, pokud v některé epoše rozhodoval (plavidlo, jehož záznam geometrii uvádí), a do identity verze { "0.35" } se nepočítá; není položkou <c14/> (jeho nastavení je odmítnuto) a platný strop a práh se zaznamenávají v <c15/> a <c16/>. Poznámka špatné epochy říká proč, například „geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency“.

seg-2082f4ccb250 = <b>Třídy.</b> Každá srážka (<c1/>):

seg-4197bc517f73 = <c1/> (špatná geometrie); <c2/>, pokud byla každá družice ztracená oproti kalibračnímu základu při svém posledním hlášení pod <c3/>

seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> jinak; <c7/> při ztrátě signálu (níže)

seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; a <c11/>, pokud je geometrie špatná a uvedený HDOP nesouhlasí s uvedenou oblohou (níže)

seg-1b5e88a4aae4 = <b>Ochrana proti padělané špatné obloze.</b> Spoofer by mohl poslat řídké GSV nebo hlásit vysoký HDOP, aby si vykoupil toleranci. Engine štítkuje a neodpouští: špatná geometrie nerozšiřuje žádnou jinou kontrolu a HDOP, který přijímač uvádí (GSA v rámci doby podržení, jinak GGA), se porovnává s HDOP odvozeným z oblohy, kterou uvádí. Liší-li se o více než <c1/> ({ "1.0" } nebo { "25" } % odvozeného HDOP, podle toho, co je větší), nese epocha <c2/> a při špatné geometrii je její srážka zařazena do třídy <c3/>. Při dobré nebo uspokojivé geometrii se nesoulad hlásí a neskóruje: nic se nesrazí, pokud není geometrie špatná. Jde o záměrnou volbu ({ "0.36" }): „nula, pokud není špatná“ platí pro každou epochu, takže dobrá a uspokojivá geometrie dostane přesně stejné skóre jako ve verzi { "0.35" } a padělaný HDOP nikdy neprojde mlčky. Příznak (<c4/>) je u každé epochy výsledku a každého živého řádku, poznámka říká „…beyond the tolerance: reported, not scored (the geometry is not poor)“ nebo „…: the geometry deduction is classed an inconsistency“, <c5/> počítá epochy a stránka souhrnu důkazů uvádí jejich počet, včetně nuly. Hodnota { "25" } % je <b>REPRESENTATIVE</b> inženýrská volba, nikoli změřená ani normová hodnota: přijímač, který řeší jedny hodiny na konstelaci nebo používá podmnožinu družic, které sleduje (elevační maska, odříznutí C/N0, vyloučení RAIM), uvádí HDOP, který se od HDOP s jedněmi hodinami pro všechny sledované družice liší o hodnotu rostoucí s HDOP, takže by pevná tolerance sama přirozeně špatnou geometrii četla jako nesrovnalost. Větší rozdíl se za nesrovnalost považuje i nadále. Srážka zařazená do třídy <c6/> je tvrzení o obloze, nikoli zjištění, že k žádnému útoku nedošlo.

seg-0e729ad96db9 = <b>Ztráta signálu není obloha.</b> Pokud družice, které přijímač uvádí jako viditelné (nad <c1/>), nejsou sledovány, engine odvodí také DOP všech viditelných družic. Je-li tento DOP viditelných družic v mezích prahů a buď není sledována žádná, nebo jsou nesledované družice rozloženy po obzoru (nejsou omezeny na jednu jeho polovinu), obloha tam byla a signál ne: epocha nese <c2/>, poznámku „satellites in view but not tracked: signal environment, not geometry“ a srážka geometrie je zařazena do třídy <c3/>. Nesledované družice omezené na jednu polovinu obzoru se dál čtou jako zablokovaná obloha (zeď, útes, nábřeží). Dvoustranná překážka (kaňon nebo úzký fjord) se čte jako ztráta signálu, dokud není nastaven obzorový profil. Hodnoty přijímače bez určení polohy nejsou DOP: uvedený HDOP nebo PDOP { "99" } či více, kvalita GGA { "0" } a režim GSA { "1" } neposkytují žádný uvedený DOP.

seg-0f218d21843b = Klíč <c1/>

seg-e5ec84abd61b = zvoleno (návrhová poznámka { "4.2" }): při <c1/> { "1.5" } m je HDOP { "4" } rovno 2drms { "12" } m, což je <c2/> kinematické kontroly. O IEC 61108-1 se běžně uvádí, že své požadavky na přesnost stanoví pro HDOP ≤ { "4" } (nebo PDOP ≤ { "6" }): vybaveno z druhotné literatury o přijímačích GNSS, žádný konkrétní druhotný zdroj nebyl konzultován a norma nebyla přečtena; je třeba ověřit podle znění normy

seg-d99dc0fd090a = práh dostupnosti PDOP z <c1/>; GPS SPS Performance Standard, 5. vyd. ({ "2020" }), PDOP ≤ { "6" }, jak je citováno v <c2/>; je třeba ověřit podle znění normy

seg-2fffa47378ec = o jednu více, než určení polohy potřebuje, takže jediná ztráta neukončí určení polohy; nejmenší počet s jedním nadbytečným měřením pro RAIM

seg-7dc0baed2bc4 = uvedený vstup pro spoj 2drms z <c1/>; nastavte vlastní hodnotu přijímače

seg-7b5778d93d40 = { "1.0" } HDOP

seg-093cff5d1150 = zvoleno (návrhová poznámka { "4.2" }): absolutní část tolerance; nesoulad nad toleranci není geometrie

seg-be5c3aefd942 = REPRESENTATIVE inženýrská volba: relativní část, pro přijímače s hodinami pro každou konstelaci nebo s řešením z podmnožiny

seg-e71c6876114b = návrhová poznámka { "4.3" }: družice ztracené pod ní jsou ztraceny kvůli obloze; obzorový profil (položka { "1" } verze { "0.36" }) to rozšíří

seg-bebe291ca1c0 = geometrické, informativní: všechny družice v jedné polovině obzoru

seg-06519582227b = návrhová poznámka { "4.2" }: samotná geometrie posune skóre z nominálního do zhoršeného a nikdy do nedůvěryhodného; sráží se jen tehdy, je-li geometrie špatná (rozhodnutí zakladatele B1, { "0.36" })

seg-be21b5a31382 = vlastní <c1/> skóre: rampa dosáhne <c2/> při { "1.5" } násobku prahů špatné geometrie

seg-e922a5342a3c = <c1/> skóre ({ "55" })

seg-09fe8c435ece = samotná geometrie nikdy nedosáhne nedůvěryhodného pásma; platný strop je <c1/>; práh pod <c2/> je odmítnut

seg-a07e6ce67371 = REPRESENTATIVE, pouze pro štítek: polovina <c1/> (počáteční poměr skóre verze { "0.35" })

seg-06db7e7af59c = REPRESENTATIVE, pouze pro štítek: polovina <c1/>

seg-7e7f17d36ea4 = REPRESENTATIVE, pouze pro štítek: o jednu více než <c1/>, takže jediná ztráta stále ponechá nadbytečné měření

seg-ef7a4c24e870 = <b>Co se ve výstupech změnilo a co ne.</b> Žádné skóre se nemění, pokud není geometrie špatná; štítek se uvádí vždy. Přidané klíče: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> zaokrouhlené na { "0.001" }, <c9/> (null, dokud není nastaven obzorový profil), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (družice uvedené nad <c16/>), <c17/>, <c18/>), <c19/> u každé srážky a na konci <c20/> (prahy, doba podržení, platný strop a práh, původ, pravidla tříd) a <c21/> (epochy podle stavu, podle štítku a podle třídy srážky a epochy s nesouladem uvedeného HDOP); <c22/> je jako ve verzi { "0.35" }. Dva testy to po odstranění těchto klíčů drží na úrovni bajtů základu „{ "0.36" } portable“ (hashe verze { "0.35.0" }, přepočtené při přechodu enginu na přenositelnou matematiku a ponechané v testech jako záznam toho, co verze { "0.35.0" } vydala: <c23/>). <c24/> drží každý výstup obou ukázkových relací (výsledek JSON, CSV, SVG, verdikt, přehrané živé řádky, <c25/>, Prometheus, CEF, LEEF). <c26/> drží dávkový výsledek, souhrn, živé řádky a <c27/> každého zapsaného korpusu NMEA plavidel (demo a referenční maritime fixtury, každý také jako otevřená obloha jen pro GPS s { "8" } družicemi, a výcvikové scénáře generované z jejich seedů); ve dvou výcvikových scénářích, kde rušení činí geometrii špatnou, je každá epocha, která špatná není, shodná a každá špatná se liší pouze srážkou geometrie. Záznam, jehož geometrie je špatná, ztratí až { "15" } bodů, které ve verzi { "0.35" } neztratil; to je zamýšlená změna. V demu se strhnutí čte jako <c28/>; <c29/> upravuje záznam tak, aby zamaskoval západní oblohu (uspokojivá: štítkuje se, neskóruje), aby zamaskoval ji a dvě východní družice (špatná: srážky geometrie, ztráta zachycení <c30/>, protože zmizely i vysoké družice), aby ztratil jen družice pod { "15" }° (ztráta zachycení <c31/>) a aby uvedl HDOP, který obloha nevysvětluje (srážka špatné geometrie se stane <c32/>). Prahy jsou MODELLED: zvolené, nepřizpůsobené žádnému záznamu; nic zde netvrdí, jak často se na skutečných datech rozliší přirozené zhoršení od útoků.

seg-8ddaf82ba00b = Uvádění událostí a předpovědí

seg-c52c285aa308 = U každé události výsledek uvádí falešné poplachy mezi kalibrací a nástupem, první alarm a jeho monitory, latenci, výsledek (<c1/>, <c2/>, <c3/> nebo <c4/>) a pozorovaný medián poklesu C/N0 oproti předpovědi (<c5/>, <c6/>, <c7/> nebo <c8/>). Nesoulad se hlásí, nikdy se neladí pryč: tolerance jsou ve scénáři a scénář je v hashi výsledku.

seg-3715df3fd8f7 = Co toto netvrdí

seg-21a4b903e179 = Monitory důvěryhodnosti jsou MODELLED: jejich prahy jsou vstupy a jejich detekční výkon na skutečné interferenci je to, co měří skórování událostí, nikoli něco, co tento druh tvrdí. V relacích spoofingu JammerTest { "2024" } zachytí monitory cesty enginu některé nástupy do { "10" } s a u jiných jsou opožděné; čísla viz řádek „Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM“ v <a1><c1/></a1>. Předpověď, která souhlasí s jedním záznamem, je jeden datový bod, nikoli validace.

seg-0c413c1a491c = <s1>Předchozí</s1>Mapování odolnosti

seg-63fc2b340fd1 = <s1>Další</s1>Maritime trust
