# docs--kind-oem-interop: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-4abcbdaddcf8 = Kilde: <c1/>

seg-a92dcafd670e = <c1/> (scenarietype)

seg-dbffff25b57f = Interoperabilitetsbro til CCSDS OEM: importér en Orbit Ephemeris Message fra et eksternt flyvedynamikværktøj (GMAT, Orekit og STK udsender alle OEM) og rapportér dens segmenter, objekter, referencesystemer og epokespænd samt en kontrol af hastighedskonsistens; uden input kører den en rundtur med en genereret referencebane og rapporterer troværdigheden mellem import og eksport. MODELLED strukturel og fysisk indlæsningskontrol, IKKE en validering af kildens banenøjagtighed.

seg-21eb1c9d7571 = Én kørsel af <c1/> opsummeres som: oem-interop: rundtur gennem { "2" } segment(er), { "12" } tilstande; maks. rundtursfejl { "4.88e-7" } km / { "4.61e-10" } km/s (MODELLED interoperabilitet)

seg-54c35d9fbfd9 = Valgfrie felter: <c1/>

seg-d4117f615cd8 = Eksemplet <c1/> angiver blandt andet:

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = Resultatetiket (motorens egen): MODELLED — interoperabilitetsbro til import og rundtur af CCSDS OEM (GMAT, Orekit og STK udsender OEM); en strukturel og fysisk indlæsningskontrol, IKKE en validering af kildens banenøjagtighed

seg-5db5a7c812ca = Diagrammet, som motoren skriver for scenarios/oem-interop.toml, type oem-interop

seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS { "502.0" } OEM-importer (parse_oem), tolerant over for COMMENT-linjer, ekstra metadatanøgleord og kovariansblokke og den nøjagtige inverse af skriveren; rundtur og indlæsning af ekstern fil med en kontrol af hastighedskonsistens. Tests: <a1>ccsds_oem_interop_reference.rs</a1>.

seg-20071a16b316 = <b>VALIDATED</b> CCSDS { "502.0" } OEM-importer (parse_oem), tolerant over for COMMENT-linjer, ekstra metadatanøgleord og kovariansblokke og den nøjagtige inverse af skriveren; rundtur og + . Uafhængig reference (ExternalDataset): uafhængig tredjepartsparser til CCSDS-502, <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — en separat kodebase, som afkoder kshanas udsendte EME2000/UTC-OEM byte for byte identisk ({ "24" } tilstande fordelt på { "2" } fixtures, pos/vel Δ = { "0" }), og hvis strenge læser bekræfter metadatatokenerne; kshanas parser stemmer ligeledes overens med den på en medfølgende ekstern OEM. To ærlige interoperabilitetsfund (oem-biblioteket afviser kshanas pr. satellit mu

seg-7ab6bb7a1b8a = MODELLED — interoperabilitetsbro til import og rundtur af CCSDS OEM (GMAT, Orekit og STK udsender OEM); en strukturel og fysisk indlæsningskontrol, IKKE en validering af kildens banenøjagtighed (resultat <c1/>)

seg-343a56c07d02 = MODELLED strukturel og fysisk indlæsningskontrol, IKKE en validering af kildens banenøjagtighed. (typekatalog (<c1/>))

seg-44aba1ad1d37 = ÆRLIG AFGRÆNSNING: MODELLED strukturel og fysisk indlæsningskontrol, IKKE en validering af kildeefemeridens banenøjagtighed. Kør: kshana scenarios/oem-interop.toml (kommentar i scenariefilen, linje { "11" } til { "13" })

seg-833df8eedc34 = <s1>Forrige</s1>ntn-positioning

seg-28254e1b38d4 = <s1>Næste</s1>optical-atmosphere
