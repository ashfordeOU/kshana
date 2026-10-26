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
