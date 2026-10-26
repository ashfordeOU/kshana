# docs--kind-lunar-interop-export: translations (da)

seg-debc2f07db78 = true

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-834408a40783 = min

seg-d36e6d7d8a10 = Kilde: <c1/>

seg-fdf560e675f4 = <c1/> (scenarietype)

seg-5a4dcb93a643 = Modelleret lunar interoperabilitetseksport: udsender det lunare referencesystem, den lunare tidsskala og den lunare efemeride i LunaNet/IOAG-tilpassede, CCSDS-baserede udvekslingsformer med rundturs- og feltformatkontrol. GENBRUGER cratens CCSDS OEM { "2.0" }-skriver og -læser (crate::oem), omkodet til den lunare kontekst — OEM-feltet REF_FRAME bærer IAU { "2015" } WGCCRE's lunare legemssystem (MOON_ME / MOON_PA), TIME_SYSTEM den lunare tidsskala (LTC / TCL / UTC), CENTER_NAME = MOON — over en illustrativ eksempelefemeride af LCNS-klassen (positioner fra crate::lunar_service, hastighed ved differenskvotient). Udsender også en LunaNet/IOAG-tilpasset beskrivelse af lunar tid (skalaens id, sekulær rate µs/dag fra crate::lunar_time, offentliggjort bånd, referenceoverflade), der kan gøre rundtur via serde_json, og pakker artefakterne ind i den eksisterende KIF-kuvert (crate::interchange) med mærkatet MODELLED. Rapporterer udsendte artefakter, antal OEM-linjer, feltformatkontrol bestået og liste over felter, der er til stede/mangler, OEM-rundtur ok, rundtur for tidsmetadata ok og KIF-størrelse i bytes. MODELLED — deterministisk rundtur + kontrol af feltnavne mod offentliggjort CCSDS OEM + LunaNet/IOAG-feltsemantik er den uafhængige reference; IKKE en certificeret overensstemmelsestest for interoperabilitet; illustrativ efemeride fra offentlige kilder, ikke tilknyttet ESA; ingen TRL-, heritage- eller myndighedsstøtte.
