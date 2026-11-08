# docs--capability-reference: translations (nb)

seg-f4f59f19e091 = Funksjonskort

seg-501d3a72ea43 = Integritet

seg-20db2c79b998 = Validert

seg-29e58493fdd4 = Modellert

seg-298cc35fe9d1 = Treghet

seg-b03984610dc0 = Månen

seg-f1f903f1b9ff = Robusthet

seg-bd64cfb4dc52 = Banepropagering og konstellasjonsutforming

seg-a7cfe6f135f1 = Bane og geometri

seg-3060564c3e21 = 666/666 AIAA-vektorer · { "4.12" } mm

seg-5b265eaf8f29 = SGP4/SDP4-propagering fra ekte to-linjers elementer (et innsjekket Celestrak GPS-øyeblikksbilde) eller syntetiske Walker-konstellasjoner hvis midlere elementer realiserer i:T/P/F-formelen til under { "1" } km over { "24" } t. Synlighet for flere konstellasjoner, dilution of precision og GNSS-tilgjengelighet, en optimerer for konstellasjonsutforming, dimensjonering av dekningsstriper, og et Walker-utformingssveip som rapporterer de Pareto-optimale utformingene over et rutenett av baneplan × satellitter.

seg-66e33b899daf = Cowell-propagator og kraftmodell med seks perturbasjoner

seg-a5a572db3bed = Numerisk propagator

seg-52a4410a54da = konservative nivåer < { "0.08" } m / { "24" } t mot Orekit { "12.2" }

seg-463ed85c6e40 = En numerisk (Cowell) propagator som utfyller den analytiske SGP4/SDP4-veien, med en hierarkisk kraftmodell: tolegemer + hele J2–J6 sonalfeltet, et valgfritt tesseralt EGM2008-geopotensial opp til grad/orden { "70" }, epokedrevet tredjelegemetyngdekraft fra Solen og Månen (en innebygd efemeride, ingen DE/SPK-kjerne), solstrålingstrykk med en konisk umbra/penumbra-skygge, atmosfærisk luftmotstand, den post-newtonske relativistiske Schwarzschild-korreksjonen og Lense–Thirring-leddet for rammeslep — drevet av et valg mellom adaptive integratorer med RK4 trinndobling eller Dormand–Prince RK5({ "4" }).

seg-797370a2faef = Burns, Lambert og porkchop

seg-57b120fb0aac = Manøvrer og banedesign

seg-5081c84dfdd7 = Tsiolkovskij < { "0.01" } % · Lambert-rundturer til tolegemereferansen

seg-da6b16ebd59b = Impulsive ΔV-noder med kovariansforplantning på { "6" }×{ "6" }, integrasjon av endelige burn kontrollert mot Tsiolkovskijs rakettligning til under { "0.01" } %, en Izzo-2015 Lambert-løser for én omdreining og en eksakt universell-variabel Kepler-propagator, og et porkchop-sveip (oppskyting × ankomst) for C3 / ankomst-V∞ levert som et JSON-konturrutenett — simuleringslaget for ytelse over GMAT/Orekit.

seg-831552a45712 = Tidsskalaer og jordorienteringssystemer

seg-76b323512350 = Tidssystemer

seg-60208bd726eb = bit for bit mot SOFA/ERFA · Vallado ende til ende { "4" } mm

seg-42373dd9ca64 = IERS-skalaer for UTC / TAI / TT / UT1 med skuddsekund, et API for juliansk dato, IAU-2000 jordrotasjonsvinkel, GMST-baserte TEME ↔ ECEF og geodetiske WGS-84-systemer, full IAU 2000A/2000B-nutasjon og IAU { "2006" }-presesjon, og den jevndøgnsfrie CIO-baserte IAU 2006/2000A-reduksjonen GCRS↔ITRS med IERS polbevegelse — validert bit for bit mot SOFA/ERFA-vektorene og uavhengig kryssjekket mot ANISE (ren Rust SPICE): GCRS→ITRS mot ANISE ITRF93, samme IERS EOP, stemmer til ≤ { "0.86" } m på bakken / ≤ { "3.6" } m i GNSS-bane.

seg-dd766880e73a = Sanntidsprediksjon av jordorientering

seg-54169bca19e9 = { "12" } ledetider mot arkivert Bulletin A: UT1 { "2.93" } ms, polbevegelse { "1.76" } mas

seg-81be07e41d1c = En prediktor for jordorientering i operativ stil — minste kvadrater over bias, rate og de viktigste periodiske leddene over et etterfølgende vindu — målt mot virkelig arkiverte Bulletin A-prediksjoner i stedet for mot persistens. Standard inndata uten nett er et ekte IERS finals2000A-produkt med Bulletin A-prediksjonsrader, så en kjøring uten argumenter gir en utfylt tabell per horisont i stedet for en tom. UT1 og polbevegelse rapporteres over et felles radsett sammen med kombinasjonen deres, slik at det felles tallet er én statistikk og ikke en kvadratisk sum av to ulike utvalg.

seg-0e18bc4add10 = Strapdown INS og kartstøttet navigasjon

seg-26561c9a96a7 = CAI-akselerometer fra første prinsipper · utledet VRW kryssjekket mot en uavhengig integrator

seg-d18714ee32fb = Treaksed strapdown INS — kvaternionholdning, WGS-84 NED-mekanisering, kompensasjon for coning/sculling og en full deterministisk IMU-feilmodell — pluss et CAI-akselerometer (kald-atom-interferometer) fra første prinsipper (Mach–Zehnder-fase, projeksjonsstøy, kontrastavtak, vibrasjonskobling) og et partikkelfilter for terreng-/tyngdekartreferert navigasjon uten GPS.

seg-0e44bdf12d16 = Treghets- og terrengrelativ navigasjon uten GNSS gjennom et avbrudd

seg-07cb40aa5cd1 = { "10" } m ved { "249" } s, { "50" } m ved { "595" } s, akselerometerbias dominerer ved begge

seg-d5df17e4425b = Posisjonsfeil mot varighet uten GNSS fra et IMU-feilbudsjett — bias, tilfeldig vandring og skalafaktor, hver med sin egen vekstlov og sin egen andel av krysningen — slik at kostnaden ved et navigasjonsavbrudd er en beregnet kurve i stedet for en sveipet driftrate. Terskelkrysninger er motorutdata med det dominerende bidraget navngitt ved hver av dem, over fire IMU-kvaliteter, og et intervall for terrengposisjonering skåres i sin egen blokk slik at hovedkrysningene forblir uten hjelp.

seg-6631a5d69c84 = Kartmatching mot tyngde-, terreng- og magnetkart

seg-6af8e99df46d = Alt-PNT (uten GPS)

seg-72527f4459c7 = 60 min uten GPS · ~{ "145" } m (< { "500" } m)

seg-89bd5fb3e90b = En måling-modell for gravimeter med kalde atomer der hvit-støy-gulvet er utledet fra fysikken til CAI-akselerometeret, et fullt normalisert sfærisk-harmonisk tyngdeanomalifelt av lav grad pluss syntetiske mascons, og et partikkelfilter for tyngdekartmatching — utvidet til terrengreferert navigasjon mot en SRTM-høydemodell (TERCOM/SITAN), et geomagnetisk IGRF-14-hovedfelt til grad/orden { "13" }, og en kombinert navigator for tyngde + magnetisme + terreng som fusjonerer alle tre skalare kanalene. En 60-minutters benchmark uten GPS — et ~{ "700" } km / én times avbrudd der treghetsløsningen driver til ~{ "70" } km — gjenvinnes til ~{ "145" } m av en hierarkisk grov-til-fin matcher: ESA NAVISP Quantum Wayfarer-målet.

seg-dbd63be796ff = GNSS / INS-sensorfusjon

seg-f9582184adea = Fusjon

seg-f2166e96405f = tett koblet UKF · { "0.77" } m RMS

seg-d6ad19d1d47b = Et EKF med feiltilstand og 15 tilstander som seiler gjennom GNSS-avbrudd på en kalibrert treghetsløsning; en tett koblet pseudoavstandsmodus som fortsetter å korrigere med færre enn fire satellitter; et koblet filter for klokke + posisjon; en generell unscented (sigma-punkt) Kalman-estimator; en tett koblet GNSS/INS UKF-navigator validert til { "0.77" } m RMS gjennom et avbrudd på { "120" } s på en svingende LEO-passering; og en full tett koblet GNSS/INS UKF med 17 tilstander der kvante-CAI-dødregningen seiler gjennom avbruddet på den utledede hastighets-tilfeldige-vandringen til akselerometeret med kalde atomer.

seg-4af862bd1307 = Batch- og sekvensiell OD

seg-ca67c864635c = Banebestemmelse

seg-948441304a32 = batch- og sekvensiell OD mot Orekit { "12.2" } BatchLSEstimator/KalmanEstimator

seg-22e738b2ab57 = Gjenvinning av en banetilstand fra avstandssporing fra bakkestasjon, ved å sette sammen kraftmodellen med tolegemer + J2 og RK4-integratoren med en Gauss–Newton batch-differensialkorrektor (under meter / mm·s⁻¹ fra støyfrie avstander, ~{ "2" } m ved et støygulv på { "5" } m) og en sekvensiell variant med unscented-filter.

seg-06406b3d0b88 = Fisher-informasjon og observerbarhet

seg-4e28248ef77b = Observerbarhet og estimeringsteori

seg-a5b38d0a8d64 = egenverdier mot numpy.linalg.eigh · CRLB mot σ²(XᵀX)⁻¹ via numpy.linalg.inv · GNSS DOP fra informasjonsmatrisen, alle til { "1e-9" } · Kay ({ "1993" }) lukkede former + Monte Carlo-oppnåelse av CRLB

seg-3ee5597d6f8a = Et generelt, gjenbrukbart lag for Fisher-informasjon / Cramér–Rao (src/fim.rs): informasjonsmatrisen M = HᵀWH, Cramér–Rao nedre grense, observerbarhetsrang og nullrommet for datumdefekt (Moore–Penrose pseudoinvers), og D/A/E/T-optimale skalarer for eksperimentutforming fra en symmetrisk Jacobi-egenløser. Det ligger under DOP-motoren, grensen for passiv geolokalisering og resultatet for observerbarhet av absolutte stasjoner på Månen — intern avstandsmåling etterlater en datumdefekt for stiv kropp med seks frihetsgrader som en VLBI-binding til jordbaserte grunnlinjer gjenoppretter for en sparsom konstellasjon og skjerper for en rik, der det absolutte datumet lukkes ved tre ikke-kollineære jordstasjoner.

seg-ed467622dbd0 = CR3BP-propagering og LunaNet-integritet

seg-e386dced1d16 = Månen og cislunart rom

seg-f444bc39efbe = Gjengir den publiserte L2 { "9" }:{ "2" } NRHO (~{ "6.57" } d periode · ~{ "3,250" } km perilun); STM kontrollert mot endelige differanser

seg-272afbca5e48 = En propagator for det sirkulære begrensede tolegemeproblemet Jorden–Månen (CR3BP) i det roterende systemet — en bevart Jacobi-konstant og alle fem Lagrange-punktene — med en tilstandsovergangsmatrise på { "6" }×{ "6" } og en differensialkorrektor med enkeltskyting som gir virkelig periodiske halo-/nær-rettlinjede halobaner (NRHO): den gjengir den publiserte sørlige L2 { "9" }:{ "2" } NRHO (Gateway-banen) med en periode på ~{ "6.57" } dager og en perilun på ~{ "3,250" } km. Pluss geometri for LunaNet / LNIS cislunar PNT (reduksjon MCI↔MCMF, selenografiske koordinater) med en ARAIM-passering ved månens sørpol som ærlig avdekker integritetsgapet: en σ_URE på ~{ "30" } m driver beskyttelsesnivået godt over en varselgrense på { "50" } m.

seg-619f89bf160c = Realisering av månens referansesystem

seg-c6b12768a219 = mot numpy/scipy Umeyama–Horn SVD

seg-29327b86ea27 = Realiserer et månefast legemesystem fra en observasjonskampanje: en vektet Gauss–Newton-likhetstilpasning over geometrien stasjon–reflektor, som rapporterer datumet, kovariansen og den dårligst bestemte aksen. Det koblede systemet og tidsskalaens gauge føres eksplisitt i stedet for å absorberes, så rangdefekten er synlig i rapporten i stedet for begravd i en pseudoinvers.

seg-b3ba1e7b197d = Tjenestevolum for navigasjon på Månen og ARAIM

seg-353878596468 = ANISE { "0.10.2" } baner · RTKLIB 2.4.2-p13

seg-70b9c02c1f6a = Sveiper en illustrativ konstellasjon i Moonlight/LCNS-klassen over et selenografisk rutenett: synlighet, dilution of precision, dekning og ARAIM-beskyttelsesnivåer per epoke mot en konfigurerbar varselgrense. Nøyaktigheten for avstandsmåling med signal i rommet er en parameter, så sveipet besvarer et krav til avstandsmåling over hele volumet i stedet for bestått/ikke bestått ved én fast verdi.

seg-a94db5b03c9c = Interoperabilitetsbudsjett for Månen på tvers av leverandører

seg-a2e8a8dfd666 = DE440 · INPOP21a · EPM2021 via calceph

seg-646a00230694 = Måler hvor mye tre uavhengige, autoritative månefemerider faktisk avviker fra hverandre, og gjør det om til en designlov: feilbudsjettet mellom referansesystem og efemeride som en bruker med blandede leverandører arver, og konsistenstoleransen en leverandør må holde for å holde dette budsjettet innenfor en oppgitt grense.

seg-0f359c118090 = Observerbarhet av feil i et autonomt fritt nettverk

seg-ae99396c03bd = mot uavhengig numpy/scipy-paritetsalgebra

seg-51828c93731b = Den lineære algebraen en selvrefererende månekonstellasjon trenger for å oppdage sine egne feil uten noen jordreferanse: den vektede paritetsprojektoren i den rangdefekte pseudoinverse formen som overlever datum-og-tidsskala-gaugen, deteksjonsevne per node, Baardas minste detekterbare bias, og Byzantine block-spark-antall for deteksjon/identifikasjon over virkelig DE440-geometri mellom nodene.

seg-65d239fc4894 = Datum for månens referansesystem fra ekte laseravstandsmåling

seg-c92dd319fa36 = { "337" } ILRS-normalpunkter · median { "5.13" } mm

seg-2f7f950518be = Erstatter den simulerte kampanjen med ekte data: { "337" } arkiverte normalpunkter fra laseravstandsmåling mot Månen (ILRS), fordelt på fem retroreflektorgrupper, der hver observasjon vektes med sin egen registrerte presisjon fra filen. Reflektorkoordinatene er et DE440-katalog i hovedakser, lagret under eget filnavn, atskilt fra DE430-tabellen for gjennomsnittlig jordakse. Hvis du mater den ene med den andres rotasjon, flyttes en reflektor flere hundre meter uten at noe protesterer, fordi begge er velformede koordinater.

seg-2db69c58f694 = Differensiell PNT på Månen

seg-32adcb9b1b02 = Eksakt fellesmodus-identitet · modellert dekorrelasjon

seg-d4ac8cbac83e = Differensialkorreksjoner mellom en referansestasjon på Månen og en bruker. Opphevingen av fellesmodus er en eksakt identitet; restleddet fra romlig dekorrelasjon er en geometrisk førsteordens modell som vokser med grunnlinjen, og restbudsjettet for korreksjonslinken rapporteres ved siden av, slik at det begrensende leddet forblir synlig i stedet for å bli slått sammen til ett tall.

seg-9b83e78dcd7b = Tidsskalaer på Månen og geodetisk VLBI

seg-bcd769beab07 = Krysningstabell per klokkeklasse

seg-80107b7841bf = Krysningstider per klokkeklasse for en tidsskala på Månen, altså når hver oscillatorklasse slutter å holde en oppgitt grense uten oppdatering, sammen med en geodetisk VLBI-observabel for Månen og Fisher-informasjonen den bidrar med til datumet.

seg-99084680c321 = Ekte, hentet konstellasjonsgeometri for Månen

seg-a7be7d68e767 = { "5" } innsjekkede testdatasett, hvert kan gjenskapes fra sin registrerte kilde

seg-d3591b4b4633 = Tjenestevolumet kjøres på publiserte konstellasjonsutforminger i stedet for en illustrativ: referansesettet med fem satellitter fra LANS-demonstrasjonen av interoperabilitet, LNCSS-casestudiene med { "8" }, { "12" } og { "16" } satellitter, og de fire romfartøyene som faktisk var i månebane 2023-01-01, fra JPL Horizons. Hver fil oppgir sitt eget referansesystem og sin egen proveniensklasse, en horisont utenfor slutten av en tabulert efemeride avvises i stedet for å ekstrapoleres, og det illustrative keplerske resultatet sendes ut ved siden av det hentede, sammen med forskjellen mellom dem, og erstattes aldri av det.

seg-807b9fc7b517 = Nektingskontur på Månen ut fra en målt C/N₀-spredning

seg-a908030a9fcc = Avstand { "49.2" } km etter effektforhold mot { "19.4" } km etter tap av lås

seg-3ee440e8b619 = Jammer-til-signal-forhold per satellitt over ekte skråavstander på Månen, med den ønskede signalsiden holdt som en fordeling i stedet for å slås sammen til en median, slik at nektingskonturen får det usikkerhetsbåndet som relégeometrien faktisk gir. To kriterier rapporteres side om side: effektforholdsterskelen, og tap av lås beregnet ut fra sporingssløyfens dynamikk. Fangstavtrykket i bane sveipes over senderens høyde og strålebredde, og der rutenettet aldri når fangst ved randen, sier rapporten det og skriver ut underskuddet.

seg-229134190045 = VLBI-plan til kovarians for stasjonskoordinater

seg-547181855481 = Rang { "6" }, defekt { "0" }; fritt nettverk med defekt { "1" } navngitt som en felles translasjon

seg-6d147beefb43 = Akkumulerer de partielle deriverte av VLBI-forsinkelsen på Månen til en Fisher-informasjonsmatrise over en plan av grunnlinjer ganger epoker, og returnerer kovariansen til stasjonskoordinatene, slik at steget fra forsinkelsespresisjon til koordinat-sigma estimeres i stedet for å antas. Det frie nettverket rapporteres ved siden av det datumfastsatte, med rangdefekten og den uobserverbare retningen navngitt. Kovariansen for overflatepunkter holdes atskilt fra den for jordstasjoner, fordi den partielle deriverte for nærfeltsbøyen er en differanse mellom to enhetsvektorer for stasjoner og ikke oppfører seg som i fjernfeltet.

seg-028833cc45bc = Radiometrisk navigasjon og relé-PNT

seg-6c94ae122721 = PNT i dypt rom og ved Mars

seg-ef21cd4b1962 = Simuleringsvalidert (kovarians og kvalitetsmål for lukket sløyfe, ikke sertifiserte beskyttelsesnivåer); den solsentrerte Mars-dynamikken er kryssjekket mot JPL DE440 til { "137" } m @ en 1-dagsbue; Mars-LMO OD ≈ { "0.2" } m.

seg-469988966702 = En åpen radiometrisk navigasjonsmotor for dypt rom og Mars: iterativ lystid pluss Shapiro-forsinkelse, to-, en- og treveis Doppler og avstand (Moyer to-leddet), koherent transponderomsetting, regenerativ avstandsmåling og PN-avstandsmåling og Δ-DOR; CCSDS-TDM inn og ut; et reduserte-dynamikk Square-Root Information Filter (empiriske akselerasjoner, klokke om bord og Mars-luftmotstand) som utfører banebestemmelse i lav Mars-bane i en syntetisk lukket sløyfe; fusjon av enveis og toveis; og en MARCONI-konstellasjon av areostasjonære reléer med en GSE-ytelsessimulator fra ende til ende.

seg-b4284bd2629e = Optisk og RF-overlevering med integritet på tvers av modaliteter

seg-ae131bc1ba67 = Optisk / RF PNT

seg-1b25468c9780 = Minste påvisbare skjevhet { "8.20" } m horisontalt, { "12.30" } m vertikalt, { "24.6" } ns tidssynkronisering

seg-a5387333ab2d = Feilinjeksjon gir overvåkeren på tvers av modaliteter en påvisningsevne i stedet for en feilfri bestått kjøring: en minste påvisbar skjevhet per akse ved et oppgitt budsjett for falsk alarm og uteblitt påvisning. Etter en overlevering propageres kovariansveksten på nytt mot varslingsgrensene, slik at rapporten oppgir hvor lenge løsningen med én modalitet holder seg innenfor dem, og ikke bare at overleveringen var sammenhengende. De optiske og RF-baserte avstandsleddene sammenlignes bare ved samme akkumuleringstid og bane, og rapporten nekter å danne et forhold mot en verdi som ble valgt i stedet for målt.

seg-00cb9df27979 = Autonom integritet i mottakeren (ARAIM)

seg-f86ecc2fda8e = MHSS på et ekte GPS- og Galileo-øyeblikksbilde · DO-316 med to konstellasjoner

seg-841a6f3f0277 = RAIM med øyeblikksbilde og løsningsseparasjon, med horisontale og vertikale beskyttelsesnivåer (HPL/VPL), feilpåvisning og -utelukkelse og Stanford-integritetsdiagrammer, pluss et eksplisitt beskyttelsesnivå med integritetsrisikobudsjett (MHSS) med feilmodus for hele konstellasjonen ved to eller flere konstellasjoner (EU ARAIM / DO-316).

seg-695aa5c57d83 = ARAIM mot publiserte referansevektorer

seg-08f9dd480ba7 = Største feil { "0.044" } m mot kildenes egen toleranse på { "0.05" } m

seg-68185dd65478 = Motorens MHSS-beskyttelsesnivåer kjøres mot de publiserte regneeksemplene til den luftbårne referansealgoritmen fra EU-USA Working Group C, hver transkribert med hente-URL, dato, side og SHA-256 for filen og holdt på to steder som en test hevder stemmer overens. Akseptvektoren er det internt konsistente Reference Airborne Algorithm Description Document v3.1, Appendix D. Rapporten for Milestone { "3" } har to interne feil, en fortegnsfeil i geometrien og en multiplikator for falsk alarm som er evaluert ved { "57" } feilmodi mens teksten oppgir én, så beskyttelsesnivåene rapporteres som målte avvik i stedet for å bli gradert, og feilene vises ved å kjøre dokumentets egne tall.

seg-17b28b3cf1fa = SBAS/WAAS-beskyttelsesnivåer og dobbeltfrekvens

seg-99766b79a00a = Utvidelse (SBAS)

seg-4cfec990b19b = DO-229E K-faktorer · L1/L5 ionosfærefri

seg-ef3a5513bbd8 = SBAS/WAAS-beskyttelsesnivåer i DO-229E-formen med vektet minste kvadraters metode (K-faktorer for presisjonsinnflyging og underveisfase) og den ionosfærefrie dobbeltfrekvenskombinasjonen L1/L5 (IS-GPS-705) som ligger under DO-316, med beskyttelsesnivågeometrien kryssjekket mot en lineær-algebra-implementasjon som referanse.

seg-0a5bd5230c32 = Holdover, stabilitet og overføring av tid og frekvens

seg-69a0269c4732 = Klokke og tidssynkronisering

seg-641ae762b453 = kalibrert mot klokkedatablad · holdover kryssjekket mot van Loan-kovariansrekursjonen

seg-6f1c2e1f0bf4 = Holdover med Kalman-filter med to tilstander, stabilitet i Allan-familien (ADEV / MDEV / TDEV / HDEV) med konfidensintervaller og en full IEEE-1139-tilpasning med fem koeffisienter i potenslov, og de operative overføringsmetodene: TWSTFT med BIPM Sagnac-formelen i lukket form, GNSS common-view, PPP-overføring uten ionosfære, en optisk fri-rom-link med turbulensscintillasjon og en tidsskala fra klokkeensemble med invers varians. En kalkulator for klokkens holdover uten GNSS inverterer van Loan-veksten i frifartsfeil til en holdover-til-terskel, altså hvor lenge en klokke går fritt før tidsfeilen overskrider budsjettet, på tvers av klassiske klokker og kvanteklokker; modellert, og ærlig på at for en svært stabil klokke settes holdover til en stram terskel av det antatte støygulvet ved lang tau, ikke av den siterte ADEV.

seg-85b181275293 = Pseudoavstand, ionosfære og troposfære

seg-835df2d05f2a = Målingsdomenet i GNSS

seg-ef01abb1cfe8 = Saastamoinen ZHD ≈ { "2.3" } m · Niell enhet i senit · Klobuchar etter IS-GPS-200

seg-43c0372fe6e7 = Fremover-syntese av pseudoavstand og Doppler med Klobuchar (kringkastet) og IONEX / TEC-rutenett (målt) som ionosfære, inkludert en IONEX-filparser, tidsinterpolasjon og tynt-skall-tilordningen av skråhelning, med Saastamoinen- og Niell-troposfære og RAIM med øyeblikksbilde.

seg-3458cb02f156 = Enkeltpunktsposisjonering (PVT)

seg-640e4cd9f008 = GNSS-posisjonering

seg-4fa43feda96a = Validert på ekte IGS-data (stasjon ABMF, 2018-05-13) til { "5.7" } m 3D RMS / { "1.1" } m horisontalt mot den oppmålte koordinaten.

seg-b107ba0607b0 = En ekte mottakerposisjon løst fra ekte RINEX-kodepseudoavstander og kringkastet efemeride med iterert vektet minste kvadraters metode: Sagnac-/jordrotasjonskorreksjon, kringkastet klokke med TGD, den ionosfærefrie dobbeltfrekvenskombinasjonen L1/L2 (eller Klobuchar med én frekvens), Saastamoinen-/Niell-troposfære, elevasjonsvekting, DOP og RAIM med øyeblikksbilde.

seg-5819c351d123 = Jamming og spoofingpåvisning i flere lag

seg-9a03f3db9ef0 = χ²₁ NP-detektor · lukket form og Monte Carlo P_fa/P_md stemmer overens

seg-788fdc9a22a1 = En jamming-modell basert på linkbudsjett (J/S → effektiv C/N₀ → tap av lås), en stokastisk detektor for tidsspoofing (Neyman–Pearson / χ²₁-energitest med Monte Carlo P_fa/P_md og en sikkerhets-FoM på { "1" } − P_md), og en spoofingdetektor i flere lag som slår sammen en RAIM-konsistens-paritetstest, en RF-AGC-effektovervåker og en signalkvalitetsovervåker (SQM). Pluss et feilbudsjett for kvanteinertial dødregning som setter sammen hvitstøydrift fra kaldatom-interferometer med gjenværende skjevhet (kryssjekket mot en uavhengig integrator) og skalafaktorfeil til et tall for posisjonsdrift over holdover, den inertiale tvillingen til klokkens holdover.

seg-87bca15c6939 = Modulasjon, anti-jam og kodesporing

seg-c7d3ff7ea829 = Ytelse for navigasjonssignaler

seg-1aec700caefe = BPSK selv-SSC = 2/(3R_c) · C/A DLL-jitter under en meter ved { "45" } dB-Hz · GPS C/A Gold-krysskorrelasjon -23.9 dB

seg-304803ee178d = Signalytelseslaget mellom linkbudsjettet og målingsdomenet: effektspektraltettheter med enhetsareal for BPSK-R(n) og sinus-BOC(m,n), spektralseparasjonskoeffisienten som utleder anti-jam-Q-en som jamming-modellen bruker direkte fra de faktiske signal- og jammerspektrene, RMS-båndbredden (Gabor) som setter informasjonsinnholdet for avstandsmåling (BOC > BPSK), den termiske støyjitteren i den koherente tidlig–sen-DLL-kodesporingen, og den koherente multipathfeil-omhyllingen for tidlig minus sen med suppresjon fra smal korrelator, og en avveining for utforming av avstandskoder (sidelobenivå i autokorrelasjonen for m-sekvens/Gold og den tre-verdige Gold-kryssorrelasjonsgrensen, pluss inversjonen fra kodelengde til entydig avstand). Dette er analyse av signalytelse, ikke utforming av RF-nyttelast eller antennemaskinvare.

seg-684494a7877c = Passiv RF-geolokalisering (TDOA/FDOA)

seg-414872cdf952 = Passiv RF-geolokalisering

seg-bed5944d15dd = støyfri TDOA fremover→invers til { "1e-6" } m · J·CRLB = I · GDOP monoton i antall mottakere · estimatoren når sin CRLB over { "4000" } Monte Carlo-forsøk

seg-be8f2a419275 = Lokaliser en jammer eller spoofer (eller en opportunistisk kilde for omvendt PNT) ut fra hyperboloider for ankomsttidsforskjell over et mottakernettverk, løst med minste kvadraters metode etter Gauss–Newton; ved å legge til frekvensforskjell ved ankomst med bevegelige mottakere gjenvinnes senderens posisjon og hastighet samlet, med Cramér–Rao-grensen for posisjonskovariansen fra nettverksgeometrien. En punktkilde-modell med fri sikt, uten ledd for multipath/NLOS, mottakerklokkeskjevhet eller refraksjon.

seg-48e98ff7065e = RINEX-, SP3- og CCSDS-formater

seg-7c6f4dc6bcba = Interoperabilitet

seg-ae8dc649ab26 = kringkastet efemeride + SP3-interpolasjon mot RTKLIB; OEM mot en uavhengig CCSDS-parser

seg-75aae4d201fd = Innlesing av kringkastet efemeride i RINEX-3 for flere GNSS (GPS, Galileo, QZSS, BeiDou, GLONASS), en parser for RINEX-3-observasjoner (RINEX { "4.00" }-observasjonsoppsettet forventes å la seg tolke, men ingen { "4.00" }-fil er lest gjennom den; RINEX { "4" }-navigasjonsfiler avvises ved navn), en leser og skriver for SP3-c/d presise efemerider med Lagrange-interpolasjon, og eksport av CCSDS OEM { "2.0" } og OMM (middelelementer) for flyvedynamikkverktøy (GMAT, Orekit, STK), og tolking og utsending av CCSDS-TDM ({ "503" }) sporingsdatameldinger for radiometrisk sporing i dypt rom.

seg-1f379e235f5f = Maskinkontrollert verifikasjonsmatrise

seg-a4d10bb41065 = Verifikasjon og kvalitetssikring

seg-72ec664ea7ae = validerte rader krever en ekstern uavhengig referanse (invariant som håndheves i CI)

seg-cab165105f32 = En kryssreferanse fra krav til modul til test til uavhengig referanse til status, gjengitt fra selve motoren (Markdown/CSV), med enhetstestede ærlighetsinvarianter: en rad kan bare merkes som validert hvis den har en uavhengig ekstern referanse (NIST / AIAA / SOFA / IGS / en publisert verdi), slik at en intern selvkonsistenssjekk ikke kan utgi seg for å være en validering. Maskinvare- og PA-funksjoner som Kshana ikke leverer, føres som gap som partneren eier. Det kjørbare grunnlaget for en ECSS-E-ST-10-02-kryssreferanse for verifikasjon.

seg-190cdf3ca8dc = Enhet og proveniens for hver rapporterte størrelse

seg-3e7fb040a7c4 = Hvert numerisk felt et scenario sender ut har en enhet og en proveniensklasse hentet fra et lukket vokabular, med en definisjon der en finnes, publisert som et maskinlesbart skjema ved siden av motoren. En skrittvis stram port kjører hver innebygde type og feiler på et felt som mangler begge; typene som ennå ikke er komplette, navngis én etter én med grunnen til at hver fortsatt er åpen, og listen kan bare bli kortere. Rapporter som oppgir sine egne konstanter, som linkbudsjettet for én vei og budsjettet for optisk og RF, lar en leser regne ut hovedtallet på nytt fra rapporten alene.

seg-0e1a01c9158a = Budsjetter for oppskyting, gjeninntreden, dekning og peking

seg-f5cf9e86d3c9 = Oppdragsanalyse

seg-767b2cd5f4ba = kontrollert mot lukket form (oppskytingsazimut · Allen-Eggers · SMAD)

seg-23bac81d700b = Førsteordens budsjetter for oppdragsutforming, hvert et kjørbart scenario: oppskyting og stigning med to legemer (oppskytingsazimut, minste inklinasjon, bonus fra jordrotasjonen, Δv for planendring med dogleg, daglige muligheter), en ballistisk gjeninntredingskorridor etter Allen–Eggers (maksimal retardasjon, hastigheter ved maksimal g og maksimal oppvarming), dekningsgeometri for jordobservasjon (sporbredde / GSD i nadir / tilgang utenfor nadir / returtid via SMAD-romtrekanten), et feilbudsjett for holdning og peking med 3 frihetsgrader (gravitasjonsgradientmoment + RSS-pekebudsjett), prediksjon av bakkestasjonspasseringer (AOS/TCA/LOS, maksimal elevasjon, tilgang), og et linkbudsjett for én vei etter CCSDS { "401" } / DSN 810-005-linkligningen (FSPL, C/N₀, Eb/N₀, margin, lukking). Det analytiske laget før maskinvare under STK/GMAT/Basilisk: modellerte førsteordensbudsjetter, ikke en erstatning for 6-DoF eller radiometri.

seg-43f53b910042 = Deling av apertur mellom navigasjon og kommunikasjon

seg-989637b0c6fc = Utfall og konkurranse per økt, ikke ett tall for driftssyklus

seg-5c63a4559aff = En kontaktplan og et antall aperturer inn; driftssyklus for navigasjon, driftssyklus for kommunikasjon, utfall per økt og konkurranse ut. Arbitreringsregelen navngis i rapporten i stedet for å bli underforstått, og en økt som ikke kan dekkes fullt ut, rapporterer andelen av den som gikk tapt, i stedet for å forsvinne i et gjennomsnitt.

seg-c8eb43aeb31a = Romvær og termosfærisk tetthet

seg-37b8c9397544 = Rommiljø

seg-25e24a6c0ba3 = Jacchia-71 validert mot publisert solminimum / -middel / -maksimum

seg-1eff250f41c3 = En miljømodell for romvær: solaktivitets- (F10.7 / sentrert 81-dagers F10.7a) og geomagnetiske (Kp, med den definisjonsmessige Kp↔ap-tabellen) aktivitetsindekser, den eksosfæriske temperaturen etter Jacchia-1971 som de styrer, og den aktivitetskorrigerte mot den statiske termosfæriske nøytraltettheten i høyden, altså den avhengigheten av solsyklusen som en statisk atmosfære utelater. En kalibrert førsteordens kobling via skalahøyde, ikke en datavalidert NRLMSISE-atmosfære.

seg-49bac998eb07 = Evaluering av påvisning av RF-forstyrrelser og PNT-avveining

seg-dca720256d85 = Evaluering og avveining for maskinlæring

seg-5f0a39efe160 = AUC-rammeverket verifisert mot binormal lukket form Φ(d′/√{ "2" }) (Gneiting & Vogel { "2018" }); evalueringsmålene validert bit for bit mot scikit-learn { "1.9.0" } — syntetisk korpus, ikke rå IQ/TEXBAT

seg-0dc3a7135442 = En testbenk for evaluering av påvisning av RF-forstyrrelser: et merket, parameterforankret syntetisk korpus (nominell / jamming / tidsspoofing / posisjonsspoofing / multipath), et detektoruavhengig ROC/AUC-rammeverk som skårer enhver detektor med Pd per klasse ved en målsatt Pfa, og optimismegapet mellom innenfor og utenfor fordelingen. En dypere studie av optimismegapet utvider dette til et panel med 13 detektorer (energi / AGC / SQM / paritet pluss seedede detektorer med logistisk regresjon og MLP med ett skjult lag), skaleringslover innenfor og utenfor fordelingen med en permutasjonsnull, og en leave-one-out-prediktor for forringelse utenfor fordelingen; en programvaredefinert mottakerfrontend (rå IQ/IF til korrelator tidlig/umiddelbar/sen til SQM) og adaptere for import av ekte data (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) lar de samme detektorene kjøres over opptak som leveres lokalt. Pluss en avveining mellom kvante og klassisk PNT som kvantifiserer en aktuell klokkes fordel for tidssynkronisering og inertial holdover ut fra en målt ADEV-kurve mot en klassisk grunnlinje, med en robusthet-mot-tid-omhylling uten GNSS. Modellerte driftskarakteristikker, aldri felt- eller IQ-data, ingen dom om bra eller dårlig.

seg-8766e058334d = Krysningskart for robusthet, kvante mot klassisk

seg-8f851e9cf8c2 = gjenskaper de inertiale studiene og klokkestudiene av krysningspunkter bak figurene under Resultater; avveiningskjernene validert mot scipy { "1.17.1" }

seg-a057ad4c89ce = Et reproduserbart kart over hvor en kvantesensor tar igjen sin klassiske motpart under parameterusikkerhet: kaldatom mot dødregning av navigasjonsklasse og optisk mot brikkeskala klokke-holdover, over utfallsvarighet og plattformvibrasjon, der hver kurve har en merking for teknologisk modenhet. Reproduserbart via cargo run --bin crossover_study. Modellerte ytelsesbudsjetter: inndataene er publiserte eller omgrensede koeffisienter, ikke flydata.

seg-6347618838dd = Betinget beskyttelsesnivå for tidssynkronisering

seg-a846e806e577 = Integritet for tidssynkronisering

seg-762bc9f28716 = sammensetning kryssjekket mot kovariansrekursjonen i flere trinn for clock_state; kalibrert på JammerTest { "2024" } (Zenodo { "15911589" })

seg-3622798325cd = En holdover-begrenset grense for den uoppdagede tidsfeilen under GNSS-spoofing: gitt en uavhengig kryssjekk er feilen i levert tid begrenset av et k-sigma-gulv for overvåkeren, van Loan-variansen i frifart over påvisningsforsinkelsen og en CUSUM-tid til alarm. Kalibrert på en ekte registrert spoofing (JammerTest { "2024" }) og reproduserbar via cargo run --example tpl_jammertest. Modellert sammensetning, betinget av påvisning: det finnes ingen endelig ubetinget grense, fordi en rampe som er langsom nok unngår en enkelt klokkestøttet overvåker.

seg-734a93b6a809 = Skåring av PNT-robusthet og beslutningsustabilitet

seg-c25b4e240fb5 = Robusthetsvurdering

seg-f42ae8719e02 = { "35" } håndavledede tester mot uavhengig referanse; byte-deterministisk studieartefakt (fast seed); tilpasset DHS RPCF v2.0

seg-8e69193ca540 = En skåringsmotor tilpasset et rammeverk (DHS RPCF-kategorier) som tilordner en arkitekturs simulerte oppførsel til delskårer per dimensjon, og deretter spør om en enkelt samlet skår eller modenhetsnivå er et stabilt grunnlag for en beslutning, via en Dirichlet-vektingssimpleks, Kendall-tau-rangustabilitet, en bytterate for topp-1-vinneren, og kollaps av fellesmodus-diversitet (Hill-N2), med en integritetshashet kvalitetssikringsrapport. Reproduserbart via cargo run --example resilience_report. Modellerte syntetiske arkitekturer tilpasset RPCF v2.0; en egenvurdering, ikke en sertifisering.

seg-62ef40799af4 = Uteblitt påvisning → integritetsregioner

seg-52e55797d77c = Konsekvens for integritet

seg-99025f66f277 = Stanford-ESA-integritetsregioner (Tossaint et al., NAVIGATION { "2007" })

seg-13f23ffe5840 = En bro fra uteblitt påvisning til integritet: en uoppdaget skjevhet som er igjen etter en uteblitt påvisning av spoofing, jamming eller RAIM øker den effektive posisjonsfeilen, som holdt mot kontekstspesifikke varslingsgrenser klassifiseres i Stanford-ESA-integritetsregionene (tilgjengelig / utilgjengelig / villedende / farlig). Setter sammen den eksternt forankrede Stanford-klassifiseringen for RAIM; legger ikke til noen ny integritetsmatematikk.

seg-3a7572774192 = Avkastning per dekning

seg-797d137dc022 = Beslutningsstøtte

seg-d77993b6ef59 = En linse for avkastning per dekning: kostnad per enhet levert dekning for en avveining mellom konstellasjoner eller arkitekturer. Dekningskomponenten setter sammen den validerte dekningsgeometrien, og aritmetikken er enhetstestet, men kostnaden er en brukerinndata, så forholdet er et planleggingshjelpemiddel og ikke en eksternt validert størrelse (derfor, ærlig talt, ingen bevismerking).

seg-690b4cb0df55 = Kshana Interchange Format (KIF)

seg-558523b5e0ac = Utveksling av artefakter

seg-b882cccf5cee = versjonert konvolutt · rundtur og forovertkompatibel lesing verifisert

seg-ff5a4ead87fe = En versjonert, selvbeskrivende konvolutt som pakker et scenarioresultat inn med type, skjemaversjon og merkingene modellert/validert, slik at en lagret artefakt forblir selvdokumenterende og eldre konvolutter fortsatt kan leses forovertkompatibelt.

seg-5052e1720602 = Mottakertillitsscore for et fartøy

seg-70144aeea2d1 = overvåkernes aritmetikk kontrollert mot pynmea2 og GeographicLib

seg-9d9329128f06 = Skårer om et fartøys posisjonsbestemmelse kan stoles på, ut fra NMEA { "0183" } som mottakeren og instrumentene allerede sender ut: en skår fra 0 til 100, tre bånd og årsakene bak dem, per epoke, i batch, live eller som port. Overvåkerne sammenligner posisjonsbestemmelsen med fartøyets egen bevegelse, kompasset, loggen og signalnivåene fra satellittene. Veiledende programvare, ikke typegodkjent navigasjonsutstyr: operatøren er fortsatt ansvarlig. Overvåkernes aritmetikk er kontrollert mot uavhengige biblioteker; regelen og tersklene for skåren er prosjektets egne og forblir modellerte.

seg-a47934361f43 = NMEA-strømmer for mannskapstrening

seg-c6492d4a7dae = { "225,227" } setninger tolket og dekodet av pynmea2

seg-9ca765cc09fc = Skriver syntetisk NMEA { "0183" } for bro for en skriptet reise med instruktørskriptede hendelser med jamming, posisjonsavdrift, tidsspoofing og avspilling, med en instruktørlogg, slik at et mannskap kan se hvordan en forringet posisjonsbestemmelse ser ut på egne instrumenter. Bare tekst, aldri for et fartøys levende navigasjonssystemer; ingenting sendes, og intet radiosignal lages. Setningene og de dekodede verdiene er kontrollert; modellene for mottaker, himmel og hendelser er modellerte.

seg-39f61b88209e = kodebetydninger og geometri kontrollert mot pyModeS, pyais, shapely og GeographicLib

seg-4c1667d3d453 = Bygger et GeoJSON-kart per dag over hvor fly (ADS-B) og skip (AIS) har rapportert forringede navigasjonsdata, ut fra åpent lisensierte inndata, og andelen av en rute som går gjennom forringede celler. En forringet celle er en uttalelse om rapporterte nøyaktighetsfelt eller usannsynlige posisjoner, ikke en påvisning av interferens, og en celle ingen har observert er ikke belegg for en fri rute. Tidligere rapporter, ikke en prognose.

seg-e0962980e96f = Tillitstelemetri for sikkerhetsoperasjoner

seg-9b538e790bd7 = Prometheus, OTLP og CEF lest tilbake av uavhengige parsere

seg-f33e062790d9 = Eksporterer tillitsstrømmen som Prometheus-metrikker, OpenTelemetry (OTLP/HTTP) og CEF- eller LEEF-syslog-hendelser over stdout, HTTP, UDP eller TCP, slik at et sikkerhetsoperasjonssenter ser en navigasjonsfeil ved siden av sine andre varsler. En død samler stanser verken vurderingen eller går uten at noen merker det. Prometheus, OTLP og CEF leses tilbake av uavhengige parsere; LEEF kontrolleres bare mot sin egen spesifikasjon.

seg-c74f3b9569b1 = Signerte bevispakker

seg-28016686504c = RFC { "8032" }-vektorer byte for byte; en clean-room-verifikator er enig på { "71" } pakker

seg-123fa1de2e23 = Samler vinduet rundt en tillitshendelse i en hashkjedet, Ed25519-signert pakke som hvem som helst kan verifisere frakoblet: en endret, fjernet, byttet eller tilføyd fil, en pakke som er signert på nytt eller en feil festet nøkkel blir navngitt. Et valgfritt tidsstempeltoken etter RFC { "3161" } bindes til den. En teknisk registrering, ikke en juridisk vurdering, en konstatering av faktum eller en bekreftelse.

seg-ee2e250497f9 = Eksport til testbenk

seg-ea618add831e = konverteringer og kodinger kontrollert mot PROJ, GeographicLib, pynmea2 og SciPy

seg-be8af88f4f99 = Skriver et scenarios kjøretøybevegelse og hendelser som en CSV-bane og NMEA { "0183" } for en GNSS-simulator i laboratorium: jordfaste, geodetiske og lokale hastighetskolonner, holdning og UTC. Bare bevegelse og hendelser: ingen signaler skrives, og ingen ytelse hos simulator eller mottaker påstås.

seg-1ff1d8ebf1e7 = Compliance-kartlegging mot offentlige rammeverk

seg-83af3fa21509 = Kartlegger Kshana-utdata mot klausulene i offentlige rammeverk (IMO-veiledning for skip, EU NIS2 artikkel { "21" }, EN { "16803" }, det amerikanske DHS-rammeverket for robust PNT og EASA-veiledning for luftfart) bare etter klausulnummer, fylt ut fra kjøringene du gir den, og sier hvilke rader et sett kjøringer gir belegg for, med gapet for hver rad. Det er ikke en konstatering av at noe rammeverk er innfridd, og ikke en vurdering eller godkjenning fra noen.

seg-1b784a8701ac = GNSS-autentisering

seg-2b5a6095013a = alle { "18" } offisielle testvektorsett: { "186,382" } tagger autentisert, { "0" } feilet

seg-0419e9af208d = En åpen verifikator på mottakersiden i ren Rust for Galileo Open Service Navigation Message Authentication: den kontrollerer hvilke satellitters navigasjonsdata en mottaker kan autentisere fra I/NAV-sider eller en u-blox UBX-strøm, gjennom kontrollene av offentlig nøkkel, nøkkelkjede og tagger i spesifikasjonen for signal i rommet, og rapporterer autentisering per satellitt og per tid. Den autentiserer data; den påstår ingen ytelse mot spoofing.

seg-d8bb6226f2e3 = Synlighet med horisontmaske, DOP og feilellipse

seg-6c6e7248496f = Himmelgeometri

seg-94ff262653a6 = { "1173" } siktevinkler og { "142" } synlige sett stemmer med Orekit { "12.2" } og gnss_lib_py { "1.0.4" } til { "1e-12" }; ellipsen stemmer med numpy i { "270" } tilfeller

seg-309521d4c9e1 = Hvilke satellitter et sted kan se når bygninger, kaier, kraner eller terreng blokkerer deler av himmelen, og hva det gjør med presisjonsfortynningen (DOP) og den horisontale feilellipsen. En azimutavhengig horisontlinje erstatter den enkle elevasjonsgrensen; det synlige settet, dets DOP og ellipsen kommer ut per epoke og per konstellasjon. En horisontlinje fjerner satellitter med fri sikt og ikke mer: den modellerer ingen refleksjoner, ingen diffraksjon og ingen signalstyrke.

seg-448e81d36ca4 = Forhåndsinnstillinger for horisontlinjer og himmelgeometrifunksjonene

seg-6483f9d89f15 = håndberegnede verdier og geometrien skyen trekker fra; ingen ekstern uavhengig referanse

seg-ebc2904904d3 = Reduksjonene for gatekløft, sektor og terreng til en horisonttabell, fire representative forhåndsinnstillinger (bygate, havneinnseiling, fjord, containerterminal) og funksjonene som setter dem sammen til et skyplot og en Monte Carlo-sky, fra CLI, MCP, Python og nettleseren. Forhåndsinnstillingene er representative geometrier med valgte, oppgitte dimensjoner, ikke oppmålinger, og reduksjonene er bare kontrollert mot håndberegnede verdier.

seg-c2a5a6a7bcb0 = Geometribevisst tillitsklassifisering

seg-2f51e4da63b4 = klassifiseringsregelen og tersklene er prosjektets egne, kontrollert mot seg selv

seg-b664ce284745 = Setter satellittgeometrien ved siden av mottakertillitsscoren og navngir en klasse for hvert fradrag: signaltap, dårlig geometri eller en inkonsistens mellom mottakerens oppgitte DOP og den som utledes fra satellittene i sikte. Geometri vurderes bare når den er kjent, og merkingen er hovedpoenget: bare en dårlig geometri koster poeng. Veiledende programvare, ikke typegodkjent navigasjonsutstyr.

seg-5026aab26cb8 = Studie av referansestasjon på Månen

seg-d6935d32272b = setter sammen testede funksjoner for differensial, klokke og referansesystem på Månen; kontrollert mot seg selv og en numpy-referanse, ingen eksterne flydata

seg-4f9696706384 = Én reproduserbar studie av hva en referansestasjon ved Månens sørpol kunne gjøre under offentlige forutsetninger: et dekningskart og nøyaktighetskart over polarområdet (persentil for korrigert og ukorrigert posisjonsfeil, tilgjengelighet med en grunn for hver utilgjengelige epoke, beskyttelsesnivåer og budsjettet for korreksjonslinken), et tidslaboratorium som holder en tidsreferanse for Månen på en atomklokke, og geodesien til en lagt til laserretroreflektor og VLBI-fyr mot datumet fra fem grupper. Hver inndata er merket med sin offentlige kilde eller som illustrativ. Det er ikke en uttalelse om ytelsen til noe ekte system, og Kshana er ikke tilknyttet noe byrå.

seg-cad8be3b66a3 = Optiske tidslinker gjennom skyer og turbulens

seg-e86745da72f0 = { "7" } av { "7" } numeriske terskler fastsatt på forhånd nådd mot et uavhengig mpmath-program; ingen målt tilgjengelighetsregistrering er sammenlignet

seg-dd98aa94f8c8 = Hvor ofte en optisk tidsoverføringslink er oppe når atmosfæren er i veien. For hvert bakkested gir motoren tapet i klar luft, turbulenstilstanden etter Hufnagel-Valley med gamma-gamma-scintillasjonsfading og aperturmidling, tilgjengeligheten mot linkmarginen fra et oppgitt skyklima, taket ingen margin kan løfte, fordelingen av utfallsvarighet og tidsfeilen et utfall koster en klokke i holdover. Deretter viser den hva flere steder, en større apertur, en annen bølgelengde eller adaptiv optikk gir. De medfølgende skyklimaene er illustrative, ikke målt; utdataene er veiledende.

seg-861d57389dd7 = GNSS utenfor konstellasjonen: Space Service Volume og hinsides

seg-8705c276af61 = ICG SSV-hefte-tabeller, forhåndsregistrert; de fleste terskler NOT MET (xval/gnss-ssv/RESULTS.md)

seg-2dc82174942a = For et romfartøy på en kule (det globale skallet i ICG-heftet om Space Service Volume) eller på en keplersk bane fra LEO til månetransfer teller den per konstellasjon (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og for alle samlet signalene over en C/N0-terskel: tilgjengelighet for ett og for fire signaler, lengste utfall, mottatt C/N0, presisjonsfortynning og lenker i hovedlobe mot sidelobe. Sendemønstrene er heftets, en parametrisk erstatning eller et du leverer selv; en modell for ionosfære, plasmasfære og atmosfære med randstråle og en utforming av mottaker for svake signaler er valgfrie; et GNSS-filter om bord for høye baner og månetransferbaner og relativ navigasjon i formasjon er inkludert. MODELLED: sammenlignet med heftets tabeller under en forhåndsregistrering som ble fastlagt før kjøringen, stemmer konstantene for minste utstrålte effekt og terskelen for Månen, de andre tersklene er NOT MET under den forhåndsregistrerte lesingen (nesten alle på grunn av heftets inkonsistente stråleåpning for GLONASS), og den parametriske sidelobeerstatningen gjengir ikke de målte GPS-panelmønstrene.

seg-61817375c8ea = Månens bane og overflate som navigasjons- og geodetisk infrastruktur

seg-d2439abaeabb = numpy/scipy-referanser for numerikken; tre terskler fastsatt på forhånd er NOT MET (xval/lunar-infra/RESULTS.md)

seg-db45ac2940af = Fem studier i en begrenset trelegemesmodell: banebestemmelse om bord med Earth-GNSS i en nesten rettlinjet halobane mot en uavhengig bakkebasert bestemmelse av avstand og avstandsrate; felles fastsetting av heltallsflertydighet i bærebølgefase for overflatestasjon og orbiter (LAMBDA); Fisher-informasjonen til et lunart datum med sju parametere med og uten avstander mellom orbiter og overflate; GNSS-, VLBI- og laseravstandsforskyvninger mot den lokale koblingen; og følsomhet for de lunare tidevanns- og librasjonsparametrene. MODELLED med illustrative inndata: numerikken er kontrollert mot uavhengige numpy- og scipy-programmer, ikke fysikken. Under tersklene fastsatt på forhånd er tre NOT MET: en injisert kraftfeil påvises ikke med den oppgitte raten (C3), den bootstrappede suksessraten avviker fra numpy-referansen med { "1.7e-6" } mot en terskel på { "1e-9" } (Q3), og å legge til en avstandsfamilie senker ikke alltid pseudoinverssporet (G3, sporhalvdelen).

seg-aab745a65e76 = Modul

seg-d6476863f862 = Funksjon

seg-ad856ad710eb = Status

seg-6962adaa6a1f = Generert fra scenariofilene og verifikasjonsmatrisen i repositoriet ved bygging.

seg-30200bb5be58 = Kjør orbit-sgp4-gps.toml i Kshana Studio

seg-ecacc78711a1 = Kjør realtime-frame-eop.toml i Kshana Studio

seg-fe9baedab7f0 = Kjør imu-deadreckoning.toml i Kshana Studio

seg-58a3232bc4cf = Kjør ins-trn-coast.toml i Kshana Studio

seg-27ffc4dfa394 = Kjør gps-denied-gravity-nav.toml i Kshana Studio

seg-eb0c08082d24 = Kjør gnss-ins.toml i Kshana Studio

seg-8d0f45d119a9 = Kjør lunanet-araim.toml i Kshana Studio

seg-09641b89ad3a = Kjør lunar-frame-realisation.toml i Kshana Studio

seg-4eea1b7d77cd = Kjør moonlight-service-volume.toml i Kshana Studio

seg-3cd4cd7d7c16 = Kjør lunar-interop-export.toml i Kshana Studio

seg-d767de2fa87a = Kjør lunar-llr-datum.toml i Kshana Studio

seg-29266e8878ac = Kjør lunar-differential-pnt.toml i Kshana Studio

seg-0955d6ded82d = Kjør lunar-time-budget.toml i Kshana Studio

seg-ab41004755ea = Kjør lunar-jamming.toml i Kshana Studio

seg-edbe5cf449a0 = Kjør lunar-vlbi-fim.toml i Kshana Studio

seg-d706c2d59dd1 = Kjør mars-pnt-lmo.toml i Kshana Studio

seg-71586c459df8 = Kjør hybrid-optical-rf.toml i Kshana Studio

seg-87634a6d41b5 = Kjør integrity-raim.toml i Kshana Studio

seg-a281aa02ddc7 = Kjør araim-reference-check.toml i Kshana Studio

seg-9184b54b1173 = Kjør clock-holdover.toml i Kshana Studio

seg-2f270136b41d = Kjør gnss-sim-raim.toml i Kshana Studio

seg-f2f3ede70967 = Kjør pvt-abmf.toml i Kshana Studio

seg-eac325fbeed1 = Kjør spoof-attack.toml i Kshana Studio

seg-07d55d3e7bdc = Kjør oem-interop.toml i Kshana Studio

seg-5b70a59accce = Kjør aperture-duty-cycle.toml i Kshana Studio

seg-d3df277fd118 = Kjør space-weather.toml i Kshana Studio

seg-7dc863bf8f7b = Kjør impairment-eval.toml i Kshana Studio

seg-1c3083a77264 = Kjør conflict-resilience.toml i Kshana Studio

seg-b3f2b2d88d8c = Kjør gnss-ssv-shell.toml i Kshana Studio

seg-e42b759ccbaf = Kjør lunar-infrastructure-od-consistency.toml i Kshana Studio

seg-60a43431ebe0 = Krav

seg-cbf0f9bcd2d8 = Uavhengig referanse

seg-1603e76bcf66 = Identifisering av potenslovstøy ved lag-1-autokorrelasjon

seg-d95fe5878ee3 = allan::lag1_noise_id: identifikatoren for støy ved lag-1-autokorrelasjon etter Riley og Greenhall ({ "2004" }) (desimert fase med dens kvadratiske ledd fjernet, eller gruppemidlet frekvens med dens linje fjernet; gjentatte første differanser til delta = r1/({ "1" }+r1) < { "0.25" } eller d = dmax), som returnerer potenslovens eksponent alfa som heltall og urundet (+{ "2" } hvit PM til -2 random-walk FM) ved en hvilken som helst midlingsfaktor; den fastsetter frihetsgradene for støytype i enhetskortene til biblioteket med målte klokker

seg-6e0cb6acc073 = VALIDATED

seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin og bidragsytere, LGPL-3.0-or-later, kjørt som et eget program av fixture-generatoren): en uavhengig implementasjon av den publiserte Riley-Greenhall-algoritmen, en entydig definert størrelse under de oppgitte konvensjonene. Validerer identifikatoren, ikke støyinnholdet i noen virkelig klokke

seg-aedf395f3597 = Galileo OSNMA, autentisering av navigasjonsdata på mottakersiden

seg-1e6e62438dad = osnma + <c1/>: en åpen, ren Rust-verifikator på mottakersiden for Galileo OSNMA (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) fra I/NAV-sider eller en u-blox UBX-RXM-SFRBX-strøm: Merkle-tre-offentlige nøkler (DSM-PKR), ECDSA P-256/P-521-signaturen til DSM-KROOT, verifikasjon av TESLA-nøkkelkjeden (SHA-256 eller SHA3-256), MACSEQ- og tag-verifikasjon (HMAC-SHA-256 eller CMAC-AES) for ADKD { "0" }, { "4" } og { "12" } med kryssautentisering, kjedeslutt/tilbakekalling/fornyelse, fornyelse og tilbakekalling av offentlig nøkkel, og varselmeldingen; status per satellitt Authenticated/Failed/Unavailable med en årsak for hver feil eller forsinkelse. Veiledende: ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for navigasjonsintegritet; det hevdes ingen ytelse mot spoofing

seg-a6bd60ed728f = De offisielle testvektorene for Galileo OSNMA, utgitt av European GNSS Service Centre som vedlegg til Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } av { "18" } sett, { "186,382" } tagger autentisert, { "0" } feilet, kjørt frakoblet 2026-10-10 (evidensposten i kshana-pro docs/evidence). Omfang: vektorene validerer den kryptografiske verifikasjonen (Merkle, KROOT/ECDSA, TESLA-kjede, MACK-tagger, ADKD 0/4/12) og utfallene av den på de publiserte scenarioene; de bruker bare HMAC-SHA-256, en SHA-256-kjede, 128-biters nøkler, 40-biters tagger og oppslagsoppføringene { "33" } og { "34" }, så CMAC-AES, SHA3-256-kjeder og andre parametere dekkes bare av publiserte known-answer-tester for primitiver og av syntetiske tester. Herdingen av klarert tid, databinding, utløp og headerbekreftelse er testet med de syntetiske angrepstestene, ikke med en ekstern uavhengig referanse. Ikke kontrollert: sertifikattilbakekallingslister, levende signaler eller en levende mottaker (UBX-ordoppsettet er bare kontrollert på syntetiske rammer), SHA3-256 Merkle-trær, ferskhet uten en uavhengig tid. Ikke en EU-tjeneste

seg-27a61718eb95 = Karakterisering av frekvensstabilitet

seg-56174d771190 = Allan/modifisert/Hadamard-avvik + identifisering av potenslovstøy med χ²-KI-er

seg-ed01b2ab3481 = NIST SP { "1065" } (Riley) / Stable32 referanseavvik på NBS14

seg-25b78672c194 = Frekvensstabilitet på en virkelig målt klokke

seg-fd378f5fe04a = Overlappende Allan- og overlappende Hadamard-avvik på en virkelig cesiumstandard

seg-64fd49d58394 = Stable32 overlappende ADEV/HDEV på den målte faseserien fra cesium 5071A (allantools)

seg-f305dbc83f2b = Paritet for Allan-estimatorer på den kanoniske Stable32-referanseserien

seg-5bfca5dcfb7c = Overlappende Allan + modifisert Allan + tidsavvik over hele AF-stigen

seg-327ab6dcf16a = Stable32 referanseavvik for PHASE.DAT (Riley; standard regresjonsserie)

seg-96c4275f5a89 = Frekvensstabilitet med utvidet rekkevidde (Theo1 / TOTDEV)

seg-7f59c3631ca4 = Theo1 og totalavvik (TOTVAR) — estimatorer for langtids-tau-stabilitet med utvidet rekkevidde som når ~{ "75" } % av opptaket der Allan-avviket gir opp nær ~{ "50" } %; den bias-fjernede ThêoH-hybriden (allan::theoh_curve) bygget på dem forblir MODELLED

seg-a38edc2526f5 = allantools { "2024.06" } — et uavhengig frekvensstabilitetsbibliotek fra tredjepart — theo1 (NIST SP { "1065" } likn. { "30" }) og totdev (NIST SP { "1065" } likn. { "25" }) på det hermetiske LCG-datasettet i NIST SP { "1065" } §{ "12.4" }; kan genereres på nytt frakoblet via tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

seg-cc40472fbcbf = Maximum Time Interval Error (MTIE) — wander-mål for telekom

seg-5c54ba2748f7 = MTIE(τ): det maksimale topp-til-topp-utslaget i tidsfeil over et hvilket som helst glidende vindu på τ = m·tau0, wander-statistikken i ITU-T G.810/G.823/G.8261 som grensene for synkroniseringsnett (MTIE-masker) er skrevet mot — et ekstremalmål (maks/min) som skiller seg fra Allan-familiens RMS

seg-300fd3f945a0 = allantools { "2024.06" } — et uavhengig frekvensstabilitetsbibliotek fra tredjepart — mtie() på den hermetiske LCG-faseserien i NIST SP { "1065" } §{ "12.4" }; MTIE er en ren maks/min-statistikk, så estimatorens utdata er bitnøyaktig mot allantools på den identisk bygde fasetabellen (de innsjekkede referansekonstantene med 15 gjeldende sifre ligger innenfor { "1" } ULP). Kan genereres på nytt frakoblet via tests/fixtures/mtie/generate_mtie_reference.py

seg-67d73f3ca14d = Modifisert Allan / tidsavvik (MDEV / TDEV)

seg-9ac9d2b0bdf8 = MDEV(τ): det overlappende modifiserte Allan-avviket (estimator med glidende vindu over andre differanser som skiller hvit fasestøy fra flicker-fasestøy), og TDEV(τ) = τ/√{ "3" }·MDEV(τ), tidsdomene-wander-statistikken i ITU-T G.811/G.812/G.823 som synkroniseringsmaskene er skrevet mot

seg-24a441f32375 = allantools { "2024.06" } — et uavhengig frekvensstabilitetsbibliotek fra tredjepart — mdev() og tdev() på den hermetiske LCG-faseserien i NIST SP { "1065" } §{ "12.4" } (samme serie som radene for Theo1/TOTDEV/MTIE), som regner ut de samme entydig definerte estimatorene; stemmer til <{ "1e-9" } relativt. Kan genereres på nytt frakoblet via tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (Den datastyrte phasedat_reference.rs kontrollerer også disse mot Stable32 til { "1e-3" }; dette er den stramme, alltid påslåtte hermetiske kryssjekken)

seg-e4b6d707cbf5 = Frekvensstabilitet for optisk klokke på en virkelig målt kurve

seg-e9077554a08f = NNLS-gjenvinning av potenslov (hvit FM + rød støybunn) fra et publisert, målt Allan-avvik for den optiske klokkeovergangen i ⁸⁸Sr — gjenskaper σ_y(τ) og den fremtredende skaleringen 4.7e-16/√τ ved kort τ med en genuin målt støybunn ved lang τ, i stedet for den syntetiserte støybunnen av optisk klasse som holdover.rs ellers antar

seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), fig. { "4" } målt ADEV; kurven er hentet ordrett fra Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Avgrenset til å gjenskape den publiserte målte stabilitetskurven — enhetstallene for holdover-til-terskel per klokkeklasse forblir MODELLED

seg-cc95c8615d39 = Integritet (RAIM/ARAIM/SBAS)

seg-d4ad9cfa4f9b = ARAIM-løsning med flere hypoteser og løsningsseparasjon etter ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels og add_v42_protection_levels_ecef: bestemmelse av delmengder etter reglene P_THRES og FC_THRES, VPL, HPL, den effektive monitorterskelen EMT og sigma_acc); kjikvadrat-RAIM for feildeteksjon i et enkelt øyeblikk med utelukkelse av én satellitt (raim::snapshot_raim, raim::snapshot_raim_fde) og stigningsbasert HPL/VPL på det geodetiske lokale nivået; og SBAS DO-229E-kombinasjonen av beskyttelsesnivå (sbas::sbas_protection_level) på L1-tjenesten. IKKE dekket, oppgitt rett fram: bekvemmelighetsfunksjonene med uniform sigma raim::araim_raim og raim::araim_dual_raim er IKKE i samsvar med ADD (på like inndata bommer de på Stanford MAAST med { "0.75" } m VPL / { "4.04" } m HPL og { "0.39" } m VPL / { "1.93" } m HPL, et funn); sammenligningen av dobbeltfrekvent flerkonstellasjons (DFMC) L5-SBAS er et funn ({ "308" } brukerepoke-par uten GEO i sikte er beskyttet av Kshana og ikke av MAAST, hvis GEO-mottaksport Kshana ikke modellerer); raim::solution_separation_raim har ingen ekstern sammenligning

seg-1c37702cc5f2 = Banepropagering og banebestemmelse

seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + perturbasjoner, batch-/sekvensiell OD

seg-c84585f43297 = Verifikasjonsvektorer for AIAA 2006-6753 SGP4

seg-50c545872e4f = Numerisk Cowell-propagator og kraftmodell

seg-74f8c585bcfd = Numerisk Cowell-propagator med en hierarkisk kraftmodell (todelslegeme, sonal J2–J6, tredjelegeme Sol/Måne, SRP for kanonkule, eksponentiell luftmotstand); RK4 med trinndobling / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 — et uavhengig bibliotek, en annen integrator og en annen rekursjon for kulefunksjoner. De konservative nivåene (todelslegeme → sonal J2–J6 → tredjelegeme Sol/Måne → SRP for kanonkule) stemmer til under en meter over en bue på { "24" } timer, noe som validerer integratoren + kraftalgebraen; nivået for luftmotstand og den absolutte innmatingsfideliteten for Sol-/Måne-efemeride og tetthet forblir MODELLED (kun karakterisering)

seg-d38c4be472ac = SRP-skygge for oblat Jord (valgfri)

seg-ab8247c6b4d2 = SRP-belyst andel med WGS-84-ellipsoiden som det okkulterende legemet (tilsynelatende jordradius fra ellipsoidens lem mot Sola, linseformel med to disker; srp_shadow::oblate_conical_shadow), valgfri i Cowell-kraftmodellen gjennom propagator::ForceModel::srp_shadow (standard: den sfæriske koniske skyggen, uendret)

seg-01066d639b39 = Boks-og-vinge og ECOM2 solstrålingstrykk, med partielle deriverte (valgfritt)

seg-2a5fc9708bd0 = SRP uten kanonkule: en flat-plate-modell med boks og vinger (Vallado likn. 8-44; ensidige kroppspaneler, solpekende vinger) med tabellene for Galileo FOC, IOV og IOV ved endt levetid fra GSC-satellittmetadataene, i nominell GNSS-yaw-styring, med analytiske partielle deriverte for strålingsfaktoren og for hvert panels speilende og diffuse koeffisienter; og den empiriske ECOM2-modellen (D2/B1) med sine partielle deriverte. Boks-og-vinge er valgfri i Cowell-propagatoren (propagator::ForceModel::box_wing_srp, som setter feltet srp_boxwing) og i modellen for presis banebestemmelse (precise_od::PreciseForceModel::box_wing_srp), og erstatter kanonkuleleddet med cr som strålingsfaktor; begge er som standard None, slik at alle eksisterende baner forblir byte-identiske. ECOM2 er ikke koblet inn i noen kraftmodell

seg-bde1b3a94a47 = SRP-skygge med lemmørking av Sola (valgfri)

seg-eaaec545dd68 = SRP-belyst andel som den uokkulterte andelen av den lemmørkede solfluksen (lov av Eddington-tilnærming I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre-kvadratur) over en sfærisk eller WGS-84-Jord (srp_shadow::limb_darkened_shadow, ShadowModel-varianten OblateEarthLimbDarkened)

seg-76cb4b668ad5 = Ingen ekstern: Orekit { "12.2" } har ingen belysningsratio med lemmørking. Kontrollert bare mot lukkede former av den samme loven

seg-673b17e9dcf7 = NRLMSISE-00 termosfærisk tetthet

seg-09e997231de8 = En portering av den empiriske termosfæren NRLMSISE-00 (gtd7 og gtd7d: artstettheter, total massetetthet med anomalt oksygen, temperaturer; de { "24" } bryterne; moduser for daglig Ap og ap-tabell for 3 timer) fra C-versjonen i det offentlige eiendomsområdet av NRL-Fortran-koden

seg-12977f65b2ea = NRLMSISE-00-nivå for tetthet ved luftmotstand (valgfritt)

seg-17aec847b675 = forces::DensityModel (Exponential som standard, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) og propagator::ForceModel::drag_density: kvadratisk luftmotstand mot den medroterende atmosfæren med NRLMSISE-00-tettheten i det geodetiske WGS-84-punktet (jordrotasjonsvinkel med UT1 = TT, lokal soltid UT + lon/15), konstant romvær per modell; som standard av og bit-identisk

seg-1ac7430e88fc = Standard eksponentiell luftmotstand mot en uavhengig implementasjon (ekvatorial)

seg-a9c41b03f2ca = Standard luftmotstand i Cowell-propagatoren: kvadratisk luftmotstand mot den medroterende atmosfæren med forces::atmospheric_density, den stykkevis eksponentielle tabellen i Vallado tabell 8-4 ved den sfæriske høyden (propagator::ForceModel::drag med standardvarianten Exponential av forces::DensityModel)

seg-9e15970435c3 = DE440 Sol og Måne i Cowell-kraftmodellen (valgfritt)

seg-de6831cf7785 = Valgfritt efemeridenivå for tredjelegeme- og SRP-leddene i den numeriske Cowell-ForceModel: den geosentriske Sola og Månen fra en hvilken som helst EphemerisProvider (en DE440 SPK-kernel gjennom KernelEphemeris) ved TDB = TT + (TDB - TT), som avviser en leverandør som ikke kan betjene epoken og teller enhver reserveløsning til den analytiske serien; som standard av

seg-057c21daf4f2 = S1 atmosfærisk tidevann (valgfritt)

seg-f600a39f297e = Det daglige S1-lufttrykkstidevannet som en perturbasjon av geopotensialet: Biancale og Bode ({ "2006" }) modell N1, grad { "2" } til { "6" }, gjennom lastformelen i IERS { "2010" } likn. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valgfritt i Cowell- og de presise kraftmodellene (air_tide_s1, som standard av)

seg-7dd9fccac779 = Ingen ekstern for geopotensialeffekten. De { "24" } koeffisientene er transkribert fra GFZ STR06/01 tabell { "1" } modell N1 og kontrollert på nytt rad for rad mot rapporten (SHA-256 890865ae); grad { "0" }, { "1" }, { "7" } og { "8" } brukes ikke. Ray og Ponte ({ "2003" }) trykker ingen kulefunksjonstabell, så ingen andre kilde ble sammenlignet

seg-b150b1bdb599 = S2 atmosfæriske tidevannskoeffisienter i IERS-konvensjonen

seg-87e9238b8c53 = Ray ({ "2001" }) S2-lufttrykksharmonikker (n <= { "4" }, prograd og retrograd) omregnet til den fullt normaliserte formen med sinus-ledende fase i IERS { "2010" } likn. 6.20-6.21 (amplitude delt på N_nm, epsilon = { "90" } grader - psi) og brukt som S2-leddet i tides::atmospheric_tide

seg-444f0a65b6fd = Tesseral geopotensial i Cowell-propagatoren

seg-ad475816bc78 = Valgfritt tesseralfelt EGM2008 (til grad/orden { "70" }) som sentral gravitasjon i den numeriske Cowell-ForceModel, evaluert i et jordfast referansesystem rotert med IAU { "2000" } jordrotasjonsvinkel (eller CIO GCRS-til-ITRS-kjeden); som standard av, så ingen eksisterende utdata flyttes

seg-e8f5ff8c9149 = Kulefunksjonsgravitasjon av høy grad (EGM2008 til { "2190" })

seg-d3b2f32dcecb = Underflytsikker og polsikker evaluering av et fullt normalisert felt til grad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, modifisert fremoverkolonne etter Holmes-Featherstone { "2002" } med gradienten fri for 1/cos phi), en strømmende ICGEM .gfc-laster (from_gfc_file / from_gfc_reader; hele EGM2008 hentes ved kjøring, ikke medfølgende), og Holmes-Featherstone-evaluatoren som kan velges på den valgfrie Cowell-Geopotential

seg-e81b7418c382 = DOP853-integrator

seg-e6e3638aa68e = Hairer DOP853 { "8" }({ "5,3" }) eksplisitt Runge-Kutta med den kombinerte feilestimatoren av 5. og 3. orden, SciPy/Hairer-trinnkontrolleren, automatisk startsteg, en feillukket trinnvakt og tett utdata av 7. orden; kan velges som propagatorens Integrator-variant Dop853 / propagator::propagate_dop853

seg-9ad7c1f4da77 = Robust løser for Kepler-ligningen

seg-4b9d812fd13e = Elliptisk Kepler-løser for alle { "0" } <= e < { "1" } og alle middelanomalier: kubisk startverdi og korreksjon av femte orden etter Markley ({ "1995" }), et residual uten kansellering (1-e)E + e(E - sin E) - M, og vaktet Newton-polering (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

seg-1960804ef2f4 = Batch-banebestemmelse med avstandsrate og az/el med stasjonsmaskering

seg-4c185244bc66 = Gjenvinn en epoketilstand fra blandet sporing av avstand, avstandsrate og azimut/elevasjon over en elevasjonsmaske med Gauss-Newton på H = (dh/dx(t)) Phi(t, t0): analytiske partielle deriverte av målingene og en variasjonell tilstandsovergangsmatrise med analytiske todelslegeme- + J2-deriverte (RK4-integrert, ikke en STM i lukket form)

seg-bc3d1ee7c639 = Vekting av observasjoner etter SP3-nøyaktighetskode

seg-63b1fab84f85 = Avbild SP3-nøyaktighetskoder (header ++-eksponenter i { "2" }^n mm, %f-basen, standardavvik base^n mm per post) til posisjonssigma per observasjon for motoren for presis banebestemmelse (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ebecb8906506 = Ingen ekstern: vektene er et modelleringsvalg (SP3-formatet definerer koden bare som produsentens nøyaktighetsindikator; den leses her som ett sigma per akse). De eksisterende registrerte kjøringene fra byråer er uendret

seg-e35df6881c80 = Planetariske gravitasjonsfelt fra PDS SHADR-tabeller

seg-f78b73ae8742 = Les PDS SHADR kulefunksjonstabeller (from_shadr, på SphericalHarmonicField i src/gravity_pds.rs: enhetskonvertering, C00 = { "1" } levert, kontroller av fullstendighet og normalisering) og evaluer den legemsfaste gravitasjonen til Mars GMM-3 (d/o { "120" }) og månefeltet GRAIL GL0660B (d/o { "660" })

seg-ae3e8833a5ef = Fest et publisert gravitasjonsfelt til et legeme

seg-ffb2b20e5f32 = with_gravity_field (på Body, i src/gravity_pds.rs): fest et hvilket som helst lastet kulefunksjonsfelt (for eksempel GMM-3 eller GL0660B) til en Body slik at propagatoren evaluerer det legemsfast; valgfritt, standardlegemer uendret

seg-bcb731f7a9b5 = Bare intern konsistens. Hvert publisert felt er definert i produsentens legemsfaste system (GMM-3 i Mars-systemet til Konopliv et al. { "2006" }, GL0660B i det månefaste hovedaksesystemet DE421), mens feltet evalueres i IAU-systemet; forskyvningen er ikke modellert

seg-659bfeba459c = Batch- og sekvensiell banebestemmelse

seg-dbc98f498941 = Gjenvinn en epoketilstand [r,v] fra avstander til bakkestasjoner via en Gauss–Newton batch-differensialkorrektor og et sekvensielt filter, over en todelslegeme- + J2-kraftmodell

seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — et uavhengig estimeringsbibliotek fra tredjepart på en matchet kraftmodell; gjenvunnet epoketilstand + RMS av residualer etter tilpasning stemmer til <{ "1e-3" } m uten støy og <{ "3" } m ved en støybunn på { "5" } m

seg-acdac055acb9 = Radiometrisk lysgangstidsløser for dypt rom

seg-62a478e40850 = Retardert (nedgående ledd) enveis lysgangstidsløsning τ = |r_rx − r_target(t−τ)|/c for radiometrisk navigasjon i dypt rom (Jorda→Mars/Sola/Månen)

seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) lysgangstid med konvergert newtonsk aberrasjon (Aberration::CN; tilsvarer SPICE spkapo) over JPL DE440 — en uavhengig SPICE-implementasjon i Rust; kshanas retarderte fastpunktsløser stemte til under et nanosekund. De bredere tallene for Doppler / Shapiro / redusert-dynamisk OD forblir MODELLED

seg-c69ef9342160 = Satellittposisjon fra kringkastet efemeride (multi-GNSS RINEX)

seg-62702fc6f242 = IS-GPS-200 / Galileo-OS / BeiDou-OS kringkastet efemeride, Kepler → ECEF-satellittposisjon fra en parset RINEX-3-navigasjonspost

seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos() kompilert fra C-kildekode (T. Takasu, BSD-2-Clause) — en uavhengig implementasjon av IS-GPS-200/SIS-ICD, matet med identiske RINEX-3-navigasjonsposter; satellittposisjon i ECEF stemte til ~{ "62" } nm. (SP3-interpolasjon av presis efemeride er validert separat — se «SP3-interpolasjon av presis efemeride»)

seg-c807a782b20e = SP3-interpolasjon av presis efemeride

seg-238de70daab9 = Lagrange-interpolasjon etter IGS-standard av satellittposisjoner fra SP3 presis efemeride med jordrotasjonskorreksjon per node (roter hver node med ω⊕·(t_node−t) inn i det jordfaste systemet for spørreøyeblikket før polynomtilpasningen)

seg-e9249ae44a11 = RTKLIB peph2pos() kompilert fra C-kildekode (preceph.c; T. Takasu, BSD-2-Clause) — den faktiske IGS-referansen, en uavhengig implementasjon; kshanas interpolator (som nå har den samme nodekorreksjonen for jordrotasjon) stemte til ~{ "15" } nm på et virkelig SP3-produkt, ned fra ~{ "5.5" } cm før korreksjonen

seg-9762cf428435 = Koderere for navigasjonsmeldinger utover GPS LNAV (GPS CNAV, Galileo I/NAV og F/NAV)

seg-9b703b9607d8 = GPS CNAV-meldingstyper 10/11/30, Galileo I/NAV-ordtyper 1-5 i nominelle partalls-/oddetallssider og Galileo F/NAV-sidetyper 1-4: ICD-feltpakking og kvantisering, CRC-24Q, konvolusjonskoding med rate 1/2 K={ "7" } (G2 invertert for Galileo), blokkinterleaving og synkroniseringsmønstre, med tilsvarende testdekodere

seg-7939b210e83c = Intern rundtur og known answers fra ICD; ingen tredjepartsdekoder er kjørt (RTKLIB-/GNSS-SDR-harnisken som leser KSHANA_NAVMSG_ORACLE_JSON er datastyrt). MODELLED

seg-5ce7cd3d6011 = Leser for IONEX globalt ionosfærekart og interpolasjon på en virkelig CODE GIM

seg-502656556ddf = IONEX { "1.0" }-leser (header, I5-verdier i faste kolonner, TEC- og RMS-kart, absolutte epoker, manglende verdier) med bilineær romlig interpolasjon, formatets tidsinterpolasjon for nærmeste / påfølgende / rotert kart (likn. 1-3) og tynnskall skrå TEC

seg-974d8c1f7876 = Hatch-bærebølgeutjevning av kode på virkelige RINEX-observasjoner

seg-f26b5da0f52e = Divergensfritt Hatch-filter (ionosfærefri kode båret av den ionosfærefrie bærebølgen, vindu på N epoker, omstart ved tap av lås, geometrifritt hopp eller gap) i sammenstillingen for presis enkeltpunktsposisjonering

seg-fac84cb9b256 = FUNN mot den publiserte ITRF2020-koordinaten for WTZR: de forhåndsregistrerte tersklene (utjevnet median og p95 på høyst { "0.6" } x rå; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) ble ikke nådd, forholdstall { "0.718" } og { "0.923" }; den gjenværende feilen på meternivå er biasaktig (C1C-kodebias, antenne, tidevann, langperiodisk flerveisfeil), ikke den hvite støyen utjevningen fjerner. MODELLED: filterets statistikk er kontrollert internt

seg-2eec513ae8c8 = RTK-dobbeltdifferanser med LAMBDA-heltallsfiksering på virkelige RINEX-observasjoner

seg-6571676bf918 = Relativ posisjonering på kort grunnlinje fra virkelig dobbeltfrekvent GPS-kode og bærebølgefase: dobbeltdifferanser mot den høyeste satellitten med full kovarians, et float-Kalman-filter over grunnlinjen og enkeltdifferansenes flertydigheter med reinitialisering ved sykluskutt, LAMBDA-heltallsminstekvadrater med ratiotesten, og grunnlinjen betinget på de fikserte heltallene

seg-e50c5d4b65c7 = Publiserte ITRF2020-koordinater for WTZR og WTZZ (IGN ITRF2020_GNSS.SSC, løsning { "3" }, med RINEX-antennehøydene) som gir referansegrunnlinjen; terskler forhåndsregistrert i tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md før koden ble skrevet. Bare kort grunnlinje: ingen ionosfæriske eller troposfæriske dobbeltdifferanser er modellert

seg-f9aa0c529393 = PPP-tidsløsning for mottakerklokke mot IGS endelig stasjonsklokke

seg-83ad9e893db9 = Mottakerklokken estimert av det statiske float-PPP-filteret på virkelig dobbeltfrekvent GPS-kode og -fase med IGS endelige baner og klokker: en tidsoverføring fra mottakeren til IGS-tid, den ionosfærefrie PPP-tidsløsningen.

seg-91a882dd71e8 = Den endelige kombinerte IGS-klokken for stasjon WTZR (AR-poster i IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, en kombinasjon av nettverksløsninger fra flere analysesentre; IGS-produkter, fri bruk med kildehenvisning); terskler forhåndsregistrert i xval/ppp-time/PREREGISTRATION.md før noen sammenligning; alle holdt ved første kjøring. HVA SOM IKKE ER DEKKET: én stasjon og ett konvergert vindu på to timer; IGS-tid, ikke UTC(k); den konstante forskyvningen inkluderer kodebias i mottakeren og er avgrenset, ikke kalibrert; ingen sporbarhet til Circular T.

seg-a9b2a93401a3 = Float presis enkeltpunktsposisjonering på virkelige RINEX-observasjoner

seg-cc991ccec112 = Statisk float-PPP med utvidet Kalman-filter på virkelig dobbeltfrekvent GPS-kode og bærebølgefase med IGS endelige baner og klokker: ionosfærefri kombinasjon, antenneforskyvninger for satellitt og mottaker (mottakervariasjoner), fast jordtidevann, fase-wind-up, Shapiro-forsinkelse, estimert zenitt-våtforsinkelse, float-flertydigheter per bue med deteksjon av sykluskutt via geometrifri / Melbourne-Wübbena

seg-36e7c9286af7 = Publisert ITRF2020-koordinat for WTZR (IGN ITRF2020_GNSS.SSC, løsning { "3" }, propagert med sin hastighet) — terskler forhåndsregistrert i tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md før filteret ble skrevet; utvikling bare på den samlokaliserte stasjonen WTZZ. Ikke modellert: havlast, PCV for satellitt, heltallsløsning av flertydigheter

seg-c8d87abed330 = Lesing av RINEX { "4" }-navigasjonsfil

seg-28913a01af00 = RINEX 4.00-4.02 navigasjonsfiler: <c1/>-poster for GPS LNAV, Galileo I/NAV og F/NAV, BeiDou D1/D2 og QZSS LNAV dekodet til typen for kringkastet efemeride; CNAV, CNV1-3, FDMA, SBAS, STO, EOP og ION-poster hoppes over til neste postheader; en post der headeren nevner en annen satellitt, eller en avkortet post, avvises

seg-278ca396127a = Lesing av RINEX { "4" }-observasjonsfil

seg-e0883aa933eb = RINEX 4.0x observasjonsheadere (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etiketter matchet i kolonne 61-80 for versjon { "4" } og senere) og epokeposter

seg-971fb1203a6d = Formatkontroll på en virkelig publisert RINEX { "4.00" }-fil (verdier lest tilbake er lik filens trykte literaler) og en spesifikasjonsutledet header; ingen uavhengig leser er kjørt, så MODELLED

seg-33e5c74720ff = Kringkastet satellittposisjon for BeiDou GEO

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } posisjon for geostasjonær satellitt fra en kringkastet efemeride (treghetslignende system, deretter Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valgfritt gjennom feltet include_beidou_geo i NavParseOptions, så standardleseren fortsatt hopper over GEO

seg-559814996a4c = SP3-interpolasjon av presis klokke

seg-8e7a0dbd1755 = Satellittklokkeforskyvning mellom de tabulerte SP3-klokkenodene ved lineær interpolasjon over de to omsluttende gyldige nodene (RTKLIB pephclk-skjemaet; sentinellverdi for dårlig klokke hoppes over), og de samme nodene matet inn i kjeden for presise produkter som poster tilsvarende RINEX-klokke

seg-1f4f0f841802 = IGS endelig kombinasjon av satellittklokker på { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24): publiserte klokkeestimater i spørreøyeblikkene, ikke interpolert fra SP3; terskler forhåndsregistrert i tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md før første kjøring (RMS { "0.15" } ns, p95 { "0.30" } ns, nodemedian { "1e-12" } s, diskriminering 2x)

seg-71f48628ebb2 = Tett koblet GNSS/INS med bærebølgefase og float-flertydigheter

seg-5a156aa81275 = Error-state EKF over { "15" } INS-tilstander, en mottakerklokke med to tilstander og én float-bærebølgeflertydighet per sporet satellitt; pseudoavstand, bærebølgefase og valgfri avstandsrate fra en SGP4 Walker-konstellasjon (lysgangstid og Sagnac), Klobuchar- og Saastamoinen/Niell-korreksjoner anvendt i sløyfen ved filterets egen posisjon; deteksjon av sykluskutt med tidsdifferensiert bærebølge og en terskel per satellitt utvidet med hastighetsusikkerheten; reinitialisering av flertydighet ved sykluskutt og gjenerverving

seg-00576e8c1032 = Intern konsistens: målingene syntetiseres fra modellene filteret bruker (χ² NEES/NIS over seeds, en støyfri konvergens, injisering av sykluskutt). MODELLED; ingen virkelige mottakerdata eller tredjepartsfilter er sammenlignet

seg-7d644516b1ec = GNSS/INS-pakker for sjø, bane og luftfart med valgfri tett kobling

seg-cbb03a8baf73 = Tre gnss-ins-scenarioer på banebiblioteket (et fartøy som slingrer med { "8" } m/s med et avbrudd på fem minutter; et tog gjennom en skjæring med to satellitter og en tunnel; et fly der avbruddet dekker en sving med 25 graders krengning) og pakkens valgfrie [tight]-tabell: pseudoavstander fra en SGP4 Walker-konstellasjon fusjonert av navigatoren med lukket sløyfe, hver satellitt over masken når nominelt og de høyeste få når degradert

seg-273c14256d4c = Intern: hver pakkes kvalitetsmål mot dens egen referanse og en sammenligning av løs/tett kobling på identiske inndata. MODELLED; revisjonens sammenligning med NaveGo er ikke kjørt

seg-f4dab73c4eda = Koblet PNT-filter for pseudoavstand med biastilstand og 3D-utvidelse i fusjonspakken

seg-742b60089361 = Ett stablet Kalman-filter over posisjon, hastighet, klokkefase og frekvens matet med pseudoavstander som kobler posisjon og klokke (oppdateringer i Joseph-form som bærer kryssovariansen); en variant med 1 DOF utvidet med en konstant akselerometerbias-tilstand som fusjonspakken kjører under [coupled]; og 3D-versjonen med 8 tilstander med siktlinjerader

seg-9558d7aad3af = Intern konsistens: referansen simulert fra filtrenes egne modeller (χ² NEES over Monte Carlo-seeds, den frakoblede pakken på identiske sensorer). MODELLED

seg-4a64aa1fe3ca = Løst koblet GNSS/INS-EKF med lever arm på KF-GINS-datasettet

seg-30f503856ac5 = Error-state EKF med 15 tilstander i lukket sløyfe drevet av IMU-inkrementer, med GNSS-antenneposisjoner fusjonert gjennom lever arm-modellen H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], konfigurert fra en KF-GINS YAML-fil (starttilstand og sigmaer, ARW/VRW, Gauss-Markov-biaser)

seg-b01d28a09abe = Datasettets publiserte referansebane og KF-GINS C++-programmet (GPL-3.0, commit 8291a93e, kjørt som et eget verktøy); terskler forhåndsregistrert i xval/kfgins/PREREGISTRATION.md, og KF-GINS ble ikke kjørt på disse dataene før den registreringen (kontrollert i Results). Alle seks tersklene holdt ved første kjøring. DATASTYRT: demodatasettet til KF-GINS (virkelig IMU av typen Leador-A15 og RTK GNSS med en referansebane) har ingen lisens, så det er ikke medfølgende; xval/kfgins/fetch.sh henter det ved testtidspunktet med SHA-256 festet for hver fil, og testen feiler ved avvik; veien for å gjenskape, som krever nettverkstilgang, står i xval/kfgins/PREREGISTRATION.md. Løftet til VALIDATED ved eierens beslutning på datastyrt evidens (2026-10-13)

seg-e6b6c605564c = Eksport fra testbenk lest av en simulators leser for bevegelsesfiler (gps-sdr-sim)

seg-a07429aa1998 = Bevegelsesfilene fra bench-eksporten som gis til en åpen GNSS-simulators egne lesere kommer tilbake som den eksporterte banen: NMEA GGA-filen (-g), utsnittet tid/bredde/lengde/høyde av bevegelses-CSV-en (-x) og dens utsnitt tid/x/y/z (-u), på { "6" } gnss-ins-scenarioer (inkludert pakkene for sjø, bane og luftfart, lest til simulatorens grense på 3000 sampler) og { "2" } stasjonære. Bare bevegelse; intet signal skrives eller genereres.

seg-07b5f46a900f = HVA SOM KONTROLLERES EKSTERNT, oppgitt snevert: gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion og readUserMotionLLH med sin egen WGS { "84" } llh2xyz, kalt gjennom xval/testbench-gpssdrsim/driver.c (ingen signalfunksjon kalt), mot de jordfaste kolonnene i bevegelses-CSV-en rad for rad, med terskler forhåndsregistrert i xval/testbench-gpssdrsim/PREREGISTRATION.md før noen kjøring: hver sample lest på alle { "8" } scenarioer; NMEA verst { "1.21" } mm (terskel { "1" } cm); LLH-utsnitt verst { "0.145" } mm (terskel { "1" } mm); jordfast utsnitt med fire kolonner eksakt (terskel { "1" } um, endring { "1" }); gnss-ins-rader på simulatorens rutenett på { "10" } Hz til { "2.3e-13" } s. FUNN (kjøring { "1" }, festet): CSV-en i full bredde uten header kan ikke leses av -u, fordi leserens linjebuffer på 100 tegn deler hver rad på 161 tegn i to sampler; docs/TEST-BENCH.md gir utsnittet med fire kolonner. HVA SOM IKKE ER DEKKET: fysikken i scenarioets referansebane; gps-sdr-sims signalutdata; noen annen simulators leser; noen mottaker.

seg-2db2b9dc3b45 = GNSS/INS-banebibliotek og import av CSV-referanse

seg-e1fe83c75a6c = Valgbare bevegelsesprofiler for gnss-ins-pakken (rett, figur-8, urbant stopp-og-kjør, flyoppstigning og koordinert sving, kartleggingsdrone), definert ved Euler-rate- og kommandoer for akselerasjon langs sporet, lukket på referansetilstanden med den kinematiske IMU-en (sentripetal-, gravitasjons- og Coriolis-ledd), og importert CSV-referanse omformet til den IMU-en som gjenskaper den; den historiske kjøringen er uendret når ingen profil er gitt

seg-30ea002a06a0 = Intern: identiteter for stivlegemekinematikk, CSV-rundturen og filterets egen kovarians. MODELLED (ingen virkelig kjørelogg er sammenlignet)

seg-8685fd899e3c = Strapdown INS-mekanisering

seg-ba942e322f8a = Strapdown treghetsmekanisering i WGS-84 NED med kvaternionholdning (coning/sculling-kompensert) som propagerer en navigasjonstilstand fra (Δθ, Δv)-inkrementer

seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) kjørt under Octave — et uavhengig publisert INS-verktøysett drevet av den identiske strømmen av (Δθ,Δv)-inkrementer. Holdningen stemmer bit for bit (samme konvensjoner for NED / skalar-først-kvaternion / jordrate / transportrate); hastighet/posisjon stemmer opp til to dokumenterte forskjeller — nordgravitasjonsleddet for lodavvik som NaveGo tar med og kshana utelater av utforming (loddlinjegravitasjon; stemmer med den lukkede formen til Groves i hvert siffer, med en sanity-gulvkontroll) og O(dt²)-forskjeller i integratoren — ikke feil i mekaniseringen

seg-d1a5c8e7ca74 = Syntese av gravitasjonsfeltfunksjonaler (gravitasjonsstøttet / GNSS-fritt navigasjonskart)

seg-8336eb12eb7b = Kulefunksjonsgravitasjon, størrelse + forstyrrelse (mGal), fra en hvilken som helst ICGEM .gfc-modell; GRS80 normalgravitasjon

seg-b5a7fc986751 = GRS80 (Moritz { "1980" }, IAG) Somigliana normalgravitasjon + publiserte γ_e/γ_p; virkelig ICGEM EGM2008-felt

seg-86f9186bb884 = Jord–Måne CR3BP { "9" }:{ "2" } NRHO mot banen CAPSTONE fløy

seg-d4127cf241f3 = Den sirkulære begrensede { "9" }:{ "2" } L2 sørlige nesten-rettlinjede haloen som cr3bp::differential_correct_halo korrigerer (banefamilien for Gateway og CAPSTONE), sammenlignet på middelgeometri (periode, perilune-radius, apolune-radius) med banen CAPSTONE faktisk fløy. Et mål på hvor godt CR3BP-medlemmet beskriver den virkelige banen; en CR3BP-bane er ikke en bane i en efemeridemodell og sammenlignes ikke epoke for epoke

seg-c866a5bd4318 = CR3BP-tilstander i roterende system avbildet til månesentrert ICRF på Jord–Måne-linjen fra DE440

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf avbilder en udimensjonal CR3BP-tilstand i roterende Jord–Måne-system til en månesentrert ICRF-posisjon og -hastighet på den øyeblikkelige Jord–Måne-linjen (lengdeenhet Jord–Måne-avstanden, tidsenhet den inverse banerate, systemets fulle vinkelhastighet inkludert dens rate ut av planet fra Månens akselerasjon), med inversen from_moon_centred_icrf, og cr3bp::to_moon_centred_icrf_de440 leser den geosentriske Måne-tilstanden fra en DE440 SPK. Den avbilder tilstander; den gjør ikke en CR3BP-bane til en bane i en efemeridemodell

seg-d543e3e84f36 = Solsystem-kind på en JPL-kernel (planetary_kernel_path)

seg-e8a96f29afc7 = <c1/>-kind med planetary_kernel_path: hvert rapportert legeme der SPK-en har sin egen NAIF-kode henter sin heliosentriske J2000-posisjon og -hastighet fra kernelen gjennom motorens egen leser (etikett KERNEL), en lenke der begge ender finnes i kernelen beregnes på den, barysentre byttes aldri inn for en planet, og alle andre legemer forblir analytiske med sin egen etikett; rapporten får en kernelblokk (sti, SHA-256, legemene og lenkene hentet fra den) bare når valget er satt. Med de440s.bsp er det Merkur, Venus, Jorda og Månen

seg-7f3d53b4e8d1 = Porkchop på DE440-efemeriden

seg-bd813d7e0b58 = maneuver::porkchop_kernel: sveipet over oppskytingsdato x ankomstdato av avgangs-C3 (km²/s²) og ankomst-V-uendelig (km/s) med Lambert-løseren for én omdreining i prograd retning og kollinearitetsvakten på { "0.5" } grader, på de heliosentriske J2000-tilstandene til to hvilke som helst NAIF-legemer lest fra en JPL DE440 SPK av cratets egen leser. Én omdreining, prograd, ingen begrensninger for bærerakett eller ankomst: et sveip, ikke en oppdragsutforming

seg-b1401bed5da8 = Optimalisator for impulsiv overføring på DE440-efemeriden

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: avgangs- og ankomstdatoene for en ballistisk overføring med to impulser og én omdreining som minimerer avgangs-C3 eller ankomst-V-uendelig innenfor Type I eller Type II, som et kontinuerlig optimum (et rutenett på 2 dager over begge vinduene, deretter 2D Nelder-Mead), på heliosentriske tilstander fra DE440 SPK. En datooptimalisator for ett ledd, ikke en oppdragsutforming: ingen valg for bærerakett, parkeringsbane, manøvrer i dypt rom eller flere omdreininger

seg-6c695aef043b = En uavhengig optimalisator: NAIF SPICE Toolkit (CSPICE N0067 gjennom spiceypy { "8.3.0" }) heliosentriske tilstander på det samme de440s-utsnittet, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) og SciPy { "1.18.1" } Nelder-Mead, uten å kalle noen Kshana-kode. NASAs håndbok for Jorda-til-Mars (MIDAS, efemeride ikke oppgitt, datorutenett på 2 dager) er en sekundær publisert referanse og setter ikke statusen

seg-93f3cdbb7297 = Lambert-løser for overføringer med flere omdreininger

seg-995a6a995b78 = Hver løsning av Lamberts problem med opptil tre fullstendige omdreininger (maneuver::lambert_multirev: løsningen med én omdreining, deretter venstre og høyre gren for hvert antall omdreininger, Izzo { "2015" }), med grensehastighetene v1 og v2, for prograde og retrograde overføringer, i kanoniske og heliosentriske SI-enheter, inkludert overføringer innenfor { "1" } % av minste flytid for et antall omdreininger og geometrier nær 180 grader. Bare en todelslegemeløser (ingen perturbasjoner)

seg-ff9c6140fe1c = Lambert-løser for todelslegemeoverføring

seg-d8c39ced64b2 = Izzo-2015 Lambert-løser for én omdreining (r1, r2, flytid → grensehastigheter) over overføringer LEO→GEO→heliosentrisk, prograde og retrograde

seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — en uavhengig Lambert-løser fra tredjepart. Lamberts problem for én omdreining (M={ "0" }) har en entydig løsning, så enighet mellom bibliotek og bibliotek er en ekte ekstern kontroll; stemte til <{ "1e-4" } m/s (observert ~{ "1e-11" }), den samme typen validering som DOP får mot gnss_lib_py

seg-347cece5df63 = Referansesystemer og tidsskalaer

seg-5a4bc2c15eaa = IAU 2006/2000A presesjon-nutasjon, CIO GCRS↔ITRS, tidsskalaer med skuddsekunder

seg-51d28ab9d256 = Referansevektorer fra IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-c3d4b9bef817 = Todelte juliandatoer og skuddsekunder på tidsveien for jordbaner

seg-5e859e3aa613 = En UTC-kalenderdato og -tid til en todelt UTC-juliandato med SOFA dtf2d-konvensjonen for dager som ender med et skuddsekund ({ "86 401" } s lange, { "23" }:{ "59" }:{ "60" }.x gyldig), UTC til TAI og tilbake, og UT1 fra UTC via TAI, på todelte datoer fra 1972-01-01: tidsveien som SGP4 (Sgp4::propagate_at, målt fra en todelt epoke) og den jordfaste rotasjonen IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop med den todelte jordrotasjonsvinkelen) tar

seg-f1c7bc235a6b = Todelte juliandatoer gjennom jordrotasjon på banens vei

seg-cee11d4bad08 = Jordrotasjon fra en todelt UT1-juliandato på banens vei, slik at den jordfaste posisjonen beholder mikrosekundet en enkelt f64-dato taper (omtrent { "3e-9" } rad nær { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konvensjonen, på de to delene), cio::gcrs_to_itrs_matrix_jd2 (CIO GCRS-til-ITRS-matrisen med jordrotasjonsvinkelen fra de to delene), og, bygget på dem og kontrollert internt, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 og own_jd2_utc, det valgfrie two_part_jd i efemeridescenarioet (ECEF-posisjonen, sporet på bakken og stasjonsvisningen; som standard av, uendret), og tapsfrie From-konverteringer mellom jd2::Jd2 og timescales::TwoPartJd. Presesjon-nutasjon og epoken i Cowell-kraftmodellen forblir enkel f64, der en avrunding på { "40" } us ligger under { "1e-15" } rad eller langt under feilen i den analytiske Sol-/Måne-efemeriden

seg-096df3971f5f = Systemmatriser mot ERFA-vektorer: IAU { "2006" } bias-presesjon, TEME til GCRS, og CIO-kjeden med korreksjoner for himmelpolen

seg-731a5ed967b3 = Tre systemmatriser sammenlignet element for element eller etter rotasjonsvinkel med ERFA ved vilkårlige epoker: precession::precession_matrix (IAU { "2006" } bias-presesjon med Fukushima-Williams-vinkler), nutation::teme_to_gcrs_matrix (rotasjonen TEME til GCRS P^T N^T Rz(-EE) med IAU { "2006" }-presesjon, IAU 2000B-nutasjon og jevndøgnsligningen med sine to ledende komplementære ledd) og cio::gcrs_to_cirs_matrix_with_offsets (rotasjonen GCRS til CIRS med IERS-korreksjonene for himmelpolen dX, dY lagt til modellens CIP X, Y før rotasjonen, SOFA cookbook-konvensjonen; ny). Selve modellvalgene (2000B-nutasjon på TEME-veien, serien med to komplementære ledd) er ikke validert, bare implementasjonen deres

seg-4e2fe2e3dabb = UTC før 1972 (æraen med drivende rate) på tidsveien med todelt juliandato

seg-1d086e669f09 = UTC fra 1960-01-01 til 1971-12-31, da UTC gikk med en rateforskyvning fra TAI og ble stilt i brøkdeler av et sekund, på veien med todelt juliandato: TAI - UTC fra driftstabellen for hver periode (timescales::tai_minus_utc_on_date), UTC-kalenderdatoen til en todelt UTC-juliandato med dagslengden { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC til TAI med dagsbrøken skalert fra UTC til SI-sekunder (jd2::utc_to_tai) og TAI tilbake til UTC (jd2::tai_to_utc), etter SOFA dtf2d, utctai og taiutc. Før { "1960" } regnes TAI - UTC som { "0" } (SOFAs verdi; UTC udefinert) og ligger utenfor påstanden. Den enkle f64-funksjonen timescales::tai_minus_utc klemmer fortsatt til { "10" } s før { "1972" } og er ikke dekket

seg-efacec095051 = GLONASS kringkastet satellittklokke og propagering av kringkastet bane

seg-821b9c01b56e = GLONASS kringkastet satellittklokkebias -tau_n + gamma_n (t - t_b) ved en tid lest på satellittklokken (glonass::GlonassEphemeris::sv_clock_bias_s, forskyvningen korrigert for klokkebiasen med to fastpunktsiterasjoner), og den jordfaste PZ-90-posisjonen til den kringkastede tilstandsvektoren propagert med RK4 gjennom bevegelsesligningene i GLONASS ICD innenfor +/-15 min fra referanseepoken (GlonassEphemeris::position_ecef), fra virkelige RINEX { "3" } GLONASS-navigasjonsposter. Ingen transformasjon PZ-90.11 til ITRF er anvendt (de stemmer på centimeternivå siden { "2014" }; RTKLIB anvender heller ingen). Ikke koblet til noe scenarioutdata: bibliotekfunksjon

seg-d3b72a6fbb18 = Én vei for jordbaner: SGP4-elementsett til GCRS og ITRS på IAU 2006/2000A-kjeden med parametere for jordorientering

seg-e4eca7205b5e = Propagerings- og systemveien alle rutede kinds for jordbaner deler: et SGP4-middelelementsett med todelt UTC-epoke (sgp4::MeanElementSet, lest fra elementene i konstellasjonsutformingen med MeanElementSet::from_earth_fixed) propagert av SGP4/SDP4 til TEME (sgp4::SgpOrbit), og rotasjonene TEME -> ITRS og GCRS -> ITRS i IAU 2006/2000A-kjeden med UT1 - UTC og polbevegelse (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, formene uten parametere teme_to_itrs_matrix og gcrs_to_itrs_matrix). TEME er den sanne ekvator ved datoen med middeljevndøgn, nådd fra GCRS gjennom IAU { "2006" } bias-presesjon, IAU 2000B-nutasjon og jevndøgnsligningen

seg-f650a11458b8 = Avveining ved utforming av avstandsmålingskoder

seg-071e552a7179 = Grenser for sidelober og krysskorrelasjon for m-sekvens/Gold, lengde↔flertydighet

seg-65b7902a2d8f = Publisert GPS C/A Gold-krysskorrelasjon (−{ "23.9" } dB); Gold-grensen fra { "1967" }

seg-5ec4c0730280 = GNSS-geometri / presisjonsfortynning (DOP)

seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP fra siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-oppdeling

seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — uavhengig bibliotek, stemmer til { "1e-6" } relativt

seg-1a5623c81b48 = Posisjonsfeil fra geometri: RMS-feil = sigma_UERE x DOP for motorens minstekvadratløsning

seg-7a94b44a8738 = dop_error_mc::run_geometry og check: en seedet Monte Carlo (N = { "20,000" } epoker per geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) av motorens egen iterte minstekvadratløsning (pvt::solve_spp, enhetsvekter, løst fra den sanne posisjonen) på de { "8" } geometriene i tests/fixtures/dop/dop_reference.csv, som sammenligner varianser av feil mot øst, nord, opp og klokke, RMS for H/V/P, korrelasjonen øst-nord, middelfeilene og andelen innenfor den horisontale ellipsen på { "95" } % med sigma^{ "2" } Q, der Q er kovariansfaktoren i orbit::dop-kjernen (orbit::dop_cofactor, den samme aritmetikken) på den samme geometrien

seg-90f18c774d57 = Intern konsistens mot en lukket form: under den lineære gaussiske modellen er minstekvadratkovariansen sigma^{ "2" } (H^T H)^-1 (Kaplan og Hegarty (red.), Understanding GPS: Principles and Applications, 2. utg., Artech House, { "2006" }, kap. { "7" }). Metode og toleranser fra designnotatet for geometri i { "0.36" }, avsnitt { "5.2" }, fastsatt i en forhåndsregistreringscommit før første kjøring: hver varians innenfor { "5" } % ({ "5" } standardfeil for en utvalgsvarians ved N = { "20,000" }), hver RMS innenfor { "2.5" } %, korrelasjonen øst-nord innenfor { "0.035" } (5/sqrt(N)), hvert middel innenfor { "5" } standardfeil, andelen i ellipsen på { "95" } % innenfor { "0.95" } +/- { "0.0077" } ({ "5" } binomiske standardfeil); negative kontroller (PDOP doblet; feil som vokser som 1/sin(elevasjon) mot den uvektede Q) må feile. HVORDAN DEN SAMMENSETTES: Q er kovariansfaktoren i orbit::dop-kjernen, VALIDATED mot gnss_lib_py { "1.0.4" } på de samme { "8" } geometriene i tests/dop_reference.rs (raden «GNSS-geometri / presisjonsfortynning»); denne raden legger til steget fra disse faktorene til meter gjennom motorens løser og låner ikke den radens status. HVORFOR MODELLED: ingen eksternt datasett er involvert; samsvar viser at estimatoren og støyen realiserer sigma x DOP under lærebokmodellen, ikke at noen mottakers feil er lik UERE x DOP, og sigma_UERE er en inndata

seg-9acfde1b57f7 = Geometribevisst tillitsklassifisering: satellittgeometri ved siden av tillitsscore for mottakeren og en klasse på hvert fradrag

seg-6138c41e13ff = receiver_trust::geometry: satellittgeometri per epoke (god, degradert med årsakene few-satellites/high-pdop/high-hdop/sky-blocked, eller ukjent når loggen ikke gir GSV, NAV-SAT eller GSA) utledet fra de rapporterte elevasjonene og azimutene gjennom orbit::dop eller hentet fra GSA, med en etikett som alltid rapporteres og aldri skåres (god, middels, dårlig, ukjent) og HDOP, PDOP, VDOP, antall satellitter og signaltap i ord; en geometrimonitor i skåren for fartøy som ikke trekker noe med mindre geometrien er dårlig (forholdet max(hdop/4, pdop/6, 5/n_used) over { "1" }), og deretter trapper opp til et tak på { "15" } poeng ved { "1.5" } som geometri alene ikke kan ta under det degraderte båndet (tak, sluttpunkt for trappen og gulv i [geometry]; ingen alarm); en klasse på hvert fradrag (geometri, miljø, inkonsistens) der tap av lås til satellitter under { "15" } grader klassifiseres som geometri, satellitter i sikte men ikke sporet klassifiseres som miljø, og et fradrag for dårlig geometri der den oppgitte HDOP ligger utenfor max({ "1.0" }, { "25" } % av den utledede HDOP) fra den oppgitte himmelen klassifiseres som inkonsistens

seg-6987737c5fe4 = Intern konsistens: klassifiseringen er kontrollert mot reglene den oppgir og mot håndutledede forholdstall på syntetiske redigeringer av den innsjekkede demologgen, og no-change-pinnene holder utdataene fra { "0.35.0" }: ingen skåre endres med mindre geometrien er dårlig; etiketten rapporteres alltid. HVORFOR MODELLED: tersklene er valgt, ikke tilpasset (opphav i hver kjørings geometry_model; tallene fra IEC 61108-1 og GPS SPS som sitert, skal kontrolleres mot standardenes tekst), og det finnes ikke noe eksternt merket datasett over naturlig geometridegradering mot angrep å validere klassifiseringen mot. Den utledede DOP gjenbruker orbit::dop-kjernen, VALIDATED mot gnss_lib_py, og denne raden låner ikke dens status. En klasse av geometri er en påstand om himmelen, ikke et funn om at intet angrep skjedde

seg-540420863a5a = Kringkastet ionosfæremodell (Klobuchar, IS-GPS-200)

seg-fd157c537502 = Klobuchar enkeltfrekvent L1 skrå ionosfærisk gruppeforsinkelse fra de åtte kringkastede α/β-koeffisientene

seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — uavhengig referanseimplementasjon kompilert fra kildekode; stemte til < { "1e-4" } m

seg-0af6b1a073ce = Statistisk kjerne for RAIM/ARAIM-integritet (χ²- / ikke-sentral χ²- / normalfordelinger)

seg-224a6c4200cd = Den distribusjonelle kjernen hvert beskyttelsesnivå hviler på: terskelen for feildeteksjon i et enkelt øyeblikk χ²₁₋ₚfₐ(dof), ikke-sentraliteten ved uteblitt deteksjon pbias=√λ og multiplikatorene K_fa/K_md/K_V for løsningsseparasjon

seg-49f7d0c26e0a = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — uavhengig bibliotek (Cephes/Boost), en annen algoritme enn Kshanas serie for ufullstendig gamma; stemte til ≤{ "1e-6" } rel. Bare kjernen. *Allokeringen* av ARAIM MHSS P_HMI-budsjettet er ikke lenger uten en publisert numerisk uavhengig referanse — det gjennomregnede eksempelet fra WG-C ARAIM Technical Subgroup støtter nå den separate raden «ARAIM MHSS-beskyttelsesnivåer mot publiserte referansevektorer», stemt ved referansens egen TOL_PL = { "5e-2" } m — så denne radens omfang er den statistiske kjernen og den raden bærer allokeringen (se docs/ARAIM_REFERENCE.md)

seg-03578217425f = SBAS-beskyttelsesnivå (DO-229E vektet LS HPL/VPL)

seg-df640d6c7a5d = DO-229E vedlegg J beskyttelsesnivåer med vektede minste kvadrater: D=(GᵀWG)⁻¹ fra elevasjon/azimut og feilbudsjett per satellitt, hovedaksen til den horisontale feilellipsen og vertikal σ, skalert med de publiserte K-faktorene

seg-39aed7b4bffd = RTKLIB SBAS-PL-fork — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, «DO-229D Appendix J»), kjørt av rnx2rtkp -ws på virkelige EGNOS GEO-PRN120-meldinger + virkelig BUTE/Budapest RINEX; uavhengig implementasjon fra tredjepart, HPL stemte til < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) bekreftet identisk konvensjon. Begge uavhengige referanser runder K_V→{ "5.33" } mot Kshanas eksakte Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } (~{ "0.06" } %), så den vertikale kontrolleres som den K-faktorfrie d_U

seg-8f32eb9c8167 = Evalueringsmål for ML-detektorer (ROC/AUC/forvekslingsmatrise/Pfa-Pmd)

seg-b0d8e1b45bf9 = AUC (Mann-Whitney, likhet ½), forvekslingsmatrise ved terskel, P_d/P_md/P_fa/presisjon/nøyaktighet/F1

seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — uavhengig bibliotek, eksakt samsvar

seg-e7af87ce5e72 = Skåring av avviksdeteksjon på virkelig romfartøytelemetri

seg-9659b33fca5b = ROC AUC + bootstrap-KI som skiller virkelige merkede avvik; gjennomsiktig detektor (gjenskaper etikettene)

seg-b4ed67ce7e7e = scikit-learn roc_auc_score på OPSSAT-AD-testdelingen (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — virkelig OPS-SAT-telemetri

seg-5c3f1057c6cc = Numeriske kjerner for kvanteavveining (NNLS / χ²-bånd / van-Loan Q)

seg-f82113ccb30b = NNLS-tilpasning av målt ADEV, konsistensbånd χ² for NEES/NIS og klokkens diskrete prosesstøykovarians etter van Loan (holdover-glidning) — avveiningsmotorens beregningsmessige ryggrad

seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q eksakt, χ² <{ "5e-4" } ved driftsfrihetsgrader. Bare kjerner — tall for enhetsytelse forblir modellert (neste rad)

seg-6f3099e7562c = Geomagnetisk referansefelt (IGRF-14-syntese)

seg-e9534723cb34 = Kulefunksjonssyntese av IGRF-14-hovedfeltet — komponentene X/Y/Z/F, deklinasjon og inklinasjon — som mater laget for alt-PNT med magnetiske anomalier

seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — IAGA-VMODs rene Python-referanseimplementasjon av IGRF som leverer de offisielle IGRF14.shc-koeffisientene (IAGA 14. generasjon, Zenodo 10.5281/zenodo.14012302); en uavhengig kodebase fra tredjepart som beregner det entydig definerte IGRF-14-feltet, stemt over et globalt rutenett

seg-cb3fea409de7 = Deteksjonsstatistikk — gaussisk AUC og minste detekterbare feil

seg-ca677becb465 = Analytisk binormal ROC AUC = Φ(μ/(σ√{ "2" })) og den minste detekterbare feilen σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) som ligger under kvantefeil- og avviksdetektorene

seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), begge BSD-3-Clause — uavhengige biblioteker som beregner de samme entydig definerte størrelsene for gaussisk hale / AUC, stemt til A&S-erf-gulvet (~{ "7e-8" }). Fordelen for kvante mot klassisk som er bygget oppå forblir MODELLED

seg-1ed12110fb74 = Kjerne for rangstatistikk (Kendall-τ / Dirichlet / persentil)

seg-0fb003404a5b = Kjerner for rangkorrelasjon og resampling under studien av beslutningsustabilitet for resiliens: Kendall τ-b, Dirichlet-middel, konkurranserangering og persentil-konfidensintervaller

seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — uavhengige implementasjoner (merge-sort τ) av de entydig definerte rangstatistikkene, stemt til { "1e-12" }. Studien av beslutningsustabilitet bygget på disse kjernene forblir MODELLED

seg-fdd2ba203d5b = Kjerne for utledning av prioriteter i MCDA (AHP-egenvektor / konsistensratio)

seg-d01c155fbddf = Analytic Hierarchy Process, prioritetsvekter = normalisert hovedegenvektor (Perron) av en resiprok matrise for parvise sammenligninger ved potensiterasjon, med Saatys Consistency Index / Consistency Ratio og aksepteringsporten CR<{ "0.10" }

seg-d1947f2f2b3b = Saatys ({ "1980" }) kanoniske tabell for Random Index (RI({ "5" })={ "1.12" }) gjenskapt eksakt + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) som en uavhengig egenløser som beregner den samme entydig definerte Perron-egenvektoren/egenverdien, stemt til <{ "1e-9" }. Beslutningslaget for Pareto / sensitivitet / MAUT bygget på denne kjernen forblir MODELLED (aggregatorene WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE er validert eksternt hver for seg — se radene nedenfor)

seg-73e933220afb = Kjerner for vektet aggregering i MCDA (WSM / WPM)

seg-c436cdc991a2 = Weighted Sum Model (min–maks-normalisert additivt aggregat + rangering) og Weighted Product Model (sumnormalisert, resiprok for kostnad, multiplikativt aggregat) — de to skårerne for verdiaggregering i avveiningsstudier

seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — et uavhengig, mye brukt Python-bibliotek for MCDA fra tredjepart som beregner de samme entydig definerte vektede aggregatene; stemt til <{ "1e-9" }. Kan genereres på nytt frakoblet via tests/fixtures/mcda_wsm/ og tests/fixtures/mcda_wpm/. Garbage-in-garbage-out på inndataene; sensitivitets-/robusthetslaget forblir MODELLED

seg-f00bdb66a052 = MCDA-rangering etter avstand til ideal (TOPSIS)

seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — min–maks-normalisering, vektede positive/negative idealløsninger, relativ nærhet Cᵢ = d⁻/(d⁺+d⁻) og rangering

seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — et uavhengig Python-bibliotek for MCDA fra tredjepart som beregner de samme entydig definerte nærhetskoeffisientene; stemt til <{ "1e-9" }. Kan genereres på nytt frakoblet via tests/fixtures/mcda_topsis/generate_topsis_reference.py

seg-ef33d848c985 = MCDA-kompromissrangering (VIKOR)

seg-cf879fb770f2 = VlseKriterijumska Optimizacija — gruppenytte Sᵢ, individuell anger Rᵢ og kompromissindeksen Qᵢ ved strategivekt v={ "0.5" }, med rangeringen der lavere er bedre

seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — et uavhengig MCDA-bibliotek fra tredjepart som beregner den samme entydig definerte, områdenormaliserte S/R/Q-aggregeringen; stemmer overens til <{ "1e-9" }. Kan regenereres offline via tests/fixtures/mcda_vikor/generate_vikor_reference.py

seg-790176ba8196 = MCDA-rangering etter nettostrøm i overrangering (PROMETHEE II)

seg-b25cedf6da6e = Preference Ranking Organization METHod — parvis preferanseindeks med de seks standardformene for generalisert kriterium, positive og negative overrangeringsstrømmer og den fullstendige rangeringen etter nettostrøm (vanlig kriterium validert)

seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — et uavhengig MCDA-bibliotek fra tredjepart som beregner den samme entydig definerte nettostrømmen i overrangering; stemmer overens til <{ "1e-9" }. Kan regenereres offline via tests/fixtures/mcda_promethee/generate_promethee_reference.py. Preferanseformene med terskler (q/p/σ) reduseres til den samme algebraen for generalisert kriterium og forblir egenskapskontrollert

seg-72248291c388 = MCDA-valgkjerne for overrangering (ELECTRE I)

seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — konkordans- og diskordansmatriser, dominansrelasjonen med konkordans og uten veto, og valgkjernen for overrangering (konvensjon med bare nyttekriterier, sumnormaliserte vekter og én felles global skala)

seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — et uavhengig flerkriteriebeslutningsbibliotek fra tredjepart som beregner den samme entydig definerte konkordansen, diskordansen, dominansen og kjernen; stemmer overens element for element til <{ "1e-9" }. Kan regenereres offline via tests/fixtures/mcda_electre/generate_electre_reference.py. Valgene av ĉ/d̂-terskler er analytikerens inndata (sensitiviteten forblir MODELLED)

seg-95942c6a2689 = MCDA-aggregeringskjerner (WASPAS / MOORA)

seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (lineært normalisert konveks blanding λ·WSM+({ "1" }−λ)·WPM ved λ={ "0.5" }) og MOORA-forholdssystemet (vektnormalisert vektet nyttesum minus vektet kostnadssum) — den stabilitetsherdede verdiblandingen og den fortegnsbærende scoreren for forholdssystemet

seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA-forholdssystem, vektornormalisering) — et uavhengig, mye brukt Python-bibliotek for MCDA fra tredjepart som beregner de samme entydig definerte aggregatene; stemmer overens til <{ "1e-9" }. Kan regenereres offline via tests/fixtures/mcda_waspas/ og tests/fixtures/mcda_moora/. Søppel inn gir søppel ut for inndataene; sensitivitets- og robusthetslaget forblir MODELLED

seg-7de67fedc1da = MCDA-proporsjonal rangering (COPRAS)

seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — kolonnesumnormalisert nyttesignifikans S⁺ pluss leddet for invers kostnadssignifikans, den relative signifikansen Q og nyttegraden U = Q/max Q (beste alternativ = { "1" })

seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — et uavhengig MCDA-bibliotek fra tredjepart som beregner den samme entydig definerte relative signifikansen og nytten i COPRAS. pyDecision brukes bevisst: COPRAS i pymcdm { "1.4.0" } kollapser algebraisk til det trivielle S⁺+S⁻ og er ikke en tro referanse, mens pyDecision implementerer den kanoniske Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Stemmer overens til <{ "1e-9" }; kan regenereres offline via tests/fixtures/mcda_copras/generate_copras_reference.py

seg-bdb2917a2520 = Latens for endringsdeteksjon og ARL med CUSUM

seg-302f5db625df = Verste-tilfelle deteksjonslatens (⌊h/(z−k)⌋+{ "1" }) og gjennomsnittlig kjørelengde utenfor kontroll for tabulær CUSUM-detektor, brukt av beskyttelsesnivået for tidssynkronisering og av spoofing-monitorene

seg-691a506ce13f = Publisert ARL for tabulær CUSUM: Siegmunds ({ "1985" }) approksimasjon med brownsk bevegelse (Hawkins & Olwell { "1998" }, lign. { "3.7" }) krysskontrollert mot ARL-tabellene i Montgomery, Introduction to Statistical Quality Control (Wiley) for k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministisk latens stemmer eksakt overens med en førstepassasje-referanse. Den sammensatte TPL-grensen forblir MODELLED

seg-d923a77bd31a = Klokkens holdover: coast-varians og terskelinversjon

seg-4fafaf5f919d = Vekst i coast-fasefeilens varians q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 og dens monotone inversjon til en holdover-terskel for tidssynkroniseringsfeil

seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm som beregner den diskrete prosessstøyen Q₀₀ = ∫₀ᵗ ΦQcΦᵀds etter Van-Loan { "1978" } via Padé-skalering og kvadrering på den utvidede matrisen { "6" }×{ "6" } — en uavhengig vei som aldri ser kshanas polynomkoeffisienter; pluss optimize.brentq som inverterer den samme monotone kurven mot kshanas halvering. Tallene for rødstøygulvet per klasse (ClockClass) forblir MODELLED

seg-eb3cd9e92d8d = Kjerne for invers Simpson-diversitet

seg-244d57819f2b = Effektiv arkitektonisk diversitet = invers Simpson / Hill-orden-2-tallet 1/Σpᵢ² over kildekvaliteter per uavhengighetsgruppe (diversitetsleddet i resiliensscoren)

seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — et uavhengig bibliotek fra tredjepart som beregner den entydig definerte inverse Simpson-indeksen; gjengitt byte for byte. Rammeverket for scoring i DHS-RPCF (vekter og nivåer) som er bygget oppå, forblir MODELLED

seg-c14b8fe46517 = Asimutavhengig horisontmaske: synlig mengde, asimut og elevasjon, og DOP under masken

seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: den geodetiske (WGS-84) asimuten og elevasjonen til en satellitt fra et bakkested, en tabell med asimut-/elevasjonsmaske lineært interpolert i asimut med omslag ved { "360" } deg, den synlige mengden el >= max(mask_deg, mask(az)), og felles-klokke-DOP og ENU-og-klokke-kofaktormatrisen for denne mengden (kjernen bak orbit::dop). Slik avgjør seksjonen [skyline] synlighet i kjøringstypene gnss-sim, jamming, leo-pvt, leo-pass og nmea-scenario og, med bakkestedet user_site, i orbit og integrity

seg-bbb1828b3db1 = Gatekløft-, sektor- og terrengreduksjoner til en tabell

seg-2864aec7be88 = skyline: gatekløften i lukket form (kuttet atan((h - a) / d) med d = (w/2) / abs(sin(az - s)), åpne ender for en endelig lengde), skarpkantede sektorer med klokken med omslag, og terrengpunkter redusert til en tabell med krumningsfallet d^2/({ "2" } * 4/3 R); horisonten er deres punktvise maksimum sammen med en eventuell tabell

seg-50f1df206b30 = Internt: de lukkede formene kontrolleres mot håndberegnede verdier (veggtoppenes elevasjoner for en oppgitt gate, betingelsen for åpen ende, krumningsfallet for et oppgitt punkt). Ingen uavhengig ekstern referanse: utformingsnotatet avgrenser disse reduksjonene som MODELLED, og Orekits ElevationMask tar en tabell, så sammenligningen i raden 'Asimutavhengig horisontmaske: synlig mengde, asimut og elevasjon, og DOP under masken' leser deres tabeller med 360 punkter som inndata og kontrollerer dem ikke

seg-3f3d657854ce = Horisont-forhåndsinnstillinger (bygate, havneinnseiling, fjord, containerterminal)

seg-b915c06fa3f1 = skyline::PRESETS: fire REPRESENTATIVE geometrier med utformingsnotatets oppgitte dimensjoner og en opphavslinje hver: city-street (en kløft, gate { "0" } deg, { "20" } m mellom { "30" } m høye vegger, antenne { "1.5" } m), harbour-approach (sektorer: åpen mot sjøen over { "180" } deg, kaibygninger { "8" } deg over { "90" } deg, moloen { "3" } deg), fjord (terreng: vegger { "600" } m over antennen i { "1.5" } km avstand på hver side av en nord-sør-gående kanal, krumningsfall anvendt), container-terminal (sektorer: stabler { "12" } deg over den landvendte halvdelen, kranarmer { "35" } deg og { "25" } deg over to smale sektorer); kan overstyres felt for felt

seg-44ae9b6289d9 = Ingen: valgte og oppgitte dimensjoner, ikke en oppmåling av noen gate, havn, fjord eller terminal (gatens sideforhold ligger innenfor 0.5-2-båndet hos Oke ({ "1988" }); fjorden er av størrelsesorden vestnorske fjorder; stablene bruker ISO { "668" }-høyden for high-cube). Testen kontrollerer forhåndsinnstillingene mot deres egne oppgitte dimensjoner, en transkripsjonskontroll, som valideringsregelen ikke teller

seg-2c53381d48ae = Horisontal feilellipse og kofaktor per system fra geometrikovariansen

seg-15fea5c05cbd = geometry::sky_geometry: ENU-og-klokke-kofaktoren (H^T H)^-1 med én mottakerklokke felles eller én per system (kjernen orbit::cofactor_from_los), og den horisontale feilellipsen fra dens øst-nord-blokk (halvakser k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), hovedaksens asimut fra nord)

seg-6012113b4836 = Himmelgeometrifunksjoner: synlighet, DOP, kovarians, feilellipse, Monte Carlo-sky

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> og <c2/>, Python- og WASM-funksjoner med samme navn, MCP <c3/>): fra et sted, et tidspunkt og konstellasjonsforhåndsinnstillinger (eller satellitter som asimut/elevasjon eller ECEF) de synlige og maskerte satellittene under en horisont, GDOP/PDOP/HDOP/VDOP/TDOP, enhetsvarians-kofaktoren (H^T H)^-1 og kovariansen i øst-nord-opp med én mottakerklokke per system eller én felles, den horisontale feilellipsen (halvakser k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientering { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) fra nord), og n seedede minstekvadraters feil under uavhengige gaussiske avstandsfeil med deres empiriske kovarians, RMS og { "95" } % omslutning. Kofaktoren er orbit::cofactor_from_los, den ene kjernen bak orbit::dop og orbit::dop_cov (dop er en reduksjon av dop_cov): ingen andre DOP-implementasjon

seg-aa0da1028636 = DOP-faktorene med én klokke hviler på kjernen som er validert mot gnss_lib_py { "1.0.4" } (raden 'GNSS-geometri / presisjonsfortynning (DOP)'); denne radens egne kontroller er interne: sky_geometry gjengir orbit::dop og dop_cov på samme geometri, ellipsen gjengir en analytisk 2x2-egenverdidekomposisjon, ECEF- og asimut-/elevasjonsinndata stemmer overens, og den seedede skyens RMS og { "95" } % omslutning stemmer overens med geometrien. ENU-kovariansen med én klokke per system og ellipsen er VALIDATED i raden 'Horisontal feilellipse og kofaktor per system fra geometrikovariansen' (numpy, P2); det som forblir MODELLED her er sammensetningen: propageringen fra forhåndsinnstilling til en representativ himmel, Monte Carlo-skyen (kontrollert mot geometrien den trekker fra, en selvkonsistenskontroll) og flatene. Konstellasjonsforhåndsinnstillingene gir en representativ himmel, ikke en datert; den gaussiske feilmodellen og UERE er oppgitte inndata, ikke en målt nøyaktighet eller en integritetsgrense

seg-7f66be0f15c8 = Klokke-holdover uten GNSS

seg-4d8f87668a0f = Vekst i coast-feil i lukket form + holdover-til-terskel; kvanteklokkeklasser

seg-2d260626e3d2 = Flertrinns rekursjon for clock_state-kovarians (kryssjekk i samme kodebase); kjernen for coast-varians og holdover-inversjon som ligger under er eksternt validert mot scipy (se 'Klokkens holdover: coast-varians og terskelinversjon'). Holdover-tallene for rødstøygulvet per klasse forblir MODELLED

seg-29b482d88916 = Målte enhetskort for klokker (tilbakeholdt prediksjon)

seg-8c68c5b25004 = clock_library: et enhetskort (hvit fase, hvit, flicker og random-walk FM pluss en lineær frekvensdrift) tilpasset en tredjedel av en navngitt målt klokkeregistrering etter et logget kondisjoneringstrinn (hull, faseutliggere, fasesprang og utbrudd fjernet; frekvenssprang logget), vektet etter de lag-1-identifiserte frihetsgradene for støytype, og dets predikerte Allan-avvik vurdert på de tilbakeholdte to tredjedelene; lesere for RINEX- og IGS-klokkefiler, BIPM-filer per laboratorium og Circular T seksjon { "1" }; konvertering av et kort til støymodellen for tidsluketiming, den utvidede Kalman-klokkemodellen og støynivåene til spoofing-monitoren

seg-5097a0e6460d = Målte klokkekort for GPS Block IIF med ledd per omløp (tilbakeholdt prediksjon)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: et enhetskort som bærer fasetermene fra én til fire per omløp (periode T/k, T = { "43 082.05" } s), tilpasset sammen med det kvadratiske leddet ved minste kvadrater på en tredjedel av en målt satellittklokkeregistrering, med hvert leds Allan-bidrag i lukket form { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } i det predikerte Allan-avviket

seg-0d72fcc0fbea = Tilstandsestimering for klokke om bord

seg-6db5391f8ebe = Kalman-klokke med 3 tilstander (fase/frekvens/drift), van Loan, Joseph-stabilisert

seg-3f0a9d7c2971 = Feilbudsjett for tidsoverføring

seg-216f46b43860 = Toveis/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→avstand

seg-e7b6aac2ec58 = Sagnac-størrelsen kontrollert mot en autoritativ PUBLISERT VERDI — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), lign. { "1.29" }: en østgående ekvatorial omløpsrunde gir { "207.4" } ns (2ωA_E/c²); kshana gjengir { "207.386" } ns. Uavhengig støttet av RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bærer den samme 2Aω/c²-geometrien. Det sammensatte BIPM-budsjettet for TWSTFT-transponder, common-view og PPP har ingen uavhengig ekstern referanse, så funksjonen forblir modellert

seg-157fadeb5d67 = Analyse av navigasjonssignalets modulasjon og kodesporing

seg-ab633d191396 = BPSK-R/BOC PSD, spektral separasjon κ, Gabor-båndbredde, DLL-jitter, flerveisfeil

seg-589e0053e3e8 = Generering av GPS L1 C/A-spredekode

seg-782d4da75b59 = G1/G2 LFSR C/A-kodegenerator som gjengir de publiserte oktale verifikasjonsvektorene for de første 10 chipene i IS-GPS-200 for PRN { "1" }–{ "9" } (pluss lengde på 1023 chip, balanse med 512 enere, tre-verdi periodisk autokorrelasjon)

seg-473f24d4e06a = IS-GPS-200 tabell 3-Ia 'Code Phase Assignments' — de autoritative, offentlig tilgjengelige (amerikansk statlig) publiserte OKTALE verifikasjonsvektorene for de første 10 chipene (GPS Directorate, navcen.uscg.gov); kshanas egen G1/G2 LFSR regenererer hver vektor for PRN { "1" }–{ "9" } eksakt. Den påfølgende lukkede formen for modulasjon, SSC og DLL forblir modellert (egen rad)

seg-e6c08e1e6ae3 = Ytelse for kvantetreghetssensor

seg-d28e1f6a430f = Akselerometer med kaldatominterferometer fra grunnleggende prinsipper (k_eff·T², QPN)

seg-4b79d03cecf5 = Kvantetreghetssensor: fringe-flertydighet / dynamisk område

seg-deb2850546d5 = Dynamisk område for fringe-flertydighet i Mach–Zehnder: den 2π-periodiske fringe-avlesningen setter en maksimal entydig spesifikk kraft a_max=π/(k_eff·T²), og det entydige området i oppløsningsceller a_max/σ_a=π/σ_Φ er uavhengig av den optiske skalafaktoren — T²-sensitivitetsgevinsten koster entydig område i nøyaktig samme takt (utspørringstiden bytter oppløsning mot område, og antall celler ligger fast ved avlesningens fasestøy)

seg-7603ff7a7693 = Selvkonsistens i interferometerets fringe-modell: halv-fringe-kanten, den 2π-periodiske aliasingstrukturen og kanselleringen av skalafaktoren i forholdet mellom område og oppløsning er algebraiske identiteter i lukket form kontrollert mot motorens egne Mach–Zehnder-fase- og sensitivitetsfunksjoner — interne konsistenskontroller, IKKE et eksternt datasett, så raden forblir InternalConsistency. MODELLED ideell tre-puls fringe-flertydighet; ingen grenser for bølgefrontaberrasjon eller kontrasttap på det entydige området

seg-d04bf321d4a1 = Resiliens for kvantetreghetsbasert dødregning

seg-c4989abb5d40 = Sammensatt posisjonsbudsjett for bias + skalafaktor + VRW + stabilitetsforfall over holdover

seg-bfe4085115c1 = Uavhengig numpy Monte Carlo-SDE-integrasjon av dobbeltintegrert hvit akselerasjonsstøy (validerer den analytiske VRW-variansen med en genuint uavhengig algoritme) + et publisert verdiankere hos Groves { "2013" } for bias- og skalafaktorleddene; CAI-enhetstallene kvantifiserer partnerens maskinvare og forblir MODELLED

seg-bc6e733c39b3 = GNSS/INS-sensorfusjon

seg-16514286bb51 = EKF med 15 feiltilstander, løst koblet (validert på en reell IMU/GNSS-kjøring mot NaveGo); en tett koblet UKF for pseudoavstand/Doppler og et koblet klokke+posisjon-filter (bare konsistens, utenfor det validerte kravet)

seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, kjørt som verktøy under GNU Octave, aldri lenket): dets løst koblede ins_gnss på dets egen reelle IMU/GNSS-kjøring med Ekinox på landkjøretøy, begge løsninger vurdert mot Ekinox-referansebanen. Begge filtrene leser de samme { "20" } Hz float32-inndataene, og Kshanas konfigurasjon er mappet mekanisk fra datasettets publiserte parametere. Kshanas horisontale og vertikale posisjons-RMS og dets posisjonsinnovasjons-RMS ligger innenfor 1.2x av NaveGos (målt { "0.912" }, { "0.940" } og { "0.861" }) og dets gjennomsnittlige normaliserte innovasjon er høyst { "1.5" } (målt { "0.395" }: omtrent 2.5x underkonfident, gitt datasettets oppgitte GNSS-sigmaer); toleransene ble fastsatt før sammenligningen. Omfang: GNSS er til stede ved { "5" } Hz gjennom hele kjøringen, så ingen utfall eller coast testes, og kontrollen fanger grove filterfeil og ikke finjustering (råposisjoner korrigert for lever-arm ville havnet nær den vertikale terskelen); lever-arm-transformasjonen beregnes i testharnessen. Det tett koblede UKF-et og det koblede klokke+posisjon-filteret beholder sine konsistenskontroller mot filterpy { "1.4.5" } (lineære posteriorer til { "2.4e-12" }) og forblir utenfor det validerte kravet

seg-5692c7b936b6 = Resiliens mot jamming uten GNSS

seg-f4ff77caa47b = Geometrisk J/S-linkbudsjett, anti-jam C/N₀, tap av lås per satellitt

seg-ff90679d1de9 = Spoofing-deteksjon

seg-b843f63e77e6 = Klokkestøttet χ², RAIM, AGC og SQM, fusjonert til en sikkerhetskvalitetsmåling per epoke

seg-b10d07921f5e = Beskyttelsesnivå for tidssynkronisering under spoofing

seg-2a829711b997 = Grense i lukket form for verste-tilfelle uoppdaget tidsfeil = monitorgulv + oscillatorens coast-σ over CUSUM-deteksjonslatensen, rapportert som et bånd for rødstøygulvet

seg-0ec37553bbc4 = Misjonsanalyse for cislunart rom

seg-a47465f682ba = CR3BP STM + differensialkorrektor med enkeltskyting; L2 sørlig NRHO

seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; Jord–Måne L2 sørlig halo-familie, metodikk fra Howell/Davis) — eksternt publisert periode T, Jacobi C og initialbetingelser for vinkelrett kryssing; kshanas STM-korrektor med enkeltskyting, sådd med katalogens initialbetingelser og forstyrret, konvergerer tilbake til katalogens medlemmer

seg-f1d49eac89f8 = Alternativ / komplementær PNT

seg-023dda973f66 = Matching mot tyngdekart, terrengreferert (TERCOM/SITAN), magnetisk anomali

seg-da869d48e505 = IGRF-14-koeffisienter; CRLB for matchet filter fra grunnleggende prinsipper. Feltet i referanseprøven for reell tyngde er eksternt kontrollert (raden 'Syntese av tyngdeanomali fra en sfærisk-harmonisk modell'), men navigasjonsresultatet har ingen uavhengig ekstern referanse

seg-db7767ab661d = Syntese av tyngdeanomali fra en sfærisk-harmonisk modell

seg-2db367c4a473 = Tyngdeanomali i sfærisk approksimasjon (Barthelmes STR09/02 lign. { "126" }, ICGEM gravity_anomaly_sa) fra fullt normaliserte koeffisienter mot en nivåellipsoide i lukket form (WGS84/GRS80), med nullgradsleddet, lagt i rutenett for tyngdekartmatcheren

seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), en uavhengig implementasjon: EGM2008 avkortet ved grad { "70" }, gravity_anomaly_sa, WGS84, tidevannsfri, nullgradsledd, h = { "0" }. Tjenestens utdata har ingen eksplisitt lisens, så rutenettene hentes ved testtidspunktet med en festet SHA-256 (tools/fetch_icgem_grid.sh) og bare ti verdier siteres med kildeangivelse

seg-31f51d4998cb = SRTM-leser for digital høydemodell på reelt terreng

seg-08ea4ae0b671 = Selvskrevet SRTM .hgt-parser (16-bit big-endian, nordraden først, void-bevisst) + bilineær sampler som leser en reell DEM-flis i offentlig eie og løser en dokumentert oppmålingsreferanse

seg-aae487789add = NASA/USGS SRTM v3 (1-buesekund) flis N36W117 — høydedata fra amerikanske myndigheter, PUBLIC-DOMAIN, fra den åpne AWS-speilingen elevation-tiles-prod, desimert til 6 buesekunder og innsjekket under tests/fixtures/terrain/ (se NOTICE.md), pluss utsnitt i full oppløsning av N36W117 og N36W119 kryssjekket node for node mot GDALs uavhengige SRTMHGT-leser og oppmålingsreferansene Mount Whitney ({ "4421" } m) og Badwater (−{ "86" } m). Den dokumenterte referansen for Badwater Basin (−{ "86" } m, lavest i Nord-Amerika) forankrer den georefererte avlesningen. Terrengmatching/TERCOM-navigasjonsløsningen som bruker DEM forblir modellert (egen rad for alternativ/komplementær PNT)

seg-791e7285c291 = Reproduserbarhet og programvaresikring

seg-7177355a482c = Deterministisk, scenariohashet, SBOM + gylne porter på tvers av plattformer

seg-6cf9d570cc51 = SBOM-ens overensstemmelse med det offisielle CycloneDX { "1.5" } JSON Schema (+ gyldige SPDX-identifikatorer) — en ekstern publisert standard, null valideringsfeil over hele avhengighetsgrafen; delen om determinisme i FoM og byte-reproduserbarhet forblir en festet selvkonsistenskontroll, så raden forblir MODELLED

seg-89b2114542bb = Evaluering av AI/ML-deteksjon av RF-forstyrrelser ({ "13494" })

seg-241f2eeaef12 = Merket syntetisk korpus av forstyrrelser + detektoruavhengig harness for ROC/AUC/forvekslingsmatrise/Pfa-Pmd; lekkasjevern, stratifisert deling, rapport om optimisme ved fordelingsskifte (innenfor mot utenfor regime). Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/impairment-eval.toml)

seg-72a3c97ef04b = Grenser for AUC i lukket form (Mann–Whitney) + en perfekt detektor med uavhengig referanse; korpuset er SYNTHETIC (parameterforankret, ikke felt/IQ)

seg-c38ebee794b3 = Studie av optimismegapet i AI/ML-deteksjon av RF-forstyrrelser og en gapprediktor bare fra fordelingen

seg-642087659fda = Kontrollert syntetisk studie av AUC-optimismegapet fra innenfor til utenfor fordelingen på tvers av publiserte metoder og lærte detektorer (logistisk regresjon / MLP med ett skjult lag): trender i skaleringslover per klasse (Spearman ρ + stigning på { "1" }−alvorlighet) og en ridge-prediktor bare fra fordelingen som estimerer gapet fra diagnostikk innenfor fordelingen alene, vurdert med utelatelse av én detektor og utelatelse av én klasse. Kan gjengis via <c1/>

seg-c46973920f5b = Håndutledede statistikker mot lukkede former (binormal AUC Φ(d'/√{ "2" }), DeLong-varians, Spearman med bundne rangeringer, eksakt OLS-gjenvinning) + leave-one-out-kryssvalidering mot grunnlinjen som predikerer middelverdien. Korpuset er SYNTHETIC (parameterforankret, aldri felt/IQ), og optimismegapet er et alvorlighetsskifte fra syntetisk til syntetisk, IKKE et resultat fra simulering til felt

seg-fd6424213d1f = Avveining mellom kvante og klassisk PNT og resiliens uten GNSS ({ "13503" })

seg-21b2b54200a8 = Inntak av målt ADEV (NNLS), avveiingstabell (holdover for tidssynkronisering og treghet + gevinst), resiliens-mot-tid-omhylling; forbeholdet om gulvet følger med artefakten. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/quantum-trade.toml)

seg-37d11937c966 = Kjernen for tilpasning av målt ADEV→PSD (NNLS) stemmer overens med scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — en uavhengig ekstern kjerne; men tallene i avveiingen kvantifiserer (aldri validerer) en partnerklokke/CAI, så selve avveiingen forblir MODELLED, uten valideringsglorie

seg-1fa865bfddd1 = Romværmiljø og aktivitetsdrevet termosfærisk tetthet

seg-47308f611c7e = Sol- og geomagnetiske indekser (definisjonstabell Kp↔ap), eksosfærisk temperatur etter Jacchia-1971 og termosfærisk tetthet etter Jacchia { "1971" } (SAO Special Report { "332" }: statiske diffusjonsprofiler som gjengir dens tabell { "7" }, med døgn-, geomagnetiske, halvårs-, sesong-breddegrads- og heliumvariasjoner) mot den statiske atmosfæren USSA76. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/space-weather.toml)

seg-29bedb28c34f = CCSDS OEM-interoperabilitet (import av GMAT/Orekit/STK-efemerider)

seg-edb58ffbbb5b = CCSDS { "502.0" } OEM-importør (parse_oem), tolerant overfor COMMENT-linjer / ekstra metadata-nøkkelord / kovariansblokker og den eksakte inversen av skriveren; rundtur + inntak av ekstern fil med en kontroll av hastighetskonsistens. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/oem-interop.toml)

seg-bc507f96c4df = Uavhengig CCSDS-502-parser fra tredjepart <c1/> { "0.4.5" } (MIT, https://pypi.org/project/oem/) — en separat kodebase som dekoder kshanas utsendte EME2000/UTC OEM byte for byte likt ({ "24" } tilstander over { "2" } fikstur-filer, pos/vel Δ = { "0" }) og hvis strenge leser bekrefter metadata-tokenene; kshanas parser stemmer likeledes overens med den på en medfølgende ekstern OEM. To ærlige interoperabilitetsfunn (oem-biblioteket avviser kshanas konvensjon med flere segmenter per satellitt og dets kovarianslinjer med flere oppføringer) er dokumentert i testen — så dette validerer den formatriktige utvekslingen av ett enkelt objekt, ikke full CCSDS-502-overensstemmelse for hver kshana-variant

seg-c76b8c395ef0 = Oppskytingsvindu og stigningsgeometri (misjonsanalyse)

seg-6066c634faba = Oppskytingsasimut(er) i tolegemeproblemet (sin Az = cos i / cos lat), minste nåbare inklinasjon, sirkulær hastighet, østgående bonus fra jordrotasjonen, dogleg-planendrings-Δv og daglige muligheter, og, gitt en epoke og IERS finals2000A-rader, stedets hastighet om den sanne polen (launch::site_rotation_speed_at). Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistisk inngangskorridor ved gjeninntreden (Allen–Eggers)

seg-c3f3422f96e4 = Maksimal retardasjon (uavhengig av ballistisk koeffisient), hastighet og høyde ved maksimal g, og hastighet ved maksimal oppvarming for en ballistisk innflyvning i en eksponentiell atmosfære. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/reentry.toml)

seg-8c10b50407d3 = Fotavtrykk og dekningsgeometri for EO-nyttelast

seg-45c1e799c87c = SMAD romtrekantgeometri: jordens vinkelradius, svathbredde, GSD i nadir, maksimal tilgang utenfor nadir og sirkulær periode, pluss den førsteordens J2-nodeperioden (eo_payload::j2_nodal_period) og ekvatorial bakkesporavstand R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) med et flagg for sammenhengende dekning, for en banehøyde, inklinasjon og sensor-FOV/IFOV. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/eo-coverage.toml); dens standardinklinasjon er den solsynkrone fra eo_payload::sun_synchronous_inclination, en bekvemmelighetsstandard som ikke er en del av det validerte kravet

seg-940692c550f3 = CCSDS Space Packet ({ "133.0" }) TM/TC-innramming

seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet: koding/dekoding av primærhode (versjon/type/sek-hode/APID/sekvensflagg/teller/datalengde) + et innrammingsscenario. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/space-packet.toml)

seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — en uavhengig implementasjon fra tredjepart av CCSDS 133.0-B-2; kshanas encode_packet/decode_packet stemte byte for byte overens (primærhodet på 6 oktetter for { "33" } tilfeller + hele den kodede pakken for { "12" })

seg-5510c82f671a = CCSDS Space Packet: sekundærhode, pakkefeilkontroll og segmentering

seg-7503bf761df9 = Utvidelser av CCSDS 133.0-B-2 Space Packet ved siden av primærhodet: et sekundærhode med en tidskode etter CCSDS 301.0-B (CUC eller CDS, eksplisitt eller implisitt P-felt) og tilleggsdata, feltet for pakkefeilkontroll med CRC-16, segmentering av en stor brukerdataenhet og reassemblering av den, strømdekoding med kontroller av sekvenshull og rekkefølge, og PUS-TM-pakker. Utdataene for primærhodet er byte for byte identiske med tidligere

seg-af843a3a830a = <s1>space_packet (TimeCode, SecondaryHeader, pakkefeilkontroll, segmentering og reassemblering, strømdekoding)</s1>

seg-7c61da52b8f8 = SPICE SPK-eksport (typene { "9" } og { "13" })

seg-582ce23522f6 = Skriver og leser for NAIF SPICE SPK-kernels av typene { "9" } (Lagrange, ujevne tidssteg) og { "13" } (Hermite, ujevne tidssteg), med DAF-oppsett, segmentbeskrivere og epokekataloger, og eksport av en CCSDS OEM til en SPK-kernel (UTC- eller TDB-epoker til efemeridetid)

seg-d699104fc2af = SPICE SPK-typene { "3" } og { "21" } (Chebyshev, utvidede differanselinjer)

seg-7d3e8b5b40af = Skriver og leser for NAIF SPICE SPK-segmenter av type { "3" } (Chebyshev-polynomer for posisjon og hastighet over faste intervaller, grad { "0" } til { "27" }) og type { "21" } (utvidede modifiserte differansematriser, differanselinjene i JPL-integratorer, MAXDIM { "15" } til { "25" }), fra gitte poster, i filer som også har segmenter av type { "9" } og { "13" }; valg av post og evaluering i rekkefølgen til SPICE-leserne. Kshana tilpasser ikke Chebyshev-koeffisienter og produserer ikke differanselinjer

seg-39517faae95c = CCSDS Attitude Data Messages (AEM, APM)

seg-f88f6ea002c8 = Skriver og leser for CCSDS 504.0-B-2 Attitude Data Messages i KVN og NDM/XML: AEM versjon { "2.0" } (og { "1.0" } i KVN, med dens ATTITUDE_DIR, QUATERNION_TYPE og numeriske rotasjonssekvenser) med attitydetypene kvaternion, Euler-vinkel og spinn og deres varianter for derivert, vinkelhastighet og nutasjon, flere segmenter; APM versjon { "2.0" } med blokkene for kvaternion, Euler, vinkelhastighet, spinn, treghet og manøver; A-til-B-kvaternionen for en post (504.0-B-2 vedlegg F)

seg-5f26f879037e = CCSDS Orbit Data Messages (OPM, OMM, OCM)

seg-eaddfd311fea = Skriver og leser for CCSDS 502.0-B-3 Orbit Data Messages i KVN og NDM/XML: OPM { "3.0" } og { "2.0" } (tilstandsvektor, osculerende keplerelementer, romfartøyparametere, kovarians, manøvrer, brukerdefinerte parametere), OMM { "3.0" } og { "2.0" } (middelelementer etter middelbevegelse eller store halvakse, TLE-relaterte parametere med BSTAR eller BTERM og AGOM, kovarians), og OCM { "3.0" } med bane (CARTP, CARTPV, CARTPVA; absolutte eller relative epoker), fysiske egenskaper, kovarians (CARTP, CARTPV i LTM-rekkefølge), manøver og brukerdefinerte blokker; en OMM med full presisjon fra et SGP4-elementsett ved siden av den uendrede OmmFile::to_omm_kvn

seg-1e5ea1d9918d = Feilbudsjett for 3-DOF-attityde og peiling (AOCS)

seg-21f2f8efcf19 = Verste-tilfelle forstyrrelsesmoment fra tyngdegradienten ((3/2)(μ/R³)ΔI) som toppen over attityde (det validerte kravet), pluss et RSS-budsjett for peilefeil over navngitte 1σ-bidrag med det dominerende leddet (en kvadratsum av tall oppgitt av den som kaller, utenfor det validerte kravet). Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/attitude-budget.toml)

seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), en uavhengig C++-implementasjon av tyngdegradientmomentet med full tensor: Kshanas topp (3/2)(μ/R³)ΔI er lik Basilisks moment ved attityden { "45" } deg innenfor { "1e-12" } relativt (verst { "2.1e-15" }) over { "5" } høyder og { "8" } treghetstensorer, og avgrenser Basilisks moment over { "2000" } tilfeldige attityder per tilfelle; toleransen ble fastsatt før sammenligningen. Validert krav: toppen av tyngdegradientmomentet. RSS-peilebudsjettet er en kvadratsum av tall oppgitt av den som kaller, uten ekstern fasit, og forblir utenfor det; den håndkodede maksimeringen med full tensor i Hipparchus beholdes som støttende selvkonsistens. Ingen simulering av reguleringssløyfe/6-DoF/fleksible moder

seg-1461aa14a7ff = Prediksjon av passeringer over bakkestasjon (bakkesegment)

seg-e1cf1ec4f005 = Synlighetspassasjer i tidsdomenet (AOS/TCA/LOS, maksimal elevasjon, varighet) for en propagator i motoren over en stasjon over en elevasjonsmaske, med interpolerte krysninger ved stigning og nedgang og total tilgang: passes::predict_passes, den geometriske planleggeren (ingen refraksjon eller lystid). Scenariotypen <c1/> kjører den tilsynelatende prediktoren i raden 'Tilsynelatende passeringsprediksjon for bakkestasjon med refraksjon og lystid'

seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — et uavhengig bibliotek for flygedynamikk: ElevationDetector (Brent-rotfinner) + EventsLogger over en ITRF-efemeride, stasjon som en WGS-84 TopocentricFrame. AOS/LOS/maksimal elevasjon/antall passeringer/total tilgang stemte overens for identisk bane + stasjon + maske + vindu (innsjekket fikstur; driver xval/orekit-passes)

seg-1dd8b2655b18 = Tilsynelatende passeringsprediksjon for bakkestasjon med refraksjon og lystid

seg-46f93d3c24d2 = Synlighetspassasjer (AOS, TCA, LOS, maksimal tilsynelatende elevasjon, varighet) for et SGP4-elementsett over en WGS-84-stasjon på den validerte banestien for jordbaner (IAU 2006/2000A, valgfrie jordorienteringsparametere), med troposfærisk refraksjon etter ITU-R P.834-9 (likningene { "9" } til { "14" }, anbefalingens trykte koeffisienter) og lystiden for nedlinken, hver for seg på eller av; krysninger løst ved halvering til { "1e-7" } s og kulminasjonen ved gyllent snitt-søk. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/passes.toml), begge korreksjonene på som standard

seg-7b4a8e25c3c9 = Adaptiv koding og modulasjon i DVB-S2 langs en LEO-nedlinkpassasje

seg-3912fb8ccb15 = Es/N0 i nedlinken langs hver passasje for én satellitt over én stasjon (EIRP, frirommstap, atmosfærisk tap etter cosecant-loven, andre tap, G/T, Boltzmanns konstant, symbolrate), den mest effektive DVB-S2-MODCOD som klarer terskelen for kvasifeilfri drift i ETSI EN { "302" } 307-1 V1.4.1 tabell { "13" } pluss en implementasjonsmargin i hvert steg, passasjens ACM-datavolum, og grunnlinjen med konstant koding som lukker ved masken og lengste avstand. Kan kjøres som scenariotypen <c1/>. Illustrative inndata; MODELLED.

seg-a7f26e3a6030 = Intern konsistens: spektraleffektiviteten beregnet i lukket form fra K_bch i tabell 5a og rammelengdene stemmer overens med effektivitetene tabell { "13" } oppgir (en transkripsjonskontroll av terskeltabellen); linkbudsjettets deler stemmer overens med sine lukkede former; utvalget er monotont i Es/N0 og respekterer marginen; ACM flytter minst volumet med konstant koding. Passasjegeometrien kommer fra den separat VALIDATED tilsynelatende passeringsprediktoren. HVA SOM IKKE ER: intet eksternt verktøy eller målt link er sammenlignet; tersklene er standardens ideelle AWGN-verdier, ikke en modems; regnfading, peiletap langs passasjen og piloter er ikke modellert.

seg-19603a7e0fe8 = Kontaktplanlegging for flere satellitter og flere stasjoner med konfliktløsning

seg-40edeae6e48b = Kandidatkontakter fra hver passasje satellitt-stasjon med dens ACM-datavolum; konflikter der én antenne ville betjent to satellitter innenfor sin omstillingstid eller én satellitt ville nedlinket til to stasjoner samtidig; et prioritetsvektet leveringsmål begrenset oppad til hver satellitts etterslep; en lat marginalverdi-grådig plan, en førstemann-til-mølla-grunnlinje og en eksakt branch and bound på opptil { "26" } kandidater, med optimalitetsgapet til den grådige planen rapportert. Kan kjøres som scenariotypen <c1/>. Illustrative inndata; MODELLED.

seg-bc520db98f9a = Intern konsistens: den eksakte branch and bound stemmer overens med uttømmende opptelling på små tilfeldige mengder, hver plan kontrolleres som gjennomførbar mot konfliktreglene, og den grådige planen slår aldri det eksakte optimum. HVA SOM IKKE ER: ingen ekstern planlegger eller operativ plan er sammenlignet; kontakter tas hele (ingen deling), etterslepet er fast ved vindusstart, svingetid utover den faste omstillingstiden og lagring om bord er ikke modellert.

seg-ddf2bc2f13a9 = Enveis linkbudsjett (kommunikasjon / linkdesign)

seg-83331f513dba = Frirommstap, C/N₀, Eb/N₀, margin og lukking over linkligningen i CCSDS { "401" } / DSN 810-005 for EIRP/G·T/avstand/rate/bånd mot et påkrevd Eb/N₀. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/link-budget.toml)

seg-195bf7e31f24 = Publisert designkontrolltabell for telekommunikasjon i dypt rom som festede numeriske vektorer: DESCANSO / J. H. Yuen (red.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tabell 1-1 (Galileo X-bånd) — kshana setter sammen tabellens linjeposter og gjengir dens publiserte ende-til-ende L_fs { "290.54" } dB og Pr/N0 { "54.6" } dB-Hz; frirommstapet er også kontrollert mot ITU-R P.525

seg-3742d2aea62a = Nøktern ramme for kostnad per dekning / ROI

seg-4228311689f8 = Kostnad per prosent dekning + dekning per euro som ROI over dimensjoneringsmotoren for konstellasjoner; kostnad per satellitt er et lav/nominelt/høyt intervall oppgitt av den som kaller (ingen oppdiktede priser)

seg-d542ac64c31c = Kostnadsaritmetikk i lukket form mot håndutledede verdier; en økonomisk RAMME rundt et modellert dekningstall, ikke et tilbud eller en validert kostnadsmodell

seg-8ba6ee9acc8a = Integritetsvirkning av uoppdaget miss (kontekstbevisst HPL/VPL mot alarmgrense)

seg-f5985399d0d5 = Avbilder en uoppdaget spoof-/jam-bias til effektiv feil → Stanford-område (tilgjengelig/utilgjengelig/MI/HMI) mot kontekstspesifikke HAL/VAL (åpen himmel mot by)

seg-124d0ffe959e = Setter sammen den eksternt validerte Stanford-klassifiseringen i RAIM (raim::classify_stanford); selve avbildningen fra uoppdaget deteksjon til AL er modellert, ikke en sertifisert integritetsallokering

seg-37d43b5b918a = Parameterark for CAI med siterte feilmodeller ({ "13503" })

seg-0b6a901f5ad2 = Ytelse for kaldatominterferometer i intervall (beste/nominell/konservativ) — biasustabilitet, hastighets-/vinkel-random-walk, skalafaktorstabilitet, utspørringsbegrenset samplingsrate, dynamisk område for fringe-flertydighet — hver med sporbar kilde; mater QuantumNavBudget uten å modellere maskinvare

seg-4b66096727b8 = Intern konsistens: det siterte VRW-intervallet kryssjekket mot fysikken i CaiAccelerometer::accel_asd + rått dynamisk område beregnet fra grensen for fringe-flertydighet; tallene er MODELLED intervaller fra litteraturstudie (needs_source_confirmation), ingen enhet validert, ingen valideringsglorie

seg-c93f2d3a3167 = Benchmark for overensstemmelse for tidsintegritet — epokeklassifiserer for Stanford-integritetsdiagram

seg-712d5c35a6a6 = TIB-epokeklassifisering i Stanford-integritetsdiagram (nominell / utilgjengelig / MI / HMI)

seg-93b913e60063 = Uavhengig numpy-reimplementasjon av regelen med fire områder (scripts/gen_tib_scorer_reference.py) på det identiske utvalget; metoden Cited fra Stanford–ESA-integritetsdiagrammet (Tossaint et al., ION GNSS { "2007" }) og RTCA DO-229 WAAS MOPS. IKKE en nøyaktighetsreferanse av typen ExternalDataset — benchmarken er immun mot uærlighet.

seg-573aa0193cb3 = Benchmark for overensstemmelse for tidsintegritet — scorer for integritetsdekning

seg-4d86f3c2d8f5 = TIB-scoring av integritetsdekning (rater for HMI/MI/tilgjengelighet + dom om overbound-dekning)

seg-645eb084ae8e = Uavhengig numpy-opptelling av områder i tests/fixtures/tib/reference.json; bare en kryssjekk av scorer-maskineriet, ingen nøyaktighetspåstand.

seg-372dd0fdb025 = Benchmark for overensstemmelse for tidsintegritet — feilkatalog (parametriske generatorer)

seg-2604e7cf27d2 = TIB-feilmeny (domenedivergens, klokkesmell, holdover-coast, statisk/inkrementell/symmetrisk/asymmetrisk forsinkelse, replay innenfor ferskhet, banevalgsselektiv, k-av-N-kvorum)

seg-b907aecaccd0 = Representative parametriske feilgeneratorer (modellert); den udetekterbare mengden (symmetrisk forsinkelse, replay innenfor ferskhet) er Cited fra Mizrahi RFC { "7384" } og Narula & Humphreys (IEEE JSTSP { "2018" }). Ingen uavhengig ekstern referanse — en feilkatalog gjør ingen målt påstand.

seg-90c0eb1e7c14 = Benchmark for overensstemmelse for tidsintegritet — dom om absorpsjon av udetekterbare feil

seg-f713acf042ff = TIB-dom om absorpsjon av udetekterbare feil (symmetrisk/replay må absorberes av PL, aldri rapporteres som detektert)

seg-6840c2467c63 = Egenskapskontroll av at enumen Verdict strukturelt ikke kan rapportere en udetekterbar feil som detektert (Mizrahi RFC { "7384" }); absorbert ⟺ PL ≥ offset. Ingen nøyaktighetsreferanse.

seg-3652a591eefc = Ingeniørarbeid for satellittbuss (AOCS/termisk/strukturer/fremdrift/kraft)

seg-50a9c1c7dff0 = Ikke levert — Kshana er en simulator for navigasjonsytelse, ikke en bussleverandør

seg-a349aa76b0ed = PARTNER

seg-b28dd62dca1c = Design av RF-nyttelast og antennemaskinvare for navigasjon

seg-76c983a23e7b = Ikke levert — Kshana modellerer signalytelse, ikke nyttelast- eller antennemaskinvare

seg-7bba3b35214c = Design og modning av kvantenyttelastmaskinvare

seg-15fcc200b859 = Ikke levert — bare ytelsesmodeller; maskinvare for kaldatomer og klokker er en partners

seg-d69dd4c5167b = Produktsikring for flymaskinvare (stråling/EEE/MAIT)

seg-b1540f78ffd4 = Ikke levert — Kshana omfatter bare programvaresikring; produktsikring for flyvning er en partners

seg-1f200f8efc71 = Månens koordinattid

seg-2e6961dbffe9 = Relativistisk klokkerate for Jord–Måne (LTC/TCL) + kjeding av TT/TAI/UTC + ensemble

seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; grunnlag for IAU/IAG LunaNet LTC): egenpotensialet på månens overflate L_m = { "3.13881e-11" } og sekulært totalt { "56.02" } µs/dag stemte overens som publiserte numeriske verdier; geosentrisk månehastighet kryssjekket mot JPL DE440 (de440s.bsp via SPICE)

seg-8adbbd2cdb74 = Selvbeskrivelse i hybridrapporten for optisk/RF

seg-2a5e48b558e1 = Rapporten hybrid-optical-rf oppgir linkkonfigurasjonen den faktisk ble kjørt med (bærebølgelengde, sende- og mottaksåpning, avstand, pulsbredde, integrasjonstid, virkningsgrader og tap, standardverdier løst opp) og bærer en enhetsblokk som gir enhet og opphavsklasse for hver størrelse en artikkel sannsynligvis siterer, inkludert sporene av overleveringskovariansen i kvadratmeter

seg-23f0c10237f4 = Ingen uavhengig ekstern referanse, og ingen er mulig: dette er selvbeskrivelse, ikke en måling. Den er registrert fordi fraværet var en mangel -- P5 måtte sitere bærebølgelengden og sendeåpningen fra kildens standardverdier, og slutte at en bar <c1/> var i kvadratmeter ut fra en intern konsistenskontroll. Slutningen var riktig, og nettopp derfor betydde det noe: ingenting ville ha fanget at den var feil

seg-0691f3dee8cb = Tilgjengelighet for hybrid optisk/RF-link på RF-siden

seg-72ccb655caf0 = Rapporten hybrid-optical-rf oppgir en tilgjengelighet for RF-linken, sammensatt av størrelser motoren allerede beregner og ikke av en importert klimatologi, og oppgir sammensetningen som en navngitt regel: A_rf = I_closure * I_track, der I_closure er lukkingsdommen for det enveis CCSDS-401 / DSN-810-005-linkbudsjettet (linkbudget::link_budget, Eb/N0-margin >= { "0" }) ved scenarioets egen avstand og I_track er dommen fra sporingssløyfen (jamming::lock_status) på C/N0 som DET SAMME budsjettet ga. Hver faktor bærer opphavsklassen til sin inndata videre til utdataene, og faktorene som bevisst IKKE er med i produktet -- geometrisk synlighet, avskjæring ved interferens og en klimatologi for RF-utfall -- er navngitt med begrunnelse i stedet for stilltiende å settes til { "1" }. Det løste RF-leddet gjentas som en egen blokk rf_link_configuration, og de kontinuerlige tallene ved siden av indikatoren (linkmargin, C/N0-margin, lukkings- og sporingsavstandene i lukket form og avstandsutnyttelsen) er avstandsinversjonene av det samme budsjettet. Rapporten oppgir fullt ut, på blokken og i enhetsoppføringen en leser havner på, at dette tallet er BEGRENSET AV MARGIN/GEOMETRI og DETERMINISTISK, mens optisk tilgjengelighet er BEGRENSET AV VÆR/KLIMATOLOGI og sannsynlighetsbasert, slik at de to aldri kan siteres som et sammenlignbart par prosenttall

seg-319705ea0166 = Ingen uavhengig ekstern referanse, og ExternalDataset er avslått. De to inndataene er en Eb/N0-margin og en krysning av C/N0-terskel, begge funksjoner av en MODELLED EIRP, kvalitetsmåling og samlet tapsfordeling; det finnes ingen målt tilgjengelighetsregistrering for en hybrid optisk/RF-tjeneste Jord–Måne å kontrollere det sammensatte tallet mot. Kontrollene som finnes er interne og oppgis som det: sammensetningen beregnes på nytt fra rapportens egne publiserte marginer og ikke fra emitterens interne størrelser, og lukkingsavstanden verifiseres ved å kjøre linkligningen på nytt VED den og kreve at marginen forsvinner — en inversjonsrundtur, ikke en uavhengig implementasjon. Den ærlige grensen for tallet er registrert på selve rapporten: det er en deterministisk 0/1-indikator, ikke en sannsynlighet, fordi ingenting i denne motoren måler en fordeling av RF-linkutfall ved dette båndet og denne geometrien. Den manglende inndataen er navngitt i rf_availability.factors_not_included og ikke oppdiktet, og å skaffe den er det en sannsynlighetsbasert RF-tilgjengelighet ville kreve

seg-22c5df9b6c7c = Sammenligning av optisk og RF-avstandsmåling på like vilkår

seg-70eb396f40af = Rapporten hybrid-optical-rf gir forholdet mellom optisk og RF-avstandsmåling med den ENE konfigurasjonen begge ledd ble evaluert ved i samme objekt: samme enveis bane, samme avstand og samme akkumuleringstid. Det optiske leddet er motorens fotonbegrensede ToA-CRLB på enveis fotontall; RF-leddet er motorens termiske kodesporingsjitter for DLL early-late ved C/N0 som motorens eget linkbudsjett gir for samme enveis avstand. Sløyfestøybåndbredden er utledet, ikke valgt: B_L = 1/({ "2" }*integration_s) legger RF-leddet nøyaktig på den optiske akkumuleringstiden, og hvis en som kaller overstyrer den slik at de to midlingstidene ikke stemmer, er forholdet REFUSED -- null, med avviket og begge tidene navngitt -- i stedet for å siteres ved to driftspunkter. Ingen forhold dannes mot scenarioets VALGTE parametriske rf_position_sigma_m, og avvisningen sier hvorfor: denne inndataen bærer ingen konfigurasjon i det hele tatt. Det utgitte toveis optiske hovedtallet og den eksakte faktoren som forbinder det med enveis sammenligningsleddet gis ved siden av forholdet, slik at rapporten ikke kan leses som om den bærer to uenige optiske sigmaer

seg-acbb3ac98ee3 = Ingen uavhengig ekstern referanse for FORHOLDET, og ExternalDataset er bevisst avslått. Den underliggende RF-kjeden har en -- tests/validate_p5_rf_ranging_precision.rs kontrollerer linkbudget::link_budget og navsignal::dll_code_jitter_chips mot en uavhengig Python/NumPy-fikstur og mot den hardkodede gjennomregnede verdien hos Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m ved { "45" } dB-Hz) -- og den optiske CRLB har sin egen rad i lukket form. Å hevde noen av disse ankrene for denne raden ville vært lånt validering, som matriseinvariantene finnes for å hindre: størrelsen her er et FORHOLD ved en konfigurasjon med en MODELLED EIRP, kvalitetsmåling, sendeeffekt og åpning, og ingen målt sammenligning av optisk og RF-avstandsmåling ved et felles driftspunkt finnes å kontrollere det mot. Det som kontrolleres internt er det forholdet faktisk kan ta feil av: at de to leddene ligger ved ett driftspunkt. Det måles ved å skalere den felles akkumuleringstiden og kreve at begge ledd beveger seg etter den samme kvadratrotloven og at forholdet blir stående, og det håndheves ved å avvise forholdet helt når midlingstidene ikke stemmer. Begge ledd er grenser for termisk støy/skuddstøy og begge utelater mediaforsinkelse, klokkefeil og flertydighet, så utelatelsen er identisk på hver side; rapporten sier det i stedet for å la det utledes

seg-3f26f598e013 = Selvbeskrivelse i linkbudsjettrapporten

seg-b88bf41d6d4c = Linkbudsjettrapporten oppgir hver absolutte konstant dens egen margin ble beregnet fra -- bærefrekvensen frirommstapet brukte, EIRP, kvalitetsmålingen, det samlede tapet og Boltzmann-leddet -- pluss den påkrevde G/T der marginen er null, linkkonstanten (EIRP - tap - påkrevd Eb/N0) som er den eneste kombinasjonen en publisert tabell over rate og forsterkning noen gang kan fastsette, og, når den som kaller oppgir en systemstøytemperatur, mottaksantenneforsterkningen den kvalitetsmålingen innebærer

seg-52f98f50522f = Ingen uavhengig ekstern referanse: dette er selvbeskrivelse over en likning som allerede er validert mot en publisert designkontrolltabell (se raden for enveis linkbudsjett). Den er registrert fordi fraværet var en målt mangel -- å gjengi den utgitte d1_rate_gain_beamwidth.csv krevde å løse baklengs én effektiv konstant til { "0.0034" } dB fra alle tretti rader, og motoren navngir nå både denne kombinasjonen og beviser ved test at ingen utgitt tabell noen gang kunne ha skilt dens tre komponenter

seg-a7b192e27cb5 = Tabell over krysningspunkt for månetid per klokkeklasse

seg-cab605dc6ea2 = Én kjøring av månetidsbudsjettet gir en rad for krysningspunkt mellom klokke og ramme per klokkeklasse mot ett felles rammeledd, slik at klokken er den eneste variabelen i sammenligningen; hver rad bærer krysningspunktet nådd på to måter -- funnet ved halvering fra den generelle potenslovkurven for tidsfeil og invertert algebraisk fra radens dominerende støytype -- med den relative forskjellen mellom dem

seg-ccec15f0b125 = To ulike beregninger i kodebasen av samme størrelse, ikke én gjentatt: halvering på IEEE-1139-potenslovkurven vet ingenting om støytype, mens den lukkede formen inverterer den dominerende typen algebraisk, så en feilklassifisert støytype eller et dårlig intervall viser seg som en ikke ubetydelig relativ forskjell. De fire verdiene gjengir også artikkelens publiserte tabell til halvparten av dens siste trykte siffer -- men den tabellen ble selv rekonstruert fra den samme lukkede formen, så dette er en reproduserbarhetskontroll og ikke en uavhengig ekstern referanse, og rammeleddet den måles mot er en modellert fordeling

seg-ff32b78acb8c = Felles UT1- og polbevegelsesfeil over en felles radmengde

seg-561e588153af = Én tabell rapporterer UT1-prediksjonsfeilen, polfeilen i polbevegelsen og deres kvadraturkombinasjon ved Månen over en IDENTISK epokemengde per horisont, og gir ut epokene hver komponent ble målt ved. Separat navngir scenarioet hvilken EOP-inndata som gjelder og dekomponerer sin radtelling, og gir alltid ut tabellen for predikert mot endelig horisont med en eksplisitt forklaring på hvorfor den er tom når den er det

seg-3692f1fc89e6 = Standard jordorienteringsinndata offline er et reelt IERS-produkt

seg-f9a9d385fd26 = Standardinndataene for kjøring i <c1/> er bibliotekets egen innebygde kopi av et ordrett utdrag av IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } påfølgende daglige rader, MJD 61224-61397, skåret fra finals2000A.all for 2026-09-30) som bærer alle tre radvintagene formatet definerer, klassifisert etter IERS I/P-flaggene (eop::row_vintage): { "30" } Bulletin B-endelige, { "54" } rapid-målte rader (flagg I uten Bulletin B-blokk) og { "90" } Bulletin A-prediksjoner (flagg P). En kjøring uten filargument og uten nettverk gir ut en utfylt tabell per horisont, tellingen rader = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) og predicted_rows.n = { "90" } over MJD 61308-61397; skjæringspunktet slik utgitt for sammenligningene av predikert mot endelig er den siste målte raden. Det tidligere utdraget med 32 rader (tools/finals2000A_2026.txt, hver rad med flagg I) og utdraget med fem rader med bare endelige verdier leveres og brukes fortsatt: på dem er predicted_rows.n { "0" }, en egenskap ved inndatafilen og ikke et parserresultat

seg-18c72a7565d6 = Fangstfotavtrykk mot høyde og strålebredde

seg-9c30a0ab5233 = Tosidig sveip av det mønstervektede, høydebegrensede overflatefangstfotavtrykket over senderhøyde og parabolantennens diameter, gitt ut som én rad per driftspunkt med halveffektbredden hver diameter innebærer, og limbfangst rapportert som en TERSKEL -- per rad limb-J/S, dens margin og senderkraften som ville lukket den; per rutenett de lokaliserte krysningene, eller en eksplisitt oppgave om at limben ikke nås noe sted i rutenettet, med underskuddet

seg-4d866b62d4f7 = Mengdeinklusjon: forholdet mellom jammer og signal inngår som en jevn desibelforskyvning, så den fangede mengden ved høyere sendeeffekt inneholder mengden ved lavere effekt og andelen kan bare øke -- en egenskap Airy-mønsteret IKKE gir i strålebredde eller høyde, der det fangede området brytes opp i ringer og andelen genuint er ikke-monoton. Ingen publisert tabell gir den fangede skiveandelen for en månebane-sender mot høyde og strålebredde, så det finnes ingenting eksternt å kontrollere disse cellene mot; mønsteret under er separat validert mot publiserte Bessel-verdier og har sin egen rad

seg-fc0a64b9a280 = Reproduserbarhet for månens tidsfeilbudsjett

seg-5d5970506b9c = Scenarioet lunar-time-budget publiserer sine matriseverdige utdata som en langformtabell (rutenettindeks, midlingstid, ledd) ved siden av rapporten, så de syv x(tau)-kurvene per ledd og rot-sum-kvadrat-totalen er motorutdata og ikke noe en leser bygger opp igjen fra metodeavsnittet

seg-62df6258bc62 = Bare selvkonsistens: det publiserte totalet kontrolleres mot rot-sum-kvadratet av leddene i samme fil, og den utgitte kurven gjengir den utgitte p3_time_budget_curve.csv over alle { "57" } punkter. Begge kontrollene deler motorens egne leddefinisjoner, så ingen av dem er uavhengig. Klokkeleddet hviler på publiserte klokkespesifikasjoner, men STØRRELSENE på gulvene for link, ramme, relativitet og efemeride er dokumenterte budsjettallokeringer uten uavhengig ekstern referanse

seg-675887733454 = Laboratorium for månestasjonstid: holdover for miniRAFS mot LTC

seg-7dfedc40da6a = Den valgfrie blokken [time_lab] i scenarioet lunar-time-budget modellerer en klokke i en månereferansestasjon (som standard klassen miniRAFS, eller en hvilken som helst navngitt klasse, eller et enhetskort tilpasset oppgitte stabilitetspunkter) styrt til Coordinated Lunar Time og deretter frittløpende eller styrt på nytt hvert N sekund: tidsfeilkurven x(t) som rot-sum-kvadratet av klokkens potenslovledd, en konstant styringsrest (ILLUSTRATIVE), en konstant realiseringsrest for LTC og et valgfritt ledd for stasjonshøydens rate; tiden etter en styring til { "1" }, { "10" } og { "100" } ns (eller oppgitte terskler) ved halvering ved siden av den inverse i lukket form for den dominerende støytypen, og det dominerende leddet ved hver oppgitte horisont, alt med enheter

seg-3801e9b32309 = Bare intern konsistens: den halverte tiden til terskel kontrolleres mot den inverse i lukket form for klokkens dominerende støytype, og det frittløpende klokkeleddet mot budsjettets eget klokkeledd. Klokkeklassene hviler på publiserte endagsspesifikasjoner (deres egne rader); LTC-raten utledes ikke på nytt her og har sin egen VALIDATED rad (Månens koordinattid); styringsresten er ILLUSTRATIVE, realiseringsresten er en budsjettallokering, og ingen termisk modell er inkludert. Målet på nanosekundnivå beskrevet i ICG WG-B Lunar PNT-materialet fra juni { "2024" } er sitert som en kildeuttalelse, ikke overtatt som en påstand; ingenting her er en uttalelse om noen reell stasjonsklokke

seg-af3ff120b707 = Geodetisk VLBI på månen

seg-cfd7d0126028 = Nærfelts VLBI-forsinkelse for en jordbaselinje som observerer et månebeacon + partielle deriverte

seg-d1943f9932af = Plan-bølge delta_dor (samme kodebase) i fjernfeltgrensen; partielle deriverte med finite differanser. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): mot ANISE { "0.10" } konvergerte lystider gjennom DE440 ({ "75" } forsinkelser 2024-01-01 over tre DSN-baselinjer, generert av xval/anise-lunar-od uten Kshana-kode) ligger ingen forsinkelse innenfor toleransen på { "1" } ps. Det største gapet er { "24" } µs, fra det analytiske månesentrum (omtrent { "200" } km fra DE440), den enkle øyeblikkelige geometrien uten lystidsiterasjon ({ "3.6" } µs) og den utelatte polbevegelsen; beacon-partielle deriverte avviker med opptil { "2.9e-3" } relativt mot { "1e-6" }. Påstanden i moduldokumentasjonen om at rammeapproksimasjonene ligger under modellens troverdighet holder ikke på dette nivået. { "0.30" } runde { "2" }: kernel-banen (lunar_vlbi::KernelGeometry) er validert mot NAIF SPICE-lystider i sin egen rad, Geodetisk VLBI på månen, kernel-bane; ANISE-sammenligningen av den banen (75/75 innenfor { "1" } ps, verst { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) er bare en kryssjekk av kernel-evaluering, fordi lystidsløsningen i den harnessen er dette prosjektets egen. Denne raden (den analytiske standardbanen) forblir MODELLED med funnet ovenfor

seg-d12d4565b01d = Geodetisk VLBI på månen, kernel-bane

seg-11e1c942e41c = Nærfelts VLBI-forsinkelse for en jordbaselinje som observerer et månebeacon, med partielle deriverte for beacon og stasjon, på kernel-banen (lunar_vlbi::KernelGeometry): DE440 Jord og Måne, DE440 lunare hovedakser, ITRF93 jordorientering med UT1 og polbevegelse, hver lystid konvergert i den barysentriske rammen, partielle deriverte med lystidsfaktoren 1/(c - u.V). Kan kjøres som scenarioet <c1/> med planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path satt; de validerte utdataene er serien geometric_delay_s og epoch_partials på kernel-banen. På kernel-banen legger delay_s til det analytiske differensierte Shapiro-leddet, som ikke sammenlignes, og delay_rate og near_field_correction_us sammenlignes ikke

seg-1f10810131be = NAIF kernel-leser: DAF-container, SPK type { "2" } og binær PCK type { "2" }

seg-7da4847e7a28 = Motorens egen rene Rust-leser for binære NAIF-kernels (naif_kernel): DAF-containeren (begge byterekkefølger, lenkede sammendragsposter), SPK type 2 Chebyshev-posisjonssegmenter lenket gjennom sine sentre til en laveste felles stamfar, og binære PCK type 2 Euler-vinkelsegmenter gjort om til en rotasjon fra J2000 til legemet, med epoker tatt som todelt ET slik at en forskyvning under mikrosekundet beholder sin presisjon. Det er den KernelEphemeris (ephem_provider) og kernel-banene i lunar_vlbi, lunar_llr og lunar_vlbi_fim leser DE440 gjennom. Påstanden er at den leser JPL-kernels riktig; det er ikke en påstand om at DE440, eller motorens analytiske serier for Sola og Månen, er nøyaktige

seg-e08e98908f3a = Jord-GNSS på månens avstand

seg-dd8ce373d1f6 = Mottak av Jord-GNSS på månens avstand: det svake signallaget som tabell { "1" } i P7 navngir og som motoren ikke hadde noen modell for. Per satellitt og per epoke beregner den vinkelen utenfor boresight mot senderens nadir, om Jorden skjuler den rette banen, skråavstanden og dens frirommstap, sendeforsterkningen ved denne vinkelen, mottatt effekt og bærebølge-til-støy-tettheten; den aggregerer deretter bare linkene som klarer en sporingsterskel, og sveiper et helt omløp for konstellasjonen slik at svaret er en FORDELING og ikke ett øyeblikksbilde. Tre fakta driver resultatet, og rapporten oppgir hvert av dem: Jorden spenner over { "13.90" } deg fra konstellasjonsradien, så strålens TOPP er geometrisk utilgjengelig for enhver stråle mot Månen; det som gjenstår er kanten av hovedloben og sidelobene, regimet LuGRE opererte i ved Månen i { "2025" }; og L1-banetapet er omtrent { "208" } dB, rundt { "25" } dB mer enn en terrestrisk bruker betaler. MEASURED på den medfølgende geometrien med 24 satellitter av GPS-klasse over { "64" } epoker av én omløpsperiode: tilgjengelighet for SIGNAL { "0.375" } med en beste link på { "30.93" } dB-Hz, og tilgjengelighet for posisjonsbestemmelse { "0.000" } - høyst to samtidige sporbare linker, aldri de fire en posisjon trenger. Skillet mellom disse to tilgjengelighetene er poenget, og rapporten nekter å la dem forveksles: Jord-GNSS på månens avstand er et lag av TIDSSYNKRONISERINGS-kvalitet, ikke av posisjonskvalitet, og en prior for lagdelt resiliens må ta tilgjengeligheten for posisjonsbestemmelse. Kondisjoneringen gis ut av samme grunn - hver synlige satellitt ligger innenfor en kjegle på et par grader sett fra Månen, så siktlinjene er nesten parallelle per konstruksjon. Kan kjøres som typen <c1/> Omformulert etter D7: påstanden på månens avstand er den RELATIVE bærebølge-til-støy-tettheten mellom satellitter ved én epoke, fra målte todimensjonale sendemønstre (NAVCEN Block IIR/IIR-M), pluss geometrisk synlighet; absolutt C/N0 hevdes ikke (Parker et al. rapporterer et felles tap på { "7" } til { "12" } dB).

seg-29df5b40a3f9 = Banebestemmelse for Månen: Jord-GNSS mot radiometri fra bakken

seg-647902ebcee3 = Banebestemmelse i en nesten rettlinjet halobane (eller en elliptisk frossen bane) fra to uavhengige datatyper: Jord-GNSS-pseudoavstander mottatt om bord (linkregelen fra raden Jord-GNSS på månens avstand, pluss okkultasjon av Månen) og toveis avstand og avstandsrate fra bakken fra tre stasjoner i Deep Space Network. Hver er en minstekvadraters batch i ett steg om referansebanen med sin formelle kovarians; en seedet Monte Carlo av differansen mellom de to estimatene tester om de to kovariansene forklarer den (q = d' (P_G + P_R)^-1 d, kjikvadrat med seks frihetsgrader når modellene stemmer) og hva en ikke-modellert akselerasjon gjør med statistikken.

seg-226dedaba243 = Et uavhengig scipy/numpy-program integrerer de samme variasjonslikningene (terskel O1). Ingenting sammenlignes med en måling av en månebane. Referansen kontrollerer numerikken i oppgitte formler, ikke fysikken, så raden forblir MODELLED. Begrenset tolegemeproblem med tre legemer: ingen Sol, ingen månens harmoniske, jordens rotasjonsakse langs banenormalen, ILLUSTRATIVE inndata for mottaker og stasjon.

seg-652bdc29deea = Bærebølgefaseflertydighet på Månen: overflate og orbiter

seg-02496f9e9af2 = Enkeltdifferensiert Jord-GNSS bærebølgefase og kode mellom mottakere ved en månestasjon på overflaten og en orbiter, med klokkedifferansen per epoke profilert ut, én flertydighet per sammenhengende passasje og den lengste passasjen som gauge. Kovariansen for float-flertydigheten er et Schur-komplement; LAMBDA løser heltallene, den bootstrappede raten rapporteres ved siden av en seedet Monte Carlo-rate for suksess med heltalls minstekvadrater og sigmaene for posisjon med float og fastsatt løsning. Rapportert som funnet: ved de registrerte { "12" } dBi er dobbeltdifferanseproblemet ikke mulig å danne (endring { "1" } flyttet standarden til { "25" } dBi etter at bare tellinger av tilgjengelighet var sett), og ved { "25" } dBi oppnås heltallsfastsettelse IKKE - utenfor rekkevidde (noen få prosent høyst), selv om float-løsningen forbedres med buen.

seg-8d8296752eb8 = En uavhengig numpy-løsning av de samme normalligningene fra de eksporterte radene (Q3) og en brute-force-opptelling av heltall (Q4). Ingen GNSS- eller månebærebølgefasemåling er sammenlignet. MODELLED.

seg-11dd1bb8e4e1 = Samestimering av månens ramme: overflatestasjoner og orbitere

seg-a38c8d95e6c9 = Fisher-informasjon for månerammens datum med sju parametere fra laseravstandsmåling fra jordstasjoner til de fem reflektorene alene og med avstander fra orbiter til overflatestasjon lagt til: informasjonsmatrisen, rang, Cramer-Rao-sigmaer, degenerasjonsmålet fra modulen for identifiserbarhet på månen og seedede tilfeldige stasjonsmengder. Banen holdes kjent i månens akser (dens feil bæres av orbiterens avstandssigma).

seg-47d2afc53b3d = En uavhengig numpy-finitt-differanse av framoverrettede modellen (F2). Ingenting er sammenlignet med reelle løsninger for månens ramme. Faktoren er betinget av den antatte kjente banen og avstandssigmaen på { "1" } m. MODELLED.

seg-862977c4bb01 = Presisjon for rammeknytning i rommet: samlokalisert GNSS, VLBI og laseravstandsmåling

seg-a9ae8e99f00d = Cramer-Rao-presisjon for translasjons-, skala- og rotasjonsforskyvningene mellom teknikkene GNSS, VLBI og laseravstandsmåling når ett romfartøy bærer alle tre, med romfartøyets posisjon eliminert ved hver epoke og ni lokale knytningsforstyrrelsesparametere som bærer en prior, sveipet over nøyaktigheten til den lokale knytningen. Kovarianser ved kvadratrotmetoden (normalligninger mister sifrene når teknikkene er nær perfekte).

seg-b37ac7294112 = Et uavhengig numpy-stablet system med posisjonsukjente eliminert ved eksplisitte Schur-komplementer (T3). Ingen data fra GRASP, Genesis eller andre misjoner er sammenlignet. MODELLED.

seg-ae627996875e = Sensitivitet for Love-tall og librasjon på Månen

seg-28780d07c4a7 = Fisher-informasjon for h2, k2, l2 og de fysiske librasjonsamplitudene fra laseravstandsmåling (radial og horisontal tidevannsforskyvning, reflektorrotasjon), orbitersporing (grad-2 k2-akselerasjonen integrert langs siktlinjen, trend fjernet), et gravimeter på overflaten (gravimetrisk faktor { "1" } + h2 - { "1.5" } k2) og en klokke på overflaten (fraksjonal rate ({ "1" } + k2 - h2) W2/c2, knyttet til månetidskonstantene). Nominelle verdier for h2 og l2 er lineariseringspunkter; studien sier hva som er sensitivt for hva, ikke hva tallene er.

seg-180d74388339 = En uavhengig numpy-sammenstilling med finitt differanse (G2) og evaluering i lukket form (G4). Sensitiviteten for k2 i orbiterfamilien er et tall i øvre ende (banetilstanden absorberer her bare en konstant og en trend). Ingen måling av månetidevann eller librasjon er sammenlignet; k2 er sitert fra Lemoine et al. { "2014" } som en nominell verdi. MODELLED.

seg-da712b740519 = DOP-forsterkning med overflatebeacons på Månen

seg-83e6341e01b1 = Beacon-forsterket presisjonsfortynning for en månebruker på overflaten: radene for siktlinjer til synlige satellitter og avstandsradene til synlige overflatebeacons settes sammen til én designmatrise og evalueres gjennom den felles DOP-kjernen, og den resulterende DOP avbildes til en realisert 1-sigma-nøyaktighet I METER gjennom en brukerekvivalent avstandsfeil per beacon satt sammen som rot-sum-kvadratet av ledd for klokkesynkronisering, flerveis og oppmåling. Synlighet for beacons er den geometriske horisonten med to høyder på Månen uten atmosfære, som ikke har noen refraktiv utvidelse og derfor er eksakt og ikke approksimativ. Kan kjøres som scenariotypen <c1/>, som rapporterer bare satellitter, satellitter pluss beacons og en større konstellasjon som den konkurrerende veien til samme geometri. MEASURED på den medfølgende gylne geometrien (bruker ved -80 deg, tre oppmålte beacons, illustrativ LCNS med seks satellitter ved t={ "0" }, maske { "5" } deg): { "5" } synlige satellitter gir PDOP { "9.6941" } og en 3D 1-sigma på { "11.222" } m; å legge til beaconene som faktisk klarer horisonten gir PDOP { "4.1160" } og { "4.765" } m, en faktor på { "2.355" }; tjenesten med 24 satellitter gir i stedet PDOP { "2.4226" } og { "2.804" } m, en faktor på { "4.002" }. Rapporten skriver ut antallet SYNLIGE beacons og ikke det konfigurerte, og i denne geometrien klarer bare ÉN av de tre beaconene horisonten: de to flankerende stedene ligger omtrent { "333" } km fra brukeren mot en horisont på { "86" } km for en antenne på { "2" } m, slik at en leser aldri må anta at alle tre bidro

seg-b0b618abf402 = Felles-modus integritetsblindhet

seg-e732ac99a9ae = Eksakt oppdeling i paritetsunderrom av en målefeil i den delen RAIM ikke kan se og den delen den kan. For den lineariserte øyeblikksmodellen y = G·x + e dekomponeres enhver feil dy entydig i en BLIND komponent i range(G) — absorbert som en tilstandsfeil S·dy og utslettet av residualprojektoren Pperp = I − G·S, og dermed usynlig for ENHVER residualtest, ikke bare for en bestemt terskel — og en DETEKTERBAR komponent i paritetsrommet. Modulen gir ut projektoren, oppdelingen og den blinde andelen, slik at den som kaller kan tallfeste hvor mye av en bestemt feil en øyeblikksmonitor strukturelt ikke kan rapportere. Anvendt på det reelle gulvet mellom efemerider: den meternivå uenigheten mellom DE440 og INPOP21a og mellom DE440 og EPM2021 i geosentrisk posisjon for Månen absorberes nesten fullstendig som brukerposisjonsfeil (median blind andel { "1.000000" }; median blind posisjonsfeil { "2.3955" } m og { "2.0050" } m) mot en paritetsresidual på nivået { "1e-15" } m

seg-845e9f5eec81 = Beskyttelsesnivå for felles modus og total integritetsomhylling

seg-2246ffa73869 = cmpl_horizontal avgrenser den horisontale posisjonsfeilen med k sigma fra klassen med blind felles modus, ved å danne blind_position_covariance = S*Cov*S^T og projisere den inn i ENU; integrity_envelope rapporterer hpl_total = hpl_araim + cmpl. Skillet paret finnes for å gjøre: RESIDUALtesten i RAIM/ARAIM er bevisbart blind for feil i range(G), men BESKYTTELSESNIVÅET i ARAIM er ikke det - dets feilfrie ledd avgrenser dem allerede opp til en leverandørs URA pluss nominell bias. CMPL er derfor bare OVERSKUDDET mellom leverandører som en enkelt leverandørs URA/ISM per leverandør ikke overavgrenser, og summen er en konservativ grense etter trekantulikheten og ikke en RSS, gyldig bare der overskuddet ikke allerede ligger innenfor URA.

seg-ffc59a7ed497 = Analytisk projektoralgebra kontrollert mot seg selv: en kovarians begrenset til range(G) må gi en positiv CMPL, en kovarians begrenset til paritetsrommet må gi omtrent null, og omhyllingen må summere to bidrag som er ortogonale i målerommet. Felles-modus-kovariansen, konstellasjonsgeometrien og k er representative modellerte inndata, IKKE et sertifisert budsjett, og det hevdes ikke at trekantgrensen er stram. MERKNAD OM OPPHAV: cmpl_horizontal, blind_position_covariance og integrity_envelope er offentlige og leveres, og enhetstestene deres var allerede sitert av raden for felles-modus-blindhet, men SELVE OMHYLLINGSPÅSTANDEN hadde ingen rad - så forbeholdet som holder den ærlig, at summen er en trekantgrense og ikke en RSS, var oppgitt ingen steder i registeret. Raden registrerer påstanden og forbeholdet sammen.

seg-5ed34a5b402e = Felles månebanebestemmelse med flere teknikker + klokke

seg-5ace1caff5a9 = Batchfusjon av VLBI + lokal avstand på månen + avstand mellom satellitter for å gjenvinne posisjoner og klokker for stasjoner og konstellasjon

seg-69fbe488dec5 = Fisher-informasjon og Cramér–Rao-observerbarhet

seg-043d4c7a2d6a = Fisher-informasjon M=HᵀWH, Cramér–Rao nedre grense, observerbarhetsrang / null-rom for datumdefekt (Moore–Penrose pseudoinvers) og D/A/E/T-optimale forsøksutformingsskalarer fra en symmetrisk Jacobi-egenverdiløser

seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-basert) — en uavhengig tredjepartsreferanse som beregner de samme entydig definerte egenverdiene, σ²(XᵀX)⁻¹ Cramér–Rao-kovariansen og GNSS-faktorene for presisjonsfortynning (dilution of precision) med en annen algoritme (LAPACK divide-and-conquer + LU) enn Kshanas syklisk-Jacobi-sveip og spektrale pseudoinvers; stemmer til { "1e-9" }. Den samme typen eksternt bibliotek validerer allerede DOP-motoren (mot gnss_lib_py) og χ²/erf-kjernene (mot SciPy). Dessuten kontrollert mot Kays ({ "1993" }) lukkede CRLB-formler og mot Monte Carlo-oppnåelse av CRLB (intern)

seg-e4ec41d0f5e1 = Observerbarhet av månens absolutte stasjonsposisjon (datumdefekt)

seg-b3e4160042d2 = Fisher-informasjonsobserverbarhet for den felles månebestemmelsen: uten jordgrunnlinjer ligger absoluttsystemets datum i null-rommet til HᵀWH (stasjonsposisjonen er uobserverbar); ≥{ "3" } grunnlinjer gjenoppretter full rang og begrenser stasjonens Cramér–Rao-feil, som estimatoren oppnår

seg-ae4b71d54dfa = 7-parameter Helmert-datumtilpasning + ICRF-orienteringsknytning fra et nettverk av punkter

seg-9e434924b34c = Uavhengig lukket-form vektet Umeyama (Horn) likhetstransformasjonsløser (numpy/scipy SVD-basert; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — en annen algoritme enn kshanas iterative Gauss–Newton-tilpasning, som når det samme entydig definerte vektede minstekvadratoptimumet på byte-identiske punktnettverk

seg-4bcec6e2dd9f = Månens navigasjonstjenestevolum

seg-dba98ad5df1c = Månens DOP / dekning / tilgjengelighet i Moonlight-klassen + generaliserte ARAIM-beskyttelsesnivåer for månen over et tjenestevolum

seg-7e981d90a806 = Uavhengig tredjepartsreferanse ANISE { "0.10.2" } astro::Orbit Keplerpropagator (Nyx Space, MPL-2.0) — en ekvinoktial tolegemekodebane som er forskjellig fra kshanas Newton-Raphson-Kepler; MCI-posisjonen per satellitt stemmer til <{ "1e-3" } m, og det avledede antallet/settet av synlige satellitter stemmer nøyaktig i hvert rutenettpunkt. DOP-kjernen er validert mot gnss_lib_py; integritet bruker publiserte LunaNet/LCNS-parametere

seg-2ed7181c97dd = LunaNet AFS-spredningskodegenerering (LSIS V1.0)

seg-13ff6c381275 = Kodene for Augmented Forward Signal i LSIS V1.0 ({ "29" } januar { "2025" }): AFS-Q 10230-chip primærkoden generert fra IS-GPS-800 L1C-pilotkonstruksjonen med IS-GPS-800J-indeksene (de samme { "210" } tildelingene som LSIS tillegg D skriver ut), AFS-I 2046-chip Gold-kodene generert fra g1 = x^{ "11" } + x^{ "2" } + { "1" } og g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } der hver PRNs G2-forsinkelse er hentet fra standardens Annex { "3" }-fil, de fire sekundærkodene, de 1500-chip tertiærkodene, den midlertidige nodetildelingen i tabell { "11" } og den nivådelte pilotkoden. LSIS-innholdet leses ved kjøring fra en lokal hurtigbuffer som er SHA-256-verifisert og fylt fra den NASA-hostede PDF-filen, og det videredistribueres aldri

seg-dc1dd144b107 = Referanse: verdiene LSIS V1.0 skriver ut for validering (tabell C-1 til C-5, D-1 til D-6, E-1 til E-6) og de elektroniske kodefilene i Annex { "3" }, under et nullavvikskriterium fastsatt før sammenligningen. Kriteriet bommes av én trykt celle som er internt inkonsistent med standardens egen Annex { "3" }-fil, så raden forblir MODELLED; en erratanotis er utarbeidet. De samme chipene er også lik LANS-AFS-SIMs (rad «LunaNet AFS baseband rendering against an independent generator, given its channel state»)

seg-ea20909686ea = LunaNet AFS-basebåndgjengivelse mot en uavhengig generator, gitt dens kanaltilstand (LSIS V1.0)

seg-c0f021c38842 = Gjengivelseskjernen i AFS-basebåndet (LSIS-130: kompleks envelope I + jQ, I = AFS-I Gold-koden ganger rammen på { "500" } symboler/s ved { "1.023" } Mchip/s, Q = den nivådelte AFS-Q-piloten ved { "5.115" } Mchip/s, bærebølgerotasjon, chip- og symboljustering) gjengir en uavhengig generators sampler når den drives av generatorens egen registrerte kanaltilstand (kodefaser og -rater, bærebølgefase og -frekvens, amplitude per kanal). Dekkes ikke: nodemodellen som utleder denne tilstanden fra en Doppler, en forsinkelse og et bærebølge-til-støy-tetthetsforhold, 50/50-effektfordelingen beregnet fra bærebølge-til-støy-tettheten (amplitudene hentes fra simulatoren), og SigMF-metadata og skriving av 8-bits sampler

seg-dd1142957a05 = Bibliotek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-bånd-bygg, kjørt som et eget program); Kshanas sampler drives bare av simulatorens registrerte kanaltilstand, og et bygg som bare skriver ut sporing er kontrollert som byte-identisk med det upatchede. Terskler fastsatt før kjøringen: null chip- og symbolavvik, |rho| >= { "0.999" } over kjøringen og >= { "0.99" } per blokk på { "2" } ms, fase innenfor { "0.05" } rad. Like I- og Q-amplituder er en inngangsverdi i sammenligningen, så effektfordelingen testes ikke av den. LANS-AFS-SIM leser sine tertiærkoder fra LSIS Annex { "3" }-filen, så den delen er ikke uavhengig av koderaden. LANS-AFS-SIM og PocketSDR-AFS har samme forfatter og regnes som én uavhengig implementasjon. Avhengig av data: LANS-AFS-SIM-sammenligningen trenger den lokale LSIS V1.0-hurtigbufferen (xval/lunar-afs/fetch_lsis.sh, SHA-256-verifisert) og hoppes over med en melding uten den

seg-5d79da539912 = LunaNet AFS-rammekanalkoding, FID { "0" } (LSIS V1.0)

seg-6ed2b4c792e6 = FID { "0" }-rammen på { "12" } s og 6000 symboler i LSIS V1.0: synkroniseringsmønster på 68 symboler, BCH ({ "51" }, { "8" }) delramme { "1" } (oktal-763-generator), CRC-24 (({ "1" } + X)·P(X)) på delramme 2-4, rate 1/2 LDPC-koding med de trykte A, B^-1, C, D (LSIS Annex { "1" }, lest ved kjøring fra den SHA-256-verifiserte lokale hurtigbufferen) og standardens punktering, { "60" } x { "98" } blokkinterleaver; en uttømmende delramme-1-dekoder som flagger en TOI utenfor { "0" }..99, og en normalisert min-sum LDPC-dekoder skrevet ut fra H = [[A, B, { "0" }], [C, D, I]] alene

seg-46879e2e8ab5 = Bibliotek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), hvis egne BCH, CRC, LDPC og interleaver gir rammer som er symbolidentiske med Kshanas for samme innhold (null avvik, terskel fastsatt før kjøringen). Underbygget av referanseverdier: LSIS V1.0 figur { "8" } BCH-regneeksempelet og CRC-24/LTE-A-kontrollverdien (Greg Cooks katalog over parametriserte CRC-algoritmer), begge bit-eksakte; og av PocketSDR-AFS som dekoder hver delramme i rammene den synkroniserte i tre kjøringer med bestått CRC og delramme-2-biter som stemmer. Paritetskontrollen er nær en intern identitet (den bekrefter at den trykte B^-1 inverterer den trykte B) og regnes ikke som en uavhengig referanse. Avhengig av data: LANS-AFS-SIM-sammenligningen trenger den lokale LSIS V1.0-hurtigbufferen (xval/lunar-afs/fetch_lsis.sh, SHA-256-verifisert) og hoppes over med en melding uten den

seg-56c7aeac59c1 = LunaNet AFS lukket-sløyfe-dekodbarhet med en uavhengig mottaker (LSIS V1.0)

seg-da2d29d437b0 = En Kshana AFS-opptaking som er innhentet, sporet og dekodet av en uavhengig programvaremottaker og sammenlignet med opptakingens egne fasitetiketter. Dette viser bare at standarden følges og at etikettene er konsistente; det er ikke en påstand om kanalfysikk, utbredelse, mottatt effekt eller linkbudsjetter, hvis verdier i opptakingen er valgte inngangsverdier

seg-8211583afc64 = Bibliotek: PocketSDR-AFS (T. Ebinuma etter T. Takasus PocketSDR { "0.13" }, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-bånd-bygg, loggnivåkopi som bare skriver ut), under kriterier fastsatt før hver kjøring. Den tredje forhåndsregistrerte sammenligningen oppfyller dekodings- og sporingsterskelene C1 og C2 fullt ut, men ikke sin vakt G0 slik den er skrevet (to kjøringer av den uendrede mottakeren avviker i de samme fire innhentingspostene), og den andre bommet med { "5" } brudd, så raden forblir MODELLED. LANS-AFS-SIM og PocketSDR-AFS har samme forfatter og regnes som én uavhengig implementasjon; kontrollene av trykte vektorer i rammekodingsraden vokter mot en delt feillesing

seg-780369fb9a54 = GPS L1 C/A kryssgeneratorkontroll mot standarden

seg-ee47b60515f1 = GPS L1 C/A-spredningskoder (sdr::CaCode) og LNAV-delramme 1-3 (gps_lnav: IS-GPS-200-feltkvantisering med spesifikasjonens pi, tos komplement-pakking, TLM- og HOW-ord, tabell 20-XIV-paritet med D29*/D30*-invertering, de paritetsløsende bitene i ord { "2" } og { "10" }) sammenlignet bit for bit med gps-sdr-sim på dens medfølgende brdc0010.22n ({ "32" } satellitter)

seg-325900ed59ea = Signalgeometri i GNSS IQ-scenen mot en uavhengig basebåndgenerator

seg-ee5625b30ff2 = IQ-scenegeneratorens fasit per satellitt for en GPS L1 C/A-scene med kringkastet efemeride (iq::scene: en SatGeometry med kringkastet efemeride, generert til TruthRecord-fasitposter): hvilke satellitter som er over horisonten, pseudoavstanden, kodefasen ved første sample, bærebølge-Doppler og siktevinklene, for en stasjonær mottaker, sammenlignet med kanaltilstanden gps-sdr-sim bygger den første blokken av sin egen I/Q-utdata fra, for samme efemeride, mottaker og starttid (ionosfære av på begge sider)

seg-bf429c8f00fb = GNSS IQ-innhenting på uavhengig genererte I/Q-sampler

seg-9a0c52bfb06e = iq::acq::acquire (FFT parallelt kodefasesøk med kvadratlov-Marcum-Q-terskel) med GpsL1Ca-replikaen, på { "20" } ms av gps-sdr-sims egen 8-bits I/Q-utdata dekodet av iq::io-sampledekoderen (ci8, { "2.6" } MHz, { "11" } satellitter, ingen støy): hver PRN { "1" } til { "32" } søkt i to vinduer på { "10" } ms, resultatet sammenlignet med kodefasen og Doppleren gps-sdr-sim modulerte

seg-f40dc3dac990 = IQ-monitorer scoret i lab-avspillingskampanjer: deteksjon, bom, falske alarmer og lukket-form falsk-alarm-tall

seg-93fb3109728c = iq::campaign::detect og kampanjekjøreren: en valgfri [monitors]-tabell kjører IQ-monitorene på hver celle i kjørerens enkeltgjennomløp. Effekt- og spektralmonitorene ser samplene etter hver frontend-kjede; C/N0-, SQM- og låsemonitorene ser hver sporet kanals sløyfeoppdateringer. Hver alarm scores mot de oppgitte hendelsene: detektert eller oversett per (hendelse, alarmtype, kanal), tid til deteksjon, og falske alarmer utenfor hendelsene over eksponeringen deres. Hver tests lukkede falsk-alarm-tall oppgis: effekt per blokk (eksakt Gamma-hale), spektralt overskudd per blokk (tilnærming), kurtose (ensidig gaussisk), pulser (binomisk tak), SQM per midlet oppdatering (2Q(k) = Q(1/2, k^2/2), ny), og C/N0-CUSUMs ARL0 (Siegmund). Uten tabellen er celler, nøkler og sammendrag uendret. Ingen interferensbølgeform syntetiseres

seg-5b7eb7ddb474 = Deteksjons-ROC for IQ-monitorene fra en scoret lab-avspillingskampanje

seg-57fe85965c9c = iq::campaign::detect (windows, roc) og iq::campaign::report::rocs: hver celle i en kampanje med monitorer beholder, per alarmtype og kanal, maksimum av monitorens egen teststatistikk over hvert oppgitt hendelsesvindu (positiv) og over flislagte roc_window_s-vinduer utenfor hendelsene (negativ). Statistikkene er blokkeffektavviket, PSD-overskuddet, kurtose-z, SQM |z| for den midlede metrikken og C/N0-CUSUM. Rapporten slår dem sammen per type til en empirisk ROC på vindusnivå med sin AUC og arbeidspunktet ved den konfigurerte terskelen, skrevet som roc.json (kshana.campaign-roc/1) og en Detection ROC-seksjon i report.html. En kampanje uten monitorer skriver ingen av delene

seg-3a3cfa322f01 = Kalibrering av den åpne mottakerens C/N0- og låsemodeller mot IQ-kampanjeresultater, med oppgitt prediksjonsfeil

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) og <c1/> på <c2/>, Python <c3/> og MCP-verktøyet labfit (kampanjemapper bare innenfor sin egen arbeidsmappe): leser en <c4/>-utdatamappe ved dens DIGEST og grupperer de scorede cellene i tilpasningsenheter (signal x sløyfeutforming x frontend-kjede x jammertype, aldri slått sammen). Per enhet tilpasses målt C/N0 mot oppgitt J/S med spektralseparasjonsformen. Q_eff er ikke identifiserbar fra C/N0-data uten en uavhengig måling av jammer- og signaleffektene, så Q oppgis, aldri tilpasses (typetabellen, hendelsens q, eller for en ukjent type den mest skadelige oppgitte verdien, cw Q = { "1" }). Den tilpassede parameteren er den identifiserbare forskyvningen delta_eff = delta - { "10" } log10 Q, med korrelasjonsvakten som rapporterer degenerasjonen. C/N0-bin som er låst under { "90" } % er sensurert og listet. Terskel-J/S oppgis direkte og ved den lukkede formen; sporingssløyfemodellen og de empiriske låsemodellene er koblet gjennom C/N0-modellen, med fall- og gjenlåsingsventetider. En seedet klyngebootstrap over opptak ({ "1000" } replikater) gir persentilintervaller; prediksjonsintervaller på { "90" } % kommer fra residualtrekk; utelat-ett-opptak-ut-tilbakeholdte datasett deles i interpolasjon og ekstrapolasjon; en forhåndsregistrert [validation]-tabell hashes og hver terskel bedømmes PASS/FAIL. Rapporter kshana.labfit-iq/1 som JSON, CSV og generert Markdown, med en units-blokk. Bare syntetisk (ingen tredjepartsopptak, ingen jammerbølgeform). Labfit-banen for mottakerlogg er uendret

seg-9537d301c95e = GPS LNAV-koding dekodet av et uavhengig mottakerbibliotek

seg-909415621881 = Kshanas LNAV-delramme 1-3 (gps_lnav::encode_subframes) for de { "32" } brdc0010.22n-efemeridene gitt til RTKLIBs decode_word og decode_frame: paritet for hvert ord, delrammedekoding med konsistent datautgave, og hver dekodet parameter mot Kshanas heltall og mot inngangsverdien

seg-f66855e35c53 = GPS LNAV-navigasjonsmeldingskoding

seg-8caf8366e2f8 = IS-GPS-200 LNAV-delramme 1-3 (gps_lnav::encode_subframes: kvantisering med avrunding til nærmeste av hver klokke- og banepararameter ved spesifikasjonens skalafaktorer og verdi av pi, tos komplement-pakking, TLM- og HOW-ord, tabell 20-XIV-paritet med D29*/D30*-invertering, de paritetsløsende bitene i ord { "2" } og { "10" }), meldingen en GPS L1 C/A-signalgenerator sender

seg-c5c944357643 = Innhenting og C/N0-estimering på ekte IQ fra månen

seg-f5dcb5e06bf4 = Parallelt kodefasesøk (acquisition::pcps_acquire: portabel FFT, koherent folding, ikke-koherent akkumulering, kjikvadratterskel for en søkeomfattende falsk-alarm-sannsynlighet), forfining, åpen-sløyfe prompt-korrelasjon med kode-Doppler og M2M4 C/N0-estimatoren, kjørt på LuGRE L1 4-bits IQ-batcher lest gjennom realdata::ion_sdr

seg-709626569a5c = Innhenting på ekte IQ fra månen mot baneprediktert Doppler (beslutning på samplingseffekt)

seg-784ebd80c425 = acquisition::pcps_acquire med sin beslutning på samplingseffekt på de ni LuGRE L1-batchene som ikke er fra overflaten, med mid-rise-nivåer; Doppler-forskjeller mellom innhentede satellitter sammenlignet med forskjeller predikert fra ESAs endelige baner og den Firefly-rekonstruerte Blue Ghost-banen

seg-89875d67b253 = Innhenting på ekte IQ fra månen scoret mot baneprediktert Doppler

seg-956bcfeaf319 = acquisition::pcps_acquire med celle-midlende beslutning (topp over rutenettets middelcelle, robust mot båndbegrenset støy) på de ni LuGRE L1-batchene som ikke er fra overflaten, med mid-rise-nivåer; Doppler-forskjeller mellom innhentede satellitter sammenlignet med forskjeller predikert fra ESAs endelige baner og den Firefly-rekonstruerte Blue Ghost-banen

seg-8fa779dd1788 = Innhenting på tilbakeholdt ekte IQ fra månen mot baneprediktert Doppler

seg-484868771231 = acquisition::pcps_acquire (celle-midlende beslutning, falsk-alarm-sannsynlighet { "1e-7" }) med refine_doppler_coherent på LuGRE L1-batchene registrert på månens overflate (I i høy nibble, mid-rise-nivåer); Doppler-forskjeller mellom innhentede satellitter mot forskjeller predikert fra ESAs endelige baner og Firefly-landingsstedets kjerne

seg-758af035b3ce = Felles geometri for kommunikasjon og navigasjon på månen

seg-11f861bdc6bf = Topocentriske siktevinkler per satellitt (asimut med klokken fra nord, elevasjon) og skrå avstand på et navngitt selenografisk sted, gitt satellitten i stedets månefaste referansesystem (den validerte påstanden). Avstandsnøyaktigheten for signalet i rommet er eksponert som en scenarioparameter slik at tjenestevolumsveipet gir et avstandsKRAV i stedet for bestått/ikke bestått ved én fast sigma; denne parameteren er en utformingsinngangsverdi utenfor den validerte påstanden

seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, kjørt som et verktøy fra xval/anise-service-geometry, binærfilen lunar-look-angles-xval, som ikke kaller noen Kshana-kode): ANISEs egen rutine for asimut, elevasjon og avstand (azimuth_elevation_range_sez) fra steder bygd av dens konstruktør for breddegrad-lengdegrad-høyde på pck00011-Månen (kule { "1737.4" } km), med satellittene rotert inn i MOON_PA_DE440 gjennom moon_pa_de440_200625.bpc. { "768" } sampler over { "8" } steder (de { "4" } navngitte stedene og { "4" } andre, over og under horisonten), { "12" } epoker og { "8" } satellitter stemmer innenfor { "1e-6" } grader i asimut og elevasjon og { "1" } mm i avstand og stedsposisjon (fastsatt før sammenligningen); målt { "2.2e-12" } grader, { "2.1e-13" } grader og { "5.6e-9" } m. Påstand: stedsplassering og siktevinkler gitt satellitten i stedets månefaste referansesystem. Kshanas egen realisering av det månefaste middelrotasjonssystemet og avstandsnøyaktighetsparameteren ligger utenfor den; enhetstestene for lukket-form geometri beholdes som støttekontroller

seg-10af60b488b9 = Differensiell referansestasjon i NovaMoon-klassen: fellesmodus-kansellering + grunnlinjevoksende residual + DGNSS-beskyttelsesnivåer

seg-96b2627b388a = Identitet for differensiell feilkansellering + gjenbruk av DO-229E SBAS PL-maskineriet; enkeltdifferanse- + WLS-løsningen er i tillegg kontrollert mot RTKLIBs lsq()/matinv() (Takasu, BSD-2-Clause, kompilert C) — uavhengig løserkode, men den samme førsteordens LOS-differanse-algebraen, så fortsatt InternalConsistency

seg-c04a3591074c = Eksport for interoperabilitet på månen

seg-91f4a066b3c0 = LunaNet/IOAG-tilpasset eksport av referansesystem + tid + efemeride for månen (CCSDS OEM + KIF) med rundtur-formatkontroll

seg-f5f8ed69bea7 = kshanas OEM-eksport for månen tolket på nytt av det uavhengige tredjepartsbiblioteket <c1/> (R. J. Anderson): referansesystem- og tidstokens og tilstand per epoke stemmer til skrivepresisjonen ({ "1" } mm / { "1e-9" } km/s) og en eksport uten TIME_SYSTEM avvises — en strukturell rundtur for utveksling; den fysiske semantikken for månens referansesystem og tid er validert av egne rader, så denne forblir MODELLED. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): en andre uavhengig leser, Orekit { "12.2" } CCSDS OEM-parser (Apache-2.0, strenge standardverdier), avviser begge månefilene fordi den ikke implementerer tidssystemene LTC og TCL (den dekoder crate-ens EME2000/UTC OEM, og dekoder månefilene når TIME_SYSTEM erstattes med TDB); oem { "0.4.5" } dekoder dem innenfor den skrevne presisjonen bare ved å falle tilbake fra det ikke-støttede tidssystemet. Utveksling av disse månefilene med vanlige CCSDS-lesere er ikke påvist

seg-8ab65cbefb75 = Scoring tilpasset PNT-resiliensrammeverk

seg-c48198f31d63 = Delscorer per dimensjon over Kshanas egne syv resilienskategorier (ikke DHS-begreper), RethinkPNT RDRR-funksjoner og Yang-kriterier, hver merket modellert med sin driver; foreløpig RPCF-nivå med en port for begrenset degradering. Simuleringsavledet egenvurdering, aldri sertifisering.

seg-f905aeb203bb = Håndavledede formler per metrikk: invers-Simpson-mangfold, vektet-middel-sammensetning, avgrensede/uavgrensede tidslinjevarigheter, svakeste-ledd-nivåstige

seg-d7bdb6fe186e = Studie av beslutningsustabilitet i resiliensscore

seg-5fcf18a68bb1 = Kvantifiserer hvordan en enkelt sammensatt score / RPCF-nivå omordner arkitekturer under et forsvarlig vektingssimpleks og et trusselensemble (topp-1-vendingsrate, Kendall-tau-spredning, nivåvendingsrate, rangområder); analyser av deklarert mot målt og mangfoldskollaps.

seg-b6bf76a752a0 = Lukket-form identiteter for rangstatistikk (tau i [-1,{ "1" }] med håndberegnede verdier; deterministisk seedet Dirichlet) og konstruerte stabile/ustabile vitner

seg-1bf03544a010 = Representativitet i demonstrasjonen og gap til flyvning

seg-db24d16d38c9 = Ærlighetsregister per resultat som kvalifiserer en demonstrasjonsutdata: dens eksterne ankre, modellerte forutsetninger, gap til flyvning og representative TRL-bånd, med håndhevede invarianter (Validated krever et eksternt anker; Modelled krever et gap og kan ikke hevde noe over TRL { "4" }).

seg-81d3adb239c5 = Lukket-form invarianter som svarer til compliance-disiplinen «representativitet begrunnet + gap til flyvning identifisert»; knyttet til grensen mellom verifikasjonsstatus og referansetype

seg-52ab936eb5f5 = Evidens for avveining mellom kvante og klassisk (felles form)

seg-a6679ed5bed7 = Ett reproduserbart TradeEvidence-objekt (fast ramme: scenario+seed+motor; felles verdier per FoM for kvante mot klassisk med fordel med riktig polaritet, valgfri { "95" }% CI, merkelapp for validert/modellert) som bærer en representativitetspost, slik at hver kvante-PNT-vertikal rapporterer avveiningen på samme ærlige måte.

seg-70da3e15ea8b = Lukket-form identiteter for fordel/vinner + tro innpakning av den eksisterende quantum_trade::TradeResult; ærlighet knyttet til representativitetsregisteret og verifikasjonsmerkelappene

seg-20fee61b3107 = Feilmodellbibliotek for kvanteenheter

seg-e42eabe9bc2a = Enhetskort (optisk/fanget-ion/kvikksølv-ion + klassiske klokker gjenbrukt fra holdover/clock_state; kaldatom-interferometer; klassiske + sammenfiltrings-/enkeltfoton-tidsoverføringslinker) som hver bærer en representativitetspost; sammenfiltringslinken legger til en skuddbegrenset tidspresisjonsmodell (~jitter/sqrt(R*tau), mørktellingsstraff, systematisk gulv).

seg-632600203e1f = Gjenbrukte klokke-/CAI-koeffisienter (holdover/clock_state, publiserte verdier) + lukket-form identiteter for skuddstøy/tap for sammenfiltringslinken

seg-86d71fd89f26 = Pålitelig kvantetidssynkronisering (tidsoverføring + sikker formidling + anomali)

seg-d2a3d37825ef = Ende-til-ende tidsoverføringskjede for kvante mot klassisk (klokkekyst + linkpresisjon i kvadratur), et gjenbrukt tidssynkroniseringsbeskyttelsesnivå, en sikkerhets-FoM mot forsinknings-/avspillingsangrep (1-P_md) og en deteksjonssannsynlighet for klokkeanomali + CUSUM-latens, utgitt som ærlig TradeEvidence med en representativitetspost.

seg-ac95d112a17a = Lukket-form kvadraturbudsjett over gjenbrukte validerte kjerner (ADEV mot Stable32/NIST; TPL-grense; deteksjon analytic_pd/pmd); ærlighet knyttet til representativitetsregisteret

seg-eaf341ff4522 = GNSS-fri kvantenavigasjon

seg-908a44a9f7c7 = Kvante (kaldatom-interferometer) mot klassisk navigasjonsklasse-INS med dødregning over et GNSS-bortfall: vekst i posisjonsfeil, holdover til en posisjonsterskel, og avveiningen kvante mot klassisk som ærlig TradeEvidence; ærlig observerbarhetsnotat (bias er uobserverbar uten posisjonsbestemmelse, så feilen vokser).

seg-508f2c8884e2 = Gjenbrukte inertialbudsjetter kontrollert mot en uavhengig Octave-dobbeltintegrasjon av den samme dødregnings-ODEen (annen kjøretid, delt modell → ReferenceImpl) pluss Freier-2016 publisert kortidsstøy som et ensidig anker; det sammensatte kvante-mot-klassisk-resultatet forblir MODELLED

seg-914132833f5a = Feil-/anomalideteksjon for kvante-PNT-systemer

seg-f20392820b9d = Merket katalog over kvantefeil (klokkefrekvenssprang/-drift/låsetap; sensorbiassteg/-bortfall), en ROC AUC for deteksjonsstatistikken med bootstrap-CI, og en minste detekterbar feil ved en fast falsk-alarm-rate; en kvanteklokkestøttet monitor detekterer mindre feil enn en klassisk, utgitt som ærlig TradeEvidence.

seg-a689ab2ebb84 = Lukket-form gaussisk AUC = Phi(mu/(sigma*sqrt2)) kontrollert mot den eksternt validerte eval_stats::bootstrap_auc_ci (mot scikit-learn) + analytiske deteksjonsterskler

seg-0633e05d393f = Momentfri stivlegemeholdningsdynamikk

seg-23f43007bcbf = Eulers rotasjonsbevegelsesligninger (I ω̇ = τ − ω × Iω, hovedakse og generell treghetstensor) koblet til kvaternion-holdningskinematikk (q̇ = ½ q ⊗ ω) og propagert med en RK4-integrator med fast steg som renormaliserer kvaternionen i hvert steg

seg-2d21a01ea132 = Basilisk { "2.9.1" } romfartøy-hub stivlegemepropagering (AVSLab, ISC; MRP-holdning gjennom sine egne koblede hub-ligninger, svIntegratorRKF78 ved relativ toleranse { "1e-12" }), en uavhengig implementasjon av ligningene for momentfritt stivt legeme: Kshanas RK4-kvaternion (dt { "0.01" } s) og kroppsrater stemmer innenfor { "1e-9" } over { "1e4" } s på to generelle ikke-diagonale treghetsmomenter (verste { "3.3e-11" } og { "3.4e-12" } rad/s); toleranse fastsatt før sammenligningen. Validert påstand: momentfri bevegelse; leddet for eksternt moment er ikke sammenlignet. Bevarings- og symmetrisk-topp-kontrollene beholdes som støttende selvkonsistens. Intet miljø med fleksibelt legeme / reguleringssløyfe / eksternt moment

seg-93b8ba1ba0e5 = Clohessy–Wiltshire / Hill relativ bevegelsesdynamikk

seg-17f27a95d009 = Relativ bevegelse for en jager rundt et mål i en sirkulær referansebane i LVLH-systemet: de lineariserte Clohessy–Wiltshire-ligningene (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) løst med den lukkede { "6" }×{ "6" } tilstandstransisjonsmatrisen Φ(n,t) (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) med betingelsen for avgrenset relativ bane ẏ₀=−2n·x₀, og en lukket-form andreordenskorreksjon (cw_dynamics::second_order_correction, CW-responsen på de kvadratiske leddene i de eksakte ligningene for sirkulær chief; Karlgaard og Lutze { "2003" }, Newman, Lovell og Pratt { "2015" }) sammensatt som cw_dynamics::propagate_second_order. Den validerte utdataen er propagate_second_order; den lineære Φ alene er karakterisert mot ikke-lineær fasit, ikke validert

seg-d31be81dfd8f = TDOA/FDOA passiv senderlokalisering

seg-aa870cee16f6 = Lokaliser en sender (jammer/spoofer, eller en opportunistisk kilde for omvendt PNT) fra ankomsttidsdifferanse over et mottakernettverk — τᵢ=(Rᵢ−R₀)/c hyperboloideskjæringen løst med Gauss–Newton minste kvadrater — og, ved å legge til ankomstfrekvensdifferanse (avstandsratedifferanser) med bevegelige mottakere, gjenvinn posisjon og hastighet i fellesskap; med Cramér–Rao nedre grense på posisjonskovariansen fra målegeometrien

seg-36b74b49f82f = 3-DoF ballistisk toppdeselerasjon ved inngang mot den publiserte Stardust-nominelle

seg-a05ca2fde6fc = En 3-DoF punktmasse-inngang over en roterende sfærisk jord gjennom US Standard Atmosphere { "1976" }, integrert med RK4 fra en inertial inngangstilstand, som rapporterer toppdeselerasjonen og dens høyde; den planetrelative inngangstilstanden fra den inertiale. Kan kjøres som scenariotypen <c1/>.

seg-5ab7065c0803 = Stardust-nominelle av Desai, Mitcheltree og Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maksimal deselerasjon { "33.4" } g fra { "12.6" } km/s planetrelativt med oppskytingsmassen { "45.8" } kg, en 6-DoF POST-bane med den fulle aerodynamiske databasen; inngangsgrensesnitt fra Desai, Lyons, Tooley og Kangas (NTRS { "20090004445" }): radius { "6503.14" } km, inertial { "12.9" } km/s ved -8.2 grader. Terskler forhåndsregistrert i xval/entry-stardust/PREREGISTRATION.md før noen kjøring på disse inngangsverdiene; begge holdt ved første kjøring. DET SOM IKKE ER DEKKET: ett publisert tilfelle og én størrelse (toppdeselerasjon, som i den ballistiske tilnærmingen ikke avhenger av den ballistiske koeffisienten); inngangsbredde og kurs er antatt; oppvarming, varmebelastning og landingspunkt er ikke kontrollert mot den; punktmasse med konstant C_D, ikke 6-DoF.

seg-5bd3882531b6 = Konvektiv oppvarming i stagnasjonspunktet (Sutton-Graves) ved en 3-DoF-inngang

seg-4f97036ed72f = Konvektiv varmefluks i stagnasjonspunktet q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstantene for jordluft og Mars-atmosfæren (NASA TR R-376, { "1971" }), dens topp og den integrerte varmebelastningen langs en 3-DoF-inngang, ballistisk eller løftende ved konstant krengning, på Jorden eller Mars.

seg-5a203ecfeaee = Intern konsistens: relasjonen og konstantene slik de er trykt i NASA TR R-376, en halvstegs konvergenskontroll, og den forventede rekkefølgen av oppvarmings- og deselerasjonstopper. DET SOM IKKE ER DEKKET: ingen publisert oppvarmingsverdi er sammenlignet (Stardust-artiklene oppgir en konstruksjonsgrense og et konvektivt-pluss-strålings-estimat på omtrent { "1200" } W/cm2, som en bare konvektiv relasjon ikke kan matche); ingen strålingsoppvarming, veggtemperatur- eller katalysekorreksjon, eller respons fra varmeskjold.

seg-1b96577665fc = Radiometri, MTF, relativ kantrespons og GIQE { "4" } NIIRS for elektro-optisk avbilder

seg-38902593e841 = Signal-til-støy-budsjett for nadir-avbilder (lambertiansk scenestråling, kameraligningen, skudd-, mørk-, lese- og kvantiseringsstøy), system-MTF ved Nyquist som produktet av diffraksjon fra uhindret apertur, detektorapertur, lineær utsmøring og gaussisk jitter, kantresponsen og den relative kantresponsen integrert fra denne MTF-en, Q = lambda F / p, og GIQE versjon { "4" } NIIRS uten MTF-kompensasjon. Kan kjøres som scenariotypen <c1/>.

seg-bb3a01edc95d = Lukkede former: diffraksjons-MTF ved halv avskjæring, rampekanten på ett piksel for en ren detektorapertur (RER { "1" }), normal-CDF-kanten for en gaussisk uskarphet (RER = erf(0.5/(sigma sqrt { "2" }))), skalering av skuddstøy, og GIQE { "4" }-koeffisientene slik de er publisert (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). DET SOM IKKE ER DEKKET: ingen ekstern avbilder, målt MTF eller vurdert bilde er sammenlignet; GIQE er en empirisk regresjon med sin egen feil; ingen spredt lys, atmosfærisk MTF, MTF-kompensasjon eller aliasing.

seg-07ca77a67207 = Tap fra tyngdekraft, luftmotstand, styring og mottrykk ved oppskytingsstigning

seg-7a1802cf2c80 = Plan tyngdekraftsvending-stigning for et flertrinnsfartøy over en ikke-roterende sfærisk jord gjennom US Standard Atmosphere { "1976" } (tetthet og trykk), med et pitch-spark, skyvekraft redusert av dysens mottrykk, trinnavbrenning ved eksakte stegrenser, og tapene fra tyngdekraft, luftmotstand, styring og mottrykk integrert ved siden av tilstanden. Kan kjøres som scenariotypen <c1/>.

seg-174ed29adbbe = Intern konsistens: den eksakte identiteten avbrenningshastighet = sum Isp g0 ln(m0/mf) minus de fire integrerte tapene (residual under { "1e-6" } m/s), Tsiolkovskijs ligning på en vertikal vakuumbrenning med tyngdekraft som eneste tap, og US76-trykkene ved havnivå og tropopause. DET SOM IKKE ER DEKKET: ingen publisert raketts tap er sammenlignet; ingen jordrotasjon, kystfase, struping eller styring utover sparket; konstant C_D; ikke en baneoptimaliserer.

seg-55e8345def8b = TWSTFT tovegsligning, usikkerhetsbudsjett og linkstabilitet med flicker og døgnvariasjon i ikke-resiprositet

seg-5ca5226c24ec = TWSTFT tovegsligningen løst for T_A - T_B med stasjonenes sende- og mottaksforsinkelser, den ionosfæriske Ku-bånd opp/ned-asymmetrien, transponderens forsinkelsesforskjell og Sagnac-leddene, mot sin eksakte foroverrettede modell; et usikkerhetsbudsjett i kvadratur med link-TDEV som type A-ledd; en tovegsserie med hvit og flicker fasestøy (Kasdin-Walter), en døgnvariasjon i ikke-resiprositet og en konstant resiprositetsrest; og raten, residual-RMS, TDEV og ADEV for oppgitte Circular T-, MJD-CSV- eller IGS RINEX-stasjonsklokkeserier. Kan kjøres som scenariotypen <c1/>.

seg-244f7396ac25 = Intern konsistens: foroverrettet modell og den løste ligningen stemmer til { "1e-15" } s, Sagnac-leddet er lik modulens uavhengige BIPM 2A omega/c^{ "2" }-sløyfeform, det ionosfæriske leddet er { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, og støyprosessene viser sine forventede TDEV-former. DET SOM IKKE ER DEKKET: ingen reell TWSTFT-måling eller kalibreringsrapport er sammenlignet; de oppgitte forsinkelsene og usikkerhetene er inngangsverdier, ikke målt; stabilitetene i oppgitte serier rapporteres, ikke validert.

seg-2f9be02c92bc = Numerikk for optisk atmosfære på skrå bane: Rytov-varians, scintillasjon, gamma-gamma-fadesannsynlighet, aperturmidling, sky og optisk dybde i klar luft

seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integrert langs en skrå bane for plan- og kulebølge-Rytov-variansen (opplink og nedlink), Andrews-Phillips-scintillasjonsindeksen og gamma-gamma-parametrene, gamma-gamma-fadesannsynligheten og fademarginen, aperturmidlingsfaktoren ved svak turbulens, den optiske skydybden for en flytende vannsøyle og den optiske dybden i klar luft fra Kim-sikt pluss Rayleigh, som erstatter det samlede atmosfæretapet i det optiske linkbudsjettet når en atmosfære oppgis. Kan kjøres innenfor scenariotypen <c1/>.

seg-7ca512adff99 = Numerikken sammenlignes med et uavhengig program (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } med { "30" } sifre, tanh-sinh-kvadratur på den opprinnelige høydevariabelen og Bessel-K gamma-gamma-tettheter) som ikke deler kode med Kshana, under terskler fastsatt før noen implementasjon fantes (xval/optical-atmosphere/PREREGISTRATION.md). HVORFOR MODELLED: den uavhengige referansen evaluerer de samme publiserte formlene, så den kontrollerer implementasjonen av de oppgitte formlene og ikke atmosfæren; intet ITU-R-valideringseksempel og ingen målt scintillasjons- eller skrå-bane-ekstinksjonsregistrering brukes (ITU-verdiene er et åpent lisensspørsmål og holdes utenfor repositoriet). Nivået på Cn2-profilen, sikten, skalahøydene for aerosol og molekyler, aperturmidlingens banelengde og momenttilpasningen som brukes til å bruke aperturmidling på gamma-gamma-parametrene er oppgitte inngangsverdier eller konvensjoner. En kildelinje i modulen noterer at en mye kopiert oversikt trykker den andre scintillasjonseksponenten som 7/6 der Andrews og Phillips oppgir 5/6; 5/6-formen er implementert

seg-a2faab92e760 = Værdrevet tilgjengelighet for optisk bakkested og avstandskorrelert stedsdiversitet

seg-7f4e4e763d62 = Tilgjengelighet for en optisk link mot en oppgitt linkmargin fra et lognormalt klima for skyenes flytende vann (ITU-R P.840-mengde, geometrisk-optikk-ekstinksjon) og det uavhengige gamma-gamma-turbulensfadet, linkmarginen som trengs for målrettet tilgjengelighet og taket ingen margin løfter, lognormale avbruddsvarigheter, hva-hvis for forbedringsteknikker, og en enfaktors gaussisk-kopula-nettverkstilgjengelighet der parkorrelasjonen er exp(-avstand/dekorrelasjonslengde). Kan kjøres som scenariotypen <c1/>.

seg-20eab6e9b925 = Intern konsistens: lukkede grenser og monotoni for diversitetsmodellen, den lukkede formen for skytaket og de lognormale avbruddsidentitetene. INGEN ekstern uavhengig referanse hevdes og ingen er sammenlignet: ingen målt tilgjengelighet for optisk bakkestasjon eller registrering av skyfri siktlinje brukes. HVORFOR MODELLED: skyklimaet (sannsynlighet for sky, median og spredning for den flytende vannsøylen, avbruddsvarigheter), uavhengigheten mellom sky og turbulens, gaussisk-kopula-formen, dekorrelasjonslengden og hver teknikkgevinst er forutsetninger; de medfølgende scenarioene oppgir ILLUSTRATIVE klimaer, ikke et datasett. Å oppgradere denne raden krever en sitert målt tilgjengelighetsregistrering og en terskel registrert før sammenligningen

seg-043ece801e72 = Kontinuitet i tidssynkronisering og avstandsmåling gjennom optiske avbrudd

seg-bb9cb3fe4180 = Avbruddsvarighetsfordelingen for et optisk sted koblet til den lukkede kystvariansen i holdover-klokkemodellen: feil i tidssynkronisering og avstandsmåling ved oppgitte avbruddskvantiler, holdover til en tidssynkroniseringsterskel, andelen av avbrudd og av avbruddstid innenfor den og tidssynkroniseringstilgjengeligheten A + U E[min(D, T_h)]/E[D], for de klassiske og kvanteklokkeklassene. Kan kjøres innenfor scenariotypen <c1/>.

seg-ab2a33c1b1a4 = Intern konsistens med holdover-modulen, bit for bit; INGEN ekstern uavhengig referanse hevdes. Klasse-PSD-ene er de syntetiserte lang-tau-gulvene holdover-modulen allerede bærer, så tallene arver dens oppgitte forbehold om at holdover til en stram terskel styres av det forutsatte rødstøygulvet og ikke av den siterte Allan-deviasjonen. Avbruddsvarighetene er en lognormal modell med oppgitte parametere, ikke en målt registrering av skyopphold

seg-b119df65d2a7 = Optisk linkmargin over tid: én seedet realisering av et steds vær

seg-06125f3cae90 = En valgfri <c1/>-tabell (duration, step, seed) får <c2/>-typen til også å skrive, per sted, én seedet realisering av den oppgitte stedsmodellen gjennom tid: skyepisoder (klare perioder eksponentielle, skyavbrudd lognormale med oppgitt middel og spredning, andelen tid i sky satt til oppgitt skysannsynlighet), én lognormal flytende vannsøyle per skyepisode, ett gamma-gamma-scintillasjonssample per steg, og ut fra dem linkmarginen, sky- og scintillasjonsfadene og link-opp-flagget, med realisert tilgjengelighet, skyandel, antall avbrudd og lengste avbrudd. Uten tabellen er resultatet dokumentet fra { "0.37" }. Trekningene går gjennom portable fordelings- og matterutiner, så native og wasm32 gir de samme bytene.

seg-d25e5d2449bd = Bare intern konsistens; INGEN ekstern uavhengig referanse hevdes og ingen finnes for en værrealisering. Kontrollene sammenligner ett trekk med den statistiske utdataen fra den samme modellen, så at en kontroll består sier at generatoren trekker fra de oppgitte fordelingene (trekkets tilgjengelighet og skyandel ligger innenfor forhåndsregistrerte toleranser for de oppgitte tallene), ikke at noe reelt sted oppfører seg slik. Serien er én realisering, ikke klimaet: tilgjengeligheten avviker fra den oppgitte med trekkets utvalgsfeil, og scintillasjonssampler ved ulike steg er uavhengige, en oppgitt forenkling av en prosess som dekorrelerer på millisekunder. Værinngangsverdiene forblir scenarioets forutsetninger.

seg-58cbf576c959 = TRK-2-18 Orbit Data File-leser og Mars rampet 2-veis Doppler-modell

seg-d1055650a77f = En leser for DSN Orbit Data Files (TRK-2-18): postgruppene på 36 byte (filetikett, identifikator, banedata, ramper per stasjon, klokkeforskyvninger, sammendrag, filslutt), og i hver banedatapost tidsmerket siden { "1950" }, nedlinks- og opplinksforsinkelser, observabel, stasjoner, datatype, bånd, gyldighet, kanal, romfartøy, referansefrekvensen på 46 bit og komprimeringstiden; rampestart- og sluttider, rater og startfrekvenser. Oppå den en rampet 2-veis X-bånd Doppler-modell (integrerte opplinksramper, rundtur-lysgangstid med Shapiro og troposfære, DSN-stasjoner gjennom IAU 2006/2000A CIO-kjeden og IERS EOP, stasjonstid) og en batch-banebestemmelse for Mars-satellitt (GMM-3-felt, tredjelegemer, SRP, drag).

seg-6d533149f6f0 = PDS3-etiketten som DSN-navigasjonens datakondisjoneringsprosess produserte med filen (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), kontrollert mot terskler forhåndsregistrert i xval/mro-odf/PREREGISTRATION.md før leseren fantes. MODELLED fordi én registrert terskel (radene i filslutt-tabellen, { "121" } i filen mot { "120" } i etiketten) ble bommet; etiketten er internt inkonsistent der. Trinn { "2" } (xval/mro-od/PREREGISTRATION.md, endringene A1 og A2 før det scorede resultatet): Doppleren predikert fra MRO-navigasjonsteamets rekonstruksjon (mro_psp5, NAIF) stemmer med den observerte rampede 2-veis Doppleren til { "12.5" } mHz på passeringer som ikke ble brukt i utviklingen, terskel oppfylt; den registrerte banebestemmelsen sviktet på den scorede buen (normalmatrisen ikke positivt definit) og ga ingen bane, så banetersklene ble ikke nådd. Kjøring { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, en dempet estimator, samme bue og terskler, en scoringsendring R2-A1 opplyst i docs/revisions) konvergerte: den estimerte banen ligger innenfor { "0.36" } km RMS ({ "0.53" } km maksimum) av rekonstruksjonen, terskler oppfylt, men etter-tilpasnings-Doppler-RMS er { "48.6" } mHz mot terskelen på { "30" } mHz, ikke oppfylt, så raden forblir MODELLED. DET SOM IKKE ER DEKKET: ingen estimert bane har oppfylt hver registrert terskel; ionosfære, solplasma og det meste av antenneforskyvningen (en radiell forskyvning på { "1.5" } m tilpasses på utviklingspassasjen) er ikke modellert.

seg-c7d292f14693 = Lukket-sløyfe MRP-tilbakekoblet holdningsregulering med reaksjonshjul

seg-f33781b74cc2 = Treghetspekende holdningsregulering av en stiv hub med tre eller flere balanserte reaksjonshjul: MRP-tilbakekoblingsloven L_r = -K sigma_BR - P omega_BR (Schaub og Junkins), minimumsnorm-motormomenter for hjulene G_s u = -L_r begrenset til hvert hjuls grense, den koblede hub- og hjuldynamikken der hubens treghet bærer hjulenes spinntreghet, kvaternion-kinematikk, RK4 med null-ordens hold. Kan kjøres som scenariotypen <c1/> (sann-tilstand-sløyfe).

seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; bsk-hjulet kjørt som et eget verktøy, aldri lenket eller vendoret): romfartøy-hub, reactionWheelStateEffector (BalancedWheels, momentgrense på), simpleNav, inertial3D, attTrackingError, mrpFeedback (uten integralledd) og rwMotorTorque ved dt = { "0.1" } s med sin RK4, mot Kshanas egen implementasjon på tre tilfeller (tre ortogonale hjul; en firehjuls pyramide; et mettende firehjulstilfelle), terskler forhåndsregistrert i xval/aocs-basilisk/PREREGISTRATION.md før koden og kjøringen. Alle terskler holdt ved første kjøring. DET SOM IKKE ER DEKKET: sensorstøy i sløyfen, integraltilbakekobling, sporingsstyring, hjulfriksjon, jitter, hastighetsgrenser og effekt, ethvert reelt romfartøys forsterkninger; sammenligningen kontrollerer implementasjonen av loven og dynamikken mot en uavhengig, ikke en flyregulator.

seg-455dc946c965 = Multiplikativ EKF-holdningsestimering fra et gyro og en stjernesporer

seg-553d043438b4 = Lefferts-Markley-Shuster multiplikativ EKF: holdningsfeil i kroppssystemet og gyrobias-tilstander, propagering med gyrorate minus biasestimatet og Farrenkopfs diskrete prosessstøy (vinkel- og raterandomvandring), stjernesporeroppdateringer med residualen { "2" } vec(q^-1 q_st) i Joseph-form, og den multiplikative tilbakestillingen; en diskret Farrenkopf-simulator for gyro og stjernesporer. Typen <c1/> kan lukke reguleringssløyfen på sitt estimat.

seg-846cb1eeb35c = Intern konsistens: filterets normaliserte estimeringsfeil i kvadrat mot fasit simulert fra de samme sensormodellene over Monte Carlo-seeds, og konvergens av holdnings- og biasestimatene. DET SOM IKKE ER DEKKET: ingen ekstern estimator eller flydata er sammenlignet (Basilisk { "2.9.1" } har ingen MEKF-modul); sensormodellene er lærebokversjonene, uten skjevstilling, skalafaktor eller effekter av stjernesporerens synsfelt.

seg-059732bda693 = Wahba/TRIAD/QUEST holdningsbestemmelse

seg-3ee6e56d790f = Optimal treakset holdning fra vektede vektorobservasjoner (stjerne-/sol-/magnetometerretninger): den deterministiske tovektor-TRIAD, Davenports q-metode (den eksakte minimereren av Wahba-tapet — den optimale kvaternionen er egenvektoren til den største egenverdien til Davenport-matrisen K på { "4" }×{ "4" }, løst med en symmetrisk Jacobi-egenverdiløsning), og QUEST (Newton/sekant-rot av Ks karakteristiske ligning med start i Σ vekter, deretter gjenvinning av kvaternionen fra Gibbs-vektoren)

seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }) — Kabsch/Markley SVD-løsningen av Wahbas problem, en genuint uavhengig algoritme (SVD av holdningsprofilmatrisen) og kodebase fra kshanas Davenport-K-egenverdiløsning / QUEST-karakteristisk-rot-metode, som beregner den SAMME entydig definerte Wahba-optimale holdningen. På støyfrie vektede vektorobservasjonssett gjenskaper TRIAD, q-metoden og QUEST scipys optimale rotasjon til <{ "1e-9" } rad (sammenlignet via den fortegnsinvariante holdningsfeilvinkelen). Den støyende Monte Carlo-statistiske påstanden «optimal slår TRIAD» forblir MODELLED (ingen ekstern uavhengig referanse); bare punktretnings-enhetsvektorobservasjoner — ingen modellering av sensorens synsfelt/bias/tidskorrelasjon, og QUEST er singulær ved { "180" }° (q-metoden dekker det tilfellet)

seg-cd342cc48afc = GNSS kvadratlov-innhentingsdeteksjonsstatistikk

seg-6d97452de33e = Kvadratlov (ikke-koherent) innhentingsdetektor over et kodefase × Doppler-søk: falsk-alarm-sannsynlighet (sentral χ² med 2M frihetsgrader), terskelen som oppnår en målsatt P_fa (χ² CDF invertert ved halvering), og deteksjonssannsynlighet (ikke-sentral χ² med ikke-sentralitet 2M·ρ for SNR ρ etter korrelasjon per celle), med den generaliserte Marcum Q-funksjonen Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — en uavhengig algoritme (fortsatt-brøk ikke-sentral/sentral χ²) fra kshanas ufullstendige gammaserie (raim::chi2_cdf / noncentral_chi2_cdf), som beregner den samme entydig definerte deteksjonsstatistikk-KJERNEN: den generaliserte Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²), deteksjonssannsynligheten P_d, falsk-alarm-sannsynligheten P_fa og inversjonen P_fa→terskel, stemmer til ~{ "1e-6" } — det samme uavhengighetsgrunnlaget som den validerte raden «RAIM/ARAIM integrity statistical kernel». KUN KJERNEN: CFAR celle-midling per celle og binnedeling av kode/Doppler-tap forblir MODELLED

seg-77f425a38aa2 = GNSS bærebølgefase heltallsflertydighetsløsning (LAMBDA)

seg-410ce8b6cebf = Heltalls minste kvadraters flertydighetsfastsetting på LAMBDA-måten: en volumbevarende heltalls (Z) dekorrelerende transformasjon (heltalls-Gauss størrelsesreduksjon av L D Lᵀ-faktoren) + et eksakt Schnorr–Euchner dybde-først branch-and-bound heltalls minste kvadraters søk, med forholdstesten på de to beste kandidatene (den validerte påstanden); pluss den lukkede bootstrapped suksessraten P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), kontrollert bare internt og utenfor den validerte påstanden

seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (kildefilen lambda.c, T. Takasu, BSD-2-Clause), en uavhengig LAMBDA-reduksjon og MLAMBDA-søk kompilert fra C og kjørt som et verktøy, på { "300" } tilfeldige kovarianser (n { "2" } til { "10" }): heltalls minste kvadrater har en entydig minimerer, så de fastsatte heltallene må være identiske ({ "0" } avvik) og de to beste kvadrerte normene, som mater forholdstesten, stemmer til { "1e-9" } relativt (målt { "5.6e-13" }); toleranse fastsatt før sammenligningen. Validert påstand: ILS-løsningen og dens to beste normer. RTKLIB beregner ikke den bootstrapped suksessraten, som forblir kontrollert internt mot en Monte Carlo av avrundingsprosessen; Z-transformasjonens invarianter og brute-force-oppregningen beholdes som støttekontroller. Bare heltalls-Gauss-dekorrelasjon (omordningspermutasjonene i den fulle LAMBDA-reduksjonen fremskynder søket, men endrer verken det eksakte ILS-svaret eller den bootstrapped raten)

seg-4ad1ec05610f = B-plane-sikting og patched-conic tyngdekraftassistanse

seg-d249aea7c3ea = Hyperbolsk forbiflyvningsgeometri (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, svingevinkel δ={ "2" }·asin(1/e), siktefeil |B|=|a|·√(e²−{ "1" })), B-plane Ŝ/T̂/R̂-målpunktsystemet og B·T̂/B·R̂-dekomposisjonen, og en patched-conic tyngdekraftassistanse (v∞-størrelsen bevart, retningen avbøyd med δ, heliosentrisk Δv={ "2" }·v∞·sin(δ/2) uten drivstoffkostnad) med Tisserand-parameteren T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

seg-8e82da17a463 = CRPA anti-jam gruppestråleforming

seg-1744f527b4d1 = Nulling med kontrollert-mottaksmønster-antenne: komplekse gruppestyringsvektorer a(û)=exp(j·k·pₙ·û), deterministisk nullstyring (enhetsforsterkning mot SV, eksakte nuller mot opptil N−{ "1" } jammere via minimumsnormen w=Aᴴ(AAᴴ)⁻¹b), og adaptive MVDR-vekter w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) som selvstyrer dype nuller mot sterke interferenskilder (med en kompleks lineæralgebrakjerne skrevet fra bunnen)

seg-8016dae66350 = numpy.linalg / scipy.linalg (LAPACK zgesv kompleks løsning) — en uavhengig lineæralgebra-kodebase fra kshanas fra-bunnen-kompleksekjerne, som beregner de SAMME entydig definerte vektene: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) og minimumsnorm-nullstyring w=Aᴴ(AAᴴ)⁻¹b, pluss de resulterende gruppeforsterkningene, stemmer til ~{ "1e-9" } — samme klasse uavhengig referanse som de validerte radene for DOP (gnss_lib_py) og Fisher-informasjon (numpy). MODELLED smalbånds fjernfelts gruppe med identiske isotrope elementer — ingen gjensidig kobling, avvik per element, begrenset båndbredde (STAP) eller feil i estimering av styringsvektor

seg-f2c973f14d52 = IEEE-1139 potenslov-klokkestøy + flicker-FM-gulv

seg-4a0159558671 = Den fem-koeffisienters IEEE-1139 PSD↔Allan-varians-omregningen S_y(f)=Σh_α f^α → σ_y²(τ) (hvit/flicker PM, hvit/flicker/random-walk FM), flicker-FM-gulvet σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) som et førsteklasses tilpassbart ledd, og en ikke-negativ FM-familietilpasning i { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" }-basisen som gjenvinner gulvet driftbasisen { "{" }1/τ,τ,τ³{ "}" } ikke kan representere

seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; Kasdin & Walter { "1992" } / Vernotte { "2015" }-koeffisienter) — en uavhengig tredjepartskodebase og siteringslinje som beregner den SAMME entydig definerte IEEE-1139 PSD→Allan-omregningen σ_y(τ) for hver av de fem potenslov-støytypene. kshanas powerlaw::allan_deviation stemmer med allantools' lukkede former (hvit/flicker-FM, RW-FM og hvit PM til <{ "5e-9" } relativt; flicker-PM til ~{ "1e-5" } — det genuine uavhengighetssignalet, siden kshana bruker NIST-SP-1065-tabellkonstanten { "1.038" } mot allantools' fulle 3γ−ln2), og flicker-FM-gulvet √({ "2" } ln2·h_{ "{" }-1{ "}" }) stemmer med allantools over hele stigen — den samme terskelen som de validerte radene for MDEV/TDEV/Theo1/MTIE klarer. MODELLED stasjonær potenslovmodell — ingen deterministisk drift-ledd (τ²); koeffisienter per enhet / målte gulv forblir modellerte

seg-cc1ac065e684 = Utveksling av CCSDS OEM kovarians-blokk

seg-ec4d44e7cf78 = Serialiser og tolk CCSDS { "502.0" } OEM COVARIANCE_START…COVARIANCE_STOP-blokken — den { "6" }×{ "6" } posisjon/hastighet-kovariansen skrevet som sin nedre trekant med 21 elementer (kanonisk rekkefølge CX_X … CZ_DOT_Z_DOT) med valgfri COV_REF_FRAME, som utfyller den eksisterende OEM-tilstandsvektorskriveren/-tolkeren slik at kovarianser fra banebestemmelse og filtre går tur-retur i standardformatet

seg-891b86506bf6 = oem { "0.4.5" } (MIT, https://pypi.org/project/oem/) — den SAMME uavhengige CCSDS-502-tolkeren som den validerte raden «CCSDS OEM interoperability» stoler på, en helt separat kodebase (egen KVN-tokenizer, tilstandsmaskin for kovariansseksjonen og numpy-matrisesammenstilling). kshana sender ut et fullt OEM-segment med sin umerkede nedre-trekant-COVARIANCE-blokk med bare tall; oem tolker den og rekonstruerer den symmetriske { "6" }×{ "6" }, som stemmer med kshanas inngangskovarians element for element til f64-avrundingsfeil — en genuin bibliotek-mot-bibliotek-tur-retur for utveksling (sammenlignet mot oems rekonstruksjon, ikke en kshana-tolkning på nytt), som lukker radens tidligere gap «ingen tredjeparts-fixture»

seg-ae061c7f082c = INS/TRN-kystfeilvekst og terskelkryssinger

seg-7bacdc8aa0d8 = Budsjett for posisjonsfeil mot kystvarighet bygd fra IMU-koeffisienter, der hver feilkilde (akselerometerbias, gyrobias, hastighetsrandomvandring, vinkelrandomvandring, skalafaktor under cruise og under vedvarende spesifikk kraft) propageres gjennom en ni-tilstands lokalnivå-INS-feilmodell med Schuler-tilbakekobling (inertial::coast::ErrorDynamics etter Groves 2. utg. kap. { "14" }: holdnings-, hastighets- og posisjonsfeil, vertikalkanalen med sin tyngdegradient, WGS-84-radier og normaltyngde, en plan plattform på nordlig kurs ved den konfigurerte hastigheten, latitude_deg og height_m; systematiske ledd ved en utvidet matriseeksponensial, randomvandringer ved Van Loan), de flate-jord-monomene beholdt bare som leading_order_m; bidrag kombinert under en oppgitt regel (rss / lineær sum / deterministisk sum med stokastisk rss); kystvarighetene som når oppgitte posisjonsterskler fra kallende kode ({ "10" } m og { "50" } m som standard) lokalisert ved en foroverskanning etter første kryssing (first_crossing_s, siden de Schuler-begrensede kurvene ikke er monotone), med dominerende kilde ved hver kryssing; og en TRN-begrenset modus som gir det største terrengposisjonsbestemmelsesintervallet som holder hver terskel. Kan kjøres som scenariotypen <c1/>

seg-a971ff07592a = Arbeidssyklus for apertur mellom navigasjon og kommunikasjon

seg-5b0ba97379bf = Én kjøring tar en kontaktplan (en liste over aos_s/los_s-vinduer, der hvert ber aperturen om navigasjon eller kommunikasjon — det samme vindusvokabularet som <c1/> sender ut, konvertert av <c2/>), et aperturantall og en eksplisitt arbitreringspolicy, og returnerer navigasjonsarbeidssyklusen, kommunikasjonsarbeidssyklusen, tomgangsarbeidssyklusen og avbruddet per økt. Policyen er en inngangsverdi med en dokumentert standard (<c3/>; også <c4/> og ikke-preemptiv <c5/>), og rapporten bærer den løste policyen, dens fulle definisjon og definisjonene av arbeidssyklus og avbrudd, fordi et arbeidssyklustall oppgitt uten sin arbitreringsregel ikke er reproduserbart. Planen er et eksakt intervallsveip over vindusgrensene, så et vindu som slutter nøyaktig der det neste begynner aldri konkurrerer, og apertursekunder for navigasjon, kommunikasjon og tomgang akkumuleres uavhengig i det ene sveipet. Kan kjøres som scenariotypen <c6/>

seg-656fd7d44a9e = Intern konsistens, fra tre størrelser beregnet med ulike uttrykk i samme sveip og deretter krevd å gå opp. Apertursekunder for navigasjon, apertursekunder for kommunikasjon og apertursekunder for tomgang akkumuleres hver for seg — tomgang fra (aperturer − |betjent|) per elementært intervall, aldri som en rest — og summen sjekkes mot aperturer × horizon_s, noe en feilparentesert grense, et dobbelttalt intervall eller et utelatt intervall bryter umiddelbart; de betjente tidene per økt kreves separat å summere tilbake til de to tjenestetotalene. Planleggerens strukturelle egenskaper måles i stedet for å antas: betjent tid sjekkes som ikke-avtagende i aperturantallet over { "200" } pseudotilfeldige planer for alle tre policyene (ikke åpenbart for den ikke-preemptive policyen, der en ekstra apertur endrer hvem som holder hva ved hver senere grense), og grenseregnestykket festes ved paret som berører hverandre / overlapper med ett sekund, der en off-by-one ellers ville skjules. Passeringsprediktor-broen kontrolleres mot utdata fra <c1/>: med én apertur og ingen konkurrerende tjeneste er apertursekundene for navigasjon lik prediktorens egen summerte passeringsvarighet. Ingen ekstern uavhengig referanse hevdes og ingen finnes: funksjonen erstatter håndregning i stedet for å kontrolleres mot den, den medfølgende kontaktplanen er illustrerende og ikke fløyet, og ingen operativ planlegger publiserer et par av plan og svar med arbitreringsregelen oppgitt — et arbeidssyklustall beregnet under en uoppgitt policy er ikke sammenlignbart med ett beregnet under en oppgitt, og policyavhengigheten er målt (navigasjonsarbeidssykluser på 100/150 mot 50/150 på den identiske planen). Slewtid og omkoblingstid, datavolum, bufferstatus, energi og linklukking er utelatt i rapportens merkelapp i stedet for å bli modellert i det stille

seg-43cd7aa7ab53 = RF-jamming av månens overflatenavigasjon (J/S per satellitt)

seg-e0566f37ad8f = Månenativ jammer-til-signal-forhold, effektiv C/N₀ og tap av lås for en selenografisk overflatebruker under en jammer på månens overflate (eller hevet), over den illustrerende konstellasjonen i Moonlight/LCNS-klassen fra offentlige kilder. Setter sammen den åpne jammingkjeden (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) med den åpne månehimmelgeometrien (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri utledes på nytt. I motsetning til jord-typen <c1/> er signalleddet ikke en fast mottatt effekt: hver satellitts isotrope mottatte effekt er dens egen linkbudsjett-EIRP − FSPL(skrå avstand), så J/S varierer fra satellitt til satellitt med månens avstand og elevasjon. Gir EN RAD PER SYNLIG (epoke, satellitt)-LINK som JSON og som en *.table.csv-artefakt, med begge mottatte effekter som J/S er differansen mellom skrevet ut ved siden av; aggregerte kvalitetsmål står ved siden av denne tabellen, aldri i stedet for den. Kan kjøres som scenariotypen <c2/>

seg-2a4393ae7c52 = Sammensetningskryss-kontroll mot en uavhengig kodebane i samme repositorium: hver J/S per link utledes på nytt som differansen mellom to linkbudsjetter beregnet med linkbudget::received_signal_power_dbw, hvis frirom-tap er det enkle uttrykket { "20" }·log10(4πRf/c) i stedet for tre-leddssummen jamming::free_space_path_loss_db bruker — de to stemmer til < { "1e-9" } dB på hver rad (målt verste tilfelle { "7.11e-14" } dB, altså flyttallsavrunding). Interferenskjeden den setter sammen er separat eksternt forankret i tests/gnss_denied_jamming_resilience_reference.rs (uavhengig numpy/scipy-utledning på nytt av J/S og effektiv C/N₀ festet til Kaplan & Hegarty §{ "9.4" }, pluss JammerTest { "2024" } målt C/N₀, Zenodo 10.5281/zenodo.15910563); månegeometrien den setter sammen er lunar_service/lunar-geometrien med sine egne uavhengige referanser. Lukket-form identiteter kontrollert her: en halvert jammeravstand legger nøyaktig { "20" }·log10({ "2" }) dB til hver rad; J/S er nøyaktig invariant for brukerantennens boresight-forsterkning mens C/N₀ flytter seg med nøyaktig denne forsterkningen; en elevasjonsmaske endrer ingen gjenværende rad bit for bit. Selve raden forblir ReferenceImpl/Modelled: ingen målt jammingkampanje på månen finnes å validere mot, og konstellasjonen er en illustrerende geometri i Moonlight/LCNS-klassen fra offentlige kilder, ikke en fløyet efemeride

seg-4c116e25c5c5 = Nektelseskontur på månen med et usikkerhetsbånd fra den målte C/N₀-spredningen

seg-77828c25f3ab = Rapporten <c1/> hviler ikke lenger nektelseskonturen på én skalar. Den sender ut hele den målte fordelingen av ønsket-signal-C/N₀ over tabellen per satellitt — n, min, p05, p25, median, p75, p95, maks, middel, utvalgsstandardavvik og utvalgets egen asymmetri (p95 − median) − (median − p05) — ved siden av radene per link, som er uendret. Konturen rapporteres så ved hver av disse ordensstatistikkene under BEGGE nektelseskriteriene motoren kjenner, aldri det ene i stedet for det andre: det etablerte effektforholdskriteriet (J/S = { "30" } dB, den samme terskelen som attack_surface og tracking_loop bruker, og kriteriet bak <c2/>-kolonnen i den utgitte tabellen for lunar link-jamming), og kriteriet tap av lås (effektiv C/N₀ som faller til tracking_threshold_dbhz), som er kriteriet rapportens egen links[].status-kolonne scores med. Hvert konturpunkt oppgis på begge aksene i nektelsesplanet — jammer-EIRP som kreves ved scenarioets avstand, og nektelsesavstanden ved scenarioets EIRP — slik at båndet er et intervall på de samme aksene et konturplott tegnes på. Båndkantene ER contour(p05) og contour(p95): den samme lukkede avbildningen brukt på utvalgets egne kvantiler, ikke en sigma tilpasset utvalget og ikke median ± k·stdev, og rapporten sier det i en band_definition-streng ved siden av tallene. stdev sendes ut for kontinuitet og brukes av ingenting. En kvantil hvis C/N₀ allerede er ved eller under sporingsterskelen har ingen endelig nektende J/S; disse kolonnene sendes ut som null med en talt årsak i stedet for som en uendelighet eller en avkortet radius

seg-f7457156f960 = Intern konsistens mot motorens egne foroverfunksjoner, som er alt denne funksjonen ærlig kan hevde. Hvert konturpunkt er en lukket-form inversjon, og hver inversjon kontrolleres ved å sende svaret tilbake gjennom FOROVERFUNKSJONEN rapportens egne rader ble scoret med: J/S-kolonnen gjennom jamming::effective_cn0_dbhz (som må returnere tracking_threshold_dbhz til < { "1e-9" } dB-Hz), avstandskolonnen gjennom jamming::free_space_path_loss_db og jamming::j_over_s_db (samme J/S til < { "1e-9" } dB), EIRP-kolonnen gjennom jamming::j_over_s_db ved scenarioets egen avstand. Konturen kontrolleres videre å være GRENSEN for nektelsesmengden og ikke et punkt inni den — lock_status mister låsen på en streng ulikhet, så dommen måles å snu fra DEGRADED til LOST over { "1e-4" } dB J/S på hver side av konturen, noe en kontur som er feil med en epsilon ville svikte. Den sterkeste kontrollen er per link og ikke per kvantil: å bruke den samme avbildningen på hver rads egen C/N₀ gjenskaper rapportens statuskolonne nøyaktig — { "0" } uenigheter på { "38" } av { "38" } rader ved det dokumenterte arbeidspunktet (kind = lunar-jamming, hver inngangsverdi standard unntatt jammer.range_m = { "25 000" } m), der { "26" } rader er LOST og { "12" } ikke er det. Monotoni er målt, ikke antatt: { "20 001" } sampler over [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } brudd på en strengt avtagende avstand og en strengt økende nødvendig effekt, så kvantilrekkefølgen i båndet er vist og ikke bare hevdet. ExternalDataset avslås og Validated med den: ingen målt jammingkampanje på månen finnes å sammenligne en nektelsesradius mot, konstellasjonen er en illustrerende geometri i Moonlight/LCNS-klassen fra offentlige kilder og ikke en fløyet efemeride, og konturens inngangsverdier (EIRP, jammereffekt, antenneforsterkninger, støytemperatur) er representative størrelser. ReferenceImpl ble også vurdert og avslått — inversen og foroverutrykket er den SAMME algebraen lest i to retninger, så tur-retur fanger transkripsjons- og fortegnsfeil men er ikke en uavhengig implementasjon; å kalle det en kryss-kontroll ville være det lånte-uavhengighet-grepet matriseinvariantene finnes for å hindre. Hva båndet gir er målt og sitert og ikke hevdet: ved dette arbeidspunktet er enkeltskalar-konturen { "27.402916" } km og setter { "25" } km på den nektede siden for alle { "38" } rader, mens båndet { "21.256108" } .. { "29.921360" } km inneholder arbeidspunktet og derfor rapporterer splittelsen tabellen faktisk viser. De to kriteriene er også målt å være uenige — effektforholdsbåndet ({ "38.186527" } .. { "53.691675" } km) inneholder ikke { "25" } km i det hele tatt — og derfor skrives begge ut

seg-2d3944107ba0 = Deteksjonsstyrke for kryssmodalitets integritetsmonitor

seg-38bc7c0bfe57 = Rapporten hybrid-optical-rf oppgir hva kryssmodalitets-kjikvadratmonitoren faktisk kan DETEKTERE, ikke bare at den består et feilfritt tilfelle: den minste detekterbare biasen per overvåket akse (øst, nord, opp, klokke) ved scenarioets oppgitte sannsynligheter for falsk alarm og oversett deteksjon, deteksjonsstyrkekurven på hver side av den, det støyfrie biasmultiplumet der den realiserte statistikken først krysser terskelen, og tiden til deteksjon for en biasrampe ved en oppgitt rate. Feil injiseres også gjennom den virkelige monitoren, og statistikken den returnerer rapporteres ved siden av den analytiske prediksjonen

seg-38cabd4921c1 = Gjenvekst av kovarians etter overlevering mot varslingsgrensen

seg-9287268bbada = Rapporten hybrid-optical-rf eksponerer filterets prosessstøymodell og oppgir hvor lenge løsningen etter overleveringen holder seg innenfor varslingsgrensen: for begge overleveringsretninger bærer den kovariansen per akse overleveringen etterlot, propagerer den fremover under en oppgitt randomvandrings-prosessstøy, og rapporterer tidspunktet da den dekningsskalerte 1σ når varslingsgrensene for horisontal, vertikal og tid, hvilken grense som binder først, tidskonstanten for variansfordobling, og en samplet kystprofil som omslutter kryssingen. Prosessstøy-PSD-ene, dekningsfaktoren og varslingsgrensene er alle inngangsverdier med dokumenterte standarder

seg-c85b822227f3 = Ingen ekstern uavhengig referanse. Kryssingen er en lukket-form løsning av randomvandringens variansvekst, og testene beregner den på nytt uavhengig fra verdiene rapporten selv publiserer og ikke fra emitterens interne tilstand. Startkovariansen er festet bit for bit til sporet den eksisterende overleveringsblokken allerede rapporterte, så kysten ikke kan propagere en kovarians ingen andre så. Prosessstøy-PSD-ene er MODELLED representative inngangsverdier og kryssingstidene skalerer direkte med dem, noe skaleringstesten oppgir som en målt egenskap og ikke en påstand. ExternalDataset avslås med vilje: kysttiden er en direkte funksjon av to modellerte PSD-er og av varslingsgrenser som selv er representative, og det finnes ingen målt optisk/RF-overleveringskyst på månen å sammenligne mot. En ekstern uavhengig referanse her ville kreve en publisert kurve for kovariansvekst etter overlevering eller holdover-nøyaktighet for en sammenlignbar mottaker med oppgitt prosessstøymodell, kontrollert til en toleranse

seg-a3b8272862aa = Antennemønster utenfor boresight i månegeometri-eksporten

seg-27d246503a48 = Eksporten av geometri per satellitt bærer, per (epoke, satellitt), vinkelen utenfor boresight VED SATELLITTEN og sendeforsterkningen mot stedet fra det virkelige jevnt belyste sirkulære aperturmønsteret (Airy), og rapporterer antallet i strålen under dette mønsteret VED SIDEN AV antallet i strålen under den symmetriske tilnærmingen fra forsterkning til stråleåpning (θ_3dB[deg] = √(31000/G_lin)), med differansen sendt ut som en eksplisitt korreksjon i links, i satellitter per epoke, og som verste enkeltepoke. Begge implisitte aperturvirkningsgrader for tilnærmingen sendes ut ({ "0.641" } mot regelen { "70" }·λ/D grader den siteres med, { "0.920" } mot en uniform sirkulær apertur), slik at virkningsgraden den stilltiende forutsetter er oppgitt og ikke utledet. Av som standard: blokken vises bare når både et eksportsted og en apertur er oppgitt

seg-6fbfa234ef3e = Tap av lås og spoof-innfanging i sporingssløyfen under interferens

seg-f78c1f28a3f7 = Tap av lås beregnet fra sløyfedynamikk i stedet for et effektforhold: bærebølge (Costas) og kode (ikke-koherent tidlig/sen) 1σ termisk jitter mot C/N₀ med kvadreringstapet, mot de oppgitte reglene 3σ_PLL + θ_e ≤ { "45" }° og 3σ_DLL + rampeforsinkelse ≤ d/2 chip; C/N₀-terskler for fall og gjenlåsing med den bindende sløyfen navngitt og hysteresen UTLEDET fra den bredere innfangingsbåndbredden og ikke hevdet; den deklarerte tiden til tap av lås fra en tosterskels låsedetektor med bekreftelsesventetider, rapportert separat fra den fysiske faseflukttiden (Viterbis midlere tid mellom syklusslipp, i log₁₀ s fordi den spenner over hundrevis av dekader); den største kodeslewen og bærebølge-Doppler-raten offerets sløyfer kan følge; og NEKTELSESRADIUSEN sløyfedynamikken innebærer, rapportert ved siden av den eksisterende effektforholdsradiusen med deres fortegnsbehæftede differanse som et eget navngitt felt. Kan kjøres som scenariotypen <c1/>

seg-69155fb79ebd = Koordinatkovarians for månens VLBI-stasjoner fra en sporingsplan

seg-141285301f58 = Delay-partialer akkumulert over en plan av grunnlinjer × epoker til en Fisher-informasjonsmatrise, invertert til stasjonskoordinatkovariansen og stasjonssigma per koordinat, som erstatter en forutsatt isotrop ekvipartisjonslink fra en skalar forsinkelsespresisjon. Tilstanden bærer jordfaste (ITRS) stasjonskoordinater, så Jacobianen er den inertiale partialen rotert med hver epokes GCRS→ITRS-matrise og jordrotasjonen er det som gjør disse koordinatene observerbare — rapporten MÅLER det jordfaste siktlinjesveipet og fyrets deklinasjon og antar dem ikke. Rang, datumdefekt, kondisjonstall, informasjonsspekteret og null-rommet til det frie nettverket sendes ut ved hver kjøring, og ved rangmangel publiseres hovedsigmaen som NULL med en status i stedet for å leses ut av en nesten singulær invers. Ekvipartisjonsverdien c·σ_τ·√(g/N) for SAMME plan skrives ut ved siden av den beregnede med deres forhold, sammen med den isotrope sporgrensen √(p/trace(M)) som AM-HM gjør til et hardt gulv. Kan kjøres som scenariotypen <c1/>

seg-0f4d023fe2d4 = Koordinatkovarians for et punkt på månens overflate fra en VLBI-forsinkelsesplan, holdt atskilt fra den for jordstasjonen

seg-47352405133b = Et tredje datumvalg, <c1/>, som holder hver jordstasjon fast og estimerer BARE FYRETS månefaste koordinater — konfigurasjonen en usikkerhet for et punkt på månens overflate faktisk oppgis for, siden jordstasjonenes koordinater er en inngangsverdi til forsinkelsesmodellen og ikke en ukjent i den. Den finnes fordi stasjonsnivåkovariansen og overflatepunktkovariansen er FORSKJELLIGE STØRRELSER atskilt av vektarmen ρ/B, og ingenting hindret tidligere at den ene ble oppgitt mot den andre. Den utsendte blokken <c2/> bærer ρ, den lengste grunnlinjen, vektarmen, overflatepunktformen av ekvipartisjonslinken c·σ_τ·(ρ/B)·√(g/N), den beregnede sigmaen per fyrkoordinat og deres forhold — forholdet er null i stedet for misvisende når fyret ikke estimeres eller matrisen er rangmangelfull. B tas som den LENGSTE grunnlinjen som er til stede, den gunstigste, slik at forholdet bare kan undervurdere. Kan kjøres som <c3/> med <c4/>, som avvises med en melding som navngir den manglende inngangsverdien når fyret ikke estimeres

seg-18096ae23d96 = Lukket-form identiteter, uten at noen ekstern uavhengig referanse hevdes eller finnes. Vektarmen kontrolleres mot ρ/B og de to ekvipartisjonsformene mot hverandre til { "1e-15" } — algebraiske identiteter, så de fanger en koblingsfeil og ingenting annet, og er merket som slike. Det vesentlige resultatet er MEASURED og ikke hevdet: en forsinkelse fra en fast grunnlinje begrenser fyrets RETNING, så siktlinjekomponenten når informasjonsmatrisen bare gjennom nærfeltets avstandsledd, og testen leser den resulterende anisotropien av det utsendte spekteret i stedet for å utlede den. AM-HM gjør √(p/trace(M)) til et hardt gulv, så en isotrop ekvipartisjonslink bare kan UNDERVURDERE, og beregnet-over-ekvipartisjon-forholdet er nøyaktig anisotropien den forkastet. MEASURED på paret av Goldstone-lignende/Canberra-lignende stasjoner hvis korde er { "10726.748" } km: over { "112" } samplede dager tillater { "36" } ingen gjensidig synlig epoke i det hele tatt ved en maske på { "10" }°, det mest noen gang gjensidig synlig er { "17" } av en plan med 49 sampler, og på de { "73" } brukbare dagene løper trekomponentforholdet fra { "113.9" }× til fire størrelsesordener mer, median { "1513" }×, mens en begrensning til de to tverrgående retningene siktlinjen ikke sulter gir { "3.94" }× til { "25.8" }×, median { "7.8" }×. HVA DENNE RADEN IKKE PÅSTÅR: noen av disse tallene som en egenskap ved en reell kampanje. Den fastslår at overflatepunktstørrelsen nå er BEREGNET og ikke antatt, og at den ikke i det stille kan byttes om med stasjonsnivåstørrelsen. Forblir ReferenceImpl/MODELLED: ingen publisert overflatepunktkovarians for månens VLBI finnes å validere mot, stasjonene og fyrstedet er illustrerende og ikke oppmålt, og efemeriden, klokkene, troposfæren og jordorienteringsparameterne holdes FASTE, så dette er en Cramér-Rao-grense for et redusert parametersett og optimistisk i seg selv. Den samme størrelsen på kjernebanen (fyret på DE440-Månen) er validert på sin egen rad, «…, kernel path»; på denne analytiske banen er den minste fyrsigmaen { "3.9" } % under den radens SPICE-referanse, og derfor forblir denne raden MODELLED

seg-8958521eedf7 = Koordinatkovarians for et punkt på månens overflate fra en VLBI-forsinkelsesplan, kjernebane

seg-8ac12ca0f272 = Fyrkovariansen med alle stasjoner faste i scenariet lunar-vlbi-fim (hver jordstasjon holdt, fyrets månefaste koordinater estimert alene) med fyret plassert på JPL DE440-Månen lest av motorens egen kjerneleser (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Bare månesentrum avviker fra den analytiske banen; IAU { "2015" }-kroppsrotasjonen, stasjonene, jordrotasjonen og lineæralgebraen er de samme. De validerte utdataene er observasjonssettet, informasjonsspekteret på { "3" } x { "3" }, rang og kondisjonstall, de tre månefaste fyrsigmaene og deres RMS, vektarmen og beregnet-over-ekvipartisjon-forholdet, på standardplanen. Kan kjøres som scenariet <c1/> med datum = "all-stations-fixed", estimate_beacon = true og planetary_kernel_path satt

seg-0315968c8214 = Differensiell PNT på månen — residualbudsjett for korreksjonslinken

seg-c6785166a44c = De tre leddene en differensiell korreksjon får mellom epoken den beregnes ved og epoken den brukes ved, hvert tidligere latt ligge som umodellert slingringsrom: oppmålingsfeil for referansestasjonen (korrelert på tvers av satellitter, uavhengig av grunnlinjen, ~{ "1" }:{ "1" } posisjonsoverføring og beviselig ikke DOP-forsterket), korreksjonsalderdom (den frosne banefeilvektoren projisert på nytt på siktlinjen motorens egen propagator setter satellitten på én latens senere, pluss c·σ_y(τ)·τ klokkedrift fra den kalibrerte potensloven), og uniform linkkvantisering over en eksakt full skala på ±(orbit_err + clock_err) med varians step²/12. Rapportert i både avstands- og posisjonsdomenet, ved siden av — aldri i stedet for — den eksisterende residualen og beskyttelsesnivået, med en latenskurve ved siden av enkelttallet

seg-29b8e6c12471 = Lukket-form identiteter og selvkonsistens: den uniforme kvantisererens varians step²/12, den eksakte kovariansoverføringen (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ som faller sammen til σ·PDOP for lik σ, oppmålingsleddets { "1" }:{ "1" }-overføring som en følge av û_user ≈ û_ref, og kvadraturlukking ved avslåing. PDOP-kryss-kontrollen mot orbit::dop deler normalmatrisen [−û, { "1" }], så den er en konsistenskontroll og er merket som det og ikke som en uavhengig referanse. Intet ExternalDataset er tilgjengelig eller hevdet: ingen månestasjon har en publisert oppmålt nøyaktighet, ingen differensiell korreksjonslink på månen har en publisert latens eller meldingsformat, og kvantiseringsresultatet er en lukket form og ikke en måling. RTKLIB — allerede den eksterne kodereferansen for enkeltdifferanse- og vektet-minste-kvadrater-kjernen — kunne drives med en bevisst feiloppmålt base for å bekrefte { "1" }:{ "1" }-oppmålingsoverføringen, men det er uavhengig kode over den samme førsteordens siktlinjealgebraen. STØRRELSENE ER MODELLED: oppmålingsstandarden er denne crate-ens egen tildeling for realisering av månens referansesystem og ikke en målt stasjon, latensen og antall bit er ILLUSTRATIVE inngangsverdier, og veksten i selve feilvektoren for den kringkastede efemeriden er ikke modellert i det hele tatt — oppgitt i den utsendte alderdomslovstrengen, fordi det er leddet som mest sannsynlig dominerer en reell link

seg-c42646ae4707 = Dekning og nøyaktighetskart for referansestasjon på månen

seg-1f9834b32629 = Monte Carlo-sveip av den differensielle PNT-modellen for månen over et brukerrutenett ved sørpolen og et døgn med epoker (typen <c1/>): for en differensiell referansestasjon på et kjent sted ved sørpolen, per punkt og over regionen, persentil av korrigert og ukorrigert posisjonsfeil (3-D, horisontal, vertikal), tilgjengelighet med en årsak for hver utilgjengelige epoke (user_lt4, station_missing_sat), dekning mot en terskel oppgitt før kjøringen, DO-229E-beskyttelsesnivåer, dekningsradiusen per asimutsektor, og korreksjonslinkbudsjettet ved stasjonen og ved det verste punktet. Ikke en påstand om ytelsen til noe reelt system; ikke tilknyttet eller støttet av noe byrå

seg-7ecf4b0038b0 = Terrenghorisontmasker for månen fra en oppgitt profil eller en polar DEM

seg-7102948907bc = Asimutavhengige horisontmasker per sted for typen lunar-station-coverage (referansestasjonen og hvert brukerpunkt) og rutenettet moonlight-service-volume og dets eksportsted per satellitt (hver eksportrad får clears_terrain), i skyline-tabellformatet fra { "0.36" } (skyline::Skyline, lineær i asimut med omslag ved { "360" } grader; en oppgitt profil og en DEM-horisont ved ett sted kombineres som sitt punktvise maksimum): en oppgitt [terrain] station_horizon eller user_horizon merket med sin kilde, og/eller en horisont strålemarsjert over en sørpolar stereografisk DEM (LRO LOLA-rutenettoppsettet for polene, lest fra en beskrivelse som fastsetter størrelse og SHA-256, eller en breddegrad/lengdegrad realdata::lola_dem-flis med [terrain] dem_tile_path, gjengitt med sin SHA-256) langs store sirkler på månekulen med eksakt krumning, fra en oppgitt masthøyde, ved et oppgitt asimutsteg og rekkevidde. En satellitt teller ved et sted når den klarer den flate mask_deg og horisonten ved sin asimut (lunar_service::topocentric); en epoke horisonten etterlater med færre enn fire satellitter i et punkt, der den flate masken gir fire, telles som den utilgjengelige årsaken terrain_masked. Den medfølgende DEM-en er et utsnitt av det offentlig tilgjengelige LOLA LDEM_75S_240M-produktet, { "5" } x { "5" } blokkmiddel-resamplet til { "1200" } m (data/lunar-dem/NOTICE.md). Når den mangler, beholder hvert sted den flate masken og hvert dokument er byte-identisk

seg-d37bb01e270b = Flerveis og mottakermaskinvareledd for referansestasjon på månen

seg-1103199f019b = Den valgfrie [receiver]-seksjonen i lunar-station-coverage (LRS-02): elevasjonsavhengig flerveissigma sigma(el) = a + b exp(-el / el0) hos brukeren og ved stasjonen (RTCA DO-229 luftbårne funksjonelle form, med a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } grader som standarder; på Månen er hver verdi ILLUSTRATIVE), hvit hos brukeren og førsteordens Gauss-Markov over epoker ved stasjonen (rho = exp(-dt / tau)); tidlig-minus-sen DLL termisk kodestøy sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); biaser mellom kanaler per kanal, konstante over et forsøk, hos brukeren og ved stasjonen. Stasjonsleddene går inn i korreksjonene, brukerleddene i de rå og korrigerte målingene, hver på sin egen seedede strøm. Når de mangler, er hvert dokument uendret

seg-4fbc7d86b491 = Lukkede former og statistikk av modellens egne trekk (InternalConsistency): DLL-formelen mot en håndberegning, DO-229-formen, nullgrunnlinjedifferansen mellom to mottakere, Gauss-Markov lag-1-korrelasjonen. Ingen måling av flerveis eller mottaker på månen finnes å sammenligne med; verdiene er ILLUSTRATIVE og ingenting her er en påstand om noen reell mottaker

seg-03796cb741b6 = Vekst i efemeridefeil for referansestasjon på månen over korreksjonslatensen

seg-13b0ae9a874a = Den valgfrie inngangsverdien orbit_err_growth_m_per_s for lunar-station-coverage (LRS-03): en korreksjon brukt latency_s etter at den ble beregnet går glipp av veksten g latency_s i den kringkastede banefeilen, g isotrop med 3-D RMS-rate, trukket per satellitt og forsøk på sin egen seedede strøm (avstand 1-sigma-rate tau / sqrt({ "3" })), oppå den frosne-feil-siktlinjeprojeksjonen på nytt. Når den mangler, er hvert dokument uendret. Et K5-tillegg til sammenligningen med publiserte påstander, forhåndsregistrert alene, kjører K5 ved { "0.001" }, { "0.01" } og { "0.1" } m/s (ILLUSTRATIVE)

seg-90307f07e0ef = Løsningsmodi for den lunare referansestasjonen: høydebegrensning, tre satellitter, vindu med statisk bruker

seg-366c7ad03fb2 = Den valgfrie [solution]-seksjonen i lunar-station-coverage (LRS-06): en høyde-pseudomåling lagt til som rad up . dx = e_h med oppgitt 1-sigma, vektet mot avstandsradene, et minimum på tre satellitter som bare er tillatt sammen med den, og en vektet minste kvadraters løsning over de siste window_epochs epokene med en felles statisk posisjon og én klokke per epoke (svaret fra et filter for en statisk posisjon uten prosessstøy over de samme dataene; epokenes feil behandles som uavhengige). Uten seksjonen er snapshot-løsningen og alle dokumenter uendret. Et tillegg til sammenligningen med publiserte påstander, med kildenes løsningsstil, forhåndsregistrert alene

seg-611ba369ed00 = Nøyaktighet og dekning for en lunar referansestasjon sammenlignet med publiserte påstander

seg-4fe4f1cffa2b = Typen lunar-station-coverage kjørt under de offentlige forutsetningene i det publiserte materialet om en lunar differensiell referansestasjon (fire navigasjonssatellitter i frosne elliptiske baner på { "24" } h, { "10" } m { "95" } % SISE, { "0.30" } m kodestøy, { "1" } s og { "600" } s korreksjonsforsinkelse, en stasjonsmåling under desimeternivå, det publiserte eksempelstedet for stasjonen, sirklene på { "300" } km og { "600" } km rundt sydpolen) og vurdert mot kildenes numeriske påstander under seks ensidige terskler forhåndsregistrert før kjøringen: dekning av hele sydpolen med p95 under én meter (K1, K2), p95 etter korreksjon under én meter og på desimeternivå (K3, K4), under én meter bevart ved { "600" } s forsinkelse (K5), og nøyaktighet bevart fra { "10" } km til { "500" } km grunnlinje (K6)

seg-478225d0a8e1 = Kjerne for lunart ARAIM-beskyttelsesnivå

seg-863690a44f21 = Steget fra geometri til kovarians i det lunare beskyttelsesnivået — (GᵀG)⁻¹ over alt-i-sikte og hver delgeometri med én feil, projisert på lokal vertikal og sporet til den horisontale blokken — og dets statistiske kjerne: Bonferroni-detektormultiplikatoren, den gaussiske øvre halen for hver feilhypotese, og rotløsningen som avbilder et integritetsrisikobudsjett på et beskyttelsesnivå, over et lunart tjenestevolum med 7 punkter

seg-8191906fc700 = To etablerte tredjepartsimplementasjoner satt sammen, begge kjørt frakoblet, med fixturen regenerert fra start til slutt og verifisert byte-identisk. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c kompilert fra C-kildekode med -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverterer normalmatrisen med Crout LU med delvis pivotering, en algoritme uten slektskap med kshanas håndskrevne Gauss-Jordan invert4(); numpy.linalg.inv (LAPACK getrf/getri) inverterer hver av dem på nytt som en tredje uavhengig invers, og stemmer overens med RTKLIB til { "1.112e-12" } relativt. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) leverer norm.isf, norm.sf (Cephes ndtri/ndtr) og optimize.brentq mot kshanas Numerical-Recipes-serie for ukomplett gamma, invers med intervallhalvering og intervallhalvering i 200 steg — og SciPys direkte sf er en annen numerisk vei inn i den fjerne halen enn kshanas { "1" } − Φ, slik at kanselleringen i den dype halen måles i stedet for å speiles. Den vertikale aksen er den radielle enhetsvektoren (definisjonen av lokal vertikal på en sfærisk måne), og den horisontale variansen er sporet til den horisontale blokken, så ingen Øst/Nord-asimutkonvensjon deles. UTTRYKKELIG IKKE VALIDATED AV DENNE RADEN: σ_URE, apriorisannsynligheten for feil per satellitt og den illustrative konstellasjonen av typen Moonlight/LCNS er MODELLED inndata gitt til den uavhengige referansen som de er; og FORMEN på MHSS-integritetsligningen for én feil er transkribert fra den samme publiserte grensen som kshana implementerer — en delt lukket form er en delt antakelse, så denne raden dekker en gal evaluering av den ligningen, ikke et galt valg av den. Ingen tredjeparts MHSS ARAIM-implementasjon er tilgjengelig (RTKLIB har ingen inngang for beskyttelsesnivå, ingen slik PyPI-distribusjon finnes, Stanford MAAST er MATLAB), og det er den utestående oppgraderingen

seg-0ec1699f5754 = ARAIM MHSS-beskyttelsesnivåer mot publiserte referansevektorer

seg-fbaaf3ad7648 = Selve ligningen for beskyttelsesnivå med løsningsseparasjon under flere hypoteser: vektet minste kvadrater for alt-i-sikte og for hver enkelt feilmodus på en geometri i Øst/Nord/Opp med én klokketilstand per konstellasjon, delløsningenes sigmaer, løsningsseparasjonens sigmaer og ensidige nominelle biasprojeksjoner, Bonferroni K_fa-tersklene, risikoallokeringen for ikke-overvåkede feil, og VPL/HPL som løser integritetsrisikoligningen. Kan kjøres som scenariotypen <c1/>

seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } juni { "2019" }), Appendix D, regneeksempel — publiserte INNDATA (geometrimatrise med 10 satellitter og 2 konstellasjoner, diagonalene C_int/C_acc, b_nom, P_sat, P_const, LPV-200-konstanter) og publiserte UTDATA (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } og seks mellomresultater for konstellasjonsfeil), hentet 2026-09-20, kilde-SHA-256 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Reprodusert innenfor referansens EGEN oppgitte toleranse TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT og σ_v_acc til trykt presisjon. Den samme undergruppens Milestone { "3" } Report ({ "2016" }) Annex A §A.IX oppgir det samme eksempelet, men er internt inkonsistent — en fortegnsfeil i rad { "3" } av G (+{ "0.7477" } der dokumentet fra { "2019" } skriver −{ "0.7477" }; med pluss blir dokumentets egen σ_v_acc { "0.8690" } m mot dets publiserte { "1.47" } m), og en K_fa_3 evaluert ved { "57" } feilmoduser mens dokumentet oppgir N_fault_max = { "1" }, altså { "12" }, slik at dets EMT følger terskelen for 57 moduser og dets VPL/HPL ikke gjør det. Ingen konform implementasjon kan reprodusere alle utdataene på en gang. Dets geometriske mellomresultater reproduseres nøyaktig og dets beskyttelsesnivåer er registrert som målte avvik (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), utelatt fra aksepttallet; toleransen ble ikke utvidet for å absorbere dem. OMFANG: bare N_fault_max = { "1" } — delmengder av feil med flere hendelser avvises i stedet for å avkortes, og utelukkelse, kjikvadratkontrollen av konsistens og omallokeringssteget mot dobbelttelling forblir MODELLED

seg-7bfcb5c6a985 = ARAIM med samtidige hypoteser om feil i flere satellitter

seg-15043111e437 = araim_reference::add_v42_subset_plan: ADD v4.2-regelen for bestemmelse av delmengder (P_THRES, FC_THRES, overvåkede delmengder med færrest fjernet først) generalisert fra par til samtidige kombinasjoner av opptil max_order satellitt- og konstellasjonshendelser, med den eksakte apriorisannsynligheten P_no fault prod q_e; add_v42_protection_levels_to_order kjører ADD v4.2-veien for beskyttelsesnivå på den (orden { "2" } er nøyaktig den eksisterende veien). raim::araim_subset_raim (valgfri): avansert RAIM over denne hypotesemengden, hver overvåkede delmengde som én modus (p_fault, T, b, sigma) i integritetsrisikosummen, ikke-observerbare delmengder flyttet til den ikke-overvåkede risikoen, budsjettet skalert med ADD-allokeringen av den ikke-overvåkede risikoen, og delmengden med størst normalisert separasjon rapportert når en feil oppdages. Apriorisannsynligheter som krever dypere delmengder enn max_order avvises, aldri avkortes

seg-6c6076ea1eee = Intern konsistens (InternalConsistency): reduksjonen av orden 2 til den MAAST-kontrollerte ADD v4.2-veien, uavhengig ny utledning av apriorisannsynlighetene og en konstruert feil i to satellitter. Ingen MAAST- eller RTKLIB-kjøring utover par er gjort, så de dypere hypotesemengdene og beskyttelsesnivåene til delmengde-RAIM er ikke kontrollert eksternt. araim_subset_raim deler forenklingene til araim_dual_raim (én sigma for integritet og nøyaktighet, én klokke, den enkle normale halen): den er ikke ADD-konform

seg-48ca01332f8f = RAIM ved siden av kvalitetsmålene for klokkens holdover

seg-890f1006a75d = Den valgfrie [integrity]-seksjonen i clock-typen (clock_integrity::run): fra et oppgitt sted og forhåndsinnstillinger for konstellasjoner (geometry::sky_geometry), ved hver integritetsepoke så lenge GNSS-tidslinjen ikke er nektet, snapshot-RAIM (raim::snapshot_raim: kjikvadrattest på paritet, beskyttelsesnivåer med helning) på satellittene over masken, med seedede gaussiske residualer med oppgitt sigma og en valgfri oppgitt bias; en egen integrity_fom-blokk med avgjørelser per epoke, beskyttelsesnivåer og tilgjengelighet. Nektede epoker rapporteres som utilgjengelige, aldri ekstrapolert; kvalitetsmålene for holdover er uendret, og uten seksjonen er utdataene byte-identiske

seg-c2860bf4b562 = Intern konsistens (InternalConsistency): beskyttelsesnivåene er de fra snapshot_raim, som er validert mot RTKLIB i sin egen rad, beregnet på nytt på samme geometri; oppførsel uten feil og med injisert feil. Himmelen er en representativ geometri fra en forhåndsinnstilling (ikke en datert almanakk), residualene er syntetiske, og sigma, varslingsgrensene og sannsynlighetene er oppgitte inndata; ingenting her er en uttalelse om tilgjengeligheten til en virkelig mottaker

seg-9cbb4ee7588a = Romlig, støyende observerbarhet av buelengde i flere cislunare familier

seg-5ebd771deef8 = Observerbarhetsterskelen for buelengde i cislunart rom i det ROMLIGE CR3BP med seks tilstander i stedet for det plane med fire tilstander, på tvers av familiene DRO, L2-halo og L2 nesten-rettlinjet halo, med målestøy i Gramian og TO kriterier rapportert fordi det ikke finnes ett enkelt ærlig: det publiserte rangkriteriet, som beviselig er invariant overfor en homoskedastisk måle-sigma (veiing multipliserer observerbarhetsmatrisen med en skalar, slik at det relative singulærverdispekteret og dermed rang, defekt og kondisjonstall er uendret), og et estimerbarhetskriterium — den første buen der den formelle 1σ-posisjonsusikkerheten i hovedfarkostens starttilstand faller under en oppgitt grense — som er det som flytter seg med støy. Hver terskel bærer intervallet i epokenettet den ligger i; et kriterium som ikke nås er null med en begrunnelse. Plan modus forblir standard, og familier utenfor planet avvises der i stedet for å bli flatet ut til en tilstand som ikke kan representere dem

seg-046231819882 = En uavhengig radtrappeform-rang ved Gauss-eliminasjon med delvis pivotering bekrefter hver rangavgjørelse med seks tilstander — en annen algoritme som ikke deler kode med egenverdi-/SVD-veien som testes. Tilstandsovergangsmatrisen { "6" }×{ "6" } for CR3BP som dette bygger på har sin egen ReferenceImpl-referanse mot SciPy-variasjonsintegrasjon, og startbetingelsene for halo/NRHO kommer fra en korrektor som reproduserer den publiserte sørlige L2-Gateway-banen { "9" }:{ "2" }. Det eksisterende leddet med kvadratrotinformasjonsfilter telles uttrykkelig IKKE som støttende belegg: det bruker de samme Jacobianene og reduseres til den samme normalmatrisen, så det er en konsistenskontroll mellom to numeriske maskiner, og den utsendte utvidelsesetiketten sier det. IKKE eksternt forankret, og ExternalDataset er derfor avslått i stedet for lånt fra raden for STM: selve terskelbuelengdene avhenger av den MODELLED konstellasjonsutformingen, epokenettet og — målbart, med opptil { "40" }× — singulærverdi-toleransen. De publiserte plane { "2.09" } h reproduseres nøyaktig ved rel_tol = { "1e-6" } og er selv toleranseavhengige ({ "10.25" } h ved { "1e-4" }, { "0.42" } h ved { "1e-8" }), noe som er en egenskap ved kriteriet og ikke ved banen. Ingen offentlig datasett publiserer en observerbarhetsterskel for buelengde for en valgt cislunar konstellasjon. MEASURED RESULTAT: den romlige terskelen med seks tilstander er { "22.17" } h for L2 NRHO og { "40.42" } h for L2-halo, og FINNES IKKE for den plane DRO-familien som den publiserte påstanden ble utledet på — rang { "4" } av { "6" } med datumdefekt { "2" } og to nøyaktig null egenverdier, en strukturell defekt som ingen buelengde gjenvinner

seg-e250321394bc = Feil i prediksjon av jordorientering i operativ stil, målt predikert mot endelig

seg-0e443d241460 = En minste kvadraters tilpasning av bias pluss rate over et glidende vindu pluss de viktigste periodiske leddene — årlig, halvårlig og de to viktigste sonale tidevannene for UT1; Chandler, årlig og halvårlig for polen — ekstrapolert med det siste residualet i vinduet ført videre: klassen IERS Bulletin A bruker, i stedet for persistensprediktoren som den publiserte horisonten bygde på. Vurdert på den eneste ærlige måten: en prognose for T+h bygd fra rapid-rader i Bulletin A ved eller før T, målt mot den SENERE publiserte endelige Bulletin B ved T+h, med persistens vurdert over nøyaktig samme epokesett mot de samme endelige verdiene ved siden av. En målepoke uten publisert endelig verdi forkastes i stedet for å vurderes på nytt mot rapid-kolonnen; et periodisk ledd som vinduet ikke kan begrense rapporteres som forkastet med de syklusene det faktisk dekker; et ufullstendig vindu avvises i stedet for å forkortes i det stille

seg-f4efd94dd746 = Lunart rammedatum fra en observasjonskampanje

seg-a6972eb89d7d = Helmert-datumet med sju parametere propagert fra en SIMULERT OBSERVASJONSKAMPANJE i stedet for å bli gjenvunnet fra en injisert transformasjon. Jordstasjoner observerer en kildebelagt katalog over lunare overflate-radiofyr etter en eksplisitt plan; de partielle deriverte for lunar VLBI-forsinkelse akkumuleres i en Fisher-informasjonsmatrise for radiofyrkoordinater og sendes gjennom Helmert-designet A = [I₃ | [p]ₓ | p] til H = AᵀM_bA, slik at den rapporterte datumnøyaktigheten er en funksjon av observasjonsprogrammet — nøyaktig lineær i forsinkelsens sigma og monoton i buen gjennom den librasjonen rapporten MÅLER. Datumdefekten er temaet i stedet for en fotnote: rang, defekt, kondisjonstall, spektrum, uobserverbare retninger i basisen med sju parametere, den svakeste retningen selv ved full rang og hver parameters andel av den utsendes ved hver kjøring, og enhver parameter kampanjen ikke begrenser publiseres som NULL med en status. Korrelasjonen mellom radiofyrfeil er MEASURED, ikke antatt — nøyaktig null med stasjonene holdt faste, og skrevet ut med kostnaden når de estimeres. Kan kjøres som scenariotypen <c1/>

seg-ca481f2d8f9e = Bekreftelse med uavhengig estimator av terskelen for cislunar buelengde

seg-3d5fbf896209 = En batch-estimator med minste kvadrater som GJENVINNER hovedfarkostens starttilstand fra simulerte målinger mellom satellitter over voksende prefikser av det samme epokenettet som tabellen for rang mot bue bruker, med målingenes partielle deriverte tatt som sentrale differanser av den sammensatte forovermodellen. Den bruker ingenting av maskineriet som terskelen ble målt med — ingen analytisk Jacobi-rad, ingen variasjonell tilstandsovergangsmatrise, ingen singulærverdi- eller egenverdidekomposisjon, ingen rangtoleranse, intet kvadratrotinformasjonsfilter — og deler bare dynamikken, startbetingelsene, den skalare observabelen og epokenettet, hver navngitt i det utsendte dokumentet. To kriterier, begge sveipet: gjenvinning uten støy (motstykket til rang) og Monte Carlo-estimerbarhet (motstykket til estimerbarhet, målt mot en kjent referanse i stedet for forutsagt fra en kovarians). Kan kjøres som scenariotypen <c1/>

seg-60e30948cee7 = En separat estimator i denne kodebasen med en annen algoritme og en usammenhengende kodevei: ikke-lineær vektet Gauss-Newton med partielle deriverte fra differanser, hvis avgjørelse leses som en målt feil i tilstandsgjenvinning i km og mm/s. Den har ingen uttrykk til felles med Gramians vei via rang og kovarians, og adskillelsen HÅNDHEVES av en vakt på kildetekstnivå i stedet for å bli hevdet. MEASURED på det publiserte plane DRO-nettet: ESTIMERBARHETSkriteriet er CORROBORATED — den målte Monte Carlo-grensen er { "5.739130" } h mot den formelle { "5.739130" } h (forhold { "1.0000" }), og den målte RMS reproduserer den formelle 1σ over { "21" } buelengder til et geometrisk middelforhold på { "0.9804" }. RANGkriteriet er IKKE bekreftet som en gjenvinnbarhetsgrense: estimatoren gjenvinner fra { "0.782609" } h mot Gramians { "2.086957" } h, forhold { "0.375" }, og ved { "1.826087" } h — det siste prefikset som rangavlesningen scorer { "3" } av { "4" } på — gjenvinner den til { "1.96e-5" } av den apriori forskyvningen. Gjenvinningsgrensen er urørt over tre dekader av sin egen grense mens ranggrensen spenner fra 'aldri' til { "0.782609" } h over fire dekader av rel_tol, og de to faller nøyaktig sammen ved rel_tol = { "1e-8" }. Dette spennet ble først registrert som å nå { "0.260870" } h; det tallet var en ARTEFAKT, produsert av en rangavlesning som telte { "4" } retninger fra { "2" } målerader under f64-støygulvet, og det rettes her i stedet for å bli stående. Rangavlesningen er nå avgrenset av Sylvesters ulikhet med begrunnelsen utsendt, og det korrigerte spennet metter seg nøyaktig ved buen der den uavhengige estimatoren gjenvinner, noe som styrker denne radens kryssvalidering i stedet for å svekke den: de publiserte { "1e-6" } er en konservativ KONVENSJON for singulærverdi, ikke en uttalelse om gjenvinnbarhet. Samme mønster romlig: NRHO { "9.290323" } h mot { "21.677419" } h, halo { "22.978723" } h mot { "39.829787" } h, med estimerbarhet i nøyaktig overensstemmelse i begge. Det plane DRO med seks tilstander gjenvinner ved ingen bue, og reproduserer uavhengig den familiens strukturelle datumdefekt fra en estimator som ikke er fortalt noe om den. IKKE eksternt forankret — dynamikken og startbetingelsene deles med analysen som testes og ingen offentlig datasett publiserer en slik terskel — så ExternalDataset er avslått

seg-f839285852d9 = Lunart tjenestevolum fra virkelig, hentet konstellasjonsgeometri

seg-c3059fcced49 = Godtar en tabulert månesentrert tilstandsefemeride (evalueringen av en SPK/BSP-kjerne) eller en publisert konstellasjonsdefinisjon bak <c1/>, kjører den identiske sveipen for dekning / DOP / beskyttelsesnivå mot den, og utsender σ_URE-avstandskravet den innebærer VED SIDEN AV de uendrede illustrative Kepler- og perturberte resultatene, med forskjellen som en egen navngitt størrelse. Hvert tall bærer en proveniensklasse som skiller kjerneavledet fra avledet av publiserte elementer fra modellert, slik at de aldri kan forveksles i et senere sitat

seg-36a6cfaf5afa = Enhet og proveniens deklarert for hver rapportert størrelse

seg-12460501e82b = Et maskinlesbart skjema som gir enhet, proveniensklasse og definisjon for hvert numeriske felt i hver scenariorapport, pluss én global port som kjører hver registrerte scenariotype og feiler hvis et utsendt numerisk felt mangler noen av dem. Proveniensvokabularet er lukket og hver klasse bærer et evidensnivå, med to klasser bevisst avbildet til <c1/> og <c2/> i stedet for å få et nivå klassen ikke bestemmer

seg-a8c4a6fd4989 = Selve det utsendte dokumentet: hvert numeriske blad må løses opp til en oppføring i dokumentets egen units-blokk. Det finnes ikke noe eksternt enhetsregister å kontrollere en DEKLARERT enhet mot, så en deklarert enhet er en gjennomgått påstand og ikke en verifisert en — porten verifiserer FULLSTENDIGHET og KORREKT FORM, ikke sannhet, og «validert» ville vært feil fordi ingenting eksternt bekrefter at <c1/> er riktig enhet for et felt som heter <c2/>. En uavhengig kryssjekk av navnesuffikser ble kjørt over de { "1,434" } feltene som var beskrevet PÅ DET TIDSPUNKTET: av de { "691" } som bar et suffiks som angir enhet, er { "40" } uenige med den deklarerte enheten og alle { "40" } er forklart (suffikser for per sekund, minima, aperturesekunder, newtonmeter mot et suffiks som ser ut som nanometer), så ingen gal enhet kom for en dag. Den kryssjekken er ikke kjørt på nytt siden, og dekningen har vokst forbi den — tallet er stående på det som faktisk ble målt i stedet for å bli gjentatt ved dagens sum. Ved den endringen ({ "0.27.0" }) gikk dekningen fra { "7" } av { "56" } typer til { "60" } av { "61" }, og fra { "389" } av { "1354" } felt til { "1,742" } av { "1,744" } (docs/field-units-schema.json, som en foreldelsessjekk holder à jour). INGEN type er lenger udekket (tak { "0" }, FUT-28, { "0.36" }): den siste var <c3/>, hvor to av kolonnene er nøklet av kalleren så enhetene deres er data; de beskrives nå som <c4/>, og enheten til hver posisjon leses fra den SVEIPEDE pakkens egen enhetstabell inn i <c5/> og <c6/> (eller tas fra aksens deklarerte <c7/>, som må stemme overens med pakkens når begge finnes; null når ingen finnes, oppgitt i stedet for gjettet). <c8/> var den før den, og kom av listen da det utgitte dokumentet fikk en units-blokk: additivitetsfestet som hadde navngitt <c9/> som en forbudt nøkkel BEVISER nå at tillegget er additivt i stedet — fjern blokken igjen og dokumentet hasher fortsatt til de to konstantene som ble fryst før den fantes, så en utgitt verdi som flyttet seg under tillegget feiler fortsatt. Arbeidet avdekket også tolv enhets- eller dokumentasjonsdefekter i eksisterende kode, rapportert i stedet for rettet under R1

seg-cf779c468eed = Lunart rammedatum fra en VIRKELIG observasjonskampanje

seg-96151f13a92b = Helmert-datumkovariansen med sju parametere, med de to simulerte inndataene erstattet av målte: planen er sendeepokene fra bakken for { "337" } arkiverte ILRS-normalpunkter for lunar laseravstandsmåling (2015-04-08 til 2015-06-27, Grasse MeO { "7845" } og Matera MLRO { "7941" }, alle fem retroreflektorgruppene) og hver observasjonsvekt er det punktets egen arkiverte presisjon bin_rms/√n_raw — median { "5.13" } mm enveis avstand, lest ut av filen. Stasjonskoordinater IERS ITRF2020, reflektorkoordinater JPL DE430 Table { "7" }. Kan kjøres som scenariotypen <c1/>. Det validerte kravet ({ "0.36" }) er snevert: på den analytiske standardveien stemmer beregningen av datumkovariansen overens med en uavhengig referanse med SPICE-lysetid og NumPy på ferske målte normalpunkter; det er ikke en LLR-nøyaktighet og ikke belegg for at den analytiske månen er nøyaktig

seg-c815cb90dcde = Lunar referansestasjonsgeodesi: lagt til retroreflektor og VLBI-radiofyr mot datumet med fem grupper

seg-103cf21173ac = Valgfrie inndata extra_reflectors og extra_beacons i scenarioet lunar-llr-datum legger til en station_geodesy-blokk: Helmert-informasjonen for de fem gruppene fra det arkiverte utsnittet av lunar laseravstandsmåling pluss informasjonen som en lagt til retroreflektor (målt ved de arkiverte normalpunktepokene der målestasjonen er over horisonten, hver med det normalpunktets arkiverte vekt) og et lagt til VLBI-radiofyr (observert av nettverket og planen i lunar-frame-campaign med jordstasjonene faste, gjennom de partielle deriverte for forsinkelse i lunar-vlbi-fim) på oppgitte steder legger på datumet med sju parametere, løst på nytt, med hver Helmert-parameters 1-sigma før og etter, forholdet mellom dem, normene før og etter og ytterverdiene for egenverdiene til Fisher-differansen. Fraværende eller tom er rapporten uendret

seg-479a7e6bbedb = Kun intern konsistens: hvert lagt til sted er et eget punkt, og en laseravstand eller en VLBI-forsinkelse med fast stasjon berører ett punkt, så dets informasjon A_p^T M_p A_p er positivt semidefinitt og legges til; testen kontrollerer Fisher-differansen og hver varians mot det. Resultatet for de fem gruppene er den eksisterende raden med virkelige data og er uendret. Den tilføyde reflektoren gjenbruker epoker planlagt for de fem eksisterende gruppene, en ILLUSTRATIVE plan, og den tilføyde radiofyrens nettverk, plan og forsinkelsessigma er de ILLUSTRATIVE inndataene fra lunar-frame-campaign; stedet er en ILLUSTRATIVE posisjon ved sydpolen. Et sted ved sydpolen ser Jorden lavt på horisonten eller ikke i det hele tatt, noe de eksisterende testene for siktevinkel uttrykker; ingen av stedene måles kontinuerlig. Tallene er Cramer-Rao-grenser for et redusert parametersett, ikke et løst datum og ikke en uttalelse om noen virkelig stasjon

seg-d9f033ebf109 = Lunart rammedatum fra en VIRKELIG observasjonskampanje, kjerne-månesentrum

seg-6f272a06c9f3 = Helmert-datumkovariansen med sju parametere for lunar-llr-datum fra arkiverte ILRS-normalpunkter og deres målte vekter, på veien med kjerne: det geosentriske månesentrum leses fra JPL DE440 av motorens egen kjernelser (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Bare månesentrum skiller seg fra den analytiske raden; IAU { "2015" }-orienteringen, fraværet av polbevegelse og UT1, katalogene, utvalgsreglene, vektene og lineæralgebraen er de samme. Det validerte kravet er bare at datumkovariansen på denne veien stemmer overens med en uavhengig referanse med SPICE og NumPy på ferske, usette normalpunkter. Sammenligningen skiller ikke månemodeller og kontrollerer ikke månesentrum: på samme utsnitt holder også den analytiske månen hver terskel, den forhåndsregistrerte mutasjonen (kjerne-månen lest én time for sent) ble ikke oppdaget, og et månesentrum som er omtrent { "4,650" } km feil holder også (se teksten om den uavhengige referansen). Det er ikke belegg for at kjerne-månen forbedrer datumet. Kan kjøres som scenariet <c1/> med planetary_kernel_path (og normal_points_dir for et annet utsnitt)

seg-bd3af378b613 = Innebygd analytisk lunar efemeride — dens OPPGITTE NØYAKTIGHETSGRENSE kontrollert mot virkelige data

seg-a51c4e234a4f = ephem::moon_position, den lavpresisjons geosentriske lunare serien som crate-en faller tilbake på når ingen DE/SPK-kjerne er til stede, målt mot virkelig lunar laseravstandsmåling og mot en publisert planetefemeride over samme tidsrom. Denne raden validerer grensen som modulen oppgir om seg selv, IKKE en nøyaktighet: serien er bekreftet å være ikke verre enn den sier, ikke bekreftet å være god

seg-81dff68ddd9c = TO uavhengige eksterne datasett som ikke deler noe. ({ "1" }) { "337" } arkiverte ILRS-normalpunkter for lunar laseravstandsmåling (EUROLAS Data Center, DGFI-TUM, 2015-04-08 til 2015-06-27, fem retroreflektorgrupper, innsjekket med SHA-256 per fil og et skript for ny nedlasting og verifisering): observert-minus-beregnet enveis avstand { "156,494" } m RMS, med stasjonskoordinater fra IERS ITRF2020 og reflektorkoordinater fra JPL DE430 Table { "7" }, så residualet domineres av serien for månesentrum. ({ "2" }) JPL Horizons geometriske geosentriske månetilstander over samme tidsrom: { "112,567" } m RMS radielt, { "195,655" } m RMS vektor, verste epoke { "360,324" } m = { "0.0536" }°. Et avstandsresidual reagerer på den RADIELLE delen av en efemeridefeil, så ({ "1" }) og ({ "2" }) er den samme størrelsen nådd på to måter og stemmer overens til { "1.39" }× — noe som gir scenariet lunar-llr-datum grunnlag for å tilskrive residualet til efemeriden. Motorens egen moduldokumentasjon hevder ~{ "0.3" }° / ~noen·10² km; begge målingene er innenfor, den vinkelmessige påstanden med { "5.6" }× margin. OMFANG, oppgitt slik at ingen leser kan misforstå: dette validerer den oppgitte GRENSEN, ikke et nøyaktighetstall. Serien forblir uegnet for enhver anvendelse som trenger bedre enn ~{ "1e5" } m, og den begrensningen er radens innhold like mye som overensstemmelsen er det. Regenererbar frakoblet med de innsjekkede skriptene for henting og verifisering

seg-44f582b17fa9 = Portintegritet — en grønn som betyr det den sier

seg-43fbcfbe990c = Tre strukturelle vakter over selve verifiseringsprosessen, hver lukker en klasse feil som nådde den kanoniske porten som en intermitterende eller falsk rød. ({ "1" }) Hver konstruert midlertidig sti i Rust-kildene må ha en unik komponent per kall; en prosess-ID avvises, fordi cargo kjører bibliotekstestene som parallelle tråder i ÉN prosess og pid er delt av dem alle. ({ "2" }) Hver byte-for-byte- eller hash-festing må deklarere, ved siden av seg selv eller i modulhodet, hva den dekker og hva den bevisst utelater — slik at en tverrgående endring kan se med et blikk hvilke festinger som er i omfang og hvilke som i det stille har blitt detektorer for endringer i hele depotet. ({ "3" }) En grønn kan bare påstås fra den FULLE suiten: scripts/gate.sh kjører <c1/>, fanger den sanne utgangskoden uten noen pipe i veien, og skriver en kvittering som navngir commit, antall integrasjonsbinærer, antall tester og varigheten; pre-push-sjekken avviser en push hvis commit ingen gyldig kvittering navngir, på et rent tre. Repeterbarhet samples separat av scripts/check-repeatability.sh, som kjører bibliotekssuiten N ganger og feiler hvis settet av beståtte tester er forskjellig.

seg-17a5f9da54a4 = Lukket form: hver vakt kjøres over en fast kjent dårlig snutt som må utløse og en fast kjent god snutt som må forbli stille, begge bokstavelige konstanter detektoren ikke kan påvirke. De to kjent dårlige snuttene er defektene F22 og F25 i sin opprinnelige form. Dette er en INTERN uavhengig referanse og raden er MODELLED tilsvarende: den beviser at vaktene skiller defekten fra rettingen, ikke at klassene de beskriver er uttømmende. Deres oppgitte blindsoner — delt tilstand som ikke er en sti, en festing holdt i en kort navngitt konstant, en sjelden race som tre kjøringer ikke samples, og en kvittering som enhver som kan skrive filen kan forfalske — er skrevet ut i moduldokumentasjonen til tests/source_guards.rs og i hvert skripts hode i stedet for å bli oppdaget.

seg-178192c9c87a = Sammensatt tids-PL — skalar MHSS-spesialisering (H=1_N)

seg-431aaf94ec31 = Skalar tids-TPL med løsningsseparasjon over heterogene kilder; PL drevet av støyen fra delmengden med verste utelukkelse + UTC(k)-bias

seg-9a5ea79248c8 = P2: numpy { "2.3.5" } linalg.lstsq og scipy { "1.18.1" } (norm.isf, norm.sf, brentq) beregner med sine egne algoritmer på nytt estimatorene med vektet minste kvadrater for delmengdene, den generelle separasjonskovariansen sqrt(Δ Σ Δᵀ), biasene og beskyttelsesnivået ut fra dem på { "300" } innsjekkede inndata (tests/fixtures/tpl_scalar_numpy_oracle); PL stemmer overens innenfor { "1e-9" } relativt (verst { "1.2e-10" }) og den drivende utelukkelsesdelmengden er identisk, toleransen fastsatt før sammenligningen. Multiplikatorene, apriorisannsynlighetene og overgrensene for bias er inndata, og strukturen i PL-ligningen (modusliste, ir/2-oppdeling, biasprojeksjon) er en oppgitt inndata, som for raden Kjerne for lunart ARAIM-beskyttelsesnivå; det validerte kravet er lineæralgebraen og PL på disse inndataene, ikke de fysiske størrelsene i et tidsscenario. ARAIM-opphav Blanch { "2015" } / Joerger { "2014" }

seg-b7cd952ff133 = Sammensatt tids-PL — P0-seedet gjennomkjøring av holdover

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); nedre semikontinuerlig PL({ "0" }+)≥PL({ "0" }−); K(IR/2) løpende maks; faseeksponenter τ/τ³/τ⁵

seg-1438193381be = Egenskapstester (monotonitet, ingen nedgang ved overlevering) + eksponentlint mot holdover::coast_phase_variance

seg-3ab4509b62a2 = Sammensatt tids-PL — dekning av holdover-omhyllingskurve, regime over flere år (tau>=90d)

seg-d9520f6c1769 = Den løpende maks-omhyllingskurven overgrense-dekker (uten gjennomtrengning av null) en virkelig metrologisk serie ved hver testede lag tau>=90d på et usammenhengende segment; kort tau (<=30d) er en oppgitt, modellert grense

seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] 5-dagersserie MJD 56074-60429 ({ "872" } pkt, webtai API); usammenhengende tilpasning/test, dekning over flere år uten gjennomtrengning av null

seg-096b6cdfe2dc = Sammensatt tids-PL — LIL n.s.-omhyllingskurve (umulighet + konsistens)

seg-1671add2210d = Ingen endelig holdover for verste tilfelle (Brownsk sup divergerer); IR-allokert HPL konsistent med Hartman-Wintner-omhyllingskurven når IR→{ "0" }

seg-c9ed8bbede70 = Lukket form n.s.-omhyllingskurve √(2Dt·lnln t) identitet + HPL-dominanskontroll; Baweja arXiv:{ "2606.24210" } umulighetsskjøt

seg-5a27c9f0a67d = Heterogen UTC(k)-overgrense for sporbarhetsbias i integritet

seg-fd09ab2adbf6 = Overgrense for bias per kilde b = (U/k_cov)·Phi^-1(1-tail/2) + aldring, som blåser opp en publisert utvidet Type B-usikkerhet til en allokert integritetshale; bro til tpl_scalar som bias_s

seg-d75b900ad25f = Korrelert kryss-kovarians for sporbarhetsbias (usikker allokering for felles modus)

seg-0641f6d38c23 = N×N bias-kryss-kovarians med rho·b_i·b_j utenfor diagonalen for kilder som deler en UTC(k)-realiserer; BEVIST correlated_fused_bias >= independent_fused_bias (naiv uavhengig allokering underavgrenser den fusjonerte biasen -> optimistisk -> usikker)

seg-72359f29aab1 = Uavhengig numpy-reproduksjon av kryss-kovariansen og ulikheten mellom korrelert og uavhengig fusjonert bias (InternalConsistency). Representativt kildesett; modellert scenario.

seg-0359a9194c60 = GLS-hvitgjøring av felles modus (Aitken) + Mahalanobis-identitet

seg-67b11ff6d055 = Håndskrevet Cholesky Omega=LL^T og hvitgjøring med foroversubstitusjon z=L^-1 r (Cov(z)=I når Cov(r)=Omega); Mahalanobis-kvadrat z^T z = r^T Omega^-1 r

seg-24cb37529637 = P2: numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) og inv på { "201" } innsjekkede SPD-inndata (tests/fixtures/gls_whitening_numpy_oracle) kontrollerer den håndskrevne faktoren, det hvitgjorte residualet og hvitgjøringsoperatoren; Mahalanobis-kvadratet kontrolleres mot solve(Omega, r), som ikke bruker Cholesky, så identiteten z^T z = r^T Omega^-1 r bekreftes ad en separat vei. Alt innenfor { "1e-12" } relativt (verst { "7.9e-16" }), toleranse fastsatt før sammenligningen. Det største kondisjonstallet er { "19.3" }, så dårlig kondisjonerte matriser er ikke dekket. GLS/Aitken { "1935" }-hvitgjøring er sitert.

seg-1a3bb032960f = Konsistensstatistikk for felles modus (separasjonsblind feil i delt referanse)

seg-1b03f522b8fc = Skårestatistikk ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 for et skift i felles modus som løsningsseparasjon (kontraster ortogonale på { "1" }) ikke kan se; et skift i felles modus blåser den opp mens parvise separasjoner forblir flate

seg-91fc18cde833 = Udetekterbar grense for felles modus, residual utenfor Omega

seg-0cc2c0f033c8 = Udetekterbart tak for felles modus: den største feilstørrelsen langs en retning d som unnslipper BÅDE separasjon (alpha_ss = T_ss / hvitgjort kontrastnorm av d) og statistikken for felles modus (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), rapportert som min(alpha_ss, alpha_cm). Under en positivt definitt Omega utelukker de to blinde retningene (d proporsjonal med { "1" }, og { "1" }^T Omega^-1 d = { "0" }) hverandre, så taket er ENDELIG for hver d ulik null; det er uendelig bare for en nullretning eller en Omega som ikke er positivt definitt. En retning utenfor den modellerte felles aksen er blind bare for statistikken for felles modus og avgrenses av separasjon

seg-a7a33523bb1c = Lunar datumidentifiserbarhet - lineæralgebra for dekomposisjonen

seg-bd59cc76557a = Schur-komplement-marginalen av blokken { "{" }lunocenter-X, scale{ "}" } i Fisher-matrisen for Helmert-datumet med 7 parametere: den skalare degenerasjonsmetrikken lambda_min(S), CRLB for origo-X og korrelasjonen mellom origo og skala

seg-0f7e4fb31c44 = Uavhengig SciPy/NumPy-referanse (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): Schur-komplementet, dets egenverdier og den 2x2 inverse beregnet av et uavhengig bibliotek. Avgrenset til LINEÆRALGEBRAEN i dekomposisjonen; størrelsene på lunar korrelasjon/CRLB fra virkelig geometri forblir MODELLED.

seg-3359eee713a5 = Lunar klassifisering av datumets nullrom (LLR rang-additivitet + librasjonens defektløft)

seg-6d722c176052 = Klassifisering av datumproblemet med intern avstandsmåling: en enkelt avstandsobservasjon bidrar med rang { "1" } (6-dimensjonalt nullrom); paret origo-X og skala er nesten null og fysisk DE440-librasjon løfter defekten til null mens paret forblir nesten degenerert

seg-ae6dc4e6ea8b = Geometrisk struktur reprodusert av motoren pluss den lukkede 2x2 Schur-identiteten; konsistent i STRUKTUR med Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), hvis rapporterte størrelser IKKE reproduseres her. Klassifiseringen er strukturell; størrelsene på korrelasjon/CRLB under virkelig geometri er MODELLED (reflektorkoordinater og orientering holdt faste). { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): mot Sosnica et al. { "2025" } er korrelasjonen mellom origo og skala fra avstands-Fisher (-0.993 / -0.988) innenfor { "0.05" } av de publiserte -0.97, men på artikkelens egen geometri med fem reflektorer er Helmert-korrelasjonen med 7 parametere og lik vekt -0.78 (den publiserte verdien hviler på feil per reflektor som artikkelen ikke skriver ut), og CRLB for origo ({ "0.6" } til { "1.2" } mm ved { "3" } mm avstandsstøy) er { "96" } til { "98" } % under artikkelens { "3.07" } cm mot en toleranse på { "20" } %. Størrelser ikke reprodusert

seg-3fd19007ea67 = Lunar datuminformasjon fra flere teknikker (LLR + lunar VLBI + banefarkostavstand)

seg-23d0dd7d0666 = Datum-Jacobi-rader for LLR-avstand jord–reflektor, differensiell lunar VLBI-forsinkelse med to stasjoner og avstand banefarkost–radiofyr over datumet med 7 parametere, kombinert til én konsistent forhåndskondisjonert Fisher; viser at tracking utenfor radial retning (banefarkost / dybdediversifisert) bryter degenerasjonen mellom origo-X og skala der transversal VLBI bare hjelper indirekte

seg-b2f5715c4577 = Kontroller av hver teknikks partielle deriverte, analytisk mot differanse (intern); retningen på forbedringen er et geometrisk faktum. Plasseringer av radiofyr, planer og støy er MODELLED og representative (se tests/fixtures/llr_geometry/NOTICE.md).

seg-f9796a4c9a85 = DE440-leverandør for lunar orientering etter hovedakser

seg-ebe4519a40e4 = Rotasjon MOON_PA_DE440 til J2000 ved vilkårlige epoker innenfor 2014-01-01 til 2030-12-31 TDB, ved geodetisk interpolasjon R0·Exp(f·Log(R0ᵀR1)) mellom nodene i en innsjekket daglig serie med { "6" } 209 rader (try_-funksjonene returnerer OrientationSpanError utenfor den, de feilfrie panikker; den klemmer aldri); innebygd ved kompilering så det ikke er noen filsystem-I/O ved kjøring og WASM-bygget bærer den

seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 gjennom spiceypy { "8.2.0" }, kjørt som verktøy): pxform fra MOON_PA_DE440 til J2000 evaluerer JPLs binære PCK moon_pa_de440_200625.bpc direkte, med NAIFs egen rammekjerne moon_de440_250416.tf, ved { "2 000" } tilfeldige epoker utenfor nodene i det innebygde vinduet. Rotasjonsvinkelen mellom matrisene til Kshana og SPICE er innenfor { "1.7e-5" } rad ({ "30" } m ved middelradius { "1737.4" } km, fastsatt før sammenligningen); målt verst { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad, og verst { "1.75e-6" } rad på { "6 000" } flere epoker trukket av verifisereren. De daglige nodene ble selv hentet ut fra den samme kjernen (scripts/gen_de440_moon_pa.py, fixture SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), så denne sammenligningen tester interpolasjonen mellom dem, som er kravet. Funnet av denne sammenligningen og rettet: den tidligere elementvise lineære interpolasjonen med Gram-Schmidt beholdt aksen, men ikke vinkelen i rotasjonen på { "13.2" } deg/dag, og hadde feil på opptil { "2.0e-4" } rad ({ "340" } m) nær kvartpunktene; det tidligere tallet på omtrent { "14" } m kom fra en vakt som bare sampler intervallmidtpunkter. Serien dekker 2014-01-01 til 2030-12-31 og gir feil utenfor den (runde { "2" }); nodene for 2024-2025 regenereres fra samme kjerne til { "4.3e-13" }. SPICE-sammenligningen utenfor nodene ovenfor dekker bare 2024-2025, som er det validerte vinduet; de utvidede nodene kommer fra samme kjerne og skript, men er ikke sammenlignet utenfor nodene. Et geometrisubstrat for identifiserbarhetsanalyse, ikke et orienteringsprodukt under meternivå

seg-ab96cfc8d48c = Lunart LLR-substrat for datumgeometri (reflektorer i hovedakser, bakkestasjoner, analytiske avstandsderiverte)

seg-40e91288f81a = De fem retroreflektorgruppene på nærsiden i PA-kroppsramme i meter og LLR-bakkestasjonene i geodetiske koordinater; reflektorens plassering fra kropp til treghetssystem gjennom DE440 PA-orienteringen; analytiske deriverte av avstanden jord–reflektor med hensyn til datumet med 4 parametere; og den rene LLR-Fisher-matrisen som viser degenerasjonen mellom lunosenter-X og skala som motiverer analysen med 7 parametere

seg-89ce1f95d9f6 = Beregningen kontrolleres internt: hver analytisk deriverte mot en differanse, og tilfellet med null datum mot den nominelle avstanden. KATALOGEN kontrolleres eksternt og uavhengig - hovedakse-koordinatene i DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) er kryssjekket mot Table { "6" } i DE430-memorandumet om overflatekoordinater (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, maskinuttrukket fra en SHA-256-verifisert PDF av tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) og stemmer overens til { "1.12" } m, mens mean-Earth-realiseringen av de samme fem gruppene avviker med { "672" } til { "871" } m. DEGENERASJONSSTRUKTUREN kontrolleres mot et publisert resultat: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, som for lunart hovedaksesystem rapporterer en korrelasjonskoeffisient mellom lunosenter-X og skala på r = -0.97, og at LLR ikke når Månens faktiske massesentrum med bedre nøyaktighet enn { "12" } cm på grunn av den korrelasjonen. Denne modulen gjenvinner den samme strukturen (|corr(t_x, scale)| mellom { "0.9" } og { "0.9999" }, datumdefekt <= { "1" }) fra et Fisher-design med bare LLR. Bekreftelsen er på tvers av efemerider, ikke en rundtur: artikkelen kombinerer INPOP21a, DE430 og EPM2021, mens denne modulen drives av DE440-libration. Det som IKKE reproduseres er størrelsen - korrelasjonen her er omtrent -0.988 mot deres -0.97, og CRLB med 4 parametere er under en millimeter mot deres oppnådde gulv på { "12" } cm, fordi orientering og reflektorkoordinater holdes faste her og løses der. Kun geometri og degenerasjonsstruktur; ingen nøyaktighetspåstand om et løst datum. { "0.30" } ekstern sammenligning: de målte avstandsdelene av denne modulen (reflectors(), stations_itrf(), DE440 PA-plasseringen og den barysentriske lysetiden llr_bcrs_one_way_m) er validert i sin egen rad, LLR measured-range model, mot { "192" } ILRS-normalpunkter (RMS { "2.81" } m mot { "10" } m). Denne raden forblir MODELLED fordi den målte sammenligningen ikke prøver ut resten av påstanden. Den geodetiske stasjonskatalogen stations() runder av APOLLO til { "0.001" } deg; med geosentrisk lysetid gir den { "22.7" } m på de samme punktene (test reflector_ranges_against_ilrs_normal_points; { "96" } m med den tidligere elementvise orienteringsinterpolasjonen). De analytiske avstandsderiverte og den rene LLR-Fisher beregnes gjennom llr_range_m og reflector_inertial med den analytiske månemodellen (ephem::moon_position, omtrent { "0.3" } deg fra GCRS) og uten lysetid

seg-a78ba110b64c = LLR-modell for målt avstand (reflektorkatalog, ITRF2020-stasjoner, DE440 hovedakseplassering, IERS { "2010" } barysentrisk lysetid)

seg-c9827c1a427b = Enveis avstand fra jordstasjon til reflektor for et normalpunkt i lunar laseravstandsmåling: de fem retroreflektorgruppene på nærsiden i DE440-hovedaksens (PA) kroppsramme i meter (lunar_llr_geometry::reflectors); stasjonene i stations_itrf(), nemlig Grasse { "7845" } og Matera { "7941" } fra ITRF2020 ved epoke { "2015.0" } med sine hastigheter, plassert i Geocentric Celestial Reference System (GCRS) ved IERS { "2010" }-transformasjonen med polbevegelse fra Bulletin A (lunar_vlbi::station_inertial_position_itrs), og APOLLO { "7045" } ved operatørens publiserte omtrentlige geosentriske posisjon (ingen hastighet); reflektorens plassering fra kropp til treghetssystem gjennom DE440 PA-orienteringen (lunar_orientation::try_de440_moon_pa_body_to_inertial, som gir feil utenfor 2014-2030); og IERS Conventions { "2010" } Section { "11.2" } barysentrisk lysetid (lunar_llr_geometry::llr_bcrs_one_way_m: Eq. { "11.19" }-transformasjonen fra kropp til BCRS for stasjon og reflektor, og Eq. { "11.17" } Shapiro-forsinkelsen fra Solen, Jorden og Månen). INNDATA, ikke del av kravet: de barysentriske tilstandene og potensialene for Jorden, Månen og Solen (DE440 gjennom SPICE), IERS UT1-UTC og polbevegelse, og den målte rundturen omregnet fra TT til TDB. PÅ TESTRIGGSIDEN, ikke del av kravet: Mendes-Pavlis zenitforsinkelse med FCULa-mapping, i testen, med elevasjon fra den geodetiske katalogen stations(). Ikke modellert: tidevann, stasjonsekssentrisiteter, termiske ledd for reflektorer

seg-9b1dfa736cb6 = Koblet lunar ramme- og tidsskalagauge: det felles nullrommet for romlig datum, klokkeavvik og klokkerate

seg-a000ef6ab2e0 = assemble_coupled_info bygger den koblede Fisher-matrisen med 9 parametere over [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space returnerer en basisinvariant dekomposisjon av nullrommet i bare romlige, bare tidsmessige og genuint koblede dimensjoner pluss koblingsnormen til projektoren fra romlig til tidsmessig; coupled_marginal_eigs gir Schur-komplementmarginalen { "{" }scale, offset{ "}" }. På de innsjekkede nettverkene rapporterer motoren et datum med full rang (defekt { "0" }) for det velstilte tilfellet og en nøyaktig defekt i én ratretning for tilfellet med én epoke (medgått tid null, så raten er uobserverbar per konstruksjon), og beregner marginalen { "{" }s, d_tau{ "}" } i begge.

seg-35eebbc8a2e9 = HVA SOM KONTROLLERES EKSTERNT, oppgitt snevert: kshana beregner egenverdidekomposisjonen med sin egen håndskrevne Jacobi-løser (fim::sym_eig) og marginalen med sin egen pseudoinvers; den uavhengige referansen beregner begge på nytt med numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) via scripts/gen_coupled_gauge_ref.py. Overensstemmelse til rel<{ "1e-3" } er derfor en kontroll med et uavhengig bibliotek av ARITMETIKKEN I DENNE CRATE-EN mot en standardimplementasjon, som er det validerte kravet og hele det. HVA SOM IKKE: sammenstillingen og klassifiseringen av nullrommet er denne modulens egne regler, og den uavhengige referansen reproduserer dem fra den samme spesifikasjonen i stedet for fra en uavhengig kilde - det bekrefter implementasjonen, ikke regelen. Geometrien for radiofyr og banefarkost er modellert og representativ. Observasjonsradene bærer den virkelige DE440-orienteringen for Månens hovedakser (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), men det er en INNDATA begge sider mottar, ikke belegg for svaret, og det er registrert her som proveniens og ikke som begrunnelsen for statusen - samme skille main allerede trekker i raden om integritet i felles modus. Hvert flyttall i radene er avrundet til { "6" } desimaler før network.json skrives, så begge sider leser identiske IEEE-754 doubles og den eneste forskjellen som gjenstår er løseren.

seg-63a8571f8eb0 = Degenerasjon mellom avstand og klokkeavvik i enveis lunar avstandsmåling, og designloven for geometrisk diversitet

seg-cdd70f56051a = Degenerasjonen mellom radiell avstand per node og mottakerens klokkeavvik er nøyaktig ved { "1" } m til { "3.336" } ns (én over c). Schur-komplementmarginalen { "{" }scale, offset{ "}" } (coupled_marginal_fisher) viser at i et geometrisk variert nettverk løfter tovegs avstandsmåling marginalen med omtrent samme faktor som et like stort antall ekstra enveisdata, mens i det idealiserte regimet med én node er løftet fra tovegs størrelsesordener større. Designloven som følger: geometrisk diversitet, ikke tovegs avstandsmåling som sådan, er det som skiller lunar rammeskala fra tidsskalaavvik i enveis avstandsmåling; en tovegs eller ekstern tidskobling trengs bare i regimet med lav diversitet eller én bruker.

seg-25dd0e9134c8 = Schur-komplementmarginal-Fisher av den koblede informasjonsmatrisen, i lineæralgebra på lukket form, kontrollert mot de to grenseregimene den forutsier. Ekvivalensen { "1" } m til { "3.336" } ns er definisjonen av meteren via c og er ikke et empirisk resultat. Observasjonsnettverkene er representativ modellert geometri, så designloven er en uttalelse om geometrien den er gitt og bærer ingen påstand om noe utplassert lunart nettverk.

seg-16ec8283f9b4 = Relativistisk kobling mellom klokkerate og ramme for lunar tidsskala

seg-d9a426dc8620 = rate_frame_jacobian(_with) gir følsomheten til raten for lunar tidsskala for rammerealiseringen, fra det ekvatoriale effektive potensialet avkortet ved grad { "2" } (GM, ekvatorradius, J2, rotasjon; LunarSurfacePotential): d_alpha/d_scale = L_m, omtrent +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, omtrent -1.11e-14 (tidsavhengig); d_alpha/d_r_radial = g_eff/c^{ "2" }, omtrent +{ "1.806e-17" } per meter. For et radielt datumskift på { "1" } m er dette en perturbasjon av raten på omtrent { "1.8e-17" } (en aritmetisk konsekvens av den radielle oppføringen), langt under rateavviket på omtrent { "1.7e-11" } for en lunar tidsskala mot TT

seg-a666792106d9 = Basisinvariant klassifisering av nullrommet for koblet ramme og tidsskala

seg-5ee36574d1b4 = classify_null_space dekomponerer nullrommet til datumet i bare romlige (dimensjon d minus rang U_T), bare tidsmessige (d minus rang U_S) og genuint koblede (rang U_S pluss rang U_T minus d) deler, pluss koblingsnormen til projektoren fra romlig til tidsmessig p_st_norm, Frobenius-normen av ikke-diagonalblokken i nullromsprojektoren. Hver av disse er en funksjon av PROJEKTOREN og ikke av en valgt basis, så de er invariante under ethvert ortonormalt valg av nullvektorer - som er det som gjør klassifiseringen mulig å rapportere i det hele tatt.

seg-2c074d6260ba = Representativ målemeny for flere teknikker og den additive Fisher-kombinasjonsregelen

seg-beefac5c1b13 = MeasurementBlock holder én kandidatmålekampanje som et 7x7 Fisher-informasjonsbidrag pluss en skalar relativ kostnad; block_from_rows bygger en fra rå datum-Jacobi-rader slik at hver blokk forhåndskondisjoneres identisk gjennom lunar_identifiability::assemble_multi_info; combine summerer informasjonen til en valgt delmengde, som er den riktige regelen fordi Fisher-informasjon er additiv over uavhengige målinger; representative_lunar_menu leverer en deterministisk meny med fire blokker (LLR, et tverrgående VLBI-limb-radiofyr, en banefarkost på nærsiden og en banefarkost på bakre side). Den budsjettbegrensede designoptimereren som bruker denne menyen er ikke en del av denne crate-en.

seg-d83a9942ee72 = Additivitet av Fisher-informasjon over uavhengige målinger er en egenskap på lukket form, kontrollert her mot en uavhengig skrevet elementvis sum og mot ordensinvariansen og monotonien som følger av den. MERKNAD OM EVIDENS: kombinereren hadde tidligere ingen test i det hele tatt, og den ene testen i modulen summerte de to informasjonsmatrisene inline i stedet for å kalle den, så en ødelagt kombinerer ville ha latt modulen forbli grønn; testen går nå gjennom combine og feiler når den muteres. Alle radiofyrplasseringer, banefarkostgeometri, presisjoner per teknikk og relative kostnader er representative valg og ikke oppdragsverdier (se tests/fixtures/llr_geometry/NOTICE.md), så hver degenerasjonsmetrikk og hvert CRLB-tall nådd gjennom denne menyen arver den modellerte statusen til lunar_identifiability::decompose.

seg-341eedfc47da = Konsistens for lunar ramme/dynamikk på tvers av leverandører (virkelig inter-efemeride)

seg-f8d94c0771cc = dekomponering med bare rotasjon (6 parametere translasjon+rotasjon) av uenigheten om den geosentriske Månen mellom DE440/INPOP21a/EPM2021 i en reduserbar felles ICRF-rammekobling og et ikke-reduserbart overskudd i orienteringen av lunar bane (den fulle Helmert-tilpasningen med 7 parametere er en separat offentlig funksjon som IKKE er dekket av denne eksterne kontrollen: dens evidens er en intern enhetstest for analytisk gjenvinning pluss tests/lunar_helmert_fit_cross_check.rs, som avstemmer den mot den validerte nøyaktige Gauss-Newton-tilpasningen i lunar_frame_realise og fester konvensjonen med motsatt rotasjonsfortegn mellom de to)

seg-c69fd3fc645b = Tre uavhengige autoritative efemerider — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — samplet via IMCCE calceph, kryssjekket med en uavhengig numpy SVD-tilpasning med minste kvadrater. HVORFOR DETTE ER validert DER lunar_common_mode IKKE ER DET, på de samme tre efemeridene: her ER den rapporterte størrelsen en egenskap ved de publiserte dataene — deres gjensidige uenighet — så efemeridene er den uavhengige referansen, ikke en inndata. I lunar_common_mode mater den samme uenigheten en MODELLED konstellasjonsgeometri og svaret er en egenskap ved den modellen, og derfor er den raden riktig modellert/ReferenceImpl.

seg-2d3347bcb15e = Toleranse for konsistens på tvers av leverandører for en bruker med blandede leverandører

seg-9decf2cb6b0c = consistency_tolerance: inverterer et posisjonsbudsjett for brukeren til et krav per parameter om Helmert-overensstemmelse mellom leverandører (origo/skala/rotasjon) ved en referansearm, eventuelt oppblåst av CRLB for realisering hos én leverandør (P1)

seg-b8dc68eb4bda = Trekantgrense for verste tilfelle for virkningen av Helmert-punkt-Jacobian (lukket form)

seg-5450d921dfc9 = Feilbudsjett for lunar interoperabilitet mellom flere leverandører og designlov for ramme mot efemeride

seg-e1e30f5c17a6 = interop_budget: reduserbar (felles rammekobling) mot ikke-reduserbar (dynamikk) oppdeling under konvensjonene PerProvider / CommonFrameTie / CommonEphemeris, med designlovmetrikken for ikke-reduserbar andel (~{ "0.69" } på virkelige DE440/INPOP/EPM: en felles rammemerking alene lar det dominerende gulvet stå)

seg-46304ae1efa4 = RMS-aggregering av de validerte oppdelingene per par under hver konvensjon (lukket form)

seg-a01f394a36d3 = Autonom lineæralgebra-pipeline for feilobserverbarhet i fritt nettverk (paritetsprojektor, detekterbarhet, MDB-ikke-sentralitet, bysantinsk blokk-spark)

seg-b3389bb90e8d = På det virkelige DE440-nettverket per node for Månen (hver rad en differensiell enveis avstand mellom noder bygd via pernode_range_row med en virkelig DE440 Moon PA-rammesiktlinje) beregner motoren den vektede paritetsprojektoren P⊥ = I − G(GᵀWG)⁺GᵀW (den rangdefekte pseudoinversformen som overlever gaugen datum⊕tidsskala med 8 dimensjoner), T1-detekterbarhetsresidualet ‖P⊥·b‖ (feil innenfor området utslettes, generiske feil er detekterbare), Baarda-MDB-ikke-sentralitetens kvadratiske form cᵀWP⊥c (den riktige vektede formen med enkelt P⊥, IKKE formen med dobbelt P⊥ cᵀP⊥WP⊥c) med MDB = √(λ₀/cᵀWP⊥c), og antallene for bysantinsk blokk-spark detekter/identifiser for de stablede effektive peer-signaturene P⊥·B_T (kolonnerang, ikke bare ikke-null)

seg-8cb248423fd0 = Uavhengig lineæralgebra-reproduksjon med numpy/scipy på virkelige DE440 Moon PA-rammesiktlinjerader (P⊥ fra SVD av det hvitgjorte designet W^{ "{" }1/2{ "}" }G; MDB-ikke-sentraliteten fra den klassiske kvadratiske normen i paritetsunderrommet etter Baarda ({ "1968" }); blokkrangen fra en numpy SVD-telling av singulærverdier) — en genuint annen numerisk vei enn den sykliske Jacobi-egenverdidekomposisjonen av GᵀWG i crate-en. Omfang (per tests/fixtures/faultobs/NOTICE.md): dette validerer KUN LINEÆRALGEBRA-PIPELINEN på disse radene. Nodegeometrien er modellert. Det er IKKE en operativ integritetsgaranti, en sertifisering av beskyttelsesnivå eller noen RAIM/ARAIM-tilgjengelighetspåstand, og IKKE en oppdragsgaranti for bysantinsk feiltoleranse — ANTALLET tolererte feil for dette nettverket er modellert, mens GRENSEN detect>f / identify>2f for blokk-spark er sitert (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blokkvis spark av Donoho–Elad { "2003" }) og bevist instansiering i kode

seg-ebb827739614 = Bysantinsk blokk-spark-grense for detektering/identifisering i det autonome nettverket per node for Månen (T3)

seg-4fb935e6193d = byzantine_bound instansierer koding/sparse-observerbarhetsgrensen for sikker tilstandsestimering på nettverksgeometrien per node: en bysantinsk peer injiserer en vilkårlig lineærkombinasjon av målingene den deltar i, og nettverket DETEKTERER enhver koalisjon på ≤ f = block_spark − { "1" } peers og IDENTIFISERER entydig enhver koalisjon på ≤ ⌊(block_spark − { "1" })/2⌋, der block_spark er den minste peer-koalisjonen hvis stablede effektive signaturer P⊥·B_T er kolonnerangdefekte. Peer-detekterbarhet er FULL KOLONNERANG for P⊥·B_j (en blokk som ikke er null men er rangdefekt er et angrep som ikke er null, som lander i range(G) og ikke etterlater noe residual), ikke bare P⊥·B_j ≠ { "0" }

seg-3b8b54db475d = Geometrisk instansiering av grensen for blokkvis spark / sikker tilstandsestimering (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blokkvis spark av Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — IKKE konsensusterskelen 3f+{ "1" } til Lamport–Shostak–Pease ('Bysantinsk' navngir bare feilmodellen med vilkårlige/samarbeidende feil). Det spesifikke antallet tolererte feil er en modellert egenskap ved den representative nettverksgeometrien, kontrollert for selvkonsistens med håndkonstruerte analytiske tilfeller og tellingsformlene

seg-4f57f586cf82 = Autonomt gulv for tidsmessig gauge ved holdover for den selvrefererende lunar konstellasjonen (T4)

seg-eb690e8f5c9b = holdover_floor fastslår at i et ensemble av autonome noder koblet bare av målinger mellom noder er den felles klokkeraten (δα_j += { "1" } ∀j) en fri parameter i ensembletid som ligger i N(GᵀWG): ingen mengde ekstra avstandsmåling mellom noder kan observere den (rate_in_gauge = true, temporal_gauge_dim = { "2" } sammen med det felles avviket). Dette er det genuine holdover-gulvet — det tidsmessige motstykket til gaugen for stiv rammeposisjon. Å legge til én ekstern absolutt ratekobling (en direkte lenke til en referanse utenfor nettverket) driver den felles raten ut av nullrommet (rate_in_gauge = false, temporal_gauge_dim = { "1" }), noe som beviser at gulvet er en virkelig gauge, ikke en artefakt i oscillatormodellen

seg-097f126797bb = Argumentet om frie parametere i ensembletid (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instansiert på det representative virkelige DE440-nettverket per node: en nulltest med relativt residual av den analytiske generatoren for felles rate mot GᵀWG, der kontrasten med brutt kobling skiller den genuine gaugen fra en artefakt i oscillatormodellen. Representativ modellert geometri, ikke et sertifisert tidsbudsjett

seg-25ffd6e1979c = Felles/differensiell oppdeling av leverandører, forening av én rangdefekt og beskyttelsesgapets helning (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Tre fasetter av den ene dekomposisjonen ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) med gaugen datum⊕tidsskala med 8 dimensjoner som N(G) og de state_dim − { "8" } = { "32" } observerbare retningene som range(G): (T5) provider_mismatch_split klassifiserer en felles bias hos flere leverandører (∈ range(G)) som UDETEKTERBAR — trenger en ekstern kobling — og en differensiell bias (∉ range(G)) som selvovervåket / DETEKTERBAR; (§{ "0" }) foreningen er at det SAMME blinde underrommet range(G) styrer den udetekterbare feilklassen, så datumgaugen N(G) og det feilblinde underrommet range(G) er én geometri, ikke to; (g7) slope returnerer helningen ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ for Brown-beskyttelsesgapet for en feil b ∈ range(G) (estimatoren ødelagt med null paritet) og endelig for en detekterbar feil

seg-e0fd3860fce9 = Algebra på lukket form for paritetsprojektor / pseudoinvers på det representative virkelige DE440-nettverket per node: den felles/differensielle oppdelingen, foreningen N(G) ⊕ range(G) og helningen på Brown-({ "1992" }) beskyttelsesgapet følger alle av utslettelse av range P⊥·G = { "0" }. Representativ modellert geometri, ikke et sertifisert beskyttelsesnivå

seg-101b0551d987 = Telecom-timing MTIE og TDEV på en tidsfeilserie for holdover

seg-b4762fd3cb9d = Maksimal tidsintervallfeil og tidsavvik som scenariotypen <c1/> rapporterer, på en holdover-registrering i telekomskala: en O(n) MTIE med glidende vindu og monoton kø (telecom_timing::mtie_sliding, nødvendig for at et døgn med sekundsamples skal forbli raskt) og motorens TDEV (allan::time_deviation), evaluert på nettet typen rapporterer og lest tilbake fra en full kjøring som tar inn serien

seg-59cb2711355c = allantools { "2024.06" } — et uavhengig bibliotek for frekvensstabilitet fra tredjepart — mtie() og tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, serien parset fra den samme teksten med 17 signifikante siffer på begge sider; referansen registrerer seriens SHA-256 og kan regenereres frakoblet via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validerer ESTIMATORENE på denne registreringen, ikke den syntetiske holdoveren som frembrakte den

seg-632add2dbd3c = ITU-T-masker for telekomsynkronisering med PASS/FAIL og margin

seg-47687529aee7 = Transkriberte grenser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst og ePRTC-A holdover (inkludert tidsfeilomhyllingen i Table { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-klassene A-D og G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referansepunkt C, hvert intervall åpent eller lukket slik tabellen oppgir det, med hver oppføring 'for further study' utelatt; en avgjørelse og en margin ved det bindende punktet per kontroll, og tiden til hvert budsjett overskrides. Kan kjøres som scenariotypen <c1/>

seg-165ed2bc771a = ITU-T-masker for wander-generering ved frekvenssynkronisering (G.811, G.812, G.8262, G.8262.1)

seg-953793d4446a = Sju wander-genereringsmasker for MTIE og TDEV ved konstant temperatur for typen <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) typene I, II og III, G.8262 (10/2024) EEC-alternativene { "1" } og { "2" } og G.8262.1 (11/2025) eEEC (låst modus), inkludert potenslovleddene tabellene skriver (<c2/> og lignende), hvert intervall åpent eller lukket slik det er trykt, målt gjennom filteret på { "10" } Hz klausulene oppgir (antatt anvendt før sampling); referansescenariet scenarios/telecom-synce-eec.toml setter en fritt løpende OCXO mot de tre EEC-maskene. Ikke implementert: tilleggene for variabel temperatur, holdover, transienter, jitter og G.811-frekvensnøyaktigheten

seg-ca16d9c98dc5 = Transkripsjon av de navngitte anbefalingene (lastet ned fra itu.int 2026-10-13), hver rad lest på nytt mot teksten, med kontinuiteten i knekkpunkter som de trykte koeffisientene innebærer avgrenset i testene (for eksempel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns mot platået på { "100" } ns i G.812 Table { "4" }). En standardtranskripsjon med interne konsistenskontroller, ikke en etterlevelsestest og ikke en ekstern validering. G.812 (06/2004) er oppført som erstattet av en forhåndspublisert utgave 08/2026 og G.811 har en Amd. { "1" } (04/2016); ingen av dem kunne leses, så ingen av dem er kontrollert. Scenariet med fritt løpende OCXO overdriver oscillatorens bidrag ved observasjonsintervaller som er lange mot sløyfens tidskonstant; det sier ingenting om noen utstyrsklokke

seg-5fc2ad88faf0 = Klokkeloggformater (RINEX clock, TimeLab ASCII, TAPR TICC) lest til en normalisert faseserie

seg-5b5bcbdea166 = clock_log::read_input: ett parserlag som gjør en RINEX-klokkefil (AS/AR-poster for én navngitt klokke, versjonene { "2" } og { "3.00" } til { "3.04" }), en fase- eller frekvenslogg i TimeLab-stil ASCII, eller en TAPR TICC-logg med tidsstempel eller intervall om til et uniformt fasenett, med tau0 oppgitt, fra en header, eller medianavstanden, hvert gap, avlesning utenfor nettet og duplikat telt, og en gap-policy som avviser, tar lengste løp eller lineær; koblet inn valgfritt i serien for telecom-timing (<c1/>, som legger til en blokk <c2/>) og clock-typen (<c3/>, som legger til en blokk <c4/> med ADEV, TDEV og MTIE, tabellens SHA-256 og fase-SHA-256; runs = { "1" }). Uten tabellen er begge typene byte-identiske

seg-acdb0337bce7 = Klokkeloggformatene linuxptp (ptp4l, phc2sys, ts2phc) og chrony (tracking, statistics) lest til en normalisert faseserie

seg-e87b3dba2072 = clock_log::read_input med formatene ptp4l, phc2sys, ts2phc, chrony-tracking og chrony-statistics: den loggede forskyvningen fra en linuxptp-servolinje (ns, linjens egen tidsstempel i hakeparentes, avlesninger før servoen første gang rapporterer s2 utelatt og telt) eller fra en chrony-tracking- eller statistikklogg (s, etter kolonneposisjon, UTC-dato og -tid) blir et uniformt fasenett gjennom de samme gap-policyene som de andre formatene; en kildevelger (<c1/>) navngir ett av flere grensesnitt, klokker eller adresser; loggene mater serien for telecom-timing, clock-typen og holdover-test-typen

seg-fb9393044576 = Fixturer skrevet for Kshana ut fra de offentlige linjeoppsettene til daemonene, med oppdiktede verdier (NOTICE.md i fixturemappen); ingen logg fra en virkelig installasjon ble lest og ingen uavhengig referanse sammenligner parsingen med en annen leser, så et oppsett som skiller seg mellom daemonversjoner kan fortsatt avvises eller feiltolkes. Estimatorene som mates av faseserien er de som er validert mot allantools i radene ovenfor

seg-97aebb84576e = Holdover-test vurdert fra en tidsfeilregistrering levert av operatøren

seg-ab533cf99c56 = Typen <c1/>: en tidsfeilregistrering (en linuxptp-, chrony-, TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns) deles ved de to tidspunktene operatøren oppgir for fjerning og gjenoppretting av GNSS i et trinn for grunnlinje, et for holdover og et for gjenoppretting; grunnlinjen måles mot ITU-T-maskene skrevet for en låst klokke og holdoveren mot de som er skrevet for holdover eller en autonom klokke, ePRTC-A-holdoveromhyllingen og tidsfeilbudsjettene; holdoveren rapporterer frekvensforskyvningen med minste kvadrater som systemet holdt, og gjenopprettingen om og når |TE| kom innenfor et oppgitt bånd og ble der i en oppgitt oppholdstid, med toppen og det største trinnet. Hver grense er den telecom-timing-typen transkriberer; de to tidspunktene er operatørens påstand og verifiseres ikke

seg-a54380cf95ea = Håndberegning på registreringer bygd fra formler hvis helning, trinn, ekstremum og gjenopprettingstid er kjent før kjøringen (testene oppgir dem), og maskene, omhyllingen og budsjettene i radene for telecom-timing ovenfor. Ingen laboratoriemåling av en virkelig holdover ble vurdert og ingen ekstern uavhengig referanse ble sammenlignet, så typen gjør ingen påstand om noen klokke eller noe system; en partner med tidslaboratorium trengs før noe tall per klokkeklasse kan fremmes

seg-94cbac97a1aa = Tilgjengelighet for GNSS-signaler i Space Service Volume og utover, sammenlignet med ICG SSV-heftet

seg-c59e349fdc9e = Tilgjengelighetssveipene til typen <c1/>: per konstellasjon (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og kombinert, andelen (bruker, epoke)-par med minst ett og minst fire signaler og det lengste utfallet, for en bruker på en kule (heftets globale skall på 2,562 punkter, { "14" } dager ved { "1" } minutt) eller på en bane (GEO, HEO, månetransfer), fra de keplerske banene i heftets vedlegg C, en konstant minste utstrålt effekt innenfor referansevinkelen utenfor siktaksen, jordblokkering av kulen pluss { "50" } km og en C/N0-terskel; brukerantenner fra heftets tabell B10

seg-d71c9d361342 = ICG Space Service Volume-heftet (UN OOSA ST/SPACE/75, { "2018" }), selv en simulering, sammenlignet under en forhåndsregistrering innsjekket før kjøringen (xval/gnss-ssv/PREREGISTRATION.md; resultater i xval/gnss-ssv/RESULTS.md, festet av tests/ssv_booklet_results.rs, inkludert resultatene som ikke ble nådd). Kjøring { "1" } på den forhåndsregistrerte lesningen: konstantene for minste utstrålt effekt og månetersklene stemmer overens (S0, S6 nådd); tersklene for øvre og nedre SSV, RF-terskel, GEO og HEO er NOT MET, nesten alle gjennom GLONASS, for hvilken heftet gir { "20" } og { "28" } grader i tabellene B2 og B6 og { "26" } og { "34" } grader i tabell { "4.2" }. En diagnostisk variant med vinklene fra tabell { "4.2" } stemmer overens i hver celle for øvre SSV, nedre SSV og de seks GEO-oppdragene (den erstatter ikke kjøring { "1" }; cellene for RF, HEO og måne stemmer fortsatt ikke). De målte GPS L1-panelmønstrene reproduseres ikke av den parametriske stand-in (RMS { "6" } til { "9" } dB mot en terskel på { "3" } dB). Overensstemmelse viser at heftets oppgitte metode reproduseres, ikke at GNSS-signaler oppfører seg slik

seg-d2f04991c8a4 = Effekter av limb-stråle på ionosfære, plasmasfære og atmosfære på streifende GNSS-signaler, og utformingen av mottakeren for svake signaler, i typen <c1/>

seg-1a1786ba90b6 = En Chapman-ionosfære, en plasmasfære av Gallagher-typen og en nøytral atmosfære (brytningsbøyning, oksygenabsorpsjon, defokusering) integrert langs den rette strålen mellom sender og bruker: skrått totalt elektroninnhold, dets plasmasfæriske del, ekstra forsinkelse, tangenthøyde og tapet på streifende lenker; og en utforming av mottaker for svake signaler (koherent og ikke-koherent integrasjon, databitgrense, støtte, Dopplersøk) som setter C/N0-terskelen fra modellene for oppfangning og sporingssløyfe

seg-4ca1217472ab = Lukkede former og publiserte størrelser i testene (toppen til et Chapman-lag og bøyningen av overflatelimben, noen få TECU plasmasfære på en GPS-til-GEO-stråle); mottakerutformingen gjenbruker modellene for oppfangning og sporingssløyfe og deres tester. Ingen målte data fra limb-sondering eller mottak av svake signaler er sammenlignet med den

seg-6b8f9f3ca2a3 = Navigasjonsfilter om bord for GNSS for romfartøy i høy bane og månetransfer

seg-39ddc494f103 = Modusen <c2/> i typen <c1/>: et utvidet Kalman-filter med ni tilstander (posisjon, hastighet, mottakerklokkens bias og drift, en skala for solstrålingstrykk) på pseudoavstander hvis tilgjengelighet, støy og C/N0 kommer fra samme lenkegeometri som sveipene; referansen integreres med J2, tredjelegemene Sol og Måne og strålingstrykk med skygge, filteret modellerer J2 og tredjelegemene og estimerer strålingstrykket; rapporterer posisjons- og hastighetsfeil innenfor og over GNSS-banene, det lengste målingsgapet og gjennomsnittlig NEES

seg-469602656ab4 = Simulert referanse mot filterets eget estimat (et konsistent filters gjennomsnittlige normaliserte estimeringsfeil i kvadrat er omtrent { "3" } for posisjonen) og determinisme for et fast seed. Ingen flyvedata eller registrerte GNSS-data fra høy bane er sammenlignet; Solen og Månen er sirkulære stand-ins med lav presisjon

seg-5fc242476828 = Relativ navigasjon for en formasjon av flere romfartøy i en sterkt elliptisk bane fra GNSS

seg-f67eb29d4483 = Modusen <c2/> i typen <c1/>: en hovedfarkost og følgefarkoster kjører hver det absolutte filteret; følgefarkostens posisjon relativt til hovedfarkosten estimeres ved å trekke fra de absolutte estimatene og med et relativt filter på enkeltdifferensierte pseudoavstander for signalene begge farkoster sporer, med den relative dynamikken som differansen mellom to ikke-lineære baner

seg-69c078b57fc8 = Den samme simulerte referansen som for det absolutte filteret: det relative filterets feil mot den sanne relative tilstanden, og kontrollen av at det gjør det minst like bra som å trekke fra to uavhengige absolutte posisjonsbestemmelser. Ingen flyvedata for formasjon er sammenlignet

seg-7038f6902820 = Feilledd i kaldatom-interferometer: Raman-laserfasestøy, bias fra bølgefrontkrumning og oppløsning av fringe-flertydighet

seg-4d9690207607 = inertial::cai_error_terms (biblioteksfunksjoner, ennå ikke nåbare fra en scenariotype): vektingsfunksjonen for Raman-fase for et interferometer med tre firkantpulser (Cheinet et al. { "2008" }, Eq. { "8" }) med den lukkede formen for hvit fase (pi/2)^{ "2" } S_phi0/tau_R og en numerisk vei for ethvert spektrum; laserfrekvensstøyen som forsinkelsen ved retroreflektering ikke kansellerer (Le Gouet et al. { "2007" }, Eqs. { "9" } til { "11" }); ren defokus-bølgefrontbias sigma_v^2/R for en termisk sky og dens reduksjon med en deteksjonsradius; sannsynligheten for feil fringe-indeks erfc(pi/(sqrt({ "2" }) s)) for en hjelp fra et klassisk akselerometer og for to avhørstider, og dens invers

seg-a7b220763674 = Hver lukkede form mot en uavhengig numerisk vei i testene (kvadratur i frekvensdomenet av den nøyaktige overføringsfunksjonen og forsinkelsesfilteret, en Monte Carlo over atomer for bølgefrontbiasen, en Monte Carlo over skudd for fringe-indeksen) og dens grensetilfeller. Én publisert regnet verdi: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) oppgir at ved tau_R = { "20" } us trengs en hvit Raman-fasestøy under -111 dB rad^2/Hz for { "1" } mrad per skudd; det hvite leddet alene gir { "0.99" } mrad (artikkelen utleder nivået med sin Eq. { "17" }, flimmer pluss hvit). Intern konsistens og én regnet verdi, ikke en ekstern validering; høyere ordens aberrasjoner og støyen til en bestemt laser er ikke modellert

seg-c380ec16a4f8 = Greenhall og Rileys eksakte ekvivalente frihetsgrader for Allan-, modifisert Allan- og Hadamard-varians

seg-dee2a54c5019 = allan::edf_greenhall (med omslagene edf_greenhall_adev, _mdev og _hdev): hele algoritmen til Greenhall og Riley, Proc. 35th PTTI ({ "2003" }), Section { "3" } (Eqns { "7" } til { "13" } og koeffisientene for stor J i Tables { "1" } til { "3" }), for differanseordener { "1" } til { "3" }, støyeksponenter +{ "2" } til -4 overalt der alpha + 2d > { "1" }, overlappende og ikke-overlappende, modifiserte og umodifiserte estimatorer; NaN der den ikke gjelder, inkludert det umodifiserte tilfellet hvit PM med ceil(M/S) <= d, hvis lukkede form ikke er implementert. assurance::uncertainty::edf deler nå koden og beholder utdataene bit for bit

seg-363705e03bac = Holdover-forhåndsinnstillinger for oscillatorer fra offentlige datablad

seg-9750d9e0ec7a = Fire forhåndsinnstillinger — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (Microchip 5071A høyytelsesrør) og CSAC (Microchip SA.45s) — hver med databladets maksima for Allan-deviasjon, aldring og temperaturgrense; en ikke-negativ minste kvadraters tilpasning av frekvensstøy med hvit + flimmer + random walk skalert til å omhylle hvert databladpunkt, et flimmergulv aldri under tallet for lengste τ, lineær aldring og et sinusformet temperaturledd, syntetisert som en seedet holdover etter et GNSS-tap

seg-69f93d5ec864 = Holdover-prediksjon fra en målt klokkeregistrering, kontrollert på tilbakeholdte data

seg-8bdc5a24c66d = Den målte registreringsveien til typen <c1/>: den overlappende Allan-deviasjonen til en faseregistrering tilpasset med edf-vektet ikke-negativ minste kvadrater i basisen hvit fase og IEEE Std { "1139" } frekvensmodulasjon (slot_timing::fit_weighted), deretter invertert for frittløpstiden der tidsfeilen når en terskel (slot_timing::slot_budget). Gulvet for rød støy måles fra registreringen i stedet for å antas

seg-c888226296fe = En virkelig fritt løpende atomklokke: { "556 990" } sekundfasesamples fra en cesium 5071A-standard målt mot en hydrogenmaser (A. Wallin, distribuert med allantools; festet commit og SHA-256 i scripts/fetch_cs5071a.sh), den samme registreringen tests/cs5071a_reference.rs bruker for estimatorene. De tilbakeholdte to tredjedelene er en ekstern måling prediksjonen aldri så. Betinget av data: arbeidsflyten realdata-clock henter registreringen og kjører testen med KSHANA_REQUIRE_REALDATA={ "1" }. Validerer veien tilpass-så-inverter på en atomstandard dominert av hvit FM over frittløpstider opp til omtrent { "50 000" } s; ikke databladet eller klassekildene, ikke de deterministiske leddene. IKKE en krystalloscillator: på en målt OCXO-registrering (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h mot en hydrogenmaser) er den tilbakeholdte prediksjonen konservativ, på { "0.59" } til { "0.70" } av det målte bruddet, og for det meste utenfor terskelen, fordi oscillatorens støygulv ble halvert under registreringen; i utvalget er den innenfor { "0.98" } til { "1.17" }. Krystalltilfellet forblir MODELLED. IKKE atomklokker i bane heller: på { "10" } GPS Block IIF-satellittklokker (tests/slot_timing_igs_holdout.rs, IGS endelige { "30" } s-klokker, { "14" } dager, protokoll skrevet før nedlasting) havner { "8" } innenfor terskelen og { "2" } (G25, G30) er optimistiske med opptil omtrent 2x, så under protokollen forblir tilfellet i bane MODELLED

seg-d7e03158b972 = Sekunder til en fritt løpende klokke forlater vakten til et tidsindeksert slot, og fix-kadensen som holder den innenfor

seg-0b4d8815f756 = Typen <c1/>: den predikerte feilen E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertert for bruddet, gjenværende tid, resynkroniseringsintervallet netto av fix-latens og fixer per døgn, hvert ledd spesifisert med det dominerende navngitt; klokker fra de seks standardene i ClockClass (TCXO, OCXO og RAFS lagt til, hver med ett datablad som kilde), forhåndsinnstillingene for telecom-timing, et innebygd datablad eller en målt registrering; et brudd utover kildens lengste midlingstid flagges som ekstrapolert

seg-cc0464060e58 = Lukkede former for hvert ledd alene og den uavhengige rotsøkingen holdover::holdover_seconds; databladtallene er de navngitte dokumentene (docs/SLOT-TIMING.md). En klassestandard hviler på et antatt gulv for rød støy og en databladkilde er en omhylling av maksima, så ingen av dem er en måling av noen enhet

seg-2797643153dc = Beskyttelsesnivå for tidssynkronisering for en mottaker i bane under GNSS-spoofing

seg-cb412a2ffadf = orbital_timing::orbital_timing, tilgjengelig som spoofing-seksjonen i <c1/>-typen: hastighet og omløpstid i sirkulær bane, lengste tid en spoofer på bakken kan nå satellitten per overflyvning, gulvet til den klokkestøttede monitoren og CUSUM-deteksjonsforsinkelsen, det betingede beskyttelsesnivået (gulvet pluss drift over forsinkelsen), trekket en spoofer med oppgitt maksimal rampehastighet rekker å akkumulere før satellitten forlater fotavtrykket sitt eller en uavhengig kontroll kjøres, og om hver kontroll via bakkekontakt eller krysslenke er uavhengig av én spoofer på bakken

seg-3d441db3a373 = Reduksjon til det eksisterende beskyttelsesnivået for tidssynkronisering og de lukkede formene for synlighet med sirkulær bane og sfærisk jord. Betinget av deteksjon, én terrestrisk spoofer med oppgitt rampehastighet, en overflyvning rett overhead på en jord uten rotasjon; ikke validert på en spoofet mottaker i bane

seg-158a99d40b0d = Lukkede former for effekttetthetsspektre og spektrale separasjonskoeffisienter for L-bånd-signaler

seg-17060c71fa54 = Effekttetthetsspektre med enhetsareal for GPS L1 C/A og L2C (BPSK({ "1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), sine-BOC({ "1,1" }) og Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, med en MBOC-variant lagt til), deres numerisk lokaliserte nullpunkter og maksima (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz), og den spektrale separasjonskoeffisienten til et signal mot et vilkårlig spektrum ved en vilkårlig forskyvning (navsignal::spectral_separation_coeff_offset) eller mot en tone, flat støy, en chirp eller tilpasset støy (spectrum::Jammer::ssc), med anti-jam-koeffisienten Q = 1/(R_c kappa)

seg-d8fadba57203 = Publiserte lærebokverdier: BPSK(n)-hovedloben på 2n x { "1.023" } MHz fra null til null og anti-jam-koeffisientene Q = { "1" } for en smalbåndet (CW) jammer og Q = { "1.5" } for en spredtspektrum-jammer tilpasset C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3. utg., avsnitt { "9.4" }); BOC(m,n)-hovedlobene sentrert på pluss eller minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); de spektrale separasjonskoeffisientene -61.8, -64.8 og -67.8 dB/Hz for C/A med C/A, BOC({ "1,1" }) med BOC({ "1,1" }) og C/A med BOC({ "1,1" }) (Betz { "2001" }; Hein m.fl., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, mai/juni { "2006" }), gjengitt her fra deres lukkede former for autokorrelasjon etter Parseval. BOC({ "1,1" })-maksimum ligger ikke ved { "1.023" } MHz: loben strekker seg fra bærebølgens nullpunkt til { "2.046" } MHz og har toppen ved { "0.759" } MHz, og testen fastlegger begge. MBOC-blandingen er ICD-definisjonen, kontrollert bare for enhetsareal og linearitet

seg-f134975d4ffa = Vannfallsdiagram av L-bånd-spekteret med J/S per bånd og effektiv C/N0 under en skriptet jammer-tidslinje

seg-86ad8f89a822 = <c1/>-typen: et frekvens-mot-tid-rutenett av effekttettheten i L-båndet (termisk gulv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalene ved sine minste mottatte effekter i grensesnittspesifikasjonen, og jammere med kontinuerlig bølge, smalbånd, chirp og tilpasset støy med av- og på-tidspunkter), der hver celle er gjennomsnittet over sin binge og rad (chirper nøyaktig over hele og delvise sveip, jammere etter driftssyklus), effektiv C/N0 per bånd = [1/(C/N0) + sum (J/S) kappa]^-1 per rad, J/S per bånd, J/S i båndet, og et SVG-vannfallsdiagram med C/N0-søyler. Rapporten inneholder en kryssjekk mot kjeden til <c2/>-typen på de samme linkinndataene

seg-deead3dc3c43 = Reduksjon til anti-jam-ligningen og linkbudsjettet til den eksisterende <c1/>-typen (den samme koden, kalt med de samme inndataene), og den lukkede formen for støygulvet k T0 F. Signalspektrene under er den validerte raden ovenfor; jammereffekter, tidslinje og båndbredder i frontenden er scenarioinndata, spektrene er kontinuerlige (ingen spredekodelinjer), og ingen automatisk forsterkningsregulering, blanking eller antennemønster virker på jammeren. Det finnes ikke noe målt jammet spektrum i depotet å kontrollere sammensetningen mot. Q-tabellen til <c2/>-typen (CW og smalbånd { "1" }, bredbånd og feiet { "2" } siden { "0.36" }: lærebokverdiene, fastlagt mot de lukkede formene i navsignal) stemmer med denne modellens CW-verdi og avviker fra det den utleder for støy tilpasset C/A ({ "1.5" }) og for flat støy fra null til null uten normalisering i båndet ({ "2.2" }); rapporten skriver ut begge

seg-1461dcaed6be = SigMF-opptak inn og ut, og Welch-spektralestimater av komplekse IQ-data

seg-2195d95299b2 = sigmf: leser og skriver opptak i Signal Metadata Format (JSON .sigmf-meta med feltene core global, captures og annotations; rå .sigmf-data som cf32_le, ci16_le eller ci8, heltallsdekoderne delt med realdata::iqif::load_iq), alt på strenger og bytebuffere. spectrum::welch_psd: periodogrammer med Hann-vindu, overlapp og gjennomsnitt, tetthetsskalert, på en radix-2-transformasjon i selve craten (spectrum::fft_in_place). Disse to er det validerte kravet. spectrum::synthesise_iq trekker modellen som IQ, og <c1/>-typens [iq]-seksjon kjører modell til IQ til SigMF til Welch og sammenligner med modellen; dens [recording]-seksjon estimerer et ekte opptak (native bygg); syntesen og disse modellsammenligningene ligger utenfor det validerte kravet

seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) med det samme periodiske Hann-vinduet, overlapp, tetthetsskalering, ingen detrend og tosidig gjennomsnitt: hver binge innenfor { "1e-12" } relativt (observert { "6.0e-14" }) over { "27" } tilfeller, med segmentantall hentet fra scipys eget spektrogram. sigmf-python { "1.13.0" } (LGPL-3.0, kjørt som verktøy) skriver fem tredjepartsopptak (cf32_le, ci16_le, ci8, to opptak med annotasjoner, en ikke-null første sample_start) som craten dekoder bitidentisk med identiske core-felt, og leser craten sine opptak tilbake bitidentisk; metadataskjemaet for SigMF { "v1.2.6" } rapporterer null feil på cratens metadata. Toleransene ble fastsatt før den første sammenligningen. Utenfor kravet: spectrum::synthesise_iq og sammenligningene av [iq] og [recording] med modellen (en syntese har ikke ett eneste riktig svar; en periodisk chirp viser linjer, Fresnel-rippel og kanthaler som den glatte modellen utelater, total effekt innenfor { "2" } %), konvensjonen for skalering fra heltall til flyttall (craten dividerer med { "32767" } og { "127" }, sigmf-pythons autoscale med { "2" }^{ "15" } og { "2" }^{ "7" }, noe spesifikasjonen lar stå åpent; sammenligningen bruker rå koder), flerkanalsopptak og de datatypene leseren avviser

seg-bf2d02d76762 = Planetposisjoner gjennom hele solsystemet fra Keplers baneelementer fra JPL (Standish)

seg-c9d3549045eb = Heliosentriske posisjoner for Merkur, Venus, jord-måne-barysenteret, jorden, Mars, Jupiter og Saturn fra Standish tabell { "1" } ({ "1800" } e.Kr. til { "2050" } e.Kr.), og for alle åtte planetene fra tabell 2a/2b ({ "3000" } f.Kr. til { "3000" } e.Kr., med middelanomalitermene b, c, s, f), etter algoritmen på JPL-siden trinn for trinn og rotert til ICRF (International Celestial Reference Frame) med sidens skråstilling; jorden skilles fra barysenteret med månerekken til Montenbruck & Gill og massforholdet. Sammensatt som ephem_provider::AnalyticSolarSystem slik at et hvilket som helst legeme er tilgjengelig relativt til et hvilket som helst annet, og kjørbar som <c1/>-typen

seg-4ea08a296b37 = Posisjoner for Solen, Månen, Merkur og Venus fra DE440-kjernen ved UTC-epoker (KernelEphemeris)

seg-8d47467c36e4 = Geometriske posisjoner for Solen, Merkur, Venus, jorden og Månen i forhold til hverandre (J2000/ICRF-akser, meter) fra en JPL DE440-kjerne gjennom ephem_provider::KernelEphemeris ved UTC-epoker: legemsnavn avbildet til NAIF-koder, UTC ført gjennom skuddsekundtabellen og TT til TDB med TDB-TT-rekken med to ledd, kjernen lest av motorens egen leser. Et legeme kjernen bare har som systembarysenter (Mars til Neptun, Pluto i de440s) avvises og erstattes aldri. Standish-raden uten kjerne forblir nettleser- og reservestien

seg-b59153f28d69 = Lystid mellom legemer i solsystemet

seg-48ebe0983725 = Den newtonske enveis lystiden fra et hvilket som helst legeme til et hvilket som helst annet, mottatt ved en epoke, løst av den radiometriske fastpunkt-løseren for lystid (radiometric::light_time_solution, sender ved sin forsinkede posisjon) gjennom solar_system::link_on på en vilkårlig EphemerisProvider; solar-system-typen kjører den på det analytiske solsystemet i heliosentrisk system (solar_system::link). Tovegsavstanden fra radiometric::two_way_range og Shapiro-forsinkelsen fra Solen fra radiometric::shapiro_delay rapporteres hver for seg og sammenlignes ikke eksternt. Sendt ut for hvert legeme mot en observatør og for en ekstra link av <c1/>-typen, og for nedlinken fra legeme til jorden av <c2/>-typen

seg-6e0b9687e8ee = Uranus og Neptun fra Standish tabell { "1" }, Pluto og planetenes hastigheter

seg-df3bf502dfe9 = Posisjoner for Uranus og Neptun fra Standish tabell { "1" } (standard innenfor { "1800" } e.Kr. til { "2050" } e.Kr.), Pluto fra raden i tabell { "1" } fra { "1992" } som den gjeldende JPL-siden ikke lenger oppfører, og den heliosentriske hastigheten til hver planet: den todelte deriverte med middelbevegelsen elementene gir, pluss dreiningen av ellipsen fra endringsratene til perihel, inklinasjon og node

seg-f49245efe44f = Målt mot JPL Horizons DE441 (de samme committede testdataene), men ikke validert: de oppgitte tallene i tabell { "1" } for Uranus og Neptun overskrides med opptil { "2.0" } og { "5.2" } ganger mot heliosentriske DE441-posisjoner (Neptun holder dem mot barysentriske posisjoner, noe som tyder på at tilpasningen ikke var heliosentrisk), siden oppgir ingen feil for Pluto, og det finnes ingen publisert grense for hastighetene. Tabell 2a/2b holder sine egne tall for Uranus og Neptun og dekkes av den validerte raden

seg-a50be56f605a = Posisjoner for Månen og sju store måner (Phobos, Deimos, de galileiske månene, Titan)

seg-2cfbe5a1eece = Den geosentriske Månen fra rekken til Montenbruck & Gill (hvis ledd på -1.3972 grader per århundre allerede viser den til J2000-jevndøgnet), og planetosentriske posisjoner og hastigheter for Phobos, Deimos, Io, Europa, Ganymede og Callisto fra JPL Solar System Dynamics sine middelelementer i hver månes Laplace-plan med middellengderaten hentet fra den IAU-synkrone rotasjonsraten (tabellen oppgir perioden med for få siffer til å holde fasen), og for Titan fra IAU-rotasjonsmodellen (månen på minus den legemsfaste x-aksen ved middelavstand), fordi Titans trykte Laplace-planrad ikke gjengir Horizons selv ved sin egen epoke

seg-6c81bd570fe5 = Målt mot JPL Horizons satellittefemerider (DE441, MAR099, JUP365, SAT441) committet i tests/fixtures/solar_system/horizons_satellites_icrf.csv med spørringen og hentedatoen; det finnes ingen publisert nøyaktighet for middelelementer eller for plasseringen fra rotasjonsmodellen, så de fastlåste tersklene fanger regresjoner og validerer ikke. Middelelementene utelater de resonante og solare forstyrrelsene, og Phobos' sekulære akselerasjon er ikke modellert

seg-8b8c8e28ece9 = Fysiske konstanter for hvert legeme i solsystemet og rapporten for hele systemet

seg-d225a30de35c = Body får Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymede, Callisto og Titan (gravitasjonsparameter, referanseradius, J2 der den er publisert med radiusen den refererer til, IAU-pol og nullmeridian), et navneoppslag og en BodyFacts-post (NAIF-kode, klasse, overordnet legeme, ekvatorial radius og middelradius); <c1/>-typen rapporterer dem for alle atten legemer sammen med posisjoner, lystider og et banespor over ett omløp, der hvert legeme er merket VALIDATED eller MODELLED

seg-6adc29de51fd = Transkripsjon av publiserte konstanter, hver sitert der den er definert: gravitasjonsparametere fra JPL Horizons sine legemesposter og JPLs tabell over fysiske satellittparametere, radier fra JPLs tabeller over fysiske parametere (IAU WGCCRE { "2015" }), poler og nullmeridianer fra IAU Working Group on Cartographic Coordinates and Rotational Elements (middelverdier, uten T-rate og periodiske ledd), J2 fra Smith m.fl. { "2012" }, Iess m.fl. { "2018" } og { "2019" }, og Jacobson { "2009" } og { "2014" }. Kontrollert for intern konsistens (Jupiters rotasjonsperiode mot System III-raten, hver J2 mot sin referanseradius), ikke mot en ekstern uavhengig referanse. { "0.30" } runde { "2" }: GM-verdiene ble overtatt fra gm_de440 og elementene for Phobos og Deimos fra pck00011, slik at { "0" } av { "84" } konstanter for de fjorten tilføyde legemene nå avviker fra NAIF (var { "12" }), noe som er en transkripsjonskontroll og ikke telles. { "0.36" }: den IAU-legemsfaste orienteringen og GM for de fjorten tilføyde legemene er skilt ut til sin egen VALIDATED-rad ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); denne raden beholder det som er igjen. J2 og middelradius er sitert, ikke validert; posisjonene i rapporten hviler på sine egne rader; og rapportens prime_meridian_deg for jorden, Månen og Mars forblir på konvensjonelle konstanter (opptil { "6.6e-3" }, { "2.8e-2" } og { "9.6e-4" } rad fra IAU_<BODY>). Revisjoner i { "0.30" }: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Phobos ekvatorialradius { "13.1" } -> { "13.0" } km; prime_meridian_deg inneholder nå de kvadratiske og periodiske leddene

seg-fa8a4b082cd5 = IAU-orientering og gravitasjonsparameter for de fjorten tilføyde legemene i solsystemet

seg-fc8d277aa2fd = Body::iau_rotation_et, rotasjonen fra J2000 til det IAU-legemsfaste systemet for Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymede, Callisto og Titan med hver århundrerate, kvadratisk ledd og periodiske ledd legemet har i pck00011, og gravitasjonsparameterfeltet mu for de samme fjorten legemene. Solen, jorden, Månen og Mars har konvensjonelle konstanter som eies av andre rader og dekkes ikke

seg-87ab655f8270 = Posisjonering rundt et hvilket som helst legeme i solsystemet med en lokal konstellasjon og en dypromslink fra jorden

seg-d9b1b0ac97d3 = <c1/>-typen: en orbiter eller en landingsfarkost på overflaten rundt et legeme valgt ved navn navigerer med enveis pseudoavstander fra en Walker-navigasjonskonstellasjon rundt legemet (todelte baner med legemets sekulære J2-drift, en ukjent brukerklokke) og en valgfri klokkefri tovegsavstand fra jorden, med jordens retning og avstand fra den analytiske efemeriden ved hver epoke; siktlinjer blokkert av legemets kule og en elevasjonsmaske på overflaten; per epoke GDOP og PDOP for konstellasjonen alene (orbit::dop), den formelle posisjonsusikkerheten med og uten jordraden, og sådde Gauss-Newton-posisjonsbestemmelser (batch_ls::gauss_newton) for hver variant, med lystiden og rundturen fra legemet til jorden

seg-3538c49df107 = Lukkede former og selvkonsistens: Keplers tredje lov for relébanens periode, banens radius og overflateradiusen holdt over kjøringen, at tillegg av en måling aldri øker den formelle usikkerheten, og at de sådde feilene stemmer med kovariansen. Relébanene ser bort fra tredjelegemer (Jupiters trekk på reléer rundt Europa er ikke modellert), støyen er gaussisk på oppgitte nivåer og målemodellen er øyeblikkelig, så dette er ikke validert mot navigasjonsdata fra noe oppdrag

seg-281b680a9897 = Geometri for Walker-konstellasjoner og de publiserte nominelle posisjonene for GPS, Galileo og GLONASS

seg-cba54289b732 = Generatorene til <c1/>-typen: Walker delta- og stjernemønstre i T/P/F-konvensjonen (nodeavstand 360/P eller 180/P, avstand i planet { "360" }·P/T, faseforskyvning mellom plan { "360" }·F/T), og GPS-grunnkonstellasjonen og den utvidbare med 24 posisjoner, Galileo- og GLONASS-forhåndsinnstillinger bygget fra deres publiserte nominelle elementer, plassert i et jordfast system med Greenwich-timevinkelen dokumentene deres oppgir

seg-bdf83007af50 = Publiserte byrådokumenter: Galileo Open Service Service Definition Document utgave { "1.1" } (European GNSS Service Centre) tabell { "1" } og { "23" }, referansekonstellasjonen 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document utgave { "5.1" } ({ "2008" }) avsnitt { "5.2" }, formelen for posisjonene til nodelengde og breddeargument; GPS Standard Positioning Service Performance Standard 5. utgave (april { "2020" }) tabell 3.2-1, 3.2-2 og 3.2-3, inkludert kolonnen for ekvatorkryssing av bakkesporet, som er en uavhengig angivelse av den jordfaste geometrien forhåndsinnstillingen må gjengi. Validerer generatorene og transkripsjonen; BeiDous faser i middels bane og noder i skråstilt geosynkron bane er ikke publisert og dekkes ikke

seg-0f1d49ab5d51 = Global fortynning av presisjon for GPS-grunnkonstellasjonen

seg-83775b77f5ca = Dekningsmotoren til <c1/> på GPS-grunnkonstellasjonen med 24 posisjoner under vilkårene i vedlegg B til GPS Standard Positioning Service Performance Standard (SPS PS) (ett siderisk døgn, { "287" } trinn på fem minutter, et globalt rutenett på { "4" } x { "4" } grader vektet med cosinus til breddegraden, alle i sikte, maske på { "5" } grader, én mottakerklokke): den globale HDOP-fordelingen, PDOP-medianen og tilgjengeligheten med PDOP på høyst 6, globalt og på det verste stedet

seg-6fb3c2028c4a = GPS SPS PS 5. utgave (april { "2020" }) vedlegg B avsnitt B.3.2.2 og B.3.2.3, den publiserte globale gjennomsnittlige HDOP-fordelingen for den fullt besatte grunnkonstellasjonen med 24 posisjoner (median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, gjennomsnitt { "0.96" }), tabell 3.8-1 (PDOP-tilgjengelighet) og tabell B.3-1 (ensemble-PDOP for en degradert konstellasjon, brukt bare som øvre grense), pluss en håndutledet lukket form for én epoke. VDOP- og PDOP-fordelingene for hele konstellasjonen er publisert bare som en figur, så PDOP er fastlåst ensidig; det verste tid-rom-punktet (HDOP { "2.40" } og VDOP { "5.22" } her, { "2.49" } og { "5.43" } publisert) avhenger av rutenettet og rapporteres, ikke fastlåst

seg-7d4d7200cbca = Dekning og kart over fortynning av presisjon for vilkårlige konstellasjonsutforminger med flere konstellasjoner i stor skala, rundt et hvilket som helst sentrallegeme

seg-b78b79e9fae4 = <c1/>-typen utover de to fastlåste tilfellene: eksplisitte utforminger og utforminger med flere skall, flere konstellasjoner per kjøring med én mottakerklokke per konstellasjon, jorden, Månen og Mars fra legemekonstantene, BeiDou-forhåndsinnstillingen (fase i middels bane og kryssing ved { "118" } grader Ø i skråstilt geosynkron bane modellert), satellitter i sikte per celle, GDOP, PDOP, HDOP, VDOP og tilgjengelighet, nedsamplede bakkespor, og et forhåndsfilter for synlighet etter undersatellittens breddegrad som kjører en utforming med { "5" } 000 satellitter på et { "10" }-graders rutenett på en brøkdel av et sekund

seg-278c77438493 = Et lenket oppdrag på tvers av scenariotyper på én felles tidslinje

seg-3dcfb26f6234 = Fasene til <c1/>-typen: hver fase kjører ett eller flere scenarioer av eksisterende typer gjennom run_toml, leser utdataene deres inn i navngitte kanaler (klokkens tidsfeil og vakt, gjennomsnittlig effektivt forhold mellom bærebølge og støytetthet og sporingsgulv, vertikalt beskyttelsesnivå og alarmgrense, posisjonsfeil, satellitter som spores, alarmflagg) med forhåndsinnstillinger per type eller eksplisitte resultatstier, plasserer dem ved fasestart og holder dem ut på et felles rutenett, med fasegrenser og hendelser; tilstand føres videre med carry (en kanal fortsetter fra sluttverdien i forrige fase), handoff (nummeret til en forrige fase skrevet inn i neste scenario) og end_at (en fase slutter på et tidspunkt en kjøring beregnet, for eksempel deteksjonstidspunktet til en spoofing-monitor); en kampanjehash og en digest over hvert medlemsresultat

seg-fd018ef7bc3b = Sammensetningsidentiteter mot de frittstående kjøringene av de samme typene: en kampanje med én fase gjengir det frittstående resultatet bit for bit, den videreførte forskyvningen er lik forrige kjørings egen siste sample, og fasen avsluttet av end_at har nøyaktig kjøringens deteksjonstidspunkt som lengde. Den additive videreføringen over en fasegrense og nullte ordens hold er modelleringsvalg, og hver fase er like god som typen som kjørte den; ingen lenket oppdrag er kontrollert mot et målt oppdrag

seg-ad6105af464c = Parametersveip og sådde Monte Carlo-ensembler over en hvilken som helst scenariotype

seg-95921611839e = Sveipet til <c1/>-typen (én til tre punktnotasjonsnøkler av en hvilken som helst type, på det generiske sveipets akseverdier, eventuelt med et ensemble i hver node) og monte_carlo-seksjonene: realisasjon k kjører ved base_seed + k; hver metrikk rapporterer gjennomsnitt, standardavvik, persentilene 5./50./95. etter nærmeste rang og et persentil-bootstrap-konfidensintervall med fast seed på { "95" } % for gjennomsnittet (inertial::metric_stat); metrikkenhetene leses fra den sveipede typens egen enhetsblokk

seg-03d15c27b3b9 = Den lukkede formen for fasens tilfeldige gange under hvit frekvensstøy, varians q_wf tau (NIST Technical Note { "1337" }), for statistikkmaskineriet, og byteidentitet med de frittstående kjøringene for såingen. Den kontrollerer ensemblearitmetikken på motorens egen klokkemodell, ikke et eksternt datasett

seg-24327a0ed82e = Flere scenarioer under felles forhold, med en samlet oppsummering

seg-5833fb3b06e3 = Compose-seksjonen til <c1/>-typen: navngitte felles verdier (for eksempel effekten og posisjonen til én jammer) skrevet inn i hvert medlem på nøklene det binder dem til, hvert medlem kjørt, og per metrikk den minste, største og gjennomsnittlige verdien på tvers av medlemmene med medlemmet navngitt; metrikkenhetene må stemme på tvers av medlemmene

seg-67ffd6684b1c = Sammensetningsidentitet mot den frittstående kjøringen. Aritmetikken for felles forhold er bokføring; fysikken er medlemstypenes, hver med sin egen rad

seg-0bc866720bde = Avgrenset optimalisering av én metrikk over kampanjeparametere

seg-f9bdb89c2b4f = Optimize-seksjonen til <c1/>-typen (CAP-32): én til tre punktnotasjonsnøkler i scenarioet avgrenset til [lo, hi] på lin- eller log-skala, én metrikk lest ved resultatsti, mål minimize, maximize eller target; metode grid (sveipets akseverdier) eller en deterministisk Nelder-Mead-simpleks i normaliserte koordinater med boksprojeksjon og standardkoeffisientene; en manglende eller ikke-endelig metrikk skåres som verst og blir stående i sporet; med runs > { "1" } er metrikken gjennomsnittet over felles seeds; hver evaluering er en ekte kjøring av den navngitte typen, oppført i trace og telt i reproduserbarhetsdigesten

seg-e3a2f80b04dc = Bare internt: den eksakte lukkede formen -20 log10(avstand) av linkligningen, et uavhengig brute-force-rutenett over samme type, og Rosenbrock-funksjonen. Runde { "1" }s 1D-terskel er NOT MET (boksen fastsatt på forhånd utelot løsningen på { "3" } dB; optimalisereren stoppet ved grensen), registrert i docs/design/evidence/cap32-optimize/RESULTS.md og ikke skåret på nytt. Optimum er lokalt for boksen og startpunktet; ingen påstand om globalt optimum

seg-b9b1637d326c = Båndbegrensede lukkede former for et hvilket som helst avstandsmålingssignal: effekt i båndet og early-late-kodesporingsjitter mot publiserte verdier, med Gabor-båndbredden og forskjøvet spektral separasjon kryssjekket

seg-6cfdc433b120 = navsignal: sinusintegralet (sine_integral), BPSK-R-andelen av effekten innenfor et dobbeltsidig bånd i lukket form (bpsk_power_in_band_closed_form), den båndbegrensede BPSK-Gabor-båndbredden i lukket form (bpsk_gabor_bandwidth_closed_form_hz), den båndbegrensede koherente og ikke-koherente early-late-jitteren i delay-lock-loop for et hvilket som helst spektrum med enhetsareal etter Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) og dens Gabor-grense for forsvinnende avstand (dll_jitter_small_spacing_limit_s), den forskjøvede BPSK-spektrale separasjonskoeffisienten i lukket form (bpsk_offset_ssc_closed_form), Galileo E5 AltBOC({ "15,10" })-spekteret (altboc_15_10_psd) og en parser for modulasjonsetiketter (parse_modulation); brukt av <c1/>-typen for hver signalutforming

seg-15d8c44be46f = Eksternt fastlåst: { "90.3" } prosent hovedlobeeffekt, den koherente early-late-jitteren ved det oppgitte driftspunktet, tabellverdiene for sinusintegralet og BPSKs egen spektrale separasjonskoeffisient 2/({ "3" } R_c) ved null forskyvning. Bare interne kryssjekker, ikke ekstern validering: den lukkede formen for båndbegrenset BPSK-Gabor-båndbredde og dens asymptote, og den forskjøvede BPSK-spektrale separasjonskoeffisienten ved forskyvninger ulik null, begge utledet her og kontrollert mot kvadratur. Publiserte lukkede former: BPSK-R sinc-kvadrat-spekteret og dets { "90" } prosent hovedlobeeffekt (Kaplan & Hegarty, Understanding GPS/GNSS, 3. utg.); den koherente early-late-kodesporingsjitteren sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, avsnitt { "8" }) og den båndbegrensede generaliseringen med dens Gabor-båndbreddegrense (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); sinusintegraltabellene til Abramowitz & Stegun (tabell { "5.1" }); den spektrale separasjonskoeffisienten som Fourier-transformasjonen av den kvadrerte autokorrelasjonen (Betz { "2001" }). AltBOC-spekteret er kontrollert bare for enhetsareal og loboposisjon (uttrykket i Galileo Open Service Signal-in-Space Interface Control Document integrerer til { "8" } og dividerer med det).

seg-def449efa852 = Maksimal Doppler for en navigasjonssatellitt i lav jordbane, som dimensjonerer akkvisisjonssøket

seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: den største satellitt-Doppleren på en overflyvning rett overhead ved elevasjonsmasken for en sirkulær bane, v R_E cos(el) / (R_E + h) ganger f / c, fra hver forhåndsinnstillings egen bærebølge og banehøyde; <c1/>-typen legger til oscillator- og brukerledd og gjør den om til Doppler-binger

seg-c26e0c7c6821 = Publiserte tall: Xona Pulsar X1 maksimal Doppler { "32" } til { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, https://arxiv.org/abs/2509.19551); Iridium-Doppler opp til +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Jordens rotasjon er utelatt, noe som flytter tallet med opptil omtrent { "2.3" } kHz; begge de publiserte tallene er nådd uten den.

seg-652e28dfa10f = Signalutforminger for posisjonering, navigasjon og tidssynkronisering i lav jordbane: kodesporing, akkvisisjon, GNSS-kompatibilitet og en båndavveining for et hvilket som helst system

seg-c0ba5c7e708e = <c1/>-typen: parametriserte signalutforminger (bånd, senderbåndbredde, ITU-tildeling; akkvisisjons-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller flate spektre, effektandeler, FDMA-underbærebølger, kodelengder og datarater) fra innkompilerte offentlige forhåndsinnstillingsfiler (Xona Pulsar, Iridium STL, Starlink-signal av anledning, CentiSpace, en generisk C-bånd-utforming og generiske UHF/L/S/C/bredt-C-utforminger, hver med sin kilde-URL og upubliserte verdier merket REPRESENTATIVE) eller skrevet inline; per signal den båndbegrensede effekttettheten, andeler av effekten i båndet, Gabor-båndbredde, kodejitter mot C/N0 og avstand og avstandsmålingsnøyaktigheten, akkvisisjonssøkerommet, deteksjonssannsynlighet med kvadratisk lov og gjennomsnittlig serielle og kodeparallelle akkvisisjonstid, den spektrale separasjonskoeffisienten inn i og ut fra GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og AltBOC med C/N0-degraderingen, og CW-, bredbånds- og tilpasset J/S-toleranse fra SSC-kjeden til spectrum-typen; en båndavveining av ionosfæreforsinkelse, friromstap, avstandsmålingsnøyaktighet ved lik C/N0 og lik EIRP og jammertoleranse; og kvalitative formkontroller av en utforming mot en beskrevet måling

seg-040b3f5cc70e = De validerte lukkede formene i de to radene ovenfor, identiteten for falsk alarm med kvadratisk lov P_d(snr = { "0" }) = P_fa og Holmes' gjennomsnittlige akkvisisjonstid, og reduksjon til spectrum-typens egen SSC-kjede (den samme Jammer::ssc-koden). Utformingene selv er inndata: forhåndsinnstillinger merket REPRESENTATIVE eller WORKSHOP er ikke publiserte spesifikasjoner, forbedrede Feher-QPSK-, kodeskiftnøkling- og OFDM-spektre er tilnærmet, og formkontrollene sammenligner former, ikke kalibrerte nivåer.

seg-c2b9c8e4a364 = Flerbånds vannfallsdiagram (UHF, L, S, C) med utformede signaler og jammere per bånd

seg-609df4e0a085 = <c1/>-typen utvidet utover L-båndet: bånd gitt som en forhåndsinnstilt signalutforming (tegnet med hver komponent, båndbegrenset til senderbåndbredden, C/N0 og J/S referert til den sporede komponenten) eller som en egendefinert bærebølge og modulasjon; ekstra vannfallspaneler over et vilkårlig frekvensområde på samme tidslinje og fargeskala; en bredbånds (barrage) jammer ved siden av CW, smalbånd, chirp og tilpasset støy; J/S per bånd og effektiv C/N0 fra den uendrede kjeden for spektral separasjonskoeffisient

seg-a3b398f66ad3 = Reduksjon til den eksisterende spektrumkjeden og anti-jam-ligningen til jamming-typen (et bånd med én komponent gir de samme tallene som før utvidelsen) og signalspektrene i de validerte radene. Jammereffektene, tidslinjen, båndbreddene i frontenden og de utformede signalene er inndata, og et utformet signal avkortes ved senderbåndet (ingen utstråling utenfor båndet).

seg-f92d6cbc58d4 = Spesifikke regndempingskoeffisienter for et hvilket som helst bånd en LEO-PNT-link bruker

seg-96b6a118d374 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 ligning ({ "1" }) til ({ "5" }): k_H, alpha_H, k_V, alpha_V fra kurvetilpasningene i tabell { "1" } til { "4" }, de sti- og polarisasjonsavhengige (k, alpha) og den spesifikke dempingen k R^alpha; brukt av regnleddet til <c1/>-typen

seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) tabell { "5" }, anbefalingens egne tabulerte k_H, alpha_H, k_V, alpha_V, committet i tests/fixtures/leo_link/p838_3_table5.csv med PDF-URL-en og hentedatoen. Tabellen er avrundet til sine trykte siffer, så terskelen er den avrundingen

seg-f4a311f936de = Langtids regndemping langs skråsti på en jord-rom-link

seg-2b2dba8bf5a7 = ITU-R P.618-14 avsnitt { "2.2.1.1" } trinn { "2" } til { "10" } (skrå og horisontal sti under regnhøyden, horisontal reduksjon og vertikale justeringsfaktorer, A0.01 og dens skalering til { "0.001" } % til { "5" } % av et gjennomsnittsår), med regnhøyden (P.839) og R0.01 (P.837) som inndata fordi motoren ikke har noen av de digitale kartene; anvendt per bånd og epoke av <c1/>-typen

seg-325d1bb9c26d = ITU-R Study Group { "3" } valideringseksempelfil CG-3M3J-13-ValEx-Rev8.3.0 for P.618-14, slik den er tabulert av valideringssidene til ITU-Rpy, med hvert steds P.839-4-regnhøyde fra de samme eksemplene; committet i tests/fixtures/leo_link/p618_14_rain_attenuation.csv med URL-ene og hentedatoen. Validerer prosedyren gitt h_R og R0.01, ikke kartene

seg-6b51ec84bdce = Troposfærisk amplitudescintillasjon på en jord-rom-link

seg-869894dec004 = ITU-R P.618-14 avsnitt { "2.4.1" } trinn { "3" } til { "9" } (referansesigma fra N_wet, effektiv stilengde, antenneforhold for midling, fadingdybde for { "0.01" } % til { "50" } % av tiden), med N_wet som inndata eller beregnet fra temperatur, fuktighet og trykk med uttrykkene i ITU-R P.453-14; under { "4" } GHz merker <c1/>-typen verdien som en ekstrapolering

seg-7fc4a1e7960a = ITU-R Study Group { "3" } valideringseksempler (CG-3M3J-13-ValEx-Rev8.3.0) for P.618-14-scintillasjon, med hvert steds P.453-14 N_wet fra de samme eksemplene; committet i tests/fixtures/leo_link/p618_14_scintillation.csv med URL-ene og hentedatoen. Uttrykket for våt refraktivitet fra temperatur og fuktighet dekkes ikke av denne raden

seg-e0d40cf4ea79 = Bygningsinntrengningstap for en LEO-PNT-bruker innendørs

seg-4f06274e38ec = ITU-R P.2109-2 vedlegg { "1" } ligning ({ "1" }) til ({ "10" }) med tabell { "1" }: tapet som ikke overskrides med sannsynlighet P for tradisjonelle og termisk effektive bygninger ved elevasjonen til stien ved fasaden, { "80" } MHz til { "100" } GHz; anvendt per bånd og epoke på en bruker innendørs av <c1/>-typen (UHF-tilfellet innendørs)

seg-99c648f9c6eb = Verdiene i ITU-R Study Group { "3" } valideringsarbeidsboken for Clutter og BEL, slik de er transkribert i valideringsskriptet til referanseimplementasjonen i MATLAB (github.com/eeveetza/p2109), committet i tests/fixtures/leo_link/p2109_bel.csv med URL-en og hentedatoen. Arbeidsboken skriver ut tre desimaler

seg-8c5e291c8ff8 = Førsteordens ionosfæreforsinkelse per bånd, den ionosfærefrie kombinasjonen og friromstap

seg-89df726127f9 = Gruppeforsinkelse { "40.3" } STEC/f^{ "2" } per bånd; de ionosfærefrie koeffisientene f1^2/(f1^{ "2" } - f2^{ "2" }) og -f2^2/(f1^{ "2" } - f2^{ "2" }) og støyforsterkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) for et hvilket som helst bånd-par; friromstapet { "20" } log10({ "4" } pi R f/c) fra linkbudget::free_space_loss_db i sin kilometer-megahertz-form

seg-9bf00f744174 = IS-GPS-200 avsnitt { "20.3.3.3.3.2" }, som oppgir L1/L2-forholdet for gruppeforsinkelse gamma = (77/60)^{ "2" } som følger av førsteordens 1/f^{ "2" }-skalering, og Friis' overføringsformel (Proc. IRE, { "1946" }). Validerer skaleringslovene, ikke en skrå TEC

seg-c584a867fcda = Maksimal Doppler en stasjonær bruker ser fra en LEO- eller MEO-bane

seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: et søk over hver baneposisjon og hver bruker ved satellittens horisont i en sirkulær bane, med jorden i rotasjon, etter den største avstandsraten, pluss banehastigheten og den største jordfaste satellitthastigheten; rapportert per bånd som Doppler-omhyllingskurven av <c1/>-typen og brukt som søkevindu for kaldstart i dens lavenergimodell

seg-4abd3afebad2 = Leclere, Marathe og Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tabell { "1" } (stasjonær mottaker på en kule med radius { "6371" } km, jordens rotasjon den eneste andre effekten): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz på L1. Dekker sirkulære todelte baner

seg-d9eb3e7e69c2 = En LEO-PNT-overflyvning og dens linkbudsjett per bånd mot MEO-GNSS-satellittene i sikte

seg-d986e44443dd = <c1/>-typen: satellitter fra en utformet overflyvning, elementer, en TLE gjennom SGP4 eller en Walker-konstellasjon fra constellation-design; per bånd og epoke siktevinklene, avstand, avstandsrate og avstandsakselerasjon i lukket form (kontrollert ved hver kjøring mot sentrale differanser og rapportert), friromstap, EIRP med isoflux-, gaussisk eller flatt mønster, en patch-, halvkule- eller isotrop brukerantenne, gassdemping etter ITU-R P.676-10 vedlegg { "2" }, P.618-regn og -scintillasjon, P.2109-bygningsinntrengningstap, polarisasjonsmismatch, systemstøytemperatur, C/N0, Doppler og Doppler-rate, og førsteordens forsinkelse fra en Klobuchar- eller vertikal-TEC-skrå TEC skalert med Chapman-andelen under satellitten; ionosfærefrie par med kodestøy ved toppen av overflyvningen; Galileo- eller GPS-bærebølger fra mottatte effekter i grensesnittdokumentene gjennom den samme mottakeren

seg-c558a6519038 = Lukkede former og selvkonsistens: identitetene for avstandsrate og avstandsakselerasjon mot numeriske deriverte, at isoflux-forsterkningen opphever veksten i avstand, lærebokgrensene for polarisasjonstap, den kvalitative observasjonen LEO mot GNSS (en klokkeformet overflyvning på minutter med topp flere dB over flate GNSS-bærebølger på 44-51 dB-Hz). EIRP-ene og mønstrene er publiserte mottatte effekter omgjort til en EIRP eller representative valg, gassleddet er den avløste forenklede metoden i P.676-10, og ingenting er sammenlignet med en målt LEO C/N0

seg-95a077a980b6 = Navngitte LEO-PNT-systemforhåndsinnstillinger med oppgitte kilder, og en systemuavhengig motor

seg-4b47033cda24 = leo_link::presets: generisk flerbånds (UHF, L, S, C), generisk C-bånd, Xona Pulsar X1/X5, Iridium STL, Starlink som et signal av anledning med bare Doppler, CentiSpace og en valgfri Celeste IOD-forhåndsinnstilling, hver med kilden merket PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP, der workshop-kilden ligger i den valgfrie Celeste IOD-forhåndsinnstillingsfilen og bare kompileres inn når den filen finnes; hvert bånd og hver bane kan overstyres i et scenario, og et scenario kan unnlate å navngi noen forhåndsinnstilling

seg-399dc53ceafb = Transkripsjon av de siterte offentlige tallene og en konsistenskontroll: en EIRP satt fra en publisert minste mottatte effekt forutsier den publiserte maksimale innenfor { "0.5" } dB med et flatt mønster. Det er en kontroll av avstandsspredningen, ikke en validering av noen satellitts antenne; representative forhåndsinnstillinger gir ingen påstand om et ekte system

seg-a39f34973373 = Posisjonering med lavt energiforbruk: tid til første posisjonsbestemmelse og energi per posisjonsbestemmelse mot driftssyklus

seg-f3b9b669a76f = leo_link::energy og [iot]-seksjonen til <c1/>-typen: koherent integrasjon begrenset av Doppler-raten, ikke-koherente summer med kvadratisk lov opp til en deteksjonsterskel, et Doppler-bingesøk over banens omhyllingskurve for stasjonære brukere (kald) eller et støttet vindu (varm), parallelt eller serielt kodesøk, navigasjonsmeldingstid ved kaldstart, energi per posisjonsbestemmelse og batterilevetid over intervaller mellom posisjonsbestemmelser, for hvert LEO-bånd og GNSS-signalet

seg-a5fa1ef1be9b = Intern konsistens i en oppgitt utformingsmodell: hver effekt, terskel og søkevalg er inndata, og modellen ser bort fra flertydighet i bitkanter, tapt deteksjon og ny akkvisisjon. Ikke sammenlignet med en målt mottaker

seg-7e94f8b38cff = Globalt gjennomsnittlige vekter for avstandsfeil i signal i rommet for en hvilken som helst banehøyde

seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: den radiale vekten w_R og den kvadrerte tverrvekten w_AC^{ "2" } som gjennomsnitt av cos^{ "2" } og halve sin^{ "2" } av nadirvinkelen til siktlinjen over brukere jevnt fordelt på den synlige jordkalotten over en elevasjonsmaske, for en hvilken som helst baneradius, ved Simpson-integrasjon; brukt av hvert leo-navmsg SISRE-tall (ved { "510" } km, w_R { "0.46" } og w_AC^{ "2" } 1/2.5)

seg-b9b5fe9d3b25 = Den publiserte SISRE-vektfaktortabellen til Montenbruck, Steigenberger og Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } og 1/49, GLONASS { "0.98" } og 1/45, Galileo { "0.98" } og 1/61, BeiDou MEO { "0.98" } og 1/54, BeiDou IGSO/GEO { "0.99" } og 1/126. Det samme gjennomsnittet evaluert ved LEO-radier gir LEO-vektene; ingen publisert LEO-tabell er fastlåst, så LEO-verdiene er den validerte metoden anvendt, ikke validert separat

seg-3cbb8b6afe3c = Brukeralgoritmen for kringkastet efemeride fra Galileo ICD som grunnlag for en LEO-navigasjonsmelding

seg-88efbce1f836 = leo_navmsg::elements::kepler_point: Keplers evaluering fra Galileo OS SIS ICD (Keplers ligning, korreksjoner av andre harmoniske, jordfast node) skrevet separat fra motorens RINEX-evaluator, som returnerer posisjonen sammen med breddeargumentet, inklinasjonen og noden som langs-/tvers-/radialkorreksjonssystemet bygges fra, og utvidelsesleddene fra Liu m.fl. { "2025" }

seg-6a90728fcea9 = RTKLIB 2.4.2-p13 eph2pos ECEF-posisjoner (en uavhengig implementasjon av den samme ICD-algoritmen) for ekte BKG/IGS-kringkastede poster fra 2024-09-10, begge committet med proveniens i tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Dette validerer den Keplerske brukeralgoritmen; langs-/tvers-/radialkorreksjonene som er lagt oppå dekkes av sine egne rader, og Liu-leddene av raden om Liu m.fl. { "2025" } med 22 parametere

seg-d65102fd4a1d = CRC-24Q-rammekontroll for LEO-navigasjonsmeldingen

seg-aed568016867 = leo_navmsg::codec::crc24q: generatorpolynom 0x1864CFB, startverdi { "0" }, ingen refleksjon, ingen sluttlig XOR, kontrollen Kshanas LEO-ramme bærer over hver foregående byte

seg-18c79d18e4e4 = CRC-katalogens kontrollverdi for disse parametrene (reveng.sourceforge.io CRC-katalogen, CRC-24/LTE-A: bredde { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), som er CRC-24Q-parametrene til RTCM { "10403" } og Galileo OS SIS ICD, og eksempelrammen for meldingstype { "1005" } trykt i RTCM { "10403" }

seg-82b9b0f7b07c = Tilpasning av kringkastet LEO-efemeride og avstandsfeil i signal i rommet mot tilpasningsintervall og oppdateringsperiode

seg-8c7065aa22bd = Tilpassingen og avveiningen til <c1/>-typen: en referansebane integrert med sonal J2-J6- eller EGM2008-gravitasjon til valgt grad og luftmotstand, og en sådd fri eller styrt klokke; en Levenberg-Marquardt-tilpasning av det Keplerske Galileo-settet på ikke-singulære elementer med svake priorer, deretter polynomer for korreksjon langs banen, på tvers av banen og radialt ved lineære minste kvadrater; klokkepolynomet tilpasset fratrukket brukerens relativistiske ledd; SISRE (bare bane og med klokke) over bruksperioder sentrert i tilpasningsvinduene, mot tilpasningsintervall og oppdateringsperiode. Validert del: tilpasningen med 16 parametere og dens SISRE for bare bane mot tilpasningsintervall på ekte presise baner, og den integrerte J2-J6/EGM2008({ "20" }, { "70" })/luftmotstand-referansebanen mot Orekit { "12.2" } innenfor { "4.6" } mm over { "6" } t (terskel { "2" } cm, samme tetthetsinndata); korreksjonspolynomene, klokketilpasningen (sådd fri eller styrt klokke) og avveiningen av oppdateringsperiode forblir modellert

seg-8121e7db3db3 = Oppdatering av LEO-navigasjonsmeldingen midt i en overflyvning med kontroll av kontinuitet ved byttet

seg-34c310d85c42 = Analysen midpass-update til <c1/>: den høyeste overflyvningen over en bruker innenfor et søkespenn, meldinger på en global tidsplan med bruksperioder sentrert i tilpasningsvinduene, og ved hvert bytte 3D-posisjonshoppet, klokkehoppet, brukerens pseudoavstandshopp, det største hoppet over en hvilken som helst synlig siktlinje (lukket form over nadirkjeglen), avstandsfeilen før og etter, og PASS/FAIL mot en terskel

seg-418f2cd21141 = Intern konsistens (hoppidentiteten og kjeglegrensen mot brute-force-sampling). Terskelen er en inndata; ingen publisert LEO-kontinuitetskrav er fastlåst

seg-7635a8339e78 = Dokumentert binær koding av LEO-navigasjonsmeldingen med et kvantiseringsfeilbudsjett

seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshanas egen ramme (innledning, versjon, modell, lengde, nyttelast, CRC-24Q) for de fire efemeridemodellene, klokkepolynomet, SVID, issue of data, bånd, helsetilstand, et Klobuchar-sett, NeQuick-G-koeffisienter og UTC-parametere, hvert felt med oppgitt bredde og trinn (field_table), kvantisering med avvisning utenfor område, og et budsjett over den største endringen i posisjon og klokke et halvtrinns endring i hvert felt gir over gyldighetsvinduet

seg-4261a9fac5d9 = Rundturidentiteter og selve budsjettet. Formatet er Kshanas eget, modellert etter de publiserte meldingskomponentene og feltsettet i Galileo ICD; det er ikke bitoppsettet til Celeste eller noe annet system (ingen er offentlig), så det finnes ikke noe eksternt oppsett å validere mot

seg-17ca41d7fd71 = Eksport av LEO-navigasjonsmeldinger i RINEX-4-stil og CSV

seg-185e12ccef0d = leo_navmsg::text: en blokk i RINEX-4-stil (> EPH-posthode, satellitt- og epokelinje med tre klokkeledd, D19.12 kringkastede banelinjer) med systembokstav L og posttypene KP16, KRAC, LU22 og APOL, merket i hvert hode som en Kshana-utvidelse som ikke er en del av RINEX { "4.02" }, og en CSV-tabell med et standard kolonneskjema og forhåndsinnstilte skjemaer, hver med en importør

seg-5cc5b6382437 = Rundturer og kalenderaritmetikken. RINEX { "4.02" } definerer ingen LEO-navigasjonsposter (IGS RINEX { "4.02" }), så oppsettet er en dokumentert utvidelse med arXiv { "2401.17767" } sitert som tidligere arbeid; ingen ekstern leser av det finnes å kontrollere mot

seg-ff15935ba1b3 = LEO-efemeridemodellen med 22 parametere fra Liu m.fl. { "2025" } og dens tilpasning på ekte presise baner

seg-6af1b6f3bbd4 = Liu22-varianten av leo_navmsg::elements::EphemerisModel, evaluert av kepler_point med Liu22Extra: settet på 16 parametere pluss en rate for store halvakse a_dot, en rate for middelbevegelsen n_dot som inngår som n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk, transkribert fra artikkelens ligning { "1" } (tilpasningssammenligningen avhenger ikke av denne skaleringskonvensjonen, så betydningen av en sendt nDot-verdi er ikke validert her), og radiusharmoniske Crs1, Crc1, Crs3, Crc3 én og tre ganger per omløp på det ukorrigerte breddeargumentet. Tilpasningen med leo_navmsg::fit::fit_message følger artikkelens avsnitt { "2.3" } start og estimator (hver korreksjon starter på null; ordinære minste kvadrater uten priorer; artikkelens grense på 100 iterasjoner), men stopper på Kshanas regel for parameterkonvergens (hvert steg under { "1e-3" } av sin formelle sigma) i stedet for artikkelens regel om en RMS-endring under { "0.1" } mm. Tilpasset over buer på { "20" } og { "30" } minutter av en tabulert presis bane

seg-e79047fc95af = ATOMIC ECEF-polynom uten klokke og den syntetiske modellsammenligningen for LEO ved fem høyder

seg-e261843e35b1 = EcefPoly-varianten av leo_navmsg::elements::EphemerisModel: et ECEF-polynom per akse uten klokkeledd, det relativistiske leddet fra -2 r.v/c^{ "2" }, skåret mot en styrt klokke. Også modellsammenligningsanalysen (liu_comparison over LIU2025_TABLE), som tilpasser modellen med 22 parametere ved artikkelens fem høyder over buer på 20 minutter av en bane integrert av Kshana og skriver ut resultatet ved siden av den publiserte SISRE

seg-a3b92fdcc591 = ATOMIC-modellfakta fra InsideGNSS (polynom av 6. orden, omtrent ett minutts gyldighet, { "30" } s oppdatering, styrt klokke, { "24" } cm klokkefeil). Dette er beskrivende fakta uten publiserte tall å sammenligne mot. Tabellen med fem høyder skriver ut SISRE fra Liu m.fl. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } og { "0.75" } cm ved { "320" }, { "475" }, { "786" }, { "966" } og { "1336" } km over en bue på 20 minutter) ved siden av Kshanas tilpasning på sin egen integrerte bane ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } og { "0.51" } cm; forhold { "0.46" } til { "0.77" }), ikke fastlåst, fordi artikkelen tilpasset ekte presise baner og referansene er forskjellige. Modellen med 22 parametere og tilpasningen selv er validert mot ekte baner i raden Liu et al. { "2025" } 22-parameter LEO ephemeris model and its fit on real precise orbits. Revisjon i { "0.30" }: tabelltallene endret seg med tilpasningen etter artikkelens konvensjon (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

seg-7a9fca5166d4 = Ionosfære- og UTC-tjenester for ett frekvensbånd i en LEO-navigasjonsmelding

seg-bc73bfeca68e = leo_navmsg::services: den kringkastede Klobuchar-forsinkelsen ved en hvilken som helst bærebølge (motorens L1-modell skalert med (f_L1/f)^{ "2" }), det effektive NeQuick-G-ioniseringsnivået Az = ai0 + ai1 mu + ai2 mu^{ "2" } med reglene for alle nuller og [{ "0" }, { "400" }] sfu, og systemtid til UTC med ICD-ens tre skuddsekundtilfeller

seg-0af8030f4d21 = Doppler en bakkemottaker må håndtere fra en LEO-navigasjonssatellitt

seg-9714103964d6 = Eksakt avstandsrate for en satellitt hvis jordfaste posisjon og hastighet kommer fra en todelt bane med sekulær J2-drift og jordens rotasjon (leo_fusion::geom::EarthOrbit::state, hastigheten den eksakte tidsderiverte av posisjonen), gjort om til Doppler ved en bærebølge; den største absolutte Doppleren, Doppler-raten og rykket over en elevasjonsmaske over et vindu (leo_fusion::doppler::doppler_envelope), rapportert per LEO-system av <c1/>-typen i doppler-modus

seg-ebf6cee8ec4c = Publiserte tall gjengitt fra den oppgitte banen og bærebølgen: Iridium-Doppler opp til pluss eller minus { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) og Xona Pulsar X1 maksimal Doppler { "32" } til { "34" } kHz (Leclère, Marathe og Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). Iridium-tallet er en avrundet øvre grense, derfor terskelen på { "5" } %. Doppler-raten og rykket rapporteres men er ikke validert: det modellerte rykket for en overflyvning rett overhead for Pulsar X1 er omtrent { "1.0" } Hz/s^{ "2" } mot det publiserte { "1.26" }

seg-d2e18c8bdc14 = Posisjonering fra LEO-Doppler, med én og flere satellitter, med tilstander for klokkedrift og hastighet

seg-de6cb3c06490 = Batch Gauss-Newton-posisjonering fra avstandsrate med analytiske partielle deriverte (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), en konstant brukerhastighet som valg, en høydepseudomåling for en bruker på overflaten, dempede steg; den formelle kovariansen ved referansen; projeksjoner langs banen, på tvers av banen og vertikalt; nøyaktigheten for én overflyvning mot brukerens avstand på tvers av banen; tidspunktet for nærmeste passering. Doppler-modusen til <c1/>-typen legger til feilen mot vindulengde og en modus for signaler av anledning med bare Doppler (forhåndsinnstillingen starlink-sop)

seg-84e2eb636579 = Intern konsistens: gjenvinning uten støy, den kinematiske identiteten rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho derivert numerisk, null Doppler ved nærmeste passering, speilløsningen for en enkelt overflyvning, og sådde feil mot den formelle kovariansen. Starlink-tallet til Kozhaya, Saroufim og Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: omtrent { "2" } m på { "20" } s med tre satellitter) er bare en sammenligning: den modellerte mottakeren, med en perfekt efemeride og hver feil i en Doppler-sigma på { "30" } Hz, er flere ganger mindre nøyaktig over det samme vinduet, og artikkelens mottaker og målerate er ikke gjengitt

seg-7f462969d2d4 = Felles posisjonsbestemmelse med GNSS- og LEO-pseudoavstander med intersystembiaser og feilmodeller per signal

seg-b9b5298e3408 = Posisjonsbestemmelser med vektet Gauss-Newton minste kvadrater over en hvilken som helst blanding av systemer, én mottakerklokke per system (intersystembiasen estimert sammen med posisjonen) eller en kjent kringkastet forskyvning på referansetidsskalaen; sigma per måling levert av kalleren, som standard motorens termiske støy i delay-lock-loop (navsignal::dll_code_jitter_chips) ved C/N0 for elevasjonen kombinert med avstandsfeilen i signal i rommet; uvektet DOP (GDOP, PDOP, HDOP, VDOP, TDOP) i det lokale geodetiske systemet, formelle øst-nord-opp-sigma og bias-sigmaene; den felles modusen i <c1/> sammenligner posisjonsbestemmelser med bare GNSS, bare LEO og fusjonerte, og sveiper DOP mot antallet tilføyde LEO-satellitter

seg-ee9a4a0cb530 = Konvergens for presis punktposisjonering (PPP) med bare GNSS og med LEO-støtte

seg-a54f36c27d90 = Et utvidet Kalman-filter for flyttalls-PPP på ionosfærefri kode og fase: statiske koordinater, en hvit mottakerklokke, én intersystembias per ekstra system, en tilfeldig gange for våt zenitforsinkelse avbildet med 1/sin(elevasjon), en flyttalls flertydighet per satellittbue lagt til ved oppgang og fjernet ved nedgang, og den presise bane- og klokkefeilen felles for en satellitts kode og fase, behandlet som én korrelert oppdatering med to rader i en Joseph-stabilisert form; målinger simulert fra samme modell; konvergenstid (feil under terskelene til slutten av kjøringen), feilkurver og den kjøringsgjennomsnittlige posisjons-NEES for bare GNSS og hvert LEO-tilfelle, kjørt som <c1/>-typen

seg-be4593802ccf = NEES-kjikvadrattesten er en intern konsistenskontroll (referansen og filteret deler modellen). Trenden er sammenlignet med Li m.fl., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min forkortet til { "7.0" }, { "3.2" }, { "2.1" } og { "1.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter. Det medfølgende scenarioet gir { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } og { "2.3" } min med sine egne representative skall på { "1000" } km, { "60" } grader, støy og stasjoner; artikkelens konstellasjoner, støy og konvergensdefinisjon er ikke gjengitt, så dette er en MODELLED konsistens i trenden (monoton forkorting, den største konstellasjonen under en tredjedel av tiden med bare GNSS), ikke en validering

seg-8ef013b46d0f = Posisjoneringsnøyaktighet i 5G ikke-terrestriske nett (NTN) fra signalbåndbredde

seg-12b1e4657370 = Cramér-Rao-grensen for ankomsttid fra rotmiddelkvadrat-båndbredden (Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), for et flatt OFDM-spektrum (beta = B/sqrt({ "12" })), et båndbegrenset BPSK-spektrum (teller i lukket form) eller et hvilket som helst spektrum ved kvadratur, og på frekvensen til en kompleks tone, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); posisjonsbestemmelser fra ankomsttid på nedlinken med en ukjent mottakerklokke og en Doppler-posisjonsbestemmelse med én satellitt over en overflyvning i 3GPP n256 MSS S-båndet, kjørt som <c1/>-typen

seg-9306f1c06081 = LEO-støttet tidsoverføring til UTC mot C/N0 og mottakeroscillatoren

seg-c618feb01476 = Klokkemålinger fra hver LEO-satellitt i sikte ved en kjent posisjon, kombinert med invers varians fra pseudoavstandsstøymodellen, filtrert av et Kalman-filter med to tilstander (fase, frekvens) hvis prosessstøy er den hvite og tilfeldig-gange-frekvensstøyen til oscillatorklassen (slot_timing::ClockNoise, clock_state::ClockClass; driftvariansen til holdover::coast_phase_variance), en sådd referanseklokke fra de samme nivåene, og uttrykket i IS-GPS-200 avsnitt { "20.3.3.5.2.4" } for systemtid til UTC med en usikkerhet i kringkastet forskyvning lagt til som en bias per kjøring; timing-modusen i <c1/> sveiper oscillatorer og C/N0-forskyvninger

seg-4a878bd4a90f = Intern konsistens: det publiserte forskyvningsuttrykket evaluert for hånd, den normaliserte feilen over { "40" } seeds, og gulvet satt av usikkerheten i forskyvningen. NIST-tallet for Iridium-tidsmottakere med en miniatyratomklokke (under { "40" } ns fra UTC(NIST) over { "40" } dager) er bare en sammenligning; det medfølgende Iridium-scenarioet gir { "10" } til { "11" } ns RMS ved nominell effekt med sin representative avstandsfeil på { "5" } m. Flicker-frekvensstøy og ionosfæreforsinkelse er ikke simulert

seg-cef79d82f0d4 = LEO-dekning og fortynning av presisjon for polare og arktiske brukere mot MEO-GNSS

seg-462a5e95d480 = Satellitter i sikte og median PDOP, HDOP og VDOP med tilgjengelighet mot breddegrad, over samplede lengdegrader og epoker, for bare MEO-GNSS-systemene, bare LEO-systemene og alle sammen, hvert system med sin egen maske og klokkemodell, kjørt som polar-modusen til <c1/>; banene er SGP4/SDP4-elementsett ved sveipepoken (2026-01-01T00:{ "00" }:{ "00" } UTC i polar-modusen) ført til det jordfaste systemet på den validerte stien for jordbaner (IAU 2006/2000A, UT1 = UTC, ingen polbevegelse)

seg-d92777401093 = Navngitte LEO-PNT-systemer som valgfrie datasett med forhåndsinnstillinger, hver med sin kilde

seg-5130bfe2410c = Systemuavhengige inndata: hvert system er Walker-skall, eksplisitte elementer eller en GNSS-forhåndsinnstilling, et signal (bærebølge, chiprate, båndbredde, mottatt effekt eller C/N0-område), en SISRE, en Doppler-sigma og en klokkemodell; forhåndsinnstillinger fyller bare ut det et scenario utelater, én fil hver med kilder merket PUBLIC (med URL), WORKSHOP eller DERIVED og de upubliserte verdiene oppført som representative: Xona Pulsar X1/X5, Iridium STL, Starlink-signaler av anledning, CentiSpace, et representativt C-bånd-system, ATOMIC-efemeridemodellen uten klokke, og én forhåndsinnstilling utledet fra workshopen i den valgfrie Celeste IOD-forhåndsinnstillingsfilen, holdt tilbake ved å slette den filen og dens scenarioer

seg-c6f71b3937cd = Transkripsjon av de siterte offentlige verdiene, kontrollert for struktur (hver offentlig kilde har en URL, Walker-mønstre går opp, C/N0 fra mottatt effekt over kT ved { "290" } K), ikke mot en ekstern uavhengig referanse. Representative verdier er navngitt i hver forhåndsinnstilling og er illustrerende

seg-dec52b5b9cd6 = Ett LEO-PNT-system fra ende til ende: signalutforming, linkbudsjett for overflyvning, navigasjonsmelding og fusjonert posisjonering, der hvert trinns utdata gis videre til neste

seg-39443b31d418 = <c1/>-typen: en leo-signal-utforming (offentlig forhåndsinnstilling eller inline) setter senterfrekvens, båndbredde, chiprate og EIRP-fordeling for et leo-pass-bånd; overflyvningen gir C/N0 for den sporede komponenten og båndbegrenset kodejitter per epoke; en C/N0-linje etter minste kvadrater i sin(elevasjon), SISRE fra leo-navmsg-meldingen (tilpasset ved banen til satellitten i overflyvningen, pluss et oppgitt banebestemmelsesledd i kvadratsum) og utformingens bærebølge og chiprate går til hvert LEO-system i en felles posisjonsbestemmelse med leo-pvt og, valgfritt, til LEO-tilfellene i leo-ppp; hver overlevering rapporteres med verdi og enhet

seg-854d3c1428d0 = Selvkonsistens i overleveringene: hver videregitte verdi er lik det oppstrøms trinnets egne utdata, og å mutere en oppstrøms inndata flytter hvert nedstrøms tall som avhenger av den. Trinnene beholder sine egne etiketter; kjeden tilfører ingen fysikk og ingen ekstern uavhengig referanse

seg-55ca63edff02 = Spoofing-deteksjon ved konsistens mellom LEO-Doppler og overflyvningsgeometri

seg-b12fc1728220 = <c2/>-seksjonen i <c1/>-typen: en spoofer forfalsker, selvkonsistent i avstand og avstandsrate, signalene sett ved en påstått posisjon som hopper og/eller skyves bort fra den sanne etter et startpunkt (per LEO-bånd og for MEO-GNSS-signalet); mottakeren forutsier hver avstandsrate fra den kringkastede banen og en uavhengig prior posisjon og hastighet, og tester de målte avstandsratene med en generalisert kjikvadratstatistikk med minste kvadrater over et vindu av epoker (klokkedrift en forstyrrelsesparameter eller med en prior), på GNSS-kanalene, LEO-kanalene og alle kanaler, med termisk støy i frequency-lock-loop fra C/N0 (Kaplan & Hegarty { "2006" }, avsnitt { "5.6.2" }); deteksjonssannsynlighet fra den ikke-sentrale kjikvadratloven ved en oppgitt sannsynlighet for falsk alarm, deteksjon erklært ved en oppgitt sannsynlighet for tapt deteksjon

seg-787c07c08c7f = Lukkede former og identiteter, ikke en ekstern måling: gradienten til avstandsraten mot en sentral differanse, informasjonsformstatistikken mot den tette kovariansformen, en ren klokkedrift som gir null, en skyv forklart av prioren som gir høyst |dx|^2/sigma_p^{ "2" }, statistikken kvadratisk i et hopp. Ingen deteksjonsverdi er sammenlignet med et målt angrep; spoofereren er idealisert (ingen signatur i effekt, ankomstvinkel eller korrelasjonstopp)

seg-5f341f85ac07 = Spoofing-deteksjon ved konsistens på tvers av bånd i et LEO-signal med flere bånd

seg-2f9c4d351b0f = For hver LEO-satellitt og hvert par av avstandsmålingsbånd danner <c1/>-seksjonen den geometrifrie pseudoavstandskombinasjonen, fjerner mottakerens ionosfæremodell og tester dens steg fra epoke til epoke mot de to båndenes kodestøy og en oppgitt tolerert umodellert ionosfærerate (tosidig gaussisk, eksakt deteksjonssannsynlighet); en spoofer som forfalsker noen bånd og ikke andre, eller hvert bånd uten ionosfæren, oppdages ved starten; en som forfalsker hvert bånd og simulerer ionosfæren, oppdages ikke, noe resultatet oppgir

seg-87fd44fa1d94 = Identiteter: startsteget til en ionosfærefri spoofer er lik parets modellerte differanse i ionosfæreforsinkelse, terskelen er den tosidige normale kvantilen ganger standardavviket til steget pluss grensen for raten. Mottakerens ionosfæremodell er motorens, så den autentiske residualen er null i gjennomsnitt per konstruksjon; ingen ekstern uavhengig referanse

seg-97dbcd5f2728 = Ionosfæresondering: skrå TEC fra to-bånds forsinkelse i en LEO-overflyvning

seg-844de34fd2f3 = For hvert båndpar til en <c1/>-satellitt gir rapporten det skrå totale elektroninnholdet den geometrifrie kodekombinasjonen gjenvinner ved toppen av overflyvningen, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), og dets 1-sigma fra de to båndenes termiske kodestøy, slik at en hvilken som helst LEO-PNT-utforming med flere bånd kan avveies som en ionosfæresonde

seg-0a63a69e181d = Datumkovarians for månesystemet med stasjonene estimert, mot utvidet presisjon på 50 siffer

seg-de2ee45f6527 = Helmert-datumkovariansen med sju parametere i scenarioet lunar-frame-campaign med jordstasjonene estimert (stasjon { "1" } forankret), slik lunar_frame_campaign beregner den i binary64: den felles Fisher-informasjonen for stasjoner og fyrtårn akkumulert fra forsinkelsesjakobianen, stasjonsblokken marginalisert med et Schur-komplement gjennom en spektral Jacobi-invers, H = AᵀSA dannet med Helmert-utformingen og invertert spektralt. Problemet er dårlig betinget per konstruksjon (Helmert-tilstandstall { "2.1e8" } til { "2.3e8" }, tilstandstall for felles informasjon { "1.6e12" } til { "3.0e13" }): en relativ endring på { "1e-9" } i Schur-korreksjonen flytter datumsigmaene med opptil { "28" } %. Rapportert: de sju datumsigmaene, Helmert-tilstandstallet og den svakeste retningen. PÅSTAND, SNEVRET INN: motorens datumsigma og tilstandstall ligger innenfor den a priori verste-tilfelle-feilgrensen til en bakoverstabil dobbeltpresisjonskjede på dette problemet; dette hevder ikke at de er så nøyaktige som dobbel presisjon tillater (en faktoriseringsrute er omtrent tusen ganger mer nøyaktig på de samme inndataene, og den valgfrie kvadratrot-løseren omtrent ti millioner ganger), og den svakeste retningen er validert bare der terskelen er under en rett vinkel (kontrollen med stasjonene fastholdt)

seg-71b463388e80 = Datumløser med kvadratrotinformasjon mot utvidet presisjon på 50 siffer

seg-5ec3e3c2bf19 = En valgfri løser med kvadratrotinformasjon (lunar-frame-campaign solver = "srif"; standard uendret) som aldri danner eller inverterer en informasjonsmatrise for datumet: Householder-QR (ortogonal-triangulær dekomposisjon) av den hvitede forsinkelsesjakobianen som en målingsoppdatering i et kvadratrotinformasjonsfilter, jordstasjonene marginalisert gjennom den avsluttende triangulære blokken (hvis Gram-produkt er Schur-komplementet), en andre QR av R_bb A for Helmert-datumet med sju parametere, sigma som radnormene til den triangulære inversen, og spekteret (tilstandstall, svakeste retning) fra en ensidig Jacobi-singulærverdidekomposisjon. Indreprodukter kompenseres med et Dekker-splittet feilfritt produkt, slik at hver operasjon er en korrekt avrundet grunnleggende IEEE-754-operasjon eller kvadratrot; identiske resultater på hver plattform argumenteres ut fra det, ikke testet på tvers av plattformer

seg-433b52bf0ba2 = Maritime tillitsmonitorer: aritmetikken de hviler på (NMEA-dekoding, geodetiske forskyvninger, kinematiske statistikker og statistikker for sensorresidualer)

seg-c61c575f9c38 = For et fartøy dekoder <c1/> NMEA { "0183" }-setningene en mottaker og dens instrumenter sender ut (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), danner øst-nord-forskyvningen mellom posisjonsbestemmelser (<c2/>), og ut fra disse statistikkene monitorene avgjør på: den implisitte farten, residualen til dødregning, implisitt akselerasjon og implisitt svingrate over vinduer på { "30" } s, residualene for kurs mot kurs over grunnen, fartslogg mot fart over grunnen og antennehøyde (medianer over { "10" } s), og spredningen og økningen i signal-til-støy for satellittene.

seg-32fcf6956dac = HVA SOM KONTROLLERES EKSTERNT, snevert angitt: ({ "1" }) dekodingen av hvert felt monitorene leser, mot pynmea2 { "1.19.0" } (MIT) på { "8" } syntetiske logger ({ "1,086" } epoker), til { "1e-9" } i feltets enhet (breddegrad og lengdegrad, høyde, geoideseparasjon, HDOP, hastigheter, kurs, heading, signal-til-støy; heltall og datoer eksakt; klokkeslett til { "1e-6" } s), største avvik på nivå med det siste sifferet i et flyttall med dobbel presisjon; ({ "2" }) øst-nord-forskyvningen mellom to posisjonsbestemmelser, som avstand og peiling, mot WGS84-geodeten til geographiclib { "2.1" } (MIT) på { "223" } par av posisjonsbestemmelser med grunnlinjer på opptil { "2" } km, fra -45 til { "70" } grader bredde og på tvers av antimeridianen, til { "0.01" } m og { "0.001" } grader (peilingen mot geodetens middelasimut, retningen til korden); ({ "3" }) monitorenes inndatastatistikker ved { "341" } skårede epoker av en syntetisk reise på { "400" } s med en sving og et posisjonssteg, mot Python-omberegninger som bruker geographiclib for avstand og asimut, pynmea2 for dekoding og numpy for medianer og standardavvik: implisitt fart til { "0.005" } m/s, residual for dødregning til { "0.02" } m, akselerasjon til { "5e-4" } m/s^{ "2" }, svingrate til { "1e-3" } grader/s, medianene for residualene og spredningen og økningen i signal-til-støy til { "1e-6" }. HVA SOM IKKE KONTROLLERES: vinduslengdene, tilleggene og tersklene til monitorene er dette prosjektets egne regler; Python gjengir dem fra den samme dokumentasjonen, så enighet underbygger implementasjonen av aritmetikken, ikke reglene. THS-setningen har ingen pynmea2-klasse og ROT-setningen leses ikke; ingen av dem er dekket. Tabellen fra en NMEA-talker og satellittnummer til en satellitt-ID i RINEX-stil er dette prosjektets egen (bare nummeret, talkeren og verdien sammenlignes). Inndataene for tidssteg, vertsklokke og autentiseringsstatus har ingen uavhengig referanse. Alle data er syntetisk tekst fra receiver_trust::synth; ingenting her er en måling, og det gis ingen uttalelse om hvordan noen monitor presterer på ekte interferens. Peiling: sammenlignet med geodetens middelasimut. Den forhåndsregistrerte sammenligningen mot foroverasimuten ved posisjonsbestemmelse { "1" } feilet ved { "0.001" } grader ({ "77" } av { "223" } par, verst { "8.3e-3" } grader) på grunn av en definisjonsmessig forskjell, ikke aritmetikk; endringen ble gjort etter den første kjøringen og begge resultatene er registrert (sammenligningen av foroverasimut blir stående i testen som en beskrivende grense på { "0.01" } grader som ikke er forhåndsregistrert). Opplyst: de første kjøringene fant inndata som utnyttet for lite (akselerasjon og svingrate ble klemt til null ved hver epoke, og sporet over antimeridianen krysset den aldri), en feil i den syntetiske generatoren (ingen lengdeomslag) og, for peilingen, at den registrerte størrelsen fra den uavhengige referansen (geodetens foroverasimut ved første posisjonsbestemmelse) avviker fra kordens retning med omtrent halve meridiankonvergensen ({ "77" } av { "223" } par utenfor { "0.001" } grader, verst { "8.3e-3" }); inndataene ble rettet og peilingen sammenlignet mot middelasimuten ved samme toleranse (endringene { "1" } til { "3" } i forhåndsregistreringen, gjort etter at resultatene var sett og dermed ikke blinde); sammenligningene av kurs og heading ble gjort sirkulære ({ "360" } og { "0" } grader er én kurs, endring { "5" }). Mutasjon: en skalering på { "1e-4" } av østforskyvningen feiler geodesisammenligningen.

seg-1fdbb476c8ab = Maritim tillitsscore: aggregeringen av monitorenes evidens til en score fra 0 til 100 og dens tre bånd

seg-0d76b33144f1 = Hver monitor reduserer sin evidens til et forhold mellom statistikk og terskel; scoren er { "100" } minus summen over monitorer av vekt ganger en avgrenset lineær rampe av forholdet ({ "0" } opp til { "0.5" }, { "1" } ved { "1.5" }), avgrenset til { "0" } til { "100" } og avrundet til { "0.1" }, med bånd ved { "90" } og { "55" }; hver epoke lister monitorene som trakk fra og poengene deres.

seg-b2d3c6d6ac36 = Implementasjon mot spesifikasjon, IKKE en ekstern uavhengig referanse: en clean-room-reimplementasjon i Python (scripts/maritime_score_cleanroom.py), skrevet av en leser som bare fikk docs/RECEIVER-TRUST.md og docs/MARITIME-TRUST.md og ikke Rust-kilden, stemmer med score_from_ratios på { "600" } forholdsvektorer (score, bånd, poeng og rekkefølgen på fradragene, differanse { "0" }), etter at dokumentasjonen ble komplettert der den første leseren fant den taus eller inkonsistent (rekkefølge ved likhet, avrunding, forholdet for en monitor som er bestått-eller-ikke, to eksempler hvis tall ikke stemte med formelen). Det viser at dokumentasjonen er tilstrekkelig og at koden gjør det den sier. HVA SOM IKKE KONTROLLERES, og hvorfor raden forblir MODELLED: selve regelen (vektene, rampen, båndgrensene, evidensholdet) er dette prosjektets egen, forhåndsregistrert men uten ekstern kilde, og ingenting her viser at en score på { "80" } eller { "40" } betyr det en navigatør ville ønske at den betyr ved ekte interferens; ingen tall av den typen oppgis. Monitorenes terskler er likeledes dette prosjektets egne (rad A kontrollerer bare aritmetikken deres).

seg-f52fceaf06ca = NMEA { "0183" } treningsstrøm: formatkontroll og dekodede verdier

seg-684f86418933 = Syntetiske NMEA { "0183" }-strømmer for bro for mannskapstrening (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW og PKSHT-markøren, generert fra et referansespor med modellerte effekter fra mottaker, himmel, jamming og spoofing. Bare tekstutdata; ingenting sendes.

seg-4591ed75149c = HVA SOM KONTROLLERES EKSTERNT, snevert angitt: alle { "225,227" } setninger fra åtte syntetiske treningsstrømmer (fire biblioteksscenarioer, seeds { "1" } og { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW og PKSHT-markøren) leses av pynmea2 { "1.19.0" }, en uavhengig NMEA-parser, med gyldig sjekksum og forventet talker og type. Posisjonen, farten over grunnen, kursen over grunnen, headingen, UTC-tid og -dato, posisjonsstatusen og GGA-satellittantallet den dekoder er lik generatorens referansespor innenfor toleranser fastsatt før den første sammenligningen ({ "1.5e-6" } grader, { "0.06" } kn, { "0.07" } km/t, { "0.11" } grader kurs, { "0.5" } grader heading, { "0.02" } s), kjørt av scripts/gen_nmea_training_ref.py med testdataene i tests/fixtures/nmea_training_ref/. Forventningen til GGA-satellittantallet ble rettet etter den første kjøringen til NMEA-konvensjonen ({ "00" } uten posisjonsbestemmelse); numeriske toleranser uendret fra forhåndsregistreringscommitten. HVA SOM IKKE KONTROLLERES: at en mottaker, kartplotter eller brosystem godtar strømmene; realismen i modellene for mottaker, himmel, jamming eller spoofing (nominell himmel, modellert støy, drag- og replay-profiler, alle MODELLED); HDOP, høyde, og DOP- og GSA/GSV-innholdet utover syntaks og antall; instruktørloggen. Ingenting sendes, og det påstås ingen anti-jam- eller anti-spoof-ytelse.

seg-1be1cfcb95c8 = Interferenskart: betydningen av nøyaktighetskoder, AIS-verdier for ikke tilgjengelig, tildeling av rutenettceller, rutelengde per celletilstand og maskering av innland

seg-71cff2a675e8 = Tolkningen av ADS-B-kodene for navigasjonsnøyaktighet og integritet som kartet bruker (EPU-grensen en NACp-kode står for, grensen for inneslutningsradius en NIC-kode står for, og klassene lav og god metoden utleder fra dem); AIS-verdiene for ikke tilgjengelig i posisjon og fart som AIS-leseren forkaster; den faste breddegrad/lengdegrad-rutenettcellen en posisjon faller i; rutelengden, og dens fordeling etter celletilstand (degradert, ikke degradert, ikke vurdert, ikke observert), som rute-eksponering rapporterer; og om en posisjon ligger innenfor land fra et landpolygon med mer enn en buffer. En celle merket som degradert eller anomal er en uttalelse om rapporterte nøyaktighetsfelt eller usannsynlige posisjoner, ikke et funn av interferens, og ingenting her kontrollerer det.

seg-beee15333c89 = HVA SOM KONTROLLERES EKSTERNT, snevert angitt: fem uavhengige implementasjoner leser de samme syntetiske inndataene. ({ "1" }) pyModeS { "2.21" } dekoder syntetiske DF17-rammer for operasjonell status og luftposisjon; Kshanas NACp EPU-grenser stemmer innenfor { "0.5" } m (største differanse { "0.4" } m), dens NIC-inneslutningsgrenser for kodene { "5" } til { "11" } stemmer innenfor { "1" } m, og dens klasser lav og god plasserer alle { "12" } NACp-kodene og hver NIC-kode referansen produserer ({ "0" } til { "11" }) på samme side av tersklene referansens grenser impliserer ({ "0" } avvik). ({ "2" }) pyais { "3.3.0" } dekoder AIVDM-setninger av type { "1" } hvis nyttelastbiter skriptet pakker fra de rå ITU-R M.1371-feltverdiene; Kshana avviser nøyaktig de dekodede posisjonene for ikke tilgjengelig (breddegrad { "91" }, lengdegrad { "181" }) og fart ({ "102.3" } kn), og beholder { "0" } til { "102.2" } kn som dekodet ({ "0" } avvik over { "94" } rammer). ({ "3" }) shapely { "2.2.0" } covers() på cellepolygoner stemmer med grid::Grid::cell_of for { "1770" } punkter over cellestørrelsene { "0.5" }, { "0.25" }, { "1" } og { "0.07" } grader, inkludert punkter nær kanten, begge poler og antimeridianen ({ "0" } avvik). ({ "4" }) shapely { "2.2.0" } snitt mellom rute og celle med geodetiske WGS84-lengder fra GeographicLib { "2.1" } stemmer med rute-eksponering på { "8" } syntetiske ruter, inkludert to som krysser antimeridianen: total lengde til { "0.6" } % (største differanse { "0.49" } %, kulen mot ellipsoiden) og hver celletilstands lengde til { "0.6" } % pluss { "125" } m per stykke (største { "21" } % av den toleransen). ({ "5" }) shapely { "2.2.0" } contains() med pyproj asimutal-ekvidistant avstand til kystlinjen stemmer med innlandsmasken på { "2000" } m på { "992" } rutenettsentrumspunkter rundt fire syntetiske øyer, én med en innsjø ({ "0" } avvik; { "4" } punkter innenfor { "20" } m av bufferen ble utelatt og telt). Toleransene ble fastsatt i tests/fixtures/interference_map_ref/PREREGISTRATION.md før noen sammenligning, og ikke endret etterpå; to feil i de syntetiske inndataene som den første kjøringen fant er registrert der. HVA SOM IKKE KONTROLLERES: Kshana dekoder ikke rå Mode S-rammer eller AIVDM-setninger, så dette validerer tolkningen av allerede dekodede verdier, ikke en dekoder. Referansens NIC-inneslutningsradier for kodene { "1" }, { "2" } og { "4" } avviker fra DO-260B ({ "20" }, { "8" } og { "2" } NM), så bare kodene { "5" } til { "11" } sammenlignes numerisk. Posisjonsregelen ({ "0" }, { "0" }), høydegulvet, kildetypefilteret, hashingen av identifikatorer, metodens terskler og statistikker og valget av cellestørrelse er Kshanas egne og er ikke kontrollert mot noe. Rutesammenligningen bruker den samme rette stidefinisjonen i breddegrad og lengdegrad på begge sider, så den kontrollerer lengder og celletildeling, ikke at denne stien er den riktige for et fartøy eller fly. Ingenting her viser at en merket celle er interferens. Inndataene er syntetiske; referansedataene skrives av scripts/gen_interference_map_ref.py (pyModeS er GPL-3.0 og brukes bare i det frakoblede skriptet; CI trenger ikke Python).

seg-57ace69bdf1a = Trådformater for tillitstelemetri: Prometheus tekstutdata og OpenTelemetry OTLP/HTTP JSON

seg-654126a9d073 = GNSS-tillit (score, bånd, årsaker, port og, på forespørsel, posisjon) som Prometheus tekstutdata servert på /metrics og som OTLP/HTTP JSON-metrikker, med en grense på kardinaliteten til årsaksetiketter.

seg-b037c999443b = SIEM-hendelser fra tillitstelemetri: Common Event Format (CEF) over syslog

seg-ffd8d7062055 = Hendelser ved båndbytte (eller per epoke) som Common Event Format-nyttelaster i en RFC { "5424" }-konvolutt over UDP eller TCP, med en dokumentert feltavbildning og CEF-escaping.

seg-51640405c9b7 = SIEM-hendelser fra tillitstelemetri: Log Event Extended Format (LEEF) over syslog

seg-1b3245506847 = Hendelser ved båndbytte (eller per epoke) som Log Event Extended Format { "2.0" }-nyttelaster i en RFC { "5424" }-konvolutt over UDP eller TCP, med en dokumentert feltavbildning.

seg-563ccb0adbe5 = HVA SOM KONTROLLERES: denne cratens egne tester med eksakte strenger av den dokumenterte LEEF-feltavbildningen, og RFC { "5424" }-konvoluttfeltene; det finnes ingen vedlikeholdt åpen kildekode-LEEF-parser (et søk i Python-pakkeindeksen fant ingen), så formatet er kontrollert mot sin egen spesifikasjon lest av den samme forfatteren, ikke mot en ekstern uavhengig referanse. HVA SOM IKKE KONTROLLERES: om LEEF-nyttelastene godtas av noen leverandørs parser eller SIEM; escaping-reglene utover de dokumenterte; oppførselen til en ekte syslog-samler.

seg-96a95b89faa5 = Integritet i bevispakker: signatur, hashkjede og verifikasjonsprosedyre

seg-943a853d8a4a = En signert, hashkjedet bevispakke for en GNSS-tillitshendelse: SHA-256 over hver fil og en kjede over manifestet, en Ed25519-signatur over de eksakte manifestbytene, og en verifikator som navngir hver feil (en endret, fjernet, omdøpt, byttet eller tilføyd fil, et omordnet eller redigert manifest, et manifest rehashet uten nøkkelen, en pakke signert på nytt, en feil festet nøkkel, og et tidsstempeltoken som er fjernet, erstattet, søppel eller over et annet dokument).

seg-c15736afcbc9 = Verifisering av signatur og kjede for tidsstempeltoken etter RFC { "3161" }

seg-cd64bbf39459 = evidence::tsa::verify_token, og valgfri <c1/> for en pakkes timestamp.tsr: en RFC { "3161" } TimeStampResp eller bart TimeStampToken (CMS SignedData over en TSTInfo) kontrollert frakoblet mot betrodde ankere slik <c2/> kontrollerer det: innholdstypen og meldingsdigesten i de signerte attributtene over TSTInfo; signaturen over de signerte attributtene (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 og P-384; offentlige RSA-operasjoner på crypto-bigint); ESS-signeringssertifikatet v1 (SHA-1) eller v2 hash som navngir signatursertifikatet, funnet blant tokenets og kallerens ubetrodde sertifikater; signatørens kritiske, eneste utvidede nøkkelbruk timeStamping; kjeden til et betrodd selvutstedt anker med hvert sertifikats signatur, CA-status og nøkkelbruk, og hvert sertifikat gyldig ved tokenets genTime; og meldingsavtrykket mot dataene. Ikke kontrollert: tilbakekalling (CRL, OCSP), navne- og policybegrensninger, nonce

seg-c04042b0270a = Terskler for interferens hos mottakertillit kalibrert på datasettet JammerTest { "2024" }

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: den forhåndsregistrerte kalibreringen av monitorene for C/N0-fall, AGC og jamming-indikator på det offentlige datasettet JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, hentet ved kjøring, aldri medfølgende): per mappe en tidslinje på { "1" } s fra mon_rf.csv og rinex.csv, monitorene kjørt én gang, hver epoke etter kalibreringen merket ren eller jamming fra mappens attack_log (forskjøvet fra CEST til UTC, vakt på { "60" } s), hver terskel sveipet over et fast rutenett, den minste terskelen med samlet sannsynlighet for falsk alarm på rene epoker på høyst { "0.01" } valgt, og antall med leave-one-folder-out som tilbakeholdt datasett; en kryssjekk av UBX-leseren. Utvalget leveres bare som den valgfrie profilen [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); standardregelen og alle utdata uten den er uendret

seg-65a8361b4a22 = Jammertest-skåring: en mottakerlogg skåret per planlagt test (deteksjonsforsinkelse, uteblitte alarmer, falske alarmer, tid til gjenoppretting) mot den publiserte testplanen

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRAs testkatalog og sendeplan (MIT, hentet med en festet SHA-256, aldri medlevert i kildekoden) lest som planlagt referanse med katalog-ID-ene bevart; en kjøring av receiver-trust skåret per test (første alarm minus planlagt start, oppdaget/sen/uteblitt mot en toleranse, tid til første alarmfrie strekning, alarmer utenfor alle tidsluker og deres sikkerhetsmargin), med en signert bevispakke som bærer skåringskortet. Planen består av planlagte tidsluker, ikke registrerte sendetidspunkter

seg-0d227bbcb5f1 = Test-bench-eksport (kshana bench-export): jordfaste og geodetiske kolonner, kolonner for lokal hastighet, orienteringskolonner og utdata i NMEA { "0183" }

seg-c6a6e08afadd = Bevegelses-CSV-filens kolonner for jordfast posisjon, geodetisk posisjon, jordfast hastighet, heading/pitch/roll og UTC, og NMEA-setningene GGA/RMC, skrevet ut fra syntetiske scenarioer (gnss-ins, inkludert automotive-urban-canyon, jamming, gnss-sim). Kun bevegelse og hendelser; det skrives ingen signaler, og det hevdes ingen ytelse for noen simulator eller mottaker.

seg-f953ad11fe08 = HVA SOM KONTROLLERES EKSTERNT, uttrykt snevert: mot pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } og scipy { "1.18.1" }, kjørt av scripts/gen_testbench_ref.py på { "4" } syntetiske scenarioer, med toleranser fastsatt før den første sammenligningen (hver av dem er skriverens verste avrundingstilfelle): de jordfaste kolonnene er lik WGS { "84" }-omregningen av de geodetiske kolonnene (verst { "1.3e-4" } m, terskel { "3e-4" }) og omvendt ({ "1.3e-9" } grader, terskel { "2e-9" }; høyde { "1.3e-4" } m, terskel { "3e-4" }) på hver rad; den jordfaste hastigheten rotert til nord-øst-ned med PROJs toposentriske operasjon er lik motorens sanne NED-hastighet ({ "7.5e-5" } m/s, terskel { "2e-4" }); heading, pitch og roll er lik scipys yaw-pitch-roll av motorens sanne kvaternion ({ "5.0e-7" } grader, terskel { "1e-6" }); hver NMEA-setning tolkes i pynmea2 med gyldig kontrollsum, og dens dekodede posisjon ({ "1.2e-3" } m, terskel { "5e-3" }), høyde, fart, kurs ({ "5.0e-4" } grader, terskel { "1e-3" }) og tid er lik bevegelsesverdiene; UTC-kolonnen er lik uavhengig aritmetikk på dato og klokkeslett. SHA-256 for de nøyaktige CSV- og NMEA-bytene som ble kontrollert, er festet. HVA SOM IKKE KONTROLLERES: scenarioets sanne bane i seg selv (kjøreprofilen og integrasjonen av den); konvensjonene (heading er kroppens yaw, ikke kursen, og avviker fra den med opptil omtrent { "77" } grader på automotive-urban-canyon; GGA-kvalitet, antall satellitter og HDOP er plassholdere); om noen laboratoriesimulator leser filene slik det er ment; enhver ytelse for simulator eller mottaker. De uavhengige referansene kontrollerer omregninger og kodinger, ikke fysikken i scenarioet. Håndtering av lokalt koordinatsystem kontrolleres bare gjennom hastighetsrotasjonen og NMEA-fart og -kurs (CSV-filen har ingen kolonne for lokal posisjon).

seg-ee99388f7b15 = compliance (kshana compliance-report): en kobling fra Kshana-utdata til punkter i offentlige rammeverk, utelukkende etter nummer, fylt ut fra kjøringene som er oppgitt; et resultat teller for en funksjon bare når det bærer evidensen koblingen nevner, en tom mengde gir ingen evidens, og formuleringen er "gir belegg for"; rapporten er ikke en konklusjon om at noe rammeverk er oppfylt, og ikke en vurdering eller godkjenning fra noen.

seg-8659260fd38e = Referanser kontrollert mot en skriptuttrukket overskriftsindeks over de siterte offentlige dokumentene, lest 2026-10-10 (tests/compliance_references.rs). HVA SOM KONTROLLERES: { "49" } siterte referanser til punkter, seksjoner, avsnitt eller overskrifter finnes i det siterte dokumentet, og { "7" } siterte URL-er ble løst opp på den registrerte datoen ({ "2" } via en annen vei); negative kontroller feiler. HVA SOM IKKE KONTROLLERES: at noen parafrase, kobling eller mangel er riktig; EN { "16803" }-punkter (betalt, kun katalogtekst); senere revisjoner; indeksen er ikke en uavhengig implementasjon.

seg-98c360d82d56 = Maritime integrasjoner: Signal K-plugin, OpenCPN-gatestrøm og skårepanel, referansebygg

seg-7af9ce566646 = Tillitsscoren, båndet, årsakene, gate-tilstanden og mottakerrapportert posisjon publisert under navigation.gnss.kshana i en Signal K-server med en warn-, alarm- og normal-varsling (integrations/signalk); den gatede NMEA-strømmen, med posisjonsbestemmelsen merket ugyldig mens tilliten er kollapset og en PKSHT-setning per syklus, levert til OpenCPN over TCP av selve gaten eller av et lite relé, og et innebygd OpenCPN-skårepanel som leser PKSHT-setningen (integrations/opencpn); og systemd-enheter og en container som kjører gaten (deploy/reference-build). Der disse viser utdata, bærer de den veiledende erklæringen: Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-00a0f52f7458 = HVA SOM KONTROLLERES, uttrykt snevert: at disse integrasjonene fungerer mot den virkelige programvaren de er skrevet for. EVIDENSEN er sjekket inn i integrations/signalk/evidence/README.md (med JSON-filene) og integrations/opencpn/evidence/README.md (med skjermbilder og logger), hver med skriptet som gjengir den. ({ "1" }) Signal K: pluginen lastet inn i den festede npm-pakken signalk-server { "2.33.0" }, i et privat navnerom kun for loopback, matet med syntetiske data. Serverens egne REST- og WebSocket-grensesnitt viste de publiserte banene, skåremetadataene og et varsel som gikk fra fraværende til warn, alarm, normal (etter holdetiden) og warn igjen da dataene stoppet. Med den virkelige kshana kjørt av pluginen på NMEA-dataene serveren selv mottok, gikk varselet til warn og deretter alarm, og den rapporterte posisjonen ble publisert; serverens egen navigation.position ble skrevet av dens NMEA-leverandør, aldri av pluginen. Kjørt på nytt mot levende JSON-skjema { "1.2" }. ({ "2" }) OpenCPN: pluginen bygd mot OpenCPNs plugin-API-header og wxWidgets { "3.2.4" }, lastet inn i Ubuntu { "24.04" }-pakken av OpenCPN { "5.8.4" } under en virtuell skjerm; OpenCPN lastet den, kjørte initialiseringen og ga den PKSHT-setningene fra den gatede strømmen, og panelet ble rødt på det ikke-pålitelige båndet. I én ren kjøring sluttet OpenCPNs egen skipsposisjon å oppdateres, og posisjonsindikatoren falt, da gaten merket posisjonsbestemmelsen ugyldig. En andre kjøring matet direkte fra gatens TCP-lytter viste levering til pluginen, men ikke et rent før-og-etter. ({ "3" }) Relétestene spiller av et registrert utdrag av den gatede strømmen gjennom en ekte TCP-socket og kontrollerer hva en forbruker mottar (bytene uendret, gyldige kontrollsummer på hver setning, også de omskrevne, GGA og RMC som stemmer overens, én PKSHT per syklus med gate-feltet der posisjonsbestemmelsen er ugyldig), og ende-til-ende-skriptet kontrollerer at en forbruker av gatens lytter mottar nøyaktig de bytene den samme gaten skriver til standardutdata. ({ "4" }) PKSHT-parserne (JavaScript og C++) kjøres over setninger registrert fra kshana-utdata og avviser en feil kontrollsum, en feil versjon eller en score utenfor { "0" } til { "100" }. ({ "5" }) systemd-enhetene kontrolleres med systemd-analyze verify (systemd { "255" }, binærfiler erstattet med stubber) og med vakter mot et skall i ExecStart, omstartspolicyen og sandkassenøklene; containerens inngangspunkt og dens håndtering av argumenter kontrolleres med en stubb-binærfil. HVA SOM IKKE KONTROLLERES: det finnes ingen ekstern uavhengig referanse for noen verdi disse integrasjonene viser. Tillitsverdiene selv er radene ovenfor, og en integrasjonskjøring viser bare at rørleggerarbeidet bærer dem fram; derfor er denne raden MODELLED og ikke VALIDATED (docs/VALIDATION.md). Ingen virkelig båt, mottaker, lang kjøring, annen versjon av noen av vertene, annet operativsystem eller skrivebord ble brukt; alle data er syntetisk tekst, og ingenting her er en måling. Varslets lyd og visuelle håndtering hos en virkelig Signal K-klient, OpenCPNs verktøylinjeknapp, innstillinger og utdatert tilstand, og pakking for OpenCPNs plugin-behandler ble ikke prøvd. systemd-sandkassenøklene ble bare kontrollert for syntaks, ikke kjørt under en levende systemd, og bygget av containerbildet og dets helsekontroll har ingen innsjekket evidens her. Ingen deteksjons- eller falskalarmtall hevdes. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-475397d05dd0 = <s1>receiver_trust (live: gaten, dens TCP-lytter, PKSHT); utenfor crate-en: integrations/signalk (JavaScript), integrations/opencpn (JavaScript-relé, C++ innebygd plugin), deploy/reference-build (systemd-enheter, container)</s1>

seg-89ab9ef155eb = Sporing med BOC({ "1,1" }): DLL-skalering og oppløsning av bump-jump-flertydighet (valgfri)

seg-ef24be9b5917 = Feltet boc i iq::track::LoopConfig (valgfritt, None som standard): de tre DLL-diskriminatorene skalert slik at de leser kodefeilen i chip med enhetsstigning på hovedtoppen til sinus-BOC({ "1,1" }), og en bump-jump-monitor på veldig tidlige og veldig sene korrelatorer ved én halvperiode av underbæreren ({ "0.5" } chip) som hopper kode-NCO-en mot hovedtoppen når en opp/ned-teller når N ({ "8" } som standard). Uten valget er alle utdata uendret.

seg-2c32955cbfb3 = IQ-kanal for ionosfærisk scintillasjon (Cornell-modellen) mot målt { "50" } Hz GPS L1-scintillasjon

seg-2fdcb373ab25 = iq::channel::scint, Cornell-scintillasjonsmodellen (Rice-intensitet, andreordens Butterworth-spekter, fase arg z) drevet ved et målt vindus S4 og intensitetens dekorrelasjonstid, sammenlignet på det den genererer utover disse to inngangene; realdata::scint50 leser den målte loggen, fjerner trenden og kjører sammenligningen.

seg-160507ac3702 = Valgfri celle-midlende CFAR i IQ-akkvisisjon

seg-7c0a1adc9ae6 = iq::acq::ca_cfar og ca_cfar_cells (valgfri): en celle i et akkvisisjonsrutenett sammenlignes med gjennomsnittet av referanseceller i sin Doppler-rad (vern- og steglag, med omlegg rundt perioden), med en faktor alpha fastsatt ut fra den lukkede formelen for CA-CFAR-falskalarmsannsynligheten for M ikke-koherente blokker (ca_cfar_pfa, ca_cfar_alpha). Detektoren på samplet effekt forblir standarden, og alle eksisterende utdata er uendret.

seg-5bd3bf0c22a7 = Spektrummodell: GLONASS-, BeiDou- og Galileo E6-bånd (valgfri)

seg-9c16189c63ac = spectrum::default_band løser opp, bare etter navn (MORE_BAND_NAMES), GLONASS L1OF og L2OF på hver FDMA-kanal K = -7 til { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a og B3I (BPSK({ "10" })) og Galileo E6 (BPSK({ "5" })), med bærebølgene og minste mottatte effekter fra deres grensesnittkontrolldokumenter; standard båndsett og alle eksisterende utdata er uendret.

seg-63b7da996265 = BeiDou B1I primære avstandskoder mot en uavhengig generator

seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits og b1i: Gold-kodene i BDS-SIS-ICD-B1I-3.0 avkortet til { "2046" } chip, PRN { "1" } til { "63" }, slik IQ-laget genererer, akkvirerer og sporer dem.

seg-b4787b04338e = GPS L1C avstands- og overleggskoder mot de trykte kontrollkolonnene i IS-GPS-800J

seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits og l1c_o_bits: Weil-avstandskodene L1CP og L1CD (beregnet Legendre-sekvens, Weil-indeks, utvidelsessekvens satt inn før chip p) og L1CO S1-overleggskodene, PRN { "1" } til { "63" }.

seg-5cba09089e09 = LunaNet AFS-I- og AFS-Q-primærkoder mot de trykte kontrollkolonnene i LSIS-AFS V1.0

seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits og afs_q_primary_bits (signalnavnene lunanet-afs-i og lunanet-afs-q i kshana iq): AFS-I Gold-koden ({ "2047" } kortsyklet til { "2046" }, G2 forsinket per PRN) og AFS-Q Weil-primærkoden (beregnet Legendre-sekvens, Weil-indeks, utvidelsessekvens satt inn før chip p), PRN { "1" } til { "210" }.

seg-7b1ae0c7ca28 = LunaNet AFS-tertiærkoder og meldingslag (SB1 BCH, CRC-24Q, interleaver) mot LSIS-AFS V1.0

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synkroniseringsmønster, SB1 BCH({ "51,8" })-koder og dekoder med 256 hypoteser, CRC-24Q, blokk-interleaveren på { "60" } x { "98" }, en kontroll av symbolstrømmer (kshana lunanet-afs-check) og en teststrømgenerator med plassholder-underrammer. LDPC-kodingen med rate 1/2 av underrammene { "2" } til { "4" } er ikke implementert (matrisene finnes i et eget vedlegg).

seg-0d7b17524c04 = Standardpakker: scenarioer skåret mot terskler fastsatt før kjøringen

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): testprofilene i DHS Resilient PNT-rammeverket for nivå { "1" } til { "4" }, IMO MSC.1/Circ.1575 nøyaktighetsnivåer og integritetsevaluering, og ICAO Doc { "9849" } vedlegg F-pakkene monitor, assess og mitigate: hver test kjører en medfølgende scenariotype og sammenligner resultatfelt med terskler oppgitt i pakken, og tester som trenger en mottakerlogg er oppført som NEEDS INPUT og ikke skåret.

seg-d9ea966abdd6 = Ingen eksterne for scenarioresultatene: hver pakketest kjører en MODELLED scenariotype. Tersklene er pakkeforfatterens oppgitte profil (DHS-rammeverket oppgir ingen verdier; IMOs nøyaktighetsgrenser er tabell C-1 i MSC.1/Circ.1575, lest i sin helhet; ICAO-pakken følger ICAOs egen presentasjon av RFI Mitigation Plan fordi Doc { "9849" } er en betalt publikasjon og ikke ble lest), sjekket inn før enhver skåret kjøring i PREREGISTRATION.md-filer i xval-stil under standards/. En MET terskel sier at et modellert scenario nådde en oppgitt terskel, ingenting om et produkt

seg-8a8f2c85e0c3 = Bevispakke for laboratorie-rundtur (scenario, testbetingelser, mottakerlogg, score)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) og eksporten av mottakerloggen kshana.test-conditions/1 fra kshana bench-export: en signert pakke som registrerer scenarioets hash, hashen til de oppgitte betingelsene, loggens hash og scoren mot de oppgitte hendelsene, og som avviser betingelser som ikke stemmer med skåringshendelsene eller en logg hvis hash ikke er den oppgitte. Det skrives, spilles av eller planlegges ikke noe signal.

seg-76da58fe670a = Ingen ekstern: pakken knytter sammen hasher og en MODELLED skåring av mottakerloggen, kontrollert på syntetiske data (den eksporterte NMEA-en fra et medfølgende scenario behandlet som mottakerens logg). Ingen laboratoriekjøring hevdes

seg-a9189e4fe413 = IQ-sporingsmotor mot GNSS-SDR { "0.0.19" } på uavhengige opptak

seg-364de05e5b1b = Hele sporingsmotoren i IQ-laget (iq::track gjennom kshana iq track: overlevering fra akkvisisjon, korrelatorer, NCO-er, andreordens Costas-PLL på { "15" } Hz, førsteordens karrierestøttet EML-envelope-DLL på { "2" } Hz, låseindikator og C/N0-estimatorer) på GPS L1 C/A ved { "30" } til { "45" } dB-Hz.

seg-259d201c2ff8 = CRPA-antenneforsterkninger i jamming-typen mot en uavhengig numpy-omberegning

seg-192144c57783 = Den valgfrie [crpa]-seksjonen i jamming-typen: en stråle per kanal mot hver satellitt (nullstyring med jammeren som null, eller MVDR på sigma^{ "2" } I + P_j a_j a_j^H), som skalerer hver lenkes støy med ||w||^{ "2" } og jammeren med |w^H a_j|^{ "2" } før den eksisterende anti-jam C/N0-ligningen.

seg-a2f34cff9338 = Terrengskygge av jammeren i jamming-typen mot en uavhengig numpy-omberegning på en virkelig SRTM-rute

seg-334c569d9cae = Den valgfrie [terrain]-seksjonen i jamming-typen: den store sirkelens terrengprofil mellom jammer og mottaker på en SRTM .hgt-rute med en jordbuling med k-faktor, den dominerende knivseggen (største Fresnel-Kirchhoff nu) og enkeltknivseggtapet i ITU-R P.526-15 avsnitt { "4.1" }, trukket fra jammerens mottatte effekt.

seg-825c121c7512 = Akkvisisjonshysterese og frontend-kvantiseren i jamming-typen mot uavhengige omberegninger

seg-f7207263d881 = De valgfrie seksjonene [acquisition] (en satellitt akkvireres ved eller over en akkvisisjonsterskel etter en forsinkelse for gjenakkvisisjon og holdes mens den er ved eller over sporingsterskelen) og [front_end] (AGC-avlesningen { "10" } log10({ "1" } + J/N) og ADC-ens kvantiseringstap for gaussisk inngang, trukket fra hver lenke, merket som ikke gyldig for ikke-gaussiske jammere) i jamming-typen.

seg-9c46f1c76486 = Begrenset FLL-innhenting under standardutformingens gulv for overgang fra FLL til PLL (valgfri)

seg-efa1d1a9e904 = iq::tracks valgfrie carrier.fll_pull_in_max_s (feltet fll_pull_in_max_s i iq::track::LoopConfig): under fll_assist = pull-in overleverer FLL-en til PLL-en etter en fast innhentingstid uansett PLI, med en tilsvarende returvarighet til PLI første gang når fll_off_pli.

seg-ac0f97e945a7 = RTKLIB .pos-løsningsleser for receiver-trust

seg-0b8bc2c89de4 = Leser en RTKLIB-løsningsfil (kalender- eller GPS-uke/TOW-tid, bredde/lengde eller ECEF-posisjon, brukte satellitter) inn i tidslinjen til receiver-trust (receiver_trust::machines::rtklib).

seg-3de364392f92 = Ingen ekstern: ingen fil produsert av RTKLIB ble lest, og kolonneoppsettet er fra RTKLIB-manualen. Kontrollert bare på selvskrevne filer; ECEF-omregningen gjenbruker frames::ecef_to_geodetic, som har sine egne rader

seg-849393517c04 = NovAtel OEM7 ASCII- og binærlogger (BESTPOS, RANGE, RXSTATUS) for receiver-trust

seg-7e0021922025 = Leser BESTPOS (posisjon), RANGE (C/No per signal) og RXSTATUS (mottakerens jammerflagg, som epokens egenrapport) fra ASCII- og binære OEM7-logger, CRC-kontrollert, skrivebeskyttet (receiver_trust::machines::novatel).

seg-1f7c6d1009a8 = Ingen ekstern som terskel for bestått. Feltoppsettene og CRC-en følger den offentlige OEM7-dokumentasjonen (docs.novatel.com); CRC-rutinen ble kontrollert én gang mot CRC-en dokumentasjonen oppgir for sitt eget BESTPOSA-eksempel (sitert, ikke gjengitt). Fixturene er selvskrevne; ingen logg fra en virkelig mottaker ble lest

seg-a45c53a9deb3 = RTCM { "3" } MSM4- og MSM7-leser for bærebølge-til-støy for receiver-trust

seg-0a0c9976236f = Leser C/N0 for hver signalcelle i RTCM { "3" } MSM4- og MSM7-meldinger (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) fra en rammestrøm, CRC-24Q-kontrollert (receiver_trust::machines::rtcm3). Oppsettene er fra de BSD-lisensierte pyrtcm-tabellene, ikke fra teksten i RTCM-standarden.

seg-2af6fc1abe98 = ReferenceImpl i en engangskontroll, ikke en test i suiten: dekoderen i pyrtcm { "1.2.0" } leser de samme selvskrevne rammene til samme C/N0 og epoketid. Den deler kilden til tabellene med denne leseren, så den kontrollerer bitbehandlingen, ikke oppsettet. Ingen opptak fra en virkelig mottaker eller basestasjon ble lest

seg-cd554a7c1649 = GNSS-SDR-monitoradapter for receiver-trust

seg-22b587ac642d = Leser GNSS-SDR Monitor-meldinger (Gnss_Synchro) og PVT-monitormeldinger, videresendt som JSON-linjer med proto-feltnavnene, til C/N0 per kanal, posisjonsbestemmelse, brukte satellitter, HDOP og himmel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-d22aed9d9a16 = Ingen ekstern: feltnavnene kommer fra GNSS-SDR-dokumentasjonen; verken leseren eller relay.py ble kjørt mot en levende GNSS-SDR eller et virkelig opptak

seg-217e5953c128 = Innlesing av IMU-logger, gyro-heading som inngang og Allan-tilpasning av parametere for hybride sensorer

seg-9dadc819daef = Leser en IMU-CSV (dokumenterte kolonner, eller EuRoC-oppsettet); integrerer gir-raten til den headingen heading-course-monitoren leser ([log.imu]); og tilpasser støyparameterne for akselerometer og gyro i de hybride scenarioene og fusjonsscenarioene fra en stasjonær logg ved overlappende Allan-avvik (imu-fit).

seg-9099f3467e9e = Ingen ekstern: tilpasningen er kontrollert på syntetiske hvitstøylogger med kjente koeffisienter, headingen på logger med konstant gir-rate. Ingen virkelig IMU-logg ble tilpasset, og q_aa er ikke tilpasset

seg-15a852a2dcb0 = Home Assistant MQTT-oppdagelse og tilstandseksport for tillitstelemetri

seg-6d6b07b26966 = Et JSON-tilstandsdokument og Home Assistant MQTT-oppdagelsesmeldinger for tillitsstrømmen, skrevet ut som tekst på alle flater og publisert over MQTT { "3.1.1" } QoS { "0" } av CLI-et (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-79a8f3864af3 = Ingen ekstern: pakkene ble lest av en loopback-lytter skrevet for testen, ikke av en virkelig megler, og Home Assistant ble ikke kjørt

seg-68caf86157c2 = ROS { "2" }-pakke for receiver-trust og gnss_lib_py-bro

seg-e7d7d99fe538 = En ROS-fri bro som skriver posisjons- og satellittmeldinger som NMEA og skårer dem gjennom Python-bindingen (integrations/ros2/kshana_trust), og en bro fra gnss_lib_py NavData til receiver-trust gjennom formatet rtklib-pos (integrations/gnss_lib_py).

seg-05ded40b17d2 = Ingen ekstern: ROS-noden ble ikke kjørt på en levende ROS { "2" }-graf, og feltnavnene i ublox_ubx_msgs ble ikke kontrollert mot en kjørende driver. gnss_lib_py (MIT) ble kjørt for brotesten

seg-6eee4b0e40b9 = <s1>Forrige</s1>Verifikasjonsmatrise

seg-c3e7639ccf1a = <s1>Neste</s1>Hvorfor radene forblir modellerte

seg-2fd8f2df3e6e = De { "61" } funksjonskortene fra <c1/>, deretter alle { "401" } radene i verifikasjonsmatrisen.

seg-65185cb68d6b = Feilbudsjett for navigasjon og tidssynkronisering for en kjede av oppdragsfaser fra oppskyting til gjeninntreden (<c1/>)

seg-86a132e1a243 = Typen <c1/>: et dokument av faser, hver av dem én av åtte registrerte typer, kjørt i rekkefølge med 6x6-kovariansen, klokken og referansesystemet videreført under en oppgitt regel (<c2/>; <c3/>, hvit akselerasjonsstøy over et oppgitt gap på en rettlinjet modell; <c4/>, dødregning og så kildegulvet, aldri under det, aldri en nullstilling); konverteringer av referansesystem GCRF, MCI og MCMF og av tidsskala via TT, hver sin budsjettrad, med Månens tilstand fra et valgfritt DE440-kjerneutsnitt og den analytiske rekken som oppgitt reserveløsning; marginen mot et oppgitt krav, det svakeste leddet, hendelsene og en tidslinjefigur. Hvert tall er en oppgitt inndata eller en modell av en slik

seg-cf8a0dc4088e = Håndberegninger i testene (veksten i rettlinjet kovarians, den midlere siderale rotasjonen, den sekulære månklokkeraten) og, for Månens tilstand alene, de innsjekkede DE440-kjerneutsnittene mot festede JPL Horizons-verdier (verst { "2.6" } m og { "7e-6" } m/s). Ingen oppdragsdata sammenlignes med kjeden; fasene er egne rader. Dokumentet er en oppgitt kjede med ILLUSTRATIVE inndata, bare offentlige kilder og ingen støtte fra noe romfartsbyrå

seg-87b2b2459b45 = Oppskyting og stigning til en parkeringsbane med GNSS-innhenting og signalbortfall (<c1/>)

seg-725e7ce83533 = Fasen <c1/>: en posisjons- og hastighetskovarians med konstant hastighet og hvit akselerasjonsstøy (dødregningsklassen), en GNSS-posisjonsbestemmelse med oppgitt nøyaktighet brukt etter innhentingstiden og utenfor oppgitte bortfall, en klokke med bias og drift disiplinert av de samme posisjonsbestemmelsene, og innsettingstilstanden i parkeringsbanen

seg-22e5c301626e = Riccati-likevekten og håndberegningen av prediksjonen i testene. Ingenting her modellerer en bærerakett eller en mottaker; hvert tall er en oppgitt inndata

seg-eb66a49b0306 = Relativ navigasjon til dokkingvinduet i lav jordbane over sensoretapper (<c1/>)

seg-658a0448d80d = Fasen <c1/>: den relative tilstanden i målets LVLH-akser med den lukkede Clohessy-Wiltshire-overgangen, en 6x6 Kalman-kovarians med hvit akselerasjonsstøy og posisjonsoppdateringer hvis varians er sensorens ved gjeldende avstand, over etapper med en oppgitt sensor (ILLUSTRATIVE former for optisk kamera, lidar og radioavstandsmåling); dokkingvinduet er tiden fra den relative sigmaen holder seg innenfor fangstomhyllingen til slutten av fasen. Jagerfartøyets absolutte kovarians føres videre uendret, og en rad sier det

seg-97f4aa0575e6 = En énaksers håndberegning av prediksjon og oppdatering i testen; Clohessy-Wiltshire-overgangen er den cw_dynamics kontrollerer mot en uavhengig numerisk integrasjon. Sensorene er ILLUSTRATIVE, og ingen virkelig rendezvous sammenlignes

seg-b45a8a357faf = Trans-lunar injeksjon og cislunar seilas: propagert middeltilstand og kovarians med sporingsoppdateringer (<c1/>)

seg-ab5c79789754 = Fasen <c1/>: middeltilstanden fra motorens Cowell-propagator (jordens punktmasse og J2, Solen og Månen som tredje legemer, Månen fra oppdragstrådens DE440-kjerne der den dekker segmentet og Solen fra den analytiske rekken); kovariansen fra en tilstandsovergangsmatrise med foroverdifferanse for den propageringen (den nominelle kjøringen og seks forstyrrede kjøringer per segment) med hvit akselerasjonsstøy; TLI-brenningens størrelses- og pekefeil; posisjonsbestemmelser fra <c2/> hvis tilgjengelighet og PDOP kommer fra sveipet over romtjenestevolumet langs en oskulerende bane som står i for buen; avstands- og avstandsratesporing langs den geosentriske retningen skalert med bakkenettverkets driftssyklus, med oppdatering i Joseph-form

seg-86dae517e339 = Liouvilles teorem (determinanten av tilstandsovergangsmatrisen for den konservative delen er én) og en finere differanse i testene; middeltilstanden sammenlignes med en offentlig bane i raden under, som den bommer på. Brenningsfeilen, oppdateringene og kovariansen sammenlignes ikke med noe

seg-7a3eb4fae324 = Kovarians ved grensesnittet for gjeninntreden, korridorsannsynlighet, maksimal retardasjon og landingsfotavtrykk (<c1/>)

seg-93f07906d7bf = Fasen <c1/>: returkysten fra <c2/> uten brenning, som ender ved grensesnittet for gjeninntreden; banevinkelen og dens sigma fra den fulle kovariansen ved en gradient med endelig differanse; sannsynligheten for at vinkelen ligger innenfor en oppgitt korridor; den maksimale retardasjonen ved nominell vinkel og ved begge korridorkantene fra motorens plane ballistiske punktmasseinngang (utsprett oppdaget) ved siden av Allen-Eggers' lukkede form; landingsfotavtrykket fra en oppgitt følsomhet i rekkevidderetningen og grensesnittkovariansen på tvers av banens plan. Ingen løft, styring eller oppvarming er modellert

seg-8d5695aad35b = Håndberegninger i testene (vinkelens sigma er den vinkelrette hastighetssigmaen delt på farten; den gaussiske massen i en korridor). Den plane inngangen er motorens egen, og Allen-Eggers-formen er en sammenligning i lukket form; ingen fløyet gjeninntreden sammenlignes

seg-3f0951532f6e = Dekning og sporingsdrift fra bakkenettverket for en trådfase (<c1/> av <c2/>)

seg-5204af351299 = Bakkenettverkets overlegg: stasjoner med en minste elevasjon, kjøretøyets synlighet på en oppgitt geometri (inngangstilstanden fløyet to-legeme med J2, Månens posisjon for seilasen, eller en oppgitt driftssyklus), stasjonsoverleveringer som hver taper en oppgitt tid, og den resulterende driftssyklusen sendt til fasens oppdateringsrate for bakkesporing; det lengste intervallet uten stasjon i sikte er en budsjettrad

seg-0d1d229a3ab7 = Kontroller av zenit- og antipodegeometri og den forventede synligheten til et fjernt mål i testene. Ingen virkelig nettverk, antenne eller plan er modellert

seg-4ba700726208 = Relativ navigasjon til dokking i en månebane (<c1/>)

seg-2e30e78e49f7 = Typen og fasen <c1/>: et felles batch-estimat med Gauss-Newton for to fartøyer over buen (tjueen parametere: begge tilstander og vedvarende posisjonsbiaser i signalet i rommet, felles og uavhengige), utvidet over en fjerdedel, en halvdel og hele buen med steghalvering, fra en absolutt posisjonsbestemmelse per fartøy (grensen for AFS-pilotkodesporing, ILLUSTRATIVE relésett) og en avstand over krysslenken, under månekraftmodellen i crate-en; den gjennomsnittlige normaliserte estimeringsfeilen i kvadrat, Clohessy-Wiltshire-kontrollen på en sirkulær bane og 6x6-kovariansen som føres videre

seg-09fa0c35d004 = Selvkonsistens under en forhåndsregistrering (xval/mission-thread-lunar/PREREGISTRATION.md, resultater og estimatorhistorikken i RESULTS.md): gjennomsnittlig NEES for den relative tilstanden er { "5.85" } til { "5.93" } mot båndet { "5.2" } til { "6.8" } i fire konfigurasjoner, MET på den fjerde estimatorutformingen etter at tre utforminger med sekvensielt filter bommet; referansen og estimatoren deler én kraftmodell, så dette sier ingenting om modellfeil. Propagatoren den deler sammenlignes med LRO og CAPSTONE i en rad under

seg-c85d7e5e63a3 = Budsjett for landingsspredning på et sted nær månens pol (<c1/>)

seg-bd88ab3ad105 = Typen og fasen <c1/>: en inertiell feilmodell med fem tilstander per akse (posisjon, hastighet, akselerometerbias, helling, gyrobias) over en drevet nedstigning, støttet av AFS-posisjonsbestemmelser (alene eller differensielle, med tilfellet med klokkestøtte og tre reléer), en terrengrelativ posisjonsbestemmelse (motorens terrain-nav-matcher på syntetisk relieff, eller en Cramer-Rao-grense på en LOLA DEM med en regel for aperturproblemet) og månetid, med en Monte Carlo-landingsellipse

seg-a5ddb83a5cf1 = Den lukkede formen for inertiell drift, resultatene til de gjenbrukte typene selv og kalibreringen av 3-sigma-ellipsen (andelen innenfor stemmer med forventningen) i testene. Ingen fløyet eller testet landing sammenlignes

seg-8dfc1600cf8c = Tilgjengelighet for posisjonering og tidssynkronisering på overflaten etter sted og årstid ved månens poler (<c1/>)

seg-f91c1da9ab55 = Typen og fasen <c1/>: relétilgjengelighet og PDOP, jord- og solsynlighet og en disiplinert overflateklokke for hvert sted og hver årstid, med terrengsilhuetten fra <c2/>; en kjøring for ett sted tilsvarer den typens tilgjengelighet og PDOP bit for bit

seg-e3a782dce8be = Eksakt likhet med den eksisterende typen for ett sted, og monotonisitetskontroller, i testene. Relésettet er ILLUSTRATIVE, og ingen overflatemåling sammenlignes

seg-0db91d70a079 = Drevet oppstigning fra et sted ved månens pol til en innsettingsbane (<c1/>)

seg-b5b1125d515c = Typen og fasen <c1/>: den inertielle feilmodellen med fem tilstander per akse kjørt over en drevet oppstigning med spesifikk kraft langs banen, støttet av AFS-posisjonsbestemmelser og månetid, som rapporterer posisjons- og hastighetskovariansen ved innsetting ført til bane og spredningen ved motoravstengning (rapportert, ikke ført videre)

seg-76e0d23b7483 = Den lukkede formen for inertiell drift og monotonisitetskontroller i testene. Ingen fløyet oppstigning sammenlignes

seg-1983ce9cc6da = Propageringen med månens kraftmodell mot offentlige rekonstruerte baner for månesatellitter og cislunare baner

seg-57f53a7d1fa2 = Propagatoren de lunare typene deler (GRAIL GL0660B grad og orden { "150" }, Jorden og Solen som tredje legemer, relativitet, DE440-månorientering) sammenlignet med de offentlige JPL Horizons-banene til LRO ({ "24" } t, prøver hvert { "10" } minutt) og CAPSTONE (én omdreining på { "6.5" } dager, prøver hver time), under terskler fastsatt i en innsjekket fil før kjøringen

seg-321d0721970d = JPL Horizons-efemerider for romfartøy for LRO og CAPSTONE, mot terskler forhåndsregistrert i xval/mission-thread-lunar/PREREGISTRATION.md (endringene { "1" } til { "6" }). LRO: MET, { "33" } m største 3D-forskjell og { "2.4" } m RMS radialt mot { "500" } m og { "60" } m. CAPSTONE: NOT MET, en forskjell i sluttposisjon på { "136.8" } km mot { "25" } km og en forskjell i periapsis på { "28.4" } km mot { "10" } km, årsakene er ikke isolert. Raden er Modellert fordi CAPSTONE-terskelen er bommet og sammenligningen tester den delte propagatoren, ikke noe filter, signal eller budsjett

seg-c557d317389a = Propageringen av middeltilstanden i cislunart rom mot den offentlige Artemis I-banen (<c1/>)

seg-539d4c3e9b56 = Middeltilstandspropageringen i fasen <c1/> (Cowell, jordens punktmasse og J2, Solen og Månen som tredje legemer, Månen fra et DE440-utsnitt) sammenlignet med den offentlige JPL Horizons-banen til Artemis I over en glidebue på { "72" } t fra 2022-11-16 { "18" }:{ "00" } TDB, ved epoker med { "12" } timers mellomrom, under terskler fastsatt i en innsjekket fil før kjøringen

seg-362b1a7b9e5e = JPL Horizons-mål -1023 (NASAs navigasjonsbane etter TLI slik den ble fløyet), mot terskler forhåndsregistrert i xval/mission-thread/PREREGISTRATION.md (endring { "1" } endrer bare forespørselens tidsspenn). NOT MET og oppgitt som bommet: { "45.3" } km største posisjonsforskjell mot { "5" } km, og { "0.249" } m/s hastighetsforskjell ved { "72" } t mot { "0.05" } m/s. En diagnostikk skrevet etter at utfallet var gitt plasserer bommen i fem impulsive hastighetssteg på { "0.09" } til { "0.22" } m/s i referansen (den forhåndsregistrerte lesingen om at vinduet ikke hadde noen brenning var feil); over de andre { "67" } timene gjengir modellen neste timestilstand med en median på { "0.38" } m. Tester bare middeltilstanden til én glidebue: ingen kovarians, noe filter, oppdatering eller annen fase

seg-150ae9c3d755 = Kilderegion for interferens: en mulig senderregion fra posisjonsrapporter fra fly og skip

seg-b5c49044a7a1 = En mulig region for hvor en kilde til forringede navigasjonsrapporter kan befinne seg, fra posisjonsrapporter fra ADS-B (NIC/NACp) eller AIS: radiosiktlinje på en 4/3-jordradius fra rapporthøyden og et høydeområde for senderantennen, en begrenset effektiv rekkevidde for den ukjente effekten, berørte enheter som trekker posterioren mot rekkevidden sin og uberørte enheter med siktlinje som presser mot den, gruppert i økter i tid og rom. Utdata er regioner med høyest tetthet ved oppgitte konfidensnivåer, et posteriort tyngdepunkt med en momentellipse, øktens start, slutt, varighet, berørt areal og antall distinkte fly over publiseringsminimum, en døgnprofil og timer per dag. Terrengfri; én kilde per økt; troverdigheten er betinget av modellen. Valgfri fusjon med en TDOA-posisjonsbestemmelse fra geolocation.

seg-953a8b4f9f41 = Ingen eksterne ennå. Bare syntetiske rundturer forover og invers, fra en generator som deler estimatorens modell, så de kontrollerer koden og kalibreringen av de oppgitte nivåene under den modellen og ingenting om virkelige sendere. En ekstern kontroll mot de publiserte senderstedene fra Jammertest { "2025" } ble forhåndsregistrert (docs/emitter-region/PREREGISTRATION.md, underskrevet av eieren før noen skåret kjøring) og kjørt én gang (docs/emitter-region/RESULTS.md): ADS-B NOT ASSESSABLE ({ "2" } planlagte økter, færre enn det registrerte minimumet på { "4" }) og AIS NOT ASSESSABLE (ingen publisert økt), så ingen terskel ble testet og raden forblir MODELLED

seg-d5a79853b72f = { "93" } av { "93" } typer, { "3334" } av { "3334" } numeriske felt
