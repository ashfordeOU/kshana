# docs--security: translations (et)

# text
seg-4609cf7fb790 = Turvapoliitika

# text
# c1: SECURITY.md
seg-ff991a587e4b = Allikas: <c1/>

# text
seg-7315b27c34f8 = Haavatavusest teatamine

# text
seg-2f06a8b277b7 = Teata sellest privaatselt, kummagi tee kaudu:

# text
seg-31999fe1b838 = <b>GitHubi privaatne haavatavusest teatamine</b> — nupp <em>Report a vulnerability</em> hoidla <a1>Security-vahekaardil</a1>. Aruanne on nähtav ainult hooldajatele ning parandus võib valmida privaatses forkis ja avaldatakse GitHub Security Advisory'na.

# text
seg-7bdcc2ffe39e = <b>E-post</b> — <b><a1>contact@ashforde.org</a1></b>, koos üksikasjade ja reprodutseerimise sammudega.

# text
seg-fbc3db22c061 = Turvatundlike teadete puhul ei tohi avalikku issue'd avada. Eesmärk on kinnitada kättesaamine mõne tööpäeva jooksul.

# text
seg-4c11dabdd8f6 = Toetatud versioonid

# text
seg-19c99cf3a67e = Enne 1.0: toetatud on ainult viimane sildistatud väljalase.

# text
seg-1379eab9a8e3 = Mälu turvalisus

# text
# c1: #![forbid(unsafe_code)]
# c2: src/lib.rs
# c3: unsafe
# c4: cfg
# c5: --features python
# c6: --features wasm
seg-cf966fa35408 = Teegi crate deklareerib oma crate'i juures (<c2/>) atribuudi <c1/>, nii et <c3/> plokk, fn, impl või extern kõikjal teegis on kompileerimisviga, mitte midagi, mida ülevaataja peab tabama. Atribuut ei ole <c4/> taga, seega kehtib see igas konfiguratsioonis, milles teek tarnitakse, ja kõik kolm kompileeruvad selle all puhtalt: vaike-Rusti ehitus, Pythoni laiendusmoodul (<c5/>) ja WebAssembly moodul (<c6/>).

# text
# c1: forbid
seg-3f9e707e7d0b = Ulatus täpselt väljendatuna, sest <c1/> on crate'i põhine:

# text
# c1: src/main.rs
# c2: src/bin/
# c3: kshana-mcp
# c4: xval/
# c5: unsafe
seg-e7e22e711c53 = See reguleerib ainult teegi crate'i. CLI binaarfail (<c1/>), abibinaarid kataloogis <c2/>, eraldi avaldatud crate <c3/> ja töökoha alt välja jäetud ristvalideerimise crate'id <c4/> on eraldi crate'i juured ega kuulu selle alla. Ükski neist ei sisalda täna <c5/>, kuid see on distsipliin, mitte kompilaatori jõustatud omadus.

# text
# c1: cargo deny check advisories licenses bans sources
seg-b8f1e374d873 = See ei ütle midagi sõltuvuste kohta. Neid kontrollitakse eraldi käsuga <c1/> CI-s — juur-crate'i ja, eraldi tööna, töökoha alt välja jäetud MCP serveri crate'i puhul — ning neid jälgivad Dependabot alerts ja turvauuendused hoidlas.

# text
seg-df3008a05522 = Ekspordikontrolli / topeltkasutuse märkus

# text
seg-0782e60d11fa = PNT vastupidavus ja kvantandurdus võivad kuuluda topeltkasutusega kaupade ekspordikontrolli alla. See avalik hoidla piirdub üldiste, avaldatud mudelite ja meetoditega. Siia ei tohi panustada ekspordi suhtes tundlikke vastupidavuse ega spuufimisvastaseid üksikasju; need kuuluvad privaatsesse ülekattesse. Kahtluse korral tuleb esmalt kirjutada e-kiri.

# text
seg-f6bb0582f6f2 = <s1>Eelmine</s1>Litsentsimine

# text
seg-834cbd4e96d3 = <s1>Järgmine</s1>Panustamine
