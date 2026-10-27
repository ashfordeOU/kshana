# docs--kind-araim-reference-check: translations (nb)

seg-debc2f07db78 = true

seg-c53da0bf140d = Kilde: <c1/>

seg-82884391dd77 = <c1/> (scenariotype)

seg-8e845ce908ee = Scenariotype i motoren v{ $version }, familie <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-06197409c717 = Publiserte ARAIM-referansevektorer: motorens horisontale og vertikale ARAIM-beskyttelsesnivåer kjørt mot EGNE regneeksempler fra WG-C ARAIM Technical Subgroup, med den toleransen (TOL_PL = { "5e-2" } m) som disse dokumentene selv oppgir. To vektorer er lagret som fixtures, hver med sin hente-URL, hentedato, SHA-256 for kildefilen og side: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) vedlegg D — selvkonsistent, og akseptvektoren — og Milestone { "3" } Report ({ "2016" }) vedlegg A avsnitt A.IX, fremstillingen som forskningslitteraturen siterer. Hver publisert inndata (geometrimatrisen med 10 satellitter og 2 konstellasjoner, varians-diagonalene C_int og C_acc, b_nom, P_sat, P_const og konstantsettet for LPV-200) og hver publisert utdata (VPL, HPL, EMT, sigma_v_acc, K_fa_3 og sigma_3, sigma_ss_3 og b_3 for de to konstellasjonsfeilmodusene) rapporteres ved siden av motorens eget tall og den absolutte differansen. Likningen for beskyttelsesnivået løses IKKE på nytt her: referansens modusliste gis til motorens eksisterende raim::araim_protection_level / araim_integrity_risk, så halveringsmetoden og den gaussiske halealgebraen som testes er motorens egne; bare geometrien, delløsningene, deteksjonsterskelene og den publiserte budsjettfordelingen er bygget for den. EKSTERNT KONTROLLERT mot vektoren fra { "2019" }: VPL { "18.2926" } m mot { "18.3" } m publisert, HPL { "13.4063" } m mot { "13.45" } m, EMT { "7.2997" } m mot { "7.2998" } m, sigma_v_acc { "1.3694" } m mot { "1.3694" } m, og alle seks publiserte mellomresultater innen en halv enhet i siste trykte desimal. Vektoren fra { "2016" } har to interne feil som rapporten oppgir i stedet for å skjule dem — en fortegnsfeil i rad { "3" } av G, og en K_fa_3 evaluert ved { "57" } feilmoduser mens dokumentet oppgir N_fault_max = { "1" } ({ "12" } moduser) — så geometrimellomresultatene gjengis nøyaktig mens beskyttelsesnivåene rapporteres som målte avvik og holdes utenfor akseptverdien; toleransen utvides aldri for å absorbere dem. Hvert utsendt numerisk felt har en enhet og en opphavsklasse, og et avskrevet tall merkes <c1/> slik at det aldri kan forveksles med et beregnet. OMFANG: bare N_fault_max = { "1" } (feilmoduser for én satellitt og én konstellasjon) er implementert, og et tilfelle der forhåndsantakelsene krever samtidige feilundermengder med flere hendelser blir REFUSED i stedet for å avkortes i det stille; feildeteksjon, utelukkelse, kjikvadrat-konsistenskontrollen og omfordelingssteget mot dobbelttelling i referansealgoritmen er utenfor omfanget. Dette gjengir et publisert regneeksempel for en referansealgoritme — det er ikke en sertifisering, en luftdyktighetsartefakt eller en godkjenning.

seg-c16de81ec8da = Én kjøring av <c1/> oppsummeres som: araim-reference-check: { "2" } published WG-C reference vector(s); worst VPL/HPL agreement { "0.0437" } m against the reference's own TOL_PL = { "0.05" } m over { "1" } acceptance vector(s)

seg-b1be6b5632c1 = Valgfrie felt: <c1/>

seg-3f181d41edb5 = Eksempelet <c1/> setter blant annet:

seg-9de6e1b3352d = Resultatetikett (motorens): EXTERNALLY CHECKED — the engine's ARAIM protection levels run against the published worked numerical examples of the EU-U.S. Working Group C ARAIM Technical Subgroup reference airborne algorithm, at the tolerance (TOL_PL) those documents themselves state. Every published figure carries its source UR

seg-693c823c85d1 = Diagrammet motoren skriver for scenarios/araim-reference-check.toml, typen araim-reference-check

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-c5c966ec3c6a = <b>VALIDATED</b> Selve likningen for beskyttelsesnivå med separasjon av løsninger under flere hypoteser: vektet minste kvadraters metode for alle synlige og per feilmodus på en øst/nord/opp-geometri med én klokketilstand per konstellasjon, delløsningenes sigma, løsningsseparasjon Tester: <a1>araim_reference_vectors.rs</a1>.

seg-a99b9cf4c6e8 = <b>VALIDATED</b> Selve likningen for beskyttelsesnivå med separasjon av løsninger under flere hypoteser: vektet minste kvadraters metode for alle synlige og per feilmodus på en øst/nord/opp-geometri. Uavhengig referanse (ExternalDataset): EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } juni { "2019" }), vedlegg D regnet eksempel — publiserte INNDATA (geometrimatrise med 10 satellitter og 2 konstellasjoner, C_int/C_acc-diagonaler, b_nom, P_sat, P_const, LPV-200-konstanter) og publiserte UTDATA (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } og seks mellomresultater for konstellasjonsfeil

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>

seg-f4cf8b629797 = Temaside: <a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = Temaside: <a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>Forrige</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>Neste</s1>ascent-losses
