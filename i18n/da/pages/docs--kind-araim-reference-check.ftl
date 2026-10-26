# docs--kind-araim-reference-check: translations (da)

seg-debc2f07db78 = true

seg-c53da0bf140d = Kilde: <c1/>

seg-82884391dd77 = <c1/> (scenarietype)

seg-8e845ce908ee = Scenarietype i motoren v{ $version }, familie <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-06197409c717 = Publicerede ARAIM-certificeringsreferencevektorer: motorens horisontale og vertikale ARAIM-beskyttelsesniveauer kørt mod ARAIM Technical Subgroups under WG-C EGNE gennemregnede taleksempler, ved den tolerance (TOL_PL = { "5e-2" } m), som disse dokumenter selv angiver. To vektorer er indlagt som fixtures, hver med sin hentnings-URL, hentningsdato, SHA-256 for kildefilen og side: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Appendix D — selvkonsistent, og accept-vektoren — og Milestone { "3" } Report ({ "2016" }) Annex A section A.IX, den fremstilling, som forskningsbibliografierne citerer. Hvert publiceret input (geometrimatrixen med 10 satellitter og 2 konstellationer, diagonalerne for C_int- og C_acc-varianserne, b_nom, P_sat, P_const og LPV-200-konstantsættet) og hvert publiceret output (VPL, HPL, EMT, sigma_v_acc, K_fa_3 og de to konstellationsfejltilstandes sigma_3, sigma_ss_3 og b_3) rapporteres ved siden af motorens eget tal og deres absolutte forskel. Beskyttelsesniveauligningen løses IKKE påny her: referencens tilstandsliste overdrages til motorens eksisterende raim::araim_protection_level / araim_integrity_risk, så bisektionen og den gaussiske haleagebra, der afprøves, er motorens egne; kun geometrien, delløsningerne, detektionstærsklerne og den publicerede budgetfordeling er bygget til den. EKSTERNT KONTROLLERET mod { "2019" }-vektoren: VPL { "18.2926" } m mod { "18.3" } m publiceret, HPL { "13.4063" } m mod { "13.45" } m, EMT { "7.2997" } m mod { "7.2998" } m, sigma_v_acc { "1.3694" } m mod { "1.3694" } m, og alle seks publicerede mellemresultater inden for en halv enhed i deres sidste trykte decimal. { "2016" }-vektoren har to interne fejl, som rapporten angiver i stedet for at skjule — en fortegnsfejl i række { "3" } af G og et K_fa_3 evalueret ved { "57" } fejltilstande, mens dokumentet angiver N_fault_max = { "1" } ({ "12" } tilstande) — så dens geometriske mellemresultater gengives præcist, mens dens beskyttelsesniveauer rapporteres som målte afvigelser og holdes uden for accepttallet; tolerancen udvides aldrig for at rumme dem. Hvert udsendt numerisk felt har en enhed og en proveniensklasse, og et overført tal mærkes <c1/>, så det aldrig kan forveksles med et beregnet. AFGRÆNSNING: kun N_fault_max = { "1" } (fejltilstande for enkeltsatellit og enkeltkonstellation) er implementeret, og et tilfælde, hvis priors kræver samtidige fejldelmængder med flere hændelser, bliver REFUSED i stedet for at blive afkortet i stilhed; fejldetektion, udelukkelse, chi-i-anden-konsistenskontrollen og omfordelingstrinnet mod dobbelttælling i referencealgoritmen er uden for omfanget. Dette gengiver et publiceret referencealgoritme-eksempel — det er ikke en certificering, en luftdygtighedsartefakt eller en godkendelse.

seg-c16de81ec8da = Én kørsel af <c1/> opsummeres som: araim-reference-check: { "2" } publicerede WG-C-referencevektorer; dårligste VPL/HPL-overensstemmelse { "0.0437" } m mod referencens egen TOL_PL = { "0.05" } m over { "1" } accept-vektor(er)

seg-b1be6b5632c1 = Valgfrie felter: <c1/>

seg-3f181d41edb5 = Eksemplet <c1/> angiver blandt andet:

seg-9de6e1b3352d = Resultatmærkat (motorens egen): EKSTERNT KONTROLLERET — motorens ARAIM-beskyttelsesniveauer kørt mod de publicerede gennemregnede taleksempler fra referencealgoritmen for fly fra EU-U.S. Working Group C ARAIM Technical Subgroup, ved den tolerance (TOL_PL), som disse dokumenter selv angiver. Hvert publiceret tal har sin kilde-UR

seg-693c823c85d1 = Diagrammet, som motoren skriver for scenarios/araim-reference-check.toml, type araim-reference-check

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-c5c966ec3c6a = <b>VALIDATED</b> Selve beskyttelsesniveauligningen med solution separation over flere hypoteser: alt-i-sigte og vægtet mindste kvadraters metode pr. fejltilstand på en East/North/Up-geometri med én urtilstand pr. konstellation, delløsningernes sigmaer, solution-separ Tests: <a1>araim_reference_vectors.rs</a1>.

seg-a99b9cf4c6e8 = <b>VALIDATED</b> Selve beskyttelsesniveauligningen med solution separation over flere hypoteser: alt-i-sigte og vægtet mindste kvadraters metode pr. fejltilstand på en East/North/Up-geometri. Uafhængig reference (ExternalDataset): EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } June { "2019" }), Appendix D gennemregnet talekspempel — publicerede INPUT (geometrimatrix med 10 satellitter og 2 konstellationer, C_int/C_acc-diagonaler, b_nom, P_sat, P_const, LPV-200-konstanter) og publicerede OUTPUT (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } og seks mellemresultater for konstellationsfejl

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>

seg-f4cf8b629797 = Emneside: <a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = Emneside: <a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>Forrige</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>Næste</s1>ascent-losses
