# docs--kind-moonlight-service-volume: translations (sv)

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-8f8871ac8a0f = Ämnessida: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Ämnessida: <a1>integrations.md</a1>

seg-eb9f9a422d38 = Källa: <c1/>

seg-f8988314faf2 = <c1/> (scenariotyp)

seg-28c6a5644152 = Modellerad analys av lunar navigeringstjänstvolym utifrån en ILLUSTRATIV konstellation av Moonlight/LCNS-klass i månbana från offentliga källor (inte knuten till ESA): sveper över ett selenografiskt latitud-/longitudrutnät under en tidshorisont och redovisar DOP / täckning / tillgänglighet (≥{ "4" } satelliter OCH PDOP < tröskel) samt en generaliserad lunar ARAIM-skyddsnivåenvelopp (HPL/VPL) över volymen. DOP-geometrin ÅTERANVÄNDER den av gnss_lib_py VALIDATED-kärnan (crate::orbit::dop); skyddsnivån ÅTERANVÄNDER LunaNet LNIS lunar ARAIM-maskineriet (crate::lunar, σ_URE≈{ "30" } m) och reduceras till den befintliga skyddsnivån vid sydpolen som specialfall. MODELLED sammansättning: en cirkulär/elliptisk Kepler-relämängd (inte den verkliga differentialkorrigerade LCNS/NRHO-efemeriden), en måne med medelrotation (ingen libration/precesserande pol). Deterministisk (ren geometri). Ingen TRL/flygerfarenhet/myndighetsstöd.

seg-8516d1ded5dd = En körning av <c1/> sammanfattas som: moonlight-service-volume | { "8" } sats (illustrative LCNS-class, not affiliated) | { "24" } pts × { "12" } epochs | coverage { "37.8" }% (PDOP<{ "6.0" }) | sats { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL avail { "0.0" }% | MODELLED

seg-b59e8773bcb9 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

seg-0d935e7c43da = Exemplet <c1/> anger bland annat:

seg-edb738273a3a = Diagrammet som motorn skriver för scenarios/moonlight-service-volume.toml, typ moonlight-service-volume

seg-1974d1d64c9c = <b>VALIDATED</b> DOP / täckning / tillgänglighet av Moonlight-klass på månen + generaliserade lunara ARAIM-skyddsnivåer över en tjänstvolym. Oberoende referens (ExternalDataset): Oberoende tredjepartsauktoritet ANISE { "0.10.2" } astro::Orbit Kepler-propagator (Nyx Space, MPL-2.0) — en ekvinoktial tvåkroppskodväg som skiljer sig från kshanas Newton-Raphson-Kepler; MCI-position per satellit ligger inom <{ "1e-3" } m och det härledda antalet/mängden synliga satelliter stämmer exakt i varje rutnätspunkt. DOP-kärnan är validerad mot gnss_lib_py; integriteten använder publicerade LunaNet/LCNS-parametrar

seg-47f496c1d603 = <b>VALIDATED</b> Topocentriska siktvinklar per satellit (azimut medurs från norr, elevation) och snett avstånd vid en namngiven selenografisk plats, givet satelliten i platsens. Oberoende referens (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, körd som verktyg från xval/anise-service-geometry, binären lunar-look-angles-xval, som inte anropar någon Kshana-kod): ANISE:s egen rutin för azimut, elevation och avstånd (azimuth_elevation_range_sez) från platser byggda med dess konstruktor för latitud-longitud-höjd på pck00011-månen (sfär { "1737.4" } km), med satelliterna roterade till MOON_PA_DE440 genom moon_pa_de440_200625.bpc. { "768" } sampel o

seg-1f12671176ad = MODELLED sammansättning: en cirkulär/elliptisk Kepler-relämängd (inte den verkliga differentialkorrigerade LCNS/NRHO-efemeriden), en måne med medelrotation (ingen libration/precesserande pol). (typkatalog (<c1/>))

seg-2ff91fe31123 = ÄRLIGHET: MODELLED sammansättning. DOP-geometrin är validerad GENOM ÅTERANVÄNDNING av den validerade kärnan; sammansättningen av täckning / tillgänglighet / integritet är MODELLED — en cirkulär/elliptisk Kepler-relämängd (inte en differentialkorrigerad LCNS / { "9" }:{ "2" } NRHO-efemerid), en måne med medelrotation (ingen fysisk libration / precesserande pol) och publicerade integritetsparametrar från LunaNet LNIS. Detta visar den lunara tjänstvolymen M (kommentar i scenariofilen, rad { "27" } till { "32" })

seg-f3279128de3b = <s1>Föregående</s1>mars-pnt

seg-92cd937a3fb7 = <s1>Nästa</s1>ntn-positioning
