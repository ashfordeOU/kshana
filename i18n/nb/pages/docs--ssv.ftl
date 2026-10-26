# docs--ssv: translations (nb)

seg-0857a94a948e = Begrensninger

seg-75c8da01c0f1 = MET

seg-069a652c402e = terskel

seg-1f79a5aae6c5 = Signaltilgjengelighet for en bruker på en sfære i { "36000" } km høyde med en halvkuleantenne, fra en ekte kjøring av motor v{ $version } på scenarios/gnss-ssv-shell.toml (en redusert kjøring: { "162" } brukere, { "3" } dager, steg på { "10" } min), ved en terskel på { "20" } dB-Hz. For hver konstellasjon og hvert bånd to søyler: andelen (bruker, epoke)-par med minst ett signal og med minst fire. Kombinert, L1: { "99.4" } % minst ett, { "73.2" } % minst fire, lengste avbrudd under fire signaler { "160" } min. Kombinert, L5: { "100.0" } % minst ett, { "99.9" } % minst fire, lengste avbrudd under fire signaler { "20" } min. MODELLED: en modellert studie fra oppgitte inndata, ikke en måling og ikke en påstand om tjenestevolum for noe system. Den reduserte størrelsen er ikke boksammenligningen. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-92ef8e0b78de = Signaler langs én høy jordbane (perigeum { "497" } km, apogeum { "58622" } km, periode { "18.8" } t), fra en ekte kjøring av motor v{ $version } på scenarios/gnss-ssv-heo.toml, bånd L1. Øverst: den beste bærebølge-til-støy-tettheten blant signalene i sikte, mot terskelen på { "20" } dB-Hz. I midten: antall signaler i sikte fra alle konstellasjoner, fra { "4" } til { "55" } langs de samplede punktene. Av lenkene som ble mottatt, kom { "2252" } gjennom en hovedlobe og { "696" } gjennom sidelober, med et merket parametrisk stand-in-mønster, ikke noe systems målte mønster. Median PDOP { "67" }, 95. persentil { "358" }. MODELLED: en modellert studie fra oppgitte inndata, ikke en måling og ikke en påstand om tjenestevolum for noe system. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-902c5c7da9aa = Et filter med ni tilstander om bord på en overføring fra lav bane mot Månen, fra en ekte kjøring av motor v{ $version } på scenarios/gnss-ssv-nav-lunar.toml ({ "289" } epoker, { "13" } punkter tegnet). På en logaritmisk akse, den sanne posisjonsfeilen og filterets eget ett-sigma-bånd mot tid siden starten. Innenfor GNSS-banene er posisjons-RMS { "1.4" } m; over dem er den { "90" } m, med sluttfeil { "184" } m i { "193,330" } km høyde med { "1" } måling. Gjennomsnittlig normalisert estimeringsfeil i annen over hele kjøringen er { "4.4" } (omtrent { "3" } for en konsistent posisjonsblokk). Referanse og filter deler stand-in-ene sine for Sola og Månen. MODELLED: en modellert studie fra oppgitte inndata, ikke en måling og ikke en påstand om tjenestevolum for noe system. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-9a947b61a4cb = Relativ navigasjon for { "2" } deputies rundt en chief i en høy bane, fra en ekte kjøring av motor v{ $version } på scenarios/gnss-ssv-formation-heo.toml ({ "401" } epoker). For hver deputy to søyler: relativ posisjons-RMS fra å trekke de to uavhengige absolutte estimatene fra hverandre, og fra det relative filteret på enkeltdifferensierte pseudoavstander. Grunnlinje { "0.8" } km: { "5.1" } m og { "1.2" } m. Grunnlinje { "2.0" } km: { "4.1" } m og { "2.1" } m. Det absolutte filteret er ikke konsistent her: gjennomsnittlig normalisert estimeringsfeil i annen { "187" } mot omtrent { "3" } for et konsistent filter, så den oppgitte usikkerheten er langt for liten. MODELLED: en modellert studie fra oppgitte inndata, ikke en måling og ikke en påstand om tjenestevolum for noe system. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-d76123040989 = Den registrerte sammenligningen av tilgjengelighetsmodellen for rombrukere med den offentlige Space Service Volume-boken, fra de innsjekkede resultatene av den forhåndsregistrerte kjøringen (xval/gnss-ssv/results-run1.json, skrevet av eksempelet ssv_booklet_check i motor v{ $version }). Terskel for terskel, cellene innenfor toleransen: S0 { "13" } av { "13" } (MET); S1 { "43" } av { "52" } (NOT MET); S2 { "48" } av { "52" } (NOT MET); S3 { "122" } av { "155" } (NOT MET); S4 { "132" } av { "156" } (NOT MET); S5 { "18" } av { "26" } (NOT MET); S6 { "26" } av { "26" } (MET); S7 { "0" } av { "20" } panelmønstre (NOT MET). Bare S0 og S6 er nådd under den forhåndsregistrerte lesningen. En diagnostisk variant som bruker bokens andre GLONASS-vinkler, bringer S1, S2 og S4 til hver celle, men erstatter ikke kjøringen som gjelder. Ingen registerrad er VALIDATED. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-74675df154dc = Kilde: <c1/>

seg-ce7ea32e67f1 = GNSS utover konstellasjonen: typen <c1/>

seg-389cb131fd77 = Kun veiledende. Modellerte resultater fra oppgitte inndata og en simulert referanse; ikke en sertifisering, et flykvalifisert tall eller en påstand om tjenestevolum for noe system. Kshana sender ingenting.

seg-a0011b278269 = Typen <c1/> svarer på: for et romfartøy over, rundt eller langt forbi GNSS-banene, hvor mange GNSS-signaler kan det bruke, hvor sterke er de, hvor god er geometrien, og hva kan et filter om bord gjøre med dem? Den har tre moduser, valgt etter hvilken tabell scenarioet har: <c2/>, <c3/> eller <c4/> (med en valgfri <c5/>).

seg-2e4ac6b7a883 = Status: <b>MODELLED</b>. Tilgjengelighetssveipene sammenlignes med ICG-heftet Space Service Volume under en forhåndsregistrering; se <a1>hva sammenligningen viser</a1> før du stoler på noe tall.

seg-a0ff58bccaa8 = Offentlige kilder

seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" } November { "2018" }), utarbeidet av International Committee on GNSS (ICG), Working Group B: metoden (vedlegg B), banelementene til hver konstellasjon (vedlegg C), sendestrålebredder og effekter (tabell B2, B6, B8, { "4.2" }), brukerantennene (tabell B10) og de publiserte tilgjengelighetstabellene. Det er selv en simulering. Hentet av <c1/> (festet SHA-256), aldri medlevert.

seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, GPS Block IIR and IIR-M antenna panel patterns (Marquis, { "2014" }): de målte L1-panelmønstrene, brukt bare til å bedømme den parametriske erstatningen (terskel S7). Hentet, aldri medlevert, ingen mønsterdata er sjekket inn.

seg-0a002dc0df64 = Modellens konstanter (gravitasjon, jordrotasjon, friromstap, støytetthet) er standard; Gallaghers tetthetslov for plasmasfæren, Chapman-laget og radiorefraktivitetsprofilen er publiserte former, brukt med oppgitte enkle parametere (se <c1/>).

seg-c3c3f63df966 = Skallmodus: heftets globale mål

seg-f1e153c95b13 = <c1/> plasserer en bruker på en kule (standard { "36,000" } km høyde med en nadirpekende halvkuleformet antenne, den øvre SSV; eller { "8,000" } km med en rundstrålende antenne, den nedre SSV) på et ikosfærenett med 2 562 punkter og teller, over { "14" } døgn med 1-minutters steg, andelen (bruker, epoke)-par med minst ett og minst fire signaler, per konstellasjon og samlet, og det lengste avbruddet hos den dårligst stilte brukeren. Sveipet bruker det lukkede synlighetsintervallet i sentralvinkel (en strålekjegle, jordblokkering av kulen på { "6378" } km pluss { "50" } km, brukerhalvkulen og RF-rekkeviddegrensen) og kjører på sekunder i et release-bygg; en egenskapstest kontrollerer det mot det generelle geometriske predikatet.

seg-3fb4c06c8b3f = Banemodus: langs en bane

seg-632fedc95af5 = <c1/> flyr brukeren på en keplersk bane (en forhåndsinnstilling: <c2/>, <c3/>, <c4/>, <c5/> (heftets tabell { "5.10" }) eller <c6/>, eller elementer) og rapporterer, per bånd og konstellasjon, tilgjengelighet for ett og fire signaler, avbruddsvarighet, signaler i sikte, beste C/N0, presisjonsfortynning (median, 95. persentil, verste), lenker mottatt gjennom hovedloben og gjennom sidelober, og en valgfri tidsserie og CSV.

seg-7bfd301cd789 = <b>Sendemønster</b> (<c1/>): <c2/> (konstant effekt innenfor referansevinkelen utenfor siktelinjen), <c3/> (en merket erstatning: { "3" } dB per grad utover referansevinkelen ned til et gulv { "25" } dB under hovedloben; <b>ikke</b> noe systems målte mønster) eller <c4/> (et målt mønster du leverer: <c5/> eller innebygd <c6/>; panelmønstrene til Block IIR/IIR-M kan trekkes ut med <c7/>).

seg-c1390929d9f2 = <b>Mottaksantenner</b>: rundstrålende, halvkule, eller heftets høyforsterknings- og patch-antenner i tabell B10, nadir eller zenit; hver lenke bruker antennen med høyest forsterkning.

seg-fe56ab7a2cac = <b>Limbstråle-medium</b> (<c1/>): en Chapman-ionosfære, en plasmasfære (Gallaghers form fra { "1988" }, plasmapause ved L = { "4.5" }, avtagende under { "1,500" } km) og en nøytral atmosfære (bøyning på omtrent { "1.33" } grader ved overflaten, oksygenabsorpsjon, defokusering) integrert langs den rette strålen. Rapporterer skråstilt TEC, plasmasfærens del, ekstra forsinkelse, tangenthøyde og lenkene som går tapt ved strykning. Rettstråleintegrasjon: bøyningen rapporteres, ikke iterert.

seg-1bad91204f6a = <b>Mottaker for svake signaler</b> (<c1/>): koherent og ikke-koherent integrasjon, databitgrense, støtte- og pilotkanaler, Doppler-søk; innhentingsterskelen ved oppgitte deteksjons- og falsk-alarm-sannsynligheter og bærebølge- og kodesporingsterskelene erstatter den faste C/N0-terskelen (området { "10" } til { "25" } dB-Hz). Gjenbruker motorens modeller for innhenting og sporingssløyfer.

seg-497126fe23e9 = Navigasjonsmodus: et filter om bord

seg-af7919ae046e = <c1/> flyr et farkost i høy bane eller månetransfer og kjører et utvidet Kalman-filter med ni tilstander (posisjon, hastighet, mottakerklokkens bias og drift, en skala for solstrålingstrykk) på pseudoavstander. Referansen integreres med punktmassegravitasjon, J2, tredjelegemevirkning fra Sola og Månen og strålingstrykk med en sylindrisk jordskygge; filteret modellerer gravitasjon, J2 og tredjelegemene og estimerer strålingstrykket. Pseudoavstandene kommer fra den samme koblingsgeometrien og C/N0-terskelen som sveipene; støyen vokser når C/N0 faller; mediets ekstra forsinkelse (med <c2/>) legges til og modelleres ikke av filteret. Rapporten skiller den delen av kjøringen som ligger innenfor GNSS-banene (under { "20,000" } km høyde) fra den delen som ligger over, oppgir det lengste gapet uten måling og gjennomsnittlig normalisert estimeringsfeil i annen (omtrent { "3" } for en konsistent posisjonsblokk). Sola og Månen er sirkulære erstatninger med lav presisjon.

seg-a515950c13d6 = Formasjonsmodus: relativ navigasjon

seg-8d2b72ca56d9 = <c1/> (trenger <c2/> for lederen) legger til underordnede forskjøvet i sann anomali. Hvert farkost kjører det absolutte filteret; underordnedes posisjon relativt til lederen estimeres ved å subtrahere de uavhengige absolutte estimatene og ved et relativt filter på enkeltdifferensierte pseudoavstander for signalene begge farkostene sporer. Rapporten gir begge, grunnlinjen og antallet signaler som spores felles.

seg-dc78efcb8bcb = Hva sammenligningen med heftet viser

seg-643bcfcea515 = Terskler ble fastsatt på forhånd (<c1/>, tillegg { "1" } til { "5" }) før kjøringen i full størrelse; resultater i <c2/>, celler i <c3/>, festet av <c4/>, inkludert de som ikke nådde terskelen.

seg-5498636f8d07 = hva

seg-32c0ea7929e2 = kjøring { "1" } (lesning fastsatt på forhånd)

seg-abe521171d2f = Variant med GLONASS-vinkel (diagnostikk)

seg-9489ef691574 = minimum utstrålt effekt, { "13" } signaler, innenfor { "0.1" } dB

seg-4b7e0252355c = geometri for øvre SSV (tabell B4)

seg-e3c870085a6c = NOT MET ({ "43" } av { "52" } celler)

seg-b57b1f9b0b43 = alle { "52" } celler innenfor toleranse

seg-6bf57763d120 = nedre SSV (tabell { "5.2" })

seg-c9349a3a0185 = NOT MET ({ "48" } av { "52" })

seg-056eae8e55d1 = alle { "52" }

seg-805e4402f556 = øvre SSV med 15/20/25 dB-Hz (tabell B9)

seg-a8d9a1f66989 = NOT MET ({ "122" } av { "155" })

seg-7a6fd0eb8f77 = { "153" } av { "155" }

seg-cb1a6f558a09 = seks GEO-oppdrag

seg-e4759e8d2baa = NOT MET ({ "132" } av { "156" })

seg-3e59e79791e2 = alle { "156" }

seg-76d88834ab69 = HEO-oppdrag

seg-1c06414304a0 = NOT MET ({ "18" } av { "26" })

seg-b1656692859b = { "21" } av { "26" }

seg-d4cedd711485 = månoppdrag

seg-b52333886109 = NOT MET ({ "23" } av { "26" })

seg-479a041e2b62 = parametrisk mønster mot målte GPS L1-panelmønstre

seg-b514bc035c86 = NOT MET (RMS { "6.3" } til { "8.8" } dB mot { "3" } dB)

seg-dd703fdea949 = Heftet er internt selvmotsigende om GLONASS' referansevinkel utenfor siktelinjen: tabell B2 og B6 oppgir { "20" } og { "28" } grader, tabell { "4.2" } oppgir { "26" } og { "34" }. Kjøring { "1" } brukte den første (det forhåndsregistreringen navnga); nesten alle tilfellene som ikke nådde terskelen i S1 til S5 gjelder GLONASS. Varianten, bundet på forhånd som diagnostikk før den ble kjørt, bruker den andre, og da stemmer øvre SSV, nedre SSV og GEO-oppdragene celle for celle, avbrudd inkludert. Varianten erstatter ikke kjøring { "1" }. <b>Ingen rad er VALIDATED</b>: heftet er en simulering, avgjørelsesregelen krever S0 til S3 under lesningen som ble fastsatt på forhånd, og de gjenværende tilfellene som ikke nådde terskelen (GPS L1 ved { "20" } dB-Hz, HEO Galileo, QZSS og NavIC, GLONASS-radene for månen) er ikke forklart.

seg-6eecf686159b = Kjøring

seg-adbb9c22de1c = Hvert medfølgende scenario er skåret ned slik at det kjører på sekunder; sammenligningen i full størrelse er eksempelet ovenfor. Den samme typen kjører fra Python (<c1/>), nettleseren (WebAssembly), MCP-serveren (<c2/>, bare innebygd tekst: <c3/> er en filkilde og avvises, bruk <c4/>) og pluginene.

seg-8fa10c8e7ab7 = MODELLED: ingenting her ble sammenlignet med målt GNSS-mottak i bane. Heftet er en simulering.

seg-b34e9acebec0 = Keplerske tolegemebaner for GNSS-konstellasjonene og for brukeren i sveipene; månetransferen er en tolegemeellipse, ikke en propagert bane.

seg-76aa617ba828 = Mediet er en oppgitt enkel modell med rettstråleintegrasjon; det er ikke en romværvarsling.

seg-3114c4249988 = Navigasjonsfilteret er en designstudie: ingen manøvrer, ingen holdning, ingen flerveisbølger, og referansen deler sine efemerider for Sola og Månen med filteret.

seg-2deafc0f9534 = <s1>Forrige</s1>Månens referansestasjon

seg-23386861eebf = <s1>Neste</s1>Månens bane og overflate som infrastruktur
