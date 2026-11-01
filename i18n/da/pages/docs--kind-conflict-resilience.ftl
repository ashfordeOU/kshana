# docs--kind-conflict-resilience: translations (da)

seg-c4ed27a559df = Emneside: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-216efc4e6fba = Scenarietype i motoren v{ $version }, familie <a1>Alternativ PNT uden GPS</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-98133e74f88a = Familieside: <a1>Alternativ PNT uden GPS</a1>

seg-34f14aa2ee0b = Kilde: <c1/>

seg-a80556cfe1a9 = <c1/> (scenarietype)

seg-c8f93431680a = MODELLED modstandsdygtighed for lagdelt PNT i konflikt (P7): en bruger i et bestridt miljø råder over flere PNT-lag (åbent GNSS, bredbånds-GNSS, en autentificeret konstellation, et augmentations-relæ), hvert med en grundtilgængelighed, en 1σ-nøjagtighed og en sårbarhed over for nægtelse pr. vektor over for den fælles jamming-/spoofing-trussel. Et SEEDET Monte Carlo med sweep over intensitet nægter hvert lag med sandsynligheden clamp(vulnerability·intensity·vector_weight,{ "0,1" }), sammenlægger de overlevende efter den lukkede inversvariansregel σ_fused=(Σ 1/σ_i²)^(−1/2) og rapporterer sandsynligheden for totalt tab (alle lag nægtet), den mediane sammenlagte fejl og statistik over brugbarhed/nægtelse pr. lag mod intensitet. Det overordnede modstandsdygtighedsforhold (sandsynlighed for totalt tab for ét lag mod lagdelt) lander på ~7x under UAFHÆNGIGHEDSANTAGELSEN; et sweep med korreleret nægtelse via én-faktor-gaussisk copula viser derefter, at dette ~7x falder mod { "1" }, når nægtelseskorrelationen stiger (korrelation underminerer lagdeling). En priorfølsomhedsblok lader det overordnede tal variere over de KILDEBELAGTE sårbarhedspriors via mcda-tornado + en Dirichlet-omfordeling af trusselsindsats + percentil-konfidensintervaller. VALIDATED kerne: Monte Carlo-totaltabet konvergerer mod den lukkede uafhængige produktform Π_i p_deny_i (inden for MC-standardfejlen ved et fast seed og stort N); inversvarians-sammenlægningen er en lukket identitet; ved ρ={ "0" } reduceres copulaen til den uafhængige model, og hvert ρ bevarer hvert lags marginale nægtelsesrate. MODELLED: størrelserne for sårbarhed/tilgængelighed/nøjagtighed pr. lag er kildebelagte, men modellerede input (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), og den specifikke størrelse ~7x og kurveformen forhold-mod-korrelation følger af denne parametrisering. En opdeling af overlevelse pr. vektor i § { "4.2" } opløser derefter den fælles RF-trussel i de fire navngivne vektorer (jamming/spoofing/kinetisk/cyber) og rapporterer hver vektors kurve for graciøs forringelse af brugbar PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: det seedede Monte Carlo pr. lag konvergerer mod denne lukkede form; jamming er den skarpeste vektor for den korrelerede RF-baseline, og det RF-immune inertilag er den afgørende overlever. Ikke et certificeret produkt til navigationstilgængelighed.

seg-dd10a00edc2f = Én kørsel af <c1/> opsummeres som: conflict-resilience | { "4" } lag ({ "0" } baseline) | referenceintensitet { "1.00" } | modstandsdygtighedsforhold lukket form 6.73x MC 6.19x (lagdelt mod ét lag) | korrelation underminerer lagdeling: forhold 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | prior-CI [5.51-8.48]x | overlevelse pr. vektor @ ref jam { "26" }% spoof { "80" }% kinetic { "100" }% cyber { "99" }% (skarpest jamming) | ~7x overordnet tal MODELLED, VALIDATED MC->lukket form / sammenlægningsidentitet / copula-marginaler / overlevelse pr. vektor

seg-674bafccbaf7 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-71fcff68edaf = Eksemplet <c1/> angiver blandt andet:

seg-4e3b5bb5a5e7 = GNSS L1 C/A (åben tjeneste)

seg-bd3832c8215d = Resultatmærkat (motorens egen): MODELLED modstandsdygtighed for lagdelt PNT i konflikt (P7). VALIDATED kerne: Monte Carlo-sandsynligheden for totalt tab konvergerer mod den lukkede uafhængige produktform Pi_i p_deny_i (påstået inden for Monte Carlo-standardfejlen ved et fast seed og stort N); inversvarians-positionssammenlægningen sigma_fused = (sum_i 1/sig

seg-4dd2bcc206db = Diagrammet, som motoren skriver for scenarios/conflict-resilience.toml, type conflict-resilience

seg-c0e69524f05d = <b>MODELLED</b> Delscorer pr. dimension over Kshanas egne syv modstandsdygtighedskategorier (ikke DHS-termer), RethinkPNT RDRR-funktioner og Yang-kriterier, hver mærket Modelled med i. Uafhængig reference (InternalConsistency): Håndudledte formler pr. måling: invers-Simpson-diversitet, vægtet middel som sammensat tal, afgrænsede/uafgrænsede varigheder af tidslinjer, svageste-led-niveaustige

seg-2ca37a78e899 = MODELLED modstandsdygtighed for lagdelt PNT i konflikt (P7). VALIDATED kerne: Monte Carlo-sandsynligheden for totalt tab konvergerer mod den lukkede uafhængige produktform Pi_i p_deny_i (påstået inden for Monte Carlo-standardfejlen ved et fast seed og stort N); inversvarians-positionssammenlægningen sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) er en lukket identitet; ved korrelation rho={ "0" } reduceres den gaussiske copula præcist til den uafhængige mo (resultat <c1/>)

seg-d0d834e377ee = MODELLED modstandsdygtighed for lagdelt PNT i konflikt (P7): en bruger i et bestridt miljø råder over flere PNT-lag (åbent GNSS, bredbånds-GNSS, en autentificeret konstellation, et augmentations-relæ), hvert med en grundtilgængelighed, en 1σ-nøjagtighed og en sårbarhed over for nægtelse pr. vektor over for den fælles jamming-/spoofing-trussel. (typekatalog (<c1/>))

seg-3ca12700b54c = Det overordnede modstandsdygtighedsforhold (sandsynlighed for totalt tab for ét lag mod lagdelt) lander på ~7x under UAFHÆNGIGHEDSANTAGELSEN; et sweep med korreleret nægtelse via én-faktor-gaussisk copula viser derefter, at dette ~7x falder mod { "1" }, når nægtelseskorrelationen stiger (korrelation underminerer lagdeling). (typekatalog (<c1/>))

seg-70e4fdff099f = MODELLED: størrelserne for sårbarhed/tilgængelighed/nøjagtighed pr. lag er kildebelagte, men modellerede input (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), og den specifikke størrelse ~7x og kurveformen forhold-mod-korrelation følger af denne parametrisering. (typekatalog (<c1/>))

seg-33541cca61b6 = En bruger i et bestridt miljø råder over fire RF-PNT-lag, der alle bruger det samme bånd og derfor deler nægtelsesvektoren jamming/spoofing — det skrøbelige, korrelerede tilfælde. Scenariet rapporterer: * sandsynlighed for totalt tab mod trusselsintensitet (Monte Carlo mod den lukkede uafhængige produktform, det konvergerer mod), * modstandsdygtighedsforholdet på ~7x mellem lagdelt og ét lag under uafhængighedsantagelsen, * hvordan dette ~7x falder til (kommentar i scenariefilen, linje { "3" } til { "15" })

seg-83badfe4784d = Hver størrelse pr. lag er et MODELLED input med proveniens; se src/conflict_threat_params.rs for de kildebelagte [min, nominel, max]-priors og profilerne for modtagelighed pr. vektor (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Hvis <c1/> udelades, køres den samme kildebelagte basislinje med fire lag; den er skrevet ud her — inklusive hvert lags vector_profile — af hensyn til gennemsigtighed. (kommentar i scenariefilen, linje { "17" } til { "22" })

seg-bb182ed41520 = Scoring tilpasset rammeværk for PNT-modstandsdygtighed er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-6a42653a8a0f = <s1>Forrige</s1>combined-altpnt

seg-2bd3e9d1505c = <s1>Næste</s1>constellation-design
