# docs--deployment-targets: translations (cs)

seg-9c1e7fd8f838 = Jak

seg-5ad814c7ef9e = Poznámky

seg-9d3ee6a5613e = Běhy

seg-e8eefc84e748 = Zdroj: <c1/>

seg-3e1eb98b38df = Kde Kshana běží a kde ne

seg-1a203c4736f1 = Hranice rozsahu, zapsaná tak, aby ji nikdo neobjevil jako závazek na schůzce.

seg-d6c92d17a3dd = Zkratky: CPU, centrální procesorová jednotka; GPU, grafický procesor; NPU, neuronový procesor; FPGA, programovatelné hradlové pole; MCU, mikrokontrolér; RTOS, operační systém reálného času; OPS-SAT, softwarová laboratorní družice Evropské kosmické agentury na oběžné dráze; PyPI, Python Package Index; MCP, Model Context Protocol; AI, umělá inteligence; JSON, JavaScript Object Notation.

seg-9376bb5b192e = Cíl

seg-95e7da118089 = Pracovní stanice a servery s Linuxem, macOS a Windows, x86-64 a 64bitové ARM

seg-b6ef382a73ef = binárka <c1/> nebo crate pro Rust

seg-b8af20715cea = vydané binárky pro Linux x86-64, macOS (Apple silicon a Intel) a Windows x86-64; na ostatních cílech ji sestaví <c1/>

seg-3dc7d08f5729 = Python { "3.9" } nebo novější

seg-b1f1009faa44 = wheel <c1/> na PyPI (<c2/>)

seg-45b4e1bd8b18 = wheely pro Linux, macOS a Windows, x86-64 a 64bitové ARM

seg-79f04380d254 = Klienti MCP (agenti AI)

seg-4163955ed77a = server <c1/>: <c2/>, nebo obraz kontejneru

seg-c5a32580b7bc = obraz pro linux/amd64 a linux/arm64

seg-ec575e06d439 = Prohlížeče a běhová prostředí JavaScriptu

seg-a8238abc55bd = balíček WebAssembly na npm (<c1/>)

seg-c7789c7f4429 = tentýž engine zkompilovaný do WebAssembly

seg-488c2b62d246 = Malý počítač na lodi vedle přijímače

seg-69a58e13b706 = referenční sestavení v <c1/>: <c2/> s bránou, publikující do Signal K a volitelně do OpenCPN

seg-df530583c13c = pouze poradní charakter: nejde o typově schválené navigační zařízení; projekt jej netestoval na plavidle; viz <a1><c1/></a1>

seg-cf83dbb55f99 = Servery Signal K

seg-88ddbefb95dd = plugin v <c1/>

seg-5f436c952149 = dodáván a jednotkově testován na zaznamenaném syntetickém výstupu; nepublikován na npm

seg-06ff6eed7e99 = OpenCPN

seg-026115eafe9b = NMEA { "0183" } v režimu brány přes TCP z monitoru

seg-8e101a661cbc = volitelně; viz <a1><c1/></a1>

seg-cea294c412f0 = Palubní počítače třídy Linux

seg-bf74da1c1262 = crate pro Rust nebo binárka, křížově kompilovaná

seg-868f121e5909 = Palubní počítače třídy OPS-SAT a podobné

seg-53c8be810679 = Okrajové uzly s GPU, NPU nebo FPGA vedle procesoru Linux

seg-70b2c22bf453 = na procesoru Linux

seg-977842cb0f86 = Kshana nepoužívá žádný z akcelerátorů; běží vedle nich

seg-3e15446b6efb = Neběží

seg-205144220741 = <b>Letový MCU bez operačního systému nebo malý RTOS bez standardní knihovny Rustu.</b> Kshana je po celou dobu crate <c1/>: alokuje na haldě, čte soubory, formátuje JSON a používá funkce plovoucí řádové čárky ze standardní knihovny. Neexistuje žádné sestavení <c2/> ani žádná funkce, která by jej vytvářela.

seg-46ccad7b96e8 = <b>Rozhodnutí: letové jádro <c1/> nenabízíme.</b> Jeho vytvoření by byl samostatný produkt s vlastní zátěží ověřování a vneslo by Kshana do letového softwaru, kde je kvalifikace samostatným programem, k němuž nemáme žádnou cestu.

seg-63bc696bc66a = Co dělat místo toho

seg-07fff123aed3 = <b>Provozujte Kshana na zemi nebo na palubním počítači a nahrávejte její výsledky.</b> Druh <c1/> vytváří přesně ta čísla, která letový počítač potřebuje: kadenci určení polohy, čas překročení, ochranný interval. Tabulka s nimi zabere několik bajtů.

seg-c2752c281cd3 = <b>Přeneste uzavřený tvar, pokud je to vše, co je třeba.</b> Inverze holdoveru je krátké monotónní hledání kořene polynomiálního rozptylu, zdokumentované se svými rovnicemi v <a1><c1/></a1>. Jeho reimplementace v letovém kódu je přímočará; kód odvozený z Kshana zůstává pod licencí Kshana.

seg-b484e9426ab0 = Také mimo rozsah

seg-7bcd90c9ef31 = Záruky tvrdého reálného času (Kshana alokuje a netvrdí nic o době provádění v nejhorším případě); letová kvalifikace čehokoli; a synchronizační protokol, regulátor nebo směrovací zásobník. Kshana dodává časovací důkazy, proti nimž se tyto systémy navrhují. Není jedním z nich.

seg-542e51fbb35a = <s1>Předchozí</s1>Plugin JetBrains

seg-52a455f4c409 = <s1>Další</s1>Architektura
