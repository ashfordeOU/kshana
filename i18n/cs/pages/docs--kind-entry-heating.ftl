# docs--kind-entry-heating: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: řádky <a1>verifikační matice</a1>, které tento druh jmenují.

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = Tematická stránka: <a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth

seg-13b9e9187ab9 = Zdroj: <c1/>

seg-3a3f732cc2dd = <c1/> (druh scénáře)

seg-b843e2e0a4ee = Vstup do atmosféry jako hmotný bod ve 3 stupních volnosti nad rotující kulovou Zemí nebo Marsem (balistický, nebo nosný při konstantním náklonu), RK4, atmosférou US76, exponenciální atmosférou nebo atmosférou Marsu, s konvektivním ohřevem v bodě zastavení podle Sutton-Graves (NASA TR R-376): špičkové zpomalení, tepelný tok a dynamický tlak, tepelné zatížení, dolet, kontrola energie v rotující soustavě a vedle ní Allen-Eggersův uzavřený tvar. Špičkové zpomalení je zkontrolováno proti zveřejněné nominální hodnotě Stardust; ohřev je MODELLED.

seg-05c8dac8d411 = Jeden běh <c1/> se shrnuje takto: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> špička { "35.4" } g ve výšce { "54.2" } km, špičkové q { "746" } W/cm² ve výšce { "62.0" } km, tepelné zatížení { "20970" } J/cm², špičkové q_dyn { "20.8" } kPa; koncová výška v { "317" } s (uzavřený tvar { "60.2" } g; MODELLED 3-DoF, bez radiačního ohřevu / TPS)

seg-96504cafb034 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-1b68d973fd30 = Příklad <c1/> mimo jiné nastavuje:

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) balistická konsta

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = Označení výsledku (z enginu): MODELLED — vstup jako hmotný bod ve 3 stupních volnosti nad rotující kulovou planetou (centrální gravitace, bez J2), spolu s planetou rotující atmosféra bez větru, konstantní C_D, L/D a náklon, RK4; konvektivní ohřev v bodě zastavení podle NASA TR R-376 ({ "1971" }), studená stěna, ŽÁDNÝ radiační ohřev, ŽÁDNÁ odezva TPS/ablace, NENÍ 6-DoF

seg-dbb618cd6357 = Graf, který engine zapisuje pro scenarios/entry-heating-stardust.toml, druh entry-heating

seg-e73b339df97b = <b>VALIDATED</b> Vstup jako hmotný bod ve 3 stupních volnosti nad rotující kulovou Zemí atmosférou US Standard Atmosphere { "1976" }, integrovaný metodou RK4 z inerciálního vstupního stavu, s uvedením špičkového zpomalení a jeho výšky; vstupní stav vzhledem k planetě z i Testy: <a1>entry_stardust_published.rs</a1>.

seg-10124432b79b = <b>MODELLED</b> Konvektivní tepelný tok v bodě zastavení q = k sqrt(rho/R_n) V^{ "3" } s konstantami Sutton-Graves pro vzduch Země a atmosféru Marsu (NASA TR R-376, { "1971" }), jeho špička a integrované tepelné zatížení podél vstupu ve 3 stupních volnosti, balistického nebo nosného při Testy: <a1>entry_stardust_published.rs</a1>.

seg-54d133781215 = <b>VALIDATED</b> Vstup jako hmotný bod ve 3 stupních volnosti nad rotující kulovou Zemí atmosférou US Standard Atmosphere { "1976" }, integrovaný metodou RK4 z inerciálního vstupního stavu, s uvedením th. Oracle (ExternalDataset): Nominální let Stardust od Desai, Mitcheltree a Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maximální zpomalení { "33.4" } g při { "12.6" } km/s vzhledem k planetě s startovní hmotností { "45.8" } kg, trajektorie POST ve 6 stupních volnosti s úplnou aerodynamickou databází; vstupní rozhraní od Desai, Lyons, Tooley a Kangas (NTRS { "20090004445" }): poloměr { "6503.14" } km, inerciálně { "12.9" } km/s při -8.2 deg. Prahy předem registrované v xval/entry-stardust/PREREGISTRATION.

seg-03878684f9a1 = <b>MODELLED</b> Konvektivní tepelný tok v bodě zastavení q = k sqrt(rho/R_n) V^{ "3" } s konstantami Sutton-Graves pro vzduch Země a atmosféru Marsu (NASA TR R-376, { "1971" }), jeho . Oracle (InternalConsistency): Vnitřní konzistence: vztah a konstanty, jak jsou vytištěny v NASA TR R-376, kontrola konvergence polovičním krokem a očekávané pořadí špiček ohřevu a zpomalení. CO NENÍ: nebyla porovnána žádná zveřejněná hodnota ohřevu (články o Stardust uvádějí návrhový limit a odhad konvektivního plus radiačního ohřevu zhruba { "1200" } W/cm2, kterému se čistě konvektivní vztah nemůže vyrovnat); žádný radiační ohřev, teplota stěny ani

seg-a0f300b2ce78 = MODELLED — vstup jako hmotný bod ve 3 stupních volnosti nad rotující kulovou planetou (centrální gravitace, bez J2), spolu s planetou rotující atmosféra bez větru, konstantní C_D, L/D a náklon, RK4; konvektivní ohřev v bodě zastavení podle NASA TR R-376 ({ "1971" }), studená stěna, ŽÁDNÝ radiační ohřev, ŽÁDNÁ odezva TPS/ablace, NENÍ 6-DoF (výsledek <c1/>)

seg-47f81ab160cc = Špičkové zpomalení je zkontrolováno proti zveřejněné nominální hodnotě Stardust; ohřev je MODELLED. (katalog druhů (<c1/>))

seg-47cda83af127 = Vstupní rozhraní v poloměru { "6503.14" } km, inerciálně { "12.9" } km/s při -8.2 deg, { "45.8" } kg, průměr { "0.811" } m, poloměr přídě { "0.2202" } m (Desai et al., NASA NTRS { "20050042027" } a { "20090004445" }). Zeměpisná šířka a kurz jsou předpokládaný přibližný vstup nad Tichým oceánem; C_D je výchozí hodnota modulu pro kulovitý kužel { "60" } deg. Zveřejněné nominální špičkové zpomalení ve 6 stupních volnosti: { "33.4" } g. Ohřev je pouze konvektivní podle Sutton-Graves, MODELLED. (komentář v souboru scénáře, řádky { "4" } až { "8" })

seg-98af076be1ac = Konvektivní ohřev v bodě zastavení při vstupu do atmosféry (Sutton-Graves) ve 3 stupních volnosti je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-77c073cd5d67 = <s1>Předchozí</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>Další</s1>eo-coverage
