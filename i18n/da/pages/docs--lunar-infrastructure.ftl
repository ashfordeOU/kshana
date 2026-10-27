# docs--lunar-infrastructure: translations (da)

seg-cae10fb9bff8 = Scenarie

seg-61817375c8ea = Månens bane og overflade som navigations- og geodætisk infrastruktur

seg-9872e31ebd72 = Kilder

seg-922905241a6b = Kilde: <c1/>

seg-bfb9c5efbe57 = Scenarietype <c1/>, fem undersøgelser valgt med <c2/>. <b>MODELLED</b>: en begrænset tre-legeme-model med angivne forenklinger og ILLUSTRATIVE inputs. Numerikken er kontrolleret mod uafhængige numpy/scipy-programmer; intet sammenlignes med en måling af en månestørrelse, og intet her er en udtalelse om nogen mission eller noget system. Ikke tilknyttet eller støttet af nogen myndighed. Vejledende software, ikke typegodkendt udstyr. Kshana udsender intet og styrer ingen hardware.

seg-7908583855a2 = Udformningerne, inputtene og tærsklerne blev fastlagt i <c1/> (committet, før nogen undersøgelse blev bedømt) og to offentliggjorte ændringer (<c2/>). Udfaldet for hver tærskel står i <c3/>.

seg-d9d9d0864ae0 = Undersøgelse

seg-3b01a756c305 = Hvad den beregner

seg-a4ef7c81b35f = Banebestemmelse om bord med Jord-GNSS i en NRHO (eller <c1/>) mod uafhængig banebestemmelse fra jorden ud fra afstand og afstandsrate fra tre DSN-stationer; hvert estimats formelle kovarians; en seedet Monte Carlo af, om de to kovarianser forklarer deres forskel (q, chi-i-anden med { "6" } frihedsgrader); en injiceret ikke-modelleret acceleration

seg-849c67471e69 = <c1/> (hurtig), <c2/> (bedømt, cirka otte minutter)

seg-b9c6eb8d778c = Fælles dobbeltdifferentieret bærebølgefase mellem overfladestationer og en orbiter; kovarians for flydende multiplicitet; LAMBDA; bootstrappet og Monte Carlo-succes; positionssigma som flydende og fastlåst

seg-74c347e0bc69 = Fisher-information for det 7-parameter månedatum ud fra afstandsmåling fra jordstationer, med og uden afstande mellem orbiter og overfladestation; seedede tilfældige stationssæt

seg-4ed875c39781 = GNSS, VLBI og laserafstandsmåling på ét rumfartøj: Cramer-Rao-præcision for forskellene mellem teknikkerne i forhold til fejlen i den lokale forbindelse

seg-de25104c09a2 = Information om h2, k2, l2 og den fysiske libration fra laserafstandsmåling, orbitersporing, et gravimeter og et overfladeur (konstanter delt med månetidsmodulerne)

seg-18fc4ba766df = Konsistens mellem en banebestemmelse om bord med Jord-GNSS i en næsten retlinet halobane og en uafhængig banebestemmelse fra jorden, fra rigtige kørsler af motor v{ $version } på scenarios/lunar-infrastructure-od-consistency.toml og varianten med modelfejl ({ "400" } forsøg hver). Den gennemsnitlige normaliserede forskel q er { "5.81" } uden modelfejl og { "5.95" } med en injiceret accelerationsfejl på { "3e-10" } m/s2, mod { "6" } forventet: de to banebestemmelser er konsistente (tærskel C1 MET). Andelen af forsøg over { "95" } %-punktet er { "0.040" } og { "0.052" }; tærsklen for at opdage den injicerede fejl var mindst { "0.5" }, så den er NOT MET (C3): løsningen om bord er kendt til cirka { "352" } m mod { "23" } m for den fra jorden, så en forskydning på ti meter skjuler sig inden for dens kovarians. MODELLED: en begrænset tre-legeme-model med angivne forenklinger og illustrative inputs, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life).

seg-4c08262e2556 = Fastlåsning af heltalsmultiplicitet i bærebølgefasen mellem månens overfladestationer og en orbiter, fra det committede resultat af den bedømte kørsel af motor v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } buelængder, en Monte Carlo med { "400" } træk hver, skrevet af scenarios/carrier-phase-scored.toml). { "1" } dag: succes { "1.0" } % (standardfejl { "0.5" } %), { "134" } multiplicitetsværdier, orbiterens positionssigma { "45.6" } m flydende og { "18.5" } m fastlåst; { "2" } dage: succes { "0.5" } % (standardfejl { "0.4" } %), { "259" } multiplicitetsværdier, orbiterens positionssigma { "21.5" } m flydende og { "8.7" } m fastlåst; { "3" } dage: succes { "2.8" } % (standardfejl { "0.8" } %), { "375" } multiplicitetsværdier, orbiterens positionssigma { "6.3" } m flydende og { "2.1" } m fastlåst. Heltalsfastlåsning opnås ikke: succesen forbliver mellem { "1" } % og { "3" } % ved { "25" } dBi, og ved de registrerede { "12" } dBi kan problemet ikke opstilles. MODELLED: en begrænset tre-legeme-model med angivne forenklinger og illustrative inputs, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life).

seg-7e5b10641b20 = Præcision af det syvparameter månedatum (tre translationer, en skala og tre rotationer) ud fra afstandsmåling fra jordstationer, med og uden afstande mellem orbiter og overfladestation, fra en rigtig kørsel af motor v{ $version } på scenarios/lunar-infrastructure-frame-coestimation.toml. Cramer-Rao-sigma for translationerne og rotationerne falder med orbiterlinkene (for eksempel t_z fra { "0.98" } m til { "0.046" } m); den mindste informationsegenværdi stiger 111 gange, og CRLB-sporet falder til { "1.0" } % (tærskel F3 MET). Det forudsætter, at banen er kendt i månens akser, med dens fejl båret af orbiterens afstandssigma på { "1" } m. MODELLED: en begrænset tre-legeme-model med angivne forenklinger og illustrative inputs, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life).

seg-377d29dcc6e8 = Præcision af forskellene mellem laserafstandsmåling, VLBI og GNSS-positioner for ét rumfartøj, i forhold til fejlen i den lokale forbindelse på jorden, fra en rigtig kørsel af motor v{ $version } på scenarios/lunar-infrastructure-space-tie.toml (én bue på 6.56 dage, teknikkernes sigma GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Med en lokal forbindelse fra { "1" } mm til { "1" } m forbliver translationssigma for laser minus GNSS nær { "1.04" } m, indtil forbindelsen når { "1" } m: den er begrænset af teknikkernes målestøj, ikke af den lokale forbindelse. Gulvet, som forbindelsen alene sætter, er kvadratroden af to gange dens sigma. MODELLED: en begrænset tre-legeme-model med angivne forenklinger og illustrative inputs, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life).

seg-9d507a371319 = Hvilken observationsfamilie der er følsom over for månens Love-tal h2, k2 og l2, fra en rigtig kørsel af motor v{ $version } på scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Hver celle er den kvadratiske middelværdi (RMS) af den partielle afledede af en families observationer med hensyn til en parameter, i den families egne enheder (så celler sammenlignes henover en række, ikke ned ad en kolonne); en tankestreg betyder, at familien ikke har nogen følsomhed. laserafstandsmåling: h2 { "7.6" }, k2 ingen, l2 { "9.8" }. orbitersporing: h2 ingen, k2 { "0.00086" }, l2 ingen. overfladegravimeter: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 ingen. overfladeur: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 ingen. Med alle fire familier er Cramer-Rao-sigma { "0.36" } % af nominelt h2, { "0.52" } % af k2 og { "1.16" } % af l2. Tilføjelse af en familie sænkede aldrig den mindste egenværdi ({ "28" } af { "28" } tilføjelser), men sporet af pseudoinversen var kun ikke større i { "16" } af { "28" }: den halvdel af tærskel G3 er NOT MET. Orbiterfamilien ser linjesigtsintegralet af k2-accelerationen, et tal i den høje ende. MODELLED: en begrænset tre-legeme-model med angivne forenklinger og illustrative inputs, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life).

seg-570b9276834b = Angivne forenklinger

seg-ab053aadb65d = Jord og Måne som punktmasser i en cirkulær bane, ingen Sol, ingen harmoniske led i månens tyngdefelt; Jordens rotationsakse er banenormalen; det inertielle system er lig med det roterende system ved t = { "0" }; en kugleformet Måne; et synkront månesystem (ingen libration) undtagen i <c1/>; banen holdes kendt i månens akser i <c2/> (dens fejl bæres af orbiterens afstandssigma); orbiterfamilien i <c3/> ser linjesigtsintegralet af k2-accelerationen, efter at en konstant og en lineær trend er fjernet, et tal i den høje ende.

seg-fd644b1f33ec = Rapportens form

seg-03efc65cbb0e = Hver rapport indeholder <c1/>, <c2/>, <c3/>, <c4/>, undersøgelsens felter og en <c5/>-blok (en enhed og en proveniensklasse for hvert numerisk felt). Der udsendes ingen tidsserier pr. tidspunkt. Feltlister: <c6/>-blokken i hver rapport og <c7/>.

seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), brugt som nominel værdi. h2 og l2 er linearisationspunkter, ikke verificerede værdier. DSN-stationernes koordinater er ITRF93-værdierne i kommentarerne i NAIF-kernen <c1/>; DSN's nøjagtighedsbånd er kun læst fra søgeresuméer. Konceptet med forbindelse i rummet følger de offentlige beskrivelser af GRASP og ESA Genesis. Den fulde tabel, med hvordan hver værdi er læst, står i præregistreringen.

seg-6cd670ae6eea = Resultater i overblik (se RESULTS.md)

seg-6334f82991d3 = Ikke nået, og fastholdt af tests, der hævder, at tærsklen er misset: C3 (metrikken for den injicerede fejl udløses ikke ved { "3e-10" } m/s2), halvdelen af Q3 med den bootstrappede rate ved { "1e-9" } og halvdelen af G3 med CRLB-sporet. Fastlåsning af heltalsmultiplicitet opnås ikke ved de registrerede inputs. Intet er VALIDATED.

seg-1d3bffc2fd02 = <s1>Forrige</s1>Navigation for brugere i rummet (gnss-ssv)

seg-90932eed0074 = <s1>Næste</s1>Positionering, navigation og tidssynkronisering i LEO
