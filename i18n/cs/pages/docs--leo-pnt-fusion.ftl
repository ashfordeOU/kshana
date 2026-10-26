# docs--leo-pnt-fusion: translations (cs)

seg-cae10fb9bff8 = Scénář

seg-f63dd3d7aad4 = Zdroj

seg-587beeccaa11 = Předvolba

seg-a6c63abeb7e6 = Přibalené scénáře

seg-354b42e3a5d0 = RNTF

seg-c5ce76c91ff7 = Popisek

seg-9673ca8c2705 = Zdroj: <c1/>

seg-989faf40651b = Fúzované určování polohy, navigace a času z MEO a LEO

seg-c14c586a29e7 = Tři druhy scénářů poskytují určování polohy, navigaci a čas (PNT) pomocí družic na nízké oběžné dráze Země (LEO) samotných nebo fúzovaných s globálními družicovými navigačními systémy (GNSS) na střední oběžné dráze Země (MEO): <c1/> (poloha, rychlost a čas), <c2/> (přesné určování polohy bodu) a <c3/> (nepozemní síť 5G). Zdroj: <c4/>.

seg-351652fa0e42 = Engine je <b>nezávislý na systému</b>. Každá konstelace jsou shelly Walker, explicitní oběžné prvky nebo předvolba GNSS druhu <c1/>; každý signál je nosná, čipová rychlost a obálka poměru nosné k šumu (C/N0); každý rozpočet chyb je explicitní jedno-sigma. Pojmenované systémy jsou volitelné <b>předvolby</b>, každá v jednom souboru, a každá schopnost, test i přibalený scénář běží bez kterékoli z nich.

seg-3e7c6608d5c4 = Systémy a předvolby

seg-1031746214ab = Scénář uvádí své systémy jako tabulky <c1/>. Tento úplný scénář spojuje základní konstelaci GPS s obecnou vrstvou LEO a běží tak, jak je napsán (<c2/>; engine { $version } dává medián faktoru DOP polohy { "2.43" } pro samotné GPS a { "1.17" } fúzovaně a střední kvadratickou 3D chybu { "2.06" } m a { "0.47" } m):

seg-6168fdca9b54 = <c1/> (Global Positioning System, GPS; nebo <c2/>, <c3/>, <c4/>) převezme zveřejněnou konstelaci GNSS; <c5/> doplní z předvolby LEO vše, co tabulka vynechá. C/N0 roste lineárně se sinem elevace od masky do zenitu (modelová volba: skutečná obálka přeletu závisí na diagramu vysílací antény). Jedno-sigma pseudovzdálenosti je tepelný šum smyčky závěsu zpoždění (DLL) enginu (<c6/>) při tomto C/N0 spojený s chybou vzdálenosti signálu ve vesmíru (SISRE), pokud je nefixuje <c7/>; jedno-sigma rychlosti změny vzdálenosti je vlnová délka krát <c8/>. Protože sigma je vstup, může ji dodat samostatný model signálu, aniž by kód určování polohy věděl, odkud pochází.

seg-a3f63252bd1b = Co nese

seg-9872e31ebd72 = Zdroje

seg-e20c823f36f3 = X1 na { "1593.3225" } MHz, { "1.023" } Mchip/s, přijímaný výkon −{ "148.2" } až −{ "139.1" } dBW; X5 na { "1190.51625" } MHz, { "10.23" } Mchip/s, −{ "144.9" } až −{ "136.2" } dBW; { "258" } družic v { "18" } rovinách ve výšce { "1080" } km, { "53" } a { "97" } stupňů

seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Reprezentativní: rozdělení mezi oba sklony, fázování, chyba vzdálenosti

seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } družic, šest téměř polárních rovin ve výšce { "780" } km a { "86.4" } stupně; shluky na { "1616" } až { "1626" } MHz, kvadraturní fázové klíčování (QPSK) při { "25 000" } symbolech/s; přijímaný výkon { "300" } až { "2400" }násobek minima GPS

seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>konstelace</a3>. ODVOZENO: výkon v dBW. Reprezentativní: nosná ve středu pásma, chyba vzdálenosti

seg-36771f73c21f = Pouze Doppler: { "11.325" } GHz, maják s ortogonálním frekvenčním multiplexem (OFDM) { "240" } MHz, C/N0 až { "57.07" } dB-Hz, chyba Dopplera { "30" } Hz; první shell { "1584" } družic ve výšce { "550" } km a { "53" } stupňů

seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim a Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Reprezentativní: fázování, C/N0 na obzoru

seg-2e13de07f9e9 = Binární fázové klíčování (BPSK) při { "2.046" } Mchip/s poblíž L1 a L5; centimetrové určování oběžné dráhy

seg-dd94a3839cb3 = PUBLIC: <a1>úvodní posouzení</a1>, <a2>GPS Solutions</a2>. Reprezentativní: nosné, výkon, celá operační konstelace

seg-a34d6a186a36 = Systém v pásmu C v alokaci družicové služby radionavigace (RNSS) { "5010" } až { "5030" } MHz, pro systémy, jejichž parametry nejsou veřejné

seg-7712896ff69a = PUBLIC: alokace podle <a1>Radiokomunikačního řádu Mezinárodní telekomunikační unie (ITU)</a1>. Vše ostatní <b>reprezentativní</b>

seg-89ebc32469d9 = Model efemerid a hodin: polynomiální efemeridy šestého řádu, obnovování po { "30" } s, hodiny řízené k času GNSS; SISRE { "0.26" } m

seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. ODVOZENO: SISRE. Kombinujte s libovolnou konstelací pomocí <c1/>

seg-6389c92e07d4 = Demonstrace na oběžné dráze (IOD) Celeste Evropské kosmické agentury (ESA), jedna konfigurace parametrizovaného návrhu signálu

seg-b8bd6e76aeb2 = PUBLIC dráha (<a1>ESA</a1>, <a2>abstrakt { "16907" } Institute of Navigation (ION)</a2>); WORKSHOP parametry signálu, prezentované na workshopu LEO-PNT programu ESA Navigation Innovation and Support Programme (NAVISP) v roce { "2026" }

seg-bd7fb6eb444a = Každé číslo odvozené z workshopu je v modulu <c1/> v <c2/>, používaném souborem <c3/> (<c4/> vynucuje, kde se smějí objevit). Jak se předvolba zadržuje: každé číslo enginu odvozené z workshopu je v jediném souboru <c5/>, který <c6/> zkompiluje, jen pokud existuje, a ve scénářích dostupných pouze v repozitáři <c7/>. Smazáním tohoto souboru a těchto scénářů se předvolba zadrží bez jakékoli úpravy zdrojového kódu; každý další test, orákulum i scénář běží i bez ní a počet souborů scénářů v README zadržené soubory stále započítává.

seg-12cdcc633ae0 = Jeden druh, čtyři režimy (<c1/>).

seg-72b5d8cc82ea = <b>Doppler.</b> Přijímač, který měří Doppler <c1/> na vlnové délce <c2/>, pozoruje rychlost změny vzdálenosti <c3/>, kde <c4/> je přímka vidění a <c5/> drift hodin přijímače. Dávkový fit Gauss-Newton řeší polohu, drift a volitelně konstantní rychlost, s analytickými parciálními derivacemi <c6/>: informaci o poloze nese pouze rychlost družice napříč přímkou vidění, takže geometrií je to, jak se přímky vidění v průběhu okna stáčejí. Zpráva udává chybu v závislosti na délce okna, obálku Dopplera, rychlosti změny Dopplera a jerku každého systému a tabulku jednoho přeletu. Jeden přelet určí uživatele podél dráhy (čas nulového Dopplera) a napříč ní (strmost křivky Dopplera); chyba napříč dráhou neomezeně roste, když přelet míří přes zenit, a zrcadlový obraz přes pozemní stopu sedí téměř stejně dobře (odlišuje je jen rotace Země). V tomto režimu běží systém pouze s Dopplerem (<c7/>, předvolba <c8/>).

seg-007d143c7fb4 = <b>Společný.</b> V každé epoše vážené nejmenší čtverce nad pseudovzdálenostmi samotných systémů GNSS, samotných systémů LEO a všech dohromady, s jedněmi hodinami přijímače na systém (mezisystémové zkreslení, ISB, se odhaduje) nebo se známým vysílaným posunem na referenční časové stupnici. Uvádí geometrický, polohový, horizontální, vertikální a časový faktor DOP (GDOP, PDOP, HDOP, VDOP, TDOP), chyby, odhadnutá zkreslení a DOP v závislosti na počtu družic LEO přidaných ke geometrii GNSS.

seg-22f136a0c96f = <b>Polární.</b> Družice v dohledu, medián DOP a dostupnost v závislosti na zeměpisné šířce pro GNSS na MEO, LEO a obojí.

seg-1034557258d1 = <b>Časování.</b> Na známé poloze je každá pseudovzdálenost LEO měřením hodin. Přijímač provozuje dvoustavový (fáze, frekvence) Kalmanův filtr, jehož procesním šumem je bílý šum a šum náhodné procházky frekvence třídy oscilátoru (<c1/> a modely hodin), udržuje čas mezi přelety a převádí systémový čas na koordinovaný světový čas (UTC) výrazem z IS-GPS-200 <c2/>; nejistota vysílaného posunu je zkreslení v rámci běhu.

seg-0d76fcc05e7d = Rozšířený Kalmanův filtr (EKF) pro plovoucí přesné určování polohy bodu (PPP) na kódu a fázi bez vlivu ionosféry: statické souřadnice, bílé hodiny přijímače, jedno mezisystémové zkreslení na každý další systém, zenitové vlhké zpoždění jako náhodná procházka a plovoucí nejednoznačnost na každý oblouk družice. Chyba přesné dráhy a hodin je společná kódu a fázi družice, takže každá družice je jedna korelovaná aktualizace o dvou řádcích, v Josephově stabilizovaném tvaru, který udržuje kovarianci kladně definitní přes tisíce fázových aktualizací na úrovni milimetrů. Měření se simulují ze stejného modelu, takže normalizovaná odhadovaná chyba na druhou (NEES) polohy musí sledovat rozdělení chí-kvadrát se třemi stupni volnosti; test to ověřuje přes seedy Monte Carlo. Konvergence je první epocha, po níž horizontální a vertikální chyby zůstávají pod prahy ({ "10" } cm) do konce běhu.

seg-630384148ec7 = Družice LEO přejde oblohu asi za deset minut, družice MEO se posune o několik stupňů, takže oblouky LEO oddělí nejednoznačnosti od polohy mnohem dříve.

seg-17f9cf9cc24d = Downlink nepozemní sítě (NTN) 5G v pásmu S družicové mobilní služby (MSS), pásmo n256 projektu 3rd Generation Partnership Project (3GPP) ({ "2170" } až { "2200" } MHz). Cramérova-Raova mez (CRB) pro čas příchodu je <c1/>, kde <c2/> je střední kvadratická (Gaborova) šířka pásma (<c3/> pro plochá spektra OFDM), a pro kmitočet tónu <c4/>. Druh porovnává kanály (výchozí je kanál New Radio { "5" } MHz a úzkopásmový kanál { "200" } kHz) pomocí určení polohy z časů příchodu downlinku s neznámými hodinami přijímače a určení polohy z Dopplera jedné družice během přeletu.

seg-516afd013d38 = Druh, režim

seg-529a5aeea10a = Co ukazuje (seedované, deterministické)

seg-6cd0b721006a = <c1/>, doppler

seg-c3c51264f12a = Vrstva Xona Pulsar X1 ({ "258" } družic), šum Dopplera { "1" } Hz: 3D chyba { "7.5" } m po deseti minutách ({ "26" } družic); na jediném přeletu je jedno-sigma napříč dráhou { "303" } m, když přelet míří téměř přes zenit ({ "25" } km od dráhy), oproti { "43" } m při { "250" } km od dráhy

seg-da85037a6691 = Signály příležitosti pouze s Dopplerem, chyba Dopplera { "30" } Hz při { "10" } Hz: formální horizontální jedno-sigma asi { "10" } m po { "20" } s s { "12" } družicemi a { "6" } m po { "60" } s

seg-4dbb00da5310 = <c1/>, joint

seg-553e8f4df276 = medián PDOP GPS a Galileo { "1.47" } a střední kvadratická (RMS) 3D chyba { "1.06" } m; samotné Xona X5 { "1.73" } a { "0.49" } m; fúzovaně { "1.06" } a { "0.41" } m; zkreslení LEO { "40" } ns ({ "11.99" } m) odhadnuto jako { "12.06" } m

seg-83378a120e0d = Konvergence { "7.4" } min (pouze GNSS na MEO), { "4.8" }, { "3.2" }, { "2.7" } a { "2.3" } min při { "60" }, { "96" }, { "192" } a { "288" } družicích LEO

seg-4aadc3b41822 = Mez vzdálenosti { "0.26" } až { "1.03" } m pro { "4.5" } MHz a { "6.5" } až { "26" } m pro { "180" } kHz; určení polohy kolem { "2" } m oproti { "26" } m

seg-5b1019210ca7 = <c1/>, polar

seg-108488f6cc6c = VDOP GPS a Galileo { "1.20" } na rovníku, { "1.51" } při { "89.9" } stupních; s Iridiem { "1.14" } na pólu

seg-bcdbe0796127 = <c1/>, timing

seg-94ab83c05f50 = Přenos času z Iridia během { "6" } hodin v Boulderu: { "9.9" } až { "11.4" } ns RMS při nominálním C/N0 napříč čtyřmi třídami oscilátorů, { "15.1" } až { "25.0" } ns při signálu o { "30" } dB nižším

seg-3007f5930dfd = <c1/> (volitelné)

seg-f6ff187a00aa = GNSS doplněné o dvě družice IOD na referenční časové stupnici (pouze v repozitáři, zadrženo s předvolbou)

seg-98710204278b = Tyto druhy běží i uvnitř jiných scénářů: <c1/> je členem průchodu <c2/> a kampaní <c3/>, <c4/>, <c5/> a <c6/>; <c7/> průchodu <c8/>; <c9/> průchodu <c10/>; a <c11/> a <c12/> jsou stupně fúzovaného určení polohy a PPP druhu <c13/>. Jejich výsledky jsou na <a1>LEO-PNT.md</a1>.

seg-2f3086178d0b = Zveřejněné hodnoty a označení

seg-8980b5ae869b = Hodnota

seg-0be9b5747c00 = Kshana

seg-3d2d01038419 = Doppler Iridia až ±{ "36" } kHz

seg-a88258961299 = { "35.9" } kHz, maximum přes den přeletů, do { "5" } %

seg-5bc3150b53f6 = VALIDATED (<c1/>)

seg-35a3ec8ee073 = Maximální Doppler Xona Pulsar X1 { "32" } až { "34" } kHz

seg-499acd31a8f8 = arXiv:{ "2509.19551" }

seg-e8c9c880a3eb = { "33.6" } kHz z jedné družice každého zveřejněného shellu ({ "1080" } km, { "53" } a { "97" } stupňů), uvnitř intervalu bez rozšíření; samotný shell { "53" } stupňů vrcholí na { "31.8" } kHz, protože rotace Země zpomaluje prográdní dráhu vůči zemi

seg-e12713d5019f = VALIDATED (stejný test)

seg-370ca62e7fc7 = Jerk Xona Pulsar X1 ±{ "1.26" } Hz/s²

seg-4de9b0895288 = asi { "1.0" } Hz/s² na přeletu přes zenit

seg-5019322f4669 = uvedeno, ale neověřeno proti nezávislé vnější referenci

seg-7fcb83027ff4 = Konvergence PPP { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min s 60/96/192/288 LEO

seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monotónně

seg-0a1133c16dce = MODELLED shoda trendu (konstelace, šum a stanice nejsou reprodukovány)

seg-7c5292729f36 = Starlink asi { "2" } m za { "20" } s se třemi družicemi

seg-6a54a7c58ade = Kozhaya, Saroufim a Kassas { "2025" }

seg-13fc5fc4f69f = formální horizontální jedno-sigma asi { "10" } m po { "20" } s s { "12" } družicemi, s dokonalými efemeridami a každou chybou v sigma Dopplera { "30" } Hz při { "10" } Hz

seg-4fc80a02ed6c = MODELLED srovnání (přijímač a měřicí rychlost nejsou reprodukovány)

seg-5d0ae24eb74c = Časování Iridia pod { "40" } ns od UTC(NIST)

seg-fa4467605bc4 = NIST

seg-b910bf5135dd = asi { "10" } ns RMS podle modelu

seg-9025f3c376c5 = MODELLED srovnání

seg-4434b0ff1caa = Vše ostatní je MODELLED s odůvodněním ve verifikační matici (<c1/>): DOP se kontroluje proti ručně odvozenému případu čtyř družic, určení polohy proti jejich kovarianci, model Dopplera proti identitě zrychlení vzdálenosti, filtr PPP proti pásmu NEES chí-kvadrát a meze proti kvadratuře.

seg-aa5482ac34ff = Omezení, uvedená otevřeně

seg-0b4564367dcd = Dvoutělesové dráhy se sekulárním driftem z J2, druhé zonální harmonické Země; žádná chyba fitu vysílaných efemerid nad rámec jedno-sigma SISRE, žádný diagram antény družice.

seg-b51ccfee4ab8 = Žádné ionosférické ani troposférické zpoždění v <c1/> (filtr PPP nese stav vlhkého zpoždění; jeho kombinace bez vlivu ionosféry odstraňuje ionosféru prvního řádu), žádná scintilace, vícecestné šíření, přeskoky cyklů ani řešení celočíselných nejednoznačností.

seg-a719ccac19c0 = Přesnost NTN je mez, nikoli dosažený výsledek.

seg-19ba6cc0ca75 = Hodnoty předvoleb označené jako reprezentativní jsou ilustrativní a nepopisují návrh žádného provozovatele.

seg-f9f335d67ff8 = <s1>Předchozí</s1>Navigační zpráva LEO

seg-062138bbb73c = <s1>Další</s1>Návrh konstelace
