# docs--mission-thread: translations (nb)

seg-e27476e37522 = Jorden

seg-34bdcfd66ded = I repositoriegrenen disse dokumentene kommer fra; ennå ikke på GitHub

seg-092dd691ca17 = Rapporten

seg-f942b36a11c4 = Ikke på GitHub ennå

seg-b03d56f501c3 = Type

seg-2afa300864a9 = Parametere

seg-b7cf72949a21 = Kilde: <c1/>

seg-32755afa0f78 = Oppdragstråden

seg-d4af67363efc = Veiledende programvare, ikke sertifisert navigasjonsutstyr. Bare offentlige kilder; ikke tilknyttet eller støttet av noe romfartsbyrå, og ingenting her hevder samsvar med noe programs krav.

seg-816770c97995 = <c1/> kjeder sammen faser av et oppdrag, hver én av åtte registrerte typer med egne sensorer og eget filter, og rapporterer <b>budsjettet for navigasjons- og tidsfeil</b> for hele kjeden: for hver fase 1-sigma for posisjon, hastighet og klokkebias ved inngang, ved toppen og ved utgang; hvert bidrag til det, med sin enhet; marginen mot et krav du oppgir; det svakeste leddet; de daterte hendelsene; og en tidslinjefigur. Hvert tall er <b>MODELLED</b>: en oppgitt inndata eller en modell av en. De eneste radene med ekstern uavhengig referanse står i <s1><c2/></s1> og sier hva de tester.

seg-c29a19879c84 = Kjør eksempelet fra en utsjekking (det leser et innsjekket månekjerneutsnitt):

seg-00f84b734853 = Dokumentet

seg-9979b2c873df = <b>Et dokument avvises, det gjettes ikke på,</b> når en fase-id gjentas, en liste <c1/> er tom, et navn er ukjent, en modellnøkkel ikke er en typen kjenner, en lengdenøkkel er uenig med <c2/>, eller en fase oppgir en kilde modellen ikke gir tall for.

seg-9b1e6ac618b5 = Hva en overlevering gjør

seg-0e965f3e30fa = Tilstanden som føres videre er den fulle 6x6-kovariansen for <c1/> i SI-enheter, klokken (bias, drift og deres kovarians, merket med en tidsskala), rammen, oppdragstiden og en evidensetikett. En overlevering nullstiller aldri en kovarians.

seg-47599d03571d = Regel

seg-023113cc5afb = fører tilstanden videre uendret

seg-43967d0b6dd8 = hvit akselerasjonsstøy med PSD <c1/> over <c2/> på en rettlinjet modell; raden oppgir begge

seg-2c791ab0fd0f = dødregning i <c1/>, så settes en akse til kildegulvet bare der gulvet er mindre; aldri under gulvet, aldri en nullstilling

seg-36b9117f5379 = Rammer og tidsskalaer

seg-5853aaba827f = Tråden omregner ved overleveringen, aldri inne i en fase, og hver omregning er en egen budsjettrad. Rammer: GCRF, MCI, MCMF (ITRF og LVLH avvises med begrunnelse). <c1/> forskyver origo med Månens geosentriske tilstand: tilstanden av DE440-klasse fra kjerneutsnittet der det dekker epoken (stand-in { "5" } m og { "1" } mm/s; målt verst { "2.6" } m mot festede JPL Horizons-verdier), ellers den analytiske serien med sin målte RMS på { "195.7" } km, som raden oppgir; et lunart eksempel må derfor ha et kjerneutsnitt som dekker epoken. <c2/> er den midlere siderale rotasjonen med aksene innrettet ved epoken og uten librasjon. Tidsskalaer går gjennom TT: <c3/> eksakt, <c4/> legger til { "14" } us, <c5/> bruker den sekulære raten fra <c6/> med båndet på { "56" } til { "59" } us/døgn som ratens usikkerhet.

seg-5ee610d8ab89 = De åtte fasetypene

seg-70b73f1acebf = Segment

seg-0e39a468de1d = drevet stigning til en parkeringsbane: kovarians med konstant hastighet og hvit akselerasjonsstøy, GNSS-innhenting og svekkelse, klokke-holdover

seg-d359ae5982a6 = <c1/>-nøkler i <c2/>

seg-57c44fd6e061 = relativ navigasjon over sensorstrekk: Clohessy-Wiltshire-overgang i LVLH, 6x6 Kalman-kovarians, dokkingvindu

seg-7dce961e2c67 = under

seg-4b233c6cdf8b = TLI-brenn og cislunar ferd: Cowell-propagering, endelig-differanse-tilstandsovergangsmatrise, oppdateringer fra gnss-ssv og bakkesporing

seg-352e27d02c86 = returferd til gjeninntredensgrensesnittet; sigma for banevinkel, korridorsannsynlighet, topp-retardasjon, fotavtrykk

seg-95eb34012fe8 = lunar

seg-cc72d2fc8a43 = relativ navigasjon til dokking i en månebane

seg-2cfa6846c937 = budsjett for landingsspredning ved et polarsted

seg-e9f5fc58fe12 = samme

seg-ba3c65a210dd = PNT og tilgjengelighet av tidssynkronisering på overflaten etter sted og årstid

seg-8b9c5124dd3c = drevet stigning til en innsettingsbane

seg-4ce0fa85457c = De lunare typene er også frittstående scenariotyper; utformingen og evidensen står i <a1><c1/></a1>.

seg-d16877f38793 = Budsjettet bærer de <b>relative</b> sigmaene; jagerfartøyets absolutte kovarians føres videre uendret, og en rad sier fra om det, fordi denne fasen måler fartøyene mot hverandre, ikke mot Jorden. Den relative startkovariansen er jagerfartøyets absolutte pluss målfartøyets oppgitte sigmaer, lagt sammen som om de var uavhengige (forsiktig). Nøkler: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valgfritt <c6/> og <c7/>, og én eller flere <c8/> med <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> eller <c15/>, ILLUSTRATIVE parametere i <c16/>) og <c17/>; strekkenes varigheter summeres til fasens. Dokkingvinduet er tiden fra den relative sigmaen holder seg innenfor innfangingsomhyllingen til slutten av fasen. Gjentakelser er egne faser med egne id-er.

seg-088b78574ab4 = Middeltilstanden er motorens Cowell-propagator med jordgravitasjon og J2 og Solen og Månen som tredjelegemer. Kovariansen går gjennom hvert <c1/>-segment med en foroverdifferanse-tilstandsovergangsmatrise (den nominelle kjøringen og seks forstyrrede kjøringer) og en hvit akselerasjonsstøy. Brennet går langs inngangshastigheten med en oppgitt størrelsesandel og pekefeil. <b>Begrensning oppgitt:</b> de innsjekkede månekjerneutsnittene holder Månen, men ikke Solen, så propagatoren tar Månen fra kjerneutsnittet og Solen fra den analytiske serien (Solens tredjelegemeledd er ufølsomt for denne seriens feil); fasen sier i en hendelse hvilken den brukte, og der intet kjerneutsnitt dekker et segment bruker den den analytiske serien for begge. Brennet er <b>ikke siktet inn</b>: den nominelle tilstanden er der det oppgitte brennet ender, og de lunare fasene tar bare kovariansen.

seg-e5a67295a5ae = Oppdateringer, brukt bare når dokumentet oppgir kilden: <c1/> (posisjonsbestemmelser med tilgjengelighet og PDOP fra motorens space-service-volume-sveip langs en oskulerende jordbane som står i for buen, ett sveip per <c2/>; sigma for posisjonsbestemmelsen = median-PDOP ganger <c3/>; formen med forventet informasjon holder kjøringen deterministisk) og <c4/> (avstand og avstandsrate langs den geosentriske retningen, så himmelplanet ikke observeres; oppdateringsvariansen deles på sporingsandelen). Nøkler: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, valgfritt <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = Returferden er <c1/>-ferden uten brenn, som ender ved gjeninntredensgrensesnittet; nøklene er ferdnøklene ovenfor. Ved grensesnittet leser fasen banevinkelen og dens sigma fra den fulle kovariansen, sannsynligheten for at vinkelen ligger innenfor en oppgitt korridor, topp-retardasjonen ved den nominelle vinkelen og ved begge korridorkantene (motorens plane ballistiske gjeninntreden ved siden av den lukkede Allen-Eggers-formen) mot en valgfri grense, og fotavtrykket: nedslagsretningen fra en oppgitt følsomhet, tverretningen fra grensesnittkovariansen på tvers av baneplanet. Nøkler: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, valgfritt <c8/>, <c9/> og <c10/> (den nominelle returtilstanden, seks tall, når kjeden ikke har noe trans-jord-brenn som kan gi en). Ingenting her modellerer en kapsels løft, styring eller oppvarming.

seg-352783ef7181 = Overlegget for bakkenettverk

seg-69d6ab8e93bc = En valgfri tabell <c1/> gir stasjoner og laveste sporingselevasjon; for hver fase den nevner beregner tråden hvor stor andel av fasen en stasjon kan spore, og gir den til fasen som den sporingsandelen som skalerer oppdateringsraten for bakkesporing. Geometrier: <c2/> (inngangstilstanden flydd tolegemers med J2, for faser i lav bane), <c3/> (fartøyet i Månens posisjon, for den cislunare ferden) og <c4/> (en andel du oppgir). Et stasjonsbytte taper <c5/>; fasens budsjett får det lengste intervallet uten stasjon i sikte, og en hendelse oppgir andelen. Ingenting modellerer et nettverks antenner eller planer.

seg-467b14d7ef59 = <c1/>: <c2/> (indeks, id, type, tider, etikett, navigasjons- og tidskilder, begrensende kilde, sigmaer ved inngang, topp og utgang, krav, margin, <c3/> med en enhet per rad, <c4/>), <c5/> (minste margin mot et oppgitt krav, ellers den største topposisjonen), <c6/>, trådens <c7/> (den svakeste fasens etikett) og en blokk <c8/>. Figuren er 1-sigma for posisjon og klokkebias mot oppdragstid, ett bånd per fase.

seg-a3c40c51c2ff = Hva evidensen er

seg-1168810d4407 = Trådens etikett er den svakeste fasens etikett, og hver fase er MODELLED. Den lunare propagatoren er sammenlignet med LRO og CAPSTONE (<s1><c1/></s1>); den cislunare buen er sammenlignet med en offentlig Horizons-banekurve (<s2><c2/></s2>). En rad klarer eller bommer på en terskel fastsatt i en innsjekket fil før kjøringen, og en bom registreres som en bom. Ingenting er VALIDATED med mindre registeret sier det.

seg-ee3c5b58e6fa = <s1>Forrige</s1>Månebane og -overflate som infrastruktur

seg-b963f8a02aed = <s1>Neste</s1>Oppdragstråd: månesegmentet

seg-af81a8087ca7 = entry
