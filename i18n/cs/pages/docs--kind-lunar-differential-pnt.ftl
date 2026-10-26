# docs--kind-lunar-differential-pnt: translations (cs)

seg-9feefecdcf67 = rafs

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-d0c9bec248b4 = Zdroj: <c1/>

seg-d226df2bb634 = <c1/> (druh scénáře)

seg-8ac5ac006ae7 = Modelovaný lunární DIFERENCIÁLNÍ PNT (analogie lunárního DGNSS/SBAS): referenční stanice třídy NovaMoon na ZNÁMÉM selenografickém místě počítá diferenciální korekce jednotlivých družic z ILUSTRATIVNÍ konstelace třídy Moonlight/LCNS z veřejných zdrojů (NovaMoon uváděn jen jako TŘÍDA systému, bez spojení s ESA) a uživatel posunutý o baseline_km je aplikuje, takže SPOLEČNÉ orbitální a hodinové chyby se vyruší. Hodinový člen se vyruší PŘESNĚ (algebraická identita); u orbitálního členu zůstane jen projekce rozdílu směrů přímé viditelnosti, která → { "0" } pro základnu → { "0" } (podlaha prostorové dekorelace) a roste ≈ lineárně se základnou. Uvádí 3D chybu polohy uživatele S korekcemi a BEZ nich, faktor snížení, křivku chyby v závislosti na základně a ochrannou úroveň uživatele, která POUŽÍVÁ ZNOVU aparát SBAS DO-229E (crate::sbas) s diferenciálním reziduálním σ. MODELLED — přesná identita zrušení + dekorelační model prvního řádu; neověřeno na reálných datech; bez TRL/heritage/podpory agentury. Deterministický, je-li seedovaný.

seg-4b7355b174a3 = Jeden běh <c1/> se shrne takto: lunar-differential-pnt | { "8" } družic (ilustrativní třídy LCNS, bez spojení) | základna { "50" } km | chyba uživatele { "24.46" } m → { "0.0077" } m (snížení { "3186" }×) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

seg-1115464be513 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-3f32e0fea066 = Příklad <c1/> mimo jiné nastavuje:

seg-8e67df89448a = Graf, který engine zapisuje pro scenarios/lunar-differential-pnt.toml, druh lunar-differential-pnt

seg-6f4246bd8f6f = <b>MODELLED</b> Diferenciální referenční stanice třídy NovaMoon: zrušení společného módu + reziduál rostoucí se základnou + ochranné úrovně DGNSS. Orákulum (InternalConsistency): Identita diferenciálního zrušení chyb + opětovné použití aparátu PL SBAS DO-229E; jednoduchý rozdíl + řešení WLS je navíc křížově ověřeno proti lsq()/matinv() z RTKLIB (Takasu, BSD-2-Clause, kompilované C) — nezávislý kód řešiče, ale stejná algebra rozdílu LOS prvního řádu, takže stále InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> Tři členy, které diferenciální korekce nabere mezi epochou, ve které je vypočtena, a epochou, ve které je použita, každý dříve ponechaný jako nemodelovaná rezerva:. Orákulum (InternalConsistency): Identity v uzavřeném tvaru a vnitřní konzistence: rozptyl rovnoměrného kvantizéru step²/12, přesné šíření kovariance (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ splývající na σ·PDOP pro stejné σ, přenos { "1" }:{ "1" } členu zaměření jako důsledek û_user ≈ û_ref a kvadraturní uzavření vypínání. Křížová kontrola PDOP proti orbit::dop sdílí normální matici [−û, { "1" }], takže jde o kontrolu konzistence a je tak označena, nikoli jako nezá

seg-f1e7283d2e15 = MODELLED — přesná identita zrušení + dekorelační model prvního řádu; neověřeno na reálných datech; bez TRL/heritage/podpory agentury. (katalog druhů (<c1/>))

seg-9d54d8c07ca3 = ČESTNOST: MODELLED. Zrušení společného módu je PŘESNÁ algebraická identita; reziduál prostorové dekorelace je geometrický model PRVNÍHO ŘÁDU (projekce rozdílu LOS vložené orbitální chyby), nikoli model dekorelace nafitovaný na reálném lunárním sledování. Ochranná úroveň uživatele POUŽÍVÁ ZNOVU aparát ochranných úrovní SBAS DO-229E (crate::sbas) s diferenciálním reziduálním sigma jako chybou jednotlivé družice (komentář v souboru scénáře, řádky { "23" } až { "28" })

seg-4156a7515574 = ── KOREKČNÍ SPOJ ────────────────────────────────────────────────────────────── Výše uvedená identita předpokládá DOKONALOU korekci: vypočtenou stanicí, která přesně ví, kde stojí, doručenou okamžitě, s nekonečným rozlišením. Nic z toho neplatí a tři níže uvedené vstupy modelují, co každé z nich stojí. Vstupují POUZE do bloku <c1/> dokumentu výsledku -- když jsou všechny tři na hodnotách napsaných h (komentář v souboru scénáře, řádky { "57" } až { "62" })

seg-e7f016777e09 = CHYBA ZAMĚŘENÍ. Stanice tvoří korekci vůči souřadnici, o které se DOMNÍVÁ, že platí. Chyba v ní se přenáší na každou vysílanou korekci a k uživateli se dostane jako -delta . u_ref -- což neobsahuje žádnou geometrii uživatele, takže na rozdíl od orbitálního členu ani nemizí při nulové základně, ani s ní neroste, a přenáší se zhruba jedna ku jedné do polohy uživatele. Výchozí hodnota { "0.30" } m je vlastní lunární reference balíku (komentář v souboru scénáře, řádky { "64" } až { "70" })

seg-e0648d9b52b4 = STÁRNUTÍ KOREKCE. Korekce vypočtená v t a použitá v t+tau je zastaralá dvojím způsobem. Orbita: družice se POSUNULA, takže zmrazený vektor orbitální chyby se nyní promítá na pootočenou přímou viditelnost; rotace pochází z propagátoru tohoto balíku, takže se nikde nepředpokládá rychlost orbitální chyby. Hodiny: hodiny družice se vychýlily o c*sigma_y(tau)*tau pro mocninný zákon plného RAFS v crate::clock_specs, kalibrovaný (komentář v souboru scénáře, řádky { "73" } až { "79" })

seg-7171b2e3f29d = Lunární diferenciální PNT je MODELLED, nikoli ověřené: je kontrolováno proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Lunární diferenciální PNT — rozpočet reziduí korekčního spoje je MODELLED, nikoli ověřený: je kontrolován proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Tematická stránka: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-2b8455001710 = <s1>Předchozí</s1>lunar-beacon

seg-dca7482d9d75 = <s1>Další</s1>lunar-frame-campaign

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-549a6103e711 = bit
