# docs--kind-conflict-resilience: translations (nb)

seg-c4ed27a559df = Temaside: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-216efc4e6fba = Scenariotype i motoren v{ $version }, familie <a1>Alternativ PNT uten GPS</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-98133e74f88a = Familieside: <a1>Alternativ PNT uten GPS</a1>

seg-34f14aa2ee0b = Kilde: <c1/>

seg-a80556cfe1a9 = <c1/> (scenariotype)

seg-c8f93431680a = MODELLED robusthet for lagdelt PNT i konflikt (P7): en bruker i et omstridt miljø har flere PNT-lag (åpen GNSS-tjeneste, bredbånds-GNSS, en autentisert konstellasjon, et augmentasjonsrelé), hver med en basistilgjengelighet, en 1σ-nøyaktighet og en sårbarhet for avvisning per vektor mot den felles jamming-/spoofing-trusselen. Et intensitetssveipet SEEDET Monte Carlo avviser hvert lag med sannsynlighet clamp(vulnerability·intensity·vector_weight,{ "0,1" }), fusjonerer de overlevende med den lukkede inversvariansregelen σ_fused=(Σ 1/σ_i²)^(−1/2), og rapporterer sannsynligheten for totaltap (alle lag avvist), median fusjonert feil og bruks-/avvisningsstatistikk per lag mot intensitet. Hovedforholdet for robusthet (sannsynlighet for totaltap med ett lag mot lagdelt) havner på ~7x under ANTAKELSEN OM UAVHENGIGHET; et énfaktors gaussisk copula-sveip med korrelert avvisning viser deretter at ~7x kollapser mot { "1" } når korrelasjonen i avvisning stiger (korrelasjon slår ut lagdeling). En blokk for forhåndssensitivitet lar hovedtallet variere over de KILDEBELAGTE sårbarhets-forhåndsfordelingene via mcda-tornado + en Dirichlet-omfordeling av trusselinnsats + persentil-konfidensintervaller. VALIDATED kjerne: Monte Carlo-totaltapet konvergerer mot det lukkede uavhengige produktet Π_i p_deny_i (innen MC-standardfeil ved fast seed og stort N); inversvarians-fusjonen er en lukket identitet; ved ρ={ "0" } reduseres copulaen til den uavhengige modellen og hver ρ bevarer hvert lags marginale avvisningsrate. MODELLED: størrelsene på sårbarhet/tilgjengelighet/nøyaktighet per lag er kildebelagte, men modellerte inndata (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), og den spesifikke størrelsen ~7x og formen på kurven for forhold mot korrelasjon følger av denne parametriseringen. En oppdeling av overlevelse per vektor i § { "4.2" } løser deretter den felles RF-trusselen opp i de fire navngitte vektorene (jamming/spoofing/kinetisk/cyber) og rapporterer hver vektors kurve for elegant degradering av brukbar PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: det seedede Monte Carlo per lag konvergerer mot den lukkede formen; jamming er den skarpeste vektoren for den korrelerte RF-grunnlinjen, og det RF-immune treghetslaget er den avgjørende overlevende. Ikke et sertifisert produkt for navigasjonstilgjengelighet.

seg-dd10a00edc2f = Én kjøring av <c1/> oppsummeres som: conflict-resilience | { "4" } layers ({ "0" } baseline) | reference intensity { "1.00" } | resilience ratio closed-form 6.73x MC 6.19x (layered vs single-layer) | correlation defeats layering: ratio 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | prior CI [5.51-8.48]x | per-vector survival @ ref jam { "26" }% spoof { "80" }% kinetic { "100" }% cyber { "99" }% (sharpest jamming) | ~7x headline MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

seg-674bafccbaf7 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-71fcff68edaf = Eksempelet <c1/> setter blant annet:

seg-4e3b5bb5a5e7 = GNSS L1 C/A (åpen tjeneste)

seg-bd3832c8215d = Resultatetikett (motorens): MODELLED layered-PNT conflict resilience (P7). VALIDATED core: the Monte-Carlo total-loss probability converges to the closed-form independent product Pi_i p_deny_i (asserted within Monte-Carlo standard error at a fixed seed and large N); the inverse-variance position fuse sigma_fused = (sum_i 1/sig

seg-4dd2bcc206db = Diagrammet motoren skriver for scenarios/conflict-resilience.toml, typen conflict-resilience

seg-c0e69524f05d = <b>MODELLED</b> Delskårer per dimensjon over Kshanas egne syv robusthetskategorier (ikke DHS-begreper), RethinkPNT RDRR-funksjoner og Yang-kriterier, hver merket modellert med i. Uavhengig referanse (InternalConsistency): Håndutledede formler per metrikk: invers Simpson-diversitet, vektet gjennomsnitt som sammensatt skår, avgrensede/uavgrensede tidslinjevarigheter, svakeste-ledd-nivåstige

seg-2ca37a78e899 = MODELLED layered-PNT conflict resilience (P7). VALIDATED core: the Monte-Carlo total-loss probability converges to the closed-form independent product Pi_i p_deny_i (asserted within Monte-Carlo standard error at a fixed seed and large N); the inverse-variance position fuse sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) is a closed-form identity; at correlation rho={ "0" } the Gaussian copula reduces exactly to the independent mo (resultat <c1/>)

seg-d0d834e377ee = MODELLED robusthet for lagdelt PNT i konflikt (P7): en bruker i et omstridt miljø har flere PNT-lag (åpen GNSS-tjeneste, bredbånds-GNSS, en autentisert konstellasjon, et augmentasjonsrelé), hver med en basistilgjengelighet, en 1σ-nøyaktighet og en sårbarhet for avvisning per vektor mot den felles jamming-/spoofing-trusselen. (typekatalog (<c1/>))

seg-3ca12700b54c = Hovedforholdet for robusthet (sannsynlighet for totaltap med ett lag mot lagdelt) havner på ~7x under ANTAKELSEN OM UAVHENGIGHET; et énfaktors gaussisk copula-sveip med korrelert avvisning viser deretter at ~7x kollapser mot { "1" } når korrelasjonen i avvisning stiger (korrelasjon slår ut lagdeling). (typekatalog (<c1/>))

seg-70e4fdff099f = MODELLED: størrelsene på sårbarhet/tilgjengelighet/nøyaktighet per lag er kildebelagte, men modellerte inndata (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), og den spesifikke størrelsen ~7x og formen på kurven for forhold mot korrelasjon følger av denne parametriseringen. (typekatalog (<c1/>))

seg-33541cca61b6 = En bruker i et omstridt miljø har fire RF-PNT-lag som alle ligger i samme bånd og derfor deler avvisningsvektoren for jamming/spoofing — det skjøre, korrelerte tilfellet. Scenarioet rapporterer: * sannsynlighet for totaltap mot trusselintensitet (Monte Carlo mot det lukkede uavhengige produktet det konvergerer mot), * forholdet på ~7x for lagdelt mot ett lag under antakelsen om uavhengighet, * hvordan dette ~7x kollapser til (kommentar i scenariofilen, linje { "3" } til { "15" })

seg-83badfe4784d = Hver størrelse per lag er en MODELLED inndata med opphav; se src/conflict_threat_params.rs for de kildebelagte forhåndsfordelingene [min, nominell, maks] og profilene for mottakelighet per vektor (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Hvis <c1/> utelates, kjøres den samme kildebelagte grunnlinjen med fire lag; den er skrevet ut her — inkludert hvert lags vector_profile — for åpenhet. (kommentar i scenariofilen, linje { "17" } til { "22" })

seg-bb182ed41520 = Skåring på linje med rammeverk for PNT-robusthet er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-6a42653a8a0f = <s1>Forrige</s1>combined-altpnt

seg-2bd3e9d1505c = <s1>Neste</s1>constellation-design
