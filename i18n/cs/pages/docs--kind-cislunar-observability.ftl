# docs--kind-cislunar-observability: translations (cs)

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-6d584e86deba = poměr (bezrozměrný)

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-258f128cea60 = Zdroj: <c1/>

seg-f0c7758e472f = <c1/> (druh scénáře)

seg-7ccd0a3babb8 = MODELLED pozorovatelnost rovinné cislunární konstelace (P6): sleduje konstelaci čtyř družic na diferenciálně korigovaných rovinných drahách DRO s meziddružicovým měřením vzdálenosti a uvádí, jak velká část čtyřstavu [x,y,ẋ,ẏ] družice je na oblouku pozorovatelná. Vydává ({ "1" }) tabulku hodnosti podle délky oblouku pro jediný spoj jen se vzdáleností -- okamžitě hodnost 1, rostoucí k plnému čtyřstavu s prodlužováním oblouku (P6 Table { "1" }); ({ "2" }) spektrum vlastních čísel Gramiánu pozorovatelnosti a číslo podmíněnosti přes oblouk; ({ "3" }) srovnání okamžité hodnosti jen se vzdáleností a se vzdáleností plus její rychlostí změny (návrhová páka Doppler) spolu s hlášením GDOP, které je singulární pro jen vzdálenost a definované pro vzdálenost plus rychlost; a ({ "4" }) nezávislou křížovou validaci SRIF, jejíž posteriorní kovariance se stane konečnou a dobře podmíněnou přesně na oblouku, kde pozorovatelná hodnost dosáhne čtyř. VALIDATED jádro: pozorovatelná hodnost je práh singulárních čísel odhalující hodnost, zkontrolovaný proti hodnosti z vlastních čísel Gramiánu; spektrum vlastních čísel splňuje spektrální invarianty (stopa=Σλ, det=Πλ, Frobenius²=Σλ²); variační STM je STM CR3BP ověřená konečnými diferencemi; řádky jakobiánu vzdálenosti a rychlosti změny vzdálenosti jsou analytické parciální derivace ověřené konečnými diferencemi (zkontrolované proti 3-D pozorovatelné rychlosti změny vzdálenosti v crate); čtyři počáteční podmínky jsou diferenciálně korigované rovinné DRO, které se uzavírají na těsné reziduum periodicity a jsou retrográdní; přechod hodnosti je křížově validován proti filtru odmocniny informace v crate (posteriorní kovariance konečná přesně při plné hodnosti, cond(P)=cond(OᵀO)); snímek s deficitem hodnosti je označen jako GDOP-nedefinované (fim condition=inf), nikdy ne smyšlenou konečnou hodnotou -- stejná ochrana proti singulární geometrii, jakou používá pvt::solve_spp. MODELLED: návrh konstelace (amplitudy a fáze perilunia DRO) a konkrétní postup hodnosti, který vytváří. Nejde o produkt s certifikací navigačního výkonu.

seg-a59f2fa9efb9 = Jeden běh <c1/> se shrnuje takto: cislunar-observability | { "4" } s/c ({ "3" } ref.) | oblouk { "6.0" } h, { "24" } epoch | hodnost { "1" } → { "4" } ze { "4" } přes oblouk | λ Gramiánu [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | okamžitá hodnost jen vzdálenost { "2" } → vzdálenost+rychlost { "4" } ({ "3" } spoje) | GDOP jen vzdálenost nedefinováno, vzdálenost+rychlost { "6.353" } | počáteční podmínky DRO (max. reziduum periodicity { "4.7e-9" }) | posteriorní SRIF konečná v epoše { "8" } s hodností 4 (ověřeno proti nezávislé vnější referenci: hodnost / STM / uzavření DRO / SRIF; vypočteno z modelu: návrh)

seg-fb1601eda130 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-f3b5cc590c78 = Příklad <c1/> mimo jiné nastavuje:

seg-0cc8ab10786b = časové jednotky rotující soustavy

seg-84781b6fff48 = GDOP nedefinováno (s deficitem hodnosti / singulár

seg-856eb311f24b = „undefined“ (text, jak jej uvádí dokum

seg-fc5d34345fdd = Označení výsledku (z enginu): MODELLED pozorovatelnost rovinné cislunární konstelace (P6). VALIDATED jádro: pozorovatelná HODNOST je práh singulárních čísel odhalující hodnost, zkontrolovaný proti hodnosti z vlastních čísel Gramiánu; spektrum vlastních čísel Gramiánu splňuje spektrální invarianty (stopa = součet vl. čísel, det = součin vl. čísel, Frobenius^{ "2" } = součet vl. čísel^{ "2" }

seg-f15bbf30b0dd = Graf, který engine zapisuje pro scenarios/cislunar-observability.toml, druh cislunar-observability

seg-4564ad90378b = <b>MODELLED</b> Práh pozorovatelnosti podle délky cislunárního oblouku v PROSTOROVÉM šestistavovém CR3BP namísto rovinného čtyřstavu, napříč rodinami DRO, halo L2 a téměř přímočaré halo L2, se šumem měření vstupujícím do Gramiánu a DVĚMA kritérii, která uvádí

seg-9f857ff85800 = <b>MODELLED</b> Práh pozorovatelnosti podle délky cislunárního oblouku v PROSTOROVÉM šestistavovém CR3BP namísto rovinného čtyřstavu, napříč rodinami DRO, halo L2 a téměř přímočaré L2 ha. Oracle (InternalConsistency): Nezávislá hodnost v řádkově odstupňovaném tvaru Gaussovou eliminací s částečným výběrem pivotu potvrzuje každý verdikt o hodnosti šestistavu -- jiný algoritmus, který nesdílí žádný kód s testovanou cestou vlastních čísel / SVD. Přechodová matice stavu CR3BP { "6" }×{ "6" }, kterou se skládá, nese vlastní orákulum ReferenceImpl proti variační integraci v SciPy a počáteční podmínky halo/NRHO pocházejí z korektoru, který reprodukuje zveřejněné jižní L2

seg-53c183035bde = MODELLED pozorovatelnost rovinné cislunární konstelace (P6). VALIDATED jádro: pozorovatelná HODNOST je práh singulárních čísel odhalující hodnost, zkontrolovaný proti hodnosti z vlastních čísel Gramiánu; spektrum vlastních čísel Gramiánu splňuje spektrální invarianty (stopa = součet vl. čísel, det = součin vl. čísel, Frobenius^{ "2" } = součet vl. čísel^{ "2" }); variační STM je STM CR3BP ověřená konečnými diferencemi (crate::cr3bp); řádky jakobiánu vzdálenosti / rychlosti změny vzdálenosti (výsledek <c1/>)

seg-f6a217f57bec = MODELLED pozorovatelnost rovinné cislunární konstelace (P6): sleduje konstelaci čtyř družic na diferenciálně korigovaných rovinných drahách DRO s meziddružicovým měřením vzdálenosti a uvádí, jak velká část čtyřstavu [x,y,ẋ,ẏ] družice je na oblouku pozorovatelná. (katalog druhů (<c1/>))

seg-e5182743fd40 = MODELLED: návrh konstelace (amplitudy a fáze perilunia DRO) a konkrétní postup hodnosti, který vytváří. (katalog druhů (<c1/>))

seg-5d3a370f1295 = Poctivost: MODELLED. VALIDATED jádro -- pozorovatelná HODNOST je práh singulárních čísel odhalující hodnost, zkontrolovaný proti hodnosti z vlastních čísel Gramiánu; spektrum vlastních čísel splňuje spektrální invarianty (stopa = součet vl. čísel, det = součin vl. čísel, Frobenius^{ "2" } = součet vl. čísel^{ "2" }); variační STM je STM CR3BP ověřená konečnými diferencemi; řádky jakobiánu vzdálenosti / rychlosti změny vzdálenosti jsou analytické parciální derivace ověřené konečnými diferencemi (zkont (komentář v souboru scénáře, řádky { "16" } až { "25" })

seg-c68bc1df8975 = Prostorová, zašuměná pozorovatelnost délky cislunárního oblouku napříč více rodinami je MODELLED, nikoli ověřena proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-ba3c2a8f0e28 = <s1>Předchozí</s1>cislunar-arc-recovery

seg-3adfb78b1f34 = <s1>Další</s1>clock
