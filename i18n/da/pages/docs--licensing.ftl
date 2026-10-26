# docs--licensing: translations (da)

seg-a1bee28d1dfd = Kilde: <c1/>

seg-b8dd205e82c4 = Kshana er <b>dobbeltlicenseret</b>. Du kan bruge den åbne motor under <b>enten</b> den åbne licens (AGPL-3.0) <b>eller</b> en <b>kommerciel licens</b> fra Ashforde OÜ. Vælg den, der passer til, hvordan du har tænkt dig at bruge den.

seg-5faea0aba960 = Dette dokument forklarer modellen i almindeligt sprog. Det er en vejledning, ikke juridisk rådgivning, og det ændrer ikke selve licenserne. De bindende vilkår står i <a1><c1/></a1> (GNU AGPL-3.0) og i enhver kommerciel aftale, du underskriver med Ashforde OÜ. Hvis de to nogensinde er i strid, er det disse dokumenter, der gælder.

seg-89bd60937f0b = Mulighed A — åben kildekode: GNU AGPL-3.0-only

seg-785200a5419a = Standarden. Den fulde tekst står i <a1><c1/></a1>. Kort sagt lader AGPL dig bruge, studere, ændre og videredistribuere Kshana gratis, <b>forudsat</b> at:

seg-5bc05999ee9d = hvis du <b>distribuerer</b> Kshana eller en afledt version, gør du den <b>komplette tilsvarende kildekode</b> tilgængelig under AGPL; og

seg-5c9136766fdf = hvis du lader brugere interagere med en <b>ændret</b> Kshana <b>over et netværk</b> (AGPL's særlige klausul, §{ "13" }), skal du tilbyde <b>disse brugere</b> den tilsvarende kildekode til din ændrede version under AGPL.

seg-234be920d38f = AGPL er en <a1>af OSI godkendt open source-licens</a1> og en stærk copyleft. Den er det rigtige valg til akademisk arbejde, open source-projekter, intern evaluering og forskning og til alle, der gerne holder deres eget afledte værk åbent.

seg-16c9cc91e4eb = Mulighed B — kommerciel licens (fra Ashforde OÜ)

seg-197bfc5a5166 = Hvis AGPL ikke passer til dig, licenserer Ashforde OÜ den samme motor på kommercielle vilkår. Det er det rigtige valg, når du vil:

seg-6de2b04016e5 = <b>indlejre Kshana i et proprietært produkt med lukket kildekode</b> uden at frigive din egen kildekode;

seg-e31db28c1e09 = <b>tilbyde en netværkstjeneste</b> bygget på en ændret Kshana <b>uden</b> forpligtelsen i §{ "13" } til at offentliggøre kildekoden;

seg-9d3578395a59 = integrere Kshana i et større system, hvis øvrige komponenter ikke kan være AGPL (for eksempel en hovedleverandørs proprietære værktøjskæde); eller

seg-99d049c650a3 = opnå en garanti, skadesløsholdelse eller supportvilkår, som AGPL udtrykkeligt frasiger sig.

seg-f68b536b93c0 = En kommerciel licens fjerner copyleft-forpligtelserne for din brug på aftalte vilkår. <b>Kontakt: <a1>contact@ashforde.org</a1>.</b>

seg-55f1a2f687d9 = Hvorfor vi har to licenser på denne måde

seg-42c1ce05ca5c = Målet er at være <b>offentligt kontrollerbar</b> (så enhver bedømmer kan køre og granske motoren) <b>uden</b> at lade en velfinansieret konkurrent forgrene den validerede motor, lukke den og sende en proprietær konkurrent på markedet, der ikke giver noget tilbage. AGPL's netværks-copyleft opnår det: et lukket eller hostet afledt værk skal tilbage til open source — eller tage en kommerciel licens hos os. Offentlig troværdighed og en forsvaret kerne på samme tid.

seg-32b1d38914fe = Hvad der <b>ikke</b> er dækket af denne dobbeltlicens

seg-27636d757dba = <b>Det native OpenCPN-plugin</b> (<c1/>) er licenseret under <b>GPL-3.0-or-later</b> (se filen <c2/> i den mappe), ikke AGPL-3.0, og tilbydes <b>ikke</b> under den kommercielle licens. Det indlæses i OpenCPN og bygges mod OpenCPN's plugin-API-header under GPL-2.0-or-later, hvilket er det sædvanlige grundlag for OpenCPN-plugins. Resten af <c3/> (Signal K-plugin'et og OpenCPN TCP-relayet) forbliver AGPL-3.0-only.

seg-f90c983e0ee3 = <b>Kshana Pro</b> og andre proprietære overlejringer er <b>separate produkter med lukket kildekode</b> på deres egne kommercielle vilkår. De er ikke en del af dette repository og tilbydes ikke under AGPL.

seg-e340445b7f17 = <b>Afhængigheder</b> beholder deres egne (tilladende) licenser. Vi holder bevidst afhængighedstræet tilladende (Apache-2.0 / MIT / BSD / ISC / …) netop for at kunne tilbyde den kommercielle udgave uden problemer — en copyleft-afhængighed ville smitte den. Se <a1><c1/></a1>.

seg-810191f19d4d = <b>Galileo E1-primærhukommelseskoderne</b> (<c1/>, <c2/>; <b>ikke medfølgende siden { "0.36" }</b>: hver bruger leverer sin egen kopi, <c3/> eller <c4/> / <c5/>, læst af <c6/>). Det er E1-B- og E1-C-primærkoderne i bilag C.7 og C.8 til Galileo Open Service Signal-In-Space Interface Control Document (OS SIS ICD), Issue { "2.0" }, januar { "2021" }, © European Union { "2021" }, udtrukket uændret fra PDF-filens vedhæftede filer (kilde-URL, SHA-256 og en krydskontrol mod Issue { "1.3" } står i <a1><c7/></a1>). De er <b>ikke</b> dækket af AGPL-3.0 eller den kommercielle licens, og ingen af licenserne giver nogen rettigheder over dem. Hvad selve ICD'en siger, citeret fra Issue { "2.0" }:

seg-daef032cbe43 = Terms of Use §{ "3" }: "The information contained in the OS SIS ICD, including its Annexes, is subject to intellectual property rights". "The OS SIS ICD may only be partly or wholly reproduced and/or transmitted to a third party in accordance with the herein described permitted use and under the following conditions: the present “Terms of Use and Disclaimers”, as well as the terms of Annex G, are accepted, reproduced and transmitted entirely and unmodified together with the reproduced and/or transmitted information; the copyright notice “© European Union { "2021" }” is not removed from any page." Og: "The use of the information contained in the OS SIS ICD, including the spreading codes which are subject to IPR, is authorised under the terms and conditions stated in Annex G."

seg-0fb25fafd9a2 = Bilag G (Issue { "2.0" }; bilag H i Issue { "2.1" }, samme ordlyd) definerer "Technical Data of the OS SIS ICD" til at omfatte "E1 and E5 Memory Codes" og giver en forpligtelse til ikke at gøre krav gældende, som er "non-exclusive and royalty-free" og "non-transferable and non-licensable". Listen i dets §G.3, som det selv kalder udtømmende, omfatter: "a) the use of the Technical Data of the OS SIS ICD, including their integration and incorporation into any Products"; "b) the storage of the Technical Data of the OS SIS ICD, provided the source is acknowledged"; "c) the reproduction of the OS SIS ICD, in whole or in part, its distribution and its publication for non-commercial not-for-profit purposes and scale without amending the document or adding any element"; og "d) providing links to the EU website where the document is published". "Products" betyder software, enheder og tjenester med merværdi "making use of the OS Signal". Det siger også: "The Authorised Person shall not state or imply in any promotional material or elsewhere that the Products were developed by, are used by or for or have been approved or endorsed by the EU".

seg-8531368368ba = <b>Beslutning ({ "0.36" }): ikke videredistribueret.</b> Der er ikke angivet nogen udtrykkelig åben licens. Brug i et softwareprodukt (G.3 a) og lagring med kilden angivet (G.3 b) er dækket på ICD'ens egne vilkår, men videredistribution (G.3 c) kun til ikke-kommercielle, almennyttige formål og med vilkårene og bilag G gengivet uændret sammen med. Fordi Kshana også tilbydes under en kommerciel licens, blev filerne fjernet fra repository'et og dets pakker; motoren læser brugerens egen kopi under kørslen, og uden den giver Galileo E1-signalerne en fejl, der forklarer, hvordan de skal leveres. Hver bruger støtter sig direkte til EU's tilladelse; Kshana kan ikke give den videre. Kshana er ikke udviklet af, brugt af, godkendt af eller støttet af Den Europæiske Union.

seg-e18986aeab7f = <b>Varemærker.</b> "Kshana" og dets mærker er varemærker tilhørende Ashforde OÜ. Ingen af licenserne giver rettigheder til navnet eller mærkerne; forks og afledte distributioner skal bruge et andet navn. Se <a1><c1/></a1>.

seg-f6b7345c2c60 = Bidrag

seg-1709eb19c2c5 = Bidrag modtages på projektets indgående bidragsvilkår, som licenserer dit bidrag under AGPL <b>og</b> giver Ashforde OÜ ret til at inkludere det i den kommercielt licenserede udgave (så dobbeltlicensen fortsat virker). Se <a1><c1/></a1>.

seg-940c8cce5137 = Spørgsmål

seg-e678f2ecc571 = Licensspørgsmål, kommercielle tilbud og "hvilken mulighed gælder for os?" → <b><a1>contact@ashforde.org</a1></b>.

seg-05d34a27a0ba = <s1>Forrige</s1>Ændringslog

seg-4f7f660eea0a = <s1>Næste</s1>Sikkerhed

seg-2d2b32369c30 = Hvad der ikke er dækket af denne dobbeltlicens
