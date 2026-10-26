# docs--kind-lunar-interop-export: translations (nb)

seg-debc2f07db78 = true

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-834408a40783 = min

seg-d36e6d7d8a10 = Kilde: <c1/>

seg-fdf560e675f4 = <c1/> (scenariotype)

seg-5a4dcb93a643 = Modellert eksport av interoperabilitet på månen: gir ut referansesystemet, tidsskalaen og efemeriden på månen i LunaNet/IOAG-tilpassede, CCSDS-baserte utvekslingsformer med rundtur- og feltoverensstemmelse. GJENBRUKER cratens CCSDS OEM { "2.0" }-skriver og -parser (crate::oem), merket på nytt for månekonteksten: OEM REF_FRAME bærer IAU { "2015" } WGCCRE-legemsreferansesystemet for Månen (MOON_ME / MOON_PA), TIME_SYSTEM månens tidsskala (LTC / TCL / UTC), CENTER_NAME = MOON, over en illustrativ eksempelefemeride av LCNS-klassen (posisjoner fra crate::lunar_service, hastighet ved finite differanse). Gir også ut en LunaNet/IOAG-tilpasset beskrivelse av månens tid (skala-id, sekulær rate µs/døgn fra crate::lunar_time, publisert bånd, referanseflate) som går i rundtur via serde_json, og pakker artefaktene inn i den eksisterende KIF-konvolutten (crate::interchange) med MODELLED-ærlighetsmerket. Rapporterer utgitte artefakter, antall OEM-linjer, feltoverensstemmelse bestått + liste over tilstedeværende/manglende felt, OEM-rundtur ok, rundtur for tidsmetadata ok og KIF-bytestørrelse. MODELLED — deterministisk rundtur + feltnavnoverensstemmelse mot publisert CCSDS OEM + LunaNet/IOAG-feltsemantikk er den uavhengige referansen; IKKE en sertifisert test av interoperabilitet eller overensstemmelse; illustrativ efemeride fra offentlige kilder, ikke tilknyttet ESA; ingen TRL/heritage/støtte fra noe byrå.
