# docs--leo-pass: translations (nb)

seg-cae10fb9bff8 = Scenario

seg-cbf0f9bcd2d8 = Uavhengig referanse

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Kilde

seg-587beeccaa11 = Forhåndsinnstilling

seg-1ff32b87e030 = Satellitter

seg-a6c63abeb7e6 = Medfølgende scenarioer

seg-2b0d77219437 = Forhåndsinnstillinger

seg-5566e1d71a4f = Bane

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-c5ce76c91ff7 = Merkelapp

seg-813d372bda81 = Kilde: <c1/>

seg-0bd4af67ffdb = LEO-passering og linkbudsjett (<c1/>)

seg-30417c63c48e = LEO-PNT er posisjonering, navigasjon og tidssynkronisering (PNT) fra satellitter i lav jordbane (LEO). Typen <c1/> simulerer én eller flere LEO-satellittpasseringer over en bruker og regner ut linkbudsjettet bånd for bånd, ved siden av GNSS-satellittene (globalt satellittnavigasjonssystem) i middels høy jordbane (MEO) som er i sikte. Motoren er <b>systemuavhengig</b>: enhver konstellasjon, enhver signalutforming og ethvert bånd, skrevet rett inn i et scenario. Navngitte systemer er valgfrie forhåndsinnstillinger, hver i sin egen fil med sin kilde.

seg-242c84daecb0 = Kode: <a1><c1/></a1> (typen) og <a2><c2/></a2> (offentlige byggeklosser som andre moduler kan kalle).

seg-0e6b09e372f5 = Scenarioer: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> og det valgfrie <c8/> (resultater i <a1>Medfølgende scenarioer</a1>). Typen er også medlem av kampanjene <c9/>, <c10/>, <c11/> og av hvert <c12/>-scenario, og passeringstrinnet i typen <c13/>.

seg-59cebed2f589 = Oversikt over hver LEO-PNT-type og hvert LEO-PNT-scenario: <a1>LEO-PNT.md</a1>.

seg-9646ce17cddf = Uavhengige referanser: <a1><c1/></a1>, testdata i <c2/> med kilde-URL-ene sine.

seg-c1020ac47091 = Hva én kjøring beregner

seg-10dedc607eac = For hver LEO-satellitt, hvert bånd og hver epoke:

seg-35bf9a48e566 = Størrelse

seg-b0f12ee05fe9 = Elevasjon, asimut, avstand

seg-24ad909c4fb8 = WGS-84-bruker (World Geodetic System { "1984" }), satellitt i et treghetssystem som er på linje med det jordfaste systemet ved epoken

seg-c9f61c3348ef = beregnet

seg-ebd800ec3d47 = Avstandsrate <c1/>, avstandsakselerasjon <c2/>

seg-232b42b71f03 = lukket form; hver kjøring kontrollerer begge mot sentrale differanser av den propagerte avstanden og rapporterer den største forskjellen

seg-b3a55e868346 = lukket form

seg-3f1f90a57c2f = Doppler <c1/>, Doppler-rate <c2/>

seg-852b6c351ce4 = førsteordens, per bånd

seg-4eb4b779679b = Fririmstap

seg-31f67bcd2d50 = Friis, <c1/>

seg-fb5f06a91de1 = Satellittens EIRP (ekvivalent isotropisk utstrålt effekt) og mønster

seg-883702244778 = isoflux til en kantelevasjon, gaussisk hovedlobe <c1/> dB, eller flat

seg-b6e91c5252d3 = Brukerantenne

seg-ed92a0abf62f = patch <c1/> dBic, halvkuleformet eller isotropisk

seg-0ac54d232e0a = Gassdemping

seg-30fb5b0a0bc7 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 Annex { "2" } forenklede uttrykk (erstattet av P.676-13, hvis tabulerte koeffisienter motoren ikke har)

seg-58d58478e9eb = Regndemping

seg-4c1e413d5fc3 = ITU-R P.838-3-koeffisienter og prosedyren i P.618-14 § { "2.2.1.1" }, ut fra en regnrate R0.01 og en reghøyde

seg-dab78c0552b6 = Troposfærisk scintillasjon

seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; under { "4" } GHz en ekstrapolering, merket i rapporten

seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

seg-32dddfdba584 = Tap ved inntrenging i bygning (innendørs bruker)

seg-ef9025622e81 = ITU-R P.2109-2, tradisjonell eller termisk effektiv, ved elevasjonen til banen ved fasaden

seg-c7d1bccd4d51 = Polarisasjonsavvik

seg-f4aaea269382 = polarisasjonstapsfaktor ut fra aksialforhold og dreieretninger, midlet over ellipsens orientering

seg-96601850a9d5 = Systemets støytemperatur

seg-82735c7f3ea5 = antennens gulv + himmelemisjon fra den absorberende banen ({ "275" } K) + kosmisk { "2.7" } K + mottaker <c1/>

seg-53ce973b0ee7 = C/N0 (bærebølge-til-støy-tetthet)

seg-fa01d060cf1a = Ionosfærisk gruppeforsinkelse

seg-33f2113dea70 = <c1/>, STEC (totalt elektroninnhold langs siktlinjen) fra Klobuchar-modellen eller et vertikalt totalt elektroninnhold (TEC), skalert med andelen av et Chapman-lag som ligger under satellitten

seg-431dfeb5edba = skalering VALIDATED, TEC MODELLED

seg-56df31449434 = Per båndpar: de ionosfærefrie koeffisientene, støyforsterkningen <c1/> og den termiske kodestøyen for hvert bånd og for kombinasjonen ved passeringens topp. MEO GNSS-sammenligningen bruker samme brukerantenne og mottaker, med hvert signals minste mottatte effekt i grensesnittdokumentet (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, Issue { "2.1" } Table { "12" }; GPS fra IS-GPS-200 og IS-GPS-705), pluss et oppgitt tillegg, skalert med avstanden. Den valgfrie delen <c2/> (tingenes internett) gir tid til første posisjonsbestemmelse, energi per posisjonsbestemmelse og batterilevetid mot driftssyklus for et oppgitt effektbudsjett for mottakeren (MODELLED, hver antakelse er en inndata og står i rapporten).

seg-7132ede02109 = <c1/> (standard): en sirkulær bane plassert slik at brukeren ser én passering med en valgt maksimal elevasjon på et valgt tidspunkt, stigende eller synkende, øst eller vest for brukeren; banehellingen kan være solsynkron.

seg-688307acbf0d = <c1/>: eksplisitte Kepler-elementer.

seg-e9085739bcb8 = <c1/>: et tolinjers elementsett (TLE) gjennom motorens SGP4-propagator (Simplified General Perturbations { "4" }).

seg-7dcc5fdbc249 = <c1/>: en Walker-konstellasjon bygd av koden <c2/> (dens <c3/>, eller forhåndsinnstillingens skall); de høyeste passeringene i vinduet rapporteres.

seg-ec7e163dd073 = Bånd og signalutforminger

seg-4d49743b3544 = Bånd: <c1/> med en valgfri delmengde <c2/>, og <c3/>-oppføringer som legger til et bånd eller overstyrer et hvilket som helst felt i et forhåndsinnstilt bånd. <c4/> med bare <c5/>-oppføringer bruker ingen forhåndsinnstilling i det hele tatt.

seg-bd1e114aaea6 = Et bånd kan også navngi en <c1/>-utforming (<c2/>, en hvilken som helst utforming under <c3/>, eller en som typen <c4/> leverer; se <a1>LEO-SIGNAL.md</a1>). Båndet overtar da utformingens senterfrekvens (med mindre <c5/> er oppgitt), sendebåndbredde og brikketakt for den sporede komponenten, fordeler EIRP-en på utformingens komponenter etter effektandelene deres, og rapporterer ved hver epoke den sporede komponentens C/N0 og dens båndbegrensede early-late-kodesporingsjitter (Betz og Kolodziejski { "2009" }, formelen til typen <c6/>) som avstandsfeilen.

seg-1d96501bb12d = Hver forhåndsinnstilling merker tallene sine PUBLIC (med URL), REPRESENTATIVE (et dokumentert utformingsvalg, aldri en påstand om et virkelig system) eller WORKSHOP.

seg-f708914fed48 = Bånd

seg-6459abcaeebe = <c1/> (standard)

seg-a0dab2ebeb1b = REPRESENTATIVE; L-, S- og C-bærebølger fra offentlige dokumenter

seg-cd0075385395 = UHF { "450" } MHz (representativ), L { "1191.795" } MHz (Galileo E5-senter), S { "2492.028" } MHz (NavIC S, S-båndbærebølgen til Navigation with Indian Constellation), C { "5020" } MHz (senter av tildelingen { "5010" }–{ "5030" } MHz for RNSS (radionavigasjonssatellitttjenesten)), hver { "0" } dBW

seg-3f0de4312fcb = { "550" } km solsynkron, Walker 240/12/1

seg-486f17197d4d = REPRESENTATIVE, for C-båndssystemer der parametrene ikke er offentlige (for eksempel TrustPoint)

seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (binær faseskiftmodulasjon med { "10" } × { "1.023" } Mchip/s), isoflux

seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> tabellene { "1" }–{ "2" }

seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP fra den publiserte minste mottatte effekten ved { "10" }°

seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) og { "97" }° ({ "66" })

seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> og den publiserte banen

seg-c995dade5aa6 = Satellite Time and Location (STL) ved { "1621" } MHz (midt i { "1616" }–{ "1626" } MHz); EIRP fra «{ "300" } ganger GPS»

seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } i { "6" } baneplan

seg-ad0ba129439b = PUBLIC signaltall (<a1>NAVIGATION { "72" }({ "1" })</a1>), REPRESENTATIVE bane og EIRP

seg-1931203a036c = Ku { "240" } MHz-fyr, bare Doppler

seg-0533710bbbe1 = PUBLIC signalstruktur (<a1>PMC10301026</a1>), REPRESENTATIVE bane og EIRP

seg-cee286338f01 = BPSK { "2.046" } Mchip/s nær L1 og L5

seg-fe3cdce92b31 = { "1000" } km, { "55" }°

seg-03d5ae448705 = <c1/> (valgfri)

seg-800f173f2b20 = WORKSHOP signalparametere, PUBLIC bane

seg-e8626249e708 = sju bånd i konfigurasjon #1

seg-cb29553176c7 = { "510" } km solsynkron

seg-10f79909a5bc = <b>Forhåndsinnstillingen for Celeste IOD (demonstrasjon i bane) er valgfri.</b> Signalparametrene ble presentert på workshopen for LEO-PNT i ESA Navigation Innovation and Support Programme (NAVISP) i Den europeiske romorganisasjonen (ESA), { "2026" }, og har ennå ingen offentlig kilde; de ligger i modulen <c1/> i <c2/>, brukt av <c3/>. Slik holdes forhåndsinnstillingen tilbake: hvert tall fra workshopen i motoren ligger i én fil, <c4/>, som <c5/> bare kompilerer inn når den finnes, og i scenarioene <c6/> som bare finnes i repositoriet. Når den filen og de scenarioene slettes, holdes forhåndsinnstillingen tilbake uten kildeendring; alle andre tester, uavhengige referanser og scenarioer kjører uten den, og antallet scenariofiler i README teller fortsatt de tilbakeholdte filene. EIRP og stråle er kalibrert mot et C/N0-forløp vist på workshopen, så det scenarioet gjengir forløpet per konstruksjon.

seg-9f9ff4fe18f8 = ATOMIC-modellen med «null klokke»-polynom for kringkastet efemeride er en forhåndsinnstilling for navigasjonsmeldinger og er ikke en del av denne typen.

seg-dc496b16046b = Observasjonen LEO mot GNSS

seg-6be559b1ac29 = <c1/> gjengir kvalitativt det LEO-PNT-demonstrasjoner viser: LEO-C/N0 stiger og faller i en klokkeform som holder seg over masken i { "590" } s og har topp på { "56.8" } dB-Hz, { "8.9" } dB over medianen av de flate MEO GNSS-bærebølgene (Galileo E1, { "40.5" } til { "52.0" } dB-Hz, median { "47.8" } dB-Hz). Marginen kommer fra avstanden, ikke fra en sterkere sender: ved passeringens topp er satellitten { "569" } km unna, omtrent { "40" } ganger nærmere enn en Galileo-satellitt i senit ({ "23 222" } km), som gir { "32" } dB mindre fririmstap; standardforhåndsinnstillingen stråler ut { "0" } dBW ({ "1" } W).
