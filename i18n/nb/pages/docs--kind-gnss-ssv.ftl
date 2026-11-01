# docs--kind-gnss-ssv: translations (nb)

seg-37d29d8303fe = km

seg-834408a40783 = min

seg-1b94e5a24a2d = Kilde: <c1/>

seg-ee3ecc6e0330 = <c1/> (scenariotype)

seg-d07af7221334 = Scenariotype i motoren v{ $version }, familie <a1>Navigasjon for rombrukere</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-d6d7bca305dc = MODELLED GNSS-tilgjengelighet og linkstyrke i Space Service Volume og utenfor: for en bruker på en sfære (ICG-heftets globale skall) eller på en keplersk bane (LEO til månetransfer) teller den, per konstellasjon (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og for alle sammen, signalene som kan brukes over en C/N0-terskel - tilgjengelighet av minst ett og av fire signaler, maksimal avbruddsvarighet, mottatt C/N0, geometrisk presisjonsfortynning, lenker via hovedlobe mot sidelober - med et hefte-, parametrisk eller brukerlevert sendemønster, valgfri limb-stråle-ionosfære, plasmasfære- og atmosfæreeffekter og en valgfri utforming av mottaker for svake signaler; også et GNSS-EKF om bord for HEO- og månetransferfarkoster (banedynamikk, solstrålingstrykk, tredjelegemer, klokke) og relativ navigasjon for en formasjon av flere farkoster med enkeltdifferensierte pseudoavstander. Kontrollert mot ICG SSV-heftets tabeller under en forhåndsregistrering (xval/gnss-ssv)

seg-d739ae994bf0 = Én kjøring av <c1/> oppsummeres slik: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

seg-79d2e350ed73 = Obligatoriske felt: <c1/>

seg-7fc75803140d = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-cebc76420d69 = Eksemplet <c1/> setter blant annet:

seg-ce3b64e8c1f4 = [l1, l5]

seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

seg-b02a3ef32d54 = HEO, nadirantenner med høy forsterkning og patch-antenner mot zenit, parametrisk s

seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

seg-3421a66993bd = heo

seg-8974ff39f695 = parametric

seg-1d65b71c5de0 = { "5" } medfølgende scenarioer bruker denne typen; de andre ligger i <a1><c1/></a1>.

seg-8ac8f00f6c77 = 1/m^{ "3" }

seg-15ca016a7a4f = Resultatetikett (motorens): MODELLED: et geometrisk sveip og et sveip over linkbudsjett. Hefte-mønsteret er en hovedlobe med konstant effekt, det parametriske mønsteret en representativ stand-in, og limb-stråle-mediet en enkel oppgitt modell; ingenting her er en måling av et signal i rommet. Tallene for tilgjengelighet og avbrudd følger metoden i

seg-7dae5e291c8b = Diagrammet motoren skriver for scenarios/gnss-ssv-heo.toml, typen gnss-ssv

seg-0aae0574c5e6 = <b>MODELLED</b> Tilgjengelighetssveipene for typen <c1/>: per konstellasjon (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og samlet, andelen av (bruker, epoke)-par med minst ett og minst fire signaler og det lengste avbruddet, for en bruker på en sfære

seg-07c94d5ad15c = <b>MODELLED</b> Modusen <c2/> i typen <c1/>: et EKF med ni tilstander (posisjon, hastighet, mottakerklokkens bias og drift, en skala for solstrålingstrykk) på pseudoavstander der tilgjengelighet, støy og C/N0 kommer fra den samme link

seg-41bfe74c6f6f = <b>MODELLED</b> Modusen <c2/> i typen <c1/>: en chief og deputies kjører hver det absolutte filteret; deputyens posisjon relativt til chief estimeres ved å subtrahere de absolutte estimatene og med et relativt filter på enkeltdifferensierte pseud

seg-de9a2a5b5f04 = <b>MODELLED</b> Tilgjengelighetssveipene for typen <c1/>: per konstellasjon (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og samlet, andelen av (bruker, epoke)-par med minst ett og minst fire signaler og det lengste avbruddet, for en bruker på en sfære. Uavhengig referanse (ExternalDataset): ICG Space Service Volume-heftet (UN OOSA ST/SPACE/75, { "2018" }), selv en simulering, sammenlignet under en forhåndsregistrering lagt inn før kjøringen (xval/gnss-ssv/PREREGISTRATION.md; resultater i xval/gnss-ssv/RESULTS.md, festet av tests/ssv_booklet_results.rs, bommene inkludert). Kjøring { "1" } etter den forhåndsregistrerte lesemåten: konstantene for minste utstrålte effekt og månetersklen stemmer (S0, S6 nådd); øvre og nedre SSV, RF-terskel

seg-f0b778c4922a = <b>MODELLED</b> En Chapman-ionosfære, en plasmasfære av Gallagher-typen og en nøytral atmosfære (brytningsbøyning, oksygenabsorpsjon, defokusering) integrert langs den rette. Uavhengig referanse (InternalConsistency): Lukkede former og publiserte størrelsesordener i testene (toppen i et Chapman-lag og bøyningen ved overflatelimben, noen få TECU plasmasfære på en stråle fra GPS til GEO); mottakerutformingen gjenbruker modellene for innhenting og sporingssløyfe og testene deres. Ingen målte data fra limb-sondering eller mottak av svake signaler er sammenlignet med den

seg-77cef183420e = <b>MODELLED</b> Modusen <c2/> i typen <c1/>: et EKF med ni tilstander (posisjon, hastighet, mottakerklokkens bias og drift, en skala for solstrålingstrykk. Uavhengig referanse (InternalConsistency): Simulert sannhet mot filterets eget estimat (et konsistent filters gjennomsnittlige normaliserte kvadrerte estimeringsfeil er omtrent { "3" } for posisjonen) og determinisme for et fast seed. Ingen flyvedata eller registrerte GNSS-data fra høy bane er sammenlignet; Sola og Månen er lavpresisjons sirkulære stand-ins

seg-429e154cd691 = <b>MODELLED</b> Modusen <c2/> i typen <c1/>: en chief og deputies kjører hver det absolutte filteret; deputyens posisjon relativt til chief estimeres ved å subtrahere. Uavhengig referanse (InternalConsistency): Den samme simulerte sannheten som for det absolutte filteret: det relative filterets feil mot den sanne relative tilstanden, og kontrollen av at det gjør det minst like bra som å subtrahere to uavhengige absolutte posisjonsbestemmelser. Ingen data fra flyvende formasjoner er sammenlignet

seg-1dd1beb01075 = MODELLED: et geometrisk sveip og et sveip over linkbudsjett. Hefte-mønsteret er en hovedlobe med konstant effekt, det parametriske mønsteret en representativ stand-in, og limb-stråle-mediet en enkel oppgitt modell; ingenting her er en måling av et signal i rommet. Tallene for tilgjengelighet og avbrudd følger metoden i ICG Space Service Volume-heftet (UN ST/SPACE/75) og er kontrollert mot tabellene i xval/gnss-ssv/. (resultat <c1/>)

seg-e9c2dedbc971 = MODELLED GNSS-tilgjengelighet og linkstyrke i Space Service Volume og utenfor: for en bruker på en sfære (ICG-heftets globale skall) eller på en keplersk bane (LEO til månetransfer) teller den, per konstellasjon (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og for alle sammen, signalene som kan brukes over en C/N0-terskel - tilgjengelighet av minst ett og av fire signaler, maksimal avbruddsvarighet, mottatt C/N0, (typekatalog (<c1/>))

seg-3add0e744c54 = MODELLED: mønsteret er representativt, ikke målt; mediet er en oppgitt enkel modell (docs/SSV.md). (kommentar i scenariofilen, linje { "14" })

seg-6b4655dd5270 = GNSS-signaltilgjengelighet i Space Service Volume og utenfor, sammenlignet med ICG SSV-heftet, er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-a9e1798308df = Limb-stråle-ionosfære, plasmasfære- og atmosfæreeffekter på tangerende GNSS-signaler, og utformingen av mottaker for svake signaler, i typen <c1/> er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-132be2813c10 = GNSS-navigasjonsfilteret om bord for romfartøy i høy bane og månetransfer er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-f9405de9adb8 = Relativ navigasjon for en formasjon av flere romfartøy i en sterkt elliptisk bane fra GNSS er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-4881f925ea7f = Familieside: <a1>Navigasjon for rombrukere</a1>

seg-4b72df59b3f9 = Temaside: <a1>SSV.md</a1>

seg-c9ac9a99bcbb = <s1>Forrige</s1>gnss-sim

seg-9df48482a140 = <s1>Neste</s1>gravity-map

seg-795e0409fa5a = <b>MODELLED</b> Fasen <c1/>: middeltilstanden fra motorens Cowell-propagator (jordens punktmasse og J2, Solen og Månen som tredje legemer, Månen fra oppdragstrådens DE440-kjerne der den dekker segmentet og Solen fra den analytiske serie

seg-6a26b9ab59fe = Temaside: <a1>MISSION-THREAD.md</a1>
