# docs--nmea-training: translations (cs)

seg-2247a2344710 = Význam

seg-c5fb6b91dc68 = stupně

seg-99427ab75a03 = pole

seg-45425f378b61 = význam

seg-6940543aa3c0 = řetězec

seg-f5e7215e6835 = objekt

seg-bbcdd898d24d = celé číslo

# c1: docs/NMEA-TRAINING.md
seg-ba00d0453fbf = Zdroj: <c1/>

# c1: kshana nmea-scenario
seg-738956d0a4b9 = Tréninkové proudy NMEA: <c1/>

seg-3663955f80c7 = Námořní akademie a simulační střediska mohou vkládat NMEA { "0183" } generovanou nástrojem Kshana do simulátoru můstku nebo mapového plotru, aby školila posádky v rozpoznávání rušení (jamming) a podvržení signálu (spoofing) GNSS.

# c1: $PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION
# c2: --no-marker
seg-4012bc6376aa = <b>Pouze pro trénink a testování.</b> Generované proudy jsou syntetické. Nikdy se nesmějí vkládat do živých navigačních systémů plavidla. Kshana má pouze poradní charakter a není typově schváleným navigačním zařízením. Každý proud začíná proprietární značkovací větou <c1/> a opakuje ji každých deset sekund; přijímače ji ignorují a <c2/> ji odstraní pro simulátor, který neznámé věty odmítá. Zapisuje se <b>pouze text</b> NMEA: neexistuje žádný výstup RF, IQ ani průběhu signálu a nic se nevysílá kromě textu na adresu, kterou uvedete.

seg-b66ff9ca2ff4 = Tréninkový proud ze scénáře coastal-drag-off (engine v{ $version }, seed { "22" }, { "25" } minut při jednom zaměření za { "10" } s z instruktorského záznamu). Mapa ukazuje skutečnou trasu plavidla a trasu, kterou hlásí přijímač: shodují se, dokud nezačne skriptované odtažení polohy v { "421" } s; hlášená trasa se pak od skutečné vzdaluje, zatímco přijímač udržuje platné zaměření, a když událost v { "1140" } s skončí, skokem se vrátí. Vedle toho je vzdálenost mezi oběma trasami v čase a střední poměr nosné k hustotě šumu hlášený přijímačem, který po dobu události stoupne na jednu zvýšenou úroveň. Syntetická tréninková data generovaná nástrojem Kshana. Pouze pro trénink a testování: tento proud nikdy nevkládejte do živých navigačních systémů plavidla. Pouze poradní charakter, nejde o typově schválené navigační zařízení. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel. Polohy, data a trasy jsou smyšlené.

# c1: scenarios/training/coastal-drag-off.toml
seg-1f70c2c761ac = Obrázek je vykreslen z instruktorského záznamu <c1/>.

seg-32b620b3574e = Použití

seg-9cbd24964be4 = Volba

# c1: <name>.nmea
seg-aadcf289aed2 = zapíše proud do souboru; bez síťového výstupu je výchozí <c1/>

# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-a3fc46437059 = zapíše <c1/> a <c2/> (výchozí: vedle souboru)

# c1: --tcp <addr:port>
# c2: <port>
seg-14dad363af8a = <c1/> nebo <c2/>

# c1: --wait-clients <n>
# c2: 127.0.0.1
seg-8e105cf0979b = server TCP; běh začne, když se připojí klient (<c1/>). Samotný port naslouchá jen na <c2/>

# c1: --udp <addr:port>
# c2: <port>
seg-63ee193b90b4 = <c1/> nebo <c2/>

# c1: --broadcast
# c2: 127.0.0.1
seg-fc322c7ce2db = UDP, jedna věta na datagram; <c1/> povolí adresu pro vysílání všem. Samotný port odesílá na <c2/>

# c1: --speed 0
seg-8ca50e2a4b8d = řídí tempo proudu; <c1/> znamená co nejrychleji. Síťový výstup má výchozí tempo v reálném čase, soubory co nejrychleji

seg-97b82dfe97a7 = nahradí seed scénáře

seg-86ac66fd2771 = vynechá značkovací větu

seg-f6cc05a6d39a = <b>Neexistuje žádné ověřování.</b> Server TCP s nelokální adresou poskytuje proud každému, kdo se k němu dostane, a UDP odesílá na jakoukoli adresu, kterou uvedete. Klient TCP, který si data nevyzvedne do dvou sekund, je odpojen, takže jeden zaseknutý odběratel nemůže zdržet ostatní.

seg-b4abb5a132ba = Stejný seed dává na jedné platformě stejné bajty a tempo bajty nikdy nemění. Napříč platformami je vlastní aritmetika generátoru bitově shodná (používá přenosnou matematickou vrstvu), ale polohy družic a elevační úhly pocházejí z funkcí enginu, které volají matematickou knihovnu hostitele, takže se ve vzácném hraničním případě může zaokrouhlená číslice elevace, azimutu nebo C/N0 ve větě GSV mezi platformami lišit.

seg-97e31fc7f0d1 = Co se zapisuje

# c1: GN
seg-632a4ca26567 = Každá epocha ({ "1" }, { "2" }, { "5" } nebo { "10" } za sekundu) nese: <b>RMC, GGA, GNS</b> (zaměření, poloha, čas), <b>GSA</b> (použité družice a DOP, jedna na konstelaci), <b>GSV</b> (družice v dohledu s elevací, azimutem a SNR v dB-Hz, jedna sada na konstelaci, identifikátor signálu NMEA { "4.10" }), <b>VTG</b> (kurz a rychlost nad zemí), <b>ZDA</b> (čas a datum), <b>HDT</b> (směr podle gyra) a <b>VBW</b> (rychlost vůči vodě a nad zemí z logu). Talker je <c1/> u více konstelací, jinak vlastní talker dané konstelace. Řádky končí CRLF a mají platný kontrolní součet.

seg-942803ad8c49 = HDT a VBW zastupují nezávislé senzory (gyrokompas a dopplerovský log). <b>Žádná událost se jich netýká</b>, což je záměr: rozdíl mezi tím, co hlásí GNSS, a tím, co říkají gyro a log, je podnět pro rozbor.

# c1: V
seg-2d9a9ea38dde = Když se zaměření ztratí, kvalita GGA je { "0" }, stav RMC je <c1/>, pole polohy jsou prázdná a časová pole pokračují (hodiny přijímače běží dál), jako u skutečných přijímačů.

seg-c1c51ff381e7 = Plavidlo

# c1: [vessel]
# c2: [[waypoint]]
# c3: max_rot_deg_per_min
# c4: max_rot_accel_deg_per_s2
# c5: max_accel_kn_per_min
# c6: speed_kn
# c7: [environment]
# c8: stop_at_end
seg-ada150c912eb = <c1/> a <c2/> udávají počáteční polohu, rychlost a body, kterými se má plout. Plavidlo je řízeno k dalšímu bodu trasy při <b>omezení rychlosti otáčení</b> (<c3/>, výchozí { "30" }), omezení toho, jak rychle narůstá rychlost otáčení (<c4/>), a <b>omezení změny rychlosti</b> (<c5/>). Rychlost úseku je <c6/> daného bodu trasy. <c7/> přidává proud, takže rychlost nad zemí se liší od rychlosti vůči vodě a směr přídě se liší od kurzu nad zemí, a magnetickou deklinaci. <c8/> zastaví plavidlo v posledním bodu trasy.

seg-4fc2cb8a1388 = Geometrie družic

# c1: constellation::satellite_positions_fixed
# c2: [receiver]
# c3: track_threshold_dbhz
# c4: use_threshold_dbhz
# c5: max_used
# c6: reacquire_s
seg-b97bd86ed3a4 = Družice pocházejí z vlastních nominálních konstelací enginu (tabulka slotů GPS, vzory Walker MEO pro Galileo a BeiDou, ICD GLONASS), šířených pomocí <c1/> (dvě tělesa plus sekulární J2, rotace Země) a viděných z plavidla pomocí elevačních a azimutových úhlů enginu podle WGS-84. Viditelný počet, elevace a azimuty ve větě GSV jsou věrohodné pro dané místo a denní dobu. <b>Jde o nominální oblohu, nikoli o efemeridy pro datum proudu</b>: PRN se přidělují v pořadí slotů a každá konstelace zachovává svůj zveřejněný rozvrh slotů, spojitě šířený od epochy tabulky slotů GPS (2016-12-31) pod vlivem J2, takže rozvrh je neporušen, ale jeho orientace není orientací skutečné oblohy v den proudu. C/N0 sleduje elevaci (nominální úroveň v zenitu, nastavená v <c2/>), s pevným posunem pro každou družici, pomalým únikem a šumem. Družice pod <c3/> má pole SNR prázdné; družice pod <c4/> je sledována, ale nepoužita. Použije se až <c5/> (výchozí { "12" }, strop NMEA GGA) použitelných družic, vybraných podle geometrie (nejprve nejvyšší družice v každém azimutovém sektoru po { "30" } stupních). Méně než čtyři použitelné družice znamenají ztrátu zaměření, které se vrátí po <c6/> použitelného signálu.

seg-f2be7442bdf2 = Události

# c1: [[event]]
# c2: kind
# c3: start_s
# c4: duration_s
# c5: ramp_s
# c6: recovery_s
# c7: ramp_s
# c8: recovery_s
# c9: 0
seg-db86ed4b40a9 = Každá <c1/> má <c2/>, nástup <c3/>, <c4/> (od nástupu do začátku uvolnění), nástupní rampu <c5/> a uvolňovací rampu <c6/>. Síla lineárně stoupá po dobu <c7/>, drží se a poté klesá po dobu <c8/>; <c9/> je skok. Všechny účinky se škálují touto silou. Parametry, které k danému druhu nepatří, se odmítnou.

seg-3255e99c7265 = druh

seg-9285a9d699c0 = parametry

seg-e83c9db4f9c7 = účinek

# c1: cn0_drop_db
# c2: spread_db
seg-e96ef358529d = <c1/>, <c2/> (výchozí { "6" })

# c1: cn0_drop_db
# c2: reacquire_s
seg-cd6030834371 = C/N0 každé družice klesne až o <c1/> (rozptyl mezi družicemi), družice vypadávají od nejslabší, zaměření se ztratí, když jsou použitelné méně než čtyři, a obnoví se po uvolnění a <c2/>

# c1: final_offset_m
# c2: bearing_deg
# c3: relative_bearing_deg
# c4: max_accel_mps2
# c5: counterfeit_cn0_dbhz
seg-e5a66c9c3627 = <c1/>, jedno z <c2/> (skutečný) nebo <c3/> (vůči kurzu <b>v okamžiku nástupu</b>, poté držený), volitelně <c4/>, <c5/>

# c1: 1.5 D/T
# c2: 6 D/T^2
# c3: T
# c4: D
# c5: max_accel_mps2
# c6: ramp_s = 0
seg-d7d967a60275 = přijímač udržuje <b>platné zaměření</b>, jehož poloha se vzdaluje od skutečnosti; SOG a COG zahrnují odtažení. Odtažení sleduje průběh smoothstep na rampách, takže falešná trasa začíná a končí bez skoku rychlosti; její maxima jsou <c1/> m/s a <c2/> m/s na druhou pro rampu <c3/> s přes <c4/> m (obojí zaznamenáno) a scénář, který by překročil <c5/>, se odmítne. Skok (<c6/>) posune polohu, aniž by se dotkl rychlosti

seg-7da039c3262e = čas v RMC, GGA, GNS a ZDA je posunut oproti skutečnému UTC; poloha zůstává skutečná

# c1: delay_s
# c2: affect_time
# c3: counterfeit_cn0_dbhz
seg-ead3ce0162fb = <c1/>, <c2/> (výchozí true), <c3/>

# c1: delay_s
# c2: 1 - d(delay)/dt
seg-a1bdb89334df = poloha, rychlost (a čas) jsou ty, které plavidlo mělo před <c1/>, přičemž zpoždění sleduje průběh smoothstep na rampách a hlášená rychlost se během jeho změny násobí <c2/>: zjednodušená abstrakce ve stylu meaconingu, nikoli model šíření

# c1: counterfeit_cn0_dbhz
# c2: reacquire_s
# c3: combined-event
# c4: ramp_s = 0
seg-6f435224f7fb = <c1/>: dokud je aktivní odtažení polohy, podvržení času nebo zpoždění přehrávání, každá sledovaná družice ukazuje tuto jedinou zvýšenou úroveň, což je klasický příznak. Vynechejte ji pro nenápadnou událost, při níž se zachová skutečný vzor C/N0. Dokud je aktivní jakákoli padělaná událost, přijímač sleduje padělaný signál, takže jej rušení neodpojí; zaměření ztracené dřívějším rušením se vrátí po <c2/> na padělaném signálu (viz <c3/>). Změna času, která by způsobila zastavení nebo zpětný chod hlášeného času (rychlost { "1" } s za sekundu nebo více), se odmítne, pokud nejde o skok (<c4/>).

# c1: onset
# c2: start_s
seg-894aceb32c5c = Události se mohou překrývat; jejich účinky se sčítají (posuny, změny času, zpoždění) nebo se bere nejsilnější (rušení). <c1/> na časové ose je první epocha, v níž má událost účinek, tedy o jednu epochu po skriptovaném <c2/>, když událost nabíhá po rampě.

seg-09e311ade9e6 = Instruktorský záznam

# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-80933b9bdf0d = Vedle proudu poskytují <c1/> a <c2/>:

seg-51930977a6fe = události tak, jak byly vloženy, srozumitelným jazykem se všemi parametry, a jejich nástup v UTC;

# c1: fix-lost
# c2: fix-regained
seg-4eab197c487b = časovou osu: nástup, plný účinek, začátek zotavení, zotaveno a vlastní <c1/> a <c2/> přijímače;

# c1: log_interval_s
seg-af2eb88f14d0 = skutečnou trasu proti hlášené v odstupu <c1/>: skutečná a hlášená poloha, rychlost a kurz, chyba polohy v metrech, časový posun, počet použitých a sledovaných družic, střední C/N0 a které události byly aktivní;

seg-303f5fbe0351 = nejvyšší rychlost a zrychlení skutečné i hlášené trasy;

# c1: trainer_note
seg-593a4a1ef296 = poznámku školitele scénáře (<c1/>).

seg-8c4aebcd0eff = Záznam ukažte až při rozboru.

# c1: kshana-nmea-training/1
seg-dd1780910af7 = Pole JSON (schéma <c1/>)

seg-60b5b11cdc0b = typ, jednotka

seg-f4963d090155 = prohlášení, že jde pouze o trénink

seg-7ad14e03d9e4 = ze scénáře

seg-fac0fb50b31b = použitý seed

seg-f05d18516bd8 = ISO { "8601" } UTC

seg-8752c09baa6a = začátek běhu

seg-f0d8bb5aafef = délka běhu

seg-0989e14f1e51 = uzly

seg-b657b979a455 = nejvyšší skutečná a hlášená rychlost nad zemí

seg-24e947df31ae = m/s na druhou

seg-a1ca3847c8d8 = největší změna rychlosti za sekundu, skutečná a mezi po sobě jdoucími hlášenými zaměřeními

seg-e1daadeb7d48 = jeden na každou skriptovanou událost

# c1: timeline[].event
# c2: track[].active_events
seg-3aaa0108ac1e = číslováno od 1; používá <c1/> a <c2/>

seg-6bbb9db14f7b = popis srozumitelným jazykem s parametry

seg-2f3eac27a997 = skriptovaný nástup

# c1: kind
# c2: start_s
# c3: duration_s
# c4: ramp_s
# c5: recovery_s
seg-4255c67f3db5 = událost přesně tak, jak je zapsána (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> a vlastní parametry druhu; chybějící se vynechají)

seg-88db26711d77 = stupně skutečné nebo null

seg-2f30c3d8b17b = odtažení polohy: použitý směr (relativní kurz se určí při nástupu)

seg-55d6dd667365 = m/s, m/s na druhou nebo null

seg-021df000164f = odtažení polohy: maxima, která odtažení přidává k falešné trase

seg-d3a2c65ebcd4 = okamžiky pro rozbor, v časovém pořadí

seg-b2b72301c1c9 = s od začátku, ISO { "8601" } UTC

seg-34e24e21ac7e = kdy (skutečný čas)

seg-cf29ba5ed968 = celé číslo nebo null

seg-8dbc5e7239be = identifikátor události; null u změn stavu přijímače

# c1: onset
# c2: full-effect
# c3: recovery-begins
# c4: recovered
# c5: fix-lost
# c6: fix-regained
seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (události); <c5/>, <c6/> (přijímač)

seg-cd7c4057601b = vysvětlení

# c1: log_interval_s
seg-90e65cbe1a59 = jeden řádek na <c1/>

seg-a57e27a3c470 = s, ISO { "8601" } UTC

seg-24376fe24496 = skutečná poloha

seg-f23b251a0e33 = uzly, stupně skutečné

seg-242c1f2ccbd3 = skutečná rychlost a kurz nad zemí a směr podle gyra

seg-696dd61f8bbb = logická hodnota

seg-ea264ef0395c = přijímač hlásil zaměření

seg-b073b87a813e = stupně, uzly, stupně skutečné, nebo null

seg-b56345697092 = co přijímač hlásil; null, dokud je zaměření ztraceno

seg-c4a33c03d9da = m nebo null

seg-463f6fc42ae5 = vodorovná vzdálenost mezi skutečnou a hlášenou polohou

seg-b68dfce8d81d = hlášené UTC minus skutečné UTC

seg-ec28faa1efcc = celá čísla

seg-2bf397f77392 = družice použité v zaměření a sledované

seg-96b87348e90e = dB-Hz nebo null

seg-40f30b4a88cf = střední C/N0 sledovaných družic

seg-3671c8aa3c1a = identifikátory událostí s účinkem v tomto okamžiku

# c1: /2
seg-8401fa92aae1 = Přidání pole značku schématu nemění. Přejmenování nebo odebrání pole, případně změna významu nebo jednotky pole zvyšuje číslo (<c1/>).

seg-656ee92a3130 = Knihovna scénářů

# c1: scenarios/training/
seg-82a888587138 = <c1/>, každý je několik minut plavby s poznámkou školitele ve svém TOML:

seg-665b9b46b49b = soubor

seg-11ed1f85d4be = co ukazuje

seg-50ffa85a1128 = C/N0 klesá společně, družice vypadávají, zaměření se ztratí a vrátí se

seg-10bc30b9c57b = platné, zdravě vypadající zaměření se odtáhne o { "1.4" } km směrem k pobřeží; jednotně zvýšené C/N0

seg-f141692988e4 = poloha správná, UTC se při pomalém přiblížení k přístavu rozchází o { "45" } s dopředu

seg-ce06a5ebdd42 = rušení, poté převzetí padělaným signálem s odtažením polohy a časovým posunem, poté zpoždění přehrávání

# c1: fjord
# c2: natural-degradation
# c3: skyline
seg-3fbcfd1dd26a = zablokovaná obloha, nikoli interference: stěny fjordu (REPRESENTATIVE přednastavení obzoru <c1/>) skrývají družice na východě a západě, poté se kanál znovu otevře (událost <c2/> s tabulkou <c3/>)

seg-5462f6b21fae = Polohy, data a trasy jsou smyšlené; knihovna neobsahuje žádné skutečné plavidlo, provozovatele ani záznam. Neříká nic o tom, jak by se jakýkoli přijímač nebo systém choval při interferenci.

seg-9831ab537b36 = Modelovací volby

# c1: [receiver]
# c2: [vessel]
seg-76a0e0eb57b3 = Generátor je tréninkový nástroj bez externího orákula a jeho čísla jsou modelovací volby, nikoli měření jakéhokoli přijímače. Jsou zvolena tak, aby vypadala jako běžný záznam přijímače: sklon C/N0 o { "14" } dB od zenitu k obzoru pod úrovní v zenitu (výchozí { "47" } dB-Hz) a posun jednotlivých družic o +/-1.5 dB, pomalý únik { "0.8" } dB po dobu { "97" } s a { "0.5" } dB po dobu { "31" } s, jitter { "0.3" } dB; prahy pro sledování ({ "20" } dB-Hz) a použití ({ "28" } dB-Hz); šum polohy ({ "1.5" } m při HDOP { "1" }, korelovaný po dobu { "30" } s, svisle dvojnásobný); šum gyra { "0.05" } stupně a šum dříftu { "0.03" } kn; časová konstanta řízení { "20" } s a poloměry příjezdu k bodům trasy v modelu plavidla; a výběr družic podle azimutových sektorů. Výchozí hodnoty jsou v <c1/> a <c2/> a všechny lze ve scénáři změnit.

seg-84913be532a0 = Zpětné načtení

# c1: kshana receiver-trust
# c2: format = "nmea"
# c3: tests/fixtures/nmea_training/
# c4: KSHANA_BLESS_GOLDEN=1
seg-fbf4002d25cd = <c1/> umí tyto soubory načíst (<c2/>). Testy kontrolují každou větu každého scénáře knihovny podle jejích vlastních pravidel pro počet polí a kontrolní součet a vedou soubory přes tento čtecí modul, který interpretuje GGA, RMC a GSV a ostatní typy přeskočí, aniž by některý vynechal. Testy zafixují pro každý scénář zlatý výřez (<c3/>); po zamýšlené změně jej vygenerujte znovu pomocí <c4/>.

seg-b94fbc3b1dd3 = <s1>Předchozí</s1>Námořní důvěra

seg-ecdf748cb63d = <s1>Další</s1>Mapa interference a expozice trasy

seg-24ad8471ff2a = Pole JSON (schéma kshana-nmea-training/1)
