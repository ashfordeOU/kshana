# docs--lunar-reference-station: translations (nb)

seg-f63dd3d7aad4 = Kilde

seg-9872e31ebd72 = Kilder

seg-38afa54b0306 = Kilde: <c1/>

seg-e8ee3794bac6 = <b>MODELLED.</b> Under de oppgitte forutsetningene (konstellasjonen, signal-i-rommet-feilen, stasjonens oppmålingsnøyaktighet, korrigeringsforsinkelsen og linkkvantiseringen, hver av dem en inndata merket med sin offentlige kilde eller som ILLUSTRATIVE), gir modellen tallene nedenfor. De er <b>ikke</b> en uttalelse om ytelsen til noe reelt system. Kshana er <b>ikke</b> tilknyttet eller støttet av noe romfartsbyrå, og gjør ingen påstander om TRL eller flyhistorikk. Kun veiledende.

seg-22eb5bd00092 = Formål

seg-25678ae41147 = Offentlig materiale beskriver en lunar referansestasjon ved sydpolen som overvåker en lunar navigasjonstjeneste, beregner lokale differensialkorreksjoner, holder en lunar tidsreferanse på en atomklokke, og bærer en laserretroreflektor og en VLBI-sender for månens referansesystem (klassen som er offentlig beskrevet for ESAs NovaMoon-konsept; kilder nedenfor). Kshana modellerer allerede hver del for seg. Denne studien setter dem sammen til én reproduserbar, åpen analyse av hva en slik stasjon kan gjøre under offentlige forutsetninger, og forhåndsregistrerer den slik at den kan poengsettes mot publiserte resultater og etter hvert flyresultater.

seg-6ac04119fc30 = eller <c1/> fra Python, WebAssembly eller MCP-serverens <c2/> med <c3/>.

seg-671e68d341fd = Dekning- og nøyaktighetskart (<c1/>)

seg-f034e2642dab = For en differensiell referansestasjon på et kjent sted ved sydpolen: i hvert brukerpunkt på et ringrutenett fra { "80" }° S til polen og over regionen, over et døgn med epoker og Monte Carlo-forsøk, persentilene for korrigert og ukorrigert posisjonsfeil (3-D, horisontal, vertikal), tilgjengelighet med en årsak for hver utilgjengelige epoke, dekning mot en terskel oppgitt før kjøringen, DO-229E-beskyttelsesnivåer, dekningsradius per asimutsektor, og korrigeringslinkens budsjett ved stasjonen og i det verste punktet. Ingen ny fysikk: den sveiper de testede funksjonene i <c1/> og reduseres nøyaktig til den typen ved ett punkt, én epoke og ett forsøk.

seg-94058315dfe4 = Inndata

seg-7670cf4ceda3 = Standard

seg-98b42925ad5c = Konstellasjon (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) eller <c6/>

seg-bfdd053b2611 = det medfølgende settet av LCNS-klassen

seg-389db26524b4 = ILLUSTRATIVE i den medfølgende standarden; eksempelet med offentlige kilder setter fire satellitter og perioden på { "24" } h fra S2 og S4, mens elementsettet forblir ILLUSTRATIVE (ingen kilde oppgir det)

seg-91231bdcc599 = ILLUSTRATIVE

seg-6b9d48431e4b = Stasjon (<c1/>, <c2/>, <c3/>)

seg-fcdb2f3ac330 = { "89" }° S, { "0" }°, { "0" } m

seg-f32dcb376b51 = { "0.30" } m

seg-93d78578585f = ILLUSTRATIVE (den medfølgende tildelingen for realisering av referansesystemet, selv MODELLED)

seg-59286c0377ce = <c1/>, <c2/> eller <c3/> med <c4/>

seg-fe90a6f490f9 = { "100" } m, { "30" } m (SISE langs siktlinjen { "65" } m)

seg-9a432ef35cac = ILLUSTRATIVE i den medfølgende standarden; eksempelet med offentlige kilder setter <c1/> = { "10" } / { "1.96" } m fra S4 s. 8

seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } biter

seg-311a924e2133 = Rutenett (<c1/>, <c2/>) eller <c3/>

seg-49a2022b83c0 = { "80" }° S, { "1" }° ({ "346" } punkter)

seg-e945f5407b12 = studieregionen

seg-fed48a6c31be = Tid (<c1/>, <c2/>, <c3/>), <c4/>

seg-0fec404c8c7c = { "0" } s, ett døgn, { "600" } s, { "200" }

seg-d35d88b0753b = { "20" } m ved p95 i den medfølgende standarden ({ "1" } m i eksempelet med offentlige kilder)

seg-fa7858b14f89 = oppgitt før kjøringen; { "20" } m er ILLUSTRATIVE, dimensjonert etter standardens illustrative feil

seg-a6ee5e2a8b61 = { "10" } m

seg-329ad585cd9b = ILLUSTRATIVE: ingen offentlig verdi finnes

seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

seg-c530b459b0ef = Hvert numeriske felt har en enhet og en opphavsklasse i resultatets <c1/>-blokk (kontrollert av <c2/>). Regionblokken: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> per { "30" }° asimutsektor; <c15/> per punkt; og <c16/>.

seg-4aa380258574 = Hva kontrollene kan og ikke kan si

seg-112cb6bffc03 = <c1/>: reduksjonen til <c2/>, gulvene for null grunnlinje og oppmåling, monotonitet, årsaker til utilgjengelighet, determinisme, arbeidsvakten. Disse viser at sveipet er den modellen det påstår å sveipe.

seg-695ed4f23f3c = <c1/>: en uavhengig numpy-omberegning av aritmetikken på eksporterte tilfeller, forhåndsregistrert før den ble kjørt. Posisjoner og persentiler nådde tersklene sine; stasjonskorreksjonene bommet på sine på grunn av avrunding i dobbel presisjon (registrert, med tallene, i <c2/>).

seg-be6ecf79d22c = Ingen av dem kontrollerer modellen. Feilmodellen, førsteordens dekorrelasjonen, modellene for oppmåling, aldring og kvantisering og hver terskel er prosjektets egne eller ILLUSTRATIVE.

seg-d6f194e28401 = Terrengbaserte horisontmasker

seg-9ad9b163a3a0 = MODELLED. En valgfri <c1/>-seksjon (<c2/>) gir stasjonen og hvert brukerpunkt sin egen asimutavhengige horisont, i skylinje-tabellformatet fra { "0.36" } (rader <c3/>, lineært i asimut med omslag ved { "360" }°). En satellitt teller på et sted når den er over både <c4/> og horisonten ved sin asimut; en epoke som horisonten etterlater med færre enn fire satellitter i et punkt, der den flate masken gir fire, rapporteres som <c5/> (<c6/> beholder sin flate betydning). To kilder, kombinert som punktvis maksimum når begge er oppgitt:

seg-4d55808bc002 = en oppgitt profil, <c1/> eller <c2/> (brukt i hvert brukerpunkt), hver med en påkrevd <c3/>-merking;

seg-d6fda9939caa = en horisont stråleført over en polar DEM (<c1/>): storsirkler på månekulen med nøyaktig krumning, fra en oppgitt masthøyde (standard { "2" } m), for hver <c2/> (standard { "1" }°), ut til <c3/> (standard { "150" } km) eller rutenettets kant. Depotet inneholder et utsnitt av det offentlig eide LRO LOLA-polarproduktet <c4/>, nedskalert med blokkmiddel { "5" } × { "5" } til { "1200" } m og omtrent ±{ "420" } km fra polen (<c5/>: kilde-URL, SHA-256, lisens, utsnitt og nedskaleringstrinn);

seg-292c49f3739a = eller, i stedet for <c1/>, en DEM-flis for breddegrad/lengdegrad (<c2/>) i tekstformatet <c3/> (en header <c4/>, deretter høydene i meter over middelkulen, radvis), stråleført på samme måte, der breddegradsavstanden setter standardsteget. Rapporten gjentar flisens bane, SHA-256 og utstrekning (<c5/>). En flis nedskalert fra det medfølgende utsnittet gir stasjonen utsnittets egen horisont med { "0.22" }° (<c6/>). Ingen flis følger med.

seg-34ed85bb9ac0 = De samme maskene gjelder for <c1/>-rutenettet (<c2/>, <c3/> og <c4/>; et rutenettpunkt utenfor DEM-en beholder den flate masken og telles). Uten seksjonen er hvert dokument byte-identisk med en kjøring uten den.

seg-8d07f0227ab8 = Kontroller: strålefølgingen gjengir horisonter i lukket form (det bare kuleformede dykket, et krater i et platå fra midten og utenfor, en rasterisert kjegle mot den analytiske kjeglen); det medfølgende utsnittet er orientert som kilden (gulvene i Shackleton og Haworth lavt, Malapert-massivet høyt); en uavhengig numpy-stråleføring på utsnittet, forhåndsregistrert (<c1/>), stemmer til { "5.5e-10" } grader på fem steder, noe som kontrollerer aritmetikken, ikke terrenget. Ingen publisert polar horisont- eller belysningsverdi er gjengitt, så raden forblir MODELLED (registerraden «Lunar terrain horizon masks from a stated profile or a polar DEM»).

seg-10a1d62ab5cc = <c1/> kjører de medfølgende inndataene på et rutenett på { "2" }° med { "100" } forsøk og DEM-horisonten på hvert sted. Stasjonsstedet ({ "89" }° S, { "0" }° E) har en høyeste horisont på omtrent { "4.0" }°, under masken på { "5" }°, så ved stasjonen begrenser ikke terrenget; i brukerpunktene er det arealvektede gjennomsnittet av hvert punkts høyeste horisont { "9.7" }° og den største { "26.3" }°. Mot de samme inndataene med den flate masken øker regionens korrigerte p95 3-D-feil fra { "16.3" } m til { "18.6" } m og den største HPL fra { "480" } m til { "62" } km. Regionens tilgjengelighet øker fra { "91.9" } % til { "93.0" } %: en epoke er utilgjengelig når et punkt bruker en satellitt stasjonen ikke ser, og en horisont som skjuler den satellitten for punktet kan gjøre epoken tilgjengelig.

seg-6d18d8a8dc78 = <b>Terreng og horisontmasking: behandlet i { "0.36" }, med begrensninger.</b> Horisontmasker per sted fra en oppgitt profil eller det medfølgende LOLA DEM-utsnittet er modellert (ovenfor). Det som gjenstår: det medfølgende utsnittet er { "1200" } m per piksel, så relieff under omtrent en kilometer jevnes ut og blokkmiddel senker skarpe topper; en stråle som forlater utsnittet (omtrent { "420" } km fra polen) ender der; det er ingen diffraksjon, terrengmultipath eller delvis hindring; stedsposisjoner for avstandsmåling blir på middelkulen ved de oppgitte høydene (DEM-en setter bare horisonten); horisonten er ikke validert mot et eksternt tall. Eksportstedet per satellitt for <c1/> maskeres som et rutenettpunkt: med en <c2/>-seksjon har hver eksportrad <c3/> og rapporten stedets horisont (<c4/>); tellingene for antenne i strålen teller fortsatt hver link som er over den flate masken.

seg-b58b3ff1ef20 = <b>Multipath og mottakermaskinvare: behandlet i { "0.36" } som et frivillig valg, med begrensninger.</b> En <c1/>-seksjon (<c2/>) legger til elevasjonsavhengig multipath <c3/> hos brukeren og stasjonen (den funksjonelle formen fra DO-229; på Månen er hver verdi ILLUSTRATIVE), stasjonens multipath eventuelt førsteordens Gauss-Markov over epoker, tidlig-minus-sen DLL-kodestøy fra C/N0, og biaser mellom kanaler per kanal. Det som gjenstår: variasjon i antennens fasesentrum og gruppeforsinkelse er ikke modellert; ingen lunar måling fastsetter multipath-verdiene; budsjettblokken for korrigeringslinken inkluderer ikke mottakerleddene.

seg-677252c2d3e5 = Vekst i efemeridefeil over forsinkelsen: behandlet i { "0.36" } som et frivillig valg, med begrensninger.

seg-3af08edab1cc = <c1/> legger til en lineær vekst i den kringkastede banefeilen med alder (avstand 1-sigma <c2/>), oppå reprojeksjonen av den frosne feilen; lineær vekst er førsteordensleddet i en propagert tilstandsfeil (kontrollert til { "1" } % ved { "600" } s mot den medfølgende topunkts propagasjonen). Det som gjenstår: ingen offentlig kilde oppgir en lunar vekstrate (ILLUSTRATIVE); ingen struktur langs banen/radialt; budsjettblokken for korrigeringslinken bruker den frosne modellen. K5-tillegget (<c3/>, forhåndsregistrert alene) kjører K5 ved { "0.001" }, { "0.01" } og { "0.1" } m/s: den feiler i alle tilfeller ({ "369.8" } m, { "2315" } m, { "22797" } m mot en terskel på { "1.5" } m), slik det ble oppgitt før kjøringen.

seg-5bba9be34cad = <b>Løsningsstil (filter, høydebegrensning, tre satellitter): et frivillig valg i { "0.36" }, med begrensninger.</b> En <c1/>-seksjon (<c2/>) legger til en høydepseudomåling, et minimum på tre satellitter med den, og et statisk vektet minste kvadraters vindu over epoker for brukeren (én felles posisjon, en klokke per epoke), som står i stedet for et filter. Det som gjenstår: den behandler epokenes feil som uavhengige, så den midles ned raskere enn feil som er korrelert i tid ville gjort; den gjelder bare statiske brukere; det er ikke noe dynamisk filter, bærebølgefase eller oppløsning av flertydighet; tilfellesporet (<c3/>) viser øyeblikksaritmetikken. Tillegget om publiserte påstander med denne modusen er <c4/> (forhåndsregistrert alene). Med en høydebegrensning på { "1" } m, tre satellitter og et vindu på 6 epoker (ILLUSTRATIVE innstillinger) synker den korrigerte p95 3-D-feilen for R300 fra { "280.6" } m til { "2.11" } m (horisontalt { "0.90" } m, ikke poengsatt); K1 til K5 feiler fortsatt og K6 består, { "1" } av { "6" } som i den registrerte kjøringen. Vinduets uavhengighetsantakelse favoriserer det.

seg-4f8274f839a7 = Sammenligning med publiserte påstander

seg-82391b00e1bc = MODELLED. En sammenligning av denne modellen, kjørt under de offentlige forutsetningene, med påstandene kildene kommer med. Det er ikke en uttalelse om ytelsen til noe reelt system.

seg-fc27b4012f02 = Kilder S1 til S5 (tittel, URL, hentedato, SHA-256, lisens): <c1/>.

seg-d866653008e1 = Hver numeriske påstand, sitert med side og oppgitte forutsetninger og klassifisert som sammenlignbar, delvis sammenlignbar eller ikke sammenlignbar: <c1/>. Ingen påstand er fullt sammenlignbar, fordi ingen kilde oppgir en persentil eller satellittenes banelementer.

seg-50535c58d3cf = Terskler, tilfeller og inndata, committet alene før kjøringen (revisjon { "2" }, 05bf9a19), og den registrerte kjøringen: <c1/>. Funnet er låst i <c2/>.

seg-069a652c402e = terskel

seg-d6120708c062 = påstand (kilder)

seg-5b480535b54b = denne modellen

seg-6231a005ccc9 = utfall

seg-45dc6ff5d546 = én stasjon gir submeter-nøyaktighet over hele sydpolens sirkel på { "300" } km (S1, S2, S3)

seg-4da98cf6180b = dekning { "0.00" }

seg-70a79ec95bf4 = feiler

seg-cd0e9021aaa3 = det samme, sirkel på { "600" } km (S2 s. 10, S3 s. 23)

seg-ef9f2ee31c52 = submeter med kodekorreksjoner (S1, S2)

seg-9f4e2b6991e8 = korrigert p95 3-D { "280.6" } m

seg-ac3c99ec0d15 = <= { "1.5" } m

seg-1b720f1677cc = «desimeternivå» fra pseudoavstandskorreksjoner (S3 s. 22, S5 s. 5)

seg-ffa1c831a14f = { "280.6" } m

seg-70368d910820 = <= { "0.15" } m

seg-786f940b345e = feiler (kunne ikke bestå ved kildenes kodestøy på { "0.30" } m)

seg-da761dde1cae = submeter holdt ved { "600" } s forsinkelse (S2 s. 16)

seg-2a9db96bd87f = { "293.0" } m

seg-021336eb5623 = samme nøyaktighet fra { "10" } km til { "500" } km grunnlinje (S2 s. 17)

seg-62190343777c = forhold { "1.39" }

seg-7a33a168b020 = består

seg-e666f1eb7a59 = { "1" } av { "6" } terskler består. Årsaken er geometri. Ingen kilde publiserer konstellasjonens banelementer. Med de ILLUSTRATIVE medfølgende elementene deler en bruker og stasjonen fire satellitter over { "5" } grader i bare { "8" } % ({ "300" } km) og { "6" } % ({ "600" } km) av epokene, med nesten singulær geometri: den ukorrigerte p95 er { "3.8" } km, der kildene oppgir < { "10" } m. Kildenes egne simuleringer brukte et filter, en høydebegrensning og tre satellitter i felles sikt, noe denne øyeblikksmodellen ikke har. Kjøringen gjengir derfor ikke påstandene på disse elementene, og den er ikke belegg for at påstandene er feil. K6-bestått er et forhold mellom to geometridominerte tall og sier ingenting om dekorrelasjon. Et publisert sett med konstellasjonens elementer ville blitt poengsatt under de samme tersklene som en andre, datert kjøring.

seg-1da5fcf7bbf5 = Forhåndsregistrert prediksjon

seg-4ea806a57380 = En forhåndsregistrert prediksjon, frosset ved commit <c1/> på inndataene fra offentlige kilder, med sin poengsettingsprotokoll: <a1><c2/></a1>. Det er en prediksjon, ikke en validering, og hvert tall i den domineres av det upubliserte elementsettet for konstellasjonen med fire satellitter (elementene som brukes er ILLUSTRATIVE): over regionen { "80" } grader S, tilgjengelighet { "8.2" } %, korrigert p95 3-D { "280" } m, ukorrigert { "3.8" } km. MODELLED; <c3/> feiler hvis en eneste frossen byte flyttes.

seg-e6aef34d5023 = Stasjonens tidslaboratorium

seg-4ef12bffa7c4 = Om stasjonens miniRAFS, styrt til LTC og deretter fritt løpende eller styrt på nytt, holder seg innenfor { "1" }, { "10" } og { "100" } ns: den valgfrie <c1/>-blokken i <c2/> (<c3/>). miniRAFS når { "1" } ns etter { "2.8" } s, { "10" } ns etter { "377" } s og { "100" } ns etter { "10.5" } h; kildens mål på nanosekundnivå er sitert, ikke tatt til etterretning. MODELLED. Modell, utdata, tabellen over tid til terskel for fire klokkeklasser og sammenligningen med kildene: <a1><c4/></a1>.

seg-69ddf7ea8fcb = Stasjonens geodesi

seg-717a5c91387b = Hvor mye én retroreflektor og ett VLBI-fyr på stasjonsstedet strammer inn månens referansedatum utover de fem arkiverte retroreflektorgruppene: de valgfrie inndataene <c1/> og <c2/> i <c3/> (<c4/> og <c5/>). Cramer-Rao-grenser for et redusert parametersett på en ILLUSTRATIVE tidsplan og et illustrativt sted: 1-sigma for translasjonsnormen synker fra { "0.0185" } m til { "0.0102" } m (forhold { "0.551" }), skalaen fra { "0.00178" } til { "0.00063" } ppm. MODELLED. Metode, forbehold (et sted ved sydpolen ser Jorden lavt eller ikke i det hele tatt) og hele Helmert-tabellen: <a1><c6/></a1>.

seg-8a873848459b = Hver kilde med tittel, identifikator og utgiver, med hentedato og lisens. URL-er, SHA-256-hasher og merknader om hvor kildene er uenige står i registeret, <a1><c1/></a1>. Ingen kildefil videredistribueres. Personnavn er utelatt med vilje.

seg-b1f1e1efa042 = id

seg-02071a726f21 = tittel

seg-0634af374469 = identifikator

seg-fd875b5fb817 = utgiver

seg-a6f8ef268fcc = hentet

seg-d04709ddc97d = lisens

seg-1d4174e911c1 = white paper om en lunar referansestasjon for posisjonering, tidtaking og vitenskap, versjon { "3" }

seg-e09e1cc11921 = arXiv (forfatternes white paper)

seg-c91720d34bd3 = arXivs ikke-eksklusive lisens for distribusjon { "1.0" } (gir bare arXiv rettigheter)

seg-df12c861db1e = «Lunar local Differential PNT and Selenodetic Reference Station» ({ "27" } lysbilder)

seg-03f689a0ba49 = ioag.org/meetings/cislunar, seksjon { "6" }, punkt { "07" }

seg-406990fe43a8 = ICG-IOAG Workshop on Cislunar PNT, februar { "2025" }; lysbilder fra European Space Agency

seg-58579c3faf2f = ingen oppgitt; merket frigitt for offentligheten fra lysbilde { "3" }

seg-57df0ef791e6 = «Moonlight: LCNS, and Lunar Pathfinder» ({ "28" } lysbilder)

seg-7e18a15e0d16 = unoosa.org, <c1/>

seg-23aee49b1347 = UNOOSA, ICG Joint Working Group Session on Lunar PNT, juni { "2024" }; lysbilder fra European Space Agency

seg-f4e53e44f0b5 = ingen oppgitt; merket frigitt for offentligheten

seg-b22a694c481d = «Moonlight Programme Development Status» ({ "16" } lysbilder)

seg-3fd0ab93507d = 2nd ICG-IOAG Cislunar PNT Workshop, februar { "2026" }; lysbilder fra European Space Agency og Telespazio

seg-472771298df7 = «Lunar Reference Time: ESA's Views» ({ "9" } lysbilder)

seg-6229db9cb23d = Workshop on Cislunar PNT, februar { "2026" }; lysbilder fra European Space Agency

seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, og den medfølgende <c1/>

seg-4e07c500e353 = som registrert med <c1/>

seg-28f8d886c4e5 = allerede i treet

seg-2006c194fef6 = som registrert der

seg-68db6a17b4e7 = <s1>Forrige</s1>Solsystemet og andre legemer

seg-79d53edd2374 = <s1>Neste</s1>Navigasjon for rombrukere (gnss-ssv)

seg-9c59637f0666 = Dekning- og nøyaktighetskart (lunar-station-coverage)
