# docs--kinds-gnss-measurements-positioning-and-integrity: translations (nb)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-06197409c717 = Publiserte ARAIM-referansevektorer: motorens horisontale og vertikale ARAIM-beskyttelsesnivåer kjørt mot EGNE regneeksempler fra WG-C ARAIM Technical Subgroup, med den toleransen (TOL_PL = { "5e-2" } m) som disse dokumentene selv oppgir. To vektorer er lagret som fixtures, hver med sin hente-URL, hentedato, SHA-256 for kildefilen og side: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) vedlegg D — selvkonsistent, og akseptvektoren — og Milestone { "3" } Report ({ "2016" }) vedlegg A avsnitt A.IX, fremstillingen som forskningslitteraturen siterer. Hver publisert inndata (geometrimatrisen med 10 satellitter og 2 konstellasjoner, varians-diagonalene C_int og C_acc, b_nom, P_sat, P_const og konstantsettet for LPV-200) og hver publisert utdata (VPL, HPL, EMT, sigma_v_acc, K_fa_3 og sigma_3, sigma_ss_3 og b_3 for de to konstellasjonsfeilmodusene) rapporteres ved siden av motorens eget tall og den absolutte differansen. Likningen for beskyttelsesnivået løses IKKE på nytt her: referansens modusliste gis til motorens eksisterende raim::araim_protection_level / araim_integrity_risk, så halveringsmetoden og den gaussiske halealgebraen som testes er motorens egne; bare geometrien, delløsningene, deteksjonsterskelene og den publiserte budsjettfordelingen er bygget for den. EKSTERNT KONTROLLERT mot vektoren fra { "2019" }: VPL { "18.2926" } m mot { "18.3" } m publisert, HPL { "13.4063" } m mot { "13.45" } m, EMT { "7.2997" } m mot { "7.2998" } m, sigma_v_acc { "1.3694" } m mot { "1.3694" } m, og alle seks publiserte mellomresultater innen en halv enhet i siste trykte desimal. Vektoren fra { "2016" } har to interne feil som rapporten oppgir i stedet for å skjule dem — en fortegnsfeil i rad { "3" } av G, og en K_fa_3 evaluert ved { "57" } feilmoduser mens dokumentet oppgir N_fault_max = { "1" } ({ "12" } moduser) — så geometrimellomresultatene gjengis nøyaktig mens beskyttelsesnivåene rapporteres som målte avvik og holdes utenfor akseptverdien; toleransen utvides aldri for å absorbere dem. Hvert utsendt numerisk felt har en enhet og en opphavsklasse, og et avskrevet tall merkes <c1/> slik at det aldri kan forveksles med et beregnet. OMFANG: bare N_fault_max = { "1" } (feilmoduser for én satellitt og én konstellasjon) er implementert, og et tilfelle der forhåndsantakelsene krever samtidige feilundermengder med flere hendelser blir REFUSED i stedet for å avkortes i det stille; feildeteksjon, utelukkelse, kjikvadrat-konsistenskontrollen og omfordelingssteget mot dobbelttelling i referansealgoritmen er utenfor omfanget. Dette gjengir et publisert regneeksempel for en referansealgoritme — det er ikke en sertifisering, en luftdyktighetsartefakt eller en godkjenning.

seg-693c823c85d1 = Diagrammet motoren skriver for scenarios/araim-reference-check.toml, typen araim-reference-check

seg-2ffccc9c1eff = Pseudoavstandssimulering i måledomenet (Klobuchar-iono, Saastamoinen/Niell-tropo) + RAIM.

seg-47ee40d4eb73 = Diagrammet motoren skriver for scenarios/gnss-sim-raim.toml, typen gnss-sim

seg-eb7e0c2feb2b = RAIM med øyeblikksbilde / løsningsseparasjon / ARAIM med HPL/VPL og et Stanford-diagram.

seg-ce7f6130ddee = Diagrammet motoren skriver for scenarios/integrity-raim.toml, typen integrity

seg-b7b67e03f125 = Enkeltpunktsposisjonering fra virkelige observasjoner: løs en mottakers posisjon fra en RINEX { "3" }-observasjonsfil og en fil med kringkastet navigasjon (kodepseudoavstander, kringkastet efemeride, Klobuchar-ionosfære, Saastamoinen/Niell-troposfære), eventuelt validert mot en oppmålt koordinat.

seg-d76d59644d84 = Diagrammet motoren skriver for scenarios/pvt-abmf.toml, type pvt

seg-edfcb546d9de = Budsjett for sanntidsprediksjon av månens referansesystem og jordorientering: P4 tabell { "1" } (konsistenskontrollen av rammefeil: etterbehandlet ~{ "0.27" } m ↔ ~{ "0.010" } ms og sanntid ~{ "15" } m ↔ ~{ "0.5" } ms, der hver rammeposisjon uttrykkes som sin tilsvarende UT1-feil via L19-vektarmen Δr = D_EM·ω⊕·ΔUT1) og tabell { "2" } (målt UT1-prediksjonsfeil mot horisont: L18-kurven lest rett av den virkelige IERS finals2000A-serien, det endelige gulvet Bulletin A − Bulletin B og persistensprediktorens feil over flere dager, hver avbildet til en posisjon i månens ramme med L19), pluss L21-budsjettet for rammefeil i sanntid som kvadratroten av kvadratsummen (EOP + efemeride + realiseringsgulv). VALIDATED lukket form (L19-vektarmen, ω⊕ kontrollert mot CIO-rotasjonsvinkelen for jorden) og VALIDATED virkelige data (L18-kurven rett av de virkelige radene i finals2000A); MODELLED er størrelsene på OD-kovariansen for månereléet og gulvet for realisering av rammen (representative tildelinger) og persistensprediktoren (ikke IERS' operative Bulletin A-algoritme). Ikke et sertifisert sanntidsprodukt for referansesystem.

seg-2721ed7727bb = Diagrammet motoren skriver for scenarios/realtime-frame-eop.toml, type realtime-frame-eop

seg-5f25c5b71f0c = Modell av romværmiljøet: indekser for solaktivitet (F10.7/F10.7a) og geomagnetisk aktivitet (Kp, med den definisjonsmessige tabellen Kp↔ap), eksosfærisk temperatur etter Jacchia-1971 som de driver (validert mot publiserte verdier for solminimum, middels og solmaksimum), og termosfærisk nøytral tetthet etter Jacchia-1971 ved den eksosfæriske døgnmiddeltemperaturen mot den aktivitetsfrie statiske profilen ved et sett høyder: avhengigheten av solsyklusen i tettheten som den statiske atmosfæren utelater. MODELLED: tettheten stemmer med tettheter avledet fra akselerometre (TOLEOS CHAMP og GRACE) innenfor en faktor { "2" } ved solmaksimum, men er omtrent 1.7x for tett i solminimum { "2008" }.

seg-c1c6f2f73fb5 = Diagrammet motoren skriver for scenarios/space-weather.toml, type space-weather

seg-4e31c8daf798 = Register

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-c9cf40c5e609 = Kilde: <c1/>

seg-569fac649b5d = GNSS-målinger, posisjonsbestemmelse og integritet (scenariotypefamilie)

seg-63c3a7483268 = { "6" } scenariotyper i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-33a602147cc2 = Temasider: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Kjør én: <c1/>. Alle familier: <a5>KINDS.md</a5>.

seg-9c60c8803b6b = Kontaktark over diagrammene motoren skriver for typene i familien GNSS-målinger, posisjonsbestemmelse og integritet

seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

seg-6698e12e148b = Enkeltpunktsposisjonering fra reelle observasjoner: løs en mottakers posisjon fra en RINEX { "3" } observasjonsfil og en kringkastet navigasjonsfil (kodepseudoavstander, kringkastet efemeride, Klobuchar-iono, Saastamo

seg-da89c260b1a3 = Publiserte ARAIM-referansevektorer (certification reference vectors): motorens horisontale og vertikale ARAIM-beskyttelsesnivåer kjørt mot WG-C ARAIM Technical Subgroups EGNE utregnede tallanalyseeksempler, med tole

seg-7a750a89c9c4 = Romværmiljømodell: sol- (F10.7/F10.7a) og geomagnetiske (Kp, med den definisjonsmessige Kp↔ap-tabellen) aktivitetsindekser, Jacchia-1971 eksosfæretemperaturen de driver (validert mot publis

seg-d79d4d58275b = Budsjett for sanntids månereferansesystem / prediksjon av jordorientering: P4 Tabell { "1" } (konsistenssjekken av referansesystemfeil — etterbehandlet ~{ "0.27" } m ↔ ~{ "0.010" } ms og sanntid ~{ "15" } m ↔ ~{ "0.5" } ms, hver posisjon i referansesystemet uttr

seg-dc783268156c = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Valgfrie: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-7b110aacdb27 = <b>Register:</b> MODELLED { "6" } · VALIDATED { "4" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>integrity</a1>.

seg-d444fb35cae9 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>. Valgfrie: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-b651ec58bcba = <b>Register:</b> VALIDATED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>gnss-sim</a1>.

seg-b9a21187317d = Obligatoriske felt: <c1/>, <c2/>. Valgfrie: <c3/>, <c4/>, <c5/>, <c6/>.

seg-143dc4fd1d44 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>pvt</a1>.

seg-9ca1f6783e8e = Obligatoriske felt: ingen. Valgfrie: <c1/>.

seg-415f1fa78518 = <b>Register:</b> VALIDATED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>araim-reference-check</a1>.

seg-6c4655b35c65 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>.

seg-1e5052c0bce7 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>space-weather</a1>.

seg-64c512530ee6 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-1c244958d3c4 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>realtime-frame-eop</a1>.

seg-d4adf4283480 = <s1>Forrige</s1>Konstellasjoner, dekning og geometri

seg-2cdfd7f8bfb3 = <s1>Neste</s1>Alternativ PNT uten GPS
