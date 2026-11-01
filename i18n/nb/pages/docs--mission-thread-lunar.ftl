# docs--mission-thread-lunar: translations (nb)

seg-f942b36a11c4 = Ikke på GitHub ennå

seg-3b01a756c305 = Hva den beregner

seg-b478421b21bb = Kilde: <c1/>

seg-dbd59cc01982 = Månesegmentet av oppdragstråden i stil med Artemis-class

seg-7b56ed698c30 = Fire scenariotyper, hver også en fasetype i grensesnittet <c1/> (<c2/>): de bærer et budsjett for navigasjons- og tidsfeil gjennom et månefartøyoppdrag til sørpolen, fra rendezvous i månebane til landing, oppholdet på overflaten og stigningen tilbake til banen. <b>Hvert tall her er MODELLED</b>: en oppgitt modell med ILLUSTRATIVE inndata, ingen av dem en påstand om noe oppdrag, system eller sted. «Artemis-class» betegner en klasse av oppdragskonsepter, ikke noe mer; ingen byrås data, produkter eller støtte brukes eller påstås, og ingenting her er tilknyttet noen. Veiledende programvare, ikke sertifisert navigasjonsutstyr. Kshana sender ingenting og styrer ingen maskinvare.

seg-5282ad2c498a = Fase og type

seg-9b927127e042 = Eksempelscenario

seg-40f3e1b2d58b = Kjerne

seg-2cfaaa8be402 = relativ navigasjon til dokking, sirkulær polarbane på { "100" } km eller elliptisk polarbane på { "100" } km ganger { "3000" } km

seg-9ee09d63fed3 = budsjettet for landingsspredning ved et sted nær sørpolen

seg-c4568984e75c = <c1/>, <c2/> (trenger DEM-en, en utsjekking)

seg-a098e14e6a63 = tilgjengelighet av posisjonering og tidssynkronisering etter sted og årstid

seg-8278ae655fcc = <c1/>, <c2/> (trenger DEM-en, en utsjekking)

seg-249eff5159d0 = stigning til rendezvous-banen og kovariansen som føres tilbake til banen

seg-36184e593ade = Hver kjerne er en funksjon av <c1/>; en frittstående kjøring bygger standardinngangen (en månesentrert inertiell kovarians på { "100" } m og { "0.1" } m/s, en LTC-klokke på { "1" } mikrosekund) og standardepoken 2028-01-01, og en trådkjøring henter inngangen fra forrige fase. Tråden, ikke en kjerne, omregner rammer og tidsskalaer og anvender overleveringsregelen: en fasewrapper omregner inngangstilstanden til <c2/> (eller <c3/> for overflatekartet) og en LTC-klokke gjennom trådens omregninger, og omregningslinjene legges til fasens budsjett. En ramme eller tidsskala tråden ikke kan omregne (ITRF, for eksempel) avvises med trådens melding; en kjerne som kalles direkte med en ramme den ikke kan bruke, avviser den med begrunnelse. En fase nullstiller aldri en kovarians, den fører bare videre den den ender med.

seg-59f4a1a2684e = Hva hver fase gjør

seg-e112a34ef118 = To fartøy, et jagerfartøy og et målfartøy, flyr i samme bane under crate-ens månekraftmodell (et gravitasjonsfelt og Jorden og Solen som tredjelegemer). Et batch Gauss-Newton-estimat over buen gjenvinner begge starttilstandene fra:

seg-33bb01b1e72a = en absolutt posisjonsbestemmelse per fartøy fra et ILLUSTRATIVE relésett av LCNS-klasse (reléer bak Månen utelatt, fire kreves), hvis hvite del er kodesporingsgrensen på AFS-pilotsignalet (BPSK({ "5" }), { "5.115" } Mchip/s) ved oppgitt C/N0 ganger DOP-kofaktoren;

seg-b061f6742a86 = en <b>vedvarende</b> signal-i-rommet-feil på hver posisjonsbestemmelse: relefeil midles ikke bort over en bue på flere timer, så den føres som konstante posisjonsbiaser, én felles for begge fartøyene (<c1/> av variansen, standard { "0.9" }, ILLUSTRATIVE) og én uavhengig per fartøy. En konstant bias gir ingen midlingsgevinst, den forsiktige lesingen;

seg-437ac74b1400 = en tverrlinkavstand fra samme signal ved sin egen C/N0.

seg-3513a55e44e5 = Den rapporterer den formelle og Monte Carlo-baserte relative posisjons- og hastighetsfeilen i målfartøyets lokale akser, andelen epoker med posisjonsbestemmelser på begge fartøyene, den midlere normaliserte estimeringsfeilen i annen potens (NEES) for den relative tilstanden mot forventet verdi på { "6" }, den relative driften ved å se bort fra gravitasjonsharmoniske, en lukket Hill-kontroll (Clohessy-Wiltshire) for det sirkulære tilfellet, trådens terminale relative sensormodeller fra <c1/> (ILLUSTRATIVE parametere) ved siden av tallet med bare signaler, og 6x6-kovariansen for jagerfartøyet til slutt.

seg-5d3fa3e8486c = <b>Hva resultatet sier.</b> Med bare signaler fastlegger tverrlinkavstanden den relative posisjonen langs siktlinjen, men den relative posisjonen på tvers av den er begrenset av den uavhengige signal-i-rommet-feilen og av det dynamikken gir; dokking trenger en relativ sensor, og radene <c1/> viser på hvilken avstand hver av trådens sensormodeller slår signalene. Resultatet avhenger også av at referansen og estimatoren deler en kraftmodell; estimatorvalget <c2/> viser kostnaden ved å se bort fra harmoniske, og den kjøringen forventes ikke å være konsistent.

seg-66c4eb27641b = Fasen flyr sin egen nominelle bane (feltene <c1/>), så posisjons- og hastighetsvektoren ved inngangen brukes ikke, bare kovariansen, rammen og klokken; en hendelse i tråden sier fra om dette.

seg-751f29ab7a35 = Per horisontal akse en inertiell feilmodell med fem tilstander (posisjon, hastighet, akselerometerbias, holdningstilt, gyrobias, drevet av nedstigningens spesifikke kraft) fra inngangskovariansen og IMU-en, så et sekvensielt filter over de aktiverte hjelpemidlene:

seg-c2eae4508a2f = <b>AFS-posisjonsbestemmelse</b>: fra reléene som er synlige over en flat maske, med ENU-DOP-kofaktoren ganger en brukeravstandsfeil. <c1/> bruker signal-i-rommet-feilen; <c2/> bruker korreksjonslinkens restfeil fra <c3/>. Med nøyaktig tre reléer i sikte er klokken hjulpet, ikke estimert, og posisjonsbestemmelsen bærer da <c4/>: her kommer månetid inn i posisjonsbestemmelsen.

seg-39c938fb24e9 = <b>Terrengrelativ posisjonsbestemmelse</b>: <c1/> kjører crate-ens TERCOM/SITAN-matcher på sitt syntetiske relieff og en jordlig metermålestokk (en stand-in, ikke relieff nær sørpolen); <c2/> bruker Cramer-Rao-grensen for matching av et høydevindu i den virkelige LOLA-DEM-en ved stedet, <c3/>, og påstår ingen posisjonsbestemmelse der relieffet bare begrenser én retning (aperturproblemet).

seg-795ef82edc61 = <b>Månetid</b>: klokkefeilen ved posisjonsbestemmelsen kombinerer inngangsklokken, veksten siden synkroniseringen og LTC-TT-leddet fra <c1/>. Med <c2/> tikker fartøyet TT, og den akkumulerte forskjellen er en ukorrigert bias; med <c3/> gjenstår bare usikkerheten i det publiserte båndet på { "56" } til { "59" } mikrosekunder per døgn over horisonten. En tidsmerkefeil flytter en posisjonsbestemmelse langs banen med <c4/>.

seg-d655c932abbf = Landingsspredningen er navigasjonsfeilen ved touchdown pluss et uavhengig styringsledd (<c1/>, ILLUSTRATIVE, som standard { "20" } m per akse). Tabellen <c2/> kjører hver kombinasjon av hjelpemidlene. Ellipsen er kalibrert med Monte Carlo (andelen simulerte landinger innenfor 3-sigma-konturen mot de { "98.9" } % en 2D-gaussfordeling gir).

seg-82b71e26bc89 = <b>Les den med forsiktighet.</b> Standardspredningen domineres av det antatte styringsleddet, og ved hvert sted nær sørpolen er relégeometrien nesten den samme, så stedene skiller seg lite. Månetid betyr lite gjennom tidsmerking ({ "150" } m/s ganger noen få mikrosekunder er under en millimeter); den betyr noe når geometrien forringes til tre reléer.

seg-f5af0aef6649 = For hvert sted og hver årstid (en epoke og et vindu etter den): relépositionering (fire eller flere reléer i sikte over masken og stedets terrenghorisont med PDOP under terskelen, fra de samme funksjonene og den samme konstellasjonen som <c1/>; resultatet for ett sted er lik dens tall helt ned til siste bit), om Jorden og Solen står over horisonten (analytisk Sol, Måne og månens orientering, librasjon medregnet), og tilgjengelighet av tidssynkronisering (et relé eller Jorden i sikte) med den lengste perioden uten noen av dem. Relétallet endres ikke med årstiden i denne modellen (keplersk sett, middelrotasjon); tallene for Jorden og Solen gjør det. Fasen fører kovariansen videre uendret og disiplinerer klokken til et tidsgulv (ILLUSTRATIVE, { "50" } ns), slik at bare det lengste tidshullet gjenstår å holde over.

seg-0890ec65a04e = Nedstigningens modell med fem tilstander på alle tre stedsaksene fra overflatetilstanden, en AFS-posisjonsbestemmelse med et oppgitt intervall med samme behandling av månetid, og den fulle 6x6-kovariansen for posisjon og hastighet ved innsetting ført videre, med korrelasjonen mellom posisjon og hastighet for hver akse beholdt. Spredningen ved motoravstengning flytter hvor fartøyet er og rapporteres ved siden av navigasjonskovariansen, ikke ført videre. Feilene holdes i oppskytingsstedets akser (ingen krumning i nedslagsretningen), og den nominelle utgangstilstanden er en stand-in; bare kovariansen er resultatet.

seg-f60b576fabcd = Hvordan et dokument oppgir en fase

seg-be8e0001ed0c = I en tråd er en fases tabell <c1/> det frittstående scenariots egen tabell. Fasens lengde er trådens <c2/>: en modell som også oppgir sin egen lengdenøkkel (<c3/>, <c4/>, <c5/>, <c6/>) må stemme med den, ellers avviser fasen, og en modell som utelater nøkkelen overtar trådens. Seeden er trådens id-nøklede faseseed, så en fase kjørt alene under samme id og trådseed gir de tallene den gir i tråden. En feilstavet modellnøkkel avvises, ikke ignoreres. Overleveringen mellom faser, og omregningene av ramme og tidsskala den trenger (månesentrert inertiell og månefast, Jorden til Månen, LTC-parene), hører til tråden.

seg-52a6e2ec0a99 = Utformingene, inndataene og tersklene ble fastsatt i <c1/> før noen kjøring, med seks daterte endringer, hver opplyst i filen; dommen for hver terskel, bommene og estimatorhistorikken inkludert, står i <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (propagatoren mot LROs rekonstruerte banekurve, { "24" } t): MET, { "33" } m største 3D-differanse mot { "500" } m, { "2.4" } m RMS radialt mot { "60" } m.

seg-25464238f6bd = <b>A2</b> (den samme propagatoren mot CAPSTONEs nesten rettlinjede halobane over én omløpstid på 6.5 døgn): <b>NOT MET</b>, { "136.8" } km differanse i sluttposisjon mot { "25" } km, og { "28.4" } km differanse i oskulerende periapsisradius mot { "10" } km. Årsakene ble ikke isolert (kandidater er det utelatte strålingstrykket og albedoen, banens følsomhet for starttilstanden og de analytiske seriene for Jorden og Solen); raden forblir MODELLED.

seg-e1099ad81a5d = Disse to radene tester propagatoren de lunare typene deler. <b>De tester ikke noe navigasjonsfilter, signal eller budsjett, og ingenting annet her har en ekstern uavhengig referanse.</b>

seg-9a4b2392aa92 = Alt annet er MODELLED, og typenes konsistenskontroller (B1 til B8 i forhåndsregistreringen) tester en implementering mot dens egen oppgitte modell, ikke mot Månen.

seg-3365490b59b7 = <s1>Forrige</s1>Oppdragstråd: fra oppskyting til gjeninntreden

seg-90932eed0074 = <s1>Neste</s1>LEO-posisjonering, -navigasjon og tidssynkronisering
