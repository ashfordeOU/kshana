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

seg-04310cd6cbec = MODELLED feil- og anomalideteksjon for kvante-PNT-systemer: en merket feilkatalog (klokkens frekvenssprang, drift og tap av lås; sensorens skjevhetssprang og bortfall), en ROC AUC for deteksjonsstatistikken (med et bootstrap-konfidensintervall fra den eksternt validerte eval_stats) og en minste detekterbare feil ved en fast falsk-alarmrate, der den kvanteklokke-støttede monitoren (lavere støy) oppdager mindre feil, som ærlig TradeEvidence + representativitet. Gaussisk modell for deteksjonsstatistikken (AUC = Phi(mu/(sigma*sqrt2))); modellerer klassen, illustrative parametere fra offentlige kilder, ingen TRL, ingen flyging og ingen sertifisering.

seg-2f1d14239d1a = Diagrammet motoren skriver for scenarios/quantum-anomaly-detect.toml, type quantum-anomaly-detect

seg-790fbfdd80f0 = MODELLED GNSS-fri kvantenavigasjon: under et GNSS-bortfall, et inertialbudsjett for kvante (kaldatom-interferometer) mot et klassisk INS av navigasjonsklasse, med vekst av posisjonsfeil over utløpet, holdover til en posisjonsterskel og avveiningen mellom kvante og klassisk som ærlig TradeEvidence med representativitet. Ærlig merknad om observerbarhet: uten ekstern posisjonsbestemmelse er akselerometerets skjevhet ikke observerbar, så feilen vokser; kvantesensoren bremser, men tetter ikke dette gapet. Illustrative enhetsparametere fra offentlige kilder; modellerer klassen, ingen TRL, ingen flyging og ingen sertifisering.

seg-1bdbf1a737b2 = Diagrammet motoren skriver for scenarios/quantum-gnss-free-nav.toml, type quantum-gnss-free-nav

seg-eb55d253dd11 = Avveining mellom kvante og klassisk PNT ({ "13503" }): fordelen for holdover i tid og holdover i inertial av en kandidatklokke (en målt ADEV-kurve, som er det avgjørende punktet for forsvarbarhet, eller en kvanteklokkeklasse) mot en klassisk grunnlinjeklasse, med forbeholdet om antakelsen for langtidsgulvet (long-tau) ført på artefakten, pluss en omhylling av robusthet mot tid uten GNSS. MODELLED; kvantifiserer (validerer aldri) en partnerenhet. Kandidatklokken er en målt kurve (<c1/> + <c2/>, lik lengde, minst { "2" } punkter; den vinner når begge formene er oppgitt) eller en <c3/>.

seg-c74c63ffd859 = Diagrammet motoren skriver for scenarios/quantum-trade.toml, type quantum-trade
