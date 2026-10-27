# docs--kind-cislunar-arc-recovery: translations (nb)

seg-debc2f07db78 = true

seg-330cbcd04718 = andel (uten enhet)

seg-8f21a5462b09 = Kilde: <c1/>

seg-e4858b0a33c9 = <c1/> (scenariotype)

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-f994c81583bf = MODELLED test med uavhengig estimator av observerbarhetsterskelen for buelengde i cislunart rom. Denne terskelen er en RANG-avlesning på observerbarhetsmatrisen satt sammen av de ANALYTISKE avstands-Jacobi-radene og den ANALYTISKE variasjonelle tilstandsovergangsmatrisen, og dens kvadratrot-informasjonsfilter-kontroll folder inn de samme radene — en konsistenskontroll mellom to numeriske maskiner, ikke styrking. Denne typen leverer den manglende dommeren: en batch-estimator med minste kvadrater som faktisk GJENVINNER sjefens starttilstand fra simulerte målinger, med måledelderivertene tatt som SENTRALE DIFFERANSER av den sammensatte forovermodellen. Den kaller ingen analytisk Jacobi-rad, ingen variasjonell STM, ingen singulærverdi- eller egenverdidekomponering, ingen rangtoleranse og intet kvadratrot-informasjonsfilter — en kildetekstvakt i tests/cislunar_arc_recovery_reference.rs gjør dette håndhevbart — mens dynamikken (det samme RK4 CR3BP-flyten), startbetingelsene (den samme differensialkorrigerte konstellasjonen), den skalare observerbare og epokerutenettet er delt med vilje og navngitt i den utsendte <c1/>-blokken, fordi to analyser av ett fysisk problem må være enige om fysikken for å være sammenlignbare. To kriterier, hvert sveipet over fem dekader av sin egen grense: STØYFRI GJENVINNING (hver seedet forsøks endelige tilstandsfeil høyst recovery_factor ganger dens a priori-forskyvning — rang-analogen, uten singulærverditoleranse i seg) og MONTE CARLO-ESTIMERBARHET (den målte RMS-posisjonsfeilen over et seedet støyensemble under en oppgitt grense — estimerbarhets-analogen, målt i stedet for predikert). Støtter den plane firetilstanden og den romlige sekstilstanden, DRO / L2 halo / L2 NRHO-familiene, avstands- og avstandshastighetsobservable, og en Måne-sentrert polar parametrisering der transformasjonen anvendes på TILSTANDEN og forovermodellen deriveres på nytt der. MEASURED på det publiserte plane DRO-rutenettet: estimatoren gjenvinner firetilstanden fra { "0.782609" } h mot rangkriteriets { "2.086957" } h ved rel_tol { "1e-6" } (forhold { "0.375" }) — rangterskelen er IKKE bekreftet som en grense for gjenvinnbarhet — mens den målte estimerbarhetsgrensen havner i samme rutenettcelle som den formelle, { "5.739130" } h, og den målte feilkurven gjengir den formelle 1-sigma over { "21" } buelengder til et geometrisk gjennomsnittsforhold på { "0.98" }. MODELLED: konstellasjonsutformingen, epokerutenettet, den ene sporede linken, forskyvningens størrelse, målingens sigma og de to oppgitte grensene. Ikke et sertifisert produkt for navigasjonsytelse.

seg-ada71f37b21b = Én kjøring av <c1/> oppsummeres som: cislunar-arc-recovery | dro family, 4-state, { "4" } s/c, range observable, cartesian parameterisation | { "6.0" } h arc, { "24" } epochs (grid { "0.260870" } h), { "32" } trials, seed { "20260920" } | finite-difference partials, no analytic Jacobian / STM / SVD / SRIF | noise-free recovery from { "0.782609" } h (factor { "1e-2" }) vs Gramian rank threshold { "2.086957" } h | Monte-Carlo estimability from { "5.739130" } h (RMS pos ≤ { "1.000" } km, σ { "1.000" } m) vs Gramian estimability { "5.739130" } h | end-of-arc RMS pos { "0.6026" } km

seg-3d4a2773c32f = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-eb621f41dfbb = Eksempelet <c1/> setter blant annet:

seg-6d584e86deba = forhold (uten enhet)

seg-f7f4d06e661f = cislunar-observability på den identiske

seg-a6cb7ed2ff6d = Resultatetikett (motorens): MODELLED cislunar arc-length recovery test (independent-estimator corroboration of the P6 observability threshold). VALIDATED core: the estimator is the crate's pre-existing weighted Gauss-Newton batch corrector (crate::batch_ls), whose design matrix is a CENTRAL FINITE DIFFERENCE of the composed fo

seg-2fe411ae2153 = Diagrammet motoren skriver for scenarios/cislunar-arc-recovery.toml, typen cislunar-arc-recovery

seg-99dd8cc0e3ef = <b>MODELLED</b> En batch-estimator med minste kvadrater som GJENVINNER sjefens starttilstand fra simulerte målinger mellom satellitter over voksende prefikser av det samme epokerutenettet som rang-mot-bue-tabellen bruker, med måledelderivertene tatt som sentrale differanser Tester: <a1>cislunar_arc_recovery_reference.rs</a1>.

seg-67aab2162719 = <b>MODELLED</b> En batch-estimator med minste kvadrater som GJENVINNER sjefens starttilstand fra simulerte målinger mellom satellitter over voksende prefikser av det samme epokerutenettet. Uavhengig referanse (ReferenceImpl): En separat estimator i denne kodebasen på en annen algoritme og en usammenhengende kodesti: ikke-lineær vektet Gauss-Newton med differansedelderiverte, dens dom avlest som en målt tilstandsgjenvinningsfeil i km og mm/s. Den har ingen uttrykk til felles med Gram-matrisens rang- og kovariansvei, og adskillelsen HÅNDHEVES av en kildetekstvakt i stedet for å bli hevdet. MEASURED på det publiserte plane DRO-rutenettet: th

seg-7be582874f98 = MODELLED cislunar arc-length recovery test (independent-estimator corroboration of the P6 observability threshold). VALIDATED core: the estimator is the crate's pre-existing weighted Gauss-Newton batch corrector (crate::batch_ls), whose design matrix is a CENTRAL FINITE DIFFERENCE of the composed forward model - it calls no analytic measurement Jacobian row, no variational state-transition matrix, no singular-value o (resultat <c1/>)

seg-52fe686b1fdf = MODELLED test med uavhengig estimator av observerbarhetsterskelen for buelengde i cislunart rom. (typekatalog (<c1/>))

seg-48e6e57a0b40 = MODELLED: konstellasjonsutformingen, epokerutenettet, den ene sporede linken, forskyvningens størrelse, målingens sigma og de to oppgitte grensene. (typekatalog (<c1/>))

seg-75f275dcb2d2 = MODELLED: konstellasjonsutformingen, epokerutenettet, den ene sporede linken, forskyvningens størrelse, målingens sigma og de to oppgitte grensene. Ikke et sertifisert produkt for navigasjonsytelse. (kommentar i scenariofilen, linje { "33" } til { "35" })

seg-ea82d9fd6506 = Styrking med uavhengig estimator av terskelen for buelengde i cislunart rom er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-53d57e6dafa6 = <s1>Forrige</s1>campaign

seg-fe3ecf4b55fe = <s1>Neste</s1>cislunar-observability
