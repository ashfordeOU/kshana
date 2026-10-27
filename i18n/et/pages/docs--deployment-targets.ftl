# docs--deployment-targets: translations (et)

# text
seg-9c1e7fd8f838 = Kuidas

# text
seg-5ad814c7ef9e = Märkused

# attr:aria-label, text
seg-9d3ee6a5613e = Käivitused

# text
# c1: docs/DEPLOYMENT-TARGETS.md
seg-e8eefc84e748 = Allikas: <c1/>

# text
seg-3e1eb98b38df = Kus Kshana töötab ja kus mitte

# text
seg-1a203c4736f1 = Ulatuse piir, kirja pandud, et keegi ei avastaks seda kohustusena koosolekul.

# text
seg-d6c92d17a3dd = Lühendid: CPU, keskprotsessor; GPU, graafikaprotsessor; NPU, neuroprotsessor; FPGA, väljal programmeeritav loogikamaatriks; MCU, mikrokontroller; RTOS, reaalajas operatsioonisüsteem; OPS-SAT, Euroopa Kosmoseagentuuri orbiidil tarkvaralabori satelliit; PyPI, Python Package Index; MCP, Model Context Protocol; AI, tehisintellekt; JSON, JavaScript Object Notation.

# text
seg-9376bb5b192e = Sihtmärk

# text
seg-95e7da118089 = Linuxi, macOS-i ja Windowsi tööjaamad ja serverid, x86-64 ja 64-bitine ARM

# text
# c1: kshana
seg-b6ef382a73ef = binaarfail <c1/> või Rusti crate

# text
# c1: cargo install kshana
seg-b8af20715cea = väljalaskebinaarid Linuxi x86-64, macOS-i (Apple silicon ja Intel) ja Windowsi x86-64 jaoks; teistel sihtmärkidel ehitab selle <c1/>

# text
seg-3dc7d08f5729 = Python { "3.9" } või uuem

# text
# c1: kshana
# c2: --features python
seg-b1f1009faa44 = PyPI-s olev <c1/> wheel (<c2/>)

# text
seg-45b4e1bd8b18 = wheel-paketid Linuxile, macOS-ile ja Windowsile, x86-64 ja 64-bitine ARM

# text
seg-79f04380d254 = MCP kliendid (tehisintellekti agendid)

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
seg-4163955ed77a = server <c1/>: <c2/> või konteinerikujutis

# text
seg-c5a32580b7bc = kujutis platvormidele linux/amd64 ja linux/arm64

# text
seg-ec575e06d439 = Brauserid ja JavaScripti käituskeskkonnad

# text
# c1: --features wasm
seg-a8238abc55bd = npm-is olev WebAssembly pakett (<c1/>)

# text
seg-c7789c7f4429 = sama mootor, kompileeritud WebAssembly'ks

# text
seg-488c2b62d246 = Väike arvuti paadis vastuvõtja kõrval

# text
# c1: deploy/reference-build/
# c2: kshana receiver-trust live
seg-69a58e13b706 = viiteversioon kataloogis <c1/>: <c2/> koos väravaga, mis avaldab andmed Signal K-sse ja valikuliselt OpenCPN-i

# text
# c1: MARINE-INTEGRATIONS.md
seg-df530583c13c = nõuandev, mitte tüübikinnitust omav navigatsiooniseade; projekt pole seda laeval katsetanud; vt <a1><c1/></a1>

# text
seg-cf83dbb55f99 = Signal K serverid

# text
# c1: integrations/signalk/
seg-88ddbefb95dd = plugin kataloogis <c1/>

# text
seg-5f436c952149 = tarnitud ja ühiktestitud salvestatud sünteetilise väljundiga; npm-is avaldamata

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-026115eafe9b = väravarežiimis NMEA { "0183" } üle TCP monitorilt

# text
# c1: MARINE-INTEGRATIONS.md
seg-8e101a661cbc = valikuline; vt <a1><c1/></a1>

# text
seg-cea294c412f0 = Linuxi-klassi kasulikkoormuse arvutid

# text
seg-bf74da1c1262 = Rusti crate või binaarfail, ristkompileeritud

# text
seg-868f121e5909 = OPS-SAT-klassi kasulikkoormuse arvutid ja sarnased

# text
seg-53c8be810679 = Servasõlmed, millel on GPU, NPU või FPGA Linuxi CPU kõrval

# text
seg-70b2c22bf453 = Linuxi CPU-l

# text
seg-977842cb0f86 = Kshana ei kasuta ühtegi kiirendit; see töötab nende kõrval

# text
seg-3e15446b6efb = Ei tööta

# text
# c1: std
# c2: no_std
seg-205144220741 = <b>Paljasmetall-lennu-MCU või väike RTOS ilma Rusti standardraamatukoguta.</b> Kshana on läbivalt <c1/> crate: see eraldab mälu kuhjal, loeb faile, vormindab JSON-i ja kasutab standardraamatukogu ujukomafunktsioone. <c2/> versiooni ega funktsiooni, mis seda annaks, pole olemas.

# text
# c1: no_std
seg-46ccad7b96e8 = <b>Otsus: me ei paku <c1/> lennutuuma.</b> Selle ehitamine oleks eraldi toode oma kontrollikoormusega ja viiks Kshana lennutarkvarasse, kus kvalifitseerimine on omaette programm, millele meil teed pole.

# text
seg-63bc696bc66a = Mida teha selle asemel

# text
# c1: slot-timing
seg-07fff123aed3 = <b>Käivitage Kshana maapinnal või kasulikkoormuse arvutis ja laadige selle tulemused üles.</b> Stsenaariumi liik <c1/> annab täpselt need arvud, mida lennuarvuti vajab: fikseerimissagedus, rikkumise aeg, kaitseintervall. Nende tabel on mõne baidi suurune.

# text
# c1: SLOT-TIMING.md
seg-c2752c281cd3 = <b>Portige suletud kuju, kui vaja on ainult seda.</b> Holdover-i pööramine on lühike monotoonne juurteleidmine polünoomse dispersiooni üle, dokumenteeritud võrranditega failis <a1><c1/></a1>. Selle taasimplementeerimine lennukoodis on lihtne; Kshanast tuletatud kood jääb Kshana litsentsi alla.

# text
seg-b484e9426ab0 = Samuti väljaspool ulatust

# text
seg-7bcd90c9ef31 = Ranged reaalajanõuete garantiid (Kshana eraldab mälu ega esita halvima täitmisaja väidet); mis tahes asja lennukvalifitseerimine; ning sünkroniseerimisprotokoll, kontroller või marsruutimiskeskkond. Kshana annab ajastustõendid, mille vastu need süsteemid on kavandatud. See ei ole üks neist.

# text
seg-542e51fbb35a = <s1>Eelmine</s1>JetBrainsi plugin

# text
seg-52a455f4c409 = <s1>Järgmine</s1>Arhitektuur
