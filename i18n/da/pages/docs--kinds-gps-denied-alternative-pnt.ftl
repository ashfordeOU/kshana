# docs--kinds-gps-denied-alternative-pnt: translations (da)

seg-b03d56f501c3 = Type

seg-f496b7f4c63a = Kombineret navigator med tyngdekraft + magnetfelt + terræn uden GPS: tre skalare feltkanaler sammenlagt pr. waypoint for en skarpere positionsbestemmelse af driften (lavere CRLB) end med noget enkelt felt.

seg-498b1aea3770 = Diagrammet, som motoren skriver for scenarios/combined-altpnt.toml, type combined-altpnt

seg-c8f93431680a = MODELLED modstandsdygtighed for lagdelt PNT i konflikt (P7): en bruger i et bestridt miljø råder over flere PNT-lag (åbent GNSS, bredbånds-GNSS, en autentificeret konstellation, et augmentations-relæ), hvert med en grundtilgængelighed, en 1σ-nøjagtighed og en sårbarhed over for nægtelse pr. vektor over for den fælles jamming-/spoofing-trussel. Et SEEDET Monte Carlo med sweep over intensitet nægter hvert lag med sandsynligheden clamp(vulnerability·intensity·vector_weight,{ "0,1" }), sammenlægger de overlevende efter den lukkede inversvariansregel σ_fused=(Σ 1/σ_i²)^(−1/2) og rapporterer sandsynligheden for totalt tab (alle lag nægtet), den mediane sammenlagte fejl og statistik over brugbarhed/nægtelse pr. lag mod intensitet. Det overordnede modstandsdygtighedsforhold (sandsynlighed for totalt tab for ét lag mod lagdelt) lander på ~7x under UAFHÆNGIGHEDSANTAGELSEN; et sweep med korreleret nægtelse via én-faktor-gaussisk copula viser derefter, at dette ~7x falder mod { "1" }, når nægtelseskorrelationen stiger (korrelation underminerer lagdeling). En priorfølsomhedsblok lader det overordnede tal variere over de KILDEBELAGTE sårbarhedspriors via mcda-tornado + en Dirichlet-omfordeling af trusselsindsats + percentil-konfidensintervaller. VALIDATED kerne: Monte Carlo-totaltabet konvergerer mod den lukkede uafhængige produktform Π_i p_deny_i (inden for MC-standardfejlen ved et fast seed og stort N); inversvarians-sammenlægningen er en lukket identitet; ved ρ={ "0" } reduceres copulaen til den uafhængige model, og hvert ρ bevarer hvert lags marginale nægtelsesrate. MODELLED: størrelserne for sårbarhed/tilgængelighed/nøjagtighed pr. lag er kildebelagte, men modellerede input (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), og den specifikke størrelse ~7x og kurveformen forhold-mod-korrelation følger af denne parametrisering. En opdeling af overlevelse pr. vektor i § { "4.2" } opløser derefter den fælles RF-trussel i de fire navngivne vektorer (jamming/spoofing/kinetisk/cyber) og rapporterer hver vektors kurve for graciøs forringelse af brugbar PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: det seedede Monte Carlo pr. lag konvergerer mod denne lukkede form; jamming er den skarpeste vektor for den korrelerede RF-baseline, og det RF-immune inertilag er den afgørende overlever. Ikke et certificeret produkt til navigationstilgængelighed.

seg-4dd2bcc206db = Diagrammet, som motoren skriver for scenarios/conflict-resilience.toml, type conflict-resilience

seg-9a58a7b09423 = GPS-nægtet navigation med matchning mod tyngdekortet: et koldatom-gravimeter genfinder en konstant INS-drift ud fra den sekvens af tyngdeanomalier, som det flyver igennem.

seg-c42d90057e9f = Diagrammet, som motoren skriver for scenarios/gravity-map-nav.toml, scenarietype gravity-map

seg-0d7bf5a4f07e = Terrænreferencenavigation uden GPS (TERCOM/SITAN): en radar-/barohøjdemåler afstemmer profilen af terrænhøjden mod en DEM i stil med SRTM for at genfinde INS-driften.

seg-c5e33c7122e2 = Diagrammet, som motoren skriver for scenarios/terrain-nav.toml, type terrain-nav

seg-6bdc150ab25b = Sekventiel (rekursiv) terrænreferencenavigation uden GPS: et partikelfilter kører målemodellen for terrænafstemning epoke for epoke (SITAN som et løbende filter), så en tidsvarierende INS-drift følges langs sporet, hvor det batchbaserede terrain-nav kun genfinder én konstant forskydning.

seg-4aca87f022dc = Diagrammet, som motoren skriver for scenarios/terrain-slam.toml, type terrain-slam

seg-4e31c8daf798 = Register

seg-efd15cff3d32 = MODELLED (resultatbetegnelse)

seg-9d9aeff4f2ee = Kilde: <c1/>

seg-d9fdaf3208ca = GPS-nægtet alternativ PNT (scenarietypefamilie)

seg-9fde6af9e09f = { "5" } scenarietyper i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-0d3b170b9fbc = Emnesider: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Kør én: <c1/>. Alle familier: <a3>KINDS.md</a3>.

seg-6dfd2dc2721a = Kontaktark med de diagrammer, som motoren skriver for typerne i familien GPS-nægtet alternativ PNT

seg-cff60d8c17d2 = GPS-nægtet sekventiel (rekursiv) terrænreferencenavigation: et partikelfilter kører terrænmatchningens målemodel epoke for epoke (SITAN som et løbende filter), så en tidsvarierende INS-drift er tr

seg-9d8f69b51742 = MODELLED lagdelt PNT-modstandsdygtighed over for konflikt (P7): en bruger i et omstridt miljø råder over flere PNT-lag (open-service GNSS, bredbånds-GNSS, en autentificeret konstellation, et augmentationsrelæ), hvert med

seg-28486745bb43 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Valgfrie: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

seg-c2187e8291f9 = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>gravity-map</a1>.

seg-b1ff6f0e1769 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Valgfrie: <c13/>, <c14/>, <c15/>.

seg-3ec7b38184b7 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valgfrie: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-7c777178ee8f = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>terrain-slam</a1>.

seg-c5124441822e = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Valgfrie: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

seg-d78bd011956c = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>combined-altpnt</a1>.

seg-2d95ddbf01c4 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-ab895b157152 = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>conflict-resilience</a1>.

seg-c0ef7d676ec1 = <s1>Forrige</s1>GNSS-målinger positionering og integritet

seg-54b45b00a2f0 = <s1>Næste</s1>Inertial fusion og kvantesensorer
