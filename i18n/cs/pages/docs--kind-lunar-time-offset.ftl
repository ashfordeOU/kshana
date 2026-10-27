# docs--kind-lunar-time-offset: translations (cs)

seg-64813e3da228 = Zdroj: <c1/>

seg-000bb13909f1 = <c1/> (druh scénáře)

seg-7f3e13712f10 = Modelovaná relativistická rychlost chodu hodin Země–Měsíc (lunární souřadnicový čas, LTC/TCL): sekulární rychlost LTC−TT z rozdílu vlastních potenciálů a kinetického členu Měsíce, uváděná spolu s publikovaným pásmem { "56" }–{ "59" } µs/den, plus akumulovaný posun za horizont.

seg-9efcf3e1be04 = Jeden běh <c1/> se shrne takto: lunar-time-offset | sekulární rychlost LTC−TT { "57.04" } µs/den (pásmo { "56" }–{ "59" }) | vlastní pot. { "57.50" } kinetický -0.46 | posun @ { "1.00" } d = { "57.04" } µs

seg-9367773c4889 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-4731141e6aac = Příklad <c1/> mimo jiné nastavuje:

seg-3843825d0733 = us

seg-e9deb6ed41c1 = Graf, který engine zapisuje pro scenarios/lunar-time-offset.toml, druh lunar-time-offset

seg-982426693747 = <b>VALIDATED</b> Relativistická rychlost chodu hodin Země–Měsíc (LTC/TCL) + řetězení TT/TAI/UTC + soubor hodin. Orákulum (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; základ pro IAU/IAG LunaNet LTC): vlastní potenciál povrchu Měsíce L_m = { "3.13881e-11" } a sekulární celkem { "56.02" } µs/den se shodují jako publikované číselné hodnoty; geocentrická rychlost Měsíce křížově ověřena proti JPL DE440 (de440s.bsp přes SPICE)

seg-96b65f604cc2 = Čestnost: MODELLED, nikoli s certifikací. Hlavní hodnota us/den závisí na referenci (geoid Země W0 oproti lunárnímu selenoidu, okno průměrování v čase, zanedbané odstředivé/J2 korekce pod us/den) -> pásmo, nikoli jediné číslo, je čestným výstupem. Nic zde není ověřeno na subnanosekundovou absolutní přesnost ani certifikováno pro provozní udržování času. Zpráva také uvádí akumulovaný posun LTC-TT za hori (komentář v souboru scénáře, řádky { "11" } až { "16" })

seg-e4552368a6a7 = <s1>Předchozí</s1>lunar-time-budget

seg-777dc23bac6a = <s1>Další</s1>lunar-vlbi-fim

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-4d208b6c0eb8 = den
