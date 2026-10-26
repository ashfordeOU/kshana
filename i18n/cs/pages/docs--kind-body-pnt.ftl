# docs--kind-body-pnt: translations (cs)

seg-5b561b4fd201 = Mars

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-51362910dcb7 = Tento druh používají { "2" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: řádky <a1>verifikační matice</a1>, které tento druh jmenují.

seg-02b8d1f1b7df = Zdroj: <c1/>

seg-e28ba749a2a1 = <c1/> (druh scénáře)

seg-11e8c29ecb45 = Druh scénáře enginu v{ $version }, rodina <a1>Konstelace, pokrytí a geometrie</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-e7dad1a1ecba = Určování polohy kolem libovolného tělesa sluneční soustavy: orbiter nebo povrchový lander kolem centrálního tělesa zvoleného podle názvu (Mars, Měsíc, Europa, Ganymed, Titan a zbytek katalogu sluneční soustavy), navigující jednosměrnými pseudovzdálenostmi z malé navigační konstelace typu Walker kolem tělesa (dvoutělesové dráhy se sekulárním driftem J2 daného tělesa, neznámé hodiny uživatele) a volitelně bezhodinovou dvoucestnou vzdáleností hlubokého vesmíru od Země, jejíž směr a vzdálenost pocházejí z analytických efemerid sluneční soustavy v každé epoše. Přímé viditelnosti blokuje střední koule tělesa a povrchový uživatel potřebuje také elevační masku. Za epochu: relé v dohledu, zda je Země nad okrajem tělesa, GDOP a PDOP samotné konstelace (geometrické a polohové zhoršení přesnosti), formální jednosigmová nejistota polohy s řádkem Země a bez něj a chyba určení polohy metodou nejmenších čtverců Gauss-Newton se seedem pro každou variantu; za celý běh: dostupnost, viditelnost Země, medián PDOP, chyba RMS a medián formální sigmy, plus světelný čas Země-těleso, oběh tam a zpět, Shapirovo zpoždění a úhel k Slunci v dané epoše. MODELLED: dráhy relé, úrovně šumu a okamžitý model měření jsou modelové volby, nikoli ověřené proti navigačním datům mise; konstanty těles jsou zveřejněné hodnoty uvedené v body.rs a geometrie Země přebírá označení efemerid sluneční soustavy.

seg-c90c1a79f88b = Jeden běh <c1/> se shrnuje takto: Určování polohy kolem Marsu, uživatel na orbiteru, { "12" } relé ve výšce { "10000" } km, { "296" } epoch Světelný čas Země { "338.3" } s jedním směrem, { "676.6" } s tam a zpět; úhel Slunce-Země-těleso { "175.4" } deg dostupnost: { "1.000" } jen konstelace, { "1.000" } se vzdáleností od Země (Země v dohledu { "0.811" }) medián PDOP { "1.375" } ; chyba RMS { "1.883" } m jen konstelace, { "1.629" } m se vzdáleností od Země medián formální sigmy { "1.375" } m jen konstelace, { "1.304" } m se vzdáleností od Země

seg-31bacf177d9c = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3f1989254167 = Příklad <c1/> mimo jiné nastavuje:

seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

seg-753b1683fb7b = m^3/s^{ "2" }

seg-81d4cd54bd62 = Označení výsledku (z enginu): MODELLED: dvoutělesové dráhy relé se sekulárním driftem J2, geometrická viditelnost, gaussovský šum vzdálenosti a okamžitý model měření kolem tělesa ze zveřejněných konstant; není ověřeno proti navigačním datům mise. Geometrie Země-těleso přebírá označení efemerid sluneční soustavy

seg-6f341acbe994 = Graf, který engine zapisuje pro scenarios/mars-orbit-pnt.toml, druh body-pnt

seg-dae4184bb004 = <b>VALIDATED</b> Newtonův jednosměrný světelný čas z libovolného tělesa k libovolnému jinému, přijatý v dané epoše, řešený radiometrickým řešičem světelného času s pevným bodem (radiometric::light_time_solution, vysílač v retardované poloze) přes solar_system::link_o Testy: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-45259ad33a01 = <b>MODELLED</b> Druh <c1/>: orbiter nebo povrchový lander kolem tělesa zvoleného podle názvu navigují jednosměrnými pseudovzdálenostmi z navigační konstelace typu Walker kolem tělesa (dvoutělesové dráhy se sekulárním driftem J2 tělesa, neznámé hodiny uživatele

seg-5c3f8ac041d3 = <b>MODELLED</b> Druh <c1/>: orbiter nebo povrchový lander kolem tělesa zvoleného podle názvu navigují jednosměrnými pseudovzdálenostmi z navigační konstelace typu Walker kolem tělesa arou. Oracle (InternalConsistency): Uzavřené tvary a vnitřní konzistence: třetí Keplerův zákon pro periodu relé, poloměr dráhy a poloměr povrchu zachované během běhu, přidání měření, které nikdy nezvýší formální nejistotu, a seedem generované chyby odpovídající kovarianci. Dráhy relé ignorují třetí tělesa (tah Jupiteru na relé kolem Europy není modelován), šum je gaussovský při uvedených úrovních a model měření je okamžitý

seg-64920deda9cd = MODELLED: dvoutělesové dráhy relé se sekulárním driftem J2, geometrická viditelnost, gaussovský šum vzdálenosti a okamžitý model měření kolem tělesa ze zveřejněných konstant; není ověřeno proti navigačním datům mise. Geometrie Země-těleso přebírá označení efemerid sluneční soustavy. (výsledek <c1/>)

seg-bcb5cbf9cbe3 = MODELLED: dráhy relé, úrovně šumu a okamžitý model měření jsou modelové volby, nikoli ověřené proti navigačním datům mise; konstanty těles jsou zveřejněné hodnoty uvedené v body.rs a geometrie Země přebírá označení efemerid sluneční soustavy. (katalog druhů (<c1/>))

seg-04cd882741e2 = MODELLED. Dráhy relé, šum vzdálenosti { "1" } m a okamžitý model měření jsou modelové volby; nic z toho není ověřeno proti navigačním datům mise. Konstanty Marsu jsou zveřejněné hodnoty uvedené v src/body.rs. (komentář v souboru scénáře, řádky { "20" } až { "22" })

seg-df6bae4c422e = Určování polohy kolem libovolného tělesa sluneční soustavy s místní konstelací a spojem hlubokého vesmíru od Země je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-a4f1e7d2041e = Stránka rodiny: <a1>Konstelace, pokrytí a geometrie</a1>

seg-670191cf797f = Tematická stránka: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Tematická stránka: <a1>CONSTELLATION-DESIGN.md</a1>

seg-a4c650a0eb7a = <s1>Předchozí</s1>attitude-budget

seg-96170e5c8e3f = <s1>Další</s1>campaign
