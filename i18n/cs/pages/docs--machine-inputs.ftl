# docs--machine-inputs: translations (cs)

seg-e9650a618b38 = ID

seg-b9f561201fda = Zdroj: <c1/>

seg-536f71da4541 = Strojové a senzorové vstupy ({ "0.38" })

seg-1a91f96f22ab = Čtečky, které do druhu <c1/> přivádějí další přijímače, řešiče a senzory. Každá je pouze pro čtení: čisté funkce nad bajty nebo textem, které vracejí touž časovou osu jako čtečky UBX, RINEX, Android a NMEA, přičemž poškozené záznamy přeskakují a počítají místo selhání. Vše zde je MODELLED: formáty se čtou z veřejné dokumentace a žádný výsledek není ověřen proti vnějšímu orákulu nad rámec uvedeného.

seg-3176ffff1e44 = <b>Software pouze poradního charakteru.</b> Nejde o typově schválené navigační zařízení. Za bezpečnou navigaci plavidla zůstává odpovědný provozovatel.

seg-367ac9b4a8a6 = Co z klidového záznamu IMU vyčte `kshana imu-fit`, ze skutečného běhu enginu v{ $version } na vymyšleném záznamu ({ "20,000" } vzorků při { "100" } Hz, { "200" } s): náhodná procházka rychlosti akcelerometru q_va = { "4.02e-06" }, náhodná procházka úhlu gyroskopu q_arw = { "9e-08" }, nestabilita biasu { "0.00296" } a rané sklony Allanovy odchylky (-0,51 a -0,49; asi -0,5 tam, kde dominuje bílý šum). Tabulka vedle je TOML, který příkaz vypíše. Odhadovač je ověřen pouze na syntetických záznamech. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

seg-3ba911ed9541 = Soubor řešení, který zapisují <c1/> z RTKLIB a RTKPOST. Čte se: čas (kalendářní <c2/> nebo týden GPS a sekundy týdne), poloha (zeměpisná šířka a délka ve stupních s výškou, nebo ECEF X/Y/Z převedené na geodetické) a počet družic. Časová stupnice v záhlaví sloupce (<c3/>, <c4/>, <c5/>) se přenáší v popisku. Soubory ve stupních, minutách a sekundách se odmítají. Řádky začínající <c6/> jsou záhlaví.

seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

seg-b73d1465ed67 = Záznamy ASCII (<c1/>) i binární (záhlaví <c2/>), libovolně smíšené. Rozvržení se řídí veřejnou dokumentací OEM7 (docs.novatel.com): záhlaví zpráv, 32bitové CRC a tabulky polí tří záznamů. Záznamy, jejichž CRC nesouhlasí, se přeskakují a počítají.

seg-078e047b9f82 = Záznam

seg-5b59f661e68b = Použito

seg-286c3fb8ac5c = stav řešení (pouze <c1/> dává fix), zeměpisná šířka, délka, výška nad střední hladinou moře plus undulace (výška fixu je elipsoidická), použité družice

seg-3edaffed5d65 = C/No pro každý signál (dB-Hz); systém z bitů stavu sledování 16-18, typ signálu z bitů 21-25

seg-5663c6812797 = bit { "15" } stavu přijímače (detekováno rušení) se stává položkou <c1/> dané epochy (rušení { "2" } označeno, { "1" } ne; RXSTATUS nemá příznak spoofingu), porovnává se s poplachy { -brand } pomocí <c2/>; pomocné bity rušení { "1" } (RF1-RF6) se vracejí v <c3/>

seg-61d8ec169a17 = Rutina CRC byla ověřena proti CRC, které dokumentace uvádí pro vlastní příklad <c1/> (citováno, nikoli převzato doslovně); testy používají vlastnoručně napsané řádky. Nečteno: zkrácený ASCII, další záznamy. Příznak rušení je vlastní hlášení přijímače, nikoli zjištění { -brand }; shoda s monitory { -brand } není validace.

seg-b6c3919c87ad = GNSS-SDR (<c1/>)

seg-0cc992f8d61b = Viz <a1><c1/></a1>. Výstupy GNSS-SDR ve formátech NMEA a RINEX se již čtou pomocí <c2/> a <c3/>; proudy UDP Monitor a PVT-monitor (Protocol Buffers) převádí <c4/> na řádky JSON a čte je <c5/>.

seg-cf1bf4944f6a = IMU (<c1/>)

seg-ab64a0754907 = <c1/>: řádek záhlaví s názvy sloupců, poté jeden vzorek na řádek. Sloupce (v libovolném pořadí, názvy bez ohledu na velikost písmen): <c2/> sekundy na hodinách záznamu přijímače, <c3/>, <c4/>, <c5/> úhlová rychlost v rad/s, <c6/>, <c7/>, <c8/> měrná síla v m/s². <c9/>: rozvržení EuRoC MAV <c10/> <c11/> (<c12/>, <c13/>, <c14/>); první vzorek je <c15/>. Řádky, které nelze zpracovat, a řádky, jejichž čas neroste, se přeskakují. Jak se používá směr gyroskopu, viz <a1><c16/></a1>.

seg-f7007cf35f53 = IMU ve scénářích hybrid a fusion (<c1/>)

seg-3fc254763f67 = Scénáře <c1/> a <c2/> (UKF o 17 stavech) jsou simulace: berou parametry šumu senzoru (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), nikoli změřenou řadu. <c10/> tyto parametry vyčte z klidového záznamu IMU, takže lze scénář spustit se senzorem, který skutečně máte:

seg-86efab73b2e6 = Metoda: překrývající se Allanova odchylka integrovaného signálu (<c1/>): <c2/>, totéž pro gyroskop osy z (<c3/>), <c4/> a <c5/> jako průměry a <c6/> jako minimum křivky, pokud za ním křivka stoupá. <c7/> se nefituje (vyžaduje záznam mnohem delší než dolní mez). Zpráva uvádí rychlost a rozsah záznamu a raný sklon Allanovy odchylky každého kanálu (asi -0,5 tam, kde dominuje bílý šum); záznam, který není klidový, je příliš krátký (pod { "2000" } vzorků) nebo nerovnoměrně vzorkovaný, se odmítne nebo dá parametry, které sklony označí. Původ tabulky uvádí SHA-256 záznamu. MODELLED: odhadovač je ověřen na syntetických záznamech bílého šumu se známými koeficienty (obnoveno v mezích { "10" } %), nikoli proti vnějšímu orákulu. K dispozici v CLI, Pythonu (<c8/>), WebAssembly (<c9/>), MCP (<c10/>) a v pluginu (<c11/>).

seg-b3c592f63798 = RTCM { "3" } MSM4 a MSM7 (<c1/>)

seg-0f8b986cff40 = Tok bajtů rámců RTCM { "3" } (výstup pozorování základnové stanice nebo přijímače). Čte se: zprávy MSM4 a MSM7 (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): epocha a poměr nosné k šumu každé signálové buňky (MSM4: { "6" } bitů, dB-Hz; MSM7: { "10" } bitů, 1/16 dB-Hz), což je to, co monitory C/N0 potřebují. Pole pseudovzdálenosti a fáze se přeskakují a nepoužívají, takže RTCM dává monitorům důvěry C/N0 a nic jiného; v MSM není žádná poloha. Rámce se špatným CRC-24Q se přeskakují a počítají.

seg-d70038a737dc = <b>Odkud rozvržení pochází.</b> Ne ze standardu RTCM (placený dokument, nebyl konzultován): z open-source dekodéru pyrtcm { "1.2.0" }, BSD 3-Clause, jehož licence a upozornění jsou v <c1/> (rozhodnutí vlastníka z { "18" } Oct { "2026" }: „use open decoders“). pyrtcm uvádí, že jeho tabulky vycházejí z RTCM { "10403.3" }; { -brand } se opírá o zveřejněné tabulky pod licencí pyrtcm a o standardu nic netvrdí. Čas: MSM nenese týden, takže popisky se čtou <c2/>; epochy GLONASS (moskevský čas) se převádějí na čas GPS pomocí GPS-UTC = { "18" } s (hodnota od 2017-01-01).

seg-ee04a86f8f00 = Ověřeno proti: kontrolní hodnotě z katalogu CRC-24Q (<c1/> dává <c2/>) a jednorázově během vývoje proti vlastnímu dekodéru pyrtcm na týchž vlastnoručně napsaných rámcích (stejné C/N0). Testovací data jsou vlastnoručně napsaná; žádný záznam nebyl pořízen z reálného přijímače, takže čtečka je MODELLED, dokud jej nepřečte.

seg-94f0e4db92df = <s1>Předchozí</s1>Jammertest jako rozhodčí

seg-8d660b4049e4 = <s1>Další</s1>Čtené protokoly přijímačů

seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

seg-b0b5f9a66eed = IMU ([log.imu])

seg-03a6e15dce0a = IMU ve scénářích hybrid a fusion (kshana imu-fit)

seg-53ce2c4ba434 = RTCM { "3" } MSM4 a MSM7 (format = "rtcm3")
