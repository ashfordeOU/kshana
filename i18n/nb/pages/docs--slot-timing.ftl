# docs--slot-timing: translations (nb)

seg-f917e7fcac09 = Hva det er

seg-adc34608c46b = Klasse

seg-3a0e724a8a2b = Nivå

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Betydning

seg-f63dd3d7aad4 = Kilde

seg-1ff32b87e030 = Satellitter

seg-582fd72f1a1a = Vurdering

seg-430edd66bda0 = Ikke modellert

seg-f23c8bd5f203 = Kilde: <c1/>

seg-1f2727dc4ca4 = Scenario-kind-en <c1/> svarer på tre spørsmål for en klokke som går fritt mellom synkroniseringer og må holde trafikken innenfor en <b>tidsindeksert slot</b>: en rutings-, oppgave- eller kontaktslot der <b>vernemarginen</b> er den største absolutte tidsfeilen, til begge sider, som slotten fortsatt fungerer ved.

seg-6b39d8afeb5d = <b>Når brytes vernemarginen?</b> Sekunder fra siste posisjonsbestemmelse til den predikerte tidsfeilen når vernemarginen, med hvert bidragende ledd spesifisert og det dominerende navngitt.

seg-60476d723e1a = <b>Hvor mye tid er igjen nå?</b> Det samme tallet minus tiden som allerede er gått siden posisjonsbestemmelsen.

seg-84010982db35 = <b>Hvor ofte må klokken få en posisjonsbestemmelse?</b> Det største intervallet mellom posisjonsbestemmelser som holder feilen innenfor vernemarginen, fratrukket ventetiden før en posisjonsbestemmelse får effekt.

seg-3388d46925f1 = En valgfri seksjon <c1/> legger til beskyttelsesnivået for tid (TPL) for en mottaker i bane; se <a1>Spoofing av en mottaker i bane</a1>.

seg-2eb266d992b0 = Kjør det medfølgende eksempelet med <c1/>.

seg-624e7a70c4f6 = Forkortelser: GNSS, Global Navigation Satellite System; TCXO, temperaturkompensert krystalloscillator; OCXO, ovnsstyrt krystalloscillator; RAFS, rubidium-atomfrekvensstandard; CSAC, atomklokke i brikkeskala; USO, ultrastabil oscillator; DSAC, atomklokke for dypt rom; ADEV, Allan-avvik; FM, frekvensmodulasjon (her støy på klokkens frekvens); PM, fasemodulasjon (støy på fasen); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, Telecommunication Standardization Sector i International Telecommunication Union; TIE, tidsintervallfeil; MTIE, maksimal tidsintervallfeil; TDEV, tidsavvik; max|TE|, maksimal absolutt tidsfeil; CUSUM, endringsdetektor med kumulativ sum; TPL, beskyttelsesnivå for tid; LEO, lav jordbane; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (en IEEE Transactions); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, GPS Block II Follow-on-satellittene; SHA-256, den 256-bits Secure Hash Algorithm; PPS, puls per sekund.

seg-f2a0c73ef648 = Feilmodellen

seg-6bc3f9e78346 = Den predikerte tidsfeilen etter coasting i <c1/> sekunder fra en posisjonsbestemmelse er

seg-3fbb186c716a = dekningsfaktor ({ "3" } er omtrent { "99.7" } % av en gaussisk feil)

seg-883965151598 = enkeltsigma tidsfeil for posisjonsbestemmelsen

seg-b63c0447865f = enkeltsigma feil i frekvensen kjent ved posisjonsbestemmelsen; en frekvens estimert over et vindu <c1/> har omtrent <c2/>

seg-ab28fc69d3ac = varians for hvit fasestøy: jitter i tidsfeilen, et konstant gulv

seg-8792541a7b6d = tettheter for hvit, random-walk- og random-run-FM (van Loan-leddene i <c1/>)

seg-5d36b32c4de8 = flicker-FM-gulvet i Allan-variansen

seg-65da5a90685f = gjenværende brøkfrekvensavvik etter posisjonsbestemmelsen

seg-816e427d51f9 = frekvensavvik fra en temperaturendring <c1/> gjennom temperaturkoeffisienten <c2/>

seg-e23d0ac960aa = lineær aldringsrate

seg-43e5f75b369c = Hvert FM-ledd er lik <c1/> for sin egen støytype, med <c2/> (Zucca og Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). For hvit, random-walk- og random-run-FM er den relasjonen eksakt. For flicker-FM er den det konvensjonelle estimatet av prediksjonsfeilen i tid (Riley, NIST SP { "1065" }): flicker-FM har ingen lukket form uten en lavfrekvensgrense. Frekvensavvikene adderes i absoluttverdi fordi fortegnene er ukjente, så den deterministiske delen er et verste tilfelle. Hvert ledd er ikke-negativt og ikke-avtagende i <c3/>, så <c4/> har én rot, funnet ved innringing og halvering.

seg-f9038fba23e2 = Hvor klokken kommer fra

seg-5c44b2f8d015 = Scenarionøkkel

seg-cb92ae98c231 = Klassens standardverdi

seg-7594664253f2 = ett oppgitt ADEV ved ett sekund og et rødstøygulv syntetisert to og fire dekader under det

seg-794e4932b470 = MODELLED: svaret for en stabil klokke styres av det antatte gulvet

seg-5ea820aaa69f = Databladpreset

seg-c943490619f3 = telekom-tidssynkroniseringspreset-ene (<c1/>, <c2/>, <c3/>, <c4/>), hver et navngitt Microchip-datablad

seg-a20353d50011 = MODELLED: en omhylling av maksimalverdier fra databladet

seg-b543f3dcd11a = Datablad i selve filen

seg-4983ec096617 = kundens egen ADEV-tabell, aldring og temperaturkoeffisient

seg-b079bca8a611 = MODELLED: en omhylling av de oppgitte maksimalverdiene

seg-119d94700cab = Målt registrering

seg-ae6835f0c3c5 = en faseregistrering; dens overlappende ADEV tilpasses med vektet minste kvadraters metode

seg-6e1c4702186d = inversjonen er VALIDATED på en tilbakeholdt reell registrering (nedenfor)

seg-f4cc2be238b7 = De tre klassene som ble lagt til i { "0.28.0" } viser hver til ett offentlig datablad:

seg-47f6ddc3bd02 = ADEV ved ett sekund

seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, kolonnen for enkel TCXO

seg-becbff195fff = Microchip OX-208-datablad, Rev 12-1-2021

seg-19d8d32203f6 = Microchip 8040C Rubidium Frequency Standard-datablad, DS00003047A

seg-48babc170b93 = EndRuns rader for lange midlingstider konvergerer på tvers av den tabellen ({ "4e-13" } for hver oscillator unntatt TCXO, { "8e-13" }, ved { "10 000" } s, og { "6e-14" } for alle ved { "100 000" } s), noe som tyder på at de beskriver det disiplinerte produktet og ikke den frittgående oscillatoren, så de brukes ikke.

seg-85c7211bb49b = <b>Registreringstilpasningen er vektet.</b> Et estimat av Allan-varians med <c1/> ekvivalente frihetsgrader har varians omtrent <c2/>, så hvert punkt går inn med residual <c3/>. En uvektet tilpasning lot de korte midlingstidene avgjøre leddene for lange midlingstider: på en testregistrering med hvit FM ga den et falskt flicker-gulv som forkortet et brudd ved { "2 000" } s med { "30" } %. Et datablad eller en registrering støtter bare midlingstider opp til sitt lengste punkt; et brudd utover det flagges <c4/>.

seg-5b61a42c76c2 = Validering: inversjonen på en tilbakeholdt reell klokke

seg-2220a1490923 = <c1/> bruker registreringen på { "556" } 990 samples av en 5071A cesiumstandard målt mot en hydrogenmaser (A. Wallin, distribuert med <c2/>; den samme registreringen som estimatorreferansen <c3/> bruker). Med hydrogenmaseren som referanse er registreringen en fri gange på 6.4 dager.

seg-9bae4571f67c = Tilpass støymodellen bare på den <b>første tredjedelen</b> av registreringen.

seg-15b2cb621db7 = Predikér ut fra den modellen coastingtiden der enkeltsigma tidsfeilen når { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } og { "2.5" } ns.

seg-1bd9ac435bfa = På de <b>to andre tredjedelene</b>, la klokken gå fra et synkroniseringspunkt hvert { "997" } s med frekvensen estimert fra den foregående tredjedelen, og mål hvor den kvadratiske middelverdien av coastingfeilen når hver terskel.

seg-d7640a2ec444 = Bestått-terskelen, fastsatt før testen første gang ble kjørt, er at hvert predikert brudd ligger innenfor en faktor på { "1.5" } av det målte. En kontroll, ett-sekunds-ADEV lest som hvit FM, må ikke bestå den terskelen, slik at terskelen kan skille en god modell fra en dårlig. Testen skriver ut tabellen sin; en mutasjon som halverer nivået for hvit FM feiler den. Den rå registreringen er tredjepartsdata som er git-ignorert: <c1/> henter den, og arbeidsflyten <c2/> kjører testen med <c3/>, slik at en manglende fil feiler der i stedet for å bli hoppet over.

seg-3d11f7c6d4ab = Hva dette validerer: stien tilpass-så-inverter, på en atomstandard dominert av hvit FM, over coasting opp til omtrent { "50 000" } s. Hva det ikke validerer: databladkildene og klassekildene, de deterministiske leddene og en krystalloscillator (neste avsnitt).

seg-bfcc5555ed50 = Den samme prediksjonen på en reell krystalloscillator: konservativ, ikke validert

seg-b77b3f503ca2 = <c1/> bruker en målt OCXO: { "19 982" } frekvensavlesninger ved ett sekund av { "10" } MHz-oscillatoren i en HP impedansanalysator, mot en hydrogenmaser (A. Wallin, { "2015" }, distribuert med <c2/>; <c3/>). Støymodellen og en lineær drift tilpasses på den første tredjedelen; hver coasting på de to andre tredjedelene starter fra en frekvens estimert over de foregående { "100" } s, og modellen bærer usikkerheten i det estimatet (<c4/>, modellens eget Allan-avvik ved { "100" } s).

seg-e05821406c28 = Tilpasset på

seg-c70aadbd47d4 = Predikert ÷ målt brudd, { "0.2" } til { "10" } ns

seg-d71582148b20 = Tolkning

seg-dcc3fd23bede = den første tredjedelen (tilbakeholdt)

seg-f9bb286f5868 = { "0.59" } til { "0.70" }

seg-612784f70090 = konservativ: aldri senere enn målt, for det meste utenfor terskelen på { "1.5" }

seg-121fa832c30f = selve evalueringssegmentet (diagnostikk)

seg-b4be9afa69ac = { "0.98" } til { "1.17" }

seg-75e1515b970a = inversjonen er riktig; gapet til det tilbakeholdte er at oscillatoren endrer seg

seg-c91da69e9c09 = Oscillatorens støygulv ble halvert under registreringen: Allan-avviket for den første tredjedelen flater ut nær { "7.5e-12" }, resten nær { "3.5e-12" }. En modell tilpasset tidlig overpredikerer støyen, som er den trygge retningen. <b>Krystalltilfellet er derfor ikke validert, og forblir MODELLED.</b> For en krystall: tilpass på en innsvingt registrering og tilpass på nytt etter hvert som komponenten eldes.

seg-6230fed0e164 = <b>Hvordan protokollen ble valgt, oppgitt fordi den ikke var blind.</b> En første utforskende kjøring gjenbrukte cesiumprotokollen (frekvens fra den foregående tredjedelen, uten frekvensledd) og predikerte brudd { "1.4" } til { "2.5" } ganger senere enn målt: optimistisk, den farlige retningen. En krystalls frekvens vandrer, så en frekvens estimert timer før posisjonsbestemmelsen er utdatert, og modellen hadde ikke noe ledd for hvor godt frekvensen er kjent ved posisjonsbestemmelsen. Leddet <c1/> ble lagt til av den grunnen, og denne protokollen ble fastsatt før testen ble skrevet; bestått-terskelen ble ikke flyttet. Testen kontrollerer også at prediksjonen i utvalget, uten leddet, er optimistisk ved hver terskel, så leddet bærer vekt.

seg-88e01cac525a = Den samme prediksjonen på atomklokker i bane: { "8" } av { "10" }, ikke validert

seg-17962966b6d6 = <c1/> bruker kombinerte endelige IGS-klokker ved { "30" } s i { "14" } dager ({ "17" } til { "30" } august { "2025" }; <c2/>, hver fil festet med SHA-256): hver GPS Block IIF-satellittklokke mot IGS-tidsskalaen. Protokollen (satellittmengde, gapregel, tilpasningsvindu, en synkronisering hvert { "3 570" } s med frekvensen fra den foregående timen, terskler på { "1" } til { "20" } ns, terskelen på { "1.5" }, og regelen om at klassen bare består hvis hver satellitt gjør det) ble skrevet ned før noen av dataene ble lastet ned.

seg-1b5832633c87 = Predikert ÷ målt brudd

seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

seg-9a6fac366156 = { "0.76" } til { "1.46" }

seg-c14941cb5537 = innenfor terskelen

seg-dbaaf875f1fb = { "1.51" } til { "1.99" }

seg-3601e13c39b6 = optimistisk

seg-ea41cf6dbec2 = { "1.20" } til { "1.61" }

seg-099fb000bf57 = ikke evaluert

seg-a7699b256ee1 = utelukket av gapregelen (en manglende dag)

seg-eb71202e0b91 = Åtte av ti er nyttig evidens, men to satellitter predikeres å holde lenger enn de gjorde, som er den farlige retningen, og protokollen krever at hver satellitt består. <b>Banetilfellet forblir derfor MODELLED.</b> Block IIF-satellitter har både rubidium- og cesiumstandarder, og IGS-filene sier ikke hvilken som er aktiv, så resultatet er oppgitt for satellittene, ikke for én klokketype. Hvorfor G25 og G30 avviker, er ikke undersøkt.

seg-a9be8a92b6b9 = En bench-kjøring for en flygingsrepresentativ komponent (avgrenset, ikke utført)

seg-43597df55508 = Den offentlige OCXO-registreringen er { "5.5" } timer lang, fra ett laboratorieinstrument, med oscillatoren fortsatt i innsvingning. Det som ville validere krystalltilfellet, er en lengre målt fri gange av en flygingsrepresentativ OCXO eller en CSAC mot en referanse:

seg-e2698f00a84a = en tidsintervallteller som sammenligner oscillatorens { "1" } PPS med en GNSS-disiplinert referanse eller en maserreferanse, minst { "10" } dager med ett sample per sekund, med temperaturen logget;

seg-c4c902ac028e = den samme tilbakeholdte protokollen: tilpass på den første tredjedelen, predikér bruddene, mål på resten, med samme terskel og kontroll;

seg-0faaa6279195 = registreringen og hashen publisert ved siden av testen slik at raden kan reproduseres.

seg-9b2255563582 = Det er blokkert av tilgang til referansemaskinvare og er ikke lovet.

seg-6cb2dc94d1bf = Mot hvilket wander-mål bør en slot aksepteres?

seg-f6d24245dca6 = Tidsstandarder byr på tre familier av mål. For en tidsindeksert slot måler bare én av dem det som bryter sloten.

seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) er den største topp-til-topp-TIE-en innenfor et hvilket som helst vindu av en gitt lengde. Den er blind for et konstant avvik: en klokke som er { "1" } µs feil men helt stabil har en MTIE nær null og bommer på hver slot. Den måler hvor mye feilen <em>endrer seg</em>, ikke hvor den <em>er</em>.

seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) er bygget av andrediffererenser av midlet fase. Den fjerner et konstant avvik og en konstant frekvensfeil, som nettopp er leddene som dominerer en coasting. Den karakteriserer støytypen; den er ikke et akseptmål for absolutt tidssynkronisering.

seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; budsjettmålet i G.8271) er den største absolutte tidsfeilen mot referansetidsskalaen. Den kan sammenlignes direkte med en vernemargin.

seg-7eefc395a118 = <b>Konklusjon.</b> Godta en slot mot max|TE| relativt til nettverkets referansetidsskala, evaluert som en predikert omhylling fra siste posisjonsbestemmelse ved en oppgitt dekningsfaktor. Det er hva <c1/> er: fordi hvert ledd vokser med <c2/>, er maksimum over en coasting med lengde <c3/> lik <c4/>. MTIE og TDEV forblir nyttige som diagnostikk: TDEV for å identifisere hvilket støyledd som bør angripes, MTIE(L) for å begrense hvor mye feilen beveger seg i løpet av en slot med lengde <c5/>.

seg-51d4ee8484d7 = To forbedringer som valget av mål innebærer:

seg-a52524111ed7 = <b>Vernemarginen gjelder den relative feilen mellom to noder.</b> Hvis sender og mottaker begge går coasting uavhengig, adderes de stokastiske feilene kvadratisk og de deterministiske feilene i absoluttverdi. Når den stokastiske delen dominerer, kan hver node få <c1/>; når aldring eller temperatur dominerer, <c2/>.

seg-073fe7cd8e63 = Dekningsfaktoren er et utformingsvalg, ikke en egenskap ved klokken.

seg-eb1cbf9fda2d = <c1/> begrenser omtrent { "99.7" } % av gaussiske feil ved ett tidspunkt, ikke over hver slot i et døgn; en rutingplan med mange slots per døgn trenger den risikoen per slot den kan tåle.

seg-04734b8a115b = Spoofing av en mottaker i bane

seg-9e734bbda345 = Seksjonen <c1/> evaluerer <c2/> for den samme klokken:

seg-a2f21a643389 = <b>Geometri.</b> En spoofer på bakken når en LEO-satellitt bare mens satellitten er over horisonten: ved { "550" } km, høyst omtrent tolv minutter per passering rett over. En spoofer som ramper med rate <c1/> kan derfor trekke klokken med høyst <c2/> ganger det vinduet, eller ganger gapet til neste uavhengige kontroll hvis det er kortere (<c3/>).

seg-ff59489b08b8 = <b>Dynamikk.</b> Et felles tidstrekk i samme retning forskyver hver pseudoavstand like mye og absorberes i klokkebiasen, ikke i posisjonen, så en posisjonskontroll med banepropagatoren regnes ikke som en tidskrysskontroll.

seg-4302cc49b91f = <b>Krysskontroller.</b> En satellitt har sjelden en andre uavhengig tidsmottaker. Den har sin egen klokkes coasting (monitoren til <c1/>), en toveis tidsoverføring med en bakkestasjon under kontakter og tidssammenligninger over lenker mellom satellitter. En krysslenke er uavhengig av én spoofer på bakken bare hvis naboen er utenfor den spooferens fotavtrykk samtidig, noe rapporten kontrollerer ut fra antall satellitter per plan.

seg-16c15664a51c = <b>Betinget grense.</b> Monitorgulvet pluss klokkens coasting over deteksjonsforsinkelsen til CUSUM, som reduseres nøyaktig til <c1/> når klokken ikke har noe flicker-, hvitfase- eller random-run-ledd. Som den grensen gjelder den bare gitt deteksjon.

seg-f7678693be22 = Alt dette er MODELLED: en sfærisk, ikke-roterende jord, en passering rett over, én spoofer på bakken med en oppgitt største rampehastighet. Ankomstretningen til signalene ved en antenne som peker mot zenit er en reell krysskontroll som trenger et antennemønster og ikke er modellert. <a1><c1/></a1> forklarer hvorfor en signert kontrollmelding ikke fjerner denne trusselen.

seg-070a4e72b5ea = Frekvenssprang, strålingseffekter og relativistiske frekvensavvik; en termisk modell (temperaturendringen er et sprang ved posisjonsbestemmelsen); selve synkroniseringsprotokollen (en posisjonsbestemmelse nullstiller feilen til <c1/>).

seg-a2766c0f19d0 = <s1>Forrige</s1>Optiske linker gjennom atmosfæren

seg-85ad3eb72a80 = <s1>Neste</s1>Tidssynkronisering for telekommunikasjon
