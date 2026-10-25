# docs--deployment-targets: translations (sv)

seg-9c1e7fd8f838 = Hur

seg-5ad814c7ef9e = Anteckningar

seg-9d3ee6a5613e = Körningar

seg-e8eefc84e748 = Källa: <c1/>

seg-3e1eb98b38df = Var Kshana körs, och var den inte gör det

seg-1a203c4736f1 = En omfattningsgräns, nedskriven så att ingen upptäcker den som ett åtagande på ett möte.

seg-d6c92d17a3dd = Förkortningar: CPU, central processing unit; GPU, graphics processing unit; NPU, neural processing unit; FPGA, field-programmable gate array; MCU, microcontroller unit; RTOS, real-time operating system; OPS-SAT, Europeiska rymdorganisationens satellit som programvarulaboratorium i omloppsbana; PyPI, Python Package Index; MCP, Model Context Protocol; AI, artificiell intelligens; JSON, JavaScript Object Notation.

seg-9376bb5b192e = Mål

seg-95e7da118089 = Arbetsstationer och servrar med Linux, macOS och Windows, x86-64 och 64-bitars ARM

seg-b6ef382a73ef = binären <c1/>, eller Rust-craten

seg-b8af20715cea = binärer för utgåvor till Linux x86-64, macOS (Apple silicon och Intel) och Windows x86-64; på övriga mål bygger <c1/> den

seg-3dc7d08f5729 = Python { "3.9" } eller senare

seg-b1f1009faa44 = hjulet <c1/> på PyPI (<c2/>)

seg-45b4e1bd8b18 = hjul för Linux, macOS och Windows, x86-64 och 64-bitars ARM

seg-79f04380d254 = MCP-klienter (AI-agenter)

seg-4163955ed77a = servern <c1/>: <c2/>, eller containeravbilden

seg-c5a32580b7bc = avbild för linux/amd64 och linux/arm64

seg-ec575e06d439 = Webbläsare och JavaScript-körmiljöer

seg-a8238abc55bd = WebAssembly-paketet på npm (<c1/>)

seg-c7789c7f4429 = samma motor, kompilerad till WebAssembly

seg-488c2b62d246 = En liten dator på en båt, bredvid mottagaren

seg-69a58e13b706 = referensbygget i <c1/>: <c2/> med grindfunktionen, som publicerar till Signal K och, som tillval, till OpenCPN

seg-df530583c13c = rådgivande, inte typgodkänd navigationsutrustning; inte testad på ett fartyg av projektet; se <a1><c1/></a1>

seg-cf83dbb55f99 = Signal K-servrar

seg-88ddbefb95dd = tillägget i <c1/>

seg-5f436c952149 = levererat och enhetstestat på inspelade syntetiska utdata; inte publicerat på npm

seg-06ff6eed7e99 = OpenCPN

seg-026115eafe9b = NMEA { "0183" } i grindläge över TCP från övervakaren

seg-8e101a661cbc = som tillval; se <a1><c1/></a1>

seg-cea294c412f0 = Nyttolastdatorer av Linux-klass

seg-bf74da1c1262 = Rust-craten eller binären, korskompilerad

seg-868f121e5909 = Nyttolastdatorer av OPS-SAT-klass och liknande

seg-53c8be810679 = Edge-noder med GPU, NPU eller FPGA bredvid en Linux-CPU

seg-70b2c22bf453 = på Linux-CPU:n

seg-977842cb0f86 = Kshana använder inga av acceleratorerna; den körs bredvid dem

seg-3e15446b6efb = Körs inte

seg-205144220741 = <b>En flygmikrokontroller utan operativsystem eller ett litet RTOS utan Rusts standardbibliotek.</b> Kshana är genomgående en <c1/>-crate: den allokerar på heapen, läser filer, formaterar JSON och använder standardbibliotekets flyttalsfunktioner. Det finns inget bygge för <c2/> och ingen funktion som skapar ett.

seg-46ccad7b96e8 = <b>Beslut: vi erbjuder ingen flygkärna för <c1/>.</b> Att bygga en skulle vara en separat produkt med sin egen verifieringsbörda, och det skulle föra in Kshana i flygprogramvara, där kvalificering är ett eget program som vi inte har någon väg igenom.

seg-63bc696bc66a = Vad du kan göra i stället

seg-07fff123aed3 = <b>Kör Kshana på marken eller på en nyttolastdator och ladda upp dess resultat.</b> Sorten <c1/> producerar exakt de siffror som en flygdator behöver: en kadens för positionsbestämning, en överskridandetid, ett skydd. En tabell med dem är några få bytes.

seg-c2752c281cd3 = <b>Portera en sluten form, om det är allt som behövs.</b> Inversionen för holdover är en kort monoton rotsökning över en polynomvarians, dokumenterad med sina ekvationer i <a1><c1/></a1>. Att återimplementera den i flygkod är enkelt; kod som härletts från Kshana förblir under Kshanas licens.

seg-b484e9426ab0 = Också utanför omfattningen

seg-7bcd90c9ef31 = Hårda realtidsgarantier (Kshana allokerar och gör inget påstående om längsta exekveringstid); flygkvalificering av något; och ett synkroniseringsprotokoll, en regulator eller en routingstack. Kshana levererar det tidsbelägg som dessa system utformas mot. Den är inte ett av dem.

seg-542e51fbb35a = <s1>Föregående</s1>JetBrains-tillägg

seg-52a455f4c409 = <s1>Nästa</s1>Arkitektur
