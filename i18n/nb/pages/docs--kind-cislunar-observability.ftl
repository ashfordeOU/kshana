# docs--kind-cislunar-observability: translations (nb)

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-6d584e86deba = forhold (uten enhet)

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-258f128cea60 = Kilde: <c1/>

seg-f0c7758e472f = <c1/> (scenariotype)

seg-7ccd0a3babb8 = MODELLED plan observerbarhet for en cislunar konstellasjon (P6): sporer en differensialkorrigert plan DRO-konstellasjon med fire romfartøyer ved hjelp av avstandsmåling mellom satellitter og rapporterer hvor mye av et romfartøys firetilstand [x,y,ẋ,ẏ] buen gjør observerbar. Sender ut ({ "1" }) rang-mot-buelengde-tabellen for én enkelt link med kun avstand — øyeblikkelig rang 1, voksende mot full firetilstand etter hvert som buen forlenges (P6 tabell { "1" }); ({ "2" }) egenverdispekteret og kondisjonstallet til observerbarhets-Gram-matrisen over buen; ({ "3" }) sammenligningen av øyeblikkelig rang for kun avstand mot avstand pluss avstandshastighet (Doppler-spaken i utformingen) pluss rapporteringen av GDOP som er singulær for kun avstand og definert for avstand pluss hastighet; og ({ "4" }) en uavhengig SRIF-kryssvalidering der den posteriore kovariansen blir endelig og velkondisjonert nøyaktig ved buen der den observerbare rangen når fire. VALIDATED kjerne: den observerbare rangen er en rangavslørende singulærverditerskel kryssjekket mot Gram-matrisens egenrang; egenverdispekteret følger de spektrale invariantene (trace=Σλ, det=Πλ, Frobenius²=Σλ²); den variasjonelle STM-en er den differanse-validerte CR3BP-STM-en; avstands- og avstandshastighets-Jacobi-radene er differanse-validerte analytiske delderiverte (kryssjekket mot crate-ens 3D-observerbare for avstandshastighet); de fire startbetingelsene er differensialkorrigerte plane DRO-er som lukker til et stramt periodisitetsresidual og er retrograde; rangovergangen er kryssvalidert mot crate-ens kvadratrot-informasjonsfilter (posterior kovarians endelig nøyaktig ved full rang, cond(P)=cond(OᵀO)); et rangmangelfullt øyeblikksbilde flagges som GDOP-udefinert (fim condition=inf), aldri som en falsk endelig verdi — den samme vakten mot singulær geometri som pvt::solve_spp anvender. MODELLED: konstellasjonsutformingen (DRO-perilunamplituder og -faser) og den spesifikke rangprogresjonen den gir. Ikke et sertifisert produkt for navigasjonsytelse.

seg-a59f2fa9efb9 = Én kjøring av <c1/> oppsummeres som: cislunar-observability | { "4" } s/c ({ "3" } refs) | { "6.0" } h arc, { "24" } epochs | rank { "1" } → { "4" } of { "4" } over arc | Gramian λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | instantaneous rank range-only { "2" } → range+rate { "4" } ({ "3" } links) | GDOP range-only undefined range+rate { "6.353" } | DRO ICs (max periodicity residual { "4.7e-9" }) | SRIF posterior finite at rank-4 epoch { "8" } (Validated rank/STM/DRO-closure/SRIF, Modelled design)

seg-fb1601eda130 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-f3b5cc590c78 = Eksempelet <c1/> setter blant annet:

seg-0cc8ab10786b = tidsenheter i roterende ramme

seg-84781b6fff48 = GDOP undefined (rank-deficient / singula

seg-856eb311f24b = “undefined” (text as the document states

seg-fc5d34345fdd = Resultatetikett (motorens): MODELLED planar cislunar constellation observability (P6). VALIDATED core: the observable RANK is a rank-revealing singular-value threshold cross-checked against the Gramian eigen-rank; the Gramian eigen-spectrum obeys the spectral invariants (trace = sum eig, det = prod eig, Frobenius^{ "2" } = sum eig^{ "2" }

seg-f15bbf30b0dd = Diagrammet motoren skriver for scenarios/cislunar-observability.toml, typen cislunar-observability

seg-4564ad90378b = <b>MODELLED</b> Observerbarhetsterskelen for buelengde i cislunart rom i den ROMLIGE sekstilstands-CR3BP-en i stedet for den plane firetilstanden, over DRO-, L2-halo- og L2 nær-rettlinjede halo-familier, med målestøy som går inn i Gram-matrisen og TO kriterier som rapporterer

seg-9f857ff85800 = <b>MODELLED</b> Observerbarhetsterskelen for buelengde i cislunart rom i den ROMLIGE sekstilstands-CR3BP-en i stedet for den plane firetilstanden, over DRO-, L2-halo- og L2 nær-rettlinjede ha. Uavhengig referanse (InternalConsistency): En uavhengig radtrappe-rang ved Gauss-eliminasjon med delvis pivotering bekrefter hver rangdom for sekstilstanden — en annen algoritme som ikke deler kode med egenverdi/SVD-veien som testes. CR3BP-tilstandsovergangsmatrisen på { "6" }×{ "6" } som dette setter sammen har sin egen ReferenceImpl-uavhengige referanse mot SciPy sin variasjonelle integrasjon, og halo/NRHO-startbetingelsene kommer fra en korrektor som gjengir den publiserte L2 sørlige

seg-53c183035bde = MODELLED planar cislunar constellation observability (P6). VALIDATED core: the observable RANK is a rank-revealing singular-value threshold cross-checked against the Gramian eigen-rank; the Gramian eigen-spectrum obeys the spectral invariants (trace = sum eig, det = prod eig, Frobenius^{ "2" } = sum eig^{ "2" }); the variational STM is the finite-difference-validated CR3BP STM (crate::cr3bp); the range / range-rate Jacobian rows (resultat <c1/>)

seg-f6a217f57bec = MODELLED plan observerbarhet for en cislunar konstellasjon (P6): sporer en differensialkorrigert plan DRO-konstellasjon med fire romfartøyer ved hjelp av avstandsmåling mellom satellitter og rapporterer hvor mye av et romfartøys firetilstand [x,y,ẋ,ẏ] buen gjør observerbar. (typekatalog (<c1/>))

seg-e5182743fd40 = MODELLED: konstellasjonsutformingen (DRO-perilunamplituder og -faser) og den spesifikke rangprogresjonen den gir. (typekatalog (<c1/>))

seg-5d3a370f1295 = Ærlighet: MODELLED. VALIDATED kjerne -- den observerbare RANGEN er en rangavslørende singulærverditerskel kryssjekket mot Gram-matrisens egenrang; egenverdispekteret følger de spektrale invariantene (trace = sum eig, det = prod eig, Frobenius^{ "2" } = sum eig^{ "2" }); den variasjonelle STM-en er den differanse-validerte CR3BP-STM-en; avstands- og avstandshastighets-Jacobi-radene er differanse-validerte analytiske delderiverte (kryssjekket mot (kommentar i scenariofilen, linje { "16" } til { "25" })

seg-c68bc1df8975 = Romlig, støyfylt cislunar observerbarhet av buelengde for flere familier er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-ba3c2a8f0e28 = <s1>Forrige</s1>cislunar-arc-recovery

seg-3adfb78b1f34 = <s1>Neste</s1>clock
