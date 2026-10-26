# docs--kind-eo-radiometry: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-cd04f5662884 = MODELLED. (katalog druhů (<c1/>))

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-8e62cc4af6ea = Tematická stránka: <a1>ENTRY-EO-ASCENT.md</a1>

seg-841259b04897 = Zdroj: <c1/>

seg-1b0ba13fcef1 = <c1/> (druh scénáře)

seg-816bd5a5808a = Radiometrie a kvalita obrazu snímače v nadiru: zářivost scény s Lambertovým odrazem na apertuře, rovnice kamery, signál a šum výstřelový/temný/čtecí/kvantizační a SNR; MTF systému na Nyquistově frekvenci (difrakce x detektor x rozmazání x chvění), z ní odvozená relativní odezva na hranu, Q = lambda F/p a NIIRS podle GIQE verze { "4" } bez kompenzace MTF. MODELLED.

seg-7d786a7bfb86 = Jeden běh <c1/> se shrnuje takto: eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (jímka { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

seg-3378b7b0716f = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-d613181f3fe3 = Příklad <c1/> mimo jiné nastavuje:

seg-ffb002276b21 = um

seg-1c15591babed = px

seg-e94f9ad9e6c4 = Označení výsledku (z enginu): MODELLED — radiometrie snímače v nadiru (scéna s Lambertovým odrazem, rovnice kamery, šum výstřelový/temný/čtecí/kvantizační), MTF systému na Nyquistově frekvenci (difrakce x detektor x rozmazání x chvění), relativní odezva na hranu, Q = lambda F/p a NIIRS podle GIQE { "4" } bez kompenzace MTF; NIIRS je empirická regrese na modelov

seg-bf7b52f7a01e = Graf, který engine zapisuje pro scenarios/eo-radiometry.toml, druh eo-radiometry

seg-562a7cf2859c = <b>MODELLED</b> Rozpočet poměru signálu k šumu snímače v nadiru (zářivost scény s Lambertovým odrazem, rovnice kamery, šum výstřelový, temný, čtecí a kvantizační), MTF systému na Nyquistově frekvenci jako součin difrakce neobstruované apertury, apertury detektoru, lineárního rozmazání a Gaus

seg-dadea618d757 = <b>MODELLED</b> Rozpočet poměru signálu k šumu snímače v nadiru (zářivost scény s Lambertovým odrazem, rovnice kamery, šum výstřelový, temný, čtecí a kvantizační), MTF systému na Nyquistově frekvenci jako součin. Oracle (InternalConsistency): Uzavřené tvary: difrakční MTF při polovině mezní frekvence, jednopixelová rampa hrany čistě detektorové apertury (RER { "1" }), normálně distribuční hrana gaussovského rozmazání (RER = erf(0.5/(sigma sqrt { "2" }))), škálování výstřelového šumu a koeficienty GIQE { "4" } tak, jak byly zveřejněny (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). CO NENÍ: nebyl porovnán žádný externí snímač, naměřená MTF ani hodnocený snímek; GIQE je empirická regrese s vlastní

seg-5182b4b0f8d6 = MODELLED — radiometrie snímače v nadiru (scéna s Lambertovým odrazem, rovnice kamery, šum výstřelový/temný/čtecí/kvantizační), MTF systému na Nyquistově frekvenci (difrakce x detektor x rozmazání x chvění), relativní odezva na hranu, Q = lambda F/p a NIIRS podle GIQE { "4" } bez kompenzace MTF; NIIRS je empirická regrese na modelových vstupech, nikoli hodnocený snímek (výsledek <c1/>)

seg-b2f1e6466c2c = Radiometrie a kvalita obrazu snímače v nadiru pro ILLUSTRATIVE malou kameru pro pozorování Země (žádný návrh žádného provozovatele): apertura { "0.40" } m, ohnisková vzdálenost { "3.6" } m (F/9), pixely { "5.5" } um, z výšky { "500" } km. Běh uvádí rozpočet poměru signálu k šumu scény s odrazivostí { "15" } %, MTF systému na Nyquistově frekvenci, relativní odezvu na hranu a NIIRS podle GIQE verze { "4" }. MODELLED: NIIRS je empirická regrese vyhodnocená na modelových vstupech, n (komentář v souboru scénáře, řádky { "1" } až { "5" })

seg-aaf9ed3b0899 = Radiometrie elektrooptického snímače, MTF, relativní odezva na hranu a NIIRS podle GIQE { "4" } jsou MODELLED, nikoli ověřeny proti nezávislé vnější referenci: kontrolují se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-d6c92dc655ab = <s1>Předchozí</s1>eo-coverage

seg-a0daef9a496e = <s1>Další</s1>ephemeris
