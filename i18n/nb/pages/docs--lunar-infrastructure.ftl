# docs--lunar-infrastructure: translations (nb)

seg-cae10fb9bff8 = Scenario

seg-61817375c8ea = Månens bane og overflate som navigasjons- og geodetisk infrastruktur

seg-9872e31ebd72 = Kilder

seg-922905241a6b = Kilde: <c1/>

seg-bfb9c5efbe57 = Scenariotype <c1/>, fem studier valgt med <c2/>. <b>MODELLED</b>: en begrenset tre-legemers modell med oppgitte forenklinger og ILLUSTRATIVE inndata. Tallbehandlingen er kontrollert mot uavhengige numpy/scipy-programmer; ingenting er sammenlignet med en måling av en måneparameter, og ingenting her er en uttalelse om noe oppdrag eller system. Ikke tilknyttet eller støttet av noe romfartsbyrå. Veiledende programvare, ikke typegodkjent utstyr. Kshana sender ingenting og styrer ingen maskinvare.

seg-7908583855a2 = Utformingene, inndataene og tersklene ble fastsatt i <c1/> (committet før noen studie ble poengsatt) og to opplyste endringer (<c2/>). Utfallet for hver terskel står i <c3/>.

seg-d9d9d0864ae0 = Studie

seg-3b01a756c305 = Hva den beregner

seg-a4ef7c81b35f = Banebestemmelse om bord med jord-GNSS i en NRHO (eller <c1/>) mot uavhengig bakkebasert avstands- og avstandsrate-OD fra tre DSN-stasjoner; hvert estimats formelle kovarians; en seedet Monte Carlo av om de to kovariansene forklarer forskjellen mellom dem (q, kji-kvadrat med { "6" } frihetsgrader); en injisert umodellert akselerasjon

seg-849c67471e69 = <c1/> (rask), <c2/> (poengsatt, omtrent åtte minutter)

seg-b9c6eb8d778c = Dobbeltdifferensiert bærebølgefase for felles overflatestasjon og orbiter; kovarians for flytende flertydighet; LAMBDA; bootstrappet og Monte Carlo-suksess; sigma for flytende og fiksert posisjon

seg-74c347e0bc69 = Fisher-informasjon for det lunare datumet med 7 parametere fra avstandsmåling fra jordstasjoner, med og uten avstander fra orbiter til overflatestasjon; seedede tilfeldige stasjonssett

seg-4ed875c39781 = GNSS, VLBI og laseravstandsmåling på ett romfartøy: Cramer-Rao-presisjon for forskjellene mellom teknikkene mot feilen i den lokale koblingen

seg-de25104c09a2 = Informasjon om h2, k2, l2 og den fysiske librasjonen fra laseravstandsmåling, orbitersporing, et gravimeter og en overflateklokke (konstanter delt med modulene for månetid)

seg-18fc4ba766df = Samsvar mellom en banebestemmelse om bord med jord-GNSS i en nesten rettlinjet halobane og en uavhengig bakkebasert banebestemmelse, fra reelle kjøringer av motoren v{ $version } på scenarios/lunar-infrastructure-od-consistency.toml og varianten med modellfeil ({ "400" } forsøk hver). Gjennomsnittlig normalisert differanse q er { "5.81" } uten modellfeil og { "5.95" } med en injisert akselerasjonsfeil på { "3e-10" } m/s2, mot { "6" } forventet: de to banebestemmelsene er innbyrdes konsistente (terskel C1 MET). Andelen forsøk over { "95" } %-punktet er { "0.040" } og { "0.052" }; terskelen for å oppdage den injiserte feilen var minst { "0.5" }, så den er NOT MET (C3): løsningen om bord er kjent til omtrent { "352" } m mot { "23" } m for bakkeløsningen, så en forskyvning på ti meter skjuler seg inne i kovariansen. MODELLED: en begrenset tre-legemers modell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen måneparameter. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-4c08262e2556 = Fiksering av heltallsflertydighet i bærebølgefase mellom månens overflatestasjoner og en orbiter, fra det committede resultatet av den poengsatte kjøringen av motoren v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } buelengder, en Monte Carlo med { "400" } trekninger hver, skrevet av scenarios/carrier-phase-scored.toml). { "1" } døgn: suksess { "1.0" } % (standardfeil { "0.5" } %), { "134" } flertydigheter, sigma for orbiterposisjon { "45.6" } m flytende og { "18.5" } m fiksert; { "2" } døgn: suksess { "0.5" } % (standardfeil { "0.4" } %), { "259" } flertydigheter, sigma for orbiterposisjon { "21.5" } m flytende og { "8.7" } m fiksert; { "3" } døgn: suksess { "2.8" } % (standardfeil { "0.8" } %), { "375" } flertydigheter, sigma for orbiterposisjon { "6.3" } m flytende og { "2.1" } m fiksert. Heltallsfiksering oppnås ikke: suksessraten holder seg mellom { "1" } % og { "3" } % ved { "25" } dBi, og ved den registrerte { "12" } dBi kan problemet ikke settes opp. MODELLED: en begrenset tre-legemers modell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen måneparameter. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-7e5b10641b20 = Presisjonen til det lunare datumet med sju parametere (tre translasjoner, en skala og tre rotasjoner) fra avstandsmåling fra jordstasjoner, med og uten avstander fra orbiter til overflatestasjon, fra en reell kjøring av motoren v{ $version } på scenarios/lunar-infrastructure-frame-coestimation.toml. Cramer-Rao-sigma for translasjonene og rotasjonene synker med orbiterlinkene (for eksempel t_z fra { "0.98" } m til { "0.046" } m); den minste informasjonsegenverdien øker 111 ganger og CRLB-sporet synker til { "1.0" } % (terskel F3 MET). Dette forutsetter at banen er kjent i månens akser, med feilen båret av orbiterens avstandssigma på { "1" } m. MODELLED: en begrenset tre-legemers modell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen måneparameter. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-377d29dcc6e8 = Presisjonen til forskjellene mellom laseravstandsmåling, VLBI og GNSS-posisjoner for ett romfartøy, mot feilen i den lokale koblingen på bakken, fra en reell kjøring av motoren v{ $version } på scenarios/lunar-infrastructure-space-tie.toml (én bue på 6.56 døgn, teknikk-sigmaer GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Med en lokal kobling fra { "1" } mm til { "1" } m holder sigma for laser-minus-GNSS-translasjonen seg nær { "1.04" } m helt til koblingen når { "1" } m: den begrenses av teknikkenes målestøy, ikke av den lokale koblingen. Gulvet som koblingen alene setter er kvadratroten av to ganger dens sigma. MODELLED: en begrenset tre-legemers modell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen måneparameter. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-9d507a371319 = Hvilken observabelfamilie som er følsom for Love-tallene h2, k2 og l2 for Månen, fra en reell kjøring av motoren v{ $version } på scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Hver celle er RMS-partiellderiverten av en families observasjoner med hensyn til en parameter, i familiens egne enheter (så celler sammenlignes langs en rad, ikke nedover en kolonne); en strek betyr at familien ikke har noen følsomhet. laseravstandsmåling: h2 { "7.6" }, k2 ingen, l2 { "9.8" }. orbitersporing: h2 ingen, k2 { "0.00086" }, l2 ingen. overflategravimeter: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 ingen. overflateklokke: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 ingen. Med alle fire familiene er Cramer-Rao-sigma { "0.36" } % av nominell h2, { "0.52" } % av k2 og { "1.16" } % av l2. Å legge til en familie senket aldri den minste egenverdien ({ "28" } av { "28" } tillegg), men sporet av pseudoinversen var ikke større i bare { "16" } av { "28" }: den halvdelen av terskel G3 er NOT MET. Orbiterfamilien ser linjeintegralet langs siktlinjen av k2-akselerasjonen, et tall i den øvre enden. MODELLED: en begrenset tre-legemers modell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen måneparameter. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-570b9276834b = Oppgitte forenklinger

seg-ab053aadb65d = Jorden og Månen som punktmasser i en sirkelbane, ingen Sol, ingen harmoniske ledd i månens gravitasjon; jordens rotasjonsakse er banenormalen; det inertielle referansesystemet er lik det roterende ved t = { "0" }; en kuleformet Måne; et synkront månereferansesystem (ingen librasjon) unntatt i <c1/>; banen holdes kjent i månens akser i <c2/> (feilen bæres av orbiterens avstandssigma); orbiterfamilien i <c3/> ser linjeintegralet langs siktlinjen av k2-akselerasjonen etter at en konstant og en lineær trend er fjernet, et tall i den øvre enden.

seg-fd644b1f33ec = Rapportens form

seg-03efc65cbb0e = Hver rapport inneholder <c1/>, <c2/>, <c3/>, <c4/>, studiens felt og en <c5/>-blokk (en enhet og en opphavsklasse for hvert numeriske felt). Ingen tidsserier per tidspunkt sendes ut. Feltlister: <c6/>-blokken i hver rapport, og <c7/>.

seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), brukt som nominell verdi. h2 og l2 er linearisasjonspunkter, ikke verifiserte verdier. DSN-stasjonskoordinatene er ITRF93-verdiene i kommentarene til NAIF-kjernen <c1/>; DSN-nøyaktighetsbåndene er bare lest fra søkesammendrag. Konseptet med romkobling følger de offentlige beskrivelsene av GRASP og ESA Genesis. Hele tabellen, med hvordan hver verdi ble lest, står i forhåndsregistreringen.

seg-6cd670ae6eea = Resultater i korte trekk (se RESULTS.md)

seg-6334f82991d3 = Ikke nådd, og låst av tester som slår fast bommen: C3 (måltallet for den injiserte feilen utløses ikke ved { "3e-10" } m/s2), halvdelen om bootstrappet rate i Q3 ved { "1e-9" }, og halvdelen om CRLB-spor i G3. Fiksering av heltallsflertydighet oppnås ikke ved de registrerte inndataene. Ingenting er VALIDATED.

seg-1d3bffc2fd02 = <s1>Forrige</s1>Navigasjon for rombrukere (gnss-ssv)

seg-90932eed0074 = <s1>Neste</s1>Posisjonering, navigasjon og tidssynkronisering i LEO
