# docs--kinds-inertial-fusion-and-quantum-sensors: translations (nb)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-ec26df467b88 = Felles Kalman-sensorfusjon for PNT over de samme hybride inndataene.

seg-c8a1c797f4b1 = Diagrammet motoren skriver for scenarios/fusion-pnt.toml, typen fusion

seg-38df285a3f25 = Løst og tett koblet GNSS/INS-feiltilstands-EKF.

seg-7d993b676006 = Diagrammet motoren skriver for scenarios/gnss-ins.toml, typen gnss-ins

seg-c6edf89eb8d4 = 17-tilstands hybrid kvante+klassisk tett koblet GNSS/INS-UKF (MODELLED): { "15" } INS-feiltilstander + CAI-avledet korreksjon av akselerometerbias + en klokke med 2 tilstander (fase+frekvens) fra q-parameter-klokkemotoren, drevet av den avgrensede CAI-feilmodellen. Kvalitetsmålet er filterets selvkonsistens (NEES + innovasjonshvithet mot χ²-grenser), en selvkonsistensuttalelse, IKKE en garanti for nøyaktighet i den virkelige verden. Kun simulering; ingen TRL>{ "3" }, ingen flyvearv, ingen ekstern validering.

seg-2968660fa880 = Diagrammet motoren skriver for scenarios/hybrid-ukf.toml, typen hybrid-ukf

seg-22cd963c7042 = Hybrid PNT-capstone: klokke + IMU + støtte fra tidsoverføring.

seg-52378a7b074c = Diagrammet motoren skriver for scenarios/hybrid-pnt.toml, typen hybrid

seg-bdedf28adc48 = Treghetsbasert dødregning med 1 frihetsgrad under et GNSS-avbrudd.

seg-873c402bb724 = Diagrammet motoren skriver for scenarios/imu-deadreckoning.toml, typen inertial

seg-5b9a6efe6337 = Feilmodell for INS/TRN-glidning: posisjonsfeil mot glidningsvarighet, bygd fra IMU-koeffisienter i stedet for å sveipe en antatt driftrate. Fem vekstbidrag — akselerometerbias, gyrobias-tilt gjennom tyngdekraften, velocity random walk, angle random walk og skalafaktor mot tilbakelagt distanse — hvert propagert gjennom en lokal-nivå treghetsfeilmodell med ni tilstander og Schuler-tilbakekobling ved en oppgitt breddegrad og høyde (de ledende lovene for kort glidning t², t³, t^{ "1.5" }, t^{ "2.5" } og t¹/t² rapporteres ved siden av) og kombinert etter en OPPGITT regel (kvadratroten av kvadratsummen som standard, eller lineær sum, eller deterministisk sum med stokastisk rss; alle tre beregnes ved hver kjøring slik at valget er synlig i stedet for skjult). Glidningsvarighetene som når posisjonsterskler levert av kalleren ({ "10" } m og { "50" } m som standard) finnes med motorens eksisterende halvering, hver med en oppdeling per bidrag som navngir den dominerende kilden, og krysningen for hvert enkelt bidrag inverteres i tillegg algebraisk slik at de to stemmer overens. En modus med terrengrelativ navigasjon (TRN) begrenser glidningen med periodiske posisjonsbestemmelser og rapporterer det største intervallet mellom dem som holder hver terskel; en posisjonsbestemmelse kun for posisjon lar hastighetsfeil og tilt leve videre over posisjonsbestemmelsen, så den begrenser ikke alltid glidningen ved noen rate, og rapporten sier det i stedet for å returnere null. MODELLED: IMU-klassens koeffisienter er representative båndverdier, ikke et datablad, og restfeilen i terrengposisjonsbestemmelsen er en inndata. En terskel som ikke nås, rapporteres som null med en status, aldri som en nullverdi. Ikke et sertifisert ytelsesprodukt for treghetsnavigasjon.

seg-134a4c91da3a = Diagrammet motoren skriver for scenarios/ins-trn-coast.toml, typen ins-trn-coast

seg-04310cd6cbec = MODELLED feil- og anomalideteksjon for kvante-PNT-systemer: en merket feilkatalog (klokkens frekvenssprang, drift og tap av lås; sensorens skjevhetssprang og bortfall), en ROC AUC for deteksjonsstatistikken (med et bootstrap-konfidensintervall fra den eksternt validerte eval_stats) og en minste detekterbare feil ved en fast falsk-alarmrate, der den kvanteklokke-støttede monitoren (lavere støy) oppdager mindre feil, som ærlig TradeEvidence + representativitet. Gaussisk modell for deteksjonsstatistikken (AUC = Phi(mu/(sigma*sqrt2))); modellerer klassen, illustrative parametere fra offentlige kilder, ingen TRL, ingen flyging og ingen sertifisering.

seg-2f1d14239d1a = Diagrammet motoren skriver for scenarios/quantum-anomaly-detect.toml, type quantum-anomaly-detect

seg-790fbfdd80f0 = MODELLED GNSS-fri kvantenavigasjon: under et GNSS-bortfall, et inertialbudsjett for kvante (kaldatom-interferometer) mot et klassisk INS av navigasjonsklasse, med vekst av posisjonsfeil over utløpet, holdover til en posisjonsterskel og avveiningen mellom kvante og klassisk som ærlig TradeEvidence med representativitet. Ærlig merknad om observerbarhet: uten ekstern posisjonsbestemmelse er akselerometerets skjevhet ikke observerbar, så feilen vokser; kvantesensoren bremser, men tetter ikke dette gapet. Illustrative enhetsparametere fra offentlige kilder; modellerer klassen, ingen TRL, ingen flyging og ingen sertifisering.

seg-1bdbf1a737b2 = Diagrammet motoren skriver for scenarios/quantum-gnss-free-nav.toml, type quantum-gnss-free-nav

seg-eb55d253dd11 = Avveining mellom kvante og klassisk PNT ({ "13503" }): fordelen for holdover i tid og holdover i inertial av en kandidatklokke (en målt ADEV-kurve, som er det avgjørende punktet for forsvarbarhet, eller en kvanteklokkeklasse) mot en klassisk grunnlinjeklasse, med forbeholdet om antakelsen for langtidsgulvet (long-tau) ført på artefakten, pluss en omhylling av robusthet mot tid uten GNSS. MODELLED; kvantifiserer (validerer aldri) en partnerenhet. Kandidatklokken er en målt kurve (<c1/> + <c2/>, lik lengde, minst { "2" } punkter; den vinner når begge formene er oppgitt) eller en <c3/>.

seg-c74c63ffd859 = Diagrammet motoren skriver for scenarios/quantum-trade.toml, type quantum-trade

seg-4e31c8daf798 = Register

seg-9095869ec445 = { "9" } scenariotyper i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-efd15cff3d32 = MODELLED (resultatetikett)

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-e6f2ab1647e2 = Kilde: <c1/>

seg-23762f3a250b = Treghets-, fusjons- og kvantesensorer (scenariotypefamilie)

seg-6ec3ad751007 = Temasider: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Kjør én: <c1/>. Alle familier: <a4>KINDS.md</a4>.

seg-0e73a37b716b = Kontaktark over diagrammene motoren skriver for typene i familien Treghets-, fusjons- og kvantesensorer

seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

seg-084cf4eeccb5 = Hybrid kvante+klassisk tett koblet GNSS/INS-UKF med 17 tilstander (MODELLED): { "15" } INS-feiltilstander + CAI-utledet korreksjon av akselerometerbias + en klokke med 2 tilstander (fase+frekvens) fra q-parameter-klokkemotoren

seg-a7d3c32b29b3 = Feilmodell for INS/TRN-coasting: posisjonsfeil mot coastvarighet, bygget ut fra IMU-koeffisienter i stedet for å sveipes som en antatt driftrate.

seg-beb568dec44f = MODELLED GNSS-fri kvantenavigasjon: under et GNSS-bortfall, et treghetsbudsjett med kvante (kaldatom-interferometer) mot et klassisk INS av navigasjonsklasse — vekst i posisjonsfeil over coasten, holdover t

seg-d948ea4d1f33 = MODELLED feil-/anomalideteksjon for kvante-PNT-systemer: en merket feilkatalog (klokkens frekvenshopp/drift/låstap; sensorens biashopp/utfall), en deteksjonsstatistikk med ROC AUC (med et bootstrap-KI

seg-48e72d451a50 = Avveining kvante mot klassisk PNT ({ "13503" }): nytten av tidssynkroniserings-holdover + treghets-holdover for en kandidatklokke (en målt ADEV-kurve — hengselen for forsvarbarhet — eller en kvanteklokkeklasse) mot en klassisk gru

seg-5330b47bc0b6 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valgfrie: <c7/>.

seg-75867e8b4b4f = <b>Register:</b> MODELLED { "6" } · VALIDATED { "2" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>inertial</a1>.

seg-fdf140d4ce68 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-44c6371da5f9 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>hybrid</a1>.

seg-3246c9e1e0cb = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valgfrie: <c11/>.

seg-e2bd8fd0d9e5 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>fusion</a1>.

seg-d0790a2643ae = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valgfrie: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

seg-85ab600e3050 = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>hybrid-ukf</a1>.

seg-3bbd5ce09bee = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valgfrie: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

seg-08ad3969f65b = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>gnss-ins</a1>.

seg-1703619ca20e = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-ab3453d1ee51 = <b>Register:</b> VALIDATED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>ins-trn-coast</a1>.

seg-a77cdf6e8e31 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>.

seg-b05e96ce392d = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>quantum-gnss-free-nav</a1>.

seg-3f3e48045d31 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-cbefb1538dec = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>quantum-anomaly-detect</a1>.

seg-6eee03151521 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>. Valgfrie: <c5/>, <c6/>, <c7/>, <c8/>.

seg-6cb57dc94549 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>quantum-trade</a1>.

seg-b6c31bdda166 = <s1>Forrige</s1>Alternativ PNT uten GPS

seg-0585e4ae329e = <s1>Neste</s1>Jamming, spoofing og spekteret
