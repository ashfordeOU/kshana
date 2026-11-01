# docs--compliance: translations (cs)

seg-f65b1f2b4182 = Režim

seg-e19db3d5273b = Zdroj: <c1/>

seg-045b24defdbb = Mapa compliance integrity DO-316 / DO-229E

seg-9100800daa1c = Tento dokument mapuje požadavky RTCA (dříve Radio Technical Commission for Aeronautics) <b>DO-229E</b> (SBAS (satellite-based augmentation system, satelitní rozšiřující systém) MOPS (minimum operational performance standards, minimální provozní výkonnostní normy)) a <b>DO-316</b> (palubní zařízení GPS/SBAS (GPS: Global Positioning System)) na ochranné úrovně a monitorování integrity na funkce Kshana, které je implementují. Je to <b>inženýrská pomůcka pro dohledatelnost</b>, nikoli prohlášení, že byl některý požadavek splněn — Kshana implementuje publikované algoritmy; není to schválená avionika.

seg-0e6ec5617eb5 = Strojově čitelná podoba je <a1><c1/></a1>; tento text je její doprovod (zrcadlí <a2><c2/></a2>).

seg-d5d7a2ec9c73 = Ochranné úrovně váženými nejmenšími čtverci (DO-229E, příloha J)

seg-0dc19f403f5e = Pro každou družici <em>i</em> s elevací <c1/> a azimutem <c2/> u uživatele je řádek pozorování v lokální soustavě (ENU (east-north-up, východ-sever-nahoru) + hodiny)

seg-6415f7f28e7e = s vahou <c1/>, <c2/> (rozpočet UDRE (user differential range error, diferenciální chyba vzdálenosti uživatele) / GIVE (grid ionospheric vertical error, vertikální chyba ionosféry v mřížce) / palubní / troposféra). Kovariance polohy je <c3/>; její blok ENU dává horizontální a vertikální ochranné úrovně (HPL, VPL):

seg-ea574448bda4 = Kshana počítá <c1/> inverzí normální matice { "4" }×{ "4" } toutéž rutinou, jakou používá zásobník RAIM (receiver autonomous integrity monitoring, autonomní monitorování integrity přijímačem) (<c2/>), a výsledek ověřuje dvěma způsoby (cesta přes kovarianci <c3/> a cesta přes projekci <c4/> se musí shodovat) a dále proti nezávislé referenční geometrii numpy <c5/>.

seg-f63dd3d7aad4 = Zdroj

seg-268ae5b25684 = Na trase → NPA (nepřesné přiblížení; pouze horizontálně)

seg-479790ca91c3 = Rayleighovo <c1/> = { "6.1829" }

seg-dbae96c75a06 = Přesné přiblížení

seg-1bfafdcf6ab0 = DO-229E MOPS

seg-1922c53b8340 = Poznámka k poctivosti: MOPS používá zaokrouhlenou horizontální konstantu <c1/>; přesný oboustranný normální kvantil <c2/> je <c3/>. Kshana v kódu používá publikovanou hodnotu { "6.0" } a <c4/> odvozuje ze stejné funkce <c5/>, jakou používá zásobník RAIM, což je necirkulární křížová kontrola (hodnota se zaokrouhluje na MOPS { "5.33" }).

seg-ef191c1d3db1 = Dvoufrekvenční kombinace L1/L5 bez vlivu ionosféry (IS-GPS-705)

seg-b69825ef05d3 = S <c1/>, <c2/>, <c3/>:

seg-ce81c6b71738 = Ionosférické zpoždění prvního řádu (<c1/>) se přesně vyruší — ověřeno proti nezávislé fyzice <c2/> v enginu pro rozsah hodnot TEC (total electron content, celkový obsah elektronů). Zesílení šumu pro vstupy se stejným rozptylem je <c3/>.

seg-e111fb05a7c6 = <b>V repozitáři, automatizovaně</b> (při každém commitu): K-faktory proti jejich distribučním definicím, <c1/> a koeficienty kombinace bez vlivu ionosféry (IF) proti frekvencím IS-GPS-705 (IS: Interface Specification), zrušení ionosféry prvního řádu proti nezávislé fyzice zpoždění a ochranné úrovně váženými nejmenšími čtverci (WLS) proti referenční geometrii numpy <c2/> (<c3/>).

seg-f30d84abe275 = <b>Externí orákulum, automatizovaně</b> (<c1/>): při dané elevaci, azimutu a celkovém 1-σ každé družice <c2/> reprodukuje HPL nezávislé implementace, <c3/> ve větvi RTKLIB (open-source knihovna pro kinematické určování polohy v reálném čase) s ochrannými úrovněmi SBAS <c4/> (Siki & Takács { "2017" }), a to na šesti epochách, které tento nástroj spočítal ze <b>skutečných zpráv EGNOS (European Geostationary Navigation Overlay Service)</b> (geostacionární PRN (číslo pseudonáhodného kódu) { "120" }) a skutečných pozorování RINEX (Receiver Independent Exchange Format) ze stanice BUTE v Budapešti (2017-02-19), s přesností <b>< { "2e-3" } m</b>. Orákulum zaokrouhluje K_V na { "5.33" }, takže vertikála se porovnává bez K-faktoru, jako <c5/> proti jeho VPL / { "5.33" }. ESA (European Space Agency) gLAB { "v6.0.0" } (<c6/>) používá stejný vzorec.

seg-389e8a57e3e8 = <b>Nedoděláno</b>: σ jednotlivých družic pochází z orákula samotného; modelování σ ze surových zpráv UDRE/GIVE je mimo rozsah a žádný oficiální publikovaný produkt ochranných úrovní WAAS (Wide Area Augmentation System) ani EGNOS nebyl reprodukován od začátku do konce. Samotné DO-229E/DO-316 jsou u RTCA placené; otevřeným zdrojem odvození jsou stránky ESA Navipedia o SBAS ICAO/EGNOS (ICAO: International Civil Aviation Organization).

seg-7686fb3d3e0c = <s1>Předchozí</s1>Reference ARAIM

seg-0457ef382fb0 = <s1>Další</s1>Převodník odolnosti
