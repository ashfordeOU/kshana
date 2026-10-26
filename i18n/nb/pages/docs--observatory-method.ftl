# docs--observatory-method: translations (nb)

seg-0857a94a948e = Begrensninger

seg-2247a2344710 = Betydning

seg-b652b86e6b8e = Tilstand

seg-7ca62fa39e10 = Kilde: <c1/>

seg-48e063b567d0 = Interferensobservatoriet: metodenotat

seg-d0e1d6cadc10 = Versjon <c1/>, bygd på <c2/>. Kun veiledende: dette er en beskrivelse av hvordan publiserte posisjonsrapporter så ut på tidligere dager, ikke en måling av noen mottaker, en prognose, en bekreftelse av interferens eller en tilskrivning av årsaken til den.

seg-c5eab49b8d6f = Hva observatoriet publiserer

seg-165ae7646608 = Ett produkt per UTC-dag og region, fra ett åpent arkiv over flyposisjoner. Hver celle i et fast rutenett på 0.5 grader bredde og lengde er i én av <b>tre tilstander</b>:

seg-cc07647eb12e = En høy andel av flyene som ble samplet i cellen, rapporterte lav navigasjonsnøyaktighet den dagen, tydelig over bakgrunnen for den dagen.

seg-3e1dd7caaee6 = Nok fly ble samplet, og andelen oppfylte ikke regelen.

seg-8f0d9ad60d62 = Dataene tillot ikke en vurdering. Dette er <b>ikke</b> «klar». Hver slik publisert celle har en dataårsak: <c1/>, <c2/> eller <c3/>. En celle uten noen oppføring i det hele tatt ble sett av færre enn { "5" } distinkte fly og holdes tilbake.

seg-e49e05b47061 = Ingenting annet publiseres: ingen årsak, ingen aktør, ingen post per fly. Årsakene beskriver om dagens data var nok, aldri hvorfor nøyaktigheten var lav.

seg-7b251c7860e0 = Tre filer per dag (<c1/>):

seg-2008b0ba6ac7 = <c1/>: cellene, med <c2/> <c3/>, metoden og dens forhåndsregistrerte parametere, lisensen og kildeangivelsen, utgivelsesregelen og en merknad.

seg-7d5b16eac4a3 = <c1/>: de samme cellene som et bilde (degradert, ikke degradert, ikke observert skravert; tomme celler ble ikke observert). Tekstbiter i filen gjentar merknaden og lisensen.

seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Degraderte celler som berører hverandre (diagonaler inkludert) danner én hendelse med en avgrensningsboks og cellene sine. <c4/> er den faste teksten <c5/>. Filen er en inndata til en syklus med rapportering, bekreftelse og varsling (luftfartens rapporteringssyklus som ender i en NOTAM); den er ikke en bekreftelse og ikke en NOTAM.

seg-49b7bdae0d6e = og en <c1/> med antall byte og SHA-256 for de tre filene, metode-id-en, inndatatellerne (rader lest og utelatt) og datasettblokken, slik at et produkt kan kontrolleres og gjengis.

seg-d7bb390fb986 = Utgivelsesregler (håndhevet av kommandoen)

seg-87147317f8da = <b>Minst { "24" } t forsinkelse.</b> Et døgns produkt utgis tidligst ved slutten av den UTC-dagen pluss <c1/> ({ "24" } eller mer; en mindre verdi avvises). Kommandoen avviser en dag som ennå ikke kan publiseres, og oppgir det tidligste tidspunktet. Det finnes ingen bryter for å forkorte den.

seg-43960c3f9b6c = Grove celler.

seg-1a5ff10e5240 = <c1/> under { "0.5" } avvises.

seg-e70d8d7f9980 = <b>Undertrykking.</b> En celle som er sett av færre enn { "5" } distinkte fly, publiseres ikke; et antall under { "5" } er <c1/> (null inkludert), som i grunnmetoden.

seg-ab75582c5032 = <b>Ingen årsaksangivelse.</b> Vokabularet av tilstander og begrunnelser har ingen årsak; en test hevder det.

seg-0e7d76d7efd0 = <b>Kilder.</b> Bare adsb.lol (ODbL { "1.0" }), eller et brukerdatasett med egen lisens. <b>Data fra OpenSky Network avvises</b> (lisensen deres tillater ikke kommersiell bruk eller videredistribusjon av avledede kart). ADS-B og AIS kombineres aldri.

seg-dc28848046ac = <b>Produktets lisens.</b> En ADS-B-fil per celle laget fra adsb.lol er en Derived Database og bærer ODbL { "1.0" } og adsb.lol-kildeangivelsen i filen. Kshanas kode forblir AGPL-3.0.

seg-9eeba6648fec = Observabelen og grunnmetoden

seg-7334dc45eb2f = Et ADS-B-fly melder hvor nøyaktig det selv mener GNSS-posisjonen sin er: <b>NACp</b> (Navigation Accuracy Category for Position, en horisontal grense på { "95" } % fra { "10" } NM ned til under { "3" } m) og <b>NIC</b> (Navigation Integrity Category, en inneslutningsradius). Grunnmetoden (<c1/>, <c2/>) teller, per celle og dag, andelen av <b>distinkte fly</b> hvis rapporter i cellen for det meste hadde lav nøyaktighet, med disse vernene: bare høyde over { "5,000" } ft; et fly telles bare hvis det rapporterte god nøyaktighet andre steder samme dag (en utstyrsgrunnlinje); celleandelen må overstige dagens medianandel med en margin; en dag der medianen selv er høy markeres som forstyrret, og ingen celle erklæres degradert. Parametrene ble fastsatt ut fra definisjonene av feltene og fra personvernregelen før noen data ble undersøkt, og er skrevet inn i hver utdatafil. Observatoriet legger til tilstandsvokabularet med tre tilstander, utgivelsesreglene og filene ovenfor, og endrer ingen parameter.

seg-96cf298985c6 = <b>Regionale kjøringer.</b> Med <c1/> leses bare rapporter innenfor boksen. Utstyrsgrunnlinjen og dagens bakgrunn beregnes da bare fra rapportene i boksen, og filen sier det (<c2/>). Et regionalt produkt er derfor et produkt av den regionens data, ikke et utsnitt av et globalt.

seg-2e7007b56a44 = Forholdet til metoden med NACp mot almanakk-HDOP

seg-4892485e534b = Pleninger, Topkova og Steiner, «GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data», The Aeronautical Journal { "129" } ({ "1331" }), { "206" } til { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, sammenligner posisjonsfeilen som følger av et flys NACp med HDOP (horisontal presisjonsfortynning) for GPS-konstellasjonen fra almanakkdata, og markerer et fly som påvirket når de to er uenige; artikkelen evaluerer metoden på bevisste GPS-jamming-eksperimenter.

seg-74ec1aca8a22 = <b>Hva vi brukte.</b> Bare det publiserte sammendraget og den bibliografiske posten. Fulltekten var ikke tilgjengelig for oss (bak betalingsmur), så vi kjenner verken kartleggingen fra NACp til et feilestimat, HDOP-beregningen eller terskelverdiene, og vi påstår ikke å gjengi dem.

seg-4f8471649a07 = <b>Hva observatoriet gjør i stedet.</b> Spørsmålet almanakksammenligningen besvarer er «kunne konstellasjonsgeometrien alene forklare denne lave nøyaktigheten?». Grunnmetoden besvarer et beslektet spørsmål uten almanakk: en lav andel må skille seg ut mot samme dags bakgrunn i regionen og mot flyets egne gode rapporter andre steder. Det er en annen og svakere erstatning: den kan ikke si at en time med rolig geometri var degradert der dagens bakgrunn også er lav. En almanakk-HDOP-skårer er <b>ikke implementert</b>. Det er et åpent punkt, som skal bygges fra artikkelens fulltekst og den offentlige GPS-almanakken og forhåndsregistreres før den kjøres; inntil da siteres den, den påstås ikke.

seg-e9b9902633af = Å gjengi et produkt

seg-95e48f0286d9 = Rørledningen er deterministisk i alt den publiserer (saltet for identifikatorer per kjøring endrer bare interne hasher som aldri skrives ut). Manifestets SHA-256-verdier gjør at en ny kjøring kan sammenlignes byte for byte.

seg-65236a42e316 = Sensitivitetsstudie

seg-0c843e799b8f = <c1/> spiller av én dags rapporter på nytt under endringer av én forhåndsregistrert parameter om gangen (to verdier hver, pluss et rutenett på { "1.0" } grad) og rapporterer, per variant, antallet degraderte, ikke degraderte og ikke observerte celler, Jaccard-indeksen for det degraderte settet mot det registrerte, cellene som skiftet tilstand, og det degraderte arealet. Den endrer ingenting ved den registrerte regelen: en variant er ikke et validert alternativ, og en stor endring under en parameter sier hvor mye avgjørelsen avhenger av den parameteren, ikke hvilken verdi som er riktig. Resultatene for etterkatalogen står i <c2/>.

seg-cc57d45c4b0a = <b>Dekning.</b> adsb.lol følger frivillige mottakere; åpent hav og tynt dekket luftrom er glisne, og <c1/> er vanlig der. Et kart viser dekningen til kilden sin.

seg-e3921e1eb177 = <b>Hva lav nøyaktighet betyr.</b> NACp og NIC faller av andre grunner enn interferens: satellitt- eller forsterkningsbortfall, romvær, mottaker- eller transponderfeil og geometri. Ingen tilstand innebærer en årsak.

seg-e5ad0dc456c0 = <b>Fly som blir i en påvirket region hele dagen</b> har ingen grunnlinje utenfor den og telles ikke, så metoden undervurderer en vedvarende regional effekt. Sensitivitetsstudien viser effekten av grunnlinjevernet.

seg-a2d41becc19b = <b>Dagsgrenser</b> er UTC; en hendelse som krysser midnatt deles mellom to dager.

seg-436af9f16feb = <b>Ingen referansesannhet.</b> Observatoriet har ingen ekstern uavhengig referanse: hvert tall er MODELLED, og ingen rad i verifikasjonsmatrisen bygger på det.

seg-5c4966f0166d = <b>Emnets sensitivitet.</b> Kart av denne typen er politiske. Observatoriet oppgir en metode, en forsinkelse og et vokabular, og ingenting mer; det navngir ikke stater eller aktører, og det publiserer ikke i sanntid.

seg-874f46a80c8b = <s1>Forrige</s1>Mottakerprotokoller lest

seg-3137b7595e59 = <s1>Neste</s1>Interferensobservatoriet: resultater
