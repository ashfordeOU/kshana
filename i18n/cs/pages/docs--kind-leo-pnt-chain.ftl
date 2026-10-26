# docs--kind-leo-pnt-chain: translations (cs)

seg-f42465f7d066 = ns

seg-cd04f5662884 = MODELLED. (katalog druhů (<c1/>))

seg-7f5ad6ab8c23 = GPS

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-49964654d5f4 = Druh scénáře enginu v{ $version }, rodina <a1>Navigace z nízké oběžné dráhy Země</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-c5478f572d21 = Stránka rodiny: <a1>Navigace z nízké oběžné dráhy Země</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 oddíl { "2.4.1" } kroky { "3" } až { "9" } (referenční sigma z N_wet, efektivní délka dráhy, činitel středování antény, hloubka úniku pro { "0.01" } % až { "50" } % času. Orákulum (ExternalDataset): Validační příklady ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) pro scintilaci P.618-14, s hodnotou N_wet podle P.453-14 pro každé místo z týchž příkladů; zapsáno v tests/fixtures/leo_link/p618_14_scintillation.csv s URL a datem stažení. Výraz pro vlhkostní refraktivitu z teploty a vlhkosti tento řádek nepokrývá

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Skupinové zpoždění { "40.3" } STEC/f^{ "2" } pro každé pásmo; bezionosférické koeficienty f1^2/(f1^{ "2" } - f2^{ "2" }) a -f2^2/(f1^{ "2" } - f2^{ "2" }) a zesílení šumu sqrt(a1^{ "2" } s1^{ "2" } + a2^. Orákulum (ExternalDataset): IS-GPS-200 oddíl { "20.3.3.3.3.2" }, který uvádí poměr skupinového zpoždění L1/L2 gamma = (77/60)^{ "2" } plynoucí ze škálování prvního řádu 1/f^{ "2" }, a Friisův přenosový vzorec (Proc. IRE, { "1946" }). Ověřuje zákony škálování, nikoli šikmý TEC

seg-ae15d15bf151 = Tematická stránka: <a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = Zdroj: <c1/>

seg-3a66efa79aa2 = <c1/> (druh scénáře)

seg-81d1604171a5 = Jeden systém LEO-PNT (určování polohy, navigace a času z nízké oběžné dráhy Země) od začátku do konce, pro libovolnou konstelaci a signál: návrh leo-signal pojmenovaný v signal_design (veřejná předvolba nebo vložený návrh [signal]) určuje střed, šířku pásma, čipovou rychlost a rozdělení EIRP pásma [pass], rozpočet spoje leo-pass dává sledované C/N0 a pásmově omezený kódový jitter během přeletu, přímka C/N0 v sin(elevace) a vysílané SISRE zprávy [navmsg] (proložené ve výšce družice přeletu) vstupují do každého systému LEO ve společném určení polohy leo-pvt v [fusion] a volitelně do případů leo-ppp v [ppp]; každé předání je uvedeno s hodnotou a jednotkou. MODELLED.

seg-9dec9cd6fbfc = Jeden běh <c1/> se shrnuje takto: LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

seg-21babf07292a = Povinná pole: <c1/>, <c2/>, <c3/>

seg-f7bd59312f9b = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-585a1b0d5950 = Příklad <c1/> mimo jiné nastavuje:

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = Štítek výsledku (enginu): MODELLED — řetězec předává výstup každé fáze další; fáze si ponechávají vlastní štítky (řádky leo-signal, leo-pass, leo-navmsg, leo-pvt a leo-ppp ve verifikační matici).

seg-abe0599498c9 = Graf, který engine zapisuje pro scenarios/leo-pnt-end-to-end.toml, druh leo-pnt-chain

seg-d8b7c2c82566 = <b>MODELLED</b> Druh <c1/>: návrh leo-signal (veřejná předvolba nebo vložený) určuje střed, šířku pásma, čipovou rychlost a rozdělení EIRP pásma leo-pass; přelet dává pro každou epochu C/N0 sledované složky a pásmově omezený kódový jitter; metodou nejmenších čtverců C/ Testy: <a1>leo_pnt_chain.rs</a1>.

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sinový integrál (sine_integral), podíl výkonu BPSK-R uvnitř oboustranného pásma v uzavřeném tvaru (bpsk_power_in_band_closed_form), pásmově. Orákulum (ExternalDataset): Externě zafixováno: { "90.3" } procenta výkonu hlavního laloku, koherentní jitter early-late ve stanoveném pracovním bodě, tabulkové hodnoty sinového integrálu a koeficient spektrální separace BPSK se sebou samým 2/({ "3" } R_c) při nulovém posunu. Pouze vnitřní křížové kontroly, nikoli externí validace: uzavřený tvar Gaborovy šířky pásma pásmově omezeného BPSK a jeho asymptota a koeficient spektrální separace BPSK s posunem při nenulových posunech, oba

seg-faf2775f3003 = <b>MODELLED</b> Druh <c1/>: parametrizované návrhy signálu (pásmo, vysílací šířka pásma, přidělení ITU; složky pro akvizici, data a pilot s BPSK(n), BOC(m,n), MB. Orákulum (InternalConsistency): Uzavřené tvary ověřené proti nezávislé vnější referenci z obou řádků výše, identita falešného poplachu pro kvadratický detektor P_d(snr = { "0" }) = P_fa a Holmesův střední čas akvizice a redukce na vlastní řetězec SSC druhu spectrum (tentýž kód Jammer::ssc). Samotné návrhy jsou vstupy: předvolby označené REPRESENTATIVE nebo WORKSHOP nejsou publikované specifikace, spektra vylepšeného Feherova QPSK, klíčování posunem kódu a OFDM jsou aproximována a tvar

seg-752b6d88fc9c = Fáze určení polohy modeluje C/N0 jako přímku v sinu elevace mezi maskou a zenitem; řetězec tuto přímku proloží sledovaným C/N0 přeletu, takže tvar specifický pro přelet (isoflux plató, okraj svazku) se zredukuje na dvě čísla. (výsledek <c1/>)

seg-f609a2991c7f = SISRE předané fázím určení polohy je chyba reprezentace navigační zprávy oproti pravdivé dráze integrované Kshanou plus uvedené od_sisre_m ve scénáři jako druhá odmocnina součtu čtverců; fáze zprávy sama žádné určení ani předpověď dráhy nemodeluje. (výsledek <c1/>)

seg-f75f874cdfaa = Fáze určení polohy počítá vlastní jitter smyčky zpožděného závěsu z předaného C/N0 vzorcem pro neomezenou šířku pásma; přelet vedle něj hlásí pásmově omezený jitter skutečného návrhu. (výsledek <c1/>)

seg-174ce18ade58 = Fáze přesného určení polohy z jednoho bodu (PPP) bere SISRE zprávy jako chybu dráhy a hodin LEO; její kódový a fázový šum zůstávají vlastními vstupy fáze. (výsledek <c1/>)

seg-0aaff940eacb = Jedna družice, první, jejíž pásmo návrh nese, zastupuje celý systém LEO ve fázích přeletu a zprávy. (výsledek <c1/>)

seg-65930be43134 = MODELLED — řetězec předává výstup každé fáze další; fáze si ponechávají vlastní štítky (řádky leo-signal, leo-pass, leo-navmsg, leo-pvt a leo-ppp ve verifikační matici). (výsledek <c1/>)

seg-bf452e9ae07f = MODELLED: každá fáze si ponechává vlastní štítek; řetězec nepřidává žádnou fyziku. (komentář v souboru scénáře, řádek { "25" })

seg-0bff72185f12 = <s1>Předchozí</s1>leo-pass

seg-851e55b87d01 = <s1>Další</s1>leo-ppp
