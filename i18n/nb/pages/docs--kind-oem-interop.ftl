# docs--kind-oem-interop: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-4abcbdaddcf8 = Kilde: <c1/>

seg-a92dcafd670e = <c1/> (scenariotype)

seg-dbffff25b57f = CCSDS OEM-interoperabilitetsbro: importer en Orbit Ephemeris Message laget av et eksternt verktøy for flydynamikk (GMAT, Orekit og STK sender alle ut OEM) og rapporter segmentene, objektene, referansesystemene og epokespennet, samt en kontroll av hastighetskonsistens; uten inndata kjører den en rundtur med en generert referansebane og rapporterer samsvaret mellom import og eksport. MODELLED strukturell og fysisk innlesingskontroll, IKKE en validering av banenøyaktigheten til kilden.

seg-21eb1c9d7571 = En kjøring av <c1/> oppsummeres slik: oem-interop: round-tripped { "2" } segment(s), { "12" } states; max round-trip error { "4.88e-7" } km / { "4.61e-10" } km/s (MODELLED interop)

seg-54c35d9fbfd9 = Valgfrie felt: <c1/>

seg-d4117f615cd8 = Eksempelet <c1/> angir blant annet:

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = Resultatetikett (motorens): MODELLED — CCSDS OEM-bro for import og rundtur (GMAT, Orekit og STK sender ut OEM); en strukturell og fysisk innlesingskontroll, IKKE en validering av banenøyaktigheten til kilden

seg-5db5a7c812ca = Diagrammet motoren skriver for scenarios/oem-interop.toml, type oem-interop

seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS { "502.0" } OEM-importør (parse_oem), tolerant overfor COMMENT-linjer, ekstra metadatanøkkelord og kovariansblokker, og den nøyaktige inversen av skriveren; rundtur og innlesing av ekstern fil med kontroll av hastighetskonsistens. Tester: <a1>ccsds_oem_interop_reference.rs</a1>.

seg-20071a16b316 = <b>VALIDATED</b> CCSDS { "502.0" } OEM-importør (parse_oem), tolerant overfor COMMENT-linjer, ekstra metadatanøkkelord og kovariansblokker, og den nøyaktige inversen av skriveren; rundtur + . Uavhengig referanse (ExternalDataset): den uavhengige tredjeparts CCSDS-502-parseren <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>), en egen kodebase som dekoder kshanas EME2000/UTC-OEM byte for byte identisk ({ "24" } tilstander fordelt på { "2" } testfiler, pos/vel Δ = { "0" }) og hvis strenge leser bekrefter metadatasymbolene; kshanas parser stemmer likeledes overens med den på en medfølgende ekstern OEM. To ærlige interoperabilitetsfunn (oem-biblioteket avviser kshanas mu per satellitt

seg-7ab6bb7a1b8a = MODELLED — CCSDS OEM-bro for import og rundtur (GMAT, Orekit og STK sender ut OEM); en strukturell og fysisk innlesingskontroll, IKKE en validering av banenøyaktigheten til kilden (resultat <c1/>)

seg-343a56c07d02 = MODELLED strukturell og fysisk innlesingskontroll, IKKE en validering av banenøyaktigheten til kilden. (typekatalog (<c1/>))

seg-44aba1ad1d37 = ÆRLIG AVGRENSNING: MODELLED strukturell og fysisk innlesingskontroll, IKKE en validering av banenøyaktigheten til kildeefemeriden. Kjør: kshana scenarios/oem-interop.toml (kommentar i scenariofilen, linje { "11" } til { "13" })

seg-833df8eedc34 = <s1>Forrige</s1>ntn-positioning

seg-28254e1b38d4 = <s1>Neste</s1>optical-atmosphere
