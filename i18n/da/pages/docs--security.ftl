# docs--security: translations (da)

seg-4609cf7fb790 = Sikkerhedspolitik

seg-ff991a587e4b = Kilde: <c1/>

seg-7315b27c34f8 = Indberetning af en sårbarhed

seg-2f06a8b277b7 = Indberet den privat, ad en af to veje:

seg-31999fe1b838 = <b>GitHubs private indberetning af sårbarheder</b> — knappen <em>Report a vulnerability</em> på repositoryets <a1>Security-fane</a1>. Indberetningen er kun synlig for vedligeholderne, og en rettelse kan forberedes i en privat fork og udgives som en GitHub Security Advisory.

seg-7bdcc2ffe39e = <b>E-mail</b> — <b><a1>contact@ashforde.org</a1></b>, med detaljer og trin til at reproducere.

seg-fbc3db22c061 = Åbn venligst ikke en offentlig issue for sikkerhedsfølsomme indberetninger. Vi tilstræber at bekræfte modtagelsen inden for nogle få hverdage.

seg-4c11dabdd8f6 = Understøttede versioner

seg-19c99cf3a67e = Før 1.0: kun den seneste mærkede udgivelse understøttes.

seg-1379eab9a8e3 = Hukommelsessikkerhed

seg-cf966fa35408 = Biblioteks-cratet erklærer <c1/> i sin crate-rod (<c2/>), så en <c3/>-blok, fn, impl eller extern et vilkårligt sted i biblioteket er en kompileringsfejl og ikke noget, en gennemgang skal fange. Attributten ligger ikke bag en <c4/>, så den gælder for hver konfiguration, biblioteket udleveres i, og alle tre kompilerer rent under den: standard-Rust-buildet, Python-udvidelsesmodulet (<c5/>) og WebAssembly-modulet (<c6/>).

seg-3f9e707e7d0b = Rækkevidden, angivet præcist, fordi <c1/> gælder for hvert crate:

seg-e7e22e711c53 = Den omfatter kun biblioteks-cratet. CLI-binærfilen (<c1/>), hjælpebinærfilerne under <c2/>, det separat udgivne crate <c3/> og de crates til krydsvalidering i <c4/>, der er udeladt fra workspace, er separate crate-rødder og er ikke dækket af den. Ingen af dem indeholder i dag <c5/>, men det er disciplin, ikke en egenskab, som compileren håndhæver.

seg-b8f1e374d873 = Den siger intet om afhængigheder. Dem kontrollerer <c1/> i CI separat — for rod-cratet og, som et selvstændigt job, for MCP-server-cratet, der er udeladt fra workspace — og de overvåges af Dependabot-alarmer og sikkerhedsopdateringer på repositoryet.

seg-df3008a05522 = Note om eksportkontrol / dobbelt anvendelse

seg-0782e60d11fa = PNT-resiliens og kvantesensorik kan høre under eksportkontrol for varer med dobbelt anvendelse. Dette offentlige repository er begrænset til generiske, offentliggjorte modeller og metoder. Bidrag ikke med eksportfølsomme detaljer om resiliens eller anti-spoofing her; det hører hjemme i et privat overlay. Er du i tvivl, så send først en e-mail.

seg-f6bb0582f6f2 = <s1>Forrige</s1>Licensering

seg-834cbd4e96d3 = <s1>Næste</s1>Bidrag
