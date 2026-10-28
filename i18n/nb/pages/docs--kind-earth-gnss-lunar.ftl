# docs--kind-earth-gnss-lunar: translations (nb)

seg-37d29d8303fe = km

seg-b054c73f22e5 = ingen verdi

seg-59afd80736c5 = <b>PARTNER</b> Ikke levert — Kshana modellerer signalytelse, ikke nyttelast- eller antennemaskinvare. Uavhengig referanse (NoneKind): ingen: en disiplin som eies av partneren, uten modul og uten test etter utforming

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-9a399fed06c4 = Kilde: <c1/>

seg-886b3796afaa = <c1/> (scenariotype)

seg-c8a8be4b8894 = Mottak av jord-GNSS på månens avstand, det svakesignal-laget som artikkelen om robusthet i konflikt nevner og som motoren ikke hadde noen modell for. En GNSS-satellitt peker antennen mot jorden; en mottaker nær Månen befinner seg omtrent femten ganger banens radius unna, så tre ting slår inn samtidig. Jorden SKJULER BORESIGHT: fra { "26,560" } km spenner den en halvvinkel på { "13.9" } deg, så enhver stråle mot Månen må forlate senderen minst så langt fra nadir, noe som fjerner toppen av loben før noen effekt er beregnet. Det som gjenstår er HOVEDLOBENS KANT OG SIDELOBENE, regimet LuGRE-nyttelasten faktisk opererte i i løpet av { "2025" }. Og frirom-tapet er omtrent { "208" } dB ved L1, omtrent { "25" } dB mer enn en terrestrisk bruker betaler. Rapporten sender ut én rad per satellitt (vinkel utenfor boresight, jordokkultasjon, avstand, banetap, sendeforsterkning ved den vinkelen, mottatt effekt, bærebølge-til-støytetthet) og aggregerer bare linkene som klarer sporingsterskelen. DEN RAPPORTERER OGSÅ KONDISJONERINGEN, fordi det er den som definerer dette laget: hver synlig satellitt ligger innenfor en kjegle på et par grader sett fra Månen, så siktelinjene er nesten parallelle, presisjonsfortynningen er enorm, og en jord-GNSS-posisjonsbestemmelse på månens avstand er en observasjon av TIDSSYNKRONISERING-kvalitet mye mer enn av posisjonskvalitet. MODELLED, og sendemønsteret er grunnen: forsterkningen ved vinkelen er en jevn sirkulær apertur (Airy), mens en virkelig GPS L1-antenne er en helikal gruppe med tolv elementer med en formet hovedlobe og ikke-Airy-sidelober. Målte mønstre finnes og er ikke inkludert her, så rekkefølger og størrelsesordener er meningsfulle mens dB for en enkelt satellitt ikke er det. Med vilje FRAVÆRENDE, og hver gjør budsjettet optimistisk: intet ionosfærisk eller troposfærisk tap på stråler som streifer limben, ingen polarisasjons-, peke- eller implementeringstap, og en sfærisk jord uten refraktiv utvidelse. Månens posisjon er en INNDATA (avstand pluss treghetsretning) i stedet for et oppslag i en efemeride, fordi størrelsen som testes er linken og stråle-geometrien. Å oppgradere denne raden til validert krever et målt sendemønster og LuGRE-normalpunkter; ingen av dem finnes i repositoriet, og ingen av dem er funnet på her.

seg-75b6814c0091 = Én kjøring av <c1/> oppsummeres som: Earth-GNSS at lunar distance — { "24" } satellites, receiver at { "384400" } km Earth limb from the constellation: { "13.90" } deg off nadir — any lunar-bound ray must exceed this { "22" } of { "24" } not occulted; { "0" } clear the { "25.0" } dB-Hz tracking threshold no link reaches the threshold fewer than two trackable links; no angular spread to report fewer than four trackable links, or a singular geometry: no DOP SWEEP over { "64" } epochs / { "43082" } s: signal availability { "0.375" }, FIX availability { "0.000" } trackable links mean { "0.75" }, max { "2" }; best C/N0 { "30.93" } dB-Hz; best PDOP none Take the FIX availability as this layer's prior, not the signal availability: one link is a clock observation, four are a position. MODELLED: the transmit gain is a uniform-aperture (Airy) stand-in, not a measured GPS beam, and no atmospheric, polarisation or implementation loss is applied — so the budget here is optimistic. Orders of magnitude and orderings are meaningful; an individual satellite's dB is not.

seg-6c0897da2efa = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-8c6bb203352d = Eksempelet <c1/> setter blant annet:

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-cf1dce5fc824 = Diagrammet motoren skriver for scenarios/earth-gnss-lunar.toml, typen earth-gnss-lunar

seg-04f59a1e2ec2 = <b>MODELLED</b> Mottak av jord-GNSS på månens avstand: svakesignal-laget P7 tabell { "1" } nevner og som motoren ikke hadde noen modell for.

seg-9531f6b14fc8 = <b>MODELLED</b> Mottak av jord-GNSS på månens avstand: svakesignal-laget P7 tabell { "1" } nevner og som motoren ikke hadde noen modell for. Per satellitt og per epoke beregner den off-. Uavhengig referanse (InternalConsistency): Lukkede identiteter og intern konsistens; INGEN ekstern uavhengig referanse påstås. Limbens halvvinkel er kontrollert mot asin(R_earth/r_orbit) og geometrien mot den; frirom-tapet, DOP-kjernen og SGP4-propageringen som dette setter sammen er hver for seg eksternt validert i sine egne rader, og denne raden låner ikke deres status. HVORFOR MODELLED, og det er sendemønsteret: forsterkningen ved vinkelen er en jevnt belyst

seg-6dfc5503f58f = MODELLED, og sendemønsteret er grunnen: forsterkningen ved vinkelen er en jevn sirkulær apertur (Airy), mens en virkelig GPS L1-antenne er en helikal gruppe med tolv elementer med en formet hovedlobe og ikke-Airy-sidelober. (typekatalog (<c1/>))

seg-c40d3fd8c12e = HVA SOM ER MODELLED, OG HVORFOR DET IKKE ER VALIDATED Sendeforsterkningen ved vinkelen er en jevnt belyst sirkulær apertur — et Airy-mønster. En virkelig GPS L1-antenne er en helikal gruppe med tolv elementer hvis målte mønster har en formet hovedlobe, med vilje toppet utenfor boresight for å jevne ut effekten over jordskiven, og sidelober som slett ikke er Airy. Målte mønstre er publisert; de er ikke inkludert i denne (kommentar i scenariofilen, linje { "29" } til { "35" })

seg-01fa469abd95 = Jord-GNSS på månens avstand er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-2fd936b76f4a = <s1>Forrige</s1>contact-schedule

seg-95a5aa0adeb3 = <s1>Neste</s1>entry-heating

seg-a349aa76b0ed = PARTNER
