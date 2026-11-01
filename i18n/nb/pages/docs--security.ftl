# docs--security: translations (nb)

seg-4609cf7fb790 = Sikkerhetspolicy

seg-ff991a587e4b = Kilde: <c1/>

seg-7315b27c34f8 = Melde fra om en sårbarhet

seg-2f06a8b277b7 = Meld fra privat, på en av to måter:

seg-31999fe1b838 = <b>Privat sårbarhetsrapportering på GitHub</b> — knappen <em>Report a vulnerability</em> på depotets <a1>Security-fane</a1>. Rapporten er bare synlig for vedlikeholderne, og en rettelse kan forberedes i en privat fork og publiseres som en GitHub Security Advisory.

seg-7bdcc2ffe39e = <b>E-post</b> — <b><a1>contact@ashforde.org</a1></b>, med detaljer og trinn for å reprodusere.

seg-fbc3db22c061 = Ikke åpne en offentlig sak for sikkerhetsfølsomme rapporter. Vi tilstreber å bekrefte mottak innen noen få virkedager.

seg-4c11dabdd8f6 = Støttede versjoner

seg-19c99cf3a67e = Før 1.0: bare den siste merkede utgivelsen støttes.

seg-1379eab9a8e3 = Minnesikkerhet

seg-cf966fa35408 = Bibliotekcraten erklærer <c1/> i crate-roten (<c2/>), så en <c3/>-blokk, fn, impl eller extern hvor som helst i biblioteket er en kompileringsfeil i stedet for noe en vurderer må fange opp. Attributtet ligger ikke bak en <c4/>, så det gjelder hver konfigurasjon biblioteket leveres i, og alle tre kompilerer rent under det: standard Rust-bygg, Python-utvidelsesmodulen (<c5/>) og WebAssembly-modulen (<c6/>).

seg-3f9e707e7d0b = Omfanget, oppgitt presist, fordi <c1/> gjelder per crate:

seg-e7e22e711c53 = Det styrer bare bibliotekcraten. CLI-binærfilen (<c1/>), hjelpebinærfilene under <c2/>, den separat publiserte craten <c3/> og de arbeidsområde-ekskluderte krysskontroll-cratene <c4/> er egne crate-røtter og dekkes ikke av det. Ingen av dem inneholder <c5/> i dag, men det er disiplin, ikke en egenskap kompilatoren håndhever.

seg-b8f1e374d873 = Det sier ingenting om avhengigheter. Disse kontrolleres separat av <c1/> i CI — for rotcraten og, som en egen jobb, for den arbeidsområde-ekskluderte MCP-servercraten — og overvåkes av Dependabot-varsler og sikkerhetsoppdateringer på depotet.

seg-df3008a05522 = Merknad om eksportkontroll / dobbel bruk

seg-0782e60d11fa = PNT-robusthet og kvantesensing kan falle under eksportkontroll for varer med dobbelt bruksområde. Dette offentlige depotet er begrenset til generiske, publiserte modeller og metoder. Ikke bidra med eksportsensitive detaljer om robusthet eller anti-spoofing her; de hører hjemme i et privat overlegg. Er du i tvil, send e-post først.

seg-f6bb0582f6f2 = <s1>Forrige</s1>Lisensiering

seg-834cbd4e96d3 = <s1>Neste</s1>Bidra
