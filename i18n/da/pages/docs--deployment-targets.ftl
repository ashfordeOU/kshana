# docs--deployment-targets: translations (da)

seg-9c1e7fd8f838 = Sådan

seg-5ad814c7ef9e = Noter

seg-9d3ee6a5613e = Kørsler

seg-e8eefc84e748 = Kilde: <c1/>

seg-3e1eb98b38df = Hvor Kshana kører, og hvor den ikke gør

seg-1a203c4736f1 = En afgrænsning af omfang, skrevet ned, så ingen opdager den som en forpligtelse i et møde.

seg-d6c92d17a3dd = Forkortelser: CPU, central processing unit; GPU, graphics processing unit; NPU, neural processing unit; FPGA, field-programmable gate array; MCU, microcontroller unit; RTOS, real-time operating system; OPS-SAT, Den Europæiske Rumorganisations satellit med softwarelaboratorium i kredsløb; PyPI, Python Package Index; MCP, Model Context Protocol; AI, kunstig intelligens; JSON, JavaScript Object Notation.

seg-9376bb5b192e = Mål

seg-95e7da118089 = Linux-, macOS- og Windows-arbejdsstationer og -servere, x86-64 og 64-bit ARM

seg-b6ef382a73ef = programmet <c1/> eller Rust-craten

seg-b8af20715cea = release-binærer til Linux x86-64, macOS (Apple silicon og Intel) og Windows x86-64; på de øvrige mål bygger <c1/> den

seg-3dc7d08f5729 = Python { "3.9" } eller nyere

seg-b1f1009faa44 = hjulet <c1/> på PyPI (<c2/>)

seg-45b4e1bd8b18 = hjul til Linux, macOS og Windows, x86-64 og 64-bit ARM

seg-79f04380d254 = MCP-klienter (AI-agenter)

seg-4163955ed77a = serveren <c1/>: <c2/> eller containerbilledet

seg-c5a32580b7bc = billede til linux/amd64 og linux/arm64

seg-ec575e06d439 = Browsere og JavaScript-runtimes

seg-a8238abc55bd = WebAssembly-pakken på npm (<c1/>)

seg-c7789c7f4429 = den samme motor, kompileret til WebAssembly

seg-488c2b62d246 = En lille computer på en båd, ved siden af modtageren

seg-69a58e13b706 = referencebuildet i <c1/>: <c2/> med gaten, der publicerer til Signal K og, efter tilvalg, til OpenCPN

seg-df530583c13c = vejledende, ikke typegodkendt navigationsudstyr; ikke testet på et fartøj af projektet; se <a1><c1/></a1>

seg-cf83dbb55f99 = Signal K-servere

seg-88ddbefb95dd = pluginet i <c1/>

seg-5f436c952149 = leveret og enhedstestet på optaget syntetisk output; ikke publiceret på npm

seg-06ff6eed7e99 = OpenCPN

seg-026115eafe9b = NMEA { "0183" } i gate-tilstand over TCP fra monitoren

seg-8e101a661cbc = efter tilvalg; se <a1><c1/></a1>

seg-cea294c412f0 = Nyttelastcomputere af Linux-klassen

seg-bf74da1c1262 = Rust-craten eller binæren, krydskompileret

seg-868f121e5909 = Nyttelastcomputere af OPS-SAT-klassen og lignende

seg-53c8be810679 = Edge-noder med en GPU, NPU eller FPGA ved siden af en Linux-CPU

seg-70b2c22bf453 = på Linux-CPU'en

seg-977842cb0f86 = Kshana bruger ingen af acceleratorerne; den kører ved siden af dem

seg-3e15446b6efb = Kører ikke

seg-205144220741 = <b>En bare-metal-flyve-MCU eller en lille RTOS uden Rusts standardbibliotek.</b> Kshana er gennemgående en <c1/>-crate: den allokerer på heapen, læser filer, formaterer JSON og bruger standardbibliotekets flydendetalsfunktioner. Der findes intet <c2/>-build og ingen feature, der frembringer et.

seg-46ccad7b96e8 = <b>Beslutning: vi tilbyder ikke en <c1/>-flyvekerne.</b> At bygge en ville være et separat produkt med sin egen verifikationsbyrde, og det ville placere Kshana i flyvesoftware, hvor kvalificering er et program for sig, som vi ikke har nogen vej igennem.

seg-63bc696bc66a = Hvad du kan gøre i stedet

seg-07fff123aed3 = <b>Kør Kshana på jorden eller på en nyttelastcomputer, og upload dens resultater.</b> Typen <c1/> producerer præcis de tal, en flyvecomputer har brug for: en kadence for positionsbestemmelse, et brudtidspunkt, en garde. En tabel med dem fylder få bytes.

seg-c2752c281cd3 = <b>Port en lukket form, hvis det er alt, der er brug for.</b> Holdover-inversionen er en kort monoton rodsøgning over en polynomiel varians, dokumenteret med sine ligninger i <a1><c1/></a1>. At genimplementere den i flyvekode er ligetil; kode afledt af Kshana forbliver under Kshanas licens.

seg-b484e9426ab0 = Også udenfor omfanget

seg-7bcd90c9ef31 = Hård realtidsgaranti (Kshana allokerer og fremsætter ikke noget krav om værste-tilfælde-udførelsestid); flyvekvalificering af noget som helst; og en synkroniseringsprotokol, en regulator eller en routingstak. Kshana leverer den tidsevidens, som disse systemer designes imod. Den er ikke et af dem.

seg-542e51fbb35a = <s1>Forrige</s1>JetBrains-plugin

seg-52a455f4c409 = <s1>Næste</s1>Arkitektur
