# docs--kind-lunar-integrity: translations (nb)

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-8ed008b206de = Kilde: <c1/>

seg-26f0cf6d63c0 = <c1/> (scenariotype)

seg-4b6daea39f5c = ARAIM-beskyttelsesnivå ved Månens sørpol, pass, mot et representativt sett av LunaNet-reléer. sigma_ure_m eksponerer avstandsnøyaktigheten til signalet i rommet (beskyttelsesnivåene skalerer lineært med den, så å sveipe den svarer på hvilken avstandsnøyaktighet en alarmgrense krever). Standardverdien er det historiske sørpoltilfellet av LNIS-klassen.

seg-a6eb6de27cb5 = Én kjøring av <c1/> oppsummeres slik: lunar-integrity | sørpol | 0/24 epoker tilgjengelige ({ "0.0" }%) | AL { "50" } m | σ_URE { "30" } m | HPL { "263" }–{ "452" } m

seg-79da500e2726 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-21d10aa98c33 = Eksempelet <c1/> setter blant annet:

seg-610fa190a393 = Diagrammet motoren skriver for scenarios/lunanet-araim.toml, type lunar-integrity

seg-1903c67a762d = <b>VALIDATED</b> Steget fra geometri til kovarians for beskyttelsesnivået på månen — (GᵀG)⁻¹ over all-in-view og hver enkeltfeil-delgeometri, projisert på den lokale vertikalen a. Uavhengig referanse (ExternalDataset): To etablerte tredjepartsimplementasjoner satt sammen, begge kjørt frakoblet, med fixturen regenerert ende til ende og verifisert byte-identisk. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c kompilert fra C-kilde med -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverterer normalmatrisen med Crout-LU og delvis pivotering, en algoritme uten forbindelse til kshanas håndskrevne Gauss-Jordan invert4()

seg-3c54da43686e = <s1>Forrige</s1>lunar-infrastructure

seg-f6b399c3fd4a = <s1>Neste</s1>lunar-interop-export
