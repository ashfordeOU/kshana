# docs--capability-reference: translations (sv)

seg-f4f59f19e091 = Förmågekort

seg-501d3a72ea43 = Integritet

seg-20db2c79b998 = Validated

seg-29e58493fdd4 = Modelled

seg-298cc35fe9d1 = Tröghet

seg-b03984610dc0 = Månen

seg-f1f903f1b9ff = Resiliens

seg-bd64cfb4dc52 = Banpropagering & konstellationsdesign

seg-a7cfe6f135f1 = Bana & geometri

seg-3060564c3e21 = 666/666 AIAA-vektorer · { "4.12" } mm

seg-5b265eaf8f29 = SGP4/SDP4-propagering från verkliga tvåradsuppsättningar (en incheckad Celestrak-ögonblicksbild av GPS) eller syntetiska Walker-konstellationer vars medelelement realiserar formeln i:T/P/F till under { "1" } km över { "24" } h. Synlighet för flera konstellationer, dilution of precision och GNSS-tillgänglighet, en optimerare för konstellationsdesign, dimensionering med täckningsgator och ett Walker-designsvep som redovisar de Pareto-optimala designerna över ett rutnät av banplan × satelliter.

seg-66e33b899daf = Cowell-propagator & kraftmodell med sex störningar

seg-a5a572db3bed = Numerisk propagator

seg-52a4410a54da = konservativa nivåer < { "0.08" } m / { "24" } h mot Orekit { "12.2" }

seg-463ed85c6e40 = En numerisk (Cowell) propagator som kompletterar den analytiska SGP4/SDP4-vägen, med en hierarkisk kraftmodell: tvåkroppsproblem + hela zonala fältet J2–J6, ett valfritt tesseralt geopotentialfält EGM2008 till grad/ordning { "70" }, tredjekroppsgravitation från solen och månen styrd av epok (en inbyggd efemerid, ingen DE/SPK-kärna), solstrålningstryck med konisk umbra-/penumbraskugga, atmosfärsmotstånd, den postnewtonska relativistiska korrektionen enligt Schwarzschild och Lense–Thirring-termen för referenssystemets släpning — drivna av ett val mellan adaptiva integratorer: RK4 med stegdubbling eller Dormand–Prince RK5({ "4" }).

seg-797370a2faef = Banmanövrar, Lambert & porkchop

seg-57b120fb0aac = Manövrar & banutformning

seg-5081c84dfdd7 = Tsiolkovskij < { "0.01" } % · Lambert-rundturer till tvåkroppssanning

seg-da6b16ebd59b = Impulsiva ΔV-noder med kovarianspropagering { "6" }×{ "6" }, integrering av ändliga brinnperioder kontrollerad mot Tsiolkovskijs raketekvation till under { "0.01" } %, en Lambert-lösare av Izzo-2015-typ för ett varv och en exakt Kepler-propagator med universella variabler, samt ett porkchop-svep (uppskjutning × ankomst) av C3 / ankomst-V∞ som ges ut som ett JSON-konturrutnät — prestandasimuleringslagret ovanför GMAT/Orekit.

seg-831552a45712 = Tidsskalor & jordorienteringssystem

seg-76b323512350 = Tidssystem

seg-60208bd726eb = bit för bit mot SOFA/ERFA · Vallado från början till slut { "4" } mm

seg-42373dd9ca64 = IERS-tidsskalorna UTC / TAI / TT / UT1 med skottsekunder, ett API för juliansk dag, IAU-2000:s jordrotationsvinkel (Earth Rotation Angle), TEME ↔ ECEF baserat på GMST och geodetiska system enligt WGS-84, full IAU 2000A/2000B-nutation och IAU { "2006" }-precession, samt den ekvinoxfria CIO-baserade reduktionen IAU 2006/2000A GCRS↔ITRS med polrörelse från IERS — validerad bit för bit mot SOFA/ERFA-vektorerna och oberoende korskontrollerad mot ANISE (SPICE i ren Rust): GCRS→ITRS mot ANISE ITRF93, samma IERS EOP, stämmer överens till ≤ { "0.86" } m på marken / ≤ { "3.6" } m vid GNSS-bana.

seg-dd766880e73a = Prediktion av jordorientering i realtid

seg-54169bca19e9 = { "12" } ledtider mot arkiverad Bulletin A: UT1 { "2.93" } ms, polrörelse { "1.76" } mas

seg-81be07e41d1c = En prediktor för jordorientering i operativ stil — minsta kvadrater över bias, förändringstakt och de huvudsakliga periodiska termerna över ett släpande fönster — mätt mot verkligt arkiverade prediktioner i Bulletin A i stället för mot persistens. Standardindata offline är en verklig IERS-produkt finals2000A med prediktionsrader från Bulletin A, så att en körning utan argument ger en ifylld tabell per horisont i stället för en tom. UT1 och polrörelse redovisas över en gemensam radmängd tillsammans med deras kombination, så att det gemensamma värdet är en enda statistik snarare än en kvadratisk summa av två olika stickprov.

seg-0e18bc4add10 = Strapdown-INS & kartstödd navigering

seg-26561c9a96a7 = CAI-accelerometer från grundprinciper · härledd VRW korskontrollerad mot en oberoende integrator

seg-d18714ee32fb = Treaxligt strapdown-INS — kvaternionsattityd, WGS-84 NED-mekanisering, kompensation för coning/sculling och en fullständig deterministisk felmodell för IMU — plus en accelerometer med atominterferometer med kalla atomer från grundprinciper (Mach–Zehnder-fas, projektionsbrus, kontrastavtagande, vibrationskoppling) och ett partikelfilter för terräng- eller gravitationsreferensnavigering utan GPS.

seg-0e44bdf12d16 = Tröghets- och terrängrelativ navigering genom ett avbrott

seg-07cb40aa5cd1 = { "10" } m vid { "249" } s, { "50" } m vid { "595" } s, accelerometerbias dominerar vid båda

seg-d5df17e4425b = Positionsfel mot varaktighet utan stöd utifrån en felbudget för IMU — bias, slumpvandring och skalfaktor, var och en med sitt eget tillväxtlag och sin egen andel av överskridandet — så att kostnaden för ett navigeringsavbrott är en beräknad kurva i stället för en svept driftstakt. Gränsöverskridanden är motorutdata där det dominerande bidraget anges vid varje, över fyra IMU-klasser, och ett intervall för terrängkorrigeringar poängsätts i ett eget block så att de centrala överskridandena förblir ostödda.

seg-6631a5d69c84 = Kartmatchning med gravitation, terräng & magnetfält

seg-6af8e99df46d = Alt-PNT (GPS-nekad)

seg-72527f4459c7 = 60 min utan GPS · ~{ "145" } m (< { "500" } m)

seg-89bd5fb3e90b = En mätmodell för gravimeter med kalla atomer vars vitbrusgolv härleds ur fysiken för CAI-accelerometern, ett fullt normaliserat gravitationsanomalifält med sfäriska harmoniska av låg grad plus syntetiska mascons, och ett partikelfilter för gravitationskartmatchning — utvidgat till terrängreferensnavigering mot en SRTM-höjdmodell (TERCOM/SITAN), ett geomagnetiskt huvudfält enligt IGRF-14 till grad/ordning { "13" }, och en kombinerad navigator för gravitation + magnetfält + terräng som fusionerar alla tre skalära kanalerna. En benchmark på 60 minuter utan GPS — ett avbrott på ~{ "700" } km / en timme där tröghetslösningen driver till ~{ "70" } km — återställs till ~{ "145" } m av en hierarkisk matchare från grov till fin: målet för ESA NAVISP Quantum Wayfarer.

seg-dbd63be796ff = GNSS / INS-sensorfusion

seg-f9582184adea = Fusion

seg-f2166e96405f = tätt kopplat UKF · { "0.77" } m RMS

seg-d6ad19d1d47b = Ett EKF med felstillstånd och 15 tillstånd som glider genom GNSS-avbrott på en kalibrerad tröghetslösning; ett tätt kopplat läge med pseudoavstånd som fortsätter korrigera med färre än fyra satelliter; ett kopplat filter för klocka + position; en allmän skattare av typen unscented (sigmapunkts-) Kalman; en tätt kopplad GNSS/INS-UKF-navigator validerad till { "0.77" } m RMS genom ett avbrott på { "120" } s under en krökt LEO-passage; och en fullständig tätt kopplad GNSS/INS-UKF med 17 tillstånd vars kvant-CAI-dödräkning klarar avbrottet på den härledda hastighetsslumpvandringen hos accelerometern med kalla atomer.

seg-4af862bd1307 = Batch- & sekventiell OD

seg-ca67c864635c = Banbestämning

seg-948441304a32 = batch + sekventiell OD mot Orekit { "12.2" } BatchLSEstimator/KalmanEstimator

seg-22e738b2ab57 = Återställning av ett banatillstånd från avståndsspårning med markstationer, som sätter ihop kraftmodellen med tvåkroppsproblem + J2 och RK4-integratorn med en differentialkorrigerare av batch-typ enligt Gauss–Newton (under en meter / mm·s⁻¹ från brusfria avstånd, ~{ "2" } m vid ett brusgolv på { "5" } m) och en sekventiell variant med unscented-filter.

seg-06406b3d0b88 = Fisher-information & observerbarhet

seg-4e28248ef77b = Observerbarhet & skattningsteori

seg-a5b38d0a8d64 = egenvärden mot numpy.linalg.eigh · CRLB mot σ²(XᵀX)⁻¹ via numpy.linalg.inv · GNSS-DOP från informationsmatrisen, alla till { "1e-9" } · slutna former enligt Kay ({ "1993" }) + uppnående av CRLB med Monte Carlo

seg-3ee5597d6f8a = Ett allmänt, återanvändbart lager för Fisher-information / Cramér–Rao (src/fim.rs): informationsmatrisen M = HᵀWH, den nedre Cramér–Rao-gränsen, observerbarhetsrang och datumdefektens nollrum (Moore–Penrose-pseudoinvers), samt D/A/E/T-optimala skalärer för experimentdesign från en symmetrisk Jacobi-egenvärdeslösare. Det ligger under DOP-motorn, gränsen för passiv geolokalisering och resultatet om observerbarhet för absoluta stationer på månen — intern avståndsmätning lämnar en datumdefekt för stel kropp med sex frihetsgrader som en VLBI-koppling mellan jordbaslinjer återställer för en gles konstellation och skärper för en rik, där det absoluta datumet sluts vid tre icke-kollinjära jordstationer.

seg-ed467622dbd0 = CR3BP-propagering & LunaNet-integritet

seg-e386dced1d16 = Månen & månens närrymd

seg-f444bc39efbe = Återger den publicerade L2 { "9" }:{ "2" } NRHO (~{ "6.57" } d period · ~{ "3,250" } km perilun); STM kontrollerad mot finita differenser

seg-272afbca5e48 = En propagator för det cirkulära begränsade trekroppsproblemet jord–måne (CR3BP) i det roterande systemet — en bevarad Jacobi-konstant och alla fem Lagrange-punkterna — med en tillståndsövergångsmatris på { "6" }×{ "6" } och en differentialkorrigerare med enkel skjutning som ger genuint periodiska halobanor / nästan rätlinjiga halobanor (NRHO): den återger den publicerade södra L2 { "9" }:{ "2" } NRHO (Gateway-banan) med en period på ~{ "6.57" } dagar och en perilun på ~{ "3,250" } km. Dessutom LunaNet / LNIS-geometri för PNT i månens närrymd (reduktion MCI↔MCMF, selenografiska koordinater) med en ARAIM-passage vid månens sydpol som ärligt blottlägger integritetsgapet: en σ_URE på ~{ "30" } m driver skyddsnivån långt över en larmgräns på { "50" } m.

seg-619f89bf160c = Realisering av månens referenssystem

seg-c6b12768a219 = mot numpy/scipy Umeyama–Horn SVD

seg-29327b86ea27 = Realiserar ett månfast kroppssystem utifrån en observationskampanj: en viktad likformighetsanpassning enligt Gauss–Newton över geometrin mellan station och reflektor, som redovisar datumet, dess kovarians och den sämst bestämda axeln. Mätaren för det kopplade systemet och tidsskalan förs uttryckligen med i stället för att absorberas, så att rangbristen syns i rapporten i stället för att vara begravd i en pseudoinvers.

seg-b3ba1e7b197d = Tjänstevolym för månnavigering & ARAIM

seg-353878596468 = ANISE { "0.10.2" }-banor · RTKLIB 2.4.2-p13

seg-70b9c02c1f6a = Sveper en illustrativ konstellation av klassen Moonlight/LCNS över ett selenografiskt rutnät: synlighet, dilution of precision, täckning och ARAIM-skyddsnivåer per epok mot en konfigurerbar larmgräns. Avståndsnoggrannheten för signal i rymden är en parameter, så svepet besvarar ett avståndskrav över hela volymen i stället för godkänt/underkänt vid ett fast värde.

seg-a94db5b03c9c = Interoperabilitetsbudget för månen mellan leverantörer

seg-a2e8a8dfd666 = DE440 · INPOP21a · EPM2021 via calceph

seg-646a00230694 = Mäter hur mycket tre oberoende auktoritativa månefemerider faktiskt skiljer sig åt och omvandlar det till en designlag: felbudgeten mellan referenssystem och efemerid som en användare med blandade leverantörer ärver, och den konsistenstolerans som en leverantör måste hålla för att hålla den budgeten inom en angiven gräns.

seg-0f359c118090 = Felobserverbarhet i autonomt fritt nätverk

seg-ae99396c03bd = mot oberoende numpy/scipy-paritetsalgebra

seg-51828c93731b = Den linjära algebra som en självrefererande månkonstellation behöver för att upptäcka sina egna fel utan någon referens: den viktade paritetsprojektorn i rangbristande pseudoinversform som överlever mätaren för datum och tidsskala, detekterbarhet per nod, Baardas minsta detekterbara bias, och antal detekteringar/identifieringar för bysantinska blockgnistor över verklig DE440-geometri mellan noder.

seg-65d239fc4894 = Månens referenssystem och datum från verklig laseravståndsmätning

seg-c92dd319fa36 = { "337" } ILRS-normalpunkter · median { "5.13" } mm

seg-2f7f950518be = Ersätter den simulerade kampanjen med verkliga data: { "337" } arkiverade ILRS-normalpunkter från månlaserdistansmätning över fem retroreflektorgrupper, där varje observation viktas med sin egen registrerade precision ur filen. Reflektorkoordinaterna är en DE440-katalog i huvudaxelsystem som förvaras under eget filnamn, skild från tabellen DE430 med medeljordaxlar. Om den ena matas in i den andras rotation flyttas en reflektor hundratals meter utan att något protesterar, eftersom båda är välformade koordinater.

seg-2db69c58f694 = Differentiell PNT på månen

seg-32adcb9b1b02 = Exakt gemensam-mod-identitet · modellerad dekorrelation

seg-d4ac8cbac83e = Differentialkorrektioner mellan en referensstation på månen och en användare. Upphävandet av den gemensamma moden är en exakt identitet; den rumsliga dekorrelationsresten är en geometrisk förstaordningsmodell som växer med baslinjen, och restbudgeten för korrektionslänken redovisas bredvid den så att den begränsande termen förblir synlig i stället för att slås ihop till ett enda tal.

seg-9b83e78dcd7b = Månens tidsskalor och geodetisk VLBI

seg-bcd769beab07 = Korsningstabell per klockklass

seg-80107b7841bf = Korsningstider per klockklass för en månens tidsskala, alltså när varje oscillatorklass slutar uppfylla en angiven gräns utan uppdatering, tillsammans med en geodetisk VLBI-observabel på månen och den Fisher-information den bidrar med till datumet.

seg-99084680c321 = Verklig, hämtad konstellationsgeometri för månen

seg-a7be7d68e767 = { "5" } incheckade testunderlag, vart och ett möjligt att återskapa från sin registrerade källa

seg-d3591b4b4633 = Tjänstevolymen körs på publicerade konstellationsutformningar i stället för en illustrativ: referensuppsättningen med fem satelliter för LANS interoperabilitetsdemonstration, LNCSS-fallstudierna med { "8" }, { "12" } och { "16" } satelliter samt de fyra rymdfarkoster som faktiskt befann sig i omloppsbana kring månen den 2023-01-01 enligt JPL Horizons. Varje fil anger sitt eget referenssystem och sin egen proveniensklass, en tidshorisont bortom slutet av en tabulerad efemerid avvisas i stället för att extrapoleras, och det illustrativa keplerska resultatet ges bredvid det hämtade, tillsammans med skillnaden mellan dem, och ersätts aldrig av det.

seg-807b9fc7b517 = Spärrkontur på månen utifrån en uppmätt C/N₀-spridning

seg-a908030a9fcc = Avstånd { "49.2" } km enligt effektkvot mot { "19.4" } km enligt förlorad låsning

seg-3ee440e8b619 = Störsändare-till-signal-kvot per satellit över verkliga lutande avstånd på månen, där den önskade signalen behålls som en fördelning i stället för att reduceras till en median, så att spärrkonturen bär det osäkerhetsband som reläets geometri faktiskt ger. Två kriterier redovisas sida vid sida: effektkvotens tröskel och förlorad låsning beräknad ur spårningsslingans dynamik. Fotavtrycket för infångning i omloppsbana sveps över sändarens höjd och strålbredd, och där rutnätet aldrig når infångning vid horisonten säger rapporten det och skriver ut underskottet.

seg-229134190045 = VLBI-schema till kovarians för stationskoordinater

seg-547181855481 = Rang { "6" }, defekt { "0" }; fritt nätverks defekt { "1" } angiven som en gemensam translation

seg-6d147beefb43 = Ackumulerar de partiella derivatorna för VLBI-fördröjningen på månen till en Fisher-informationsmatris över ett schema av baslinjer gånger epoker och returnerar kovariansen för stationskoordinaterna, så att steget från fördröjningens precision till koordinaternas sigma skattas i stället för att antas. Det fria nätverket redovisas bredvid det datumfixerade, med sin rangdefekt och den icke observerbara riktningen angiven. Kovariansen för ytpunkter hålls åtskild från den för jordstationer, eftersom den partiella derivatan för en närfältsfyr är en differens mellan två stationsenhetsvektorer och inte beter sig som i fjärrfältsfallet.

seg-028833cc45bc = Radiometrisk navigering och relä-PNT

seg-6c94ae122721 = PNT i djupa rymden och på Mars

seg-ef21cd4b1962 = Simuleringsverifierad (kovarians- och slutna-slingan-kvalitetsmått, inte certifierade skyddsnivåer); dynamiken kring Mars med solen som centrum är korskontrollerad mot JPL DE440 till { "137" } m @ en båge på 1 dygn; Mars-LMO OD ≈ { "0.2" } m.

seg-469988966702 = En öppen motor för radiometrisk navigering i djupa rymden och vid Mars: iterativ ljustid och Shapiro-fördröjning, två-, en- och treväg-Doppler och avstånd (Moyer, två ben), koherent transponderomvandling, regenerativ och PN-avståndsmätning samt Δ-DOR; CCSDS-TDM som in- och utdata; ett reducerat dynamiskt Square-Root Information Filter (empiriska accelerationer, klocka ombord och Mars-luftmotstånd) som gör banbestämning i låg Mars-omloppsbana i en syntetisk sluten slinga; fusion av envägs- och tvåvägsdata; samt en MARCONI-konstellation av areostationära reläer med en komplett GSE-prestandasimulator.

seg-b4284bd2629e = Optisk och RF-överlämning med integritet över flera modaliteter

seg-ae131bc1ba67 = Optisk PNT / RF-PNT

seg-1b25468c9780 = Minsta detekterbara bias { "8.20" } m horisontellt, { "12.30" } m vertikalt, { "24.6" } ns tidssynkronisering

seg-a5387333ab2d = Felinjektion ger övervakaren över flera modaliteter en detektionskraft i stället för ett felfritt godkännande: en minsta detekterbar bias per axel vid en angiven budget för falsklarm och missad detektion. Efter en överlämning propageras kovariansens återväxt mot larmgränserna, så att rapporten anger hur länge lösningen med en enda modalitet håller sig inom dem och inte bara att överlämningen var kontinuerlig. De optiska och RF-baserade avståndslänkarna jämförs bara vid samma ackumuleringstid och bana, och rapporten vägrar bilda en kvot mot ett värde som valts i stället för uppmätts.

seg-00cb9df27979 = Autonom integritet i mottagaren (ARAIM)

seg-f86ecc2fda8e = MHSS på en verklig GPS- och Galileo-ögonblicksbild · DO-316 med två konstellationer

seg-841a6f3f0277 = RAIM med ögonblicksbild och lösningsseparation, med horisontella och vertikala skyddsnivåer (HPL/VPL), feldetektering och feluteslutning samt Stanford-integritetsdiagram, plus en uttrycklig skyddsnivå med integritetsriskbudget (MHSS) med konstellationsövergripande felläge för två eller flera konstellationer (EU ARAIM / DO-316).

seg-695aa5c57d83 = ARAIM mot publicerade referensvektorer

seg-08f9dd480ba7 = Största fel { "0.044" } m mot källornas egen tolerans på { "0.05" } m

seg-68185dd65478 = Motorns MHSS-skyddsnivåer körs mot de egna publicerade genomgångna exemplen i referensalgoritmen för luftburna system från EU–USA:s arbetsgrupp C, vart och ett överfört med sin hämtnings-URL, sitt datum, sin sida och sin fils SHA-256 och förvarat på två ställen som ett test kontrollerar stämmer överens. Acceptansvektorn är den internt konsekventa Reference Airborne Algorithm Description Document v3.1, bilaga D. Rapporten för milstolpe { "3" } innehåller två interna defekter, ett teckenfel i geometrin och en falsklarmsmultiplikator som utvärderats vid { "57" } felmoder medan texten anger en, så att dess skyddsnivåer redovisas som uppmätta avvikelser i stället för att bedömas, och defekterna demonstreras genom att dokumentets egna siffror körs.

seg-17b28b3cf1fa = SBAS/WAAS-skyddsnivåer och dubbla frekvenser

seg-99766b79a00a = Förstärkning (SBAS)

seg-4cfec990b19b = DO-229E K-faktorer · L1/L5 jonosfärsfri

seg-ef3a5513bbd8 = SBAS/WAAS-skyddsnivåer i DO-229E:s form med viktade minsta kvadrater (K-faktorer för precisionsinflygning och flygning på rutt) och den jonosfärsfria kombinationen av de två frekvenserna L1/L5 (IS-GPS-705) som ligger till grund för DO-316, med skyddsnivåernas geometri korskontrollerad mot en linjäralgebraisk referensimplementation.

seg-0a5bd5230c32 = Holdover, stabilitet och överföring av tid och frekvens

seg-69a0269c4732 = Klocka och tidssynkronisering

seg-641ae762b453 = kalibrerad mot klockors datablad · holdover korskontrollerad mot van Loans kovariansrekursion

seg-6f1c2e1f0bf4 = Holdover med Kalmanfilter i två tillstånd, stabilitet i Allan-familjen (ADEV / MDEV / TDEV / HDEV) med konfidensintervall och en fullständig anpassning av IEEE-1139:s potenslag med fem koefficienter, samt de operativa överföringsmetoderna: TWSTFT med BIPM:s slutna form för Sagnac, GNSS common-view, PPP-överföring med jonosfärsfri kombination, en optisk fritrymdslänk med turbulensscintillation och en tidsskala för klockensemble med inversvariansviktning. En kalkylator för klock-holdover utan GNSS inverterar van Loans tillväxt av driftfel till en holdover-till-tröskel, alltså hur länge en klocka går fritt innan dess tidsfel överstiger budgeten, över klassiska klockklasser och kvantklockklasser; modellerad, och öppen med att holdover till en snäv tröskel för en mycket stabil klocka bestäms av det antagna bruset vid långt tau och inte av den citerade ADEV.

seg-85b181275293 = Pseudoavstånd, jonosfär och troposfär

seg-835df2d05f2a = GNSS-mätdomänen

seg-ef01abb1cfe8 = Saastamoinen ZHD ≈ { "2.3" } m · Niell enhet i zenit · Klobuchar enligt IS-GPS-200

seg-43c0372fe6e7 = Framåtriktad syntes av pseudoavstånd och Doppler med Klobuchar-jonosfär (utsänd) och IONEX/TEC-rutnät (uppmätt), inklusive en IONEX-filtolkare, tidsinterpolation och avbildning av lutningsfaktorn i tunt skal, troposfär enligt Saastamoinen och Niell samt RAIM med ögonblicksbild.

seg-3458cb02f156 = Enpunktspositionering (PVT)

seg-640e4cd9f008 = GNSS-positionering

seg-4fa43feda96a = Validerad på verkliga IGS-data (station ABMF, 2018-05-13) till { "5.7" } m 3D-RMS / { "1.1" } m horisontellt mot den lantmätta koordinaten.

seg-b107ba0607b0 = En verklig mottagarposition löst ur verkliga RINEX-kodpseudoavstånd och utsänd efemerid med iterativ viktad minsta kvadrat-metod: Sagnac-korrektion för jordrotation, utsänd klocka med TGD, den jonosfärsfria dubbelfrekvenskombinationen L1/L2 (eller Klobuchar med en frekvens), troposfär enligt Saastamoinen och Niell, elevationsviktning, DOP och RAIM med ögonblicksbild.

seg-5819c351d123 = Jamming och spoofingdetektering i flera lager

seg-9a03f3db9ef0 = χ²₁ NP-detektor · sluten form och Monte Carlo P_fa/P_md stämmer överens

seg-788fdc9a22a1 = En jamming-modell med länkbudget (J/S → effektiv C/N₀ → förlorad låsning), en stokastisk detektor för tidsspoofing (Neyman–Pearson / χ²₁ energitest med Monte Carlo P_fa/P_md och ett säkerhetskvalitetsmått på { "1" } − P_md) och en spoofingdetektor i flera lager som slår ihop ett paritetstest för RAIM-konsistens, en RF-övervakare av AGC-effekt och en övervakare av signalkvalitet (SQM). Därtill en felbudget för kvantinertiell dödräkning som sätter ihop vitbrusdrift från kallatominterferometer med kvarstående bias (korskontrollerad mot en oberoende integrator) och skalfaktorfel till ett mått på positionsdrift under holdover, den inertiella motsvarigheten till klockans holdover.

seg-87bca15c6939 = Modulering, störskydd och kodspårning

seg-c7d3ff7ea829 = Prestanda för navigationssignaler

seg-1aec700caefe = BPSK själv-SSC = 2/(3R_c) · C/A-DLL-jitter under en meter vid { "45" } dB-Hz · GPS C/A Gold-korskorrelation -23.9 dB

seg-304803ee178d = Signalprestandalagret mellan länkbudgeten och mätdomänen: effektspektraltätheter med enhetsarea för BPSK-R(n) och sinus-BOC(m,n), spektralseparationskoefficienten som härleder det störskydds-Q som jamming-modellen använder direkt ur de faktiska signal- och störspektrumen, RMS-bandbredden (Gabor) som bestämmer avståndsmätningens informationsinnehåll (BOC > BPSK), det koherenta termiska brusets jitter i DLL-kodspårning med tidig–sen-korrelator och envelopen för flervägsfel med tidig-minus-sen och smalkorrelatorundertryckning, samt en utformningsavvägning för avståndskoder (sidlober i m-sekvensens och Golds autokorrelation och den trevärda gränsen för Golds korskorrelation, plus inversionen från kodlängd till entydigt avstånd). Detta är signalprestandaanalys, inte konstruktion av RF-nyttolast eller antennhårdvara.

seg-684494a7877c = Passiv RF-geolokalisering (TDOA/FDOA)

seg-414872cdf952 = Passiv RF-geolokalisering

seg-bed5944d15dd = brusfri TDOA framåt→invers till { "1e-6" } m · J·CRLB = I · GDOP monoton i antalet mottagare · estimatorn når sin CRLB över { "4000" } Monte Carlo-försök

seg-be8f2a419275 = Lokalisera en jamming-källa eller spoofer (eller en opportunistisk källa för omvänd PNT) utifrån hyperboloider för ankomsttidsdifferens över ett mottagarnätverk, lösta med minsta kvadrat-metod enligt Gauss–Newton; genom att lägga till ankomstfrekvensdifferens med rörliga mottagare återskapas sändarens position och hastighet gemensamt, med Cramér–Rao-gränsen för positionskovariansen utifrån nätverkets geometri. En punktkällemodell med fri sikt, utan termer för flerväg, NLOS, mottagarklockans bias eller refraktion.

seg-48e98ff7065e = Formaten RINEX, SP3 och CCSDS

seg-7c6f4dc6bcba = Interoperabilitet

seg-ae8dc649ab26 = utsänd efemerid + SP3-interpolation mot RTKLIB; OEM mot en oberoende CCSDS-tolkare

seg-75aae4d201fd = Inläsning av RINEX-3-utsänd efemerid för flera GNSS (GPS, Galileo, QZSS, BeiDou, GLONASS), en tolkare för RINEX-3-observationer (observationslayouten för RINEX { "4.00" } förväntas tolkas men ingen { "4.00" }-fil har lästs genom den; RINEX { "4" }-navigationsfiler avvisas med namn), en läsare och skrivare för SP3-c/d med precis efemerid och Lagrange-interpolation samt export av CCSDS OEM { "2.0" } och OMM (medelelement) för verktyg för flygdynamik (GMAT, Orekit, STK), och tolkning och utmatning av CCSDS-TDM ({ "503" }) spårningsdatameddelanden för radiometrisk spårning i djupa rymden.

seg-1f379e235f5f = Maskinkontrollerad verifieringsmatris

seg-a4d10bb41065 = Verifiering och försäkran

seg-72ec664ea7ae = validerade rader kräver en extern oberoende referens (invariant som upprätthålls i CI)

seg-cab165105f32 = En korsreferens från krav till modul till test till oberoende referens till status, återgiven ur själva motorn (Markdown/CSV), med enhetstestade ärlighetsinvarianter: en rad får betecknas validerad bara om den har en oberoende extern referens (NIST / AIAA / SOFA / IGS / ett publicerat värde), så att en intern självkonsistenskontroll inte kan förväxlas med en validering. De hårdvaru- och PA-förmågor som Kshana inte tillhandahåller registreras som luckor som ägs av partner. Det körbara stommen för en verifieringskorsreferens enligt ECSS-E-ST-10-02.

seg-190cdf3ca8dc = Enhet och proveniens för varje redovisad storhet

seg-3e7fb040a7c4 = Varje numeriskt fält som ett scenario ger ut har en enhet och en proveniensklass hämtad ur ett slutet ordförråd, med en definition där en sådan finns, publicerad som ett maskinläsbart schema bredvid motorn. En spärr som bara kan skärpas kör varje inbyggt slag och misslyckas på ett fält som saknar dem; de slag som ännu inte är kompletta namnges ett och ett med skälet till att vart och ett fortfarande är öppet, och listan kan bara bli kortare. Rapporter som anger sina egna konstanter, till exempel länkbudgeten för envägslänk och budgeten för optisk länk och RF-länk, låter en läsare räkna om huvudresultatet utifrån rapporten ensam.

seg-0e1a01c9158a = Budgetar för uppskjutning, återinträde, täckning och pekning

seg-f5cf9e86d3c9 = Uppdragsanalys

seg-767b2cd5f4ba = kontrollerad mot sluten form (uppskjutningsazimut · Allen-Eggers · SMAD)

seg-23bac81d700b = Förstaordningsbudgetar för uppdragsutformning, var och en ett körbart scenario: tvåkroppsgeometri för uppskjutning och uppstigning (uppskjutningsazimut, minsta inklination, jordrotationens bidrag, Δv för planbyte med dogleg, dagliga tillfällen), en ballistisk korridor för återinträde enligt Allen–Eggers (maximal retardation, hastigheter vid maximal g-kraft och maximal uppvärmning), geometri för täckning vid jordobservation (svepbredd / GSD i nadir / åtkomst utanför nadir / återbesökstid via SMAD:s rymdtriangel), en felbudget för 3-DOF-attityd och pekning (gravitationsgradientmoment + RSS-pekbudget), prediktion av stationspassager (AOS/TCA/LOS, maximal elevation, åtkomst) och en envägslänkbudget enligt länkekvationen i CCSDS { "401" } / DSN 810-005 (FSPL, C/N₀, Eb/N₀, marginal, slutning). Det analytiska lagret före hårdvaran under STK/GMAT/Basilisk: modellerade förstaordningsbudgetar, ingen ersättning för 6-DoF eller radiometri.

seg-43f53b910042 = Delning av apertur mellan navigering och kommunikation

seg-989637b0c6fc = Avbrott och konkurrens per session, inte ett enda driftcykelmått

seg-5c63a4559aff = In kommer en kontaktplan och ett antal aperturer; ut kommer navigeringens driftcykel, kommunikationens driftcykel, avbrott och konkurrens per session. Arbitreringspolicyn namnges i rapporten i stället för att antydas, och en session som inte kan betjänas fullt ut redovisar hur stor andel av den som gick förlorad i stället för att försvinna i ett medelvärde.

seg-c8eb43aeb31a = Rymdväder och termosfärens täthet

seg-37b8c9397544 = Rymdmiljö

seg-25e24a6c0ba3 = Jacchia-71 validerad mot publicerade värden för solminimum, solmedel och solmaximum

seg-1eff250f41c3 = En miljömodell för rymdväder: sol- (F10.7 / F10.7a centrerad på 81 dygn) och geomagnetiska (Kp, med den definitionsmässiga tabellen Kp↔ap) aktivitetsindex, den exosfäriska temperatur enligt Jacchia-1971 som de driver, samt den aktivitetskorrigerade jämfört med den statiska neutrala termosfärstätheten på höjd, alltså den solcykelberoende täthet som en statisk atmosfär utelämnar. En kalibrerad förstaordningskoppling med skalhöjd, inte en datavaliderad NRLMSISE-atmosfär.

seg-49bac998eb07 = Utvärdering av detektering av RF-försämring och PNT-avvägning

seg-dca720256d85 = Utvärdering och avvägning med maskininlärning

seg-5f0a39efe160 = AUC-ramverket verifierat mot binormal sluten form Φ(d′/√{ "2" }) (Gneiting & Vogel { "2018" }); utvärderingsmått validerade bit för bit mot scikit-learn { "1.9.0" }: syntetiskt korpus, inte rå IQ/TEXBAT

seg-0dc3a7135442 = En testbädd för utvärdering av detektering av RF-försämring: ett märkt, parameterförankrat syntetiskt korpus (nominell / jamming / spoof-tid / spoof-position / flerväg), ett detektoroberoende ROC/AUC-ramverk som poängsätter vilken detektor som helst med Pd per klass vid ett mål-Pfa, samt optimismgapet mellan data inom och utanför fördelningen. En djupare studie av optimismgapet utvidgar detta till en panel med 13 detektorer (energi / AGC / SQM / paritet plus seedade detektorer med logistisk regression och MLP med ett dolt lager), skalningslagar inom och utanför fördelningen med en permutationsnollhypotes samt en leave-one-out-prediktor för försämring utanför fördelningen; en front end för programvarudefinierad mottagare (rå IQ/IF till korrelatorns tidiga/prompta/sena tappar till SQM) och adaptrar för inläsning av verkliga data (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) låter samma detektorer köras över inspelningar som tillhandahålls lokalt. Därtill en avvägning mellan kvant och klassisk PNT som kvantifierar en kandidatklockas fördel för tidssynkronisering och inertiell holdover utifrån en uppmätt ADEV-kurva mot en klassisk baslinje, med en envelop för resiliens mot tid utan GNSS. Modellerade driftegenskaper, aldrig fält- eller IQ-data, ingen dom om bra eller dåligt.

seg-8766e058334d = Skärningskarta för resiliens mellan kvant och klassisk teknik

seg-8f851e9cf8c2 = återskapar studierna av inertiella och klockbaserade skärningspunkter bakom diagrammen under Resultat; avvägningskärnor validerade mot scipy { "1.17.1" }

seg-a057ad4c89ce = En reproducerbar karta över var en kvantsensor går förbi sin klassiska motsvarighet under parameterosäkerhet: kallatom jämfört med dödräkning av navigeringsklass och optisk jämfört med chipskaleklockas holdover, över avbrottstid och plattformsvibration, där varje kurva bär en märkning för teknisk mognad. Reproducerbar via cargo run --bin crossover_study. Modellerade prestandabudgetar: indata är publicerade eller inramade koefficienter, inte flygdata.

seg-6347618838dd = Villkorlig skyddsnivå för tid

seg-a846e806e577 = Integritet för tid

seg-762bc9f28716 = sammansättning korskontrollerad mot rekursionen för kovariansen i flerstegs clock_state; kalibrerad på JammerTest { "2024" } (Zenodo { "15911589" })

seg-3622798325cd = En holdover-begränsad gräns för det oupptäckta tidsfelet under GNSS-spoofing: givet en oberoende korskontroll begränsas det levererade tidsfelet av ett k-sigma-golv för övervakaren, van Loans drivvarians över detektionsfördröjningen och en CUSUM-tid till larm. Kalibrerad på en verklig inspelad spoofing (JammerTest { "2024" }) och reproducerbar via cargo run --example tpl_jammertest. Modellerad sammansättning, villkorad av detektering: det finns ingen ändlig ovillkorlig gräns, eftersom en tillräckligt långsam ramp undgår en enda klockstödd övervakare.

seg-734a93b6a809 = PNT-resiliensbetyg och beslutsinstabilitet

seg-c25b4e240fb5 = Resiliensbedömning

seg-f42ae8719e02 = { "35" } handhärledda tester mot oberoende referens; byte-deterministiskt studieartefakt (fast frö); anpassad till DHS RPCF v2.0

seg-8e69193ca540 = En ramverksanpassad poängmotor (DHS RPCF-kategorier) som avbildar en arkitekturs simulerade beteende på delpoäng per dimension och sedan frågar om någon enskild sammansatt poäng eller mognadsnivå är en stabil grund för ett beslut, via en Dirichlet-viktningssimplex, Kendall-tau-rangordningsinstabilitet, en andel byten av vinnaren på plats top-1 och kollaps av gemensam-mod-diversitet (Hill-N2), med en integritetshashad försäkringsrapport. Reproducerbar via cargo run --example resilience_report. Modellerade syntetiska arkitekturer anpassade till RPCF v2.0; en självbedömning, inte en certifiering.

seg-62ef40799af4 = Missad detektering → integritetsregioner

seg-52e55797d77c = Påverkan på integritet

seg-99025f66f277 = Stanford-ESA-integritetsregioner (Tossaint et al., NAVIGATION { "2007" })

seg-13f23ffe5840 = En bro från missad detektering till integritet: en oupptäckt bias som lämnas kvar av en missad detektering av spoofing, jamming eller RAIM ökar det effektiva positionsfelet, som, hållet mot kontextspecifika larmgränser, klassificeras i Stanford-ESA-integritetsregionerna (tillgänglig / otillgänglig / vilseledande / farlig). Sätter ihop den externt förankrade Stanford-klassificeringen för RAIM; tillför ingen ny integritetsmatematik.

seg-3a7572774192 = Avkastning per täckning

seg-797d137dc022 = Beslutsstöd

seg-d77993b6ef59 = En avkastningslins per täckning: kostnad per levererad täckningsenhet för en avvägning mellan konstellationer eller arkitekturer. Täckningskomponenten bygger på den validerade täckningsgeometrin och aritmetiken är enhetstestad, men kostnaden är en indata från användaren, så kvoten är ett planeringsstöd och inte en externt validerad storhet (därför, ärligt talat, ingen bevismärkning).

seg-690b4cb0df55 = Kshana Interchange Format (KIF)

seg-558523b5e0ac = Utbyte av artefakter

seg-b882cccf5cee = versionshanterat kuvert · tur och retur samt framåtkompatibel läsning verifierade

seg-ff5a4ead87fe = Ett versionshanterat, självbeskrivande kuvert som omsluter ett scenarioresultat med dess slag, schemaversion och märkningar som modellerad eller validerad, så att en lagrad artefakt förblir självdokumenterande och äldre kuvert förblir framåtkompatibelt läsbara.

seg-5052e1720602 = Förtroendepoäng för mottagare på ett fartyg

seg-70144aeea2d1 = övervakningsaritmetik kontrollerad mot pynmea2 och GeographicLib

seg-9d9329128f06 = Poängsätter om ett fartygs positionsbestämning går att lita på utifrån den NMEA { "0183" } som dess mottagare och instrument redan ger ut: en poäng från 0 till 100, tre band och skälen bakom dem, per epok, i batch, live eller som en grind. Övervakare jämför positionsbestämningen med fartygets egen rörelse, kompasskurs, logg och satellitsignalnivåer. Rådgivande programvara, inte typgodkänd navigationsutrustning: operatören förblir ansvarig. Övervakarnas aritmetik är kontrollerad mot oberoende bibliotek; poängens regel och trösklar är projektets egna och förblir modellerade.

seg-a47934361f43 = NMEA-strömmar för besättningsutbildning

seg-c6492d4a7dae = { "225,227" } meningar tolkade och avkodade av pynmea2

seg-9ca765cc09fc = Skriver syntetisk NMEA { "0183" } för bryggan för en skriptad resa med instruktörsskriptade händelser med jamming, positionsavdrift, tidsspoofing och replay, med en instruktörslogg, så att en besättning kan se hur en försämrad positionsbestämning ser ut på sina egna instrument. Endast text, aldrig för ett fartygs levande navigationssystem; ingenting sänds och ingen radiosignal skapas. Meningarna och deras avkodade värden är kontrollerade; modellerna för mottagare, himmel och händelser är modellerade.

seg-39f61b88209e = kodbetydelser och geometri kontrollerade mot pyModeS, pyais, shapely och GeographicLib

seg-4c1667d3d453 = Bygger en GeoJSON-karta per dygn över var flygplan (ADS-B) och fartyg (AIS) rapporterade försämrade navigeringsdata, utifrån öppet licensierade indata, samt den andel av en rutt som går genom försämrade celler. En försämrad cell är ett påstående om rapporterade noggrannhetsfält eller orimliga positioner, inte ett konstaterande av störning, och en cell som ingen observerat är inget belägg för en fri rutt. Tidigare rapporter, ingen prognos.

seg-e0962980e96f = Förtroendetelemetri för säkerhetsdrift

seg-9b538e790bd7 = Prometheus, OTLP och CEF återlästa av oberoende tolkare

seg-f33e062790d9 = Exporterar förtroendeströmmen som Prometheus-mått, OpenTelemetry (OTLP/HTTP) och CEF- eller LEEF-syslog-händelser över stdout, HTTP, UDP eller TCP, så att ett säkerhetsdriftcenter ser ett navigeringsfel bredvid sina andra larm. En död insamlare varken stoppar bedömningen eller passerar obemärkt. Prometheus, OTLP och CEF läses tillbaka av oberoende tolkare; LEEF kontrolleras bara mot sin egen specifikation.

seg-c74f3b9569b1 = Signerade bevispaket

seg-28016686504c = RFC { "8032" }-vektorer byte för byte; en clean-room-verifierare är överens om { "71" } paket

seg-123fa1de2e23 = Samlar fönstret kring en förtroendehändelse i ett hashkedjat, Ed25519-signerat paket som vem som helst kan verifiera offline: en ändrad, borttagen, utbytt eller tillagd fil, ett omsignerat paket eller en felaktig fastlåst nyckel namnges. En valfri tidsstämpelstoken enligt RFC { "3161" } binds till det. En teknisk redogörelse, inte ett juridiskt utlåtande, ett faktakonstaterande eller ett intygande.

seg-ee2e250497f9 = Export för testbänk

seg-ea618add831e = omvandlingar och kodningar kontrollerade mot PROJ, GeographicLib, pynmea2 och SciPy

seg-be8af88f4f99 = Skriver ett scenarios fordonsrörelse och händelser som en CSV-bana och NMEA { "0183" } för en GNSS-simulator i laboratorium: jordfasta, geodetiska och lokala hastighetskolumner, attityd och UTC. Endast rörelse och händelser: ingen signal skrivs och ingen prestanda hos simulator eller mottagare görs gällande.

seg-1ff1d8ebf1e7 = Compliance-mappning mot offentliga ramverk

seg-83af3fa21509 = Mappar Kshanas utdata mot klausulerna i offentliga ramverk (IMO:s vägledning för fartyg, EU:s NIS2 artikel { "21" }, EN { "16803" }, USA:s DHS-ramverk för resilient PNT och EASA:s vägledning för luftfart) enbart via klausulnummer, ifyllda utifrån de körningar du ger den, och anger vilka rader en uppsättning körningar ger belägg för, med varje rads lucka. Det är inte ett konstaterande att något ramverk är uppfyllt och inte ett betyg eller ett godkännande av någon.

seg-1b784a8701ac = GNSS-autentisering

seg-2b5a6095013a = alla { "18" } officiella uppsättningar av testvektorer: { "186,382" } taggar autentiserade, { "0" } misslyckades

seg-0419e9af208d = En öppen verifierare i ren Rust på mottagarsidan för Galileo Open Service Navigation Message Authentication: den kontrollerar vilka satelliters navigationsdata en mottagare kan autentisera ur I/NAV-sidor eller en u-blox UBX-ström, genom kontrollerna av publik nyckel, nyckelkedja och taggar i specifikationen för signal i rymden, och redovisar autentisering per satellit och per tid. Den autentiserar data; den gör inte gällande någon prestanda mot spoofing.

seg-d8bb6226f2e3 = Synlighet med horisontmask, DOP och felellips

seg-6c6e7248496f = Himmelsgeometri

seg-94ff262653a6 = { "1173" } siktvinklar och { "142" } synliga uppsättningar stämmer med Orekit { "12.2" } och gnss_lib_py { "1.0.4" } till { "1e-12" }; ellipsen stämmer med numpy i { "270" } fall

seg-309521d4c9e1 = Vilka satelliter en plats kan se när byggnader, kajer, kranar eller terräng skymmer en del av himlen, och vad det gör med den geometriska försämringen av precisionen (DOP) och den horisontella felellipsen. En azimutberoende horisontlinje ersätter den enda elevationsgränsen; den synliga uppsättningen, dess DOP och ellipsen kommer fram per epok och per konstellation. En horisontlinje tar bort satelliter med fri sikt och inget mer: den modellerar inga reflektioner, ingen diffraktion och ingen signalstyrka.

seg-448e81d36ca4 = Förinställningar för horisontlinje och himmelsgeometrins funktioner

seg-6483f9d89f15 = handberäknade värden och den geometri som molnet samplar; ingen extern oberoende referens

seg-ebc2904904d3 = Reduktionerna av gatukanjon, sektor och terräng till en horisonttabell, fyra representativa förinställningar (stadsgata, hamninlopp, fjord, containerterminal) och funktionerna som sätter ihop dem till ett skyplot och ett Monte Carlo-moln, från CLI, MCP, Python och webbläsaren. Förinställningarna är representativa geometrier med valda, angivna mått, inte uppmätningar, och reduktionerna kontrolleras bara mot handberäknade värden.

seg-c2a5a6a7bcb0 = Geometrimedveten förtroendeklassificering

seg-2f51e4da63b4 = klassificeringsregeln och trösklarna är projektets egna, kontrollerade mot sig själva

seg-b664ce284745 = Ställer satellitgeometrin bredvid mottagarens förtroendepoäng och namnger en klass för varje avdrag: signalförlust, dålig geometri eller en inkonsistens mellan mottagarens angivna DOP och den som härleds från satelliterna i sikte. Geometri bedöms bara när den är känd, och etiketten är huvudsaken: bara en dålig geometri kostar poäng. Rådgivande programvara, inte typgodkänd navigationsutrustning.

seg-5026aab26cb8 = Studie av referensstation på månen

seg-d6935d32272b = sätter ihop testade funktioner för differential, klocka och referenssystem på månen; kontrollerad mot sig själv och en numpy-referens, inga externa flygdata

seg-4f9696706384 = En reproducerbar studie av vad en referensstation vid månens sydpol skulle kunna göra under offentliga antaganden: en täcknings- och noggrannhetskarta över polarområdet (percentiler för korrigerat och okorrigerat positionsfel, tillgänglighet med ett skäl för varje otillgänglig epok, skyddsnivåer och budgeten för korrektionslänken), ett tidslaboratorium som håller en månens tidsreferens på en atomklocka, samt geodesin för en tillagd laserretroreflektor och VLBI-fyr mot datumet med fem grupper. Varje indata är märkt med sin offentliga källa eller som illustrativ. Det är inte ett påstående om prestandan hos något verkligt system, och Kshana är inte knutet till någon myndighet.

seg-cad8be3b66a3 = Optiska tidslänkar genom moln och turbulens

seg-e86745da72f0 = { "7" } av { "7" } numeriska trösklar fastställda i förväg uppfyllda mot ett oberoende mpmath-program; ingen uppmätt tillgänglighetsregistrering har jämförts

seg-dd98aa94f8c8 = Hur ofta en optisk länk för tidsöverföring är uppe när atmosfären ligger i vägen. För varje markplats ger motorn dämpningen vid klar luft, turbulenstillståndet enligt Hufnagel–Valley med gamma-gamma-scintillationsfadingar och aperturmedelvärdesbildning, tillgängligheten mot länkmarginalen utifrån ett angivet molnklimat, taket som ingen marginal kan lyfta, fördelningen av avbrottstider och det tidsfel som ett avbrott kostar en klocka i holdover. Därefter visar den vad extra platser, en större apertur, en annan våglängd eller adaptiv optik ger. De medföljande molnklimaten är illustrativa, inte uppmätta; utdata är rådgivande.

seg-861d57389dd7 = GNSS bortom konstellationen: rymdtjänstvolymen och bortom den

seg-8705c276af61 = tabeller i ICG:s SSV-häfte, förhandsregistrerade; de flesta trösklar NOT MET (xval/gnss-ssv/RESULTS.md)

seg-2dc82174942a = För en rymdfarkost på en sfär (det globala skalet i ICG:s häfte om rymdtjänstvolymen) eller på en keplersk bana från LEO till månövergång räknas per konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) och för alla tillsammans de signaler som ligger över en C/N0-tröskel: tillgänglighet för en och för fyra signaler, längsta avbrott, mottagen C/N0, geometrisk försämring av precisionen samt länkar via huvudlob mot sidolob. Sändningsmönstren är häftets, en parametrisk ersättare eller ett som du själv tillhandahåller; en modell för jonosfär, plasmasfär och atmosfär med stråle vid horisonten och en design av mottagare för svaga signaler är valfria; ett GNSS-filter ombord för höga banor och månövergångsbanor samt relativ navigering i formation ingår. MODELLED: jämfört med häftets tabeller under en förhandsregistrering som fastställts före körningen stämmer konstanterna för minsta utstrålade effekt och månens tröskel överens, de övriga trösklarna är NOT MET enligt den förhandsregistrerade läsningen (nästan alla genom häftets inkonsekventa stråleutbredningsvinkel för GLONASS), och den parametriska sidolobsersättaren återger inte de uppmätta mönstren för GPS-panelen.

seg-61817375c8ea = Månens omloppsbana och yta som infrastruktur för navigering och geodesi

seg-d2439abaeabb = numpy/scipy som oberoende referenser för numeriken; tre förhandsregistrerade trösklar NOT MET (xval/lunar-infra/RESULTS.md)

seg-db45ac2940af = Fem studier i en begränsad trekroppsmodell: en banbestämning ombord med jord-GNSS i en nära rätlinjig halobana mot en oberoende bestämning med markbaserat avstånd och avståndshastighet; gemensam fixering av heltalsosäkerhet i bärvågsfas för ytstation och omloppsfarkost (LAMBDA); Fisher-informationen för ett lunart datum med sju parametrar med och utan avstånd mellan omloppsfarkost och yta; GNSS-, VLBI- och laseravståndsoffseter mot det lokala bandet; samt känslighet för parametrarna för månens tidvatten och libration. MODELLED med illustrativa indata: numeriken kontrolleras mot oberoende numpy- och scipy-program, inte fysiken. Under de förhandsregistrerade trösklarna är tre NOT MET: ett injicerat kraftfel upptäcks inte med angiven frekvens (C3), den bootstrappade andelen lyckade skiljer sig från numpy-referensen med { "1.7e-6" } mot en tröskel på { "1e-9" } (Q3), och tillägg av en avståndsfamilj sänker inte alltid pseudoinversens spår (G3, spårhalvan).

seg-aab745a65e76 = Modul

seg-d6476863f862 = Förmåga

seg-ad856ad710eb = Status

seg-6962adaa6a1f = Genereras vid bygget från förvarets scenariofiler och verifieringsmatris.

seg-30200bb5be58 = Kör orbit-sgp4-gps.toml i Kshana Studio

seg-ecacc78711a1 = Kör realtime-frame-eop.toml i Kshana Studio

seg-fe9baedab7f0 = Kör imu-deadreckoning.toml i Kshana Studio

seg-58a3232bc4cf = Kör ins-trn-coast.toml i Kshana Studio

seg-27ffc4dfa394 = Kör gps-denied-gravity-nav.toml i Kshana Studio

seg-eb0c08082d24 = Kör gnss-ins.toml i Kshana Studio

seg-8d0f45d119a9 = Kör lunanet-araim.toml i Kshana Studio

seg-09641b89ad3a = Kör lunar-frame-realisation.toml i Kshana Studio

seg-4eea1b7d77cd = Kör moonlight-service-volume.toml i Kshana Studio

seg-3cd4cd7d7c16 = Kör lunar-interop-export.toml i Kshana Studio

seg-d767de2fa87a = Kör lunar-llr-datum.toml i Kshana Studio

seg-29266e8878ac = Kör lunar-differential-pnt.toml i Kshana Studio

seg-0955d6ded82d = Kör lunar-time-budget.toml i Kshana Studio

seg-ab41004755ea = Kör lunar-jamming.toml i Kshana Studio

seg-edbe5cf449a0 = Kör lunar-vlbi-fim.toml i Kshana Studio

seg-d706c2d59dd1 = Kör mars-pnt-lmo.toml i Kshana Studio

seg-71586c459df8 = Kör hybrid-optical-rf.toml i Kshana Studio

seg-87634a6d41b5 = Kör integrity-raim.toml i Kshana Studio

seg-a281aa02ddc7 = Kör araim-reference-check.toml i Kshana Studio

seg-9184b54b1173 = Kör clock-holdover.toml i Kshana Studio

seg-2f270136b41d = Kör gnss-sim-raim.toml i Kshana Studio

seg-f2f3ede70967 = Kör pvt-abmf.toml i Kshana Studio

seg-eac325fbeed1 = Kör spoof-attack.toml i Kshana Studio

seg-07d55d3e7bdc = Kör oem-interop.toml i Kshana Studio

seg-5b70a59accce = Kör aperture-duty-cycle.toml i Kshana Studio

seg-d3df277fd118 = Kör space-weather.toml i Kshana Studio

seg-7dc863bf8f7b = Kör impairment-eval.toml i Kshana Studio

seg-1c3083a77264 = Kör conflict-resilience.toml i Kshana Studio

seg-b3f2b2d88d8c = Kör gnss-ssv-shell.toml i Kshana Studio

seg-e42b759ccbaf = Kör lunar-infrastructure-od-consistency.toml i Kshana Studio

seg-60a43431ebe0 = Krav

seg-cbf0f9bcd2d8 = Oberoende referens

seg-1603e76bcf66 = Identifiering av potenslagsbrus med autokorrelation vid lagg 1

seg-d95fe5878ee3 = allan::lag1_noise_id: brusidentifieraren med autokorrelation vid lagg 1 av Riley och Greenhall ({ "2004" }) (decimerad fas med sin kvadratiska term borttagen, eller gruppmedelvärdesbildad frekvens med sin linje borttagen; upprepade första differenser tills delta = r1/({ "1" }+r1) < { "0.25" } eller d = dmax), som returnerar den heltaliga och den oavrundade potenslagsexponenten alpha (+{ "2" } vitt PM till -2 slumpvandrande FM) vid valfri medelvärdesfaktor; den sätter frihetsgraderna för brustypen i enhetskorten i biblioteket med uppmätta klockor

seg-6e0cb6acc073 = VALIDATED

seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin och bidragsgivare, LGPL-3.0-or-later, körd som ett separat program av fixturgeneratorn): en oberoende implementering av den publicerade Riley-Greenhall-algoritmen, en entydigt definierad storhet under de angivna konventionerna. Validerar identifieraren, inte brusinnehållet i någon verklig klocka

seg-aedf395f3597 = Autentisering av navigeringsdata i mottagaren för Galileo OSNMA

seg-1e6e62438dad = osnma + <c1/>: en öppen verifierare i ren Rust på mottagarsidan för Galileo OSNMA (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) från I/NAV-sidor eller en ström av u-blox UBX-RXM-SFRBX: publika nycklar i Merkle-träd (DSM-PKR), ECDSA P-256/P-521-signaturen för DSM-KROOT, verifiering av TESLA-nyckelkedjan (SHA-256 eller SHA3-256), verifiering av MACSEQ och taggar (HMAC-SHA-256 eller CMAC-AES) för ADKD { "0" }, { "4" } och { "12" } med korsautentisering, kedjeslut/återkallelse/förnyelse, förnyelse och återkallelse av publik nyckel samt larmmeddelandet; status per satellit Authenticated/Failed/Unavailable med en orsak för varje fel eller fördröjning. Rådgivande: inte typgodkänd navigationsutrustning och inte en tjänst för navigeringsintegritet; inget anspråk görs på någon prestanda mot spoofing

seg-a6bd60ed728f = De officiella testvektorerna för Galileo OSNMA som European GNSS Service Centre publicerat som bilaga till Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } av { "18" } uppsättningar, { "186,382" } taggar autentiserade, { "0" } misslyckade, körda offline 2026-10-10 (evidensposten finns i kshana-pro docs/evidence). Omfattning: vektorerna validerar den kryptografiska verifieringen (Merkle, KROOT/ECDSA, TESLA-kedja, MACK-taggar, ADKD 0/4/12) och dess utfall på de publicerade scenarierna; de använder bara HMAC-SHA-256, en SHA-256-kedja, nycklar på 128 bitar, taggar på 40 bitar och uppslagsposterna { "33" } och { "34" }, så CMAC-AES, SHA3-256-kedjor och andra parametrar täcks endast av publicerade known-answer-tester för primitiver och av syntetiska tester. Härdningen av betrodd tid, databindning, utgång och bekräftelse av huvud testas av de syntetiska attacktesterna, inte av ett externt orakel. Inte kontrollerat: spärrlistor för certifikat, live-signaler eller en live-mottagare (UBX-ordlayouten kontrolleras bara på syntetiska ramar), Merkle-träd med SHA3-256, färskhet utan en oberoende tid. Inte en EU-tjänst

seg-27a61718eb95 = Karakterisering av frekvensstabilitet

seg-56174d771190 = Allan-/modifierad/Hadamard-deviation + identifiering av potenslagsbrus med χ²-konfidensintervall

seg-ed01b2ab3481 = NIST SP { "1065" } (Riley) / Stable32 referensdeviationer på NBS14

seg-25b78672c194 = Frekvensstabilitet på en verklig uppmätt klocka

seg-fd378f5fe04a = Överlappande Allan- och överlappande Hadamard-deviation på en verklig cesiumstandard

seg-64fd49d58394 = Stable32 överlappande ADEV/HDEV på den uppmätta fasserien för cesiumklockan 5071A (allantools)

seg-f305dbc83f2b = Paritet för Allan-skattare på den kanoniska referensserien i Stable32

seg-5bfca5dcfb7c = Överlappande Allan + modifierad Allan + tidsdeviation över hela AF-stegen

seg-327ab6dcf16a = Stable32 referensdeviationer för PHASE.DAT (Riley; standardserien för regression)

seg-96c4275f5a89 = Frekvensstabilitet med utökat område (Theo1 / TOTDEV)

seg-7f59c3631ca4 = Theo1 och total deviation (TOTVAR) — skattare av stabilitet vid lång tau med utökat område som når ~{ "75" } % av registret där Allan-deviationen tar slut nära ~{ "50" } %; den biasfria hybriden ThêoH (allan::theoh_curve) som bygger på dem förblir MODELLED

seg-a38edc2526f5 = allantools { "2024.06" } — ett oberoende frekvensstabilitetsbibliotek från tredje part — theo1 (NIST SP { "1065" } ekv { "30" }) och totdev (NIST SP { "1065" } ekv { "25" }) på den hermetiska LCG-datamängden i NIST SP { "1065" } §{ "12.4" }; kan regenereras offline via tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

seg-cc40472fbcbf = Maximum Time Interval Error (MTIE) — wander-mått för telekom

seg-5c54ba2748f7 = MTIE(τ): den största svängningen topp till topp i tidsfel över ett glidande fönster av τ = m·tau0, den wander-statistik enligt ITU-T G.810/G.823/G.8261 som gränserna för synkroniseringsnät (MTIE-masker) är skrivna mot — ett extremvärde (max/min) som skiljer sig från RMS-familjen Allan

seg-300fd3f945a0 = allantools { "2024.06" } — ett oberoende frekvensstabilitetsbibliotek från tredje part — mtie() på den hermetiska LCG-fasserien i NIST SP { "1065" } §{ "12.4" }; MTIE är en ren max/min-statistik, så skattarens utdata är bitexakt mot allantools på den identiskt byggda fasarrayen (de incheckade referenskonstanterna med 15 signifikanta siffror ligger inom { "1" } ULP). Kan regenereras offline via tests/fixtures/mtie/generate_mtie_reference.py

seg-67d73f3ca14d = Modifierad Allan / tidsdeviation (MDEV / TDEV)

seg-9ac9d2b0bdf8 = MDEV(τ): den överlappande modifierade Allan-deviationen (skattare med glidande fönster och andra differens som skiljer vitt från flicker-fasbrus), och TDEV(τ) = τ/√{ "3" }·MDEV(τ), tidsdomänens wander-statistik enligt ITU-T G.811/G.812/G.823 som synkroniseringsmaskerna är skrivna mot

seg-24a441f32375 = allantools { "2024.06" } — ett oberoende frekvensstabilitetsbibliotek från tredje part — mdev() och tdev() på den hermetiska LCG-fasserien i NIST SP { "1065" } §{ "12.4" } (samma serie som raderna Theo1/TOTDEV/MTIE), som beräknar samma entydigt definierade skattare; matchade till <{ "1e-9" } relativt. Kan regenereras offline via tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (Den datagrindade phasedat_reference.rs kontrollerar dem också mot Stable32 till { "1e-3" }; det här är den täta, alltid aktiva hermetiska korskontrollen)

seg-e4b6d707cbf5 = Frekvensstabilitet hos en optisk klocka på en verklig uppmätt kurva

seg-e9077554a08f = NNLS-återskapande av potenslag (vitt FM + golv av rött brus) ur en publicerad uppmätt Allan-deviation för den optiska klockövergången hos ⁸⁸Sr — återger σ_y(τ) och den centrala skalningen 4.7e-16/√τ vid kort τ med ett genuint uppmätt golv vid lång τ, i stället för det syntetiserade golv av optisk klass som holdover.rs annars antar

seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), Fig. { "4" } uppmätt ADEV; kurvan hämtad ordagrant från Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Avgränsad till att återge den publicerade uppmätta stabilitetskurvan — enhetstalen för holdover till tröskel per klockklass förblir MODELLED

seg-cc95c8615d39 = Integritet (RAIM/ARAIM/SBAS)

seg-d4ad9cfa4f9b = ARAIM multipelhypotes-lösningsseparation enligt ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels och add_v42_protection_levels_ecef: bestämning av delmängder med reglerna P_THRES och FC_THRES, VPL, HPL, den effektiva övervakartröskeln EMT och sigma_acc); RAIM-feldetektering med χ² på ögonblicksbild med uteslutning av en enskild satellit (raim::snapshot_raim, raim::snapshot_raim_fde) och lutningsbaserad HPL/VPL på den geodetiska lokala nivån; samt kombinationen av skyddsnivåer för SBAS enligt DO-229E (sbas::sbas_protection_level) på L1-tjänsten. INTE täckt, uttryckt tydligt: bekvämlighetsfunktionerna med enhetlig sigma raim::araim_raim och raim::araim_dual_raim är INTE konforma med ADD (på matchade indata missar de Stanford MAAST med { "0.75" } m VPL / { "4.04" } m HPL respektive { "0.39" } m VPL / { "1.93" } m HPL, ett fynd); jämförelsen för SBAS L5 med dubbla frekvenser och flera konstellationer (DFMC) är ett fynd ({ "308" } användarepokspar utan GEO i sikte skyddas av Kshana men inte av MAAST, vars grind för GEO-mottagning Kshana inte modellerar); raim::solution_separation_raim saknar extern jämförelse

seg-1c37702cc5f2 = Banpropagering och banbestämning

seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + störningar, batch-/sekventiell OD

seg-c84585f43297 = Verifieringsvektorer för SGP4 enligt AIAA 2006-6753

seg-50c545872e4f = Numerisk Cowell-propagator och kraftmodell

seg-74f8c585bcfd = Numerisk Cowell-propagator med hierarkisk kraftmodell (två kroppar, zonala J2–J6, tredjekroppseffekt från Sol/Måne, SRP med kanonkula, exponentiellt luftmotstånd); RK4 med stegdubbling / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 — ett oberoende bibliotek, en annan integrator och en annan rekursion för sfäriska harmoniska. De konservativa nivåerna (två kroppar → zonala J2–J6 → tredjekropp Sol/Måne → SRP med kanonkula) stämmer till under en meter över en båge på { "24" } h, vilket validerar integratorn + kraftalgebran; nivån för luftmotstånd och den absoluta noggrannheten i indata för Sol-/Månefemerid och densitet förblir MODELLED (endast karakterisering)

seg-d38c4be472ac = SRP-skugga för avplattad jord (valfri)

seg-ab8247c6b4d2 = Belyst andel för SRP med ellipsoiden WGS-84 som skuggande kropp (skenbar jordradie från ellipsoidens limb mot Solen, linsformel med dubbla skivor; srp_shadow::oblate_conical_shadow), valfri i Cowell-kraftmodellen via propagator::ForceModel::srp_shadow (standard: den sfäriska koniska skuggan, oförändrad)

seg-01066d639b39 = SRP med box-wing och ECOM2, med partialer (valfri)

seg-2a5fc9708bd0 = SRP som inte är kanonkula: en plattmodell box-wing (Vallado ekv. 8-44; enkelsidiga kroppspaneler, solpekande vingar) med tabellerna för Galileo FOC, IOV och IOV vid livslängdens slut ur GSC:s satellitmetadata, i nominell GNSS-girstyrning, med analytiska partialer för strålningsfaktorn och varje panels spekulära och diffusa koefficienter; och den empiriska modellen ECOM2 (D2/B1) med sina partialer. Box-wing är valfri i Cowell-propagatorn (propagator::ForceModel::box_wing_srp, som sätter dess fält srp_boxwing) och i modellen för precis banbestämning (precise_od::PreciseForceModel::box_wing_srp), och ersätter termen med kanonkula med cr som strålningsfaktor; båda är som standard None, vilket lämnar varje befintlig väg byte-identisk. ECOM2 är inte kopplad till någon kraftmodell

seg-bde1b3a94a47 = Solens limbmörkade SRP-skugga (valfri)

seg-eaaec545dd68 = Belyst andel för SRP som den icke-skymda delen av det limbmörkade solflödet (lag enligt Eddington-approximationen I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre-kvadratur) över en sfärisk jord eller WGS-84 (srp_shadow::limb_darkened_shadow, ShadowModel-varianten OblateEarthLimbDarkened)

seg-76cb4b668ad5 = Ingen extern: Orekit { "12.2" } har ingen limbmörkad belysningskvot. Endast kontrollerad mot slutna uttryck för samma lag

seg-673b17e9dcf7 = Termosfärens densitet enligt NRLMSISE-00

seg-09e997231de8 = En portning av den empiriska termosfären NRLMSISE-00 (gtd7 och gtd7d: artdensiteter, total massdensitet med anomalt syre, temperaturer; de { "24" } omkopplarna; lägen med dagligt Ap och 3-timmars ap-array) från C-versionen i public domain av NRL:s Fortran

seg-12977f65b2ea = Nivå för luftmotståndets densitet med NRLMSISE-00 (valfri)

seg-17aec847b675 = forces::DensityModel (Exponential som standard, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) och propagator::ForceModel::drag_density: kvadratiskt luftmotstånd mot den medroterande atmosfären med NRLMSISE-00-densiteten i den geodetiska WGS-84-punkten (jordens rotationsvinkel med UT1 = TT, lokal soltid UT + lon/15), konstant rymdväder per modell; avstängd som standard och bitidentisk

seg-1ac7430e88fc = Standardmässigt exponentiellt luftmotstånd mot en oberoende implementering (ekvatoriellt)

seg-a9c41b03f2ca = Standardluftmotståndet i Cowell-propagatorn: kvadratiskt luftmotstånd mot den medroterande atmosfären med forces::atmospheric_density, den styckvis exponentiella tabellen i Vallado Tabell 8-4 vid den sfäriska höjden (propagator::ForceModel::drag med standardvarianten Exponential av forces::DensityModel)

seg-9e15970435c3 = Sol och Måne enligt DE440 i Cowell-kraftmodellen (valfri)

seg-de6831cf7785 = Valfri efemeridnivå för termerna för tredje kropp och SRP i den numeriska Cowell-modellen ForceModel: geocentrisk Sol och Måne från valfri EphemerisProvider (en DE440 SPK-kernel via KernelEphemeris) vid TDB = TT + (TDB - TT), som vägrar en leverantör som inte kan betjäna epoken och räknar varje återgång till den analytiska serien; avstängd som standard

seg-057c21daf4f2 = Atmosfärstid S1 (valfri)

seg-f600a39f297e = Den dygnsvisa lufttrycksvågen S1 som en störning av geopotentialen: Biancale och Bode ({ "2006" }) modell N1, grad { "2" } till { "6" }, genom belastningsformeln i IERS { "2010" } ekv. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valfri i Cowell- och precisionskraftmodellerna (air_tide_s1, avstängd som standard)

seg-7dd9fccac779 = Ingen extern för geopotentialeffekten. De { "24" } koefficienterna är avskrivna från GFZ STR06/01 Tabell { "1" } modell N1 och kontrollerades på nytt rad för rad mot rapporten (SHA-256 890865ae); gradtalen { "0" }, { "1" }, { "7" } och { "8" } används inte. Ray och Ponte ({ "2003" }) trycker ingen tabell över sfäriska harmoniska, så ingen andra källa jämfördes

seg-b150b1bdb599 = Koefficienter för atmosfärstiden S2 enligt IERS-konventionen

seg-87e9238b8c53 = Rays ({ "2001" }) lufttrycksharmoniska för S2 (n <= { "4" }, prograd och retrograd) omvandlade till den fullt normaliserade sinus-ledande formen i IERS { "2010" } ekv. 6.20-6.21 (amplitud dividerad med N_nm, epsilon = { "90" } grader - psi) och tillämpade som S2-termen i tides::atmospheric_tide

seg-444f0a65b6fd = Tesseral geopotential i Cowell-propagatorn

seg-ad475816bc78 = Valfritt tesseralt fält EGM2008 (till grad/ordning { "70" }) som central gravitation i den numeriska Cowell-modellen ForceModel, utvärderat i ett jordfast system roterat med IAU:s jordrotationsvinkel { "2000" } (eller kedjan CIO GCRS-till-ITRS); avstängt som standard, så ingen befintlig utdata ändras

seg-e8f5ff8c9149 = Sfäriskt harmoniskt gravitationsfält av hög grad (EGM2008 till { "2190" })

seg-d3b2f32dcecb = Underflödessäker och polsäker utvärdering av ett fullt normaliserat fält till grad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes-Featherstone { "2002" } modifierad framåtkolumn med gradienten fri från 1/cos phi), en strömmande inläsare för ICGEM .gfc (from_gfc_file / from_gfc_reader; hela EGM2008 hämtas vid körning, ingår inte), och Holmes-Featherstone-utvärderaren som kan väljas i den valfria Cowell Geopotential

seg-e81b7418c382 = Integratorn DOP853

seg-e6e3638aa68e = Hairer DOP853 { "8" }({ "5,3" }) explicit Runge-Kutta med den kombinerade felskattaren av 5:e/3:e ordningen, stegregulatorn från SciPy/Hairer, automatiskt begynnelsesteg, ett stegskydd som stänger vid fel och tät utdata av 7:e ordningen; kan väljas som propagatorns Integrator-variant Dop853 / propagator::propagate_dop853

seg-9ad7c1f4da77 = Robust lösare för Keplers ekvation

seg-4b9d812fd13e = Elliptisk Kepler-lösare för alla { "0" } <= e < { "1" } och alla medelanomalier: kubisk startgissning av Markley ({ "1995" }) och korrektion av femte ordningen, en residual fri från kancellation (1-e)E + e(E - sin E) - M, och skyddad Newton-polering (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

seg-1960804ef2f4 = Batch-banbestämning med avståndshastighet och az/el med stationsmaskering

seg-4c185244bc66 = Återskapa ett epoktillstånd ur blandad spårning av avstånd, avståndshastighet och azimut/elevation över en elevationsmask med Gauss-Newton på H = (dh/dx(t)) Phi(t, t0): analytiska mätpartialer och en variationell tillståndsövergångsmatris med analytiska partialer för två kroppar + J2 (integrerad med RK4, inte en STM i sluten form)

seg-bc3d1ee7c639 = Viktning av observationer efter noggrannhetskod i SP3

seg-63b1fab84f85 = Avbilda noggrannhetskoder i SP3 (huvudets ++-exponenter i { "2" }^n mm, basen %f, standardavvikelser base^n mm per post) på positionssigma per observation för motorn för precis banbestämning (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ebecb8906506 = Ingen extern: vikterna är ett modellval (formatet SP3 definierar koden bara som producentens noggrannhetsindikator; den läses här som en standardavvikelse per axel). De befintliga registrerade körningarna från organisationerna är oförändrade

seg-e35df6881c80 = Planetära gravitationsfält från PDS SHADR-tabeller

seg-f78b73ae8742 = Läs PDS SHADR-tabeller med sfäriska harmoniska (from_shadr, på SphericalHarmonicField i src/gravity_pds.rs: enhetsomvandling, C00 = { "1" } angiven, kontroller av fullständighet och normalisering) och utvärdera den kroppsfasta gravitationen för Mars GMM-3 (grad/ordning { "120" }) och månfältet GRAIL GL0660B (grad/ordning { "660" })

seg-ae3e8833a5ef = Koppla ett publicerat gravitationsfält till en kropp

seg-ffb2b20e5f32 = with_gravity_field (på Body, i src/gravity_pds.rs): koppla valfritt inläst sfäriskt harmoniskt fält (till exempel GMM-3 eller GL0660B) till en Body så att propagatorn utvärderar det kroppsfast; valfritt, standardkroppar oförändrade

seg-bcb731f7a9b5 = Endast intern konsistens. Varje publicerat fält är definierat i producentens kroppsfasta system (GMM-3 i Marssystemet av Konopliv et al. { "2006" }, GL0660B i månens huvudaxelsystem DE421), medan fältet utvärderas i IAU-systemet; förskjutningen är inte modellerad

seg-659bfeba459c = Batch- och sekventiell banbestämning

seg-dbc98f498941 = Återskapa ett epoktillstånd [r,v] ur avstånd från markstationer med en differentialkorrigerare av Gauss–Newton i batch och ett sekventiellt filter, över en kraftmodell med två kroppar+J2

seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — ett oberoende skattningsbibliotek från tredje part med en matchad kraftmodell; återskapat epoktillstånd + RMS för residualer efter anpassning stämmer till <{ "1e-3" } m utan brus och <{ "3" } m vid ett brusgolv på { "5" } m

seg-acdac055acb9 = Lösare för radiometrisk ljustid i djupa rymden

seg-62a478e40850 = Retarderad (nedlänk) enkelriktad ljustidslösning τ = |r_rx − r_target(t−τ)|/c för radiometrisk navigering i djupa rymden (jorden→Mars/Solen/Månen)

seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) ljustid med konvergerad newtonsk aberration (Aberration::CN; motsvarar SPICE spkapo) över JPL DE440 — en oberoende SPICE-implementering i Rust; kshanas retarderade lösare med fixpunkt matchade till under en nanosekund. De bredare måtten för Doppler / Shapiro / reducerad dynamisk OD förblir MODELLED

seg-c69ef9342160 = Satellitposition ur sändningsefemerid (RINEX för flera GNSS)

seg-62702fc6f242 = Keplersk → ECEF-satellitposition ur sändningsefemerid för IS-GPS-200 / Galileo-OS / BeiDou-OS från en tolkad navigeringspost i RINEX-3

seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos() kompilerad från C-källkod (T. Takasu, BSD-2-Clause) — en oberoende implementering av IS-GPS-200/SIS-ICD, matad med identiska navigeringsposter i RINEX-3; satellitens ECEF-position matchade till ~{ "62" } nm. (Interpolation av precisa efemerider i SP3 valideras separat — se 'SP3 precise-ephemeris interpolation')

seg-c807a782b20e = Interpolation av precisa efemerider i SP3

seg-238de70daab9 = Lagrange-interpolation enligt IGS-standard av satellitpositioner ur precisa efemerider i SP3 med jordrotationskorrektion per nod (rotera varje nod med ω⊕·(t_node−t) in i frågeögonblickets jordfasta system före polynomanpassningen)

seg-e9249ae44a11 = RTKLIB peph2pos() kompilerad från C-källkod (preceph.c; T. Takasu, BSD-2-Clause) — de facto IGS-referens, en oberoende implementering; kshanas interpolator (som nu har samma jordrotationskorrektion per nod) matchade till ~{ "15" } nm på en verklig SP3-produkt, ned från ~{ "5.5" } cm före korrektionen

seg-9762cf428435 = Kodare för navigeringsmeddelanden utöver GPS LNAV (GPS CNAV, Galileo I/NAV och F/NAV)

seg-9b703b9607d8 = GPS CNAV-meddelandetyperna 10/11/30, Galileo I/NAV-ordtyperna 1-5 i nominella jämna/udda sidor och Galileo F/NAV-sidtyperna 1-4: ICD-fältpackning och kvantisering, CRC-24Q, faltningskodning med hastighet 1/2 och K={ "7" } (G2 inverterad för Galileo), blockinterfoliering och synkmönster, med matchande testavkodare

seg-7939b210e83c = Intern tur-och-retur och ICD-kända svar; ingen avkodare från tredje part har körts (testmiljön för RTKLIB/GNSS-SDR som läser KSHANA_NAVMSG_ORACLE_JSON är datagrindad). MODELLED

seg-5ce7cd3d6011 = Läsare och interpolation för IONEX globala jonosfärskartor på en verklig CODE GIM

seg-502656556ddf = Läsare för IONEX { "1.0" } (huvud, I5-värden i fasta kolumner, TEC- och RMS-kartor, absoluta epoker, saknade värden) med bilinjär rumslig interpolation, formatets tidsinterpolation med närmaste / på varandra följande / roterad karta (ekv. 1-3) och tunnskals-TEC längs sikten

seg-974d8c1f7876 = Hatch-bärvågsutjämning av kod på verkliga RINEX-observationer

seg-f26b5da0f52e = Divergensfritt Hatch-filter (jonosfärsfri kod buren av den jonosfärsfria bärvågen, fönster på N epoker, omstart vid förlorad låsning, geometrifritt hopp eller lucka) i sammanställningen för precis enpunktspositionering

seg-fac84cb9b256 = FYND mot den publicerade ITRF2020-koordinaten för WTZR: de förhandsregistrerade trösklarna (utjämnad median och p95 högst { "0.6" } x rå; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) missades, kvoter { "0.718" } och { "0.923" }; det kvarvarande felet på meternivå är biasliknande (kodbias för C1C, antenn, tidvatten, multipath över lång period), inte det vita brus som utjämningen tar bort. MODELLED: filtrets statistik kontrolleras internt

seg-2eec513ae8c8 = RTK-dubbeldifferenser med heltalsfixering via LAMBDA på verkliga RINEX-observationer

seg-6571676bf918 = Relativ positionering på kort baslinje ur verklig GPS-kod och bärvågsfas på två frekvenser: dubbeldifferenser mot den högsta satelliten med sin fullständiga kovarians, ett Kalman-filter med flyttal över baslinjen och enkeldifferensernas osäkerheter med omstart vid slip, minsta kvadrat med heltal via LAMBDA med kvottest, och baslinjen betingad på de fixerade heltalen

seg-e50c5d4b65c7 = Publicerade ITRF2020-koordinater för WTZR och WTZZ (IGN ITRF2020_GNSS.SSC, lösning { "3" }, med RINEX-antennhöjderna) som ger referensbaslinjen; trösklar förhandsregistrerade i tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md innan koden skrevs. Endast kort baslinje: inga jonosfäriska eller troposfäriska dubbeldifferenser modelleras

seg-f9aa0c529393 = Tidslösning för mottagarklockan med PPP mot IGS slutliga stationsklocka

seg-83ad9e893db9 = Mottagarklockan skattad av det statiska PPP-filtret med flyttal på verklig GPS-kod och fas på två frekvenser med IGS slutliga banor och klockor: en tidsöverföring från mottagaren till IGS-tid, PPP:s jonosfärsfria tidslösning.

seg-91a882dd71e8 = IGS slutliga kombinerade klocka för stationen WTZR (AR-poster i IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, en kombination av flera analyscentras nätverkslösningar; IGS-produkter, fri användning med angivande av källa); trösklar förhandsregistrerade i xval/ppp-time/PREREGISTRATION.md före någon jämförelse; alla höll vid första körningen. VAD SOM INTE ÄR KONTROLLERAT: en station och ett konvergerat tvåtimmarsfönster; IGS-tid, inte UTC(k); den konstanta förskjutningen innehåller mottagarens kodbiaser och är begränsad, inte kalibrerad; ingen spårbarhet till Circular T.

seg-a9b2a93401a3 = Precis punktpositionering med flyttal på verkliga RINEX-observationer

seg-cc991ccec112 = Statiskt PPP-filter med flyttal (utvidgat Kalman-filter) på verklig GPS-kod och bärvågsfas på två frekvenser med IGS slutliga banor och klockor: jonosfärsfri kombination, antennförskjutningar för satellit och mottagare (mottagarvariationer), fast jordtidvatten, fasupplindning, Shapiro-fördröjning, skattad zenitfördröjning från vattenånga, osäkerheter med flyttal per båge med detektering av slip via geometrifritt / Melbourne-Wübbena

seg-36e7c9286af7 = Publicerad ITRF2020-koordinat för WTZR (IGN ITRF2020_GNSS.SSC, lösning { "3" }, propagerad med sin hastighet) — trösklar förhandsregistrerade i tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md innan filtret skrevs; utveckling endast på den samlokaliserade stationen WTZZ. Inte modellerat: havsbelastning, satellit-PCV, upplösning av heltalsosäkerhet

seg-c8d87abed330 = Läsning av navigeringsfiler i RINEX { "4" }

seg-28913a01af00 = Navigeringsfiler i RINEX 4.00-4.02: poster <c1/> för GPS LNAV, Galileo I/NAV och F/NAV, BeiDou D1/D2 och QZSS LNAV avkodade till typen för sändningsefemerider; poster för CNAV, CNV1-3, FDMA, SBAS, STO, EOP och ION hoppas över till nästa posthuvud; en post vars huvud anger en annan satellit, eller en trunkerad post, avvisas

seg-278ca396127a = Läsning av observationsfiler i RINEX { "4" }

seg-e0883aa933eb = Observationshuvuden i RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etiketter matchade i kolumnerna 61-80 för version { "4" } och senare) och epokposter

seg-971fb1203a6d = Formatkontroll på en verklig publicerad RINEX { "4.00" }-fil (värden som läses tillbaka är lika med filens tryckta literaler) och ett huvud härlett ur specifikationen; ingen oberoende läsare har körts, så MODELLED

seg-33e5c74720ff = Satellitposition ur sändning för BeiDou GEO

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } position för geostationär satellit ur en sändningsefemerid (tröghetsliknande system, därefter Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valfri via fältet include_beidou_geo i NavParseOptions, så standardläsaren hoppar fortfarande över GEO

seg-559814996a4c = Interpolation av precisa klockor i SP3

seg-8e7a0dbd1755 = Satellitklockans förskjutning mellan de tabulerade klocknoderna i SP3 genom linjär interpolation över de två omslutande giltiga noderna (schemat pephclk i RTKLIB; sentinellen för dålig klocka hoppas över), och samma noder matade in i kedjan för precisa produkter som poster likvärdiga med RINEX-klocka

seg-1f4f0f841802 = IGS slutliga kombination av satellitklockor på { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24): publicerade klockskattningar vid frågeögonblicken, inte interpolerade ur SP3; trösklar förhandsregistrerade i tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md före första körningen (RMS { "0.15" } ns, p95 { "0.30" } ns, nodmedian { "1e-12" } s, diskriminering 2x)

seg-71f48628ebb2 = Tätt kopplad GNSS/INS med bärvågsfas och osäkerheter med flyttal

seg-5a156aa81275 = Feltillståndsbaserat EKF över { "15" } INS-tillstånd, en mottagarklocka med två tillstånd och en osäkerhet med flyttal i bärvågen per spårad satellit; pseudoavstånd, bärvågsfas och valfri avståndshastighet från en SGP4 Walker-konstellation (ljustid och Sagnac), korrektioner med Klobuchar och Saastamoinen/Niell tillämpade i slingan vid filtrets egen position; detektering av slip med tidsdifferentierad bärvåg och en tröskel per satellit vidgad av hastighetsosäkerheten; omstart av osäkerheten vid slip och återinfångning

seg-00576e8c1032 = Intern konsistens: mätningarna syntetiseras ur de modeller som filtret använder (χ² NEES/NIS över seeds, en brusfri konvergens, slipinjektion). MODELLED; inga verkliga mottagardata eller filter från tredje part jämförs

seg-7d644516b1ec = GNSS/INS-paket för sjö, järnväg och flyg med ett alternativ för tät koppling

seg-cbb03a8baf73 = Tre scenarier för gnss-ins på banbiblioteket (ett fartyg som slingrar sig med { "8" } m/s med ett avbrott på fem minuter; ett tåg genom en skärning med två satelliter och en tunnel; ett flygplan vars avbrott täcker en 25-graders krängd sväng) och paketets valfria tabell [tight]: pseudoavstånd från en SGP4 Walker-konstellation sammanförda av navigatorn med sluten slinga, varje satellit över masken vid nominell drift och de högsta få vid försämrad drift

seg-273c14256d4c = Internt: varje pakets kvalitetsmått mot dess egen referens och en jämförelse mellan lös och tät koppling på identiska indata. MODELLED; granskningens jämförelse med NaveGo har inte körts

seg-f4dab73c4eda = Kopplat PNT-filter för pseudoavstånd med biastillstånd och 3D-utvidgning i fusionspaketet

seg-742b60089361 = Ett staplat Kalman-filter över position, hastighet, klockfas och frekvens matat med pseudoavstånd som kopplar position och klocka (uppdateringar i Joseph-form som bär korskovariansen); en variant med 1 frihetsgrad utökad med ett konstant tillstånd för accelerometerbias som fusionspaketet kör under [coupled]; och 3D-versionen med 8 tillstånd med rader för siktlinjen

seg-9558d7aad3af = Intern konsistens: referensen simulerad ur filtrens egna modeller (χ² NEES över Monte Carlo-seeds, det frikopplade paketet på identiska sensorer). MODELLED

seg-4a64aa1fe3ca = Löst kopplat GNSS/INS-EKF med hävarm på datamängden KF-GINS

seg-30f503856ac5 = Det slutna 15-tillståndsfiltret EKF för feltillstånd drivet av IMU-ökningar med GNSS-antennpositioner sammanförda genom hävarmsmodellen H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], konfigurerat från en KF-GINS YAML-fil (begynnelsetillstånd och sigman, ARW/VRW, Gauss-Markov-biaser)

seg-b01d28a09abe = Datamängdens publicerade referensbana och C++-programmet KF-GINS (GPL-3.0, commit 8291a93e, körd som ett separat verktyg); trösklar förhandsregistrerade i xval/kfgins/PREREGISTRATION.md, och KF-GINS kördes inte på de här data före den registreringen (kontrollerat i dess Results). Alla sex trösklar höll vid första körningen. DATAGRINDAD: demodatamängden KF-GINS (verklig IMU Leador-A15 och RTK GNSS med en referensbana) saknar licens, så den ingår inte i förvaret; xval/kfgins/fetch.sh hämtar den vid testtillfället med varje fils SHA-256 låst, och testet misslyckas vid avvikelse; vägen för att reproducera, som kräver nätverksåtkomst, finns i xval/kfgins/PREREGISTRATION.md. Uppgraderad till VALIDATED genom ägarens beslut på datagrindad evidens (2026-10-13)

seg-e6b6c605564c = Export för testbänk läst av en simulators rörelsefilsläsare (gps-sdr-sim)

seg-a07429aa1998 = De rörelsefiler som exporteras för testbänk och ges till en öppen GNSS-simulators egna läsare kommer tillbaka som den exporterade banan: NMEA GGA-filen (-g), utsnittet med tid/latitud/longitud/höjd ur rörelse-CSV (-x) och dess utsnitt med tid/x/y/z (-u), på { "6" } gnss-ins-scenarier (inklusive paketen för sjö, järnväg och flyg, lästa till simulatorns tak på 3000 sampel) och { "2" } stationära. Endast rörelse; ingen signal skrivs eller genereras.

seg-07b5f46a900f = VAD SOM KONTROLLERAS EXTERNT, uttryckt snävt: gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion och readUserMotionLLH med sin egen WGS { "84" } llh2xyz, anropade genom xval/testbench-gpssdrsim/driver.c (ingen signalfunktion anropad), mot rörelse-CSV:s jordfasta kolumner rad för rad, med trösklar förhandsregistrerade i xval/testbench-gpssdrsim/PREREGISTRATION.md före någon körning: varje sampel lästes på alla { "8" } scenarier; NMEA sämsta { "1.21" } mm (tröskel { "1" } cm); LLH-utsnitt sämsta { "0.145" } mm (tröskel { "1" } mm); fyrkolumners jordfast utsnitt exakt (tröskel { "1" } um, ändring { "1" }); gnss-ins-rader på simulatorns rutnät på { "10" } Hz till { "2.3e-13" } s. FYND (körning { "1" }, fastlåst): CSV-filen i full bredd med borttaget huvud går inte att läsa med -u, eftersom läsarens radbuffert på 100 tecken delar varje rad på 161 tecken i två sampel; docs/TEST-BENCH.md anger utsnittet med fyra kolumner. VAD SOM INTE ÄR KONTROLLERAT: fysiken i scenariots referensbana; gps-sdr-sims signalutdata; någon annan simulators läsare; någon mottagare.

seg-2db2b9dc3b45 = Bibliotek med GNSS/INS-banor och import av CSV-referens

seg-e1fe83c75a6c = Valbara rörelseprofiler för paketet gnss-ins (rakt, figur-8, urban stanna-och-kör, flygplans stigning och koordinerad sväng, kartläggningsdrönare), definierade av kommandon för Euler-hastighet och acceleration längs spåret slutna på referenstillståndet med den kinematiska IMU:n (termer för centripetal, gravitation och Coriolis), och importerad CSV-referens omvandlad till den IMU som återger den; den historiska körningen oförändrad när ingen profil anges

seg-30ea002a06a0 = Internt: identiteter för stelkroppskinematik, CSV-tur-och-retur och filtrets egen kovarians. MODELLED (ingen verklig körlogg jämförs)

seg-8685fd899e3c = Mekanisering av strapdown-INS

seg-ba942e322f8a = Strapdown-tröghetsmekanisering med kvaternionsattityd i WGS-84 NED (kompenserad för coning/sculling) som propagerar ett navigeringstillstånd ur ökningar av (Δθ, Δv)

seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) körd under Octave — en oberoende publicerad INS-verktygslåda driven av den identiska strömmen av ökningar (Δθ,Δv). Attityden matchar bit för bit (samma konventioner för NED / skalär-först-kvaternion / jordhastighet / transporthastighet); hastighet/position stämmer till två dokumenterade skillnader — nordkomponenten av gravitationen från lodavvikelsen som NaveGo inkluderar och kshana medvetet utelämnar (lodlinjegravitation; matchad mot Groves slutna uttryck i varje siffra, med en kontroll av ett förnuftigt golv) och skillnader av O(dt²) mellan integratorer — inte fel i mekaniseringen

seg-d1a5c8e7ca74 = Syntes av gravitationsfältsfunktionaler (gravitationsstödd / GNSS-fri navigeringskarta)

seg-8336eb12eb7b = Sfärisk harmonisk gravitationsstorlek + störning (mGal) ur valfri ICGEM .gfc-modell; normalgravitation enligt GRS80

seg-b5a7fc986751 = GRS80 (Moritz { "1980" }, IAG) normalgravitation enligt Somigliana + publicerade γ_e/γ_p; verkligt ICGEM EGM2008-fält

seg-86f9186bb884 = CR3BP för jord–måne { "9" }:{ "2" } NRHO mot den bana CAPSTONE flög

seg-d4127cf241f3 = Den cirkulära begränsade södra { "9" }:{ "2" } nära-rätlinjiga haloomloppsbanan kring L2 som cr3bp::differential_correct_halo korrigerar (banfamiljen för Gateway och CAPSTONE), jämförd för sin medelgeometri (period, perilunradie, apolunradie) med den bana CAPSTONE faktiskt flög. Ett mått på hur väl CR3BP-medlemmen beskriver den verkliga banan; en CR3BP-bana är inte en bana i en efemerimodell och jämförs inte epok för epok

seg-c866a5bd4318 = Roterande CR3BP-tillstånd avbildade på månencentrerad ICRF på linjen jord–måne enligt DE440

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf avbildar ett dimensionslöst roterande tillstånd i CR3BP för jord–måne på en månencentrerad ICRF-position och -hastighet på den ögonblickliga linjen jord–måne (längdenhet avståndet jord–måne, tidsenhet den inversa banhastigheten, systemets fulla vinkelhastighet inklusive dess hastighet utanför planet från månens acceleration), med inversen from_moon_centred_icrf, och cr3bp::to_moon_centred_icrf_de440 läser månens geocentriska tillstånd ur en DE440 SPK. Den avbildar tillstånd; den gör inte en CR3BP-bana till en bana i en efemerimodell

seg-d543e3e84f36 = Solsystemstyp på en JPL-kernel (planetary_kernel_path)

seg-e8a96f29afc7 = Typen <c1/> med planetary_kernel_path: varje redovisad kropp vars egen NAIF-kod finns i SPK hämtar sin heliocentriska J2000-position och -hastighet från kerneln genom motorns egen läsare (etikett KERNEL), en länk vars båda ändar finns i kerneln beräknas på den, barycentra ersätts aldrig med en planet, och varje annan kropp förblir analytisk med sin egen etikett; rapporten får ett kernelblock (sökväg, SHA-256, de kroppar och länkar som hämtats från den) bara när alternativet är satt. Med de440s.bsp är det Merkurius, Venus, jorden och månen

seg-7f3d53b4e8d1 = Porkchop på efemeriden DE440

seg-bd813d7e0b58 = maneuver::porkchop_kernel: svepet över uppskjutningsdatum x ankomstdatum av avgångens C3 (km²/s²) och ankomstens V-infinity (km/s) med lösaren för Lambert med ett varv i progradriktning och kollinearitetsskyddet på { "0.5" } grader, på heliocentriska J2000-tillstånd för två valfria NAIF-kroppar som läses ur en JPL DE440 SPK av craten egen läsare. Ett varv, prograd, inga begränsningar för bärraket eller ankomst: ett svep, inte en uppdragsutformning

seg-b1401bed5da8 = Optimerare för impulsiva överföringar på efemeriden DE440

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: avgångs- och ankomstdatum för en ballistisk överföring med två impulser och ett varv som minimerar avgångens C3 eller ankomstens V-infinity inom Typ I eller Typ II, som ett kontinuerligt optimum (ett rutnät på 2 dagar över båda fönstren, därefter 2D Nelder-Mead), på heliocentriska tillstånd ur DE440 SPK. En datumoptimerare för en etapp, inte en uppdragsutformning: inga alternativ för bärraket, parkeringsbana, manövrar i djupa rymden eller flera varv

seg-6c695aef043b = En oberoende optimerare: NAIF SPICE Toolkit (CSPICE N0067 genom spiceypy { "8.3.0" }) heliocentriska tillstånd på samma utsnitt av de440s, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) och SciPy { "1.18.1" } Nelder-Mead, utan att anropa någon Kshana-kod. NASA:s handbok för jorden till Mars (MIDAS, efemerid ej angiven, datumrutnät på 2 dagar) är en sekundär publicerad referens och avgör inte statusen

seg-93f3cdbb7297 = Lösare för Lambert-överföring med flera varv

seg-995a6a995b78 = Varje lösning av Lamberts problem med upp till tre fullständiga varv (maneuver::lambert_multirev: lösningen med ett varv, därefter vänster och höger gren för varje varvantal, Izzo { "2015" }), med gränshastigheterna v1 och v2, för prograda och retrograda överföringar, i kanoniska och heliocentriska SI-enheter, inklusive överföringar inom { "1" } % av ett varvantals minsta flygtid och geometrier nära 180 grader. Enbart en tvåkroppslösare (inga störningar)

seg-ff9c6140fe1c = Lösare för Lambert-överföring med två kroppar

seg-d8c39ced64b2 = Lösare för Lambert av Izzo-2015 med ett varv (r1, r2, flygtid → gränshastigheter) över överföringar LEO→GEO→heliocentriska, prograda och retrograda

seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — en oberoende Lambert-lösare från tredje part. Lambert-problemet med ett varv (M={ "0" }) har en entydig lösning, så överensstämmelsen mellan bibliotek är en genuin extern kontroll; matchade till <{ "1e-4" } m/s (observerat ~{ "1e-11" }), samma slags validering som DOP får mot gnss_lib_py

seg-347cece5df63 = Referenssystem och tidsskalor

seg-5a4bc2c15eaa = IAU 2006/2000A precession-nutation, CIO GCRS↔ITRS, tidsskalor med skottsekunder

seg-51d28ab9d256 = IAU SOFA / ERFA referensvektorer; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-c3d4b9bef817 = Tvådelade julianska datum och skottsekunder på tidsvägen för jordbanor

seg-5e859e3aa613 = Ett UTC-kalenderdatum och en UTC-tid till ett tvådelat julianskt UTC-datum med konventionen dtf2d i SOFA för dagar som slutar på en skottsekund ({ "86 401" } s långa, { "23" }:{ "59" }:{ "60" }.x giltigt), UTC till TAI och tillbaka, och UT1 från UTC via TAI, på tvådelade datum från 1972-01-01: den tidsväg som SGP4 (Sgp4::propagate_at, mätt från en tvådelad epok) och den jordfasta rotationen IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop med den tvådelade jordrotationsvinkeln) tar

seg-f1c7bc235a6b = Tvådelade julianska datum genom jordrotation på banvägen

seg-cee11d4bad08 = Jordrotation ur ett tvådelat julianskt UT1-datum på banvägen, så att den jordfasta positionen behåller den mikrosekund som ett datum i enkel f64 förlorar (omkring { "3e-9" } rad nära { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventionen, på de två delarna), cio::gcrs_to_itrs_matrix_jd2 (CIO-matrisen GCRS till ITRS med jordrotationsvinkeln från de två delarna), och, byggda på dem och internt kontrollerade, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 och own_jd2_utc, ephemeris-scenariots valfria two_part_jd (ECEF-positionen, markspåret och stationsvyn; avstängd som standard, oförändrad), och förlustfria From-omvandlingar mellan jd2::Jd2 och timescales::TwoPartJd. Precession-nutation och epoken i Cowell-kraftmodellen förblir i enkel f64, där en avrundning på { "40" } us ligger under { "1e-15" } rad eller långt under felet i den analytiska efemeriden för Sol/Måne

seg-096df3971f5f = Systemmatriser mot ERFA-vektorer: IAU { "2006" } bias-precession, TEME till GCRS och CIO-kedjan med celestiala polförskjutningar

seg-731a5ed967b3 = Tre systemmatriser jämförda element för element eller via rotationsvinkel med ERFA vid godtyckliga epoker: precession::precession_matrix (IAU { "2006" } bias-precession med Fukushima-Williams-vinklar), nutation::teme_to_gcrs_matrix (rotationen TEME till GCRS P^T N^T Rz(-EE) med IAU { "2006" } precession, IAU 2000B nutation och dagjämningsekvationen med sina två ledande komplementära termer), och cio::gcrs_to_cirs_matrix_with_offsets (rotationen GCRS till CIRS med IERS celestiala polförskjutningar dX, dY adderade till modellens CIP X, Y före rotationen, konventionen i SOFA cookbook; ny). Själva modellvalen (2000B-nutation på TEME-vägen, den komplementära serien med två termer) är inte validerade, endast deras implementering

seg-4e2fe2e3dabb = UTC före 1972 (eran med driftande takt) på tidsvägen med tvådelade julianska datum

seg-1d086e669f09 = UTC från 1960-01-01 till 1971-12-31, när UTC gick med en förskjuten takt mot TAI och steg i bråkdelar av en sekund, på vägen med tvådelade julianska datum: TAI - UTC ur drifttabellen för varje period (timescales::tai_minus_utc_on_date), UTC-kalenderdatumet till ett tvådelat julianskt UTC-datum med dagslängden { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC till TAI med dagsbråkdelen skalad från UTC till SI-sekunder (jd2::utc_to_tai) och TAI tillbaka till UTC (jd2::tai_to_utc), enligt SOFA dtf2d, utctai och taiutc. Före { "1960" } tas TAI - UTC som { "0" } (SOFA:s värde; UTC odefinierad) och ligger utanför anspråket. Den enkla f64-funktionen timescales::tai_minus_utc begränsar fortfarande till { "10" } s före { "1972" } och täcks inte

seg-efacec095051 = Satellitklocka ur sändning för GLONASS och propagering av sändningsbana

seg-821b9c01b56e = GLONASS-satellitklockans sändningsbias -tau_n + gamma_n (t - t_b) vid en tid avläst på satellitklockan (glonass::GlonassEphemeris::sv_clock_bias_s, förskjutningen korrigerad för klockbiasen med två fixpunktsiterationer), och den jordfasta PZ-90-positionen för sändningens tillståndsvektor propagerad med RK4 genom rörelseekvationerna i GLONASS ICD inom +/-15 min från referensepoken (GlonassEphemeris::position_ecef), från verkliga navigeringsposter för GLONASS i RINEX { "3" }. Ingen transformation PZ-90.11 till ITRF tillämpas (de stämmer på centimeternivå sedan { "2014" }; RTKLIB tillämpar ingen heller). Inte kopplad till någon scenarioutdata: biblioteksfunktion

seg-d3b72a6fbb18 = En enda väg för jordbanor: SGP4-elementuppsättningar till GCRS och ITRS på kedjan IAU 2006/2000A med jordorienteringsparametrar

seg-e4eca7205b5e = Den propagerings- och systemväg som varje dirigerad jordbanetyp delar: en SGP4-uppsättning medelelement med en tvådelad UTC-epok (sgp4::MeanElementSet, läst ur konstellationens designelement via MeanElementSet::from_earth_fixed) propagerad med SGP4/SDP4 till TEME (sgp4::SgpOrbit), och rotationerna TEME -> ITRS och GCRS -> ITRS i kedjan IAU 2006/2000A med UT1 - UTC och polrörelse (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, formerna utan parametrar teme_to_itrs_matrix och gcrs_to_itrs_matrix). TEME är den sanna ekvatorn för datumet med medeldagjämningen, nådd från GCRS genom IAU { "2006" } bias-precession, IAU 2000B-nutationen och dagjämningsekvationen

seg-f650a11458b8 = Avvägning vid utformning av avståndskoder

seg-071e552a7179 = Gränser för sidolober och korskorrelation hos m-sekvenser/Gold, längd↔osäkerhet

seg-65b7902a2d8f = Publicerad korskorrelation för GPS C/A Gold (−{ "23.9" } dB); Gold { "1967" }-gräns

seg-5ec4c0730280 = GNSS-geometri / geometrisk noggrannhetsförsämring (DOP)

seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP ur siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-uppdelning

seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — oberoende bibliotek, matchad till { "1e-6" } relativt

seg-1a5623c81b48 = Positionsfel ur geometri: RMS-fel = sigma_UERE x DOP för motorns positionsbestämning med minsta kvadrat

seg-7a94b44a8738 = dop_error_mc::run_geometry och check: en seedad Monte Carlo (N = { "20,000" } epoker per geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) av motorns egen iterativa positionsbestämning med minsta kvadrat (pvt::solve_spp, enhetsvikter, löst från den sanna positionen) på de { "8" } geometrierna i tests/fixtures/dop/dop_reference.csv, som jämför felvarianserna i öst, nord, upp och klocka, RMS för H/V/P, korrelationen öst–nord, medelfelen och andelen inom den horisontella ellipsen på { "95" } % med sigma^{ "2" } Q, där Q är kovariansfaktorn i kärnan orbit::dop (orbit::dop_cofactor, samma aritmetik) på samma geometri

seg-90f18c774d57 = Intern konsistens mot ett slutet uttryck: under den linjära gaussiska modellen är kovariansen för minsta kvadrat sigma^{ "2" } (H^T H)^-1 (Kaplan och Hegarty (red.), Understanding GPS: Principles and Applications, 2:a uppl., Artech House, { "2006" }, kap. { "7" }). Metod och toleranser i designnoten för geometri { "0.36" }, avsnitt { "5.2" }, fastställda i en förhandsregistrering före första körningen: varje varians inom { "5" } % ({ "5" } standardfel för en stickprovsvarians vid N = { "20,000" }), varje RMS inom { "2.5" } %, korrelationen öst–nord inom { "0.035" } (5/sqrt(N)), varje medelvärde inom { "5" } standardfel, ellipsandelen på { "95" } % inom { "0.95" } +/- { "0.0077" } ({ "5" } binomiala standardfel); negativa kontroller (PDOP fördubblad; fel som växer som 1/sin(elevation) mot den ovägda Q) måste misslyckas. HUR DEN SAMMANSÄTTS: Q är kovariansfaktorn i kärnan orbit::dop, VALIDATED mot gnss_lib_py { "1.0.4" } på samma { "8" } geometrier i tests/dop_reference.rs (raden 'GNSS geometry / dilution of precision'); den här raden lägger till steget från de faktorerna till meter genom motorns lösare och lånar inte den radens status. VARFÖR MODELLED: ingen extern datamängd ingår; överensstämmelsen visar att skattaren och bruset realiserar sigma x DOP under lärobokens modell, inte att någon mottagares fel är lika med UERE x DOP, och sigma_UERE är en indata

seg-9acfde1b57f7 = Geometrimedveten förtroendeklassificering: satellitgeometri bredvid mottagarens förtroendepoäng och en klass på varje avdrag

seg-6138c41e13ff = receiver_trust::geometry: satellitgeometri per epok (good, degraded med orsakerna few-satellites/high-pdop/high-hdop/sky-blocked, eller unknown när loggen saknar GSV, NAV-SAT eller GSA) härledd ur redovisade elevationer och azimut genom orbit::dop eller hämtad från GSA, med en etikett som alltid redovisas och aldrig poängsätts (good, fair, poor, unknown) och HDOP, PDOP, VDOP, antal satelliter och signalförlust i ord; en geometriövervakare i fartygspoängen som inte drar något om inte geometrin är poor (kvoten max(hdop/4, pdop/6, 5/n_used) över { "1" }), därefter trappar upp till ett tak på { "15" } poäng vid { "1.5" } som enbart geometri inte kan ta under det försämrade bandet (tak, slut på trappan och golv i [geometry]; inget larm); en klass på varje avdrag (geometry, environment, inconsistency) där förlorad låsning mot satelliter under { "15" } grader klassas som geometry, satelliter i sikte men inte spårade klassas som environment, och ett avdrag för poor-geometri vars angivna HDOP ligger bortom max({ "1.0" }, { "25" } % av det härledda HDOP) från den angivna himlen klassas som inconsistency

seg-6987737c5fe4 = Intern konsistens: klassificeringen kontrolleras mot de regler den anger och mot handhärledda kvoter på syntetiska ändringar av den incheckade demologgen, och pinnarna för oförändrat håller utdata från { "0.35.0" }: ingen poäng ändras om inte geometrin är poor; etiketten redovisas alltid. VARFÖR MODELLED: trösklarna är valda, inte anpassade (proveniens i varje körnings geometry_model; siffrorna ur IEC 61108-1 och GPS SPS som de citeras, ska kontrolleras mot standardernas text), och det finns ingen extern märkt datamängd med naturlig geometriförsämring mot attacker att validera klassificeringen mot. Det härledda DOP återanvänder kärnan orbit::dop, VALIDATED mot gnss_lib_py, vars status den här raden inte lånar. En geometriklass är ett påstående om himlen, inte ett fynd att ingen attack förekom

seg-540420863a5a = Sändningsmodell för jonosfären (Klobuchar, IS-GPS-200)

seg-fd157c537502 = Klobuchars jonosfäriska gruppfördröjning längs sikten för en frekvens (L1) ur de åtta sända koefficienterna α/β

seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — oberoende referensimplementering kompilerad från källkod; matchad till < { "1e-4" } m

seg-0af6b1a073ce = Statistisk kärna för integritet i RAIM/ARAIM (lagar för χ² / icke-central χ² / normal)

seg-224a6c4200cd = Den fördelningskärna som varje skyddsnivå vilar på: tröskeln för feldetektering på ögonblicksbild χ²₁₋ₚfₐ(dof), icke-centraliteten för missad detektering pbias=√λ och multiplikatorerna K_fa/K_md/K_V för lösningsseparation

seg-49f7d0c26e0a = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — oberoende bibliotek (Cephes/Boost), en annan algoritm än Kshanas serie för ofullständig gamma; matchad till ≤{ "1e-6" } relativt. Endast kärnan. *Allokeringen* av P_HMI-budgeten i ARAIM MHSS saknar inte längre ett publicerat numeriskt orakel — WG-C ARAIM Technical Subgroups eget räknade exempel backar nu upp den separata raden 'ARAIM MHSS protection levels against published reference vectors', matchad vid referensens egen TOL_PL = { "5e-2" } m — så den här radens omfattning är den statistiska kärnan och den raden bär allokeringen (se docs/ARAIM_REFERENCE.md)

seg-03578217425f = Skyddsnivå för SBAS (HPL/VPL med viktad minsta kvadrat enligt DO-229E)

seg-df640d6c7a5d = Skyddsnivåer med viktad minsta kvadrat enligt DO-229E Appendix J: D=(GᵀWG)⁻¹ ur elevation/azimut och felbudget per satellit, huvudaxeln i den horisontella felellipsen och vertikalt σ, skalade med de publicerade K-faktorerna

seg-39aed7b4bffd = RTKLIB SBAS-PL-gaffel — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, "DO-229D Appendix J"), körd av rnx2rtkp -ws på verkliga EGNOS GEO-PRN120-meddelanden + verklig RINEX från BUTE/Budapest; oberoende implementering från tredje part, HPL matchad till < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) bekräftade identisk konvention. Båda orakel avrundar K_V→{ "5.33" } mot Kshanas exakta Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } (~{ "0.06" } %), så det vertikala kontrolleras som det K-faktorfria d_U

seg-8f32eb9c8167 = Mått för utvärdering av ML-detektorer (ROC/AUC/förväxling/Pfa-Pmd)

seg-b0d8e1b45bf9 = AUC (Mann-Whitney, bindningar ½), förväxlingsmatris vid tröskel, P_d/P_md/P_fa/precision/noggrannhet/F1

seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — oberoende bibliotek, exakt matchning

seg-e7af87ce5e72 = Poängsättning av avvikelsedetektering på verklig telemetri från rymdfarkoster

seg-9659b33fca5b = ROC AUC + bootstrap-konfidensintervall som skiljer verkliga märkta avvikelser; genomskinlig detektor (återger etiketterna)

seg-b4ed67ce7e7e = scikit-learn roc_auc_score på testdelningen OPSSAT-AD (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — verklig telemetri från OPS-SAT

seg-5c3f1057c6cc = Numeriska kärnor för kvantavvägning (NNLS / χ²-band / van-Loan Q)

seg-f82113ccb30b = NNLS-anpassning av uppmätt ADEV, konsistensband med χ² för NEES/NIS och den diskreta processbruskovariansen enligt van Loan för klockan (holdover-frirullning) — avvägningsmotorns beräkningsmässiga ryggrad

seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exakt, χ² <{ "5e-4" } vid driftens frihetsgrader. Endast kärnor — tal för enheters prestanda förblir Modelled (nästa rad)

seg-6f3099e7562c = Geomagnetiskt referensfält (syntes av IGRF-14)

seg-e9534723cb34 = Sfärisk harmonisk syntes av huvudfältet IGRF-14 — komponenterna X/Y/Z/F, deklination och inklination — som matar lagret för magnetiska anomalier i alt-PNT

seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — IAGA-VMOD:s referensimplementering av IGRF i ren Python som levereras med de officiella koefficienterna IGRF14.shc (IAGA:s 14:e generation, Zenodo 10.5281/zenodo.14012302); en oberoende kodbas från tredje part som beräknar det entydigt definierade fältet IGRF-14, matchad över ett globalt rutnät

seg-cb3fea409de7 = Detektionsstatistik — gaussisk AUC och minsta detekterbara fel

seg-ca677becb465 = Analytisk binormal ROC AUC = Φ(μ/(σ√{ "2" })) och det minsta detekterbara felet σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) som ligger under kvantfels- och avvikelsedetektorerna

seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), båda BSD-3-Clause — oberoende bibliotek som beräknar samma entydigt definierade storheter för gaussisk svans / AUC, matchade till golvet för A&S-erf (~{ "7e-8" }). Fördelen för kvant mot klassisk som byggs ovanpå förblir MODELLED

seg-1ed12110fb74 = Kärna för rangordningsstatistik (Kendall-τ / Dirichlet / percentil)

seg-0fb003404a5b = Kärnor för rangkorrelation och omsampling under studien av beslutsinstabilitet för resiliens: Kendall τ-b, Dirichlet-medelvärde, tävlingsrangordning och konfidensintervall med percentiler

seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — oberoende implementeringar (merge-sort τ) av den entydigt definierade rangstatistiken, matchade till { "1e-12" }. Studien av beslutsinstabilitet som bygger på de här kärnorna förblir MODELLED

seg-fdd2ba203d5b = Kärna för härledning av prioriteringar i MCDA (egenvektor i AHP / konsistenskvot)

seg-d01c155fbddf = Prioritetsvikter i Analytic Hierarchy Process = normaliserad principal (Perron) egenvektor till en reciprok matris för parvisa jämförelser med potensmetoden, med Saatys Consistency Index / Consistency Ratio och acceptansgränsen CR<{ "0.10" }

seg-d1947f2f2b3b = Saatys ({ "1980" }) kanoniska tabell över Random Index (RI({ "5" })={ "1.12" }) återgiven exakt + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) som oberoende egenvärdeslösare som beräknar samma entydigt definierade Perron-egenvektor/egenvärde, matchad till <{ "1e-9" }. Beslutslagret för Pareto / känslighet / MAUT som byggs på den här kärnan förblir MODELLED (aggregatorerna WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE är separat externt validerade — se raderna nedan)

seg-73e933220afb = Kärnor för viktad aggregering i MCDA (WSM / WPM)

seg-c436cdc991a2 = Weighted Sum Model (min–max-normaliserat additivt aggregat + rangordning) och Weighted Product Model (summanormaliserat, reciprokt för kostnad, multiplikativt aggregat) — de två poängsättarna för värdeaggregering i avvägningsstudier

seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — ett oberoende, mycket använt Python-bibliotek för MCDA från tredje part som beräknar samma entydigt definierade viktade aggregat; matchade till <{ "1e-9" }. Kan regenereras offline via tests/fixtures/mcda_wsm/ och tests/fixtures/mcda_wpm/. Skräp in ger skräp ut på indata; lagret för känslighet/robusthet förblir MODELLED

seg-f00bdb66a052 = Rangordning i MCDA efter avstånd till idealet (TOPSIS)

seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — min–max-normalisering, viktade positiva/negativa idealösningar, relativ närhet Cᵢ = d⁻/(d⁺+d⁻) och rangordning

seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — ett oberoende MCDA-bibliotek från tredje part som beräknar samma entydigt definierade närhetskoefficienter; matchade till <{ "1e-9" }. Kan regenereras offline via tests/fixtures/mcda_topsis/generate_topsis_reference.py

seg-ef33d848c985 = Kompromissrangordning i MCDA (VIKOR)

seg-cf879fb770f2 = VlseKriterijumska Optimizacija — gruppnytta Sᵢ, individuell ånger Rᵢ och kompromissindex Qᵢ vid strategivikten v={ "0.5" }, med rangordning där lägre är bättre

seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — ett oberoende MCDA-bibliotek från tredje part som beräknar samma entydigt definierade områdesnormaliserade S/R/Q-aggregering; överensstämmer till <{ "1e-9" }. Kan återskapas offline via tests/fixtures/mcda_vikor/generate_vikor_reference.py

seg-790176ba8196 = MCDA-rangordning med nettoflöde (PROMETHEE II)

seg-b25cedf6da6e = Preference Ranking Organization METHod — parvist preferensindex med de sex vanliga generaliserade kriterieformerna, positiva och negativa rangordningsflöden samt den fullständiga rangordningen efter nettoflöde (vanligt kriterium validated)

seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — ett oberoende MCDA-bibliotek från tredje part som beräknar samma entydigt definierade nettoflöde; överensstämmer till <{ "1e-9" }. Kan återskapas offline via tests/fixtures/mcda_promethee/generate_promethee_reference.py. Preferensformerna med tröskelvärden (q/p/σ) reduceras till samma generaliserade kriterialgebra och kontrolleras fortsatt som egenskaper

seg-72248291c388 = MCDA-kärna för valet vid rangordning (ELECTRE I)

seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — konkordans- och diskordansmatriser, dominansrelationen med konkordans och icke-veto samt kärnan för valet vid rangordning (konvention med enbart nyttokriterier, viktsumma normaliserad till ett och en enda global skala)

seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — ett oberoende beslutsbibliotek för flera kriterier från tredje part som beräknar samma entydigt definierade konkordans, diskordans, dominans och kärna; överensstämmer element för element till <{ "1e-9" }. Kan återskapas offline via tests/fixtures/mcda_electre/generate_electre_reference.py. Valen av ĉ/d̂-trösklar är indata från analytikern (känslighetsanalysen förblir MODELLED)

seg-95942c6a2689 = MCDA-aggregeringskärnor (WASPAS / MOORA)

seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (linjärnormaliserad konvex blandning λ·WSM+({ "1" }−λ)·WPM vid λ={ "0.5" }) och MOORA-kvotsystemet (vektornormaliserad viktad nyttosumma minus viktad kostnadssumma) — den stabilitetshärdade värdeblandningen och den teckenbärande kvotsystempoängen

seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA-kvotsystem, vektornormalisering) — ett oberoende, mycket använt MCDA-bibliotek för Python från tredje part som beräknar samma entydigt definierade aggregat; överensstämmer till <{ "1e-9" }. Kan återskapas offline via tests/fixtures/mcda_waspas/ och tests/fixtures/mcda_moora/. Skräp in ger skräp ut för indata; lagret för känslighet och robusthet förblir MODELLED

seg-7de67fedc1da = MCDA-proportionell rangordning (COPRAS)

seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — kolumnsummenormaliserad nyttosignifikans S⁺ plus termen för inverterad kostnadssignifikans, den relativa signifikansen Q och nyttograden U = Q/max Q (bästa alternativ = { "1" })

seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — ett oberoende MCDA-bibliotek från tredje part som beräknar samma entydigt definierade relativa signifikans och nytta enligt COPRAS. pyDecision används medvetet: COPRAS i pymcdm { "1.4.0" } kollapsar algebraiskt till den triviala S⁺+S⁻ och är ingen trogen referens, medan pyDecision implementerar den kanoniska Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Överensstämmer till <{ "1e-9" }; kan återskapas offline via tests/fixtures/mcda_copras/generate_copras_reference.py

seg-bdb2917a2520 = CUSUM: detekteringsfördröjning och ARL

seg-302f5db625df = Värsta fallets detekteringsfördröjning (⌊h/(z−k)⌋+{ "1" }) för en tabular-CUSUM-detektor och genomsnittlig körlängd utom kontroll, som används av övervakarna för skyddsnivån för tidssynkronisering och för spoofing

seg-691a506ce13f = Publicerad ARL för tabular-CUSUM: Siegmunds ({ "1985" }) approximation med brownsk rörelse (Hawkins & Olwell { "1998" }, ekv. { "3.7" }) korsförankrad mot ARL-tabellerna i Montgomery, Introduction to Statistical Quality Control (Wiley) för k=½, h∈{ "{" }{ "4,5" }{ "}" }; den deterministiska fördröjningen överensstämmer exakt med en förstapassageoracle. Den sammansatta TPL-gränsen förblir MODELLED

seg-d923a77bd31a = Klock-holdover: utrullningsvarians och tröskelinversion

seg-4fafaf5f919d = Tillväxt av fasfelsvariansen under utrullning q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 och dess monotona inversion till en holdover-tröskel för tidsfel

seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm som beräknar den diskreta processbruskovariansen enligt Van-Loan { "1978" } Q₀₀ = ∫₀ᵗ ΦQcΦᵀds via Padé-skalning-och-kvadrering på den utvidgade { "6" }×{ "6" }-matrisen — en oberoende väg som aldrig ser kshanas polynomkoefficienter; plus optimize.brentq som inverterar samma monotona kurva jämfört med kshanas bisektion. Siffrorna för brusgolvet för rött brus per klass (ClockClass) förblir MODELLED

seg-eb3cd9e92d8d = Diversitetskärna med inverterad Simpson

seg-244d57819f2b = Effektiv arkitektonisk diversitet = inverterad Simpson / Hill-tal av ordning 2, 1/Σpᵢ², över källkvaliteter per oberoendegrupp (diversitetstermen i motståndskraftspoängen)

seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — ett oberoende bibliotek från tredje part som beräknar det entydigt definierade inverterade Simpson-indexet; återskapat byte för byte. Poängramverket DHS-RPCF (vikter och nivåer) som byggs ovanpå förblir MODELLED

seg-c14b8fe46517 = Azimutberoende skylinemask: synlig mängd, azimut och elevation samt DOP under masken

seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: den geodetiska (WGS-84) azimuten och elevationen för en satellit från en markstation, en azimut/elevations-masktabell linjärt interpolerad i azimut med omslag vid { "360" } deg, den synliga mängden el >= max(mask_deg, mask(az)) samt DOP med gemensam klocka och ENU-och-klock-kofaktormatrisen för den mängden (kärnan bakom orbit::dop). Det är så avsnittet [skyline] avgör synlighet i scenariotyperna gnss-sim, jamming, leo-pvt, leo-pass och nmea-scenario och, med markstationen user_site, i orbit och integrity

seg-bbb1828b3db1 = Reduktioner av gatukanjon, sektor och terräng till en tabell

seg-2864aec7be88 = skyline: gatukanjonen i sluten form (skär atan((h - a) / d) med d = (w/2) / abs(sin(az - s)), öppna ändar för en ändlig längd), skarpkantade sektorer medsols med omslag, samt terrängpunkter reducerade till en tabell med krökningssänkningen d^2/({ "2" } * 4/3 R); skylinen är deras punktvisa maximum med en eventuell tabell

seg-50f1df206b30 = Internt: de slutna formerna kontrolleras mot handberäknade värden (murkrönshöjder för en angiven gata, villkoret för öppen ände, krökningssänkningen för en angiven punkt). Ingen extern oberoende referens: utformningsnoten avgränsar dessa reduktioner som MODELLED, och Orekits ElevationMask tar en tabell, så jämförelsen i raden 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' läser deras 360-punktstabeller som indata och kontrollerar dem inte

seg-3f3d657854ce = Skylineförinställningar (stadsgata, hamninlopp, fjord, containerterminal)

seg-b915c06fa3f1 = skyline::PRESETS: fyra REPRESENTATIVE geometrier med utformningsnotens angivna mått och en proveniensrad var: city-street (en kanjon, gata { "0" } deg, { "20" } m mellan { "30" } m höga väggar, antenn { "1.5" } m), harbour-approach (sektorer: öppet mot havet över { "180" } deg, kajbyggnader { "8" } deg över { "90" } deg, vågbrytaren { "3" } deg), fjord (terräng: väggar { "600" } m över antennen på { "1.5" } km avstånd på vardera sidan om en nord-sydlig kanal, krökningssänkning tillämpad), container-terminal (sektorer: staplar { "12" } deg över den landvända hälften, kranbommar { "35" } deg och { "25" } deg över två smala sektorer); kan åsidosättas fält för fält

seg-44ae9b6289d9 = Ingen: valda och angivna mått, ingen kartläggning av någon gata, hamn, fjord eller terminal (gatans proportioner ligger inom bandet 0.5-2 enligt Oke ({ "1988" }); fjorden är av samma storleksordning som de västnorska fjordarna; staplarna använder high-cube-höjden i ISO { "668" }). Testet kontrollerar förinställningarna mot deras egna angivna mått, en transkriptionskontroll som valideringsregeln inte räknar

seg-2c53381d48ae = Horisontell felellips och kofaktor per system från geometrikovariansen

seg-15fea5c05cbd = geometry::sky_geometry: ENU-och-klock-kofaktorn (H^T H)^-1 med en mottagarklocka gemensam eller en per system (kärnan orbit::cofactor_from_los), och den horisontella felellipsen från dess öst-nord-block (halvaxlar k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), huvudaxelns azimut från norr)

seg-6012113b4836 = Himlageometrifunktioner: synlighet, DOP, kovarians, felellips, Monte Carlo-moln

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> och <c2/>, Python- och WASM-funktioner med samma namn, MCP <c3/>): utifrån en plats, en tid och konstellationsförinställningar (eller satelliter som azimut/elevation eller ECEF) de satelliter som är synliga och maskade under en skyline, GDOP/PDOP/HDOP/VDOP/TDOP, kofaktorn med enhetsvarians (H^T H)^-1 och kovariansen i öst-nord-upp med en mottagarklocka per system eller en gemensam, den horisontella felellipsen (halvaxlar k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientering { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) från norr), samt n slumpade minstakvadratfel med frö under oberoende gaussiska avståndsfel med deras empiriska kovarians, RMS och { "95" } % inneslutning. Kofaktorn är orbit::cofactor_from_los, den enda kärnan bakom orbit::dop och orbit::dop_cov (dop är en reduktion av dop_cov): ingen andra DOP-implementation

seg-aa0da1028636 = DOP-faktorerna för en enda klocka vilar på kärnan som är validated mot gnss_lib_py { "1.0.4" } (raden 'GNSS geometry / dilution of precision (DOP)'); den här radens egna kontroller är interna: sky_geometry återskapar orbit::dop och dop_cov på samma geometri, ellipsen återskapar en analytisk 2x2-egenvärdesuppdelning, ECEF- och azimut/elevations-indata stämmer överens, och molnets med frö RMS och { "95" } % inneslutning stämmer överens med geometrin. ENU-kovariansen med en klocka per system och ellipsen är VALIDATED i raden 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); det som förblir MODELLED här är sammansättningen: förinställningens propagering till en representativ himmel, Monte Carlo-molnet (kontrollerat mot geometrin det samplar, en kontroll av självkonsistens) och ytorna. Konstellationsförinställningarna ger en representativ himmel, inte en daterad; den gaussiska felmodellen och UERE är angivna indata, inte en uppmätt noggrannhet eller en integritetsgräns

seg-7f66be0f15c8 = Klock-holdover utan GNSS

seg-4d8f87668a0f = Tillväxt av utrullningsfel i sluten form + holdover till tröskel; kvantklockklasser

seg-2d260626e3d2 = Flerstegsrekursion för clock_state-kovarians (korskontroll inom samma kodbas); den underliggande kärnan för utrullningsvarians och holdover-inversion är externt validated mot scipy (se 'Clock-holdover coast-variance & threshold inversion'). Holdover-siffrorna per klass för det röda brusgolvet förblir MODELLED

seg-29b482d88916 = Uppmätta klockenhetskort (förutsägelse på undanhållen datamängd)

seg-8c68c5b25004 = clock_library: ett enhetskort (vitt fasbrus, vitt, flicker och slumpvandrings-FM plus ett linjärt frekvensdrift) anpassat till en tredjedel av en namngiven uppmätt klockpost efter en loggad konditioneringsomgång (luckor, fasavvikare, fassteg och skurar borttagna; frekvenssteg loggade), viktat med de frihetsgrader för brustyp som identifierats med lag-1, och dess förutsagda Allan-avvikelse poängsatt på de undanhållna två tredjedelarna; läsare för RINEX- och IGS-klockfiler, BIPM-filer per laboratorium och Circular T avsnitt { "1" }; omvandling av ett kort till brusmodellen för slottiming, den utökade Kalman-klockmodellen och brusnivåerna för spoofing-övervakaren

seg-5097a0e6460d = Uppmätta klockkort för GPS Block IIF med termer per varv (förutsägelse på undanhållen datamängd)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: ett enhetskort som bär fastermerna med en till fyra perioder per varv (period T/k, T = { "43 082.05" } s), anpassade gemensamt med den kvadratiska termen med minsta kvadrat på en tredjedel av en uppmätt satellitklockpost, där varje terms Allan-bidrag i sluten form { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } ingår i den förutsagda Allan-avvikelsen

seg-0d72fcc0fbea = Tillståndsskattning av klockan ombord

seg-6db5391f8ebe = Kalmanklocka med 3 tillstånd (fas/frekvens/drift) enligt van-Loan, Joseph-stabiliserad

seg-3f0a9d7c2971 = Felbudget för tidsöverföring

seg-216f46b43860 = Tvåvägs/TWSTFT (Sagnac), GNSS common-view, PPP; länkjitter till avstånd

seg-e7b6aac2ec58 = Sagnac-storleken kontrollerad mot ett auktoritativt PUBLICERAT VÄRDE — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), ekv. { "1.29" }: ett östvänt varv runt ekvatorn ackumulerar { "207.4" } ns (2ωA_E/c²); kshana återskapar { "207.386" } ns. Oberoende styrkt av RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bär samma 2Aω/c²-geometri. Den sammansatta budgeten för BIPM TWSTFT-transponder/common-view/PPP har ingen extern oberoende referens, så förmågan förblir Modelled

seg-157fadeb5d67 = Navigationssignalers modulering och kodföljningsanalys

seg-ab633d191396 = BPSK-R/BOC PSD, spektral separation κ, Gabor-bandbredd, DLL-jitter, flervägsutbredning

seg-589e0053e3e8 = Generering av spridningskod för GPS L1 C/A

seg-782d4da75b59 = G1/G2 LFSR-generator för C/A-kod som återskapar de i IS-GPS-200 publicerade oktala verifieringsvektorerna för de första 10 chipen för PRN { "1" }–{ "9" } (plus längd 1023 chip, balans med 512 ettor, trevärd periodisk autokorrelation)

seg-473f24d4e06a = IS-GPS-200 tabell 3-Ia 'Code Phase Assignments' — de auktoritativa, publicerade OKTALA verifieringsvektorerna för de första 10 chipen från den amerikanska statsmakten (public domain; GPS Directorate, navcen.uscg.gov); kshanas egen G1/G2-LFSR återskapar varje vektor för PRN { "1" }–{ "9" } exakt. De efterföljande slutna formerna för modulering/SSC/DLL förblir Modelled (separat rad)

seg-e6c08e1e6ae3 = Prestanda för kvantinertialsensor

seg-d28e1f6a430f = Accelerometer med kallatominterferometer från första principer (k_eff·T², QPN)

seg-4b79d03cecf5 = Fringe-tvetydighet / dynamiskt område för kvantinertialsensor

seg-deb2850546d5 = Dynamiskt område för fringe-tvetydighet i Mach–Zehnder: den 2π-periodiska fringe-avläsningen sätter en största entydiga specifika kraft a_max=π/(k_eff·T²), och det entydiga området i upplösningsceller a_max/σ_a=π/σ_Φ är oberoende av den optiska skalfaktorn — förstärkningen i känslighet med T² kostar entydigt område i exakt samma takt (avfrågningstiden växlar upplösning mot område, och antalet celler fastläggs av avläsningens fasbrus)

seg-7603ff7a7693 = Självkonsistens i interferometerns fringe-modell: halvfringe-kanten, den 2π-periodiska aliasstrukturen och skalfaktorns utjämning i kvoten mellan område och upplösning är algebraiska identiteter i sluten form som kontrolleras mot motorns egna Mach–Zehnder-fas- och känslighetsfunktioner — kontroller av intern konsistens, INTE en extern datamängd, så raden förblir InternalConsistency. MODELLED idealisk tre-puls fringe-tvetydighet; inga gränser för vågfrontsaberration eller kontrastförlust på det entydiga området

seg-d04bf321d4a1 = Motståndskraft för kvantinertial dödräkning

seg-c4989abb5d40 = Sammansatt positionsbudget för bias + skalfaktor + VRW + stabilitetsavtagande under holdover

seg-bfe4085115c1 = Oberoende numpy-Monte Carlo-SDE-integrering av dubbelintegrerat vitt accelerationsbrus (validerar den analytiska VRW-variansen med en verkligt oberoende algoritm) + ett publicerat värde som förankring enligt Groves { "2013" } för termerna för bias och skalfaktor; CAI-enhetssiffrorna kvantifierar partnerns hårdvara och förblir MODELLED

seg-bc6e733c39b3 = GNSS/INS-sensorfusion

seg-16514286bb51 = EKF med 15 felstillstånd, löst kopplad (validated på en verklig IMU/GNSS-körning mot NaveGo); en tätt kopplad UKF för pseudoavstånd/Doppler och ett kopplat klock- och positionsfilter (endast konsistens, utanför det validated påståendet)

seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, körs som verktyg under GNU Octave, aldrig länkad): dess löst kopplade ins_gnss på dess egen verkliga IMU/GNSS-körning med landfordon med Ekinox, där båda lösningarna poängsätts mot Ekinox referensbana. Båda filtren läser samma float32-indata med { "20" } Hz, och Kshanas konfiguration översätts mekaniskt från datamängdens publicerade parametrar. Kshanas horisontella och vertikala positions-RMS och dess RMS för positionsinnovation ligger inom 1.2x av NaveGos (uppmätt { "0.912" }, { "0.940" } och { "0.861" }) och dess normaliserade medelinnovation är högst { "1.5" } (uppmätt { "0.395" }: ungefär 2.5x underkonfident, givet datamängdens angivna GNSS-sigma); toleranserna fastställdes före jämförelsen. Omfattning: GNSS finns med { "5" } Hz under hela körningen, så inget avbrott eller utrullning testas och kontrollen fångar grova filterfel snarare än finjustering (råa positionsbestämningar med korrigerad hävarm skulle hamna nära den vertikala tröskeln); hävarmstransformen beräknas i testselen. Den tätt kopplade UKF och det kopplade klock- och positionsfiltret behåller sina konsistenskontroller med filterpy { "1.4.5" } (linjära posteriorer till { "2.4e-12" }) och förblir utanför det validated påståendet

seg-5692c7b936b6 = Motståndskraft mot jamming utan GNSS

seg-f4ff77caa47b = Geometrisk J/S-länkbudget, C/N₀ med jamming-skydd, signalförlust per satellit

seg-ff90679d1de9 = Detektering av spoofing

seg-b843f63e77e6 = Klockstödd χ², RAIM, AGC, SQM sammanvägda till ett säkerhetskvalitetsmått per epok

seg-b10d07921f5e = Skyddsnivå för tidssynkronisering (Timing Protection Level) vid spoofing

seg-2a829711b997 = Gräns i sluten form för värsta fallets oupptäckta tidsfel = övervakarens golv + oscillatorns utrullnings-σ över CUSUM-detekteringsfördröjningen, redovisad som ett band för det röda brusgolvet

seg-0ec37553bbc4 = Missionsanalys för cislunar rymd

seg-a47465f682ba = CR3BP STM + korrigerare med enkelskjutning och differentialkorrektion; södra NRHO runt L2

seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; Earth–Moon L2 södra halo-familjen, metodik enligt Howell/Davis) — externt publicerad period T, Jacobi-konstant C och initialvillkor för vinkelräta korsningar; kshanas STM-korrigerare med enkelskjutning, initierad med katalogens initialvillkor och störd, konvergerar tillbaka till katalogens medlemmar

seg-f1d49eac89f8 = Alternativ / kompletterande PNT

seg-023dda973f66 = Matchning mot gravitationskartor, terrängreferens (TERCOM/SITAN), magnetisk anomali

seg-da869d48e505 = IGRF-14-koefficienter; CRLB för matchat filter från första principer. Fältet i benchmarken för verkligt gravitationsfält kontrolleras externt (raden 'Gravity-anomaly synthesis from a spherical-harmonic model'), men dess navigeringsresultat har ingen extern oberoende referens

seg-db7767ab661d = Syntes av gravitationsanomali från en sfäriskt harmonisk modell

seg-2db367c4a473 = Gravitationsanomali i sfärisk approximation (Barthelmes STR09/02 ekv. { "126" }, ICGEM gravity_anomaly_sa) från fullt normaliserade koefficienter mot en nivåellipsoid i sluten form (WGS84/GRS80), med nollgradstermen, rasterlagd för matcharen av gravitationskartor

seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), en oberoende implementation: EGM2008 avkortad vid grad { "70" }, gravity_anomaly_sa, WGS84, tidvattenfri, nollgradsterm, h = { "0" }. Tjänstens utdata har ingen uttrycklig licens, så rastren hämtas vid testtillfället med en fastlåst SHA-256 (tools/fetch_icgem_grid.sh) och endast tio värden citeras med angivande av källa

seg-31f51d4998cb = Läsare för digitala höjdmodeller (SRTM) på verklig terräng

seg-08ea4ae0b671 = Egenutvecklad SRTM .hgt-parser (16 bitar big-endian, norra raden först, medveten om tomrum) + bilinjär samplare som läser en verklig DEM-ruta i public domain och löser en dokumenterad lantmäteribenchmark

seg-aae487789add = NASA/USGS SRTM v3 (1 bågsekund) ruta N36W117 — höjddata i PUBLIC DOMAIN från den amerikanska statsmakten, från den öppna AWS-spegeln elevation-tiles-prod, decimerad till 6 bågsekunder och incheckad under tests/fixtures/terrain/ (se NOTICE.md), plus beskärningar i full upplösning av N36W117 och N36W119 korskontrollerade nod för nod mot GDAL:s oberoende SRTMHGT-läsare och lantmäteribenchmarkarna Mount Whitney ({ "4421" } m) och Badwater (−{ "86" } m). Den dokumenterade benchmarken Badwater Basin (−{ "86" } m, lägst i Nordamerika) förankrar den georeferenserade avläsningen. Terrängmatchningen/TERCOM-positionsbestämningen som använder DEM förblir Modelled (separat rad för Alternativ/kompletterande PNT)

seg-791e7285c291 = Reproducerbarhet och programvaruförsäkran

seg-7177355a482c = Deterministiska grindar med scenariohash, SBOM och golden-filer över plattformar

seg-6cf9d570cc51 = SBOM som följer det officiella JSON-schemat för CycloneDX { "1.5" } (+ giltiga SPDX-identifierare) — en extern publicerad standard, noll valideringsfel över hela beroendegrafen; den del som rör determinism och byte-reproducerbarhet för FoM förblir en fastlåst självkonsistenskontroll, så raden förblir MODELLED

seg-89b2114542bb = Utvärdering av AI/ML-detektering av RF-störningar ({ "13494" })

seg-241f2eeaef12 = Märkt syntetiskt störningskorpus + detektoroberoende sele för ROC/AUC/förväxlingsmatris/Pfa-Pmd; läckageskydd, stratifierad uppdelning, rapport om optimism vid fördelningsskifte (inom mot utanför regimen). Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/impairment-eval.toml)

seg-72a3c97ef04b = AUC-gränser i sluten form (Mann–Whitney) + en perfekt oberoende detektor; korpuset är SYNTETISKT (parameterförankrat, inte fält/IQ)

seg-c38ebee794b3 = Studie av optimismgapet vid AI/ML-detektering av RF-störningar och en gapprediktor enbart med ID

seg-642087659fda = Kontrollerad syntetisk studie av optimismgapet i AUC mellan inom och utanför fördelningen över detektorer med publicerade metoder och inlärda detektorer (logistisk regression / MLP med ett dolt lager): trender enligt skalningslag per klass (Spearman ρ + lutning på { "1" }−svårighetsgrad) och en ridge-prediktor enbart med ID som skattar gapet endast utifrån diagnostik inom fördelningen, poängsatt med lämna-en-detektor-utanför och lämna-en-klass-utanför. Reproducerbart via <c1/>

seg-c46973920f5b = Handhärledd statistik mot slutna former (binormal AUC Φ(d'/√{ "2" }), DeLong-varians, Spearman med tied-rank, exakt OLS-återvinning) + korsvalidering med utelämnande av en mot baslinjen att förutsäga medelvärdet. Korpuset är SYNTETISKT (parameterförankrat, aldrig fält/IQ) och optimismgapet är ett skifte i svårighetsgrad från syntetiskt till syntetiskt, INTE ett resultat från simulering till fält

seg-fd6424213d1f = Kvant mot klassisk PNT-avvägning och motståndskraft utan GNSS ({ "13503" })

seg-21b2b54200a8 = Inläsning av uppmätt ADEV (NNLS), avvägningstabell (holdover för tid/inertial + nytta), kuvert för motståndskraft mot tid; golvförbehållet följer med i artefakten. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/quantum-trade.toml)

seg-37d11937c966 = Kärnan för anpassning av uppmätt ADEV till PSD (NNLS) stämmer med scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — en oberoende extern kärna; men avvägningens SIFFROR kvantifierar (validerar aldrig) en partnerklocka/CAI, så själva avvägningen förblir MODELLED, utan validerings-gloria

seg-1fa865bfddd1 = Rymdväder och aktivitetsdriven termosfärisk densitet

seg-47308f611c7e = Sol- och geomagnetiska index (definitionstabell Kp↔ap), exosfärstemperaturen enligt Jacchia-1971 och den termosfäriska densiteten enligt Jacchia { "1971" } (SAO Special Report { "332" }: statiska diffusionsprofiler som återskapar dess tabell { "7" }, med dygnsvariation samt geomagnetiska, halvårs-, säsongs-latitud- och heliumvariationer) mot den statiska atmosfären USSA76. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/space-weather.toml)

seg-29bedb28c34f = CCSDS OEM-interoperabilitet (import av efemerider från GMAT/Orekit/STK)

seg-edb58ffbbb5b = CCSDS { "502.0" } OEM-importerare (parse_oem), tolerant mot COMMENT-rader / extra metadatanyckelord / kovariansblock och den exakta inversen av skrivaren; rundtur + inläsning av extern fil med en hastighetskonsistenskontroll. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/oem-interop.toml)

seg-bc507f96c4df = Oberoende CCSDS-502-parser från tredje part <c1/> { "0.4.5" } (MIT, https://pypi.org/project/oem/) — en separat kodbas som avkodar kshanas utsända EME2000/UTC-OEM byte för byte identiskt ({ "24" } tillstånd över { "2" } fixturer, pos/vel Δ = { "0" }) och vars strikta läsare bekräftar metadatatoken; kshanas parser stämmer likaledes med den på en medföljande extern OEM. Två ärliga interoperabilitetsfynd (biblioteket oem avvisar kshanas konvention med flera segment per satellit och dess kovariansrader med flera poster) är dokumenterade i testet — så detta validerar utbyte av enskilda objekt som följer standarden, inte att varje kshana-variant fullt ut följer CCSDS-502

seg-c76b8c395ef0 = Uppskjutningsfönster och uppstigningsgeometri (missionsanalys)

seg-6066c634faba = Tvåkropps-uppskjutningsazimut (sin Az = cos i / cos lat), lägsta nåbara inklination, cirkulär hastighet, jordrotationens bonus österut, Δv för plansbyte med dogleg och dagliga tillfällen, och, givet en epok och rader från IERS finals2000A, platshastigheten kring den sanna polen (launch::site_rotation_speed_at). Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistisk återinträdeskorridor (Allen–Eggers)

seg-c3f3422f96e4 = Maximal retardation (oberoende av ballistisk koefficient), hastighet och höjd vid maximal g-kraft samt hastighet vid maximal uppvärmning för ett ballistiskt inträde i en exponentiell atmosfär. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/reentry.toml)

seg-8c10b50407d3 = Fotavtryck och täckningsgeometri för EO-nyttolast

seg-45c1e799c87c = SMAD-geometri med rymdtriangel: jordens vinkelradie, svepbredd, GSD i nadir, maximal åtkomst utanför nadir och cirkulär period, plus den nodala perioden för J2 av första ordningen (eo_payload::j2_nodal_period) och markspårsavståndet vid ekvatorn R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) med en flagga för sammanhängande täckning, för en banhöjd, inklination och sensorns FOV/IFOV. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/eo-coverage.toml); dess standardinklination är den solsynkrona från eo_payload::sun_synchronous_inclination, ett bekvämlighetsvärde som inte ingår i det validated påståendet

seg-940692c550f3 = CCSDS Space Packet ({ "133.0" }) TM/TC-inramning

seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet: kodning och avkodning av primärhuvudet (version/typ/sekundärhuvud/APID/sekvensflaggor/räknare/datalängd) + ett inramningsscenario. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/space-packet.toml)

seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — en oberoende implementation från tredje part av CCSDS 133.0-B-2; kshanas encode_packet/decode_packet stämde byte för byte (primärhuvudet på 6 oktetter för { "33" } fall + hela det kodade paketet för { "12" })

seg-5510c82f671a = CCSDS Space Packet: sekundärhuvud, paketfelskontroll och segmentering

seg-7503bf761df9 = Tillägg i CCSDS 133.0-B-2 Space Packet vid sidan av primärhuvudet: ett sekundärhuvud med en tidskod enligt CCSDS 301.0-B (CUC eller CDS, explicit eller implicit P-fält) och hjälpdata, fältet CRC-16 för paketfelskontroll, segmentering av en stor användardataenhet och dess återsammansättning, strömavkodning med kontroller av sekvensluckor och ordning samt PUS-TM-paket. Utdata för primärhuvudet är byte för byte identiska med tidigare

seg-af843a3a830a = <s1>space_packet (TimeCode, SecondaryHeader, paketfelskontroll, segmentering och återsammansättning, strömavkodning)</s1>

seg-7c61da52b8f8 = Export av SPICE SPK (typerna { "9" } och { "13" })

seg-582ce23522f6 = Skrivare och läsare för NAIF SPICE SPK-kärnor av typerna { "9" } (Lagrange, ojämna tidssteg) och { "13" } (Hermite, ojämna tidssteg), med DAF-layout, segmentbeskrivare och epokkataloger, samt export av en CCSDS OEM till en SPK-kärna (UTC- eller TDB-epoker till efemeridtid)

seg-d699104fc2af = SPICE SPK-typerna { "3" } och { "21" } (Chebyshev, utökade differenslinjer)

seg-7d3e8b5b40af = Skrivare och läsare för NAIF SPICE SPK-segment av typ { "3" } (Chebyshev-polynom för position och hastighet över fasta intervall, grad { "0" } till { "27" }) och typ { "21" } (utökade modifierade differensmatriser, differenslinjerna i JPL:s integratorer, MAXDIM { "15" } till { "25" }), från givna poster, i filer som även innehåller segment av typ { "9" } och { "13" }; val av post och utvärdering i samma ordning som SPICE-läsarna. Kshana anpassar inte Chebyshev-koefficienter och producerar inga differenslinjer

seg-39517faae95c = CCSDS Attitude Data Messages (AEM, APM)

seg-f88f6ea002c8 = Skrivare och läsare för CCSDS 504.0-B-2 Attitude Data Messages i KVN och NDM/XML: AEM version { "2.0" } (och { "1.0" } i KVN, med dess ATTITUDE_DIR, QUATERNION_TYPE och numeriska rotationssekvenser) med lägestyper för kvaternion, Eulervinklar och spinn och deras derivata-, vinkelhastighets- och nutationsvarianter, flera segment; APM version { "2.0" } med block för kvaternion, Euler, vinkelhastighet, spinn, tröghet och manöver; A-till-B-kvaternionen för en post (504.0-B-2 bilaga F)

seg-5f26f879037e = CCSDS Orbit Data Messages (OPM, OMM, OCM)

seg-eaddfd311fea = Skrivare och läsare för CCSDS 502.0-B-3 Orbit Data Messages i KVN och NDM/XML: OPM { "3.0" } och { "2.0" } (tillståndsvektor, oskulerande keplerelement, rymdfarkostparametrar, kovarians, manövrar, användardefinierade parametrar), OMM { "3.0" } och { "2.0" } (medelelement via medelrörelse eller halv storaxel, TLE-relaterade parametrar med BSTAR eller BTERM och AGOM, kovarians) och OCM { "3.0" } med bana (CARTP, CARTPV, CARTPVA; absoluta eller relativa epoker), fysikaliska egenskaper, kovarians (CARTP, CARTPV i LTM-ordning), manöver och användardefinierade block; en OMM med full precision från en SGP4-elementuppsättning vid sidan av den oförändrade OmmFile::to_omm_kvn

seg-1e5ea1d9918d = Felbudget för lägesreglering och pekning med 3 frihetsgrader (AOCS)

seg-21f2f8efcf19 = Gravitationsgradientens störmoment i värsta fall ((3/2)(μ/R³)ΔI) som toppvärdet över lägen (det validated påståendet), plus en RSS-budget för pekfel över namngivna bidrag på 1σ med den dominerande termen (en kvadratsumma av tal som anroparen anger, utanför det validated påståendet). Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/attitude-budget.toml)

seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), en oberoende C++-implementation av gravitationsgradientmomentet med fullt tensorvärde: Kshanas topp (3/2)(μ/R³)ΔI är lika med Basilisks moment vid läget { "45" } deg inom { "1e-12" } relativt (sämst { "2.1e-15" }) över { "5" } höjder och { "8" } tröghetstensorer, och begränsar Basilisks moment över { "2000" } slumpade lägen per fall; toleransen fastställdes före jämförelsen. Validated påstående: toppen av gravitationsgradientmomentet. RSS-pekbudgeten är en kvadratsumma av tal som anroparen anger, utan extern sanning, och förblir utanför det; den handkodade maximeringen av hela tensorn med Hipparchus finns kvar som stödjande självkonsistens. Ingen simulering av reglerloop/6-DoF/flexibla moder

seg-1461aa14a7ff = Prediktion av överflygningar för markstation (marksegment)

seg-e1cf1ec4f005 = Synlighetspass i tidsdomänen (AOS/TCA/LOS, maximal elevation, varaktighet) för en motorpropagator över en station ovanför en elevationsmask, med interpolerade uppgångs- och nedgångskorsningar och total åtkomst: passes::predict_passes, den geometriska schemaläggaren (ingen refraktion eller ljustid). Scenariotypen <c1/> kör den skenbara prediktorn i raden 'Apparent ground-station pass prediction with refraction and light time'

seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — ett oberoende bibliotek för flygdynamik: ElevationDetector (Brents rotlösare) + EventsLogger över en ITRF-efemerid, stationen som en WGS-84 TopocentricFrame. AOS/LOS/maximal elevation/antal pass/total åtkomst stämmer på identisk bana + station + mask + fönster (incheckad fixtur; drivrutin xval/orekit-passes)

seg-1dd8b2655b18 = Skenbar prediktion av markstationspass med refraktion och ljustid

seg-46f93d3c24d2 = Synlighetspass (AOS, TCA, LOS, maximal skenbar elevation, varaktighet) för en SGP4-elementuppsättning över en WGS-84-station på den validated jordbanevägen (IAU 2006/2000A, valfria jordorienteringsparametrar), med troposfärisk refraktion enligt ITU-R P.834-9 (ekvationerna { "9" } till { "14" }, rekommendationens tryckta koefficienter) och nedlänkens ljustid, var och en möjlig att slå på och av; korsningar lösta med bisektion till { "1e-7" } s och kulminationen med gyllene snittet. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/passes.toml), båda korrektionerna på som standard

seg-7b4a8e25c3c9 = Adaptiv kodning och modulering enligt DVB-S2 längs ett LEO-nedlänkspass

seg-3912fb8ccb15 = Es/N0 i nedlänken längs varje pass för en satellit över en station (EIRP, fritt rumsdämpning, atmosfärsdämpning enligt cosekantlagen, övriga förluster, G/T, Boltzmanns konstant, symbolhastighet), den mest effektiva MODCOD i DVB-S2 som klarar sin kvasifelfria tröskel i ETSI EN { "302" } 307-1 V1.4.1 tabell { "13" } plus en implementationsmarginal vid varje steg, passets ACM-datavolym samt baslinjen med konstant kodning som sluter vid masken och längsta avståndet. Kan köras som scenariotypen <c1/>. Illustrativa indata; MODELLED.

seg-a7f26e3a6030 = Intern konsistens: spektraleffektiviteten som beräknas i sluten form från tabell 5a K_bch och ramlängderna stämmer med de effektiviteter som tabell { "13" } anger (en transkriptionskontroll av tröskeltabellen); länkbudgetens delar stämmer med sina slutna former; urvalet är monotont i Es/N0 och respekterar marginalen; ACM flyttar minst lika stor volym som konstant kodning. Passgeometrin kommer från den separat VALIDATED skenbara passprediktorn. VAD SOM INTE GÖRS: inget externt verktyg eller uppmätt länk har jämförts; trösklarna är standardens ideala AWGN-värden, inte ett modems; regnfädning, pekförlust längs passet och piloter modelleras inte.

seg-19603a7e0fe8 = Schemaläggning av markkontakter för flera satelliter och flera stationer med konfliktlösning

seg-40edeae6e48b = Kandidatkontakter från varje pass mellan satellit och station med dess ACM-datavolym; konflikter där en antenn skulle betjäna två satelliter inom sin omställningstid eller en satellit skulle sända ned till två stationer samtidigt; ett prioritetsviktat leveransmål begränsat av varje satellits kö; en lat plan med girig marginalnytta, en baslinje med först-till-kvarn och en exakt branch and bound på upp till { "26" } kandidater, med den giriga planens optimalitetsgap redovisat. Kan köras som scenariotypen <c1/>. Illustrativa indata; MODELLED.

seg-bc520db98f9a = Intern konsistens: den exakta branch and bound stämmer med uttömmande uppräkning på små slumpmängder, varje plan kontrolleras vara genomförbar mot konfliktreglerna, och den giriga planen slår aldrig det exakta optimumet. VAD SOM INTE GÖRS: ingen extern schemaläggare eller operativ plan har jämförts; kontakter tas hela (ingen delning), kön är fast vid fönstrets början, svängtid utöver den fasta omställningstiden och ombordlagring modelleras inte.

seg-ddf2bc2f13a9 = Enkelriktad länkbudget (kommunikation / länkutformning)

seg-83331f513dba = Fri rumsdämpning, C/N₀, Eb/N₀, marginal och sluten länk över länkekvationen i CCSDS { "401" } / DSN 810-005 för EIRP/G·T/avstånd/hastighet/band mot ett krävt Eb/N₀. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/link-budget.toml)

seg-195bf7e31f24 = Publicerad designkontrolltabell för telekom i djuprymden som fastlåsta numeriska vektorer: DESCANSO / J. H. Yuen (red.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tabell 1-1 (Galileo X-band) — kshana sätter ihop tabellens delposter och återskapar dess publicerade totala L_fs { "290.54" } dB och Pr/N0 { "54.6" } dB-Hz; fri rumsdämpning kontrolleras också mot ITU-R P.525

seg-3742d2aea62a = Sparsam inramning av kostnad per täckning / ROI

seg-4228311689f8 = Kostnad per procent täckning + täckning per euro som ROI över motorn för konstellationsdimensionering; kostnaden per satellit är ett låg/nominellt/högt intervall som anroparen anger källan till (inga påhittade priser)

seg-d542ac64c31c = Kostnadsaritmetik i sluten form mot handhärledda värden; en ekonomisk INRAMNING av ett modellerat täckningstal, inte en offert eller en validated kostnadsmodell

seg-8ba6ee9acc8a = Integritetspåverkan av missad detektering (kontextmedveten HPL/VPL mot larmgräns)

seg-f5985399d0d5 = Avbildar en oupptäckt spoofing- eller jamming-bias på effektivt fel → Stanford-region (tillgänglig/otillgänglig/MI/HMI) mot kontextspecifika HAL/VAL (öppen himmel mot urban)

seg-124d0ffe959e = Sätter ihop den externt validated Stanford-klassificeringen för RAIM (raim::classify_stanford); själva avbildningen från missad detektering till larmgräns är modellerad, inte en certifierad integritetsallokering

seg-37d43b5b918a = Parameterblad med citerade felmodeller för CAI ({ "13503" })

seg-0b6a901f5ad2 = Intervall (bäst/nominellt/konservativt) för prestanda hos kallatominterferometer — biasinstabilitet, slumpvandring i hastighet/vinkel, skalfaktorstabilitet, avfrågningsbegränsad samplingstakt, dynamiskt område för fringe-tvetydighet — var och en spårbar till en referens; matar QuantumNavBudget utan att modellera hårdvara

seg-4b66096727b8 = Intern konsistens: det citerade VRW-intervallet korskontrollerat mot fysiken i CaiAccelerometer::accel_asd + råa dynamiska området beräknat från gränsen för fringe-tvetydighet; talen är MODELLED intervall från en litteraturgenomgång (needs_source_confirmation), ingen enhet validated, ingen validerings-gloria

seg-c93f2d3a3167 = Benchmark för tidsintegritet — epokklassificerare med Stanford-integritetsdiagram

seg-712d5c35a6a6 = Epokklassificering med TIB Stanford-integritetsdiagram (nominell / otillgänglig / MI / HMI)

seg-93b913e60063 = Oberoende numpy-omimplementation av regeln med fyra regioner (scripts/gen_tib_scorer_reference.py) på samma urval; metod Cited från Stanford–ESA-integritetsdiagrammet (Tossaint et al., ION GNSS { "2007" }) och RTCA DO-229 WAAS MOPS. INTE en ExternalDataset-noggrannhetsreferens — benchmarken är immun mot ärlighetsproblem (honesty-immune).

seg-573aa0193cb3 = Benchmark för tidsintegritet — poängsättare för integritetstäckning

seg-4d86f3c2d8f5 = Poängsättning av TIB-integritetstäckning (andel HMI/MI/tillgänglighet + utlåtande om överskridande täckning)

seg-645eb084ae8e = Oberoende numpy-omräkning av regioner i tests/fixtures/tib/reference.json; endast korskontroll av poängsättarens maskineri, inget noggrannhetspåstående.

seg-372dd0fdb025 = Benchmark för tidsintegritet — felkatalog (parametriska generatorer)

seg-2604e7cf27d2 = TIB-felmeny (domändivergens, klockslam, holdover-utrullning, statisk/inkrementell/symmetrisk/asymmetrisk fördröjning, replay inom färskhet, vägselektiv, k-av-N-kvorum)

seg-b907aecaccd0 = Representativa parametriska felgeneratorer (Modelled); den icke detekterbara mängden (symmetrisk fördröjning, replay inom färskhet) är Cited från Mizrahi RFC { "7384" } och Narula & Humphreys (IEEE JSTSP { "2018" }). Ingen extern oberoende referens — en felkatalog gör inget uppmätt påstående.

seg-90c0eb1e7c14 = Benchmark för tidsintegritet — utlåtande om absorption av icke detekterbara fel

seg-f713acf042ff = TIB-utlåtande om absorption av icke detekterbara fel (symmetriska/replay måste absorberas av PL, aldrig rapporteras som detekterade)

seg-6840c2467c63 = Egenskapskontroll att enumen Verdict strukturellt inte kan rapportera ett icke detekterbart fel som detekterat (Mizrahi RFC { "7384" }); absorberat ⟺ PL ≥ offset. Ingen noggrannhetsreferens.

seg-3652a591eefc = Ingenjörsarbete för rymdfarkostbuss (AOCS/termik/strukturer/framdrivning/effekt)

seg-50a9c1c7dff0 = Tillhandahålls inte — Kshana är en simulator för navigeringsprestanda, inte en bussleverantör

seg-a349aa76b0ed = PARTNER

seg-b28dd62dca1c = Hårdvaruutformning av navigations-RF-nyttolast och antenn

seg-76c983a23e7b = Tillhandahålls inte — Kshana modellerar signalprestanda, inte hårdvara för nyttolast eller antenn

seg-7bba3b35214c = Hårdvaruutformning och mognadsutveckling av kvantnyttolast

seg-15fcc200b859 = Tillhandahålls inte — endast prestandamodeller; hårdvara för kallatomer och klockor är en partners

seg-d69dd4c5167b = Produktförsäkran för flygburen hårdvara (strålning/EEE/MAIT)

seg-b1540f78ffd4 = Tillhandahålls inte — Kshana behandlar bara PA för programvara; PA för flygburen hårdvara är en partners

seg-1f200f8efc71 = Lunar koordinattid

seg-2e6961dbffe9 = Relativistisk klockgång Jorden–Månen (LTC/TCL) + kedja TT/TAI/UTC + ensemble

seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; grund för IAU/IAG LunaNet LTC): Månens ytpotential L_m = { "3.13881e-11" } och sekulär totalsumma { "56.02" } µs/dygn stämmer som publicerade numeriska värden; geocentrisk månhastighet korskontrollerad mot JPL DE440 (de440s.bsp via SPICE)

seg-8adbbd2cdb74 = Självbeskrivning i rapporten för hybrid optisk/RF

seg-2a5e48b558e1 = Rapporten hybrid-optical-rf anger den länkkonfiguration den faktiskt kördes med (bärvågens våglängd, sändar- och mottagarapertur, avstånd, pulsbredd, integrationstid, verkningsgrader och förluster, standardvärden uppslagna) och bär ett enhetsblock som anger enhet och proveniensklass för varje storhet som en artikel sannolikt citerar, inklusive spåren av överlämningskovariansen i kvadratmeter

seg-23f0c10237f4 = Ingen extern oberoende referens, och ingen är möjlig: detta är självbeskrivning, inte en mätning. Det registreras eftersom avsaknaden av det var en brist -- P5 var tvungen att citera bärvågens våglängd och sändarapertur från källkodens standardvärden, och att sluta sig till att en bar <c1/> var i kvadratmeter utifrån en intern konsistenskontroll. Slutsatsen var riktig, vilket är precis varför det spelade roll: ingenting hade fångat om den varit fel

seg-0691f3dee8cb = Tillgänglighet för hybridlänk optisk/RF på RF-sidan

seg-72ccb655caf0 = Rapporten hybrid-optical-rf anger en RF-länktillgänglighet, sammansatt av storheter som motorn redan beräknar snarare än av en importerad klimatologi, och anger sammansättningen som en namngiven regel: A_rf = I_closure * I_track, där I_closure är utlåtandet om sluten länk för den enkelriktade länkbudgeten enligt CCSDS-401 / DSN-810-005 (linkbudget::link_budget, Eb/N0-marginal >= { "0" }) vid scenariots eget avstånd och I_track är utlåtandet för följningsloopen (jamming::lock_status) på det C/N0 som SAMMA budget gav. Varje faktor för sin indatas proveniensklass vidare till utdata, och de faktorer som avsiktligt INTE ingår i produkten -- geometrisk synlighet, störningsblockering och en klimatologi för RF-avbrott -- namnges med skälet i stället för att tyst sättas till { "1" }. Det uppslagna RF-ledet återges som ett eget block rf_link_configuration, och de kontinuerliga talen bredvid indikatorn (länkmarginal, C/N0-marginal, de slutna formerna för sluten länk och följningsavstånd samt avståndsutnyttjandet) är avståndsinversioner av samma budget. Rapporten anger fullt ut, på blocket och i den enhetspost som en läsare hamnar på, att detta tal är MARGINAL-/GEOMETRIBEGRÄNSAT och DETERMINISTISKT medan optisk tillgänglighet är VÄDER-/KLIMATOLOGIBEGRÄNSAD och probabilistisk, så att de två aldrig kan citeras som ett jämförbart par av procenttal

seg-319705ea0166 = Ingen extern oberoende referens, och ExternalDataset avstås från. De två indata är en Eb/N0-marginal och en C/N0-tröskelkorsning, båda funktioner av en MODELLED EIRP, kvalitetsmått och sammanlagd förlustallokering; det finns ingen uppmätt tillgänglighetspost för en hybridtjänst optisk/RF mellan Jorden och Månen att kontrollera det sammansatta talet mot. De kontroller som finns är interna och anges som sådana: sammansättningen räknas om från rapportens egna publicerade marginaler snarare än från sändarens interna delar, och länkens slutningsavstånd kontrolleras genom att länkekvationen körs om VID det och kräva att marginalen försvinner -- en rundtursinversion, inte en oberoende implementation. Talets ärliga gräns är noterad på själva rapporten: det är en deterministisk 0/1-indikator, inte en sannolikhet, eftersom ingenting i den här motorn mäter en fördelning av RF-länkavbrott på det här bandet och den här geometrin. Den saknade indatan namnges i rf_availability.factors_not_included i stället för att hittas på, och att tillhandahålla den är vad en probabilistisk RF-tillgänglighet skulle kräva

seg-22c5df9b6c7c = Jämförelse mellan optisk och RF-avståndsmätning på lika villkor

seg-70eb396f40af = Rapporten hybrid-optical-rf ger kvoten mellan optisk och RF-avståndsmätning med den ENA konfiguration som båda leden utvärderades vid i samma objekt: samma enkelriktade väg, samma avstånd och samma ackumuleringstid. Det optiska ledet är motorns fotonbegränsade ToA-CRLB på det enkelriktade fotonantalet; RF-ledet är motorns termiska kodföljningsjitter för DLL med tidig-sen-korrelator vid det C/N0 som motorns egen länkbudget ger för samma enkelriktade avstånd. Loopens brusbandbredd är härledd, inte vald: B_L = 1/({ "2" }*integration_s) lägger RF-ledet på exakt den optiska ackumuleringstiden, och om en anropare åsidosätter den så att de två medelvärdestiderna skiljer sig åt blir kvoten REFUSED -- null, med avvikelsen och båda tiderna namngivna -- i stället för att anges vid två arbetspunkter. Ingen kvot bildas mot scenariots VALDA parametriska rf_position_sigma_m, och avvisningen anger varför: den indatan bär ingen konfiguration alls. Den publicerade tvåvägs optiska huvudsiffran och den exakta faktorn som överbryggar den till jämförelseledet för enkelriktad väg ges bredvid kvoten, så rapporten inte kan läsas som om den bär två oense optiska sigma

seg-acbb3ac98ee3 = Ingen extern oberoende referens för KVOTEN, och ExternalDataset avstås från avsiktligt. Den underliggande RF-kedjan har en -- tests/validate_p5_rf_ranging_precision.rs kontrollerar linkbudget::link_budget och navsignal::dll_code_jitter_chips mot en oberoende Python/NumPy-fixtur och mot det hårdkodade värdet i Kaplan & Hegartys genomräknade exempel ({ "2.814e-3" } chip / { "0.825" } m vid { "45" } dB-Hz) -- och den optiska CRLB har sin egen rad i sluten form. Att göra anspråk på någon av dessa förankringar för den här raden vore lånad validering, vilket matrisens invarianter finns för att förhindra: storheten här är en KVOT vid en konfiguration med en MODELLED EIRP, kvalitetsmått, sändareffekt och apertur, och ingen uppmätt jämförelse mellan optisk och RF-avståndsmätning vid en gemensam arbetspunkt finns att kontrollera den mot. Det som kontrolleras internt är det som kvoten faktiskt kan få fel: att de två leden ligger vid en och samma arbetspunkt. Det mäts genom att skala den gemensamma ackumuleringstiden och kräva att båda leden rör sig enligt samma kvadratrotslag och att kvoten ligger still, och det upprätthålls genom att kvoten avvisas helt när medelvärdestiderna skiljer sig åt. Båda leden är gränser för termiskt brus/skottbrus och båda utesluter mediafördröjning, klockfel och tvetydighet, så uteslutningen är identisk på båda sidor; rapporten säger det i stället för att lämna det åt slutledning

seg-3f26f598e013 = Självbeskrivning i länkbudgetrapporten

seg-b88bf41d6d4c = Länkbudgetrapporten anger varje absolut konstant som dess egen marginal beräknades från -- den bärfrekvens som den fria rumsdämpningen använde, EIRP, kvalitetsmåttet, den sammanlagda förlusten och Boltzmann-termen -- plus det G/T som krävs där marginalen är noll, länkkonstanten (EIRP - förluster - krävt Eb/N0) som är den enda kombination som en publicerad tabell över hastighet och förstärkning någonsin kan fastlåsa, och, när en anropare anger en systembrustemperatur, den mottagarantennförstärkning som det kvalitetsmåttet innebär

seg-52f98f50522f = Ingen extern oberoende referens: detta är självbeskrivning över en ekvation som redan är validerad mot en publicerad designkontrolltabell (se raden för enkelriktad länkbudget). Det registreras eftersom avsaknaden av det var ett uppmätt fel -- att återskapa den publicerade d1_rate_gain_beamwidth.csv krävde att en effektiv konstant löstes baklänges till { "0.0034" } dB utifrån alla trettio rader, och motorn både namnger nu den kombinationen och bevisar genom test att ingen publicerad tabell någonsin kunde ha skilt dess tre komponenter åt

seg-a7b192e27cb5 = Tabell över skärningspunkter för lunar tid per klockklass

seg-cab605dc6ea2 = En körning av lunar tidsbudget ger en rad för skärningspunkten mellan klocka och referenssystem per klockklass mot en enda delad systemterm, så att klockan är den enda variabeln i jämförelsen; varje rad bär skärningspunkten nådd på två sätt -- bisekterad ur den allmänna potenslagskurvan för tidsfel och inverterad algebraiskt ur radens dominerande brustyp -- med den relativa skillnaden mellan dem

seg-ccec15f0b125 = Två olika beräkningar i samma kodbas av samma storhet, inte en som upprepas: bisektion på IEEE-1139-potenslagskurvan vet ingenting om brustyp, medan den slutna formen inverterar den dominerande typen algebraiskt, så en felklassad brustyp eller ett dåligt intervall syns som en inte obetydlig relativ skillnad. De fyra värdena återskapar också artikelns publicerade tabell till hälften av dess sista tryckta siffra -- men den tabellen rekonstruerades själv ur samma slutna form, så det är en reproducerbarhetskontroll och inte en extern oberoende referens, och systemtermen den mäts mot är en Modelled allokering

seg-ff32b78acb8c = Gemensamt UT1- och polrörelsefel över en gemensam radmängd

seg-561e588153af = En tabell redovisar UT1-prediktionsfelet, polfelet för polrörelsen och deras kvadratiska kombination vid Månen över en IDENTISK epokmängd per horisont och ger de epoker som varje komponent mättes vid. Separat anger scenariot vilken EOP-indata som gäller och bryter ned dess radräkning, och ger alltid tabellen över prediktion mot slutlig horisont med ett uttryckligt påstående om varför den är tom när den är det

seg-3692f1fc89e6 = Standardindata för jordorientering offline är en verklig IERS-produkt

seg-f9a9d385fd26 = Standardvärdet vid körning för <c1/> är bibliotekets egen inbäddade kopia av ett ordagrant utdrag ur IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } konsekutiva dagliga rader, MJD 61224-61397, utskurna ur finals2000A.all från 2026-09-30) som bär alla tre radvintager som formatet definierar, klassificerade med IERS I/P-flaggorna (eop::row_vintage): { "30" } slutliga Bulletin B, { "54" } snabba uppmätta rader (flagga I utan Bulletin B-block) och { "90" } prediktioner i Bulletin A (flagga P). En bar körning utan filargument och utan nätverk ger en ifylld tabell per horisont, räkningen rader = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) och predicted_rows.n = { "90" } över MJD 61308-61397; gränsen vid utfärdandet för jämförelserna prediktion mot slutlig är den sista uppmätta raden. Det tidigare utdraget med 32 rader (tools/finals2000A_2026.txt, varje rad med flagga I) och utdraget med fem rader och enbart slutliga värden följer fortfarande med och används: på dem är predicted_rows.n { "0" }, en egenskap hos indatafilen och inte ett parserresultat

seg-18c72a7565d6 = Fångstfotavtryck mot höjd och strålbredd

seg-9c30a0ab5233 = Svep i två axlar av det mönstervägda, höjdbegränsade fångstfotavtrycket vid ytan över sändarens höjd och parabolens diameter, utsänt som en rad per arbetspunkt med den halveffektsstrålbredd som varje diameter innebär, och limbfångst redovisad som en TRÖSKEL -- per rad limbens J/S, dess marginal och den sändareffekt som skulle sluta den; per raster de lokaliserade korsningarna, eller ett uttryckligt påstående att limben inte nås någonstans på rastret, med underskottet

seg-4d866b62d4f7 = Mängdinklusion: förhållandet mellan störare och signal går in som en likformig förskjutning i decibel, så den fångade mängden vid högre sändareffekt innehåller mängden vid lägre och andelen kan bara stiga -- en egenskap som Airy-mönstret INTE ger i strålbredd eller höjd, där den fångade regionen bryts upp i ringar och andelen verkligen är icke-monoton. Ingen publicerad tabell anger den fångade skivandelen för en lunar omloppssändare mot höjd och strålbredd, så det finns inget externt att kontrollera dessa celler mot; mönstret under är separat Validated mot publicerade Besselvärden och behåller sin egen rad

seg-fc0a64b9a280 = Reproducerbarhet för lunar tidsfelsbudget

seg-5d5970506b9c = Scenariot lunar-time-budget publicerar sina matrisvärderade utdata som en tabell i långt format (rasterindex, medelvärdestid, term) vid sidan av rapporten, så att de sju kurvorna x(tau) per term och kvadratsumman av totalen är motorutdata snarare än något en läsare återbygger ur metodavsnittet

seg-62df6258bc62 = Endast självkonsistens: den publicerade totalen kontrolleras mot kvadratsumman av termerna i samma fil, och den utsända kurvan återskapar den publicerade p3_time_budget_curve.csv över alla { "57" } punkter. Båda kontrollerna delar den här motorns egna termdefinitioner, så ingen av dem är oberoende. Klocktermen vilar på publicerade klockspecifikationer, men STORLEKARNA på golven för länk, referenssystem, relativitet och efemerid är dokumenterade budgetallokeringar utan extern oberoende referens

seg-675887733454 = Lunar stationstidslaboratorium: holdover för miniRAFS mot LTC

seg-7dfedc40da6a = Det valfria blocket [time_lab] i scenariot lunar-time-budget modellerar en lunar referensstationsklocka (som standard klassen miniRAFS, eller någon namngiven klass, eller ett enhetskort anpassat till angivna stabilitetspunkter) styrd mot Coordinated Lunar Time och sedan fritt löpande eller omstyrd var N:e sekund: tidsfelskurvan x(t) som kvadratsumman av klockans potenslagsterm, en konstant styrrest (ILLUSTRATIVE), en konstant realiseringsrest för LTC och en frivillig term för stationshöjdens gång; tiden efter en styrning till { "1" }, { "10" } och { "100" } ns (eller angivna trösklar) med bisektion bredvid den slutna inversen för den dominerande brustypen, och den dominerande termen vid varje angiven horisont, alla med enheter

seg-3801e9b32309 = Endast intern konsistens: den bisekterade tiden till tröskel kontrolleras mot den slutna inversen för klockans dominerande brustyp, och den fritt löpande klocktermen mot budgetens egen klockterm. Klockklasserna vilar på publicerade endagsspecifikationer (deras egna rader); LTC-gången härleds inte på nytt här och behåller sin egen VALIDATED rad (Lunar coordinate time); styrresten är ILLUSTRATIVE, realiseringsresten är en budgetallokering och ingen termisk modell ingår. Målet på nanosekundnivå som beskrivs i materialet om Lunar PNT från ICG WG-B i juni { "2024" } citeras som ett källpåstående, inte antaget som ett påstående; inget här är ett påstående om någon verklig stationsklocka

seg-af3ff120b707 = Lunar geodetisk VLBI

seg-cfd7d0126028 = Närfälts-VLBI-fördröjning för en jordbaslinje som observerar en lunar beacon + partialer

seg-d1943f9932af = Plan-vågs delta_dor (samma kodbas) i fjärrfältsgränsen; partialer med finita differenser. Extern jämförelse { "0.30" }, ett fynd (förblir MODELLED): mot konvergerade ljustider i ANISE { "0.10" } genom DE440 ({ "75" } fördröjningar 2024-01-01 över tre DSN-baslinjer, genererade av xval/anise-lunar-od utan Kshana-kod) ligger ingen fördröjning inom toleransen { "1" } ps. Det största gapet är { "24" } µs, från den analytiska månmittpunkten (omkring { "200" } km från DE440), den enda ögonblicksgeometrin utan ljustidsiteration ({ "3.6" } µs) och den utelämnade polrörelsen; beaconpartialer skiljer sig med upp till { "2.9e-3" } relativt mot { "1e-6" }. Påståendet i modulens dokumentation att systemapproximationerna ligger under modellens noggrannhet håller inte på den här nivån. Omgång { "2" } för { "0.30" }: kärnvägen (lunar_vlbi::KernelGeometry) är validated mot NAIF SPICE-ljustider i sin egen rad, Lunar geodetic VLBI, kernel path; ANISE-jämförelsen av den vägen (75/75 inom { "1" } ps, sämst { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) är enbart en korskontroll av kärnutvärdering, eftersom ljustidslösningen i den selen är projektets egen. Den här raden (den analytiska standardvägen) förblir MODELLED med fyndet ovan

seg-d12d4565b01d = Lunar geodetisk VLBI, kärnväg

seg-11e1c942e41c = Närfälts-VLBI-fördröjning för en jordbaslinje som observerar en lunar beacon, med partialer för beacon och station, på kärnvägen (lunar_vlbi::KernelGeometry): DE440 för Jorden och Månen, DE440 lunara huvudaxlar, ITRF93-jordorientering med UT1 och polrörelse, varje ljustid konvergerad i det barycentriska systemet, partialer med ljustidsfaktorn 1/(c - u.V). Kan köras som scenariot <c1/> med planetary_kernel_path, earth_orientation_kernel_path och moon_orientation_kernel_path satta; de validated utdata är serien geometric_delay_s på kärnvägen och epoch_partials. På kärnvägen lägger delay_s till den analytiska differentierade Shapiro-termen, som inte jämförs, och delay_rate och near_field_correction_us jämförs inte

seg-1f10810131be = NAIF-kärnläsare: DAF-behållare, SPK typ { "2" } och binär PCK typ { "2" }

seg-7da4847e7a28 = Motorns egen rena Rust-läsare för binära NAIF-kärnor (naif_kernel): DAF-behållaren (båda byteordningarna, länkade sammanfattningsposter), SPK typ 2-segment med Chebyshev-position kedjade genom sina centra till en lägsta gemensam förfader, och binära PCK typ 2-segment med Eulervinklar omvandlade till en rotation från J2000 till kroppen, med epoker tagna som tvådelad ET så att en förskjutning under en mikrosekund behåller sin precision. Det är vad KernelEphemeris (ephem_provider) och kärnvägarna i lunar_vlbi, lunar_llr och lunar_vlbi_fim läser DE440 genom. Påståendet är att den läser JPL-kärnor korrekt; det är inte ett påstående att DE440, eller motorns analytiska sol- och månserier, är noggranna

seg-e08e98908f3a = Earth-GNSS på lunart avstånd

seg-dd8ce373d1f6 = Mottagning av Earth-GNSS på lunart avstånd: det svagsignalslager som P7 tabell { "1" } nämner och som motorn saknade modell för. Per satellit och per epok beräknar den vinkeln från siktlinjens axel mot sändarens nadir, om Jorden skymmer den raka vägen, det sneda avståndet och dess fria rumsdämpning, sändarförstärkningen vid den vinkeln, den mottagna effekten och bärvåg-till-brus-densiteten; därefter aggregerar den bara länkarna som klarar en följningströskel, och sveper ett helt konstellationsvarv så att svaret blir en FÖRDELNING snarare än en ögonblicksbild. Tre fakta driver resultatet och rapporten anger var och en: Jorden spänner { "13.90" } deg från konstellationsradien så att strålens TOPP är geometriskt otillgänglig för varje stråle på väg mot Månen; det som återstår är huvudlobens kant och sidolober, det regim som LuGRE arbetade i vid Månen { "2025" }; och L1-vägförlusten är omkring { "208" } dB, ungefär { "25" } dB mer än en markbunden användare betalar. MEASURED på den medföljande GPS-klassgeometrin med 24 satelliter över { "64" } epoker under en omloppsperiod: SIGNALtillgänglighet { "0.375" } med en bästa länk på { "30.93" } dB-Hz, och tillgänglighet för positionsbestämning { "0.000" } - högst två samtidigt följbara länkar, aldrig de fyra som en position behöver. Skillnaden mellan de två tillgänglighetstalen är poängen, och rapporten tillåter inte att de förväxlas: Earth-GNSS på lunart avstånd är ett lager av TIDSKVALITET, inte positionskvalitet, och ett prior för skiktad motståndskraft måste ta tillgängligheten för positionsbestämning. Konditioneringen ges av samma skäl - varje synlig satellit ligger inom en kon några grader bred sedd från Månen, så siktlinjerna är nästan parallella av konstruktion. Kan köras som typen <c1/> Omformulerat enligt D7: påståendet på lunart avstånd är den RELATIVA bärvåg-till-brus-densiteten mellan satelliter vid en epok, från uppmätta tvådimensionella sändarmönster (NAVCEN Block IIR/IIR-M), plus geometrisk synlighet; absolut C/N0 påstås inte (Parker et al. redovisar en gemensam förlust på { "7" } till { "12" } dB).

seg-29df5b40a3f9 = Lunar banbestämning: Earth-GNSS mot radiometri från marken

seg-647902ebcee3 = Banbestämning i en nästan rätlinjig halobana (eller en elliptisk fryst bana) från två oberoende datatyper: pseudoavstånd från Earth-GNSS mottagna ombord (länkregeln i raden Earth-GNSS på lunart avstånd, plus månockultation) och tvåvägs avstånd och avståndshastighet från marken från tre stationer i Deep Space Network. Var och en är en minstakvadratlösning i ett batchsteg kring referensbanan med sin formella kovarians; en Monte Carlo med frö av skillnaden mellan de två skattningarna prövar om de två kovarianserna förklarar den (q = d' (P_G + P_R)^-1 d, chi-två med sex frihetsgrader när modellerna stämmer) och vad en omodellerad acceleration gör med statistikan.

seg-226dedaba243 = Ett oberoende scipy/numpy-program integrerar samma variationsekvationer (tröskel O1). Ingenting jämförs med en mätning av en lunar bana. Den oberoende referensen kontrollerar numeriken i angivna formler, inte fysiken, så raden förblir MODELLED. Begränsad trekroppsmodell: ingen sol, inga lunara harmoniska, jordens rotationsaxel längs banans normal, ILLUSTRATIVE indata för mottagare och station.

seg-652bdc29deea = Lunar bärvågsfaslösning av heltalsosäkerhet: yta och omloppsfarkost

seg-02496f9e9af2 = Enkeldifferentierad bärvågsfas och kod från Earth-GNSS mellan mottagare vid en lunar ytstation och en omloppsfarkost, med klockdifferensen per epok profilerad bort, en heltalsosäkerhet per sammanhängande pass och det längsta passet som gauge. Kovariansen för float-heltalsosäkerheten är ett Schur-komplement; LAMBDA löser heltalen, den bootstrappade andelen redovisas bredvid en Monte Carlo-andel med frö för lyckad heltalsminstakvadratlösning och positionssigma för float- och fixerad lösning. Redovisat som funnet: vid de registrerade { "12" } dBi går dubbeldifferensproblemet inte att bilda (ändring { "1" } flyttade standardvärdet till { "25" } dBi efter att endast tillgänglighetsräkningar setts), och vid { "25" } dBi uppnås heltalsfixering INTE - utom räckhåll (några procent som mest) även om float-lösningen förbättras med bågen.

seg-8d8296752eb8 = En oberoende numpy-lösning av samma normalekvationer från de exporterade raderna (Q3) och en uttömmande heltalsuppräkning (Q4). Ingen GNSS- eller lunar bärvågsfasmätning jämförs med. MODELLED.

seg-11dd1bb8e4e1 = Lunar samestimering av referenssystem: ytstationer och omloppsfarkoster

seg-a38c8d95e6c9 = Fisher-information för det lunara referenssystemets datum med sju parametrar från laseravståndsmätning från jordstationer till de fem reflektorerna enbart och med avståndsmätningar från omloppsfarkost till ytstation tillagda: informationsmatrisen, rang, Cramér-Rao-sigman, degenerationsmåttet i den lunara identifierbarhetsmodulen och slumpade stationsmängder med frö. Banan hålls känd i de lunara axlarna (dess fel bärs av omloppsfarkostens avståndssigma).

seg-47d2afc53b3d = En oberoende numpy-finit differens av framåtmodellen (F2). Ingenting jämförs med verkliga lunara referenssystemslösningar. Faktorn är villkorad av den antagna kända banan och avståndssigmat på { "1" } m. MODELLED.

seg-862977c4bb01 = Precision för referenssystemsbindning i rymden: samlokaliserad GNSS, VLBI och laseravståndsmätning

seg-a9ae8e99f00d = Cramér-Rao-precision för förskjutningarna i translation, skala och rotation mellan teknikerna GNSS, VLBI och laseravståndsmätning när en rymdfarkost bär alla tre, med rymdfarkostens position eliminerad vid varje epok och nio störparametrar för lokala bindningar med ett prior, svept över noggrannheten i den lokala bindningen. Kovarianser med kvadratrotsmetoden (normalekvationerna förlorar siffrorna när teknikerna är nästan perfekta).

seg-b37ac7294112 = Ett oberoende numpy-staplat system med positionsobekanta eliminerade med explicita Schur-komplement (T3). Ingen data från GRASP, Genesis eller andra missioner jämförs med. MODELLED.

seg-ae627996875e = Känslighet för lunara Love-tal och libration

seg-28780d07c4a7 = Fisher-information för h2, k2, l2 och de fysikaliska libration-amplituderna från laseravståndsmätning (radiell och horisontell tidvattenförskjutning, reflektorrotation), omloppsfarkostföljning (graden-2-accelerationen k2 integrerad längs siktlinjen, trend borttagen), en ytgravimeter (gravimetrisk faktor { "1" } + h2 - { "1.5" } k2) och en ytklocka (fraktionell gång ({ "1" } + k2 - h2) W2/c2, knuten till de lunara tidskonstanterna). Nominella värden för h2 och l2 är linjäriseringspunkter; studien säger vad som är känsligt för vad, inte vad talen är.

seg-180d74388339 = En oberoende numpy-sammansättning med finita differenser (G2) och utvärdering i sluten form (G4). Känsligheten för k2 hos omloppsfarkostfamiljen är ett värde i den övre delen av intervallet (banans tillstånd absorberar här bara en konstant och en trend). Ingen mätning av lunar tidvatten eller libration jämförs med; k2 citeras från Lemoine et al. { "2014" } som ett nominellt värde. MODELLED.

seg-da712b740519 = Lunar förstärkning av DOP med ytbeacons

seg-83e6341e01b1 = Beaconförstärkt DOP för en lunar ytanvändare: raderna med siktlinjer till synliga satelliter och raderna med avståndsmätning mot synliga ytbeacons sätts ihop till en enda designmatris och utvärderas genom den delade DOP-kärnan, och den resulterande DOP avbildas på en realiserad 1-sigma-noggrannhet I METER genom ett användarekvivalent avståndsfel per beacon som sätts ihop som kvadratsumman av termer för klocksynkronisering, flervägsutbredning och inmätning. Beaconsynlighet är den geometriska horisonten med två höjder för en luftlös Måne, som saknar refraktiv utvidgning och därför är exakt snarare än approximativ. Kan köras som scenariot <c1/>, som redovisar enbart satelliter, satelliter plus beacons och en större konstellation som den konkurrerande vägen till samma geometri. MEASURED på den medföljande golden-geometrin (användare vid -80 deg, tre inmätta beacons, en illustrativ LCNS med sex satelliter vid t={ "0" }, mask { "5" } deg): { "5" } synliga satelliter ger PDOP { "9.6941" } och en 3D-1-sigma på { "11.222" } m; att lägga till de beacons som faktiskt klarar horisonten ger PDOP { "4.1160" } och { "4.765" } m, en faktor { "2.355" }; tjänsten med 24 satelliter ger i stället PDOP { "2.4226" } och { "2.804" } m, en faktor { "4.002" }. Rapporten skriver ut antalet SYNLIGA beacons snarare än det konfigurerade, och på den här geometrin klarar bara EN av de tre beaconsen horisonten: de två flankerande platserna ligger omkring { "333" } km från användaren mot en horisont på { "86" } km för en antenn på { "2" } m, så en läsare lämnas aldrig åt att anta att alla tre bidrog

seg-b0b618abf402 = Integritetsblindhet för gemensamt läge

seg-e732ac99a9ae = Exakt uppdelning i paritetsunderrum av ett mätfel i den del som RAIM inte kan se och den del den kan se. För den linjäriserade ögonblicksmodellen y = G·x + e kan varje fel dy entydigt delas upp i en BLIND komponent i range(G) — absorberad som ett tillståndsfel S·dy och utplånad av residualprojektorn Pperp = I − G·S, alltså osynlig för VARJE residualtest, inte bara för en viss tröskel — och en DETEKTERBAR komponent i paritetsrummet. Modulen returnerar projektorn, uppdelningen och den blinda andelen, så att en anropare kan kvantifiera hur mycket av ett visst fel som en ögonblicksövervakare strukturellt inte kan rapportera. Tillämpad på det verkliga golvet mellan efemerider: den metersmåa skillnaden mellan DE440 och INPOP21a samt mellan DE440 och EPM2021 i den geocentriska månpositionen absorberas nästan helt som användarpositionsfel (median för blind andel { "1.000000" }; median för blindt positionsfel { "2.3955" } m och { "2.0050" } m) mot en pariteteresidual på nivån { "1e-15" } m

seg-845e9f5eec81 = Skyddsnivå för gemensamt läge och totalt integritetskuvert

seg-2246ffa73869 = cmpl_horizontal begränsar k-sigma-felet i horisontell position som bidras av den blinda klassen för gemensamt läge, genom att bilda blind_position_covariance = S*Cov*S^T och projicera den till ENU; integrity_envelope redovisar hpl_total = hpl_araim + cmpl. Skillnaden som paret finns för att göra: RESIDUALTESTET i RAIM/ARAIM är bevisligen blint för fel i range(G), men SKYDDSNIVÅN i ARAIM är det inte - dess term för felfritt fall begränsar dem redan upp till en leverantörs URA plus nominell bias. CMPL är därför bara det EXCESS mellan leverantörer som URA/ISM för en enskild leverantör inte överskrider, och summan är en konservativ gräns enligt triangelolikheten snarare än en RSS, giltig endast där det excesset inte redan ryms inom URA.

seg-ffc59a7ed497 = Analytisk projektoralgebra kontrollerad mot sig själv: en kovarians begränsad till range(G) måste ge en positiv CMPL, en kovarians begränsad till paritetsrummet måste ge ungefär noll, och kuvertet måste summera två bidrag som är ortogonala i mätrummet. Kovariansen för gemensamt läge, konstellationsgeometrin och k är representativa Modelled indata, INTE en certifierad budget, och inget påstående görs att triangelgränsen är snäv. NOTERING OM PROVENIENS: cmpl_horizontal, blind_position_covariance och integrity_envelope är publika och levereras, och deras enhetstester var redan citerade av raden om blindhet för gemensamt läge, men SJÄLVA KUVERTPÅSTÅENDET hade ingen rad - så det enda förbehåll som håller det ärligt, att summan är en triangelgräns och inte en RSS, angavs ingenstans i registret. Raden registrerar påståendet och förbehållet tillsammans.

seg-5ed34a5b402e = Lunar gemensam multiteknik-banbestämning + klocka

seg-5ace1caff5a9 = Batchfusion av VLBI + lunart lokalt avstånd + avstånd mellan satelliter för att återvinna positioner och klockor för stationer och konstellation

seg-69fbe488dec5 = Fisher-information och observerbarhet enligt Cramér–Rao

seg-043d4c7a2d6a = Fisher-information M=HᵀWH, Cramér–Rao-gräns (nedre gräns), observerbarhetsrang och nollrum för datumdefekt (Moore–Penrose-pseudoinvers) samt D-, A-, E- och T-optimala skalärer för experimentutformning från en symmetrisk Jacobi-egenvärdeslösare

seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-baserad) — en oberoende tredjepartsreferens som beräknar samma entydigt definierade egenvärden, σ²(XᵀX)⁻¹-Cramér–Rao-kovarians och GNSS-faktorer för försämring av precisionen med en annan algoritm (LAPACK divide-and-conquer + LU) än Kshanas cykliska Jacobi-svep och spektrala pseudoinvers; överensstämmelse till { "1e-9" }. Samma klass av externa bibliotek validerar redan DOP-motorn (mot gnss_lib_py) och χ²/erf-kärnorna (mot SciPy). Dessutom korskontrollerad mot de slutna uttrycken för CRLB enligt Kay ({ "1993" }) och mot Monte Carlo-uppnåelse av CRLB (internt)

seg-e4ec41d0f5e1 = Observerbarhet för absolut stationsposition på månen (datumdefekt)

seg-b3e4160042d2 = Observerbarhet via Fisher-information för den gemensamma månlösningen: utan baslinjer till jorden ligger det absoluta referenssystemets datum i nollrummet till HᵀWH (stationens position är inte observerbar); ≥{ "3" } baslinjer återställer full rang och begränsar stationens Cramér–Rao-fel, som estimatorn uppnår

seg-ae4b71d54dfa = Anpassning av ett Helmert-datum med 7 parametrar och ICRF-orienteringsknytning från ett nätverk av punkter

seg-9e434924b34c = Oberoende lösare med slutet uttryck för viktad likformighetstransformation enligt Umeyama (Horn) (SVD-baserad med numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — en annan algoritm än kshanas iterativa Gauss–Newton-anpassning, som når samma entydigt definierade viktade minstakvadratoptimum på byte-identiska punktnätverk

seg-4bcec6e2dd9f = Täckningsvolym för navigeringstjänst på månen

seg-dba98ad5df1c = DOP, täckning och tillgänglighet av Moonlight-klass på månen samt generaliserade ARAIM-skyddsnivåer för månen över en täckningsvolym

seg-7e981d90a806 = Oberoende tredjepartsreferens ANISE { "0.10.2" } astro::Orbit, Keplerpropagator (Nyx Space, MPL-2.0) — en ekvinoktial tvåkroppskodväg som skiljer sig från kshanas Newton-Raphson-Kepler; per-satellit-position i MCI stämmer inom <{ "1e-3" } m och det härledda antalet synliga satelliter och mängden synliga satelliter är exakt lika i varje rutnätspunkt. DOP-kärnan är validerad mot gnss_lib_py; integritet använder publicerade LunaNet/LCNS-parametrar

seg-2ed7181c97dd = Generering av spridningskoder för LunaNet AFS (LSIS V1.0)

seg-13ff6c381275 = Augmented Forward Signal-koderna i LSIS V1.0 ({ "29" } januari { "2025" }): AFS-Q:s primärkod på 10230 chip genererad enligt pilotkonstruktionen för L1C i IS-GPS-800 med indexen i IS-GPS-800J (samma { "210" } tilldelningar som LSIS bilaga D skriver ut), AFS-I:s Gold-koder på 2046 chip genererade från g1 = x^{ "11" } + x^{ "2" } + { "1" } och g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } där varje PRN:s G2-fördröjning hämtas från standardens Annex { "3" }-fil, de fyra sekundärkoderna, tertiärkoderna på 1500 chip, den preliminära nodtilldelningen enligt tabell { "11" } och den skiktade pilotkoden. LSIS-innehållet läses vid körning från ett lokalt cacheminne som verifierats med SHA-256 och fyllts från den NASA-hostade PDF-filen, och distribueras aldrig vidare

seg-dc1dd144b107 = Referens: de värden som LSIS V1.0 skriver ut för validering (tabell C-1 till C-5, D-1 till D-6, E-1 till E-6) och dess elektroniska kodfiler i Annex { "3" }, under ett kriterium om noll avvikelser som fastställdes före jämförelsen. Kriteriet missas av en utskriven cell som är internt oförenlig med standardens egen Annex { "3" }-fil, så raden förblir MODELLED; en erratanotering är utkastad. Samma chip är också lika med LANS-AFS-SIM:s (rad "LunaNet AFS baseband rendering against an independent generator, given its channel state")

seg-ea20909686ea = Basbandsrendering för LunaNet AFS mot en oberoende generator, givet dess kanaltillstånd (LSIS V1.0)

seg-c0f021c38842 = Renderingskärnan i AFS-basbandet (LSIS-130: komplex envelopp I + jQ, I = AFS-I Gold-koden gånger ramen på { "500" } symboler/s vid { "1.023" } Mchip/s, Q = den skiktade AFS-Q-piloten vid { "5.115" } Mchip/s, bärvågsrotation, chip- och symbolsynkronisering) återger en oberoende generators samplingar när den styrs av den generatorns egna inspelade kanaltillstånd (kodfaser och kodhastigheter, bärvågsfas och bärvågsfrekvens, amplitud per kanal). Täcks inte: nodmodellen som härleder detta tillstånd från Doppler, fördröjning och bärvåg-till-brustäthet, effektfördelningen 50/50 som beräknas från bärvåg-till-brustätheten (amplituderna tas från simulatorn) samt SigMF-metadata och skrivning av 8-bitars samplingar

seg-dd1142957a05 = Bibliotek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-bandsbygge, körs som ett separat program); Kshanas samplingar styrs enbart av simulatorns inspelade kanaltillstånd, och ett bygge med enbart utskriftsspårning har kontrollerats vara byte-identiskt med det opatchade. Trösklar fastställda före körningen: noll chip- och symbolavvikelser, |rho| >= { "0.999" } över körningen och >= { "0.99" } per block om { "2" } ms, fas inom { "0.05" } rad. Lika I- och Q-amplituder är en indata till jämförelsen, så effektfördelningen testas inte av den. LANS-AFS-SIM läser sina tertiärkoder från LSIS Annex { "3" }-filen, så den delen är inte oberoende av kodraden. LANS-AFS-SIM och PocketSDR-AFS har samma upphovsperson och räknas som en enda oberoende implementation. Datastyrd: jämförelsen med LANS-AFS-SIM kräver den lokala LSIS V1.0-cachen (xval/lunar-afs/fetch_lsis.sh, SHA-256-verifierad) och hoppas över med ett meddelande utan den

seg-5d79da539912 = Kanalkodning av LunaNet AFS-ram, FID { "0" } (LSIS V1.0)

seg-6ed2b4c792e6 = FID { "0" }-ramen i LSIS V1.0 på { "12" } s och 6000 symboler: synkroniseringsmönster på 68 symboler, BCH ({ "51" }, { "8" }) för delram { "1" } (generator oktal 763), CRC-24 (({ "1" } + X)·P(X)) på delramarna 2–4, LDPC-kodning med hastighet 1/2 med de utskrivna A, B^-1, C, D (LSIS Annex { "1" }, läst vid körning från den SHA-256-verifierade lokala cachen) och standardens punktering, blockinterfolierare { "60" } x { "98" }; en uttömmande avkodare för delram 1 som flaggar ett TOI utanför { "0" }..99, och en normaliserad min-sum-LDPC-avkodare skriven enbart utifrån H = [[A, B, { "0" }], [C, D, I]]

seg-46879e2e8ab5 = Bibliotek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), vars egna BCH, CRC, LDPC och interfolierare ger ramar som är symbolidentiska med Kshanas för samma innehåll (noll avvikelser, tröskel fastställd före körningen). Styrkt av referensvärden: det genomräknade BCH-exemplet i figur { "8" } i LSIS V1.0 och kontrollvärdet för CRC-24/LTE-A (Greg Cooks katalog över parametriserade CRC-algoritmer), båda bitexakta; samt av att PocketSDR-AFS avkodar varje delram i de ramar som den synkroniserade i tre körningar med godkänd CRC och matchande bitar i delram 2. Paritetskontrollen är nära en intern identitet (den bekräftar att den utskrivna B^-1 inverterar den utskrivna B) och räknas inte som en oberoende referens. Datastyrd: jämförelsen med LANS-AFS-SIM kräver den lokala LSIS V1.0-cachen (xval/lunar-afs/fetch_lsis.sh, SHA-256-verifierad) och hoppas över med ett meddelande utan den

seg-56c7aeac59c1 = Avkodbarhet med sluten slinga för LunaNet AFS med en oberoende mottagare (LSIS V1.0)

seg-da2d29d437b0 = En Kshana AFS-inspelning som en oberoende programvarumottagare tagit in, följt och avkodat och som jämförts med inspelningens egna referensetiketter. Detta visar enbart att standarden följs och att etiketterna är konsekventa; det är inget påstående om kanalfysik, utbredning, mottagen effekt eller länkbudgetar, vars värden i inspelningen är valda indata

seg-8211583afc64 = Bibliotek: PocketSDR-AFS (T. Ebinuma efter T. Takasus PocketSDR { "0.13" }, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-bandsbygge, kopia med enbart utskrift på loggnivå), under kriterier fastställda före varje körning. Den tredje förhandsregistrerade jämförelsen uppfyller sina trösklar C1 och C2 för avkodning och följning fullt ut men inte sitt skydd G0 som det är skrivet (två körningar av den omodifierade mottagaren skiljer sig åt i samma fyra införvärvningsposter), och den andra missade med { "5" } överträdelser, så raden förblir MODELLED. LANS-AFS-SIM och PocketSDR-AFS har samma upphovsperson och räknas som en enda oberoende implementation; kontrollerna av utskrivna vektorer i raden för ramkodning skyddar mot en gemensam feltolkning

seg-780369fb9a54 = GPS L1 C/A: formatkontroll mellan generatorer

seg-ee47b60515f1 = GPS L1 C/A-spridningskoder (sdr::CaCode) och LNAV-delramar 1–3 (gps_lnav: fältkvantisering enligt IS-GPS-200 med specifikationens pi, tvåkomplementspackning, TLM- och HOW-ord, paritet enligt tabell 20-XIV med D29*/D30*-inversion, de paritetslösande bitarna i orden { "2" } och { "10" }) jämförda bit för bit med gps-sdr-sim på dess medföljande brdc0010.22n ({ "32" } satelliter)

seg-325900ed59ea = Signalgeometri för GNSS IQ-scen mot en oberoende basbandsgenerator

seg-ee5625b30ff2 = IQ-scengeneratorns sanning per satellit för en GPS L1 C/A-scen med sänd efemerid (iq::scene: en SatGeometry med sänd efemerid, genererad till TruthRecord-sanningsposter): vilka satelliter som är ovanför horisonten, pseudoavståndet, kodfasen vid det första samplet, bärvågs-Doppler och synvinklarna, för en stillastående mottagare, jämfört med det kanaltillstånd som gps-sdr-sim bygger det första blocket av sin egen I/Q-utdata från, för samma efemerid, mottagare och starttid (jonosfär av på båda sidor)

seg-bf429c8f00fb = GNSS IQ-införvärvning på oberoende genererade I/Q-samplingar

seg-9a0c52bfb06e = iq::acq::acquire (FFT-parallell kodfassökning med Marcum-Q-tröskel för kvadratisk detektor) med GpsL1Ca-repliken, på { "20" } ms av gps-sdr-sims egen 8-bitars I/Q-utdata avkodad av samplingsavkodaren iq::io (ci8, { "2.6" } MHz, { "11" } satelliter, inget brus): varje PRN { "1" } till { "32" } söks i två fönster om { "10" } ms, och resultatet jämförs med den kodfas och den Doppler som gps-sdr-sim modulerade

seg-f40dc3dac990 = IQ-övervakare bedömda i labbuppspelningskampanjer: detektion, missar, falsklarm och slutna uttryck för falsklarmstal

seg-93fb3109728c = iq::campaign::detect och kampanjkörningen: en valfri tabell [monitors] kör IQ-övervakarna på varje cell i körningens enda pass. Effekt- och spektralövervakarna ser samplingarna efter varje frontändskedja; övervakarna för C/N0, SQM och låsning ser varje följd kanals slingutjämningar. Varje larm bedöms mot de angivna händelserna: detekterat eller missat per (händelse, larmtyp, kanal), tid till detektion och falsklarm utanför händelserna över deras exponering. För varje tests slutna uttryck anges falsklarmstalet: effekt per block (exakt gammasvans), spektralt överskott per block (approximation), kurtosis (ensidig gaussisk), pulser (binomialtak), SQM per medelvärdesbildad uppdatering (2Q(k) = Q(1/2, k^2/2), nytt) och ARL0 för C/N0-CUSUM (Siegmund). Utan tabellen är celler, nycklar och sammandrag oförändrade. Ingen störningsvågform syntetiseras

seg-5b7eb7ddb474 = Detektions-ROC för IQ-övervakarna från en bedömd labbuppspelningskampanj

seg-57fe85965c9c = iq::campaign::detect (windows, roc) och iq::campaign::report::rocs: varje cell i en kampanj med övervakare behåller, per larmtyp och kanal, maxvärdet av övervakarens egen teststatistika över varje angivet händelsefönster (positiva) och över sammanhängande roc_window_s-fönster utanför händelserna (negativa). Statistikorna är blockeffektens avvikelse, PSD-överskottet, kurtosis z, SQM |z| för det medelvärdesbildade måttet och C/N0-CUSUM. Rapporten slår ihop dem per typ till en empirisk ROC på fönsternivå med dess AUC och arbetspunkten vid den konfigurerade tröskeln, skriven som roc.json (kshana.campaign-roc/1) och som ett avsnitt Detection ROC i report.html. En kampanj utan övervakare skriver ingetdera

seg-3a3cfa322f01 = Kalibrering av den öppna mottagarens modeller för C/N0 och låsning mot resultat från IQ-kampanjer, med angivet prediktionsfel

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) och <c1/> på <c2/>, Python <c3/> och MCP-verktyget labfit (kampanjmappar enbart inom dess arbetskatalog): läser en utdatamapp från <c4/> via dess DIGEST och grupperar de bedömda cellerna i anpassningsenheter (signal x slingutformning x frontändskedja x störsändartyp, aldrig sammanslagna). Per enhet anpassas uppmätt C/N0 mot angivet J/S med den spektrala separationsformen. Q_eff är inte identifierbar ur C/N0-data utan en oberoende mätning av störsändarens och signalens effekt, så Q anges, anpassas aldrig (typtabellen, händelsens q eller, för en okänd typ, det mest skadliga angivna värdet, cw Q = { "1" }). Den anpassade parametern är den identifierbara förskjutningen delta_eff = delta - { "10" } log10 Q, där korrelationsvakten rapporterar degenerationen. C/N0-fack som är låsta under { "90" } % är censurerade och listas. Tröskel-J/S anges direkt och med det slutna uttrycket; spårningsslingans modell och den empiriska låsningsmodellen kopplas genom C/N0-modellen, med dröjsmål för tappad och återvunnen låsning. En seedad klusterbootstrap över inspelningar ({ "1000" } replikat) ger percentilintervall; { "90" } % prediktionsintervall kommer från residualdragningar; hold-outs där en inspelning utelämnas delas upp i interpolation och extrapolation; en förhandsregistrerad tabell [validation] hashas och varje tröskel bedöms som PASS/FAIL. Rapport kshana.labfit-iq/1 som JSON, CSV och genererad Markdown, med ett units-block. Endast syntetiskt (ingen tredjepartsinspelning, ingen störsändarvågform). Sökvägen labfit för mottagarloggar är oförändrad

seg-9537d301c95e = GPS LNAV-kodning avkodad av ett oberoende mottagarbibliotek

seg-909415621881 = Kshanas LNAV-delramar 1–3 (gps_lnav::encode_subframes) för de { "32" } efemeriderna i brdc0010.22n, matade till RTKLIB:s decode_word och decode_frame: paritet för varje ord, avkodning av delramar med konsekvent datautgåva och varje avkodad parameter mot Kshanas heltal och mot indatavärdet

seg-f66855e35c53 = Kodning av GPS LNAV-navigeringsmeddelandet

seg-8caf8366e2f8 = IS-GPS-200 LNAV-delramar 1–3 (gps_lnav::encode_subframes: kvantisering till närmaste av varje klock- och banparameter vid specifikationens skalfaktorer och värde på pi, tvåkomplementspackning, TLM- och HOW-ord, paritet enligt tabell 20-XIV med D29*/D30*-inversion, de paritetslösande bitarna i orden { "2" } och { "10" }), det meddelande som en GPS L1 C/A-signalgenerator sänder

seg-c5c944357643 = Införvärvning och C/N0-skattning på verklig IQ-data från månen

seg-f5dcb5e06bf4 = Parallell kodfassökning (acquisition::pcps_acquire: portabel FFT, koherent vikning, icke-koherent ackumulering, chi-tvåtröskel för en falsklarmssannolikhet över hela sökningen), förfining, öppen-slinga-korrelation av prompt-kanalen med kod-Doppler och C/N0-estimatorn M2M4, körd på LuGRE L1 4-bitars IQ-satser inlästa via realdata::ion_sdr

seg-709626569a5c = Införvärvning på verklig IQ-data från månen mot banprediktion av Doppler (beslut på samplingseffekt)

seg-784ebd80c425 = acquisition::pcps_acquire med sitt beslut på samplingseffekt på de nio LuGRE L1-satserna som inte kommer från ytan med mid-rise-nivåer; Dopplerskillnader mellan införskaffade satelliter jämförda med skillnader predikterade från ESA:s slutgiltiga banor och den av Firefly rekonstruerade banan för Blue Ghost

seg-89875d67b253 = Införvärvning på verklig IQ-data från månen bedömd mot banpredikterad Doppler

seg-956bcfeaf319 = acquisition::pcps_acquire med beslutet med cellmedelvärdesbildning (topp över rutnätets medelcell, robust mot bandbegränsat brus) på de nio LuGRE L1-satserna som inte kommer från ytan med mid-rise-nivåer; Dopplerskillnader mellan införskaffade satelliter jämförda med skillnader predikterade från ESA:s slutgiltiga banor och den av Firefly rekonstruerade banan för Blue Ghost

seg-8fa779dd1788 = Införvärvning på undanhållen verklig IQ-data från månen mot banpredikterad Doppler

seg-484868771231 = acquisition::pcps_acquire (beslut med cellmedelvärdesbildning, falsklarmssannolikhet { "1e-7" }) med refine_doppler_coherent på de LuGRE L1-satser som spelats in på månens yta (I i den höga nibblen, mid-rise-nivåer); Dopplerskillnader mellan införskaffade satelliter mot skillnader predikterade från ESA:s slutgiltiga banor och Fireflys kärna för landningsplatsen

seg-758af035b3ce = Gemensam geometri för kommunikation och navigering på månen

seg-11f861bdc6bf = Topocentriska synvinklar per satellit (azimut medurs från norr, elevation) och snedavstånd vid en namngiven selenografisk plats, givet satelliten i platsens månfasta referenssystem (det validerade påståendet). Signalens avståndsnoggrannhet i rymden exponeras som en scenarioparameter så att svepet över täckningsvolymen ger ett KRAV på avståndsnoggrannhet i stället för ett godkänt/underkänt vid ett fast sigma; den parametern är en utformningsindata utanför det validerade påståendet

seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, körs som ett verktyg från xval/anise-service-geometry, binären lunar-look-angles-xval, som inte anropar någon Kshana-kod): ANISE:s egen rutin för azimut, elevation och avstånd (azimuth_elevation_range_sez) från platser byggda med dess konstruktor för latitud, longitud och höjd på pck00011-månen (sfär { "1737.4" } km), med satelliterna roterade till MOON_PA_DE440 via moon_pa_de440_200625.bpc. { "768" } samplingar över { "8" } platser (de { "4" } namngivna platserna och { "4" } andra, ovanför och under horisonten), { "12" } epoker och { "8" } satelliter stämmer inom { "1e-6" } grader i azimut och elevation och { "1" } mm i avstånd och platsposition (fastställt före jämförelsen); uppmätt { "2.2e-12" } grader, { "2.1e-13" } grader och { "5.6e-9" } m. Påstående: platsplacering och synvinklar givet satelliten i platsens kroppsfasta referenssystem. Kshanas egen realisering av ett månfast referenssystem med medelrotation och parametern för avståndsnoggrannhet ligger utanför det; enhetstesterna av geometrin med slutna uttryck finns kvar som stödjande kontroller

seg-10af60b488b9 = Differentiell referensstation av NovaMoon-klass: upphävande av gemensamt läge + baslinjeväxande residual + DGNSS-skyddsnivåer

seg-96b2627b388a = Identitet för differentiellt felupphävande + återanvändning av maskineriet för SBAS-skyddsnivåer i DO-229E; lösningen med enkeldifferens + WLS korskontrolleras dessutom mot RTKLIB:s lsq()/matinv() (Takasu, BSD-2-Clause, kompilerad C) — oberoende lösarkod, men samma förstaordningens algebra för skillnaden i siktlinje, så fortfarande InternalConsistency

seg-c04a3591074c = Export för interoperabilitet på månen

seg-91f4a066b3c0 = Export av LunaNet/IOAG-anpassat månreferenssystem + tid + efemerid (CCSDS OEM + KIF) med rundturskontroll

seg-f5f8ed69bea7 = kshanas OEM-export för månen tolkad på nytt av det oberoende tredjepartsbiblioteket <c1/> (R. J. Anderson): referenssystems- och tidstoken och tillstånd per epok stämmer till skrivprecisionen ({ "1" } mm / { "1e-9" } km/s) och en export där TIME_SYSTEM saknas avvisas — en strukturell rundtur för utbyte; de fysikaliska innebörderna av månens referenssystem och tid är validerade av sina egna rader, så detta förblir MODELLED. { "0.30" } extern jämförelse, ett resultat (förblir MODELLED): en andra oberoende läsare, CCSDS OEM-tolken i Orekit { "12.2" } (Apache-2.0, strikta standardvärden), vägrar båda månfilerna eftersom den inte implementerar tidssystemen LTC och TCL (den avkodar cratens EME2000/UTC-OEM, och avkodar månfilerna när TIME_SYSTEM ersätts med TDB); oem { "0.4.5" } avkodar dem inom den skrivna precisionen enbart genom att falla tillbaka från det tidssystem som inte stöds. Utbyte av dessa månfiler med etablerade CCSDS-läsare är inte konstaterat

seg-8ab65cbefb75 = Poängsättning anpassad till ramverk för PNT-resiliens

seg-c48198f31d63 = Delpoäng per dimension över Kshanas egna sju resilienskategorier (inte DHS-termer), RethinkPNT:s RDRR-funktioner och Yang-kriterier, var och en märkt Modelled med sin drivkraft; preliminär RPCF-nivå med en grind för begränsad försämring. Självbedömning härledd ur simulering, aldrig certifiering.

seg-f905aeb203bb = Handhärledda formler per mått: inverterad Simpson-diversitet, viktat medelvärde som sammansatt mått, begränsade/obegränsade tidslinjelängder, nivåstege efter svagaste länk

seg-d7bdb6fe186e = Studie av beslutsinstabilitet i resiliensindex

seg-5fcf18a68bb1 = Kvantifierar hur ett enda sammansatt index / en RPCF-nivå ordnar om arkitekturer under en försvarbar viktsimplex och en hotensemble (andel byten av top-1, spridning i Kendall-tau, andel nivåbyten, rangintervall); analyser av deklarerat mot uppmätt och av diversitetskollaps.

seg-b6bf76a752a0 = Identiteter för rangstatistik med slutna uttryck (tau i [-1,{ "1" }] med handräknade värden; deterministisk seedad Dirichlet) och konstruerade stabila/instabila vittnen

seg-1bf03544a010 = Representativitet för demonstrationen och luckor mot flygning

seg-db24d16d38c9 = Ärlighetsregister per resultat som kvalificerar en demonstrationsutdata: dess externa förankringar, modellerade antaganden, luckor mot flygning och representativt TRL-intervall, med invarianter som upprätthålls (Validated kräver en extern förankring; Modelled kräver en lucka och kan inte hävda mer än TRL { "4" }).

seg-81d3adb239c5 = Invarianter med slutna uttryck som motsvarar disciplinen i compliance om "representativitet motiverad + luckor mot flygning identifierade"; kopplade till gränsen mellan verifieringsstatus och typ av oberoende referens

seg-52ab936eb5f5 = Underlag för avvägning kvant mot klassiskt (gemensam form)

seg-a6679ed5bed7 = Ett reproducerbart TradeEvidence-objekt (fast ram: scenario+seed+motor; gemensamma värden per kvalitetsmått för kvant mot klassiskt med fördel i rätt riktning, valfritt { "95" }-% konfidensintervall, etikett validerad/modellerad) som bär en representativitetspost, så att varje vertikal inom kvant-PNT redovisar avvägningen på samma ärliga sätt.

seg-70da3e15ea8b = Identiteter med slutna uttryck för fördel/vinnare + trogen inpackning av det befintliga quantum_trade::TradeResult; ärlighet knuten till representativitetsregistret och verifieringsetiketterna

seg-20fee61b3107 = Bibliotek med felmodeller för kvantenheter

seg-e42eabe9bc2a = Enhetskort (optiska/jonfälle-/kvicksilverjonklockor + klassiska klockor återanvända från holdover/clock_state; kallatominterferometer; klassiska länkar + länkar med intrassling/enstaka fotoner för tidsöverföring) som var och en bär en representativitetspost; länken med intrassling lägger till en skotbegränsad modell för tidsprecision (~jitter/sqrt(R*tau), straff för mörkertal, systematiskt golv).

seg-632600203e1f = Återanvända koefficienter för klocka/CAI (holdover/clock_state, publicerade värden) + identiteter med slutna uttryck för skotbrus och förlust i länken med intrassling

seg-86d71fd89f26 = Betrodd kvanttidssynkronisering (tidsöverföring + säker distribution + anomali)

seg-d2a3d37825ef = Kedja för tidsöverföring kvant mot klassiskt från början till slut (klockans fritt löpande drift + länkprecision i kvadratur), en återanvänd skyddsnivå för tidssynkronisering, ett säkerhetsmått mot fördröjnings-/återuppspelningsattacker (1-P_md) samt en detektionssannolikhet för klockanomalier + CUSUM-latens, redovisade som ärligt TradeEvidence med en representativitetspost.

seg-ac95d112a17a = Kvadraturbudget med slutna uttryck över återanvända validerade kärnor (ADEV mot Stable32/NIST; gräns för TPL; detektion analytic_pd/pmd); ärlighet knuten till representativitetsregistret

seg-eaf341ff4522 = GNSS-fri kvantnavigering

seg-908a44a9f7c7 = Kvant (kallatominterferometer) mot klassisk navigeringsklassad INS med koppelnavigering under ett GNSS-avbrott: positionsfelets tillväxt, holdover till en positionströskel och avvägningen kvant mot klassiskt som ärligt TradeEvidence; ärlig anmärkning om observerbarhet (biasen är oobserverbar utan en positionsbestämning, så felet växer).

seg-508f2c8884e2 = Återanvända tröghetsbudgetar korskontrollerade mot en oberoende dubbelintegration i Octave av samma differentialekvation för koppelnavigering (annan körmiljö, delad modell → ReferenceImpl) samt det publicerade kortsiktiga bruset enligt Freier-2016 som ett ensidigt ankare; den sammansatta jämförelsen kvant mot klassiskt förblir MODELLED

seg-914132833f5a = Fel- och anomalidetektion för kvant-PNT-system

seg-f20392820b9d = Märkt katalog över kvantfel (klockans frekvenshopp/drift/låsförlust; sensorns biassteg/bortfall), en ROC AUC för detektionsstatistikan med bootstrap-konfidensintervall och ett minsta detekterbart fel vid ett fast falsklarmstal; en kvantklockstödd övervakare detekterar mindre fel än en klassisk, redovisat som ärligt TradeEvidence.

seg-a689ab2ebb84 = Gaussisk AUC med slutet uttryck = Phi(mu/(sigma*sqrt2)) korskontrollerad mot den externt validerade eval_stats::bootstrap_auc_ci (mot scikit-learn) + analytiska detektionströsklar

seg-0633e05d393f = Momentfri attitydrörelse för stel kropp

seg-23f43007bcbf = Eulers rotationsrörelseekvationer (I ω̇ = τ − ω × Iω, huvudaxlar och allmän tröghetstensor) kopplade till kinematik för kvaternionattityd (q̇ = ½ q ⊗ ω) och propagerade med en RK4-integrator med fast steg som renormaliserar kvaternionen i varje steg

seg-2d21a01ea132 = Basilisk { "2.9.1" } propagering av stel kropp för rymdfarkostens nav (AVSLab, ISC; MRP-attityd via dess egna kopplade navekvationer, svIntegratorRKF78 vid relativ tolerans { "1e-12" }), en oberoende implementation av ekvationerna för momentfri stel kropp: Kshanas RK4-kvaternion (dt { "0.01" } s) och kroppsvinkelhastigheter stämmer inom { "1e-9" } över { "1e4" } s för två allmänna icke-diagonala tröghetsmatriser (sämst { "3.3e-11" } och { "3.4e-12" } rad/s); toleransen fastställdes före jämförelsen. Validerat påstående: momentfri rörelse; termen för externt moment jämförs inte. Kontrollerna av bevarandelagar och symmetrisk topp finns kvar som stödjande självkonsistens. Ingen miljö med flexibla kroppar / reglerslingor / externt moment

seg-93b8ba1ba0e5 = Relativ dynamik enligt Clohessy–Wiltshire / Hill

seg-17f27a95d009 = Relativ rörelse för en jagare kring ett mål i en cirkulär referensbana i LVLH-systemet: de linjäriserade Clohessy–Wiltshire-ekvationerna (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) lösta med tillståndsövergångsmatrisen Φ(n,t) av storlek { "6" }×{ "6" } med slutet uttryck (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) med villkoret för begränsad relativ bana ẏ₀=−2n·x₀, och en andra ordningens korrektion med slutet uttryck (cw_dynamics::second_order_correction, CW-svaret på de kvadratiska termerna i de exakta ekvationerna för en cirkulär huvudfarkost; Karlgaard och Lutze { "2003" }, Newman, Lovell och Pratt { "2015" }) sammansatt som cw_dynamics::propagate_second_order. Den validerade utdatan är propagate_second_order; enbart den linjära Φ karakteriseras mot ickelinjär sanning, den är inte validerad

seg-d31be81dfd8f = Passiv geolokalisering av sändare med TDOA/FDOA

seg-aa870cee16f6 = Lokalisera en sändare (störsändare/spoofer eller en opportunistisk källa för omvänd PNT) utifrån tidsskillnad vid ankomst över ett mottagarnätverk — skärningen mellan hyperboloider τᵢ=(Rᵢ−R₀)/c löst med minsta kvadrater enligt Gauss–Newton — och, genom att lägga till frekvensskillnad vid ankomst (skillnader i avståndshastighet) med rörliga mottagare, gemensamt återhämta position och hastighet; med Cramér–Rao-gränsen (nedre gräns) för positionskovariansen utifrån mätgeometrin

seg-36b74b49f82f = Toppavbromsning vid ballistisk 3-DoF-inträde mot det publicerade nominella fallet för Stardust

seg-a05ca2fde6fc = Ett 3-DoF-inträde för en punktmassa över en roterande sfärisk jord genom US Standard Atmosphere { "1976" }, integrerat med RK4 från ett tröghetsbaserat inträdestillstånd, med redovisning av toppavbromsningen och dess höjd; det planetrelativa inträdestillståndet från det tröghetsbaserade. Kan köras som scenariotypen <c1/>.

seg-5ab7065c0803 = Det nominella fallet för Stardust enligt Desai, Mitcheltree och Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maximal avbromsning { "33.4" } g från { "12.6" } km/s planetrelativt med uppskjutningsmassan { "45.8" } kg, en 6-DoF POST-bana med hela den aerodynamiska databasen; inträdesgräns enligt Desai, Lyons, Tooley och Kangas (NTRS { "20090004445" }): radie { "6503.14" } km, tröghetsbaserat { "12.9" } km/s vid -8.2 grader. Trösklar förhandsregistrerade i xval/entry-stardust/PREREGISTRATION.md före någon körning på dessa indata; båda höll vid första körningen. VAD SOM INTE GÄLLER: ett publicerat fall och en storhet (toppavbromsning, som i den ballistiska approximationen inte beror på den ballistiska koefficienten); inträdets latitud och kurs är antagna; uppvärmning, värmebelastning och landningspunkt kontrolleras inte mot det; punktmassa med konstant C_D, inte 6-DoF.

seg-5bd3882531b6 = Konvektiv inträdesuppvärmning i stagnationspunkten (Sutton-Graves) vid ett 3-DoF-inträde

seg-4f97036ed72f = Konvektivt värmeflöde i stagnationspunkten q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstanterna för jordluft och Mars atmosfär (NASA TR R-376, { "1971" }), dess topp och den integrerade värmebelastningen längs ett 3-DoF-inträde, ballistiskt eller lyftande med konstant bankning, på jorden eller Mars.

seg-5a203ecfeaee = Intern konsekvens: sambandet och konstanterna som de är utskrivna i NASA TR R-376, en konvergenskontroll med halverat steg och den förväntade ordningen mellan toppar för uppvärmning och avbromsning. VAD SOM INTE GÄLLER: inget publicerat uppvärmningsvärde har jämförts (Stardust-artiklarna anger en konstruktionsgräns och en uppskattning av konvektiv plus strålningsuppvärmning på omkring { "1200" } W/cm2, som ett samband enbart för konvektion inte kan nå); ingen strålningsuppvärmning, ingen korrektion för väggtemperatur eller katalycitet och inget svar från värmeskyddet.

seg-1b96577665fc = Radiometri, MTF, relativt kantsvar och GIQE { "4" } NIIRS för elektrooptisk avbildare

seg-38902593e841 = Signal-brusbudget för en nadiravbildare (lambertisk scenradians, kameraekvationen, skott-, mörker-, avläsnings- och kvantiseringsbrus), systemets MTF vid Nyquist som produkten av diffraktion för en oskymd apertur, detektorapertur, linjär utsmetning och gaussisk jitter, kantsvaret och det relativa kantsvaret integrerade från den MTF:en, Q = lambda F / p, och GIQE version { "4" } NIIRS utan MTF-kompensation. Kan köras som scenariotypen <c1/>.

seg-bb3a01edc95d = Slutna uttryck: diffraktions-MTF vid halva gränsfrekvensen, den ena pixelns rampkant för en ren detektorapertur (RER { "1" }), normalfördelningens CDF-kant för en gaussisk oskärpa (RER = erf(0.5/(sigma sqrt { "2" }))), skalning av skottbrus och GIQE { "4" }-koefficienterna som de publicerats (Leachtenauer m.fl., Applied Optics { "36" }({ "32" }), { "1997" }). VAD SOM INTE GÄLLER: ingen extern avbildare, uppmätt MTF eller betygsatt bild har jämförts; GIQE är en empirisk regression med eget fel; inget strökljus, ingen atmosfärisk MTF, ingen MTF-kompensation och ingen aliasing.

seg-07ca77a67207 = Förluster vid uppskjutning på grund av gravitation, luftmotstånd, styrning och mottryck

seg-7a1802cf2c80 = Plan uppstigning med gravitationssväng för ett flerstegsfordon över en icke-roterande sfärisk jord genom US Standard Atmosphere { "1976" } (densitet och tryck), med en nickspark, dragkraft som minskas av munstyckets mottryck, utbrända steg vid exakta stegbundna gränser och förlusterna från gravitation, luftmotstånd, styrning och mottryck integrerade vid sidan av tillståndet. Kan köras som scenariotypen <c1/>.

seg-174ed29adbbe = Intern konsekvens: den exakta identiteten utbränningshastighet = summa Isp g0 ln(m0/mf) minus de fyra integrerade förlusterna (residual under { "1e-6" } m/s), Tsiolkovskijs ekvation för en vertikal förbränning i vakuum där gravitationen är den enda förlusten samt US76:s tryck vid havsnivå och vid tropopausen. VAD SOM INTE GÄLLER: inget publicerat fordons förluster har jämförts; ingen jordrotation, ingen glidfas, ingen strypning och ingen styrning utöver sparken; konstant C_D; inte en banoptimerare.

seg-55e8345def8b = TWSTFT-tvåvägsekvation, osäkerhetsbudget och länkstabilitet med flicker och dygnsbunden icke-reciprocitet

seg-5ca5226c24ec = TWSTFT-tvåvägsekvationen löst för T_A - T_B med stationernas sänd- och mottagningsfördröjningar, jonosfärens asymmetri uppåt/nedåt i Ku-bandet, skillnaden i transponderfördröjning och Sagnac-termerna, mot dess exakta framåtmodell; en osäkerhetsbudget i kvadratur med länkens TDEV som typ A-term; en tvåvägsserie med vitt och flicker-fasbrus (Kasdin-Walter), en dygnsbunden icke-reciprocitet och en konstant reciprocitetsresidual; samt hastighet, residual-RMS, TDEV och ADEV för tillhandahållna stationsklockserier i Circular T, MJD-CSV eller IGS RINEX. Kan köras som scenariotypen <c1/>.

seg-244f7396ac25 = Intern konsekvens: framåtmodellen och den lösta ekvationen stämmer till { "1e-15" } s, Sagnac-termen är lika med modulens oberoende BIPM 2A omega/c^{ "2" }-slingform, jonosfärstermen är { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, och brusprocesserna visar sina förväntade TDEV-former. VAD SOM INTE GÄLLER: ingen verklig TWSTFT-mätning eller kalibreringsrapport har jämförts; de angivna fördröjningarna och osäkerheterna är indata, inte uppmätta; stabiliteten hos tillhandahållna serier redovisas, den är inte validerad.

seg-2f9be02c92bc = Numerik för optisk atmosfär längs snedlinjer: Rytov-varians, scintillation, fadningssannolikhet för gamma-gamma, aperturmedelvärdesbildning, optiskt djup för moln och klar luft

seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integrerad längs en snedlinje för Rytov-variansen för plan och sfärisk våg (upplänk och nedlänk), scintillationsindex enligt Andrews-Phillips och gamma-gamma-parametrar, fadningssannolikheten för gamma-gamma och fadningsmarginalen, aperturmedelvärdesfaktorn vid svag turbulens, det optiska djupet för moln hos en vätskevattenkolonn samt det optiska djupet för klar luft enligt Kim-sikt plus Rayleigh, som ersätter den sammanslagna atmosfärsförlusten i den optiska länkbudgeten när en atmosfär tillhandahålls. Kan köras inom scenariotypen <c1/>.

seg-7ca512adff99 = Numeriken jämförs med ett oberoende program (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } med { "30" } siffror, tanh-sinh-kvadratur över den ursprungliga höjdvariabeln och Bessel-K-täthet för gamma-gamma) som inte delar någon kod med Kshana, under trösklar fastställda innan någon implementation fanns (xval/optical-atmosphere/PREREGISTRATION.md). VARFÖR MODELLED: den oberoende referensen utvärderar samma publicerade formler, så den kontrollerar implementationen av de angivna formlerna och inte atmosfären; inget valideringsexempel från ITU-R och ingen uppmätt post för scintillation eller snedlinjeextinktion används (ITU-värdena är ett öppet licensbeslut och hålls utanför förvaret). Nivån på Cn2-profilen, sikten, skalhöjderna för aerosol och molekyler, aperturmedelvärdesbildningens väglängd och momentmatchningen som används för att tillämpa aperturmedelvärdesbildning på gamma-gamma-parametrarna är angivna indata eller konventioner. En källrad i modulen noterar att en vitt kopierad översikt skriver ut den andra scintillationsexponenten som 7/6 där Andrews och Phillips anger 5/6; formen med 5/6 är den som implementeras

seg-a2faab92e760 = Väderstyrd tillgänglighet för optiska markplatser och avståndskorrelerad platsdiversitet

seg-7f4e4e763d62 = Tillgänglighet för en optisk länk mot en angiven länkmarginal utifrån ett lognormalt klimat för molnens vätskevatten (mängd enligt ITU-R P.840, extinktion enligt geometrisk optik) och den oberoende turbulensfadningen för gamma-gamma, den länkmarginal som behövs för önskade tillgängligheter och det tak som ingen marginal kan lyfta, lognormala avbrottslängder, vad-händer-om för förbättringstekniker och en enfaktors gaussisk copula för nätverkstillgänglighet vars parkorrelation är exp(-avstånd/dekorrelationslängd). Kan köras som scenariotypen <c1/>.

seg-20eab6e9b925 = Intern konsekvens: gränsfall med slutna uttryck och monotonicitet hos diversitetsmodellen, det slutna uttrycket för molntaket och de lognormala avbrottsidentiteterna. INGEN extern oberoende referens görs gällande och ingen har jämförts: ingen uppmätt post för tillgänglighet hos optiska markstationer eller för moln-fri siktlinje används. VARFÖR MODELLED: molnklimatet (sannolikhet för moln, median och spridning för vätskevattenkolonnen, avbrottslängder), oberoendet mellan moln och turbulens, den gaussiska copulaformen, dekorrelationslängden och varje teknikvinst är antaganden; de medföljande scenarierna anger ILLUSTRATIVE klimat, inte en datamängd. För att uppgradera den här raden krävs en citerad uppmätt tillgänglighetspost och en tröskel som registrerats före jämförelsen

seg-043ece801e72 = Kontinuitet i tidssynkronisering och avståndsmätning genom optiska avbrott

seg-bb9cb3fe4180 = Avbrottslängdsfördelningen för en optisk plats kopplad till klockans fritt löpande varians med slutet uttryck i holdover-modellen: fel i tidssynkronisering och avståndsmätning vid angivna kvantiler av avbrottslängden, holdover till en tröskel för tidssynkronisering, andelen avbrott och avbrottstid som ligger inom den och tillgängligheten för tidssynkronisering A + U E[min(D, T_h)]/E[D], för de klassiska och de kvantbaserade klockklasserna. Kan köras inom scenariotypen <c1/>.

seg-ab2a33c1b1a4 = Intern konsekvens med holdover-modulen, bit för bit; INGEN extern oberoende referens görs gällande. Klassernas PSD:er är de syntetiserade golven vid långa tau som holdover-modulen redan bär, så siffrorna ärver dess angivna förbehåll att holdover till en snäv tröskel styrs av det antagna golvet för rött brus och inte av den citerade Allan-avvikelsen. Avbrottslängderna är en lognormal modell med angivna parametrar, inte en uppmätt post över molnuppehåll

seg-b119df65d2a7 = Optisk länkmarginal över tid: en seedad realisering av en plats väder

seg-06125f3cae90 = En frivillig tabell <c1/> (duration, step, seed) gör att typen <c2/> också skriver, per plats, en seedad realisering av den angivna platsmodellen genom tiden: molnepisoder (klara perioder exponentiella, molnavbrott lognormala med angivet medelvärde och angiven spridning, andelen tid i moln satt till den angivna molnsannolikheten), en lognormal vätskevattenkolonn per molnepisod, ett gamma-gamma-scintillationssampling per steg, och utifrån dem länkmarginalen, moln- och scintillationsfadningarna och flaggan för länk uppe, med den realiserade tillgängligheten, molnandelen, antalet avbrott och det längsta avbrottet. Utan tabellen är resultatet dokumentet { "0.37" }. Dragningarna går via de portabla vägarna för fördelningar och matematik, så native och wasm32 ger samma byte.

seg-d25e5d2449bd = Endast intern konsekvens; INGEN extern oberoende referens görs gällande och ingen finns för en väderrealisering. Kontrollerna jämför en dragning med den statistiska utdatan från samma modell, så ett godkänt resultat säger att generatorn samplar de angivna fördelningarna (dragningens tillgänglighet och molnandel ligger inom förhandsregistrerade toleranser kring de angivna värdena), inte att någon verklig plats beter sig så. Serien är en realisering, inte klimatet: dess tillgänglighet skiljer sig från den angivna med dragningens samplingsfel, och scintillationssamplingar vid olika steg är oberoende, en angiven förenkling av en process som dekorrelerar på millisekunder. Väderindatan förblir scenariots antaganden.

seg-58cbf576c959 = Läsare för TRK-2-18 Orbit Data File och modell för rampad 2-vägs-Doppler vid Mars

seg-d1055650a77f = En läsare för DSN Orbit Data Files (TRK-2-18): postgrupperna om 36 byte (filetikett, identifierare, bandata, ramper per station, klockförskjutningar, sammanfattning, filslut), och i varje bandatapost tidsmärket sedan { "1950" }, nedlänks- och upplänksfördröjningar, observerbar, stationer, datatyp, band, giltighet, kanal, rymdfarkost, referensfrekvensen på 46 bitar och komprimeringstiden; rampernas start- och sluttider, hastigheter och startfrekvenser. Ovanpå den en modell för rampad 2-vägs-Doppler i X-band (integrerade upplänksramper, ljustid för rundturen med Shapiro och troposfär, DSN-stationer via IAU 2006/2000A CIO-kedjan och IERS EOP, stationstid) och en batchbanbestämning för en Mars-omloppsfarkost (GMM-3-fält, tredje kroppar, SRP, luftmotstånd).

seg-6d533149f6f0 = PDS3-etiketten som DSN:s databehandlingsprocess för navigering producerade tillsammans med filen (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), kontrollerad mot trösklar förhandsregistrerade i xval/mro-odf/PREREGISTRATION.md innan läsaren fanns. MODELLED eftersom en registrerad tröskel (filslutstabellens rader, { "121" } i filen mot { "120" } i etiketten) missades; etiketten är internt oförenlig där. Steg { "2" } (xval/mro-od/PREREGISTRATION.md, ändringarna A1 och A2 före det bedömda resultatet): den Doppler som predikteras från MRO-navigeringsteamets rekonstruktion (mro_psp5, NAIF) stämmer med den observerade rampade 2-vägs-Dopplern till { "12.5" } mHz på pass som inte använts i utvecklingen, tröskeln uppfylldes; den registrerade banbestämningen misslyckades på den bedömda bågen (normalmatrisen inte positivt definit) och gav ingen bana, så banans trösklar uppfylldes inte. Körning { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, en dämpad estimator, samma båge och trösklar, en bedömningsändring R2-A1 redovisad i docs/revisions) konvergerade: den skattade banan ligger inom { "0.36" } km RMS ({ "0.53" } km maximalt) från rekonstruktionen, trösklarna uppfylldes, men post-fit-Doppler-RMS är { "48.6" } mHz mot tröskeln { "30" } mHz, inte uppfylld, så raden förblir MODELLED. VAD SOM INTE GÄLLER: ingen skattad bana har uppfyllt varje registrerad tröskel; jonosfär, solplasma och merparten av antennförskjutningen (en radiell förskjutning på { "1.5" } m anpassas på utvecklingspasset) är inte modellerade.

seg-c7d292f14693 = Attitydreglering med sluten slinga och MRP-återkoppling med reaktionshjul

seg-f33781b74cc2 = Tröghetsriktad attitydreglering av ett stelt nav med tre eller fler balanserade reaktionshjul: MRP-återkopplingslagen L_r = -K sigma_BR - P omega_BR (Schaub och Junkins), motormoment för hjulen med minimal norm G_s u = -L_r begränsade till varje hjuls gräns, den kopplade dynamiken för nav och hjul där navets tröghet bär hjulens spinntröghet, kvaternionkinematik, RK4 med nollte ordningens hållning. Kan köras som scenariotypen <c1/> (slinga med sant tillstånd).

seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; bsk-hjulkörningen som ett separat verktyg, aldrig länkat eller inkluderat): rymdfarkostens nav, reactionWheelStateEffector (BalancedWheels, momentgräns på), simpleNav, inertial3D, attTrackingError, mrpFeedback (ingen integralterm) och rwMotorTorque vid dt = { "0.1" } s med dess RK4, mot Kshanas egen implementation i tre fall (tre ortogonala hjul; en fyrhjulspyramid; ett mättande fyrhjulsfall), trösklar förhandsregistrerade i xval/aocs-basilisk/PREREGISTRATION.md före koden och körningen. Alla trösklar höll vid första körningen. VAD SOM INTE GÄLLER: sensorbrus i slingan, integralåterkoppling, följningsstyrning, hjulfriktion, jitter, varvtalsgränser och effekt, någon verklig rymdfarkosts förstärkningar; jämförelsen kontrollerar implementationen av lagen och dynamiken mot en oberoende sådan, inte en flygregulator.

seg-455dc946c965 = Attitydskattning med multiplikativt EKF från ett gyro och en stjärnkamera

seg-553d043438b4 = Det multiplikativa EKF:et enligt Lefferts-Markley-Shuster: attitydfel i kroppssystemet och gyrobiastillstånd, propagering med gyrots vinkelhastighet minus biasskattningen och Farrenkopfs diskreta processbrus (vinkel- och hastighetsslumpvandring), uppdateringar från stjärnkameran med residualen { "2" } vec(q^-1 q_st) i Joseph-form och den multiplikativa återställningen; en diskret Farrenkopf-simulator för gyro och stjärnkamera. Typen <c1/> kan sluta regleringsslingan på sin skattning.

seg-846cb1eeb35c = Intern konsekvens: filtrets normaliserade skattningsfel i kvadrat mot sanning som simulerats från samma sensormodeller över Monte Carlo-seeds, och konvergens hos attityd- och biasskattningarna. VAD SOM INTE GÄLLER: ingen extern estimator eller flygdata har jämförts (Basilisk { "2.9.1" } har ingen MEKF-modul); sensormodellerna är läroboksmodellerna, utan snedmontering, skalfaktor eller effekter av stjärnkamerans synfält.

seg-059732bda693 = Attitydbestämning med Wahba/TRIAD/QUEST

seg-3ee6e56d790f = Optimal treaxlig attityd från viktade vektorobservationer (stjärn-/sol-/magnetometerriktningar): den deterministiska tvåvektormetoden TRIAD, Davenports q-metod (den exakta minimeraren av Wahba-förlusten — den optimala kvaternionen är egenvektorn till det största egenvärdet hos Davenport-matrisen K av storlek { "4" }×{ "4" }, löst med en symmetrisk Jacobi-egenvärdeslösning) och QUEST (Newton/sekant-rot av K:s karakteristiska ekvation med startvärde Σ vikter, därefter återvinning av kvaternionen via Gibbs-vektorn)

seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen m.fl., Nature Methods { "2020" }) — Kabsch/Markley-SVD-lösningen på Wahbas problem, en genuint oberoende algoritm (SVD av attitydprofilmatrisen) och kodbas jämfört med kshanas egenvärdeslösning för Davenport-K / QUEST-metoden med karakteristisk rot, som beräknar SAMMA entydigt definierade Wahba-optimala attityd. På brusfria viktade mängder av vektorobservationer återger TRIAD, q-metoden och QUEST scipys optimala rotation till <{ "1e-9" } rad (jämfört via det teckeninvarianta attitydfelsvinkeln). Det statistiska Monte Carlo-påståendet för brusiga fall att "optimal slår TRIAD" förblir MODELLED (ingen oberoende referens); endast enhetsvektorobservationer av punktriktningar — ingen modellering av sensorns synfält, bias eller tidskorrelation, och QUEST är singulär vid { "180" }° (q-metoden täcker det fallet)

seg-cd342cc48afc = Detektionsstatistika för GNSS-införvärvning med kvadratisk detektor

seg-6d97452de33e = Icke-koherent införvärvningsdetektor med kvadratisk detektor över en sökning i kodfas × Doppler: falsklarmssannolikhet (central χ² med 2M frihetsgrader), tröskeln som uppnår ett målvärde på P_fa (χ²-CDF inverterad med bisektion) och detektionssannolikhet (icke-central χ² med icke-centralitet 2M·ρ för post-korrelations-SNR ρ per cell), med den generaliserade Marcum Q-funktionen Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — en oberoende algoritm (kedjebråk för icke-central/central χ²) jämfört med kshanas serie för ofullständig gamma (raim::chi2_cdf / noncentral_chi2_cdf), som beräknar samma entydigt definierade KÄRNA för detektionsstatistika: den generaliserade Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²), detektionssannolikheten P_d, falsklarmssannolikheten P_fa och inversionen P_fa→tröskel, med överensstämmelse till ~{ "1e-6" } — samma oberoendegrund som i den Validated raden "RAIM/ARAIM integrity statistical kernel". Endast KÄRNAN: CFAR med cellmedelvärdesbildning per cell och förlusten när kod-/Dopplerfack överlappas förblir MODELLED

seg-77f425a38aa2 = Heltalsosäkerhet för bärvågsfas hos GNSS (LAMBDA)

seg-410ce8b6cebf = Fixering av osäkerhet med heltalsminstakvadrater på LAMBDA-vis: en volymbevarande heltalstransformation (Z) för dekorrelering (heltals-Gauss-storleksreduktion av L D Lᵀ-faktorn) + en exakt djupet-först-sökning med branch-and-bound enligt Schnorr–Euchner för heltalsminstakvadrater, med kvottestet på de två bästa kandidaterna (det validerade påståendet); plus den bootstrappade framgångsandelen med slutet uttryck P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), som kontrolleras enbart internt och ligger utanför det validerade påståendet

seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (dess källfil lambda.c, T. Takasu, BSD-2-Clause), en oberoende LAMBDA-reduktion och MLAMBDA-sökning kompilerad från C och körd som ett verktyg, på { "300" } slumpmässiga kovarianser (n { "2" } till { "10" }): heltalsminstakvadrater har en unik minimerare, så de fixerade heltalen måste vara identiska ({ "0" } avvikelser) och de två bästa kvadrerade normerna, som matar kvottestet, stämmer till { "1e-9" } relativt (uppmätt { "5.6e-13" }); toleransen fastställdes före jämförelsen. Validerat påstående: ILS-lösningen och dess två bästa normer. RTKLIB beräknar inte den bootstrappade framgångsandelen, som förblir internt kontrollerad mot en Monte Carlo av avrundningsprocessen; invarianterna för Z-transformen och uttömmande uppräkning finns kvar som stödjande kontroller. Endast heltals-Gauss-dekorrelering (omordningspermutationerna i hela LAMBDA-reduktionen påskyndar sökningen men ändrar varken det exakta ILS-svaret eller den bootstrappade andelen)

seg-4ad1ec05610f = B-plansstyrning och gravitationsassistans med patched conic

seg-d249aea7c3ea = Geometri för hyperbolisk förbiflygning (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, svängvinkel δ={ "2" }·asin(1/e), siktavstånd |B|=|a|·√(e²−{ "1" })), B-planets målpunktssystem Ŝ/T̂/R̂ och uppdelningen B·T̂/B·R̂, och en gravitationsassistans med patched conic (v∞-storleken bevaras, riktningen böjs av δ, heliocentriskt Δv={ "2" }·v∞·sin(δ/2) utan drivmedelskostnad) med Tisserand-parametern T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

seg-8e82da17a463 = Strålformning med CRPA-grupp mot störning (anti-jam)

seg-1744f527b4d1 = Nollställning med antenn för kontrollerat mottagningsmönster: komplexa gruppstyrvektorer a(û)=exp(j·k·pₙ·û), deterministisk nollstyrning (enhetsförstärkning mot SV, exakta nollor mot upp till N−{ "1" } störsändare via minimalnormen w=Aᴴ(AAᴴ)⁻¹b) och adaptiva MVDR-vikter w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) som självstyr djupa nollor mot starka störkällor (med en komplex linjäralgebrakärna skriven från grunden)

seg-8016dae66350 = numpy.linalg / scipy.linalg (LAPACK zgesv, komplex lösning) — en oberoende kodbas för linjär algebra jämfört med kshanas komplexa kärna skriven från grunden, som beräknar SAMMA entydigt definierade vikter: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) och minimalnorms nollstyrning w=Aᴴ(AAᴴ)⁻¹b, samt de resulterande gruppsvarsförstärkningarna, med överensstämmelse till ~{ "1e-9" } — samma klass av oberoende referens som i raderna Validated DOP (gnss_lib_py) och Fisher-information (numpy). MODELLED smalbandig grupp i fjärrfält med identiska isotropa element — ingen ömsesidig koppling, ingen felmatchning per element, ingen ändlig bandbredd (STAP) och inget skattningsfel i styrvektorn

seg-f2c973f14d52 = Klockbrus med potenslag enligt IEEE-1139 + golv för flicker-FM

seg-4a0159558671 = Konverteringen PSD↔Allan-varians enligt IEEE-1139 med fem koefficienter S_y(f)=Σh_α f^α → σ_y²(τ) (vit/flicker-PM, vit/flicker/slumpvandrings-FM), golvet för flicker-FM σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) som en förstklassig anpassningsbar term, och en icke-negativ anpassning av FM-familjen i basen { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" } som återger det golv som driftbasen { "{" }1/τ,τ,τ³{ "}" } inte kan representera

seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; koefficienter enligt Kasdin & Walter { "1992" } / Vernotte { "2015" }) — en oberoende tredjepartskodbas och citeringslinje som beräknar SAMMA entydigt definierade IEEE-1139 PSD→Allan-konvertering σ_y(τ) för var och en av de fem brustyperna med potenslag. kshanas powerlaw::allan_deviation stämmer med allantools slutna uttryck (vit/flicker-FM, RW-FM och vit PM till <{ "5e-9" } relativt; flicker-PM till ~{ "1e-5" } — den verkliga oberoendesignalen, eftersom kshana använder den tabulerade konstanten { "1.038" } i NIST-SP-1065 medan allantools använder hela 3γ−ln2), och golvet för flicker-FM √({ "2" } ln2·h_{ "{" }-1{ "}" }) stämmer med allantools över hela stegen — samma tröskel som raderna Validated MDEV/TDEV/Theo1/MTIE klarar. MODELLED stationär potenslagsmodell — ingen deterministisk driftterm (τ²); koefficienter per enhet / uppmätta golv förblir Modelled

seg-cc1ac065e684 = Utbyte av kovariansblock i CCSDS OEM

seg-ec4d44e7cf78 = Serialisera och tolka blocket COVARIANCE_START…COVARIANCE_STOP i CCSDS { "502.0" } OEM — positions-/hastighetskovariansen { "6" }×{ "6" } skriven som sin nedre triangel med 21 element (kanonisk ordning CX_X … CZ_DOT_Z_DOT) med den valfria COV_REF_FRAME, som kompletterar den befintliga skrivaren/tolken för OEM-tillståndsvektorer så att banbestämnings- och filterkovarianser går fram och tillbaka i standardformatet

seg-891b86506bf6 = oem { "0.4.5" } (MIT, https://pypi.org/project/oem/) — SAMMA oberoende CCSDS-502-tolk som den Validated raden "CCSDS OEM interoperability" förlitar sig på, en helt separat kodbas (egen KVN-tokenizer, tillståndsmaskin för kovariansavsnitt och numpy-matrisuppbyggnad). kshana skickar ett fullständigt OEM-segment med sitt omärkta KOVARIANSblock med nedre triangel av bara tal; oem tolkar det och rekonstruerar den symmetriska { "6" }×{ "6" }, som stämmer element för element med kshanas indatakovarians upp till f64-avrundning — en genuin rundtur för utbyte mellan bibliotek (jämförd mot oems rekonstruktion, inte en ny tolkning med kshana), vilket stänger radens tidigare lucka "ingen tredjepartsfixtur"

seg-ae061c7f082c = Felväxt vid fritt löpande INS/TRN och tröskelpassager

seg-7bacdc8aa0d8 = Budget för positionsfel mot längd på fritt löpande drift byggd från IMU-koefficienter, där varje felkälla (accelerometerbias, gyrobias, hastighetsslumpvandring, vinkelslumpvandring, skalfaktor vid gång och under ihållande specifik kraft) propageras genom en lokalnivå-INS-felmodell med nio tillstånd och Schuler-återkoppling (inertial::coast::ErrorDynamics enligt Groves 2:a uppl. kap. { "14" }: attityd-, hastighets- och positionsfel, den vertikala kanalen med sin gravitationsgradient, WGS-84-radier och normal gravitation, en horisontell plattform som styr norrut med den konfigurerade farten, latitude_deg och height_m; systematiska termer med en utökad matrisexponential, slumpvandringar med Van Loan), där de platta jordens monom behålls enbart som leading_order_m; bidragen kombineras under en angiven regel (rss / linjär summa / deterministisk summa med stokastisk rss); de driftlängder som når positionströsklar som anges av anroparen ({ "10" } m och { "50" } m som standard) lokaliseras med en framåtskanning efter den första passagen (first_crossing_s, eftersom de Schuler-begränsade kurvorna inte är monotona), med den dominerande källan vid varje passage; och ett TRN-begränsat läge som ger det största intervall mellan terrängfixar som håller varje tröskel. Kan köras som scenariotypen <c1/>

seg-a971ff07592a = Arbetscykel för apertur: navigering mot kommunikation

seg-5b0ba97379bf = En körning tar en kontaktplan (en lista med fönster aos_s/los_s som vart och ett ber aperturen om navigering eller kommunikation — samma fönstervokabulär som <c1/> avger, omvandlad av <c2/>), ett antal aperturer och en uttrycklig arbitreringspolicy, och returnerar navigeringsarbetscykeln, kommunikationsarbetscykeln, tomgångsarbetscykeln och avbrottet per session. Policyn är en indata med ett dokumenterat standardvärde (<c3/>; även <c4/> och icke-förebyggande <c5/>), och rapporten bär den lösta policyn, dess fullständiga definition samt definitionerna av arbetscykel och avbrott, eftersom en arbetscykelsiffra som anges utan sin arbitreringsregel inte är reproducerbar. Schemat är ett exakt intervallsvep över fönstergränserna, så ett fönster som slutar exakt där nästa börjar konkurrerar aldrig, och aperturssekunder för navigering, kommunikation och tomgång ackumuleras oberoende av varandra i det enda svepet. Kan köras som scenariotypen <c6/>

seg-656fd7d44a9e = Intern konsekvens, utifrån tre storheter som beräknats med olika uttryck i samma svep och sedan måste gå ihop. Aperturssekunder för navigering, för kommunikation och för tomgång ackumuleras var för sig — tomgång från (aperturer − |betjänade|) per elementärt intervall, aldrig som en rest — och deras summa kontrolleras mot aperturer × horisont_s, vilket en felaktigt parentetiserad gräns, ett dubbelräknat intervall eller ett bortfallet intervall omedelbart bryter; de betjänade tiderna per session måste dessutom var för sig summera tillbaka till de två tjänstetotalerna. Schemaläggarens strukturella egenskaper mäts i stället för att antas: betjänad tid kontrolleras vara icke-avtagande i antalet aperturer över { "200" } pseudoslumpmässiga planer för alla tre policyerna (inte självklart för den icke-förebyggande policyn, där en extra apertur ändrar vem som håller vad vid varje senare gräns), och gränsaritmetiken är fastlåst vid paret som tangerar/överlappar med en sekund där ett fel med en enhet annars skulle gömmas. Bryggan till passprediktorn kontrolleras mot utdata från <c1/>: med en apertur och ingen konkurrerande tjänst är aperturssekunderna för navigering lika med prediktorns egen summerade passlängd. Ingen extern oberoende referens görs gällande och ingen finns: förmågan ersätter handräkning i stället för att kontrolleras mot den, den medföljande kontaktplanen är illustrativ och inte flugen, och ingen operativ schemaläggare publicerar ett par av plan och svar med sin arbitreringsregel angiven — en arbetscykel som beräknats under en oangiven policy är inte jämförbar med en som beräknats under en angiven, och policyberoendet mäts (navigeringsarbetscykler på 100/150 mot 50/150 på identisk plan). Gir- och omställningstid, datavolym, bufferttillstånd, energi och länkslutning är undantagna i rapportens etikett i stället för att modelleras i tysthet

seg-43cd7aa7ab53 = RF-jamming mot navigering på månytan (J/S per satellit)

seg-e0566f37ad8f = Månnativt förhållande mellan störsändare och signal, effektivt C/N₀ och låsförlust för en selenografisk användare på ytan under en störsändare på månytan (eller upphöjd), över den illustrativa konstellationen av Moonlight/LCNS-klass från offentliga källor. Sammansätter den öppna jamming-kedjan (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) med den öppna geometrin för månhimlen (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri härleds på nytt. Till skillnad från jordtypen <c1/> är signalledet inte en fast mottagen effekt: varje satellits isotropa mottagna effekt är dess egen länkbudget EIRP − FSPL(snedavstånd), så J/S varierar satellit för satellit med avstånd och elevation på månen. Avger EN RAD PER SYNLIG LÄNK (epok, satellit) som JSON och som en artefakt *.table.csv, med båda mottagna effekterna som J/S är differensen av utskrivna bredvid sig; sammanfattande kvalitetsmått ligger bredvid den tabellen, aldrig i stället för den. Kan köras som scenariotypen <c2/>

seg-2a4393ae7c52 = Korskontroll av sammansättningen mot en oberoende kodväg i samma förvar: varje J/S per länk härleds på nytt som differensen mellan två länkbudgetar beräknade med linkbudget::received_signal_power_dbw, vars fria rymdförlust är det enda uttrycket { "20" }·log10(4πRf/c) i stället för den tretermssumma som jamming::free_space_path_loss_db använder — de två stämmer till < { "1e-9" } dB på varje rad (uppmätt sämsta fall { "7.11e-14" } dB, dvs. flyttalsavrundning). Den underliggande störningskedjan som den sammansätter är separat externt förankrad i tests/gnss_denied_jamming_resilience_reference.rs (oberoende omräkning med numpy/scipy av J/S och effektivt C/N₀, fastlåst vid Kaplan & Hegarty §{ "9.4" }, plus uppmätt C/N₀ från JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); månens geometri som den sammansätter är geometrin i lunar_service/lunar med sina egna oberoende referenser. Identiteter med slutna uttryck som kontrolleras här: ett halverat avstånd till störsändaren lägger exakt till { "20" }·log10({ "2" }) dB på varje rad; J/S är exakt invariant mot användarantennens huvudlobsförstärkning medan C/N₀ rör sig exakt med den förstärkningen; en elevationsmask ändrar ingen kvarvarande rad bit för bit. Själva raden förblir ReferenceImpl/Modelled: ingen uppmätt jamming-kampanj på månen finns att validera mot, och konstellationen är en illustrativ geometri av Moonlight/LCNS-klass från offentliga källor, inte en flugen efemerid

seg-4c116e25c5c5 = Denial-kontur för månen med ett osäkerhetsband från den uppmätta spridningen i C/N₀

seg-77828c25f3ab = Rapporten <c1/> vilar inte längre sin denial-kontur på en enda skalär. Den avger hela den uppmätta fördelningen av önskat signal-C/N₀ över tabellen per satellit — n, min, p05, p25, median, p75, p95, max, medelvärde, stickprovets standardavvikelse och stickprovets egen asymmetri (p95 − median) − (median − p05) — bredvid raderna per länk, som är oförändrade. Konturen redovisas sedan vid var och en av dessa ordningsstatistikor under BÅDA denial-kriterierna som motorn känner igen, aldrig det ena i stället för det andra: det etablerade effektkvotskriteriet (J/S = { "30" } dB, samma tröskel som attack_surface och tracking_loop använder och kriteriet bakom kolumnen <c2/> i den publicerade tabellen för länk-jamming på månen), och kriteriet låsförlust (det effektiva C/N₀ som faller till tracking_threshold_dbhz), som är kriteriet som rapportens egen kolumn links[].status bedöms med. Varje konturpunkt anges på båda axlarna i denial-planet — den störsändar-EIRP som krävs vid scenariots avstånd, och det denial-avstånd som gäller vid scenariots EIRP — så att bandet är ett intervall på samma axlar som ett konturdiagram ritas på. Bandkanterna ÄR contour(p05) och contour(p95): samma avbildning med slutet uttryck tillämpad på stickprovets egna kvantiler, inte ett sigma anpassat till stickprovet och inte median ± k·stdev, och rapporten säger det i en sträng band_definition bredvid siffrorna. stdev avges för kontinuitet och används av ingenting. En kvantil vars C/N₀ redan ligger vid eller under spårningströskeln har inget ändligt J/S som medför denial; de kolumnerna avges som null med en räknad orsak i stället för som ett oändligt värde eller en inklämd radie

seg-f7457156f960 = Intern konsekvens mot motorns egna framåtfunktioner, vilket är allt den här förmågan ärligt kan göra anspråk på. Varje konturpunkt är en inversion med slutet uttryck, och varje inversion kontrolleras genom att skicka tillbaka dess svar genom den FRAMÅTFUNKTION som rapportens egna rader bedömdes med: kolumnen J/S genom jamming::effective_cn0_dbhz (som måste returnera tracking_threshold_dbhz till < { "1e-9" } dB-Hz), kolumnen för avstånd genom jamming::free_space_path_loss_db och jamming::j_over_s_db (samma J/S till < { "1e-9" } dB), kolumnen för EIRP genom jamming::j_over_s_db vid scenariots eget avstånd. Konturen kontrolleras vidare vara GRÄNSEN för denial-mängden och inte en punkt inuti den — lock_status förlorar låsning vid en strikt olikhet, så utfallet mäts växla från DEGRADED till LOST över { "1e-4" } dB J/S på var sida om konturen, vilket en kontur som är fel med ett epsilon skulle misslyckas med. Den starkaste kontrollen är per länk och inte per kvantil: att tillämpa samma avbildning på varje rads eget C/N₀ återger rapportens statuskolumn exakt — { "0" } avvikelser på { "38" } av { "38" } rader vid den dokumenterade arbetspunkten (kind = lunar-jamming, varje indata standard utom jammer.range_m = { "25 000" } m), där { "26" } rader är LOST och { "12" } inte är det. Monotonicitet mäts, den antas inte: { "20 001" } samplingar över [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } överträdelser av ett strikt avtagande avstånd och en strikt växande erforderlig effekt, så kvantilordningen i bandet påvisas i stället för att påstås. ExternalDataset avböjs och Validated med den: ingen uppmätt jamming-kampanj på månen finns att jämföra en denial-radie mot, konstellationen är en illustrativ geometri av Moonlight/LCNS-klass från offentliga källor och inte en flugen efemerid, och konturens indata (EIRP, störsändareffekt, antennförstärkningar, brustemperatur) är representativa storleksordningar. ReferenceImpl övervägdes och avböjdes också — inversen och framåtuttrycket är SAMMA algebra läst i två riktningar, så rundturen fångar transkriptions- och teckenfel men är inte en oberoende implementation; att kalla den en korskontroll vore det lånade oberoende som matrisens invarianter finns för att förhindra. Vad bandet ger mäts och anges i stället för att påstås: vid den arbetspunkten är konturen med en enda skalär { "27.402916" } km och lägger { "25" } km på den denial-drabbade sidan för alla { "38" } rader, medan bandet { "21.256108" } .. { "29.921360" } km innehåller arbetspunkten och därför redovisar den uppdelning som tabellen faktiskt visar. De två kriterierna mäts också vara oense — effektkvotsbandet ({ "38.186527" } .. { "53.691675" } km) innehåller inte { "25" } km alls — vilket är anledningen till att båda skrivs ut

seg-2d3944107ba0 = Detektionsstyrka hos övervakare av integritet över flera modaliteter

seg-38bc7c0bfe57 = Rapporten hybrid-optical-rf anger vad chi-tvåövervakaren över flera modaliteter faktiskt kan DETEKTERA, inte bara att den klarar ett felfritt fall: den minsta detekterbara biasen per övervakad axel (öst, nord, upp, klocka) vid scenariots angivna sannolikheter för falsklarm och missad detektion, detektionsstyrkekurvan på båda sidor om den, den brusfria biasmultipel där den realiserade statistikan först passerar tröskeln och tiden till detektion för en biasramp med angiven hastighet. Fel injiceras också genom den verkliga övervakaren och den statistika den returnerar redovisas bredvid den analytiska prediktionen

seg-38cabd4921c1 = Kovariansens återväxt efter överlämning mot varningsgränsen

seg-9287268bbada = Rapporten hybrid-optical-rf redovisar filtrets processbrusmodell och anger hur länge lösningen efter överlämningen håller sig inom varningsgränsen: för båda överlämningsriktningarna tar den kovariansen per axel som överlämningen lämnade efter sig, propagerar den framåt under ett angivet slumpvandringsbrus och redovisar tidpunkten då det täckningsskalade 1σ når gränserna för varning i horisontal led, vertikal led och tid, vilken gräns som träffas först, tidskonstanten för variansens fördubbling samt en samplad utrullningsprofil som omsluter gränspassagen. Processbrusets PSD:er, täckningsfaktorn och varningsgränserna är alla indata med dokumenterade standardvärden

seg-c85b822227f3 = Ingen extern oberoende referens. Gränspassagen är en sluten lösning av slumpvandringens variansväxt, och testerna räknar om den oberoende utifrån de värden som rapporten själv publicerar, inte utifrån sändarens interna värden. Startkovariansen är bit för bit fastlåst till det spår som överlämningsblocket redan redovisade, så utrullningen kan inte propagera en kovarians som ingen annan har sett. Processbrusets PSD:er är MODELLED representativa indata och gränspassagens tider skalar direkt med dem, vilket skalningstestet anger som en uppmätt egenskap och inte som ett påstående. ExternalDataset avstås från medvetet: utrullningstiden är en direkt funktion av två Modelled PSD:er och av varningsgränser som själva är representativa, och det finns ingen uppmätt utrullning vid lunär optisk/RF-överlämning att jämföra med. En extern oberoende referens skulle här kräva en publicerad kurva för kovariansväxt efter överlämning eller för holdover-noggrannhet hos en jämförbar mottagare med angiven processbrusmodell, kontrollerad mot en tolerans

seg-a3b8272862aa = Antennmönster utanför huvudriktningen i exporten av lunar geometri

seg-27d246503a48 = Exporten av geometri per satellit anger, per (epok, satellit), vinkeln utanför huvudriktningen VID SATELLITEN och sändningsförstärkningen mot platsen utifrån det verkliga mönstret för en likformigt belyst cirkulär apertur (Airy), och redovisar antalet länkar i strålen enligt det mönstret BREDVID antalet länkar i strålen enligt den symmetriska approximationen mellan förstärkning och strålbredd (θ_3dB[deg] = √(31000/G_lin)), med skillnaden utsänd som en uttrycklig korrektion i länkar, i satelliter per epok och som den sämsta enskilda epoken. Båda de implicita aperturverkningsgraderna för approximationen redovisas ({ "0.641" } mot regeln med { "70" }·λ/D grader som den anges med, { "0.920" } mot en likformig cirkulär apertur) så att den verkningsgrad som den tyst förutsätter anges i stället för att härledas. Av som standard: blocket visas bara när både en exportplats och en apertur är angivna

seg-6fbfa234ef3e = Spårningsslingans låsförlust och spoof-intrång under störning

# c1: tracking-loop
seg-f78c1f28a3f7 = Låsförlust beräknad utifrån slingdynamik i stället för ett effektförhållande: termiskt 1σ-jitter för bärvåg (Costas) och kod (icke-koherent early/late) mot C/N₀ med kvadreringsförlusten, mot de angivna reglerna 3σ_PLL + θ_e ≤ { "45" }° och 3σ_DLL + ramplagg ≤ d/2 chips; C/N₀-trösklar för bortfall och återlåsning där den styrande slingan namnges och hysteresen HÄRLEDD ur den bredare inlåsningsbandbredden i stället för att påstås; den deklarerade tiden till låsförlust från en låsdetektor med två trösklar och bekräftande dröjtider, redovisad separat från den fysikaliska tiden till fasflykt (Viterbis medeltid mellan cykelslipp, i log₁₀ s eftersom den spänner över hundratals dekader); den största kodsvepningen och bärvågsdopplertakten som offrets slingor kan följa; samt den AVVISNINGSRADIE som slingdynamiken ger, redovisad vid sidan av den befintliga effektförhållanderadien med deras tecknade skillnad som ett eget namngivet fält. Kan köras som scenariotypen <c1/>

seg-69155fb79ebd = Kovarians för lunära VLBI-stationers koordinater utifrån ett spårningsschema

# c1: lunar-vlbi-fim
seg-141285301f58 = Fördröjningspartialer ackumulerade över ett schema av baslinjer × epoker till en Fisher-informationsmatris, inverterad till stationskoordinaternas kovarians och sigma per stationskoordinat, och ersätter en antagen isotrop ekvipartitionslänk från en skalär fördröjningsprecision. Tillståndet bär jordfasta (ITRS) stationskoordinater, så jakobianen är den tröghetsbundna partialen roterad med varje epoks GCRS→ITRS-matris, och jordrotationen är det som gör koordinaterna observerbara — rapporten MÄTER den jordfasta siktlinjesvepningen och beacondeklinationen i stället för att anta dem. Rang, datumdefekt, konditionstal, informationsspektrum och det fria nätverkets nollrum redovisas vid varje körning, och vid rangbrist publiceras huvudsigmat som NULL med en status i stället för att läsas ur en nästan singulär invers. Ekvipartitionsvärdet c·σ_τ·√(g/N) för SAMMA schema skrivs ut bredvid det beräknade med deras kvot, tillsammans med den isotropa spårgränsen √(p/trace(M)) som AM-HM gör till ett hårt golv. Kan köras som scenariotypen <c1/>

seg-0f4d023fe2d4 = Kovarians för koordinater för lunara ytpunkter utifrån ett VLBI-fördröjningsschema, hållen skild från jordstationens

# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Ett tredje datumval, <c1/>, som håller varje jordstation fast och skattar enbart BEACONENS månfasta koordinater — den konfiguration som en osäkerhet för en lunar ytpunkt faktiskt anges för, eftersom jordstationernas koordinater är en indata till fördröjningsmodellen och inte en okänd i den. Det finns eftersom stationsnivåns kovarians och ytpunktens kovarians är OLIKA STORHETER åtskilda av hävarmen ρ/B, och inget tidigare hindrade att den ena angavs mot den andra. Det utsända blocket <c2/> bär ρ, den längsta baslinjen, hävarmen, ytpunktsformen av ekvipartitionslänken c·σ_τ·(ρ/B)·√(g/N), det beräknade beaconsigmat per koordinat och deras kvot — kvoten är null i stället för vilseledande när beaconen inte skattas eller matrisen har rangbrist. B tas som den LÄNGSTA förekommande baslinjen, den mest gynnsamma, så kvoten kan bara underskatta. Kan köras som <c3/> med <c4/>, vilket vägras med ett meddelande som namnger den saknade indatan när beaconen inte skattas

seg-18096ae23d96 = Slutna samband, utan att någon extern oberoende referens görs gällande eller finns. Hävarmen kontrolleras mot ρ/B och de två ekvipartitionsformerna mot varandra till { "1e-15" } — algebraiska identiteter, så de fångar ett kopplingsfel och inget annat, och betecknas så. Det substantiella resultatet är MEASURED i stället för påstått: en fördröjning från en fast baslinje begränsar beaconens RIKTNING, så siktlinjekomponenten når informationsmatrisen bara genom närfältets avståndsterm, och testet läser av den resulterande anisotropin ur det utsända spektrumet i stället för att härleda den. AM-HM gör √(p/trace(M)) till ett hårt golv, så en isotrop ekvipartitionslänk kan bara UNDERSKATTA, och kvoten beräknat över ekvipartition är exakt den anisotropi som den bortsåg från. MEASURED på paret Goldstone-liknande/Canberra-liknande vars kordal är { "10726.748" } km: över { "112" } samplade dygn medger { "36" } ingen ömsesidigt synlig epok alls vid en { "10" }°-mask, det mesta som någonsin är ömsesidigt synligt är { "17" } av ett schema med 49 sampel, och på de { "73" } användbara dygnen går trekomponentskvoten från { "113.9" }× till fyra storleksordningar mer, median { "1513" }×, medan en begränsning till de två tvärgående riktningarna som siktlinjen inte svälter ger { "3.94" }× till { "25.8" }×, median { "7.8" }×. VAD DEN HÄR RADEN INTE GÖR GÄLLANDE: att något av dessa tal är en egenskap hos en verklig kampanj. Den fastställer att ytpunktsstorheten nu BERÄKNAS i stället för antas, och att den inte tyst kan bytas mot stationsnivåns. Förblir ReferenceImpl/MODELLED: ingen publicerad kovarians för lunära VLBI-ytpunkter finns att validera mot, stationerna och beaconplatsen är illustrativa i stället för kartlagda, och efemeriden, klockorna, troposfären och jordorienteringsparametrarna hålls FASTA, så detta är en Cramér-Rao-gräns för en reducerad parametermängd och optimistisk i sig själv. Samma storhet på kärnvägen (beacon på DE440-månen) är validerad på sin egen rad, "…, kernel path"; på den här analytiska vägen ligger det minsta beaconsigmat { "3.9" } % under den radens SPICE-referens, vilket är varför den här raden förblir MODELLED

seg-8958521eedf7 = Kovarians för koordinater för lunara ytpunkter utifrån ett VLBI-fördröjningsschema, kärnväg

# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = Beaconkovariansen med alla stationer fasta i scenariot lunar-vlbi-fim (varje jordstation hålls, beaconens månfasta koordinater skattas ensamma) med beaconen placerad på JPL DE440-månen läst av motorns egen kärnläsare (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Bara månens centrum skiljer sig från den analytiska vägen; IAU { "2015" }-kroppsrotationen, stationerna, jordrotationen och linjäralgebran är desamma. De validerade utdata är observationsmängden, informationsspektrumet { "3" } x { "3" }, rangen och konditionstalet, de tre kroppsfasta beaconsigmana och deras RMS, hävarmen och kvoten beräknat över ekvipartition, på standardschemat. Kan köras som scenariot <c1/> med datum = "all-stations-fixed", estimate_beacon = true och planetary_kernel_path satt

seg-0315968c8214 = Lunär differentiell PNT — budget för restfel i korrektionslänken

seg-c6785166a44c = De tre termer som en differentiell korrektion får mellan den epok den beräknas för och den epok den används i, var och en tidigare lämnad som omodellerat utrymme: undersökningsfel hos referensstationen (korrelerat över satelliter, oberoende av baslinjen, ~{ "1" }:{ "1" } positionsöverföring och bevisligen inte DOP-förstärkt), korrektionens åldrande (den frusna omloppsfelsvektorn återprojicerad på den siktlinje som motorns egen propagator placerar satelliten på en latens senare, plus klockdrift c·σ_y(τ)·τ från den kalibrerade potenslagen) och likformig länkkvantisering över en exakt full skala på ±(orbit_err + clock_err) med variansen step²/12. Redovisas i både avstånds- och positionsdomänen, bredvid — aldrig i stället för — det befintliga restfelet och skyddsnivån, med en latenskurva bredvid det enskilda talet

seg-29b8e6c12471 = Slutna samband och självkonsistens: likformig kvantiserares varians step²/12, den exakta kovariansutbredningen (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ som kollapsar till σ·PDOP för lika σ, undersökningstermens överföring { "1" }:{ "1" } som en följd av û_user ≈ û_ref, och kvadratursluten vid bortkoppling. PDOP-korskontrollen mot orbit::dop delar normalmatrisen [−û, { "1" }], så det är en konsistenskontroll och betecknas som en sådan, inte som en oberoende referens. Ingen ExternalDataset finns eller görs gällande: ingen lunar yt-station har en publicerad kartlagd noggrannhet, ingen lunar differentiell korrektionslänk har en publicerad latens eller ett publicerat meddelandeformat, och kvantiseringsresultatet är ett slutet uttryck och ingen mätning. RTKLIB — redan den externa kodreferensen för enkeldifferens- och viktad minsta-kvadrat-kärnan — skulle kunna köras med en medvetet felaktigt inmätt bas för att bekräfta undersökningsöverföringen { "1" }:{ "1" }, men det är oberoende kod över samma första ordningens siktlinjealgebra. STORLEKARNA ÄR MODELLED: undersökningens standardvärde är den här cratens egen allokering för lunär ramrealisering och inte en uppmätt station, latensen och antalet bitar är ILLUSTRATIVE indata, och tillväxten av själva felvektorn i den utsända efemeriden är inte modellerad alls — anges i den utsända strängen för åldrandelagen, eftersom det är den term som mest sannolikt dominerar en verklig länk

seg-c42646ae4707 = Täcknings- och noggrannhetskarta för lunära referensstationer

# c1: lunar-station-coverage
seg-1f9834b32629 = Monte Carlo-svep av den lunära differentiella PNT-modellen över ett sydpolärt användarrutnät och ett dygn av epoker (typen <c1/>): för en differentiell referensstation på en känd sydpolsplats, per punkt och över regionen, percentilen för korrigerat och okorrigerat positionsfel (3-D, horisontellt, vertikalt), tillgänglighet med en orsak för varje otillgänglig epok (user_lt4, station_missing_sat), täckning mot en tröskel som angivits före körningen, skyddsnivåer enligt DO-229E, täckningsradien per azimutsektor och korrektionslänkens budget vid stationen och vid den sämsta punkten. Inget påstående om prestandan hos något verkligt system; inte knutet till eller stött av någon myndighet

seg-7ecf4b0038b0 = Lunära terränghorisontmasker från en angiven profil eller en polär DEM

seg-7102948907bc = Azimutberoende horisontmasker per plats för typen lunar-station-coverage (referensstationen och varje användarpunkt) och rutnätet moonlight-service-volume och dess exportplats per satellit (varje exportrad får clears_terrain), i skylinetabellformatet { "0.36" } (skyline::Skyline, linjärt i azimut med slutning vid { "360" } grader; en angiven profil och en DEM-horisont vid en plats kombineras som sitt punktvisa maximum): en angiven [terrain] station_horizon eller user_horizon märkt med sin källa, och/eller en horisont strålföljd över en sydpolär stereografisk DEM (den gridade polära layouten för LRO LOLA, läst från en deskriptor som fastställer dess storlek och SHA-256, eller en latitud/longitud-ruta realdata::lola_dem med [terrain] dem_tile_path, återgiven med sin SHA-256) längs storcirklar på månsfären med exakt krökning, från en angiven masthöjd, med ett angivet azimutsteg och räckvidd. En satellit räknas vid en plats när den klarar den platta mask_deg och horisonten vid sin azimut (lunar_service::topocentric); en epok som horisonten lämnar med färre än fyra satelliter vid en punkt, där den platta masken ger fyra, räknas som den otillgängliga orsaken terrain_masked. Den medföljande DEM:en är ett utsnitt av den allmängods-produkten LOLA LDEM_75S_240M, omsamplad med blockmedelvärde { "5" } x { "5" } till { "1200" } m (data/lunar-dem/NOTICE.md). Saknas den behåller varje plats den platta masken och varje dokument är byte för byte identiskt

seg-d37bb01e270b = Flervägs- och mottagarhårdvaruermer för lunära referensstationer

seg-1103199f019b = Den valfria sektionen [receiver] i lunar-station-coverage (LRS-02): elevationsberoende flervägssigma(el) = a + b exp(-el / el0) vid användaren och vid stationen (den funktionella formen enligt RTCA DO-229 för luftburen utrustning, med a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } grader som standardvärden; på månen är varje värde ILLUSTRATIVE), vitt vid användaren och Gauss-Markov av första ordningen över epoker vid stationen (rho = exp(-dt / tau)); termiskt kodbrus för early-minus-late DLL sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); biaser mellan kanaler per kanal, konstanta under ett försök, vid användaren och vid stationen. Stationstermerna går in i dess korrektioner, användartermerna i de råa och korrigerade mätningarna, var och en på sin egen seedade ström. Saknas sektionen är varje dokument oförändrat

seg-4fbc7d86b491 = Slutna uttryck och statistik för modellens egna dragningar (InternalConsistency): DLL-formeln mot en handberäkning, DO-229-formen, nollbaslinjens differens mellan två mottagare, Gauss-Markov-korrelationen vid lag 1. Ingen lunar flervägs- eller mottagarmätning finns att jämföra med; värdena är ILLUSTRATIVE och inget här är ett påstående om någon verklig mottagare

seg-03796cb741b6 = Tillväxt av efemidefel hos lunära referensstationer över korrektionens latens

seg-13b0ae9a874a = Den valfria indata orbit_err_growth_m_per_s i lunar-station-coverage (LRS-03): en korrektion som tillämpas latency_s efter att den beräknades missar tillväxten g latency_s av det utsända omloppsfelet, g isotropt med 3-D RMS-takt, dragen per satellit och försök på sin egen seedade ström (avstånd 1-sigma-takt tau / sqrt({ "3" })), ovanpå återprojiceringen av det frusna felet på siktlinjen. Saknas den är varje dokument oförändrat. Ett K5-tillägg till jämförelsen med publicerade påståenden, förhandsregistrerat ensamt, kör K5 vid { "0.001" }, { "0.01" } och { "0.1" } m/s (ILLUSTRATIVE)

seg-90307f07e0ef = Lösningslägen för en lunar referensstation: höjdbegränsning, tre satelliter, fönster med statisk användare

seg-366c7ad03fb2 = Den valfria sektionen [solution] i lunar-station-coverage (LRS-06): en pseudomätningsrad för höjd up . dx = e_h med angiven 1-sigma, viktad mot avståndsraderna, ett minimum på tre satelliter som endast tillåts tillsammans med den, samt en viktad minsta kvadrat-lösning över de senaste window_epochs epokerna med en gemensam statisk position och en klocka per epok (ett filters svar för en statisk position utan processbrus över samma data; epokernas fel behandlas som oberoende). Om sektionen saknas är snapshot-lösningen och alla dokument oförändrade. Ett tillägg till jämförelsen med publicerade påståenden, med källornas lösningssätt, förhandsregistrerat för sig

seg-611ba369ed00 = Noggrannhet och täckning hos en lunar referensstation jämfört med publicerade påståenden

seg-4fe4f1cffa2b = Slaget lunar-station-coverage körd under de offentliga antagandena i det publicerade materialet om en lunar differentiell referensstation (fyra navigationssatelliter i frysta elliptiska banor på { "24" } h, { "10" } m { "95" } % SISE, { "0.30" } m kodbrus, { "1" } s och { "600" } s korrektionsfördröjning, en stationsutmätning under decimeter, den publicerade exempelplatsen för stationen, de sydpolära cirklarna på { "300" } km och { "600" } km) och poängsatt mot källornas numeriska påståenden under sex ensidiga trösklar som fastställdes i förväg, före körningen: täckning av hela sydpolen vid p95 under en meter (K1, K2), korrigerat p95 under en meter och på decimeternivå (K3, K4), under en meter bibehållet vid { "600" } s fördröjning (K5) samt noggrannhet bibehållen från { "10" } km till { "500" } km baslinje (K6)

seg-478225d0a8e1 = Kärna för lunar ARAIM-skyddsnivå

seg-863690a44f21 = Steget från geometri till kovarians för den lunara skyddsnivån — (GᵀG)⁻¹ över hela synfältet och varje undergeometri med ett enskilt fel, projicerat på den lokala vertikalen och spåret av det horisontella blocket — samt dess statistiska kärna: Bonferroni-multiplikatorn för detektorn, den gaussiska övre svansen för varje felhypotes och rotlösningen som avbildar en integritetsriskbudget på en skyddsnivå, över en lunar servicevolym med 7 punkter

seg-8191906fc700 = Två etablerade tredjepartsimplementationer kombinerade, båda körda offline, med fixturen återskapad från början till slut och verifierad som identisk byte för byte. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c kompilerad från C-källkod med -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverterar normalmatrisen med Crout LU med partiell pivotering, en algoritm utan samband med kshanas handskrivna Gauss-Jordan-invertering invert4(); numpy.linalg.inv (LAPACK getrf/getri) inverterar om var och en som en tredje oberoende invers och stämmer med RTKLIB inom { "1.112e-12" } relativt. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) levererar norm.isf, norm.sf (Cephes ndtri/ndtr) och optimize.brentq mot kshanas Numerical-Recipes-serie för ofullständig gammafunktion, bisekterad invers och bisektion i 200 steg — och SciPys direkta sf är en annan numerisk väg ut i den yttersta svansen än kshanas { "1" } − Φ, så att kancelleringen i den djupa svansen mäts i stället för att speglas. Den vertikala axeln är radiell enhetsvektor (definitionen av lokal vertikal på en sfärisk måne) och den horisontella variansen är spåret av det horisontella blocket, så ingen konvention för azimut Öst/Nord delas. UTTRYCKLIGEN INTE VALIDATED AV DEN HÄR RADEN: σ_URE, förhandsfördelningen av fel per satellit och den illustrativa konstellationen av typ Moonlight/LCNS är MODELLED indata som överlämnas till den oberoende referensen som de är; och FORMEN på MHSS-integritetsekvationen för enskilda fel är avskriven från samma publicerade gräns som kshana implementerar — en delad sluten form är ett delat antagande, så den här raden täcker en felaktig utvärdering av ekvationen, inte ett felaktigt val av den. Ingen tredjepartsimplementation av MHSS ARAIM är tillgänglig (RTKLIB har ingen ingång för skyddsnivå, ingen sådan PyPI-distribution finns, Stanford MAAST är MATLAB), vilket är den utestående uppgraderingen

seg-0ec1699f5754 = ARAIM MHSS-skyddsnivåer mot publicerade referensvektorer

seg-fbaaf3ad7648 = Själva ekvationen för skyddsnivån i multiple-hypothesis solution-separation: viktad minsta kvadrat för hela synfältet och per felläge på en East/North/Up-geometri med ett klocktillstånd per konstellation, delslösningarnas sigman, sigman för lösningsseparationen och ensidiga projektioner av nominell bias, Bonferroni-trösklarna K_fa, riskfördelningen för ej övervakade fel samt VPL/HPL som löser integritetsriskekvationen. Kan köras som scenariotypen <c1/>

seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } juni { "2019" }), Appendix D, genomräknat numeriskt exempel — publicerade INDATA (geometrimatris för 10 satelliter i 2 konstellationer, diagonalerna för C_int/C_acc, b_nom, P_sat, P_const, LPV-200-konstanter) och publicerade UTDATA (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } och sex mellanresultat för konstellationsfel), hämtat 2026-09-20, källans SHA-256 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Stämde vid referensens EGEN angivna tolerans TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT och σ_v_acc till sin tryckta precision. Samma undergrupps Milestone { "3" } Report ({ "2016" }) Annex A §A.IX anger samma exempel men är internt inkonsekvent — ett teckenfel i rad { "3" } i G (+{ "0.7477" } där dokumentet från { "2019" } skriver −{ "0.7477" }; med plustecknet blir dokumentets eget σ_v_acc { "0.8690" } m mot dess publicerade { "1.47" } m), och ett K_fa_3 utvärderat vid { "57" } felägen medan dokumentet anger N_fault_max = { "1" }, dvs. { "12" }, så dess EMT följer tröskeln för 57 lägen och dess VPL/HPL gör det inte. Ingen implementation som följer dokumentet kan återskapa alla dess utdata samtidigt. Dess geometrimellanresultat återskapas exakt och dess skyddsnivåer registreras som uppmätta avvikelser (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), uteslutna ur acceptanssiffran; toleransen vidgades inte för att rymma dem. OMFATTNING: endast N_fault_max = { "1" } — felmängder med flera händelser avvisas i stället för att trunkeras, och uteslutning, chi-två-konsistenskontrollen och omfördelningssteget för dubbelräkning förblir MODELLED

seg-7bfcb5c6a985 = ARAIM med samtidiga felhypoteser för flera satelliter

seg-15043111e437 = araim_reference::add_v42_subset_plan: regeln i ADD v4.2 för bestämning av delmängder (P_THRES, FC_THRES, övervakade delmängder med minst borttagna först) generaliserad från par till samtidiga kombinationer av upp till max_order satellit- och konstellationshändelser, med den exakta förhandsfördelningen P_no fault prod q_e; add_v42_protection_levels_to_order kör skyddsnivåvägen i ADD v4.2 på den (ordning { "2" } är exakt den befintliga vägen). raim::araim_subset_raim (tillval): avancerad RAIM över den hypotesmängden, där varje övervakad delmängd är ett läge (p_fault, T, b, sigma) i integritetsrisksumman, delmängder som inte går att observera flyttas till den ej övervakade risken, budgeten skalas med ADD:s fördelning av den ej övervakade risken, och delmängden med störst normaliserad separation rapporteras när ett fel upptäcks. Förhandsfördelningar som kräver djupare delmängder än max_order avvisas, trunkeras aldrig

seg-6c6076ea1eee = Intern konsistens (InternalConsistency): reduktionen av ordning 2 till den MAAST-kontrollerade ADD v4.2-vägen, oberoende härledning av förhandsfördelningarna och ett konstruerat fel på två satelliter. Ingen körning med MAAST eller RTKLIB utöver par har gjorts, så de djupare hypotesmängderna och delmängds-RAIM:s skyddsnivåer är inte externt kontrollerade. araim_subset_raim delar araim_dual_raims förenklingar (ett sigma för integritet och noggrannhet, en klocka, den vanliga normalsvansen): den följer inte ADD

seg-48ca01332f8f = RAIM vid sidan av kvalitetsmåtten för klock-holdover

seg-890f1006a75d = Den valfria sektionen [integrity] i klockslaget (clock_integrity::run): från en angiven plats och förinställningar för konstellationer (geometry::sky_geometry), vid varje integritetsepok medan GNSS-tidslinjen inte är nekad, snapshot-RAIM (raim::snapshot_raim: paritets-chi-två-test, skyddsnivåer med lutning) på satelliterna över masken med slumpmässigt dragna gaussiska residualer med angivet sigma och en valfri angiven bias; ett separat integrity_fom-block med utlåtanden per epok, skyddsnivåer och tillgänglighet. Nekade epoker rapporteras som otillgängliga, extrapoleras aldrig; kvalitetsmåtten för holdover är oförändrade och utan sektionen är utdata identiska byte för byte

seg-c2860bf4b562 = Intern konsistens (InternalConsistency): skyddsnivåerna är de från snapshot_raim, som är validerad mot RTKLIB på sin egen rad, omräknade på samma geometri; beteende utan fel och med injicerat fel. Himlen är en representativ förinställd geometri (inte en daterad almanacka), residualerna är syntetiska och sigma, larmgränserna och sannolikheterna är angivna indata; inget här är ett påstående om en verklig mottagares tillgänglighet

seg-9cbb4ee7588a = Rumslig, brusig observerbarhet av bågsträcka för flera familjer av cislunara banor

seg-5ebd771deef8 = Tröskeln för observerbarhet av bågsträcka i cislunar rymd i den RUMSLIGA CR3BP med sex tillstånd i stället för den plana med fyra tillstånd, över familjerna DRO, L2-halo och L2 nära-rätlinjig halo, med mätbrus som går in i Gramianen och TVÅ kriterier rapporterade eftersom det inte finns något enskilt ärligt: det publicerade rangkriteriet, som bevisligen är invariant mot ett homoskedastiskt mätsigma (blekning multiplicerar observerbarhetsmatrisen med en skalär, vilket lämnar det relativa singulärvärdesspektrumet och därmed rang, defekt och konditionstal oförändrade), och ett skattbarhetskriterium — den första båge där den formella 1σ-osäkerheten i positionen för chief-satellitens begynnelsetillstånd understiger en angiven gräns — vilket är det som faktiskt rör sig med bruset. Varje tröskel bär det epokrutnätsintervall den ligger i; ett kriterium som inte nås är null med en orsak. Plant läge förblir standard och familjer utanför planet avvisas där i stället för att plattas ut till ett tillstånd som inte kan representera dem

seg-046231819882 = En oberoende radechelon-rang med Gauss-elimination och partiell pivotering bekräftar varje utlåtande om rang för sex tillstånd — en annan algoritm som inte delar någon kod med eigen-/SVD-vägen som testas. Tillståndsövergångsmatrisen { "6" }×{ "6" } för CR3BP som den bygger på har sin egen oberoende referens (ReferenceImpl) mot SciPys variationsintegration, och begynnelsevillkoren för halo/NRHO kommer från en korrektor som återskapar den publicerade södra L2-Gateway-banan { "9" }:{ "2" }. Det befintliga filtret med kvadratrot av informationen räknas uttryckligen INTE som bekräftelse: det använder samma jakobianer och reduceras till samma normalmatris, så det är en konsistenskontroll mellan två numeriska maskiner, och den utsända tilläggsetiketten säger så. INTE externt förankrad, och ExternalDataset avstår därför från att lånas från STM:ets rad: själva tröskelbågarnas längd beror på den MODELLED konstellationsutformningen, epokrutnätet och — mätbart, med upp till { "40" }× — på singulärvärdestoleransen. Det publicerade plana värdet { "2.09" } h återskapas exakt vid rel_tol = { "1e-6" } och är självt toleransberoende ({ "10.25" } h vid { "1e-4" }, { "0.42" } h vid { "1e-8" }), vilket är en egenskap hos kriteriet och inte hos banan. Ingen offentlig datamängd publicerar en tröskel för observerbarhet av bågsträcka för en vald cislunar konstellation. MEASURED-RESULTAT: tröskeln för sex tillstånd i rymden är { "22.17" } h för L2 NRHO och { "40.42" } h för L2-halo, och FINNS INTE för den plana DRO-familjen som det publicerade påståendet härleddes på — rang { "4" } av { "6" } med datumdefekt { "2" } och två exakt nollställda egenvärden, en strukturell defekt som ingen bågsträcka återställer

seg-e250321394bc = Fel i prediktion av jordorientering i operativ stil, uppmätt förutsagt mot slutligt

seg-0e443d241460 = En anpassning med minsta kvadrat av bias plus ändringstakt över ett släpande fönster plus de huvudsakliga periodiska termerna — årlig, halvårlig och de två huvudsakliga zonala tidvattnen för UT1; Chandler, årlig och halvårlig för polen — extrapolerad med den sista residualen i fönstret förd framåt: den klass som IERS Bulletin A använder, i stället för den persistensprediktor som den publicerade horisonten vilade på. Poängsatt på det enda ärliga sättet: en prognos för T+h byggd av snabba Bulletin A-rader vid eller före T, mätt mot den SENARE publicerade slutliga Bulletin B vid T+h, med persistens poängsatt över samma epokmängd mot samma slutliga värden bredvid. En målepok utan publicerat slutligt värde utelämnas i stället för att poängsättas om mot den snabba kolumnen; en periodisk term som fönstret inte kan begränsa rapporteras som förkastad med de cykler den faktiskt spänner över; ett ofullständigt fönster avvisas i stället för att tyst förkortas

seg-f4efd94dd746 = Lunart datum för referenssystem från en observationskampanj

seg-a6972eb89d7d = Det sjuparametriga Helmert-datumet propagerat från en SIMULERAD OBSERVATIONSKAMPANJ i stället för återskapat från en injicerad transform. Jordstationer observerar en källbelagd katalog över beacons på månytan enligt ett uttryckligt schema; de lunara VLBI-fördröjningspartialerna ackumuleras till en Fisher-informationsmatris för beacon-koordinater och förs genom Helmert-utformningen A = [I₃ | [p]ₓ | p] till H = AᵀM_bA, så att den rapporterade datumnoggrannheten är en funktion av observationsprogrammet — exakt linjär i fördröjningssigma och monoton i bågen genom den libration som rapporten MÄTER. Datumdefekten är själva ämnet och inte en fotnot: rang, defekt, konditionstal, spektrum, ej observerbara riktningar i basen med sju parametrar, den svagaste riktningen även vid full rang och varje parameters andel av den redovisas vid varje körning, och varje parameter som kampanjen inte begränsar publiceras som NULL med en status. Korrelationen mellan beaconfel är MEASURED, inte antagen — exakt noll med stationerna fixerade, och redovisad med sin kostnad när de skattas. Kan köras som scenariotypen <c1/>

seg-ca481f2d8f9e = Bekräftelse från oberoende skattare av tröskeln för bågsträcka i cislunar rymd

seg-3d5fbf896209 = En skattare med batch-minsta kvadrat som ÅTERSKAPAR chief-satellitens begynnelsetillstånd från simulerade mätningar mellan satelliter över växande prefix av samma epokrutnät som tabellen rang mot båge använder, med mätpartialerna tagna som centrala finita differenser av den sammansatta framåtmodellen. Den använder ingenting av det maskineri som tröskeln mättes med — ingen analytisk jakobianrad, ingen variationell tillståndsövergångsmatris, ingen singulärvärdes- eller egenvärdesuppdelning, ingen rangtolerans, inget filter med kvadratrot av informationen — och delar bara dynamiken, begynnelsevillkoren, den skalära observabeln och epokrutnätet, vart och ett namngivet i det utsända dokumentet. Två kriterier, båda svepta: återställning utan brus (rangens motsvarighet) och skattbarhet med Monte Carlo (skattbarhetens motsvarighet, mätt mot en känd referens i stället för förutsagd ur en kovarians). Kan köras som scenariotypen <c1/>

seg-60e30948cee7 = En separat skattare i den här kodbasen med en annan algoritm och en disjunkt kodväg: olinjär viktad Gauss-Newton med partialer från finita differenser, vars utlåtande läses som ett uppmätt fel i tillståndsåterställning i km och mm/s. Den har inget uttryck gemensamt med Gramianens väg via rang och kovarians, och separationen UPPRÄTTHÅLLS av en vakt på källtexten i stället för att bara påstås. MEASURED på det publicerade plana DRO-rutnätet: SKATTBARHETSkriteriet är CORROBORATED — den uppmätta Monte Carlo-gränsen är { "5.739130" } h mot den formella { "5.739130" } h (kvot { "1.0000" }), och det uppmätta RMS återskapar den formella 1σ över { "21" } bågsträckor till en geometrisk medelkvot på { "0.9804" }. RANGkriteriet är INTE styrkt som gräns för återställbarhet: skattaren återställer från { "0.782609" } h mot Gramianens { "2.086957" } h, kvot { "0.375" }, och vid { "1.826087" } h — det sista prefixet som rangavläsningen poängsätter till { "3" } av { "4" } — återställer den till { "1.96e-5" } av den a priori förskjutningen. Återställningsgränsen är oförändrad över tre tiopotenser av sin egen gräns medan rangtröskeln spänner från 'aldrig' till { "0.782609" } h över fyra tiopotenser av rel_tol, och de två sammanfaller exakt vid rel_tol = { "1e-8" }. Det spannet noterades först som att det nådde { "0.260870" } h; den siffran var en ARTEFAKT, framkallad av en rangavläsning som räknade { "4" } riktningar från { "2" } mätrader under flyttalsbruset i f64, och den rättas här i stället för att få stå kvar. Rangavläsningen begränsas nu av Sylvesters olikhet med orsaken utsänd, och det rättade spannet mättas vid exakt den båge där den oberoende skattaren återställer, vilket stärker den här radens korsvalidering i stället för att försvaga den: den publicerade { "1e-6" } är en konservativ KONVENTION för singulärvärden, inte ett påstående om återställbarhet. Samma mönster rumsligt: NRHO { "9.290323" } h mot { "21.677419" } h, halo { "22.978723" } h mot { "39.829787" } h, med skattbarheten överens exakt i båda. Det plana DRO-fallet med sex tillstånd återställs vid ingen båge, vilket oberoende återskapar den familjens strukturella datumdefekt från en skattare som inte fått veta något om den. INTE externt förankrad — dynamiken och begynnelsevillkoren delas med analysen som testas och ingen offentlig datamängd publicerar en sådan tröskel — så ExternalDataset avstår

seg-f839285852d9 = Lunar servicevolym från verklig, hämtad konstellationsgeometri

seg-c3059fcced49 = Tar emot en tabellerad månscentrerad tillståndsefemerid (utvärderingen av en SPK/BSP-kärna) eller en publicerad konstellationsdefinition bakom <c1/>, kör samma svep över täckning / DOP / skyddsnivå mot den och sänder ut det krav på σ_URE som den innebär BREDVID de oförändrade illustrativa keplerska och perturberade resultaten, med skillnaden som en egen namngiven storhet. Varje siffra bär en proveniensklass som skiljer kärnhärledd från härledd ur publicerade element och från modellerad, så att de aldrig kan förväxlas i ett citat längre fram

seg-36a6cfaf5afa = Enhet och proveniens deklarerade för varje rapporterad storhet

seg-12460501e82b = Ett maskinläsbart schema som anger enhet, proveniensklass och definition för varje numeriskt fält i varje scenariorapport, plus en enda global spärr som kör varje registrerad scenariotyp och underkänner om ett utsänt numeriskt fält saknar någotdera. Proveniensvokabulären är sluten och varje klass bär en evidensnivå, med två klasser som avsiktligt avbildas på <c1/> och <c2/> i stället för att tilldelas en nivå som klassen inte bestämmer

seg-a8c4a6fd4989 = Själva det utsända dokumentet: varje numeriskt löv måste lösas upp till en post i det dokumentets eget units-block. Det finns inget externt enhetsregister att kontrollera en DEKLARERAD enhet mot, så en deklarerad enhet är ett granskat påstående och inte ett verifierat: spärren verifierar FULLSTÄNDIGHET och KORREKT FORM, inte sanning, och Validated vore fel eftersom ingenting externt bekräftar att <c1/> är rätt enhet för ett fält som heter <c2/>. En oberoende korskontroll av namnsuffix kördes över de { "1,434" } fält som beskrevs VID DEN TIDPUNKTEN: av de { "691" } som bär ett suffix med enhet avviker { "40" } från den deklarerade enheten och alla { "40" } är förklarade (suffix per sekund, minima, aperturssekunder, newtonmeter mot ett suffix som ser ut som nanometer), så ingen felaktig enhet kom fram. Den korskontrollen har inte körts om sedan dess, och täckningen har vuxit förbi den — siffran lämnas vid det som faktiskt mättes i stället för att anges om vid den nuvarande totalen. Vid den ändringen ({ "0.27.0" }) gick täckningen från { "7" } av { "56" } slag till { "60" } av { "61" }, och från { "389" } av { "1354" } fält till { "1,742" } av { "1,744" } (docs/field-units-schema.json, som en kontroll av föråldring håller aktuell). INGET slag återstår utan täckning (tak { "0" }, FUT-28, { "0.36" }): det sista var <c3/>, där två av kolumnerna är nyckelstyrda av anroparen så att deras enheter är data; de beskrivs nu som <c4/> och enheten för varje position läses ur det SVEPTA paketets egen enhetstabell till <c5/> och <c6/> (eller tas från axelns deklarerade <c7/>, som måste stämma med paketets när båda finns; null när ingen finns, angivet i stället för gissat). <c8/> var det näst sista, och kom av listan när dess släppta dokument fick ett units-block: additivitetsfästet som hade namngett <c9/> som en förbjuden nyckel BEVISAR nu i stället att tillägget är additivt — tas blocket bort igen hashas dokumentet fortfarande till de två konstanter som frystes innan det fanns, så ett släppt värde som flyttat sig under tillägget underkänns fortfarande. Arbetet avslöjade också tolv defekter i enheter eller dokumentation i befintlig kod, rapporterade i stället för åtgärdade under R1

seg-cf779c468eed = Lunart datum för referenssystem från en VERKLIG observationskampanj

seg-96151f13a92b = Kovariansen för det sjuparametriska Helmert-datumet, där de två simulerade indata ersatts av uppmätta: schemat är markens sändningsepoker för { "337" } arkiverade normalpunkter från ILRS lunar laser ranging (2015-04-08 till 2015-06-27, Grasse MeO { "7845" } och Matera MLRO { "7941" }, alla fem retroreflektorgrupper) och varje observationsvikt är den punktens egen arkiverade precision bin_rms/√n_raw — median { "5.13" } mm envägsavstånd, avläst ur filen. Stationskoordinater IERS ITRF2020, reflektorkoordinater JPL DE430 Table { "7" }. Kan köras som scenariotypen <c1/>. Det validerade påståendet ({ "0.36" }) är snävt: på den analytiska standardvägen stämmer beräkningen av datumkovariansen med en oberoende SPICE-ljustids- och NumPy-referens på nya uppmätta normalpunkter; det är ingen LLR-noggrannhet och inget belägg för att den analytiska månen är noggrann

seg-c815cb90dcde = Geodesi för lunar referensstation: tillagd retroreflektor och VLBI-beacon mot datumet med fem grupper

seg-103cf21173ac = Valfria indata extra_reflectors och extra_beacons i scenariot lunar-llr-datum lägger till ett block station_geodesy: Helmert-informationen för de fem grupperna från det arkiverade urvalet av lunar laser ranging plus den information som en tillagd retroreflektor (avståndsmätt vid de arkiverade normalpunktsepoker då mätstationen är över sin horisont, var och en med den normalpunktens arkiverade vikt) och en tillagd VLBI-beacon (observerad av nätverket och schemat i lunar-frame-campaign med jordstationerna fixerade, genom fördröjningspartialerna i lunar-vlbi-fim) på angivna platser lägger på det sjuparametriska datumet, omlöst, med varje Helmert-parameters 1-sigma före och efter, deras kvot, normerna före och efter samt de yttersta egenvärdena för Fisher-differensen. Om de saknas eller är tomma är rapporten oförändrad

seg-479a7e6bbedb = Endast intern konsistens: varje tillagd plats är en egen punkt och ett laseravstånd eller en VLBI-fördröjning med fixerad station berör en punkt, så dess information A_p^T M_p A_p är positivt semidefinit och adderas; testet kontrollerar Fisher-differensen och varje varians mot det. Resultatet för de fem grupperna är den befintliga raden med verkliga data och är oförändrat. Den tillagda reflektorn återanvänder epoker som schemalagts för de fem befintliga grupperna, ett ILLUSTRATIVE schema, och den tillagda beaconens nätverk, schema och fördröjningssigma är de ILLUSTRATIVE indata från lunar-frame-campaign; platsen är en ILLUSTRATIVE sydpolär position. En sydpolär plats ser jorden lågt vid horisonten eller inte alls, vilket de befintliga testerna av höjdvinkel uttrycker; ingen av platserna avståndsmäts kontinuerligt. Siffrorna är Cramér-Rao-gränser för en reducerad parameteruppsättning, inte ett löst datum och inte ett påstående om någon verklig station

seg-d9f033ebf109 = Lunart datum för referenssystem från en VERKLIG observationskampanj, kärn-måncentrum

seg-6f272a06c9f3 = Kovariansen för det sjuparametriska Helmert-datumet i lunar-llr-datum från arkiverade ILRS-normalpunkter och deras uppmätta vikter, på kärnvägen: det geocentriska måncentrumet läses ur JPL DE440 med motorns egen kärnläsare (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Endast måncentrumet skiljer sig från den analytiska raden; IAU { "2015" }-orienteringen, den frånvarande polrörelsen och UT1, katalogerna, urvalsreglerna, vikterna och linjäralgebran är desamma. Det validerade påståendet är bara att den här vägens datumkovarians stämmer med en oberoende SPICE- och NumPy-referens på nya, osedda normalpunkter. Jämförelsen skiljer inte månmodeller åt och kontrollerar inte måncentrumet: på samma urval klarar den analytiska månen också varje tröskel, den förhandsregistrerade mutationen (kärn-månen avläst en timme för sent) upptäcktes inte, och ett måncentrum som är ungefär { "4,650" } km fel klarar det också (se referenstexten). Det är inget belägg för att kärn-månen förbättrar datumet. Kan köras som scenariot <c1/> med planetary_kernel_path (och normal_points_dir för ett annat urval)

seg-bd3af378b613 = Inbyggd analytisk lunar efemerid — dess ANGIVNA NOGGRANNHETSGRÄNS kontrollerad mot verkliga data

seg-a51c4e234a4f = ephem::moon_position, den lågprecisa geocentriska månserie som craten faller tillbaka på när ingen DE/SPK-kärna finns, uppmätt mot verklig lunar laser ranging och mot en publicerad planetefemerid över samma tidsspann. Den här raden validerar den gräns som modulen anger om sig själv, INTE en noggrannhet: serien bekräftas vara inte sämre än den säger, inte bekräftad som bra

seg-81dff68ddd9c = TVÅ oberoende externa datamängder som inte delar något. ({ "1" }) { "337" } arkiverade ILRS-normalpunkter från lunar laser ranging (EUROLAS Data Center, DGFI-TUM, 2015-04-08 till 2015-06-27, fem retroreflektorgrupper, incheckade med SHA-256 per fil och ett skript för ny nedladdning och verifiering): observerat minus beräknat envägsavstånd { "156,494" } m RMS, med stationskoordinater från IERS ITRF2020 och reflektorkoordinater från JPL DE430 Table { "7" }, så residualen domineras av serien för måncentrum. ({ "2" }) Geometriska geocentriska månlägen från JPL Horizons över samma tidsspann: { "112,567" } m RMS radiellt, { "195,655" } m RMS vektor, sämsta epok { "360,324" } m = { "0.0536" }°. En avståndsresidual svarar på den RADIELLA delen av ett efemerisfel, så ({ "1" }) och ({ "2" }) är samma storhet nådd på två vägar och stämmer inom { "1.39" }× — vilket är vad som ger scenariot lunar-llr-datum rätt att tillskriva sin residual efemeriden. Motorns egen moduldokumentation hävdar ~{ "0.3" }° / ~några·10² km; båda mätningarna ligger inom den, den vinkelmässiga med en marginal på { "5.6" }×. OMFATTNING, angiven så att ingen läsare kan missförstå: detta validerar den angivna GRÄNSEN, inte en noggrannhetssiffra. Serien förblir olämplig för alla tillämpningar som behöver bättre än ~{ "1e5" } m, och den begränsningen är radens innehåll lika mycket som samstämmigheten. Kan återskapas offline med de incheckade skripten för hämtning och verifiering

seg-44f582b17fa9 = Spärrens integritet — ett grönt som betyder vad det säger

seg-43fbcfbe990c = Tre strukturella vakter över själva verifieringsprocessen, var och en stänger en klass av defekter som nått den kanoniska spärren som en intermittent eller falsk röd. ({ "1" }) Varje konstruerad temporär sökväg i Rust-källorna måste bära en komponent som är unik per anrop; ett process-id avvisas, eftersom cargo kör bibliotekstesterna som parallella trådar i EN process och pid delas av alla. ({ "2" }) Varje fästpunkt byte för byte eller via hash måste deklarera, intill sig själv eller i modulhuvudet, vad den täcker och vad den avsiktligt utesluter — så att en ändring som skär över flera delar med en blick visar vilka fästpunkter som berörs och vilka som i tysthet blivit detektorer för ändringar i hela förrådet. ({ "3" }) Ett grönt kan bara göras gällande från HELA sviten: scripts/gate.sh kör <c1/>, fångar den sanna slutkoden utan någon pipe i vägen och skriver ett kvitto som namnger committen, antalet integrationsbinärer, antalet tester och varaktigheten; kontrollen före push avvisar en push vars commit inget giltigt kvitto namnger, på ett rent träd. Upprepbarhet provtas separat av scripts/check-repeatability.sh, som kör biblioteksviten N gånger och underkänner om mängden tester som klaras skiljer sig.

seg-17a5f9da54a4 = Sluten form: varje vakt körs över ett fast känt felaktigt kodstycke som måste utlösa och ett fast känt korrekt kodstycke som måste förbli tyst, båda litterala konstanter som detektorn inte kan påverka. De två kända felaktiga kodstyckena är defekterna F22 och F25 i sin ursprungliga form. Detta är en INTERN oberoende referens och raden är MODELLED i enlighet med det: den visar att vakterna skiljer defekten från dess åtgärd, inte att de klasser de beskriver är uttömmande. Deras angivna blinda fläckar — delat tillstånd som inte är en sökväg, en fästpunkt som hålls i en kort namngiven konstant, en sällsynt kapplöpning som tre körningar inte provtar, och ett kvitto som vem som helst som kan skriva filen kan förfalska — är utskrivna i moduldokumentationen i tests/source_guards.rs och i varje skripts huvud i stället för att lämnas att upptäckas.

seg-178192c9c87a = Sammansatt PL för tidssynkronisering — skalär MHSS-specialisering (H=1_N)

seg-431aaf94ec31 = TPL med solution-separation för skalär tid över heterogena källor; PL styrd av brus i den sämsta uteslutningsdelmängden + bias hos UTC(k)

seg-9a5ea79248c8 = P2: numpy { "2.3.5" } linalg.lstsq och scipy { "1.18.1" } (norm.isf, norm.sf, brentq) räknar om, med sina egna algoritmer, skattarna med viktad minsta kvadrat för delmängder, den allmänna separationskovariansen sqrt(Δ Σ Δᵀ), biaserna och skyddsnivån utifrån dem på { "300" } incheckade indata (tests/fixtures/tpl_scalar_numpy_oracle); PL stämmer inom { "1e-9" } relativt (sämst { "1.2e-10" }) och den styrande uteslutningsdelmängden är identisk, toleransen fastställd före jämförelsen. Multiplikatorerna, förhandsfördelningarna och biasöverbunden är indata, och strukturen i PL-ekvationen (lägeslistan, delningen ir/2, biasprojektionen) är en angiven indata, som för raden Kärna för lunar ARAIM-skyddsnivå; det validerade påståendet är linjäralgebran och PL på de indata, inte de fysiska storlekarna i ett scenario för tidssynkronisering. ARAIM-härstamning Blanch { "2015" } / Joerger { "2014" }

seg-b7cd952ff133 = Sammansatt PL för tidssynkronisering — P0-sådd holdover-genomfart

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); nedåt halvkontinuerlig PL({ "0" }+)≥PL({ "0" }−); K(IR/2) löpande maximum; fasexponenter τ/τ³/τ⁵

seg-1438193381be = Egenskapstester (monotonicitet, inget fall vid handover) + exponentlint mot holdover::coast_phase_variance

seg-3ab4509b62a2 = Sammansatt PL för tidssynkronisering — täckning av holdover-hölje, flerårigt regime (tau>=90d)

seg-d9520f6c1769 = Höljet med löpande maximum överbegränsar (utan genomstick) en verklig metrologisk serie vid varje testad fördröjning tau>=90d på ett disjunkt segment; kort tau (<=30d) är en redovisad Modelled gräns

seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] 5-dagarsserie MJD 56074-60429 ({ "872" } punkter, webtai API); disjunkt anpassning/test, flerårig täckning utan genomstick

seg-096b6cdfe2dc = Sammansatt PL för tidssynkronisering — LIL a.s.-hölje (omöjlighet + konsistens)

seg-1671add2210d = Ingen ändlig värsta-fall-holdover (Brownsk sup divergerar); IR-fördelad HPL förenlig med Hartman-Wintner-höljet när IR→{ "0" }

seg-c9ed8bbede70 = Sluten form, identitet för a.s.-hölje √(2Dt·lnln t) + kontroll av HPL-dominans; Baweja arXiv:{ "2606.24210" } sömmen för omöjlighet

seg-5a27c9f0a67d = Överbegränsning av integritet för spårbarhetsbias hos heterogena UTC(k)

seg-fd09ab2adbf6 = Överbegränsning av bias per källa b = (U/k_cov)·Phi^-1(1-tail/2) + åldrande, som blåser upp en publicerad utvidgad osäkerhet av Typ B till en fördelad integritetssvans; kopplar till tpl_scalar som bias_s

seg-d75b900ad25f = Korrelerad korskovarians för spårbarhetsbias (fördelning som är osäker vid gemensamt läge)

seg-0641f6d38c23 = Korskovarians för bias av storlek N×N med rho·b_i·b_j utanför diagonalen för källor som delar en realiserare av UTC(k); BEVISAT correlated_fused_bias >= independent_fused_bias (naiv oberoende fördelning underbegränsar den sammanvägda biasen -> optimistisk -> osäker)

seg-72359f29aab1 = Oberoende numpy-reproduktion av korskovariansen och olikheten mellan korrelerad och oberoende sammanvägd bias (InternalConsistency). Representativ källmängd; Modelled scenario.

seg-0359a9194c60 = GLS-blekning av gemensamt läge (Aitken) + Mahalanobis-identitet

seg-67b11ff6d055 = Handrullad Cholesky Omega=LL^T och blekning med framåtsubstitution z=L^-1 r (Cov(z)=I när Cov(r)=Omega); Mahalanobis kvadrat z^T z = r^T Omega^-1 r

seg-24cb37529637 = P2: numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) och inv på { "201" } incheckade SPD-indata (tests/fixtures/gls_whitening_numpy_oracle) kontrollerar den handrullade faktorn, den blekta residualen och blekningsoperatorn; Mahalanobis kvadrat kontrolleras mot solve(Omega, r), som inte använder någon Cholesky, så identiteten z^T z = r^T Omega^-1 r bekräftas på en separat väg. Allt inom { "1e-12" } relativt (sämst { "7.9e-16" }), toleransen fastställd före jämförelsen. Det största konditionstalet är { "19.3" }, så illa konditionerade matriser täcks inte. GLS/Aitken { "1935" } blekning är Cited.

seg-1a3bb032960f = Konsistensstatistik för gemensamt läge (fel i delad referens som separationen är blind för)

seg-1b03f522b8fc = Poängstatistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 för en förskjutning i gemensamt läge som solution separation (kontraster ortogonala mot { "1" }) inte kan se; en förskjutning i gemensamt läge blåser upp den medan parvisa separationer förblir platta

seg-91fc18cde833 = Gräns för ej detekterbart gemensamt läge för residual utanför Omega

seg-0cc2c0f033c8 = Tak för ej detekterbart gemensamt läge: den största felstorlek längs en riktning d som undkommer BÅDE separationen (alpha_ss = T_ss / blekt kontrastnorm för d) och statistiken för gemensamt läge (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), rapporterat som min(alpha_ss, alpha_cm). Under en positivt definit Omega utesluter de två blinda riktningarna (d proportionell mot { "1" } och { "1" }^T Omega^-1 d = { "0" }) varandra, så taket är ÄNDLIGT för varje d skilt från noll; det är oändligt endast för en nollriktning eller en Omega som inte är positivt definit. En riktning utanför den modellerade gemensamma axeln är blind endast för statistiken för gemensamt läge och begränsas av separationen

seg-a7a33523bb1c = Identifierbarhet av lunart datum - linjäralgebra för uppdelningen

seg-bd59cc76557a = Schur-komplementets marginal för blocket { "{" }lunocenter-X, scale{ "}" } i Fisher-matrisen för det 7-parametriska Helmert-datumet: den skalära degenerationsmåttet lambda_min(S), CRLB för origo-X och korrelationen mellan origo och skala

seg-0f7e4fb31c44 = Oberoende SciPy/NumPy-referens (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): Schur-komplementet, dess egenvärden och 2x2-inversen beräknade av ett oberoende bibliotek. Avgränsat till uppdelningens LINJÄRALGEBRA; de lunara storlekarna på korrelation/CRLB från verklig geometri förblir MODELLED.

seg-3359eee713a5 = Klassificering av nollrum för lunart datum (rangadditivitet för LLR + lyft av defekt genom libration)

seg-6d722c176052 = Klassificering av det interna avståndsmätningsproblemet för datum: en enda avståndsobservation bidrar med rang { "1" } (nollrum med 6 dimensioner); paret origo-X och skala är nästan noll och fysisk DE440-libration lyfter defekten till noll medan paret förblir nästan degenererat

seg-ae6dc4e6ea8b = Geometrisk struktur återskapad av motorn plus den slutna 2x2 Schur-identiteten; konsistent i STRUKTUR med Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), vars rapporterade storlekar INTE återskapas här. Klassificeringen är strukturell; storlekarna på korrelation/CRLB under verklig geometri är MODELLED (reflektorkoordinater och orientering hålls fixerade). { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): mot Sosnica et al. { "2025" } ligger korrelationen mellan origo och skala i avstånds-Fisher (-0.993 / -0.988) inom { "0.05" } från den publicerade -0.97, men på artikelns egen geometri med fem reflektorer är Helmert-korrelationen med 7 parametrar och lika vikter -0.78 (det publicerade värdet vilar på fel per reflektor som artikeln inte skriver ut), och CRLB för origo ({ "0.6" } till { "1.2" } mm vid avståndsbrus på { "3" } mm) ligger { "96" } till { "98" } % under artikelns { "3.07" } cm mot en tolerans på { "20" } %. Storlekarna återskapas inte

seg-3fd19007ea67 = Information om lunart datum från flera tekniker (LLR + lunar VLBI + avstånd till omloppsfarkost)

seg-23d0dd7d0666 = Datum-jakobianrader för avstånd jord–reflektor med LLR, differentiell fördröjning med lunar VLBI mellan två stationer och avstånd från omloppsfarkost till beacon över det 7-parametriska datumet, kombinerade till en enda konsekvent förkonditionerad Fisher-matris; visar att spårning utanför radialen (omloppsfarkost / djupvarierad) bryter degenerationen mellan origo-X och skala där tvärgående VLBI hjälper endast indirekt

seg-b2f5715c4577 = Korskontroller av varje tekniks partialer, analytiskt mot finita differenser (interna); FÖRBÄTTRINGENS RIKTNING är ett geometriskt faktum. Beaconplatser, scheman och brus är MODELLED/representativa (se tests/fixtures/llr_geometry/NOTICE.md).

seg-f9796a4c9a85 = Leverantör av orientering för lunar huvudaxel enligt DE440

seg-ebe4519a40e4 = Rotation MOON_PA_DE440 till J2000 vid godtyckliga epoker inom 2014-01-01 till 2030-12-31 TDB, genom geodetisk interpolation R0·Exp(f·Log(R0ᵀR1)) mellan noderna i en incheckad daglig serie på { "6" } 209 rader (try_-funktionerna returnerar OrientationSpanError utanför den, de ofelbara panikar; den klipper aldrig); inbäddad vid kompilering så att ingen filsystems-I/O sker vid körning och WASM-bygget bär den

seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.2.0" }, körd som verktyg): pxform från MOON_PA_DE440 till J2000 som utvärderar JPL:s binära PCK moon_pa_de440_200625.bpc direkt, med NAIF:s egen ramkärna moon_de440_250416.tf, vid { "2 000" } slumpmässiga epoker mellan noderna i det inbäddade fönstret. Rotationsvinkeln mellan Kshanas och SPICE:s matriser ligger inom { "1.7e-5" } rad ({ "30" } m vid medelradien { "1737.4" } km, fastställd före jämförelsen); uppmätt sämst { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad, och sämst { "1.75e-6" } rad på { "6 000" } ytterligare epoker dragna av verifieraren. De dagliga noderna hämtades själva ur samma kärna (scripts/gen_de440_moon_pa.py, fixturens SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), så den här jämförelsen testar interpolationen mellan dem, vilket är påståendet. Hittat av den här jämförelsen och åtgärdat: den tidigare elementvisa linjära interpolationen med Gram-Schmidt behöll axeln men inte vinkeln i rotationen på { "13.2" } grader/dygn och hade ett fel på upp till { "2.0e-4" } rad ({ "340" } m) nära kvartspunkterna; den tidigare siffran på omkring { "14" } m kom från en vakt som bara provtar intervallens mittpunkter. Serien täcker 2014-01-01 till 2030-12-31 och fel utanför den (omgång { "2" }); dess noder för 2024-2025 återskapas ur samma kärna till { "4.3e-13" }. Jämförelsen med SPICE mellan noderna ovan täcker endast 2024-2025, som är det validerade fönstret; de utvidgade noderna kommer från samma kärna och skript men är inte jämförda mellan noderna. Ett geometriskt underlag för identifierbarhetsanalys, inte en orienteringsprodukt under en meter

seg-ab96cfc8d48c = Underlag för geometri av lunart LLR-datum (reflektorer i huvudaxelsystem, markstationer, analytiska avståndspartialer)

seg-40e91288f81a = De fem retroreflektorgrupperna på närsidan i meter i kroppssystemet PA och markstationerna för LLR i geodetiska koordinater; placering av reflektorerna från kropp till tröghetssystem genom DE440 PA-orienteringen; analytiska partialer av avståndet jord–reflektor med avseende på det 4-parametriska datumet; och den Fisher-matris som bara bygger på LLR och uppvisar degenerationen mellan lunocentre-X och skala som motiverar analysen med 7 parametrar

seg-89ce1f95d9f6 = Beräkningen kontrolleras internt: varje analytisk partial mot en finit differens, och fallet med noll datum mot det nominella avståndet. KATALOGEN kontrolleras externt och oberoende - koordinaterna för huvudaxeln i DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) korskontrolleras mot Table { "6" } i memorandumet om ytkoordinater för DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, maskinellt utdraget ur en PDF verifierad med SHA-256 av tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) och stämmer inom { "1.12" } m, medan mean-Earth-realiseringen av samma fem grupper skiljer sig med { "672" } till { "871" } m. DEGENERATIONSSTRUKTUREN kontrolleras mot ett publicerat resultat: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, som för det lunara huvudaxelsystemet rapporterar en korrelationskoefficient mellan lunocentre-X och skala på r = -0.97, och att LLR inte når månens verkliga masscentrum med bättre noggrannhet än { "12" } cm på grund av den korrelationen. Den här modulen återskapar samma struktur (|corr(t_x, scale)| mellan { "0.9" } och { "0.9999" }, datumdefekt <= { "1" }) från en Fisher-utformning som bara bygger på LLR. Bekräftelsen sker över efemerider, inte som en rundtur: artikeln kombinerar INPOP21a, DE430 och EPM2021, medan den här modulen drivs av DE440-libration. Det som INTE återskapas är storleken - korrelationen här är omkring -0.988 mot deras -0.97, och CRLB för 4 parametrar ligger under en millimeter mot deras uppnådda golv på { "12" } cm, eftersom orientering och reflektorkoordinater hålls fixerade här och löses där. Endast geometri och degenerationsstruktur; inget påstående om noggrannhet för ett löst datum. { "0.30" } extern jämförelse: de delar av den här modulen som gäller uppmätta avstånd (reflectors(), stations_itrf(), PA-placeringen enligt DE440 och den barycentriska ljustiden llr_bcrs_one_way_m) är validerade på sin egen rad, LLR measured-range model, mot { "192" } ILRS-normalpunkter (RMS { "2.81" } m mot { "10" } m). Den här raden förblir MODELLED eftersom den uppmätta jämförelsen inte prövar resten av dess påstående. Den geodetiska stationskatalogen stations() avrundar APOLLO till { "0.001" } grader; med geocentrisk ljustid ger den { "22.7" } m på samma punkter (testet reflector_ranges_against_ilrs_normal_points; { "96" } m med den tidigare elementvisa orienteringsinterpolationen). De analytiska avståndspartialerna och Fisher-matrisen som bara bygger på LLR beräknas genom llr_range_m och reflector_inertial med den analytiska månserien (ephem::moon_position, omkring { "0.3" } grader från GCRS) och ingen ljustid

seg-a78ba110b64c = Modell för uppmätt avstånd i LLR (reflektorkatalog, stationer i ITRF2020, placering enligt DE440 huvudaxel, barycentrisk ljustid enligt IERS { "2010" })

seg-c9827c1a427b = Envägsavståndet från jordstation till reflektor för en normalpunkt i lunar laser ranging: de fem retroreflektorgrupperna på närsidan i meter i kroppssystemet PA (huvudaxel) enligt DE440 (lunar_llr_geometry::reflectors); stationerna i stations_itrf(), nämligen Grasse { "7845" } och Matera { "7941" } från ITRF2020 vid epok { "2015.0" } med sina hastigheter, placerade i Geocentric Celestial Reference System (GCRS) med IERS { "2010" }-transformen med polrörelse från Bulletin A (lunar_vlbi::station_inertial_position_itrs), och APOLLO { "7045" } vid operatörens publicerade ungefärliga geocentriska position (ingen hastighet); placeringen av reflektorerna från kropp till tröghetssystem genom DE440 PA-orienteringen (lunar_orientation::try_de440_moon_pa_body_to_inertial, som ger fel utanför 2014-2030); och den barycentriska ljustiden enligt IERS Conventions { "2010" } Section { "11.2" } (lunar_llr_geometry::llr_bcrs_one_way_m: transformen Eq. { "11.19" } från kropp till BCRS för station och reflektor, och Shapiro-fördröjningen Eq. { "11.17" } från solen, jorden och månen). INDATA, inte del av påståendet: de barycentriska tillstånden och potentialerna för jorden, månen och solen (DE440 genom SPICE), IERS UT1-UTC och polrörelse, och den uppmätta rundturen omräknad från TT till TDB. PÅ TESTSIDAN, inte del av påståendet: Mendes-Pavlis zenitfördröjning med FCULa-avbildning, i testet, med elevation från den geodetiska katalogen stations(). Modelleras inte: tidvatten, stationsexcentriciteter, termiska termer för reflektorer

seg-9b1dfa736cb6 = Kopplad gauge för lunart referenssystem och tidsskala: det gemensamma nollrummet för rumsligt datum, klockoffset och klockdrift

seg-a000ef6ab2e0 = assemble_coupled_info bygger den kopplade Fisher-matrisen med 9 parametrar över [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space returnerar en basinvariant uppdelning av dess nollrum i enbart rumsliga, enbart tidsmässiga och genuint kopplade dimensioner plus kopplingsnormen för projektorn från rumsligt till tidsmässigt; coupled_marginal_eigs ger Schur-komplementets marginal för { "{" }scale, offset{ "}" }. På de incheckade nätverken rapporterar motorn ett datum med full rang (defekt { "0" }) för det välställda fallet och en exakt defekt i en enda driftriktning för fallet med en enda epok (förfluten tid noll, så driften är oobserverbar per konstruktion), och beräknar marginalen för { "{" }s, d_tau{ "}" } i båda.

seg-35eebbc8a2e9 = VAD SOM KONTROLLERAS EXTERNT, snävt angivet: kshana beräknar egenvärdesuppdelningen med sin egen handskrivna Jacobi-lösare (fim::sym_eig) och marginalen med sin egen pseudoinvers; den oberoende referensen räknar om båda med numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) via scripts/gen_coupled_gauge_ref.py. Samstämmighet till rel<{ "1e-3" } är därför en kontroll med oberoende bibliotek av DEN HÄR CRATENS ARITMETIK mot en standardimplementation, vilket är det Validated påståendet och hela det. VAD SOM INTE KONTROLLERAS: sammanställningen och klassificeringen av nollrummet är den här modulens egna regler, och den oberoende referensen återskapar dem från samma specifikation och inte från en oberoende källa - det bekräftar implementationen, inte regeln. Geometrin för beacons och omloppsfarkoster är Modelled och representativ. Observationsraderna bär den verkliga DE440-orienteringen av månens huvudaxel (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), men det är en INDATA som båda sidor får, inte belägg om svaret, och den noteras här som proveniens och inte som grund för statusen - samma distinktion som main redan drar i raden om integritet för gemensamt läge. Varje flyttal i raderna avrundas till { "6" } decimaler innan network.json skrivs, så att båda sidor läser identiska IEEE-754-dubbla tal och den enda skillnad som återstår är lösaren.

seg-63a8571f8eb0 = Degeneration mellan avstånd och klockoffset i lunar envägsavståndsmätning, och lagen om geometrisk mångfald för utformning

seg-cdd70f56051a = Degenerationen mellan radiellt avstånd per nod och mottagarens klockoffset är exakt vid { "1" } m till { "3.336" } ns (ett genom c). Marginalen för Schur-komplementet { "{" }scale, offset{ "}" } (coupled_marginal_fisher) visar att i ett geometriskt varierat nätverk lyfter tvåvägsavståndsmätning marginalen ungefär med samma faktor som ett lika stort antal ytterligare envägsdata, medan lyftet med tvåväg i det idealiserade regimet med en enda nod är flera storleksordningar större. Den lag som följer: geometrisk mångfald, inte tvåvägsavståndsmätning som sådan, är det som skiljer lunar skala från tidsskalans offset vid envägsavståndsmätning; en tvåvägs eller extern tidskoppling krävs endast i regimet med låg mångfald eller en enda användare.

seg-25dd0e9134c8 = Schur-komplementets marginal-Fisher för den kopplade informationsmatrisen, i linjäralgebra med sluten form, kontrollerad mot de två gränsregimer den förutsäger. Ekvivalensen { "1" } m till { "3.336" } ns är definitionen av metern via c och inte ett empiriskt resultat. Observationsnätverken är representativ Modelled geometri, så lagen för utformning är ett påstående om den geometri som presenteras för den och gör inget påstående om något verkligt lunar nätverk i drift.

seg-16ec8283f9b4 = Koppling mellan relativistisk klockdrift och referenssystem för den lunara tidsskalan

seg-d9a426dc8620 = rate_frame_jacobian(_with) ger känsligheten hos den lunara tidsskalans driftstakt för realiseringen av referenssystemet, från den ekvatoriella effektiva potentialen trunkerad vid grad { "2" } (GM, ekvatorialradie, J2, rotation; LunarSurfacePotential): d_alpha/d_scale = L_m, omkring +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, omkring -1.11e-14 (tidsberoende); d_alpha/d_r_radial = g_eff/c^{ "2" }, omkring +{ "1.806e-17" } per meter. För ett radiellt datumskifte på { "1" } m är det en driftstörning på omkring { "1.8e-17" } (en aritmetisk följd av den radiella posten), långt under den drift på omkring { "1.7e-11" } som en lunar tidsskala har mot TT

seg-a666792106d9 = Basinvariant klassificering av det kopplade nollrummet för referenssystem och tidsskala

seg-5ee36574d1b4 = classify_null_space delar upp nollrummet för datum i enbart rumsliga (dimension d minus rang U_T), enbart tidsmässiga (d minus rang U_S) och genuint kopplade (rang U_S plus rang U_T minus d) delar, plus kopplingsnormen för projektorn från rumsligt till tidsmässigt p_st_norm, Frobenius-normen för det icke-diagonala blocket i nollrummets projektor. Var och en av dessa är en funktion av PROJEKTORN och inte av en vald bas, så de är invarianta under varje ortonormalt val av nollvektorer - vilket är det som gör att klassificeringen alls går att rapportera.

seg-2c074d6260ba = Representativ meny av multitekniska mätningar och den additiva Fisher-kombinationsregeln

seg-beefac5c1b13 = MeasurementBlock håller en kandidatmätkampanj som ett informationsbidrag av Fisher-typ på 7x7 plus en skalär relativ kostnad; block_from_rows bygger ett ur råa datum-jakobianrader så att varje block förkonditioneras identiskt genom lunar_identifiability::assemble_multi_info; combine summerar informationen för en vald delmängd, vilket är rätt regel eftersom Fisher-information är additiv över oberoende mätningar; representative_lunar_menu levererar en deterministisk meny med fyra block (LLR, en tvärgående VLBI-limbbeacon, en omloppsfarkost på närsidan och en på bortre sidan). Den budgetbegränsade utformningsoptimeraren som använder den här menyn ingår inte i den här craten.

seg-d83a9942ee72 = Additivitet av Fisher-information över oberoende mätningar är en egenskap i sluten form, kontrollerad här mot en oberoende skriven elementvis summa och mot den ordningsinvarians och monotonicitet som följer av den. OBS OM EVIDENS: kombineraren hade tidigare inget test alls, och det enda testet i modulen summerade de två informationsmatriserna inline i stället för att anropa den, så en trasig kombinerare hade lämnat modulen grön; testet går nu genom combine och underkänns när den muteras. Alla beaconplatser, all omloppsfarkostgeometri, alla precisioner per teknik och relativa kostnader är representativa val och inte uppdragsvärden (se tests/fixtures/llr_geometry/NOTICE.md), så varje degenerationsmått och CRLB-siffra som nås genom den här menyn ärver Modelled-statusen från lunar_identifiability::decompose.

seg-341eedfc47da = Konsistens mellan leverantörer för lunart referenssystem/dynamik (verklig mellan-efemerid)

seg-f8d94c0771cc = uppdelning med enbart rotation (translation+rotation med 6 parametrar) av oenigheten mellan DE440/INPOP21a/EPM2021 om geocentrisk måne i en reducerbar gemensam ICRF-ramkoppling och ett oreducerbart överskott i orienteringen av månens bana (den fullständiga Helmert-anpassningen med 7 parametrar är en separat offentlig funktion som INTE täcks av den här externa kontrollen: dess evidens är ett internt enhetstest av analytisk återställning plus tests/lunar_helmert_fit_cross_check.rs, som stämmer av den mot den Validated exakta Gauss-Newton-anpassningen i lunar_frame_realise och fäster konventionen om motsatt rotationstecken mellan de två)

seg-c69fd3fc645b = Tre oberoende auktoritativa efemerider — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — provtagna via IMCCE calceph, korskontrollerade av en oberoende numpy SVD-anpassning med minsta kvadrat. VARFÖR DET HÄR ÄR Validated DÄR lunar_common_mode INTE ÄR det, på samma tre efemerider: här ÄR den rapporterade storheten en egenskap hos de publicerade data — deras inbördes oenighet — så efemeriderna är den oberoende referensen, inte en indata. I lunar_common_mode matar samma oenighet en MODELLED konstellationsgeometri och svaret är en egenskap hos den modellen, vilket är varför den raden med rätta är Modelled/ReferenceImpl.

seg-2d3347bcb15e = Tolerans för konsistens mellan leverantörer för en användare med blandade leverantörer

seg-9decf2cb6b0c = consistency_tolerance: inverterar en positionsbudget för användaren till ett krav per parameter på Helmert-samstämmighet mellan leverantörer (origo/skala/rotation) vid en referenshävarm, valfritt uppblåst med realiserings-CRLB för en enskild leverantör enligt P1

seg-b8dc68eb4bda = Triangelgräns för värsta fall för verkan av Helmert-punktjakobianen (sluten form)

seg-5450d921dfc9 = Felbudget för lunar interoperabilitet mellan flera leverantörer och designlag för referenssystem mot efemerid

seg-e1e30f5c17a6 = interop_budget: reducerbar (gemensam ramkoppling) mot oreducerbar (dynamik) uppdelning under konventionerna PerProvider / CommonFrameTie / CommonEphemeris, med måttet för designlagen om oreducerbar andel (~{ "0.69" } på verkliga DE440/INPOP/EPM: enbart en gemensam ramtagg lämnar kvar det dominerande golvet)

seg-46304ae1efa4 = RMS-aggregering av de Validated uppdelningarna per par under varje konvention (sluten form)

seg-a01f394a36d3 = Linjäralgebrakedja för observerbarhet av fel i autonomt fritt nätverk (paritetsprojektor, detekterbarhet, MDB-icke-centralitet, Byzantine block-spark)

seg-b3389bb90e8d = På det verkliga DE440-nätverket med lunar per-nod (varje rad en differentiell envägsavståndsmätning mellan noder byggd via pernode_range_row med en verklig siktlinje i DE440 Moon PA-systemet) beräknar motorn den viktade paritetsprojektorn P⊥ = I − G(GᵀWG)⁺GᵀW (den rangdefekta pseudoinversformen som överlever den 8-dimensionella gaugen datum⊕tidsskala), residualen för T1-detekterbarhet ‖P⊥·b‖ (fel inom intervallet utplånas, generiska fel är detekterbara), den kvadratiska formen för Baarda MDB-icke-centralitet cᵀWP⊥c (den korrekta viktade formen med en enda P⊥, INTE formen med dubbel P⊥ cᵀP⊥WP⊥c) med MDB = √(λ₀/cᵀWP⊥c), och antalet block-spark för Byzantine-detektering/-identifiering av de staplade effektiva peer-signaturerna P⊥·B_T (kolumnrang, inte bara nollskilda)

seg-8cb248423fd0 = Oberoende linjäralgebrareproduktion i numpy/scipy på verkliga siktlinjerader från DE440 i månens PA-system (P⊥ ur SVD av den blekta designmatrisen W^{ "{" }1/2{ "}" }G; MDB:ns icke-centralitet ur den klassiska kvadrerade normen för paritetsunderrummet enligt Baarda ({ "1968" }); blockrangen ur ett antal singulärvärden från en numpy-SVD) — en genuint annorlunda numerisk väg än cratens cykliska Jacobi-egenvärdesuppdelning av GᵀWG. Omfattning (enligt tests/fixtures/faultobs/NOTICE.md): detta kontrollerar ENDAST LINJÄRALGEBRAKEDJAN på dessa rader. Nodgeometrin är modellerad. Det är INTE en operativ integritetsgaranti, INTE en certifiering av skyddsnivå och INTE något RAIM-/ARAIM-tillgänglighetspåstående, och INTE heller en uppdragsgaranti för bysantinsk feltolerans — det tolererade ANTALET fel för detta nätverk är modellerat, medan gränsen detect>f / identify>2f för blockvis spark är hämtad ur litteraturen (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blockvis spark enligt Donoho–Elad { "2003" }) och bevisad som instansiering i koden

seg-ebb827739614 = Bysantinsk gräns för detektering och identifiering via blockvis spark i det autonoma månnätverket med en nod per enhet (T3)

seg-4fb935e6193d = byzantine_bound instansierar kodnings- och glesobserverbarhetsgränsen för säker tillståndsskattning på nätverksgeometrin per nod: en bysantinsk peer injicerar en godtycklig linjärkombination av de mätningar den deltar i, och nätverket DETEKTERAR varje koalition av ≤ f = block_spark − { "1" } peers och IDENTIFIERAR entydigt varje koalition av ≤ ⌊(block_spark − { "1" })/2⌋, där block_spark är den minsta peerkoalition vars staplade effektiva signaturer P⊥·B_T är kolumnrangbristfälliga. Peerdetekterbarhet är FULL KOLUMNRANG hos P⊥·B_j (ett block som inte är noll men rangbristfälligt är ett attackblock skilt från noll som hamnar i range(G) och inte lämnar någon residual), inte enbart P⊥·B_j ≠ { "0" }

seg-3b8b54db475d = Geometrisk instansiering av gränsen för blockvis spark / säker tillståndsskattning (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blockvis spark enligt Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — INTE konsensuströskeln 3f+{ "1" } av Lamport–Shostak–Pease ('bysantinsk' avser enbart felMODELLEN med godtyckliga/samverkande fel). Det specifika tolererade antalet fel är en modellerad egenskap hos den representativa nätverksgeometrin, kontrollerad för självkonsistens med handkonstruerade analytiska fall och räkneformlerna

seg-4f57f586cf82 = Golv för temporal gauge vid autonomt holdover i den självrefererande månkonstellationen (T4)

seg-eb690e8f5c9b = holdover_floor fastställer att i ett ensemble av autonoma noder som endast är sammanbundna av mätningar mellan noderna är den gemensamma klockfrekvensen (δα_j += { "1" } ∀j) en fri parameter i ensembletiden som ligger i N(GᵀWG): ingen mängd ytterligare avståndsmätning mellan noder kan observera den (rate_in_gauge = true, temporal_gauge_dim = { "2" } tillsammans med den gemensamma offseten). Detta är det genuina holdover-golvet — den temporala motsvarigheten till positionsgaugen för det stela systemet. Att lägga till en extern absolut frekvenskoppling (en direkt länk till en referens utanför nätverket) driver ut den gemensamma frekvensen ur nollrummet (rate_in_gauge = false, temporal_gauge_dim = { "1" }), vilket visar att golvet är en verklig gauge och inte en artefakt av oscillatormodellen

seg-097f126797bb = Argumentet om fri parameter i ensembletid (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instansierat på det representativa nätverket med verkliga DE440-data per nod: ett relativt residualnolltest av den analytiska generatorn för gemensam frekvens mot GᵀWG, där kontrasten med brutet koppel skiljer den genuina gaugen från en artefakt av oscillatormodellen. Representativ modellerad geometri, inte en certifierad tidsbudget

seg-25ffd6e1979c = Gemensam/differentiell uppdelning per leverantör, enhetlig förklaring via en rangbrist och lutning på skyddsgapet (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Tre aspekter av den enda uppdelningen ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), med den 8-dimensionella gaugen för datum⊕tidsskala som N(G) och de state_dim − { "8" } = { "32" } observerbara riktningarna som range(G): (T5) provider_mismatch_split klassar en gemensam bias hos flera leverantörer (∈ range(G)) som OUPPTÄCKBAR — den kräver en extern koppling — och en differentiell bias (∉ range(G)) som självövervakad / UPPTÄCKBAR; (§{ "0" }) enandet består i att SAMMA blinda underrum range(G) styr den oupptäckbara felklassen, så att datumgaugen N(G) och det feldöva underrummet range(G) är en och samma geometri, inte två; (g7) slope ger Browns lutning på skyddsgapet ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ för ett fel b ∈ range(G) (skattaren fördärvas utan någon paritet) och ändlig för ett upptäckbart fel

seg-e0fd3860fce9 = Sluten algebra för paritetsprojektor och pseudoinvers på det representativa nätverket med verkliga DE440-data per nod: den gemensamma/differentiella uppdelningen, enandet N(G) ⊕ range(G) och Browns ({ "1992" }) lutning på skyddsgapet följer alla av att värdemängden annihileras, P⊥·G = { "0" }. Representativ modellerad geometri, inte en certifierad skyddsnivå

seg-101b0551d987 = MTIE och TDEV för telekomtidssynkronisering på en tidsfelsserie vid holdover

seg-b4762fd3cb9d = Det maximala tidsintervallfelet och den tidsavvikelse som scenariotypen <c1/> rapporterar, på en holdover-registrering i telekomskala: en MTIE med glidande fönster och monoton kö med komplexitet O(n) (telecom_timing::mtie_sliding, som behövs för att ett dygn med sampel per sekund ska gå snabbt) och motorns TDEV (allan::time_deviation), utvärderade på det rutnät som typen rapporterar och avlästa ur en fullständig körning som läser in serien

seg-59cb2711355c = allantools { "2024.06" } — ett oberoende frekvensstabilitetsbibliotek från tredje part — mtie() och tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, där serien tolkas ur samma text med 17 värdesiffror på båda sidor; referensen registrerar seriens SHA-256 och kan genereras om offline med tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Kontrollerar ESTIMATORERNA på denna registrering, inte den syntetiska holdover som gav upphov till den

seg-632add2dbd3c = ITU-T-masker för telekomsynkronisering med PASS/FAIL och marginal

seg-47687529aee7 = Avskrivna gränser ur ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst och ePRTC-A holdover (inklusive tidsfelskurvan i Table { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC klass A-D och G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referenspunkt C, vart och ett med öppet eller slutet intervall så som tabellen anger det och med varje post 'for further study' utelämnad; ett utfall och en marginal vid den bindande punkten för varje kontroll, samt tiden till dess varje budget överskrids. Kan köras som scenariotypen <c1/>

seg-165ed2bc771a = ITU-T-masker för wander-generering vid frekvenssynkronisering (G.811, G.812, G.8262, G.8262.1)

seg-953793d4446a = Sju MTIE- och TDEV-masker för wander-generering vid konstant temperatur för typen <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) typ I, II och III, G.8262 (10/2024) EEC Options { "1" } och { "2" } samt G.8262.1 (11/2025) eEEC (låst läge), inklusive de potenslagsdelar som tabellerna skriver (<c2/> och liknande), varje intervall öppet eller slutet så som det är tryckt, mätta genom det { "10" } Hz-filter som klausulerna anger (antaget tillämpat före samplingen); referensscenariot scenarios/telecom-synce-eec.toml ställer en fritt gående OCXO mot de tre EEC-maskerna. Inte implementerat: tillåtna avvikelser vid varierande temperatur, holdover, transienter, jitter och frekvensnoggrannheten i G.811

seg-ca16d9c98dc5 = Avskrift av de namngivna rekommendationerna (nedladdade från itu.int den 2026-10-13), där varje rad har lästs om mot texten och där den brytpunktskontinuitet som de tryckta koefficienterna medför begränsas i testerna (till exempel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns mot platån på { "100" } ns i G.812 Table { "4" }). En avskrift av standarder med interna konsistenskontroller, inte ett formatkontrolltest och inte en extern validering. G.812 (06/2004) anges vara ersatt av en förpublicerad utgåva från 08/2026 och G.811 har en Amd. { "1" } (04/2016); ingen av dem kunde läsas, så ingen av dem kontrolleras. Scenariot med fritt gående OCXO överskattar oscillatorns bidrag vid observationsintervall som är långa i förhållande till en slingas tidskonstant; det säger ingenting om någon utrustnings klocka

seg-5fc2ad88faf0 = Klockloggformat (RINEX clock, TimeLab ASCII, TAPR TICC) inlästa till en normaliserad fasserie

seg-5b5bcbdea166 = clock_log::read_input: ett parserlager som gör om en RINEX-klockfil (AS/AR-poster för en namngiven klocka, versionerna { "2" } och { "3.00" } till { "3.04" }), en ASCII-fas- eller frekvenslogg i TimeLab-stil eller en tidsstämpel- eller intervalllogg från TAPR TICC till ett enhetligt fasrutnät, med tau0 angivet, hämtat från ett huvud eller som medianavståndet, med varje lucka, avvikande avläsning utanför rutnätet och dubblett räknad, samt en luckpolicy som antingen vägrar, tar längsta sammanhängande körning eller interpolerar linjärt; kopplad som tillval till telecom-timing-serien (<c1/>, som lägger till ett block <c2/>) och klocktypen (<c3/>, som lägger till ett block <c4/> med ADEV, TDEV och MTIE, tabellens SHA-256 och fasens SHA-256; runs = { "1" }). Utan tabellen är båda typerna byte för byte identiska

seg-acdb0337bce7 = Klockloggformat från linuxptp (ptp4l, phc2sys, ts2phc) och chrony (tracking, statistics) inlästa till en normaliserad fasserie

seg-e87b3dba2072 = clock_log::read_input med formaten ptp4l, phc2sys, ts2phc, chrony-tracking och chrony-statistics: den loggade offseten från en servorad i linuxptp (ns, radens egen tidsstämpel inom hakparentes, avläsningar innan servot först rapporterar s2 utelämnas och räknas) eller från en chrony-tracking- eller statistics-logg (s, enligt kolumnposition, UTC-datum och tid) blir ett enhetligt fasrutnät genom samma luckpolicyer som de andra formaten; en källväljare (<c1/>) namnger ett av flera gränssnitt, klockor eller adresser; loggarna matar telecom-timing-serien, klocktypen och typen för holdover-test

seg-fb9393044576 = Fixturer skrivna för Kshana utifrån demonernas publika radlayouter, med påhittade värden (NOTICE.md i fixturmappen); ingen logg från en verklig installation lästes och ingen oberoende referens jämför tolkningen med en annan läsare, så en layout som skiljer sig mellan demonversioner kan ändå vägras eller läsas fel. De estimatorer som matas av fasserien är de som kontrollerats mot allantools i raderna ovan

seg-97aebb84576e = Holdover-test poängsatt utifrån en tidsfelsregistrering från operatören

seg-ab533cf99c56 = Typen <c1/>: en tidsfelsregistrering (en klocklogg från linuxptp, chrony, TICC, TimeLab eller RINEX, eller par av time_s,time_error_ns) delas vid de två tidpunkter som operatören anger för bortfall och återkomst av GNSS i ett baslinjesteg, ett holdover-steg och ett återhämtningssteg; baslinjen mäts mot de ITU-T-masker som är skrivna för en låst klocka, och holdover mot dem som är skrivna för holdover eller en autonom klocka, ePRTC-A-holdovermasken och tidsfelsbudgetarna; holdover rapporterar den frekvensoffset enligt minsta kvadrat som systemet höll, och återhämtningen om och när |TE| kom inom ett angivet band och höll sig där under en angiven uppehållstid, med toppvärdet och det största steget. Varje gräns är den som typen telecom-timing skriver av; de två tidpunkterna är operatörens uppgift och kontrolleras inte

seg-a54380cf95ea = Handräkning på registreringar byggda av formler vars lutning, steg, extremvärde och återhämtningstid är kända före körningen (testerna anger dem), samt maskerna, kurvan och budgetarna i telecom-timing-raderna ovan. Ingen laboratoriemätning av en verklig holdover poängsattes och ingen extern referens jämfördes, så typen gör inget påstående om någon klocka eller något system; en samarbetspartner med tidslaboratorium behövs innan någon siffra per klockklass kan lyftas upp

seg-94cbac97a1aa = Tillgänglighet för GNSS-signaler i Space Service Volume och bortom den, jämförd med ICG:s SSV-häfte

seg-c59e349fdc9e = Tillgänglighetssvepen för typen <c1/>: per konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) och sammanlagt, andelen (användare, epok)-par med minst en och minst fyra signaler och det längsta avbrottet, för en användare på en sfär (häftets globala skal med 2 562 punkter, { "14" } dygn med { "1" } minuts steg) eller på en bana (GEO, HEO, månöverföring), utifrån de keplerska banorna i häftets bilaga C, en konstant lägsta utstrålad effekt inom referensvinkeln utanför riktningsaxeln, jordens skymning genom sfären plus { "50" } km och ett tröskelvärde för C/N0; användarantenner ur häftets tabell B10

seg-d71c9d361342 = ICG:s häfte Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), självt en simulering, jämfört enligt en förhandsregistrering som incheckades före körningen (xval/gnss-ssv/PREREGISTRATION.md; resultat i xval/gnss-ssv/RESULTS.md, fastlåsta av tests/ssv_booklet_results.rs, misslyckanden inkluderade). Körning { "1" } på den förhandsregistrerade tolkningen: konstanterna för lägsta utstrålad effekt och månens tröskel stämmer (S0, S6 uppfyllda); tröskeln för övre och nedre SSV, RF-tröskeln, GEO och HEO är NOT MET, nästan alla genom GLONASS, för vilket häftet anger { "20" } och { "28" } grader i tabellerna B2 och B6 samt { "26" } och { "34" } grader i tabell { "4.2" }. En diagnostisk variant med vinklarna ur tabell { "4.2" } stämmer i varje cell för övre SSV, nedre SSV och de sex GEO-uppdragen (den ersätter inte körning { "1" }; celler för RF, HEO och månen missar fortfarande). De uppmätta panelmönstren för GPS L1 återges inte av den parametriska ersättningen (RMS { "6" } till { "9" } dB mot en tröskel på { "3" } dB). Överensstämmelsen visar att häftets angivna metod återges, inte att GNSS-signaler beter sig så

seg-d2f04991c8a4 = Effekter av jonosfär, plasmasfär och atmosfär på GNSS-signaler som tangerar jorden längs limbstrålen, samt utformningen av mottagare för svaga signaler, i typen <c1/>

seg-1a1786ba90b6 = En Chapman-jonosfär, en plasmasfär av Gallagher-typ och en neutral atmosfär (brytning av refraktivitet, syreabsorption, defokusering) integrerade längs den raka strålen mellan sändare och användare: sned total elektroninnehåll, dess plasmasfäriska del, extra fördröjning, tangenthöjd och förlusten på länkar som tangerar jorden; samt en mottagare för svaga signaler (koherent och icke-koherent integrering, databitgräns, stöd, Doppler-sökning) som sätter tröskeln för C/N0 utifrån modellerna för inhämtning och följeslingor

seg-4ca1217472ab = Slutna uttryck och publicerade storleksordningar i testerna (en Chapman-skikts topp och brytningen vid ytans limb, några TECU plasmasfär på en GPS-till-GEO-stråle); mottagarutformningen återanvänder modellerna för inhämtning och följeslingor och deras tester. Inga uppmätta data från limbsondering eller mottagning av svaga signaler har jämförts med den

seg-6b8f9f3ca2a3 = Navigationsfilter ombord med GNSS för rymdfarkoster i hög bana och månöverföring

seg-39ddc494f103 = Läget <c2/> i typen <c1/>: ett utvidgat Kalmanfilter med nio tillstånd (position, hastighet, mottagarklockans bias och drift, en skala för solstrålningstryck) på pseudoavstånd vars tillgänglighet, brus och C/N0 kommer från samma länkgeometri som svepen; referensen integreras med J2, tredjekroppsverkan från solen och månen samt strålningstryck med skugga, filtret modellerar J2 och tredje kropparna och skattar strålningstrycket; rapporterar position och hastighetsfel inom och ovanför GNSS-banorna, det längsta mätningsgapet och det genomsnittliga NEES

seg-469602656ab4 = Simulerad referens mot filtrets egen skattning (ett konsistent filters genomsnittliga normaliserade skattningsfel i kvadrat är cirka { "3" } för positionen) och determinism för ett fast frö. Inga flygdata eller registrerade GNSS-data från hög bana jämförs; solen och månen är lågprecisionsersättningar med cirkulära banor

seg-5fc242476828 = Relativ navigering för en formation av flera rymdfarkoster i en mycket elliptisk bana med GNSS

seg-f67eb29d4483 = Läget <c2/> i typen <c1/>: en chief och deputies kör var och en det absoluta filtret; deputyns position relativt chiefen skattas dels genom att de absoluta skattningarna subtraheras, dels med ett relativt filter på enkeldifferentierade pseudoavstånd för de signaler som båda farkosterna följer, med den relativa dynamiken som skillnaden mellan två olinjära banor

seg-69c078b57fc8 = Samma simulerade referens som för det absoluta filtret: det relativa filtrets fel mot det sanna relativa tillståndet, och kontrollen att det presterar minst lika bra som att subtrahera två oberoende absoluta positionsbestämningar. Inga flygdata från formationer jämförs

seg-7038f6902820 = Feltermer för kallatominterferometer: fasbrus i Raman-laser, vågfrontskrökningsbias och upplösning av fransosäkerhet

seg-4d9690207607 = inertial::cai_error_terms (biblioteksfunktioner som ännu inte kan nås från någon scenariotyp): viktningsfunktionen för Raman-fasen hos en interferometer med tre kvadratpulser (Cheinet et al. { "2008" }, Eq. { "8" }) med det slutna uttrycket för vit fas (pi/2)^{ "2" } S_phi0/tau_R och en numerisk väg för valfritt spektrum; det laserfrekvensbrus som fördröjningen vid retroreflektionen inte tar ut (Le Gouet et al. { "2007" }, Eqs. { "9" } till { "11" }); den rena defokusbiasen sigma_v^2/R hos ett termiskt moln och dess minskning med en detektionsradie; sannolikheten för fel fransindex erfc(pi/(sqrt({ "2" }) s)) för ett stöd från en klassisk accelerometer och för två avfrågningstider, och dess invers

seg-a7b220763674 = Varje slutet uttryck mot en oberoende numerisk väg i testerna (kvadratur i frekvensdomänen av den exakta överföringsfunktionen och fördröjningsfiltret, en Monte Carlo över atomer för vågfrontsbiasen, en Monte Carlo över skott för fransindex) och dess gränsfall. Ett publicerat räknat värde: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) anger att vid tau_R = { "20" } us krävs ett vitt Raman-fasbrus under -111 dB rad^2/Hz för { "1" } mrad per skott; enbart den vita termen ger { "0.99" } mrad (artikeln härleder nivån med sin Eq. { "17" }, flicker plus vit). Intern konsistens och ett räknat värde, inte en extern validering; aberrationer av högre ordning och en enskild lasers brus modelleras inte

seg-c380ec16a4f8 = Greenhalls och Rileys exakta ekvivalenta frihetsgrader för Allan-, modifierad Allan- och Hadamard-varianserna

seg-dee2a54c5019 = allan::edf_greenhall (med omslagen edf_greenhall_adev, _mdev och _hdev): den fullständiga algoritmen av Greenhall och Riley, Proc. 35th PTTI ({ "2003" }), Section { "3" } (Eqns { "7" } till { "13" } och koefficienterna för stort J i Tables { "1" } till { "3" }), för differensordningarna { "1" } till { "3" }, brusexponenter +{ "2" } till -4 varhelst alpha + 2d > { "1" }, överlappande och icke-överlappande, modifierade och omodifierade estimatorer; NaN där den inte är tillämplig, inklusive fallet omodifierat vitt PM med ceil(M/S) <= d, vars slutna uttryck inte är implementerat. assurance::uncertainty::edf delar nu koden och behåller sina utdata bit för bit

seg-363705e03bac = Förinställningar för oscillatorernas holdover ur öppna datablad

seg-9750d9e0ec7a = Fyra förinställningar — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (Microchip 5071A högpresterande rör) och CSAC (Microchip SA.45s) — var och en med sitt datablads maxvärden för Allan-deviation, åldring och temperaturgräns; en icke-negativ anpassning enligt minsta kvadrat av frekvensbrus av typen vitt + flicker + slumpvandring, skalad så att den omsluter varje datablads punkt, ett flickergolv som aldrig ligger under värdet för längsta τ, linjär åldring och en sinusformad temperaturterm, syntetiserad som en holdover med slumpfrö efter ett GNSS-bortfall

seg-69f93d5ec864 = Holdover-prediktion utifrån en uppmätt klockregistrering, kontrollerad på undanhållna data

seg-8bdc5a24c66d = Den uppmätta registreringens väg i typen <c1/>: den överlappande Allan-deviationen för en fasregistrering, anpassad med edf-viktad icke-negativ minsta kvadrat i basen för vit fas och frekvensmodulation enligt IEEE Std { "1139" } (slot_timing::fit_weighted), och sedan inverterad för den glidtid då tidsfelet når en tröskel (slot_timing::slot_budget). Golvet för rött brus mäts ur registreringen i stället för att antas

seg-c888226296fe = En verklig fritt gående atomklocka: { "556 990" } fassampel med en sekunds intervall från en cesiumnormal 5071A mätt mot en vätemaser (A. Wallin, distribuerad med allantools; fastlåst incheckning och SHA-256 i scripts/fetch_cs5071a.sh), samma registrering som tests/cs5071a_reference.rs använder för estimatorerna. De undanhållna två tredjedelarna är en extern mätning som prediktionen aldrig sett. Datastyrd: arbetsflödet realdata-clock hämtar registreringen och kör testet med KSHANA_REQUIRE_REALDATA={ "1" }. Kontrollerar vägen anpassa-sedan-invertera på en atomnormal dominerad av vitt FM över glidtider upp till cirka { "50 000" } s; inte databladens eller klassernas källor, inte de deterministiska termerna. INTE en kristalloscillator: på en uppmätt OCXO-registrering (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h mot en vätemaser) är den undanhållna prediktionen konservativ, på { "0.59" } till { "0.70" } av det uppmätta överträdelsen, och mestadels utanför tröskeln, eftersom oscillatorns brusgolv halverades under registreringen; i urvalet ligger den inom { "0.98" } till { "1.17" }. Kristallfallet förblir MODELLED. INTE heller atomklockor i omloppsbana: på { "10" } satellitklockor av typen GPS Block IIF (tests/slot_timing_igs_holdout.rs, IGS slutliga klockor med { "30" } s, { "14" } dygn, protokoll skrivet före nedladdningen) hamnar { "8" } inom tröskeln och { "2" } (G25, G30) är optimistiska med upp till cirka 2x, så enligt protokollet förblir fallet i omloppsbana MODELLED

seg-d7e03158b972 = Sekunder tills en fritt gående klocka lämnar skyddsmarginalen för ett tidsindexerat slot, och den takt för positionsbestämning som håller den inom marginalen

seg-0b4d8815f756 = Typen <c1/>: det predikterade felet E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inverterat för överträdelsen, den återstående tiden, återsynkroniseringsintervallet efter avdrag för latensen vid positionsbestämning och antal positionsbestämningar per dygn, varje term specificerad med den dominerande namngiven; klockor från de sex standardvärdena i ClockClass (TCXO, OCXO och RAFS tillagda, var och en med hänvisning till ett datablad), förinställningarna för telecom-timing, ett datablad angivet direkt i scenariot eller en uppmätt registrering; en överträdelse bortom källans längsta medelvärdestid markeras som extrapolerad

seg-cc0464060e58 = Slutna uttryck för varje term för sig och den oberoende rotsökningen holdover::holdover_seconds; databladsvärdena är de namngivna dokumenten (docs/SLOT-TIMING.md). Ett klassstandardvärde vilar på ett antaget golv för rött brus och en databladskälla är en omslutning av maxvärden, så ingetdera är en mätning av någon enhet

seg-2797643153dc = Skyddsnivå för tidssynkronisering hos en mottagare i omloppsbana under GNSS-spoofing

seg-cb412a2ffadf = orbital_timing::orbital_timing, nåbar som spoofing-avsnittet i typen <c1/>: hastighet och period i cirkulär bana, den längsta tid en markbaserad spoofer kan nå satelliten per passage, golvet för den klockstödda övervakaren och detekteringslatensen för CUSUM, den villkorliga skyddsnivån (golvet plus glidtiden över latensen), det drag som en spoofer med en angiven högsta rampfrekvens hinner ackumulera innan satelliten lämnar sin fotavtryckszon eller en oberoende kontroll körs, samt huruvida varje kontakt med marken eller varje kontroll via tvärlänk är oberoende av en markbaserad spoofer

seg-3d441db3a373 = Reduktion till den befintliga skyddsnivån för tidssynkronisering och de slutna uttrycken för synlighet vid cirkulär bana och sfärisk jord. Villkorat på detektering, en terrestrisk spoofer med en angiven rampfrekvens, en passage rakt ovanför på en icke-roterande jord; inte kontrollerad på en spoofad mottagare i omloppsbana

seg-158a99d40b0d = Slutna uttryck för effektspektraltäthet hos signaler i L-bandet och spektrala separationskoefficienter

seg-17060c71fa54 = Effektspektraltätheter med enhetsarea för GPS L1 C/A och L2C (BPSK({ "1" })), GPS L5 och Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) och Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, med en MBOC-variant tillagd), deras numeriskt lokaliserade nollställen och maxvärden (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz), och den spektrala separationskoefficienten för en signal mot valfritt spektrum vid valfri offset (navsignal::spectral_separation_coeff_offset) eller mot en ton, plant brus, en chirp eller matchat brus (spectrum::Jammer::ssc), med anti-jam-koefficienten Q = 1/(R_c kappa)

seg-d8fadba57203 = Publicerade läroboksvärden: huvudloben för BPSK(n) på 2n x { "1.023" } MHz från nollställe till nollställe och anti-jam-koefficienterna Q = { "1" } för en smalbandig (CW) jammer och Q = { "1.5" } för en spridspektrumsjammer matchad mot C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed., section { "9.4" }); huvudloberna för BOC(m,n) centrerade vid plus eller minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); de spektrala separationskoefficienterna -61.8, -64.8 och -67.8 dB/Hz för C/A med C/A, BOC({ "1,1" }) med BOC({ "1,1" }) och C/A med BOC({ "1,1" }) (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, May/June { "2006" }), återgivna här ur deras slutna uttryck för autokorrelation via Parseval. Maximum för BOC({ "1,1" }) ligger inte vid { "1.023" } MHz: loben sträcker sig från bärvågsnollstället till { "2.046" } MHz och har sin topp vid { "0.759" } MHz, och testet fastlåser båda. MBOC-blandningen är den som ICD:n definierar och kontrolleras endast för enhetsarea och linjäritet

seg-f134975d4ffa = Spektrumvattenfall för L-bandet med J/S per band och effektiv C/N0 under en skriptad tidslinje för jammers

seg-86ad8f89a822 = Typen <c1/>: ett rutnät över frekvens och tid för effektspektraltätheten i L-bandet (termiskt golv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalerna vid sina lägsta mottagna effekter enligt gränssnittsspecifikationen, samt jammers med kontinuerlig våg, smalband, chirp och matchat brus med på/av-tider), där varje cell medelvärdesbildas över sitt fack och sin rad (chirpar exakt över hela och partiella svep, jammers efter arbetscykel), effektiv C/N0 per band = [1/(C/N0) + sum (J/S) kappa]^-1 per rad, J/S per band, J/S i bandet, och ett SVG-vattenfall med staplar för C/N0. Rapporten innehåller en korskontroll mot kedjan i typen <c2/> på samma länkindata

seg-deead3dc3c43 = Reduktion till anti-jam-ekvationen och länkbudgeten i den befintliga typen <c1/> (samma kod, anropad med samma indata) och det slutna uttrycket för brusgolvet k T0 F. Signalspektra som ligger under är den kontrollerade raden ovan; jammereffekter, tidslinje och frontändens bandbredder är scenarioindata, spektra är kontinuerliga (inga spridkodslinjer), och ingen automatisk förstärkningsreglering, blankning eller antennmönster verkar på jammern. Inget uppmätt stört spektrum finns i förvaret att kontrollera sammansättningen mot. Tabellen Q i typen <c2/> (CW och smalband { "1" }, bredband och svepande { "2" } sedan { "0.36" }: läroboksvärdena, fastlåsta mot de slutna uttrycken i navsignal) stämmer med den här modellens värde för CW och skiljer sig från vad den härleder för brus matchat mot C/A ({ "1.5" }) och för plant brus från nollställe till nollställe utan normalisering i bandet ({ "2.2" }); rapporten skriver ut båda

seg-1461dcaed6be = Inläsning och utskrift av SigMF-inspelningar och Welch-spektralskattningar av komplex IQ

seg-2195d95299b2 = sigmf: läs och skriv inspelningar i Signal Metadata Format (JSON .sigmf-meta med kärnfälten global, captures och annotations; rå .sigmf-data som cf32_le, ci16_le eller ci8, heltalsavkodarna delade med realdata::iqif::load_iq), allt på strängar och bytebuffertar. spectrum::welch_psd: periodogram med Hann-fönster, överlappande och medelvärdesbildade, densitetsskalade, på en radix-2-transform i craten (spectrum::fft_in_place). Dessa två är det kontrollerade påståendet. spectrum::synthesise_iq ritar modellen som IQ, och avsnittet [iq] i typen <c1/> kör modell till IQ till SigMF till Welch och jämför med modellen; dess avsnitt [recording] skattar en verklig inspelning (inbyggda versioner); syntesen och dessa modelljämförelser ligger utanför det kontrollerade påståendet

seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) med samma periodiska Hann-fönster, överlappning, densitetsskalning, ingen avtrendning och tvåsidigt medelvärde: varje bin inom relativt { "1e-12" } (observerat { "6.0e-14" }) över { "27" } fall, med segmentantal hämtade ur scipys egen spektrogram. sigmf-python { "1.13.0" } (LGPL-3.0, körd som verktyg) skriver fem inspelningar från tredje part (cf32_le, ci16_le, ci8, två captures med annotations, ett icke-noll första sample_start) som craten avkodar bitidentiskt med identiska kärnfält, och läser craten egna inspelningar tillbaka bitidentiskt; metadatascheman för SigMF { "v1.2.6" } rapporterar noll fel på cratens metadata. Toleranser fastställda före den första jämförelsen. Utanför påståendet: spectrum::synthesise_iq och jämförelserna för [iq] och [recording] med modellen (en syntes har inget enda rätt svar; en periodisk chirp visar linjer, Fresnel-rippel och kantsvansar som den släta modellen utelämnar, total effekt inom { "2" } %), konventionen för skalning från heltal till flyttal (craten dividerar med { "32767" } och { "127" }, sigmf-pythons autoscale med { "2" }^{ "15" } och { "2" }^{ "7" }, vilket specifikationen lämnar öppet; jämförelsen använder råa koder), flerkanalsinspelningar och de datatyper som läsaren vägrar

seg-bf2d02d76762 = Planeternas positioner genom hela solsystemet ur JPL:s keplerska Standish-element

seg-c9d3549045eb = Heliocentriska positioner för Merkurius, Venus, barycentret jord–måne, jorden, Mars, Jupiter och Saturnus ur Standish Table { "1" } ({ "1800" } e.Kr. till { "2050" } e.Kr.), och för alla åtta planeter ur Tables 2a/2b ({ "3000" } f.Kr. till { "3000" } e.Kr., med termerna b, c, s, f för medelanomalin), efter JPL-sidans algoritm steg för steg och roterade till ICRF (International Celestial Reference Frame) med sidans snedställning; jorden skiljs från barycentret med månserien av Montenbruck & Gill och massförhållandet. Sammansatt som ephem_provider::AnalyticSolarSystem så att varje kropp är tillgänglig relativt varje annan, och körbar som typen <c1/>

seg-4ea08a296b37 = Positioner för solen, månen, Merkurius och Venus ur DE440-kärnan vid UTC-epoker (KernelEphemeris)

seg-8d47467c36e4 = Geometriska positioner för solen, Merkurius, Venus, jorden och månen relativt varandra (axlar enligt J2000/ICRF, meter) ur en JPL DE440-kärna via ephem_provider::KernelEphemeris vid UTC-epoker: kroppsnamn avbildade på NAIF-koder, UTC förd genom skottsekundstabellen och TT till TDB med tvåtermsserien för TDB-TT, kärnan läst av motorns egen läsare. En kropp som kärnan bara håller som systemets barycentrum (Mars till Neptunus, Pluto i de440s) vägras, aldrig ersatt. Standish-raden utan kärna förblir webbläsarens och reservens väg

seg-b59153f28d69 = Ljustid mellan kroppar i solsystemet

seg-48ebe0983725 = Den newtonska ljustiden i en riktning från vilken kropp som helst till vilken annan som helst, mottagen vid en epok, löst av den radiometriska fixpunktslösaren för ljustid (radiometric::light_time_solution, sändaren vid sin fördröjda position) genom solar_system::link_on på valfri EphemerisProvider; typen solar-system kör den på det analytiska solsystemet i det heliocentriska systemet (solar_system::link). Tvåvägsavståndet från radiometric::two_way_range och Shapiro-fördröjningen från solen från radiometric::shapiro_delay rapporteras separat och jämförs inte externt. Utmatad för varje kropp mot en observatör och för varje extra länk av typen <c1/>, och för nedlänken från kropp till jorden av typen <c2/>

seg-6e0b9687e8ee = Uranus och Neptunus ur Standish Table { "1" }, Pluto och planeternas hastigheter

seg-df3bf502dfe9 = Positioner för Uranus och Neptunus ur Standish Table { "1" } (standard inom { "1800" } e.Kr. till { "2050" } e.Kr.), Pluto ur raden i Table { "1" } från { "1992" } som JPL:s nuvarande sida inte längre anger, och den heliocentriska hastigheten för varje planet: tvåkroppsderivatan med den medelrörelse som elementen ger plus ellipsens vridning genom ändringstakterna för perihel, inklination och nod

seg-f49245efe44f = Mätt mot JPL Horizons DE441 (samma incheckade fixturer), men inte kontrollerad: de angivna värdena i Table { "1" } för Uranus och Neptunus överskrids med upp till { "2.0" } och { "5.2" } gånger mot heliocentriska positioner i DE441 (Neptunus klarar dem mot barycentriska positioner, vilket tyder på att anpassningen inte var heliocentrisk), sidan anger inget fel för Pluto, och ingen publicerad gräns finns för hastigheterna. Tables 2a/2b klarar sina egna värden för Uranus och Neptunus och täcks av den kontrollerade raden

seg-a50be56f605a = Positioner för månen och sju stora månar (Phobos, Deimos, de galileiska månarna, Titan)

seg-2cfbe5a1eece = Den geocentriska månen ur serien av Montenbruck & Gill (vars term på -1.3972 deg per sekel redan hänför den till J2000-ekvinoktiet), och planetocentriska positioner och hastigheter för Phobos, Deimos, Io, Europa, Ganymedes och Callisto ur de medelelement som JPL Solar System Dynamics anger i varje månes Laplaceplan, med medellongitudens hastighet hämtad ur IAU:s synkrona rotationshastighet (tabellen skriver ut perioden med för få siffror för att hålla fasen), och för Titan ur IAU:s rotationsmodell (månen på minus kroppsfasta x-axeln vid medelavståndet), eftersom Titans tryckta rad för Laplaceplanet inte återger Horizons ens vid sin egen epok

seg-6c81bd570fe5 = Mätt mot JPL Horizons satellitefemerider (DE441, MAR099, JUP365, SAT441) incheckade i tests/fixtures/solar_system/horizons_satellites_icrf.csv med frågan och hämtningsdatum; ingen publicerad noggrannhet finns för medelelement eller för placeringen enligt rotationsmodellen, så de fastlåsta trösklarna fångar regressioner och kontrollerar inte. Medelelementen utelämnar resonans- och solstörningar, och Phobos sekulära acceleration modelleras inte

seg-8b8c8e28ece9 = Fysikaliska konstanter för varje kropp i solsystemet och rapporten för hela systemet

seg-d225a30de35c = Body tillför Merkurius, Venus, Jupiter, Saturnus, Uranus, Neptunus, Pluto, Phobos, Deimos, Io, Europa, Ganymedes, Callisto och Titan (gravitationsparameter, referensradie, J2 där det publicerats med den radie det är hänfört till, IAU:s pol och nollmeridian), en namnuppslagning och en BodyFacts-post (NAIF-kod, klass, moderkropp, ekvatorial- och medelradie); typen <c1/> rapporterar dem för alla arton kroppar med positionerna, ljustiderna och ett banspår över ett varv, varje kropp märkt VALIDATED eller MODELLED

seg-6adc29de51fd = Avskrift av publicerade konstanter, var och en med källa där den definieras: gravitationsparametrar ur JPL Horizons kroppsposter och JPL:s tabell över fysikaliska parametrar för satelliter, radier ur JPL:s tabeller över fysikaliska parametrar (IAU WGCCRE { "2015" }), poler och nollmeridianer ur IAU:s arbetsgrupp för kartografiska koordinater och rotationselement (medelvärden, utan T-takten och periodiska termer), J2 ur Smith et al. { "2012" }, Iess et al. { "2018" } och { "2019" } samt Jacobson { "2009" } och { "2014" }. Kontrollerad för intern konsistens (Jupiters rotationsperiod mot System III-takten, varje J2 mot sin referensradie), inte mot någon extern referens. { "0.30" } omgång { "2" }: värdena för GM antogs från gm_de440 och elementen för Phobos och Deimos från pck00011, så { "0" } av { "84" } konstanter för de fjorton tillagda kropparna skiljer sig nu från NAIF (var { "12" }), vilket är en avskriftskontroll och inte räknas. { "0.36" }: IAU:s kroppsfasta orientering och GM för de fjorton tillagda kropparna är utbrutna till en egen VALIDATED-rad ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); den här raden behåller det som återstår. J2 och medelradien är angivna med källa, inte kontrollerade; positionerna i rapporten vilar på sina egna rader; och rapportens prime_meridian_deg för jorden, månen och Mars förblir på konventionella konstanter (upp till { "6.6e-3" }, { "2.8e-2" } och { "9.6e-4" } rad från IAU_<BODY>). Revisioner i { "0.30" }: GM för Phobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptunus { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Phobos ekvatorialradie { "13.1" } -> { "13.0" } km; prime_meridian_deg innehåller nu de kvadratiska och periodiska termerna

seg-fa8a4b082cd5 = IAU:s kroppsorientering och gravitationsparameter för de fjorton tillagda kropparna i solsystemet

seg-fc8d277aa2fd = Body::iau_rotation_et, rotationen från J2000 till IAU:s kroppsfasta system för Merkurius, Venus, Jupiter, Saturnus, Uranus, Neptunus, Pluto, Phobos, Deimos, Io, Europa, Ganymedes, Callisto och Titan med varje sekelhastighet, kvadratisk term och periodisk term som kroppen har i pck00011, och gravitationsparameterfältet mu för samma fjorton kroppar. Solen, jorden, månen och Mars har konventionella konstanter som ägs av andra rader och täcks inte

seg-87ab655f8270 = Positionsbestämning kring valfri kropp i solsystemet med en lokal konstellation och en djuprymdlänk från jorden

seg-d9b1b0ac97d3 = Typen <c1/>: en orbiter eller en lander på ytan kring en kropp vald med namn navigerar med pseudoavstånd i en riktning från en Walker-navigationskonstellation kring kroppen (tvåkroppsbanor med kroppens sekulära J2-drift, en okänd användarklocka) och ett valfritt klockfritt tvåvägsavstånd från jorden, där jordens riktning och avstånd hämtas ur den analytiska efemeriden vid varje epok; siktlinjer som blockeras av kroppens sfär och en elevationsmask vid ytan; per epok enbart konstellationens GDOP och PDOP (orbit::dop), den formella positionsosäkerheten med och utan jordraden, och positionsbestämningar med Gauss-Newton och slumpfrö (batch_ls::gauss_newton) i båda fallen, med ljustiden och rundturstiden från kroppen till jorden

seg-3538c49df107 = Slutna uttryck och självkonsistens: Keplers tredje lag för reläets period, banradien och ytradien som hålls över körningen, att tillägg av en mätning aldrig ökar den formella osäkerheten, och att de slumpmässiga felen stämmer med kovariansen. Relärbanorna bortser från tredje kroppar (Jupiters drag på reläer kring Europa modelleras inte), bruset är gaussiskt på angivna nivåer och mätmodellen är ögonblicklig, så detta är inte kontrollerat mot något uppdrags navigationsdata

seg-281b680a9897 = Geometri för Walker-konstellationer och de publicerade nominella positionerna i GPS, Galileo och GLONASS

seg-cba54289b732 = Generatorerna i typen <c1/>: Walker-mönster delta och star i T/P/F-konventionen (nodavstånd 360/P eller 180/P, avstånd i planet { "360" }·P/T, fasoffset mellan planen { "360" }·F/T), och GPS-baslinjen och den utbyggbara 24-positionskonstellationen, Galileo- och GLONASS-förinställningarna byggda ur sina publicerade nominella element, placerade i ett jordfast system med den Greenwich-timvinkel som deras dokument anger

seg-bdf83007af50 = Publicerade myndighetsdokument: Galileo Open Service Service Definition Document issue { "1.1" } (European GNSS Service Centre) Tables { "1" } och { "23" }, referenskonstellationen den 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edition { "5.1" } ({ "2008" }) section { "5.2" }, formeln för positionerna med nodlongitud och breddargument; GPS Standard Positioning Service Performance Standard 5th edition (April { "2020" }) Tables 3.2-1, 3.2-2 och 3.2-3, inklusive kolumnen för ekvatorskorsning i markspåret, som är ett oberoende uttalande om den jordfasta geometri som förinställningen måste återge. Kontrollerar generatorerna och avskriften; fasen för medelbanan och noderna för den lutande geosynkrona banan hos BeiDou är inte publicerade och täcks inte

seg-0f1d49ab5d51 = Global geometrisk försämring av precisionen för GPS-baslinjekonstellationen

seg-83775b77f5ca = Täckningsmotorn <c1/> på GPS-baslinjens förinställning med 24 positioner under villkoren i GPS Standard Positioning Service Performance Standard (SPS PS) Appendix B (ett siderist dygn, { "287" } steg om fem minuter, ett globalt rutnät om { "4" } x { "4" } deg viktat med cosinus för latituden, alla i sikte, mask på { "5" } deg, en mottagarklocka): den globala fördelningen av HDOP, medianen för PDOP och tillgängligheten för PDOP högst 6, globalt och vid den sämsta platsen

seg-6fb3c2028c4a = GPS SPS PS 5th edition (April { "2020" }) Appendix B sections B.3.2.2 och B.3.2.3, den publicerade globala medelfördelningen av HDOP för den fullt besatta 24-positionskonstellationen i baslinjen (median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, medelvärde { "0.96" }), Table 3.8-1 (tillgänglighet för PDOP) och Table B.3-1 (ensemble-PDOP för en försämrad konstellation, använd endast som övre gräns), plus ett handhärlett slutet uttryck för en epok. Fördelningarna av VDOP och PDOP för den fulla konstellationen är publicerade endast som en figur, så PDOP fastlåses ensidigt; den sämsta punkten i tid och rum (HDOP { "2.40" } och VDOP { "5.22" } här, { "2.49" } och { "5.43" } publicerade) beror på rutnätet och rapporteras, fastlåses inte

seg-7d4d7200cbca = Täcknings- och DOP-kartor för godtyckliga konstellationsutformningar med flera konstellationer i stor skala, kring valfri centralkropp

seg-b78b79e9fae4 = Typen <c1/> bortom de två fastlåsta fallen: explicita utformningar och utformningar med flera skal, flera konstellationer per körning med en mottagarklocka per konstellation, jorden, månen och Mars ur kroppskonstanterna, BeiDou-förinställningen (fas för medelbanan och ekvatorskorsning vid { "118" } deg E för den lutande geosynkrona banan modellerade), satelliter i sikte per cell, GDOP, PDOP, HDOP, VDOP och tillgänglighet, nedsamplade markspår, och ett förfilter för synlighet efter latitud under satelliten som kör en utformning med { "5" } 000 satelliter på ett rutnät om { "10" } deg på en bråkdel av en sekund

seg-278c77438493 = Ett kedjat uppdrag över scenariotyper på en gemensam tidslinje

seg-3dcfb26f6234 = Faserna i typen <c1/>: varje fas kör ett eller flera scenarier av befintliga typer genom run_toml, läser deras utdata in i namngivna kanaler (klockans tidsfel och skyddsmarginal, genomsnittligt effektivt förhållande mellan bärvågseffekt och brustäthet och följegolv, vertikal skyddsnivå och larmgräns, positionsfel, följda satelliter, larmflaggor) med förinställningar per typ eller explicita resultatsökvägar, placerar dem vid fasens början och håller dem på ett gemensamt rutnät, med fasgränser och händelser; tillstånd förs vidare genom carry (en kanal fortsätter från föregående fas slutvärde), handoff (en föregående fas nummer skrivs in i nästa scenario) och end_at (en fas slutar vid en tid som en körning har räknat fram, till exempel en spoofingövervakares detekteringstid); en kampanjhash och en sammanfattning över varje medlemsresultat

seg-fd018ef7bc3b = Sammansättningsidentiteter mot de fristående körningarna av samma typer: en kampanj med en fas återger det fristående resultatet bit för bit, den förda offseten är lika med föregående körnings eget sista sampel, och fasen som avslutas av end_at har exakt körningens detekteringstid som sin längd. Den additiva förningen över en fasgräns och nollte ordningens hållning är modelleringsval, och varje fas är lika bra som den typ som körde den; inget kedjat uppdrag har kontrollerats mot ett uppmätt

seg-ad6105af464c = Parametersvep och Monte Carlo-ensembler med slumpfrö över valfri scenariotyp

seg-95921611839e = Avsnitten sweep (en till tre punktade nycklar av valfri typ, på det generiska svepets axelvärden, eventuellt med ett ensemble i varje nod) och monte_carlo i typen <c1/>: realisering k körs vid base_seed + k; varje mått rapporterar medelvärde, standardavvikelse, percentiler enligt närmaste rang för 5:e/50:e/95:e och ett percentil-bootstrap-konfidensintervall på { "95" } % med fast frö för medelvärdet (inertial::metric_stat); måttens enheter läses ur den svepta typens eget enhetsblock

seg-03d15c27b3b9 = Det slutna uttrycket för fasens slumpvandring under vitt frekvensbrus, varians q_wf tau (NIST Technical Note { "1337" }), för statistikmaskineriet, och byteslikhet med de fristående körningarna för frösättningen. Det kontrollerar ensemblens aritmetik på motorns egen klockmodell, inte en extern datamängd

seg-24327a0ed82e = Flera scenarier under gemensamma villkor, med en samlad sammanfattning

seg-5833fb3b06e3 = Avsnittet compose i typen <c1/>: namngivna gemensamma värden (till exempel en jammers effekt och position) skrivs in i varje medlem vid de nycklar som de binds till, varje medlem körs, och per mått det minsta, största och genomsnittliga värdet över medlemmarna med medlemmen namngiven; måttens enheter måste stämma överens mellan medlemmarna

seg-67ffd6684b1c = Sammansättningsidentitet mot den fristående körningen. Aritmetiken för gemensamma villkor är bokföring; fysiken är medlemstypernas, var och en med sin egen rad

seg-0bc866720bde = Begränsad optimering av ett mått över kampanjparametrar

seg-f9bdb89c2b4f = Avsnittet optimize i typen <c1/> (CAP-32): en till tre punktade scenarionycklar begränsade till [lo, hi] på en lin- eller log-skala, ett mått avläst via resultatsökväg, mål minimize, maximize eller target; metod grid (svepets axelvärden) eller en deterministisk Nelder-Mead-simplex i normaliserade koordinater med boxprojektion och standardkoefficienterna; ett saknat eller icke-ändligt mått får sämsta poäng och stannar kvar i spåret; med runs > { "1" } är måttet medelvärdet över gemensamma frön; varje utvärdering är en verklig körning av den namngivna typen, förtecknad i trace och räknad i reproducerbarhetssammanfattningen

seg-e3a2f80b04dc = Endast internt: det exakta slutna uttrycket -20 log10(range) för länkekvationen, ett oberoende rutnät med råstyrka över samma typ, och Rosenbrock-funktionen. Tröskeln för 1-D i omgång { "1" } är NOT MET (den förhandsregistrerade lådan uteslöt lösningen på { "3" } dB; optimeraren stannade vid gränsen), registrerad i docs/design/evidence/cap32-optimize/RESULTS.md och inte omräknad. Optimum är lokalt för lådan och startpunkten; inget påstående om globalt optimum

seg-b9b1637d326c = Bandbegränsade slutna uttryck för valfri avståndsmätningssignal: effekt i bandet och jitter vid kodföljning med tidig-sen-detektor mot publicerade värden, med Gabor-bandbredden och den spektrala separationen vid offset korskontrollerade

seg-6cfdc433b120 = navsignal: sinusintegralen (sine_integral), BPSK-R-andelen av effekten inom ett dubbelsidigt band på sluten form (bpsk_power_in_band_closed_form), den bandbegränsade Gabor-bandbredden för BPSK på sluten form (bpsk_gabor_bandwidth_closed_form_hz), det bandbegränsade jittret för en koherent och en icke-koherent tidig-sen-kodföljningsslinga (DLL) för valfritt spektrum med enhetsarea enligt Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) och dess gräns för försvinnande avstånd enligt Gabor (dll_jitter_small_spacing_limit_s), den spektrala separationskoefficienten för BPSK vid offset på sluten form (bpsk_offset_ssc_closed_form), spektrumet för Galileo E5 AltBOC({ "15,10" }) (altboc_15_10_psd) och en parser för modulationsbeteckningar (parse_modulation); används av typen <c1/> för varje signalutformning

seg-15d8c44be46f = Externt fastlåst: { "90.3" } procent av effekten i huvudloben, det koherenta tidig-sen-jittret vid den angivna arbetspunkten, tabellvärdena för sinusintegralen och BPSK:s egen spektrala separationskoefficient 2/({ "3" } R_c) vid noll offset. Endast interna korskontroller, inte extern validering: det slutna uttrycket för den bandbegränsade Gabor-bandbredden för BPSK och dess asymptot, och den spektrala separationskoefficienten för BPSK vid offset skilda från noll, båda härledda här och kontrollerade mot kvadratur. Publicerade slutna uttryck: BPSK-R:s sinc-kvadratspektrum och dess { "90" } procent av effekten i huvudloben (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed.); det koherenta jittret vid tidig-sen-kodföljning sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, section { "8" }) och den bandbegränsade generaliseringen med dess Gabor-bandbreddsgräns (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); sinusintegraltabellerna av Abramowitz & Stegun (Table { "5.1" }); den spektrala separationskoefficienten som Fouriertransformen av den kvadrerade autokorrelationen (Betz { "2001" }). AltBOC-spektrumet kontrolleras endast för enhetsarea och lobernas läge (uttrycket i Galileo Open Service Signal-in-Space Interface Control Document integrerar till { "8" } och divideras med det).

seg-def449efa852 = Maximal Doppler för en navigationssatellit i låg jordbana, som dimensionerar inhämtningssökningen

seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: den största Dopplern hos satelliten vid en passage rakt ovanför vid elevationsmasken för en cirkulär bana, v R_E cos(el) / (R_E + h) gånger f / c, utifrån varje förinställnings egen bärvåg och banhöjd; typen <c1/> lägger till oscillator- och användartermer och gör om den till Doppler-bin

seg-c26e0c7c6821 = Publicerade värden: Xona Pulsar X1 maximal Doppler { "32" } till { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, https://arxiv.org/abs/2509.19551); Iridium Doppler upp till +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Jordens rotation utelämnas, vilket flyttar värdet med upp till cirka { "2.3" } kHz; båda publicerade värdena nås utan den.

seg-652e28dfa10f = Signalutformningar för positionering, navigering och tidssynkronisering i låg jordbana: kodföljning, inhämtning, GNSS-kompatibilitet och en bandavvägning för valfritt system

seg-c0ba5c7e708e = Typen <c1/>: parametriserade signalutformningar (band, sändningsbandbredd, ITU-tilldelning; komponenter för inhämtning, data och pilot med BPSK(n), BOC(m,n), MBOC eller platta spektra, effektandelar, FDMA-underbärvågor, kodlängder och datatakter) ur inkompilerade publika förinställningsfiler (Xona Pulsar, Iridium STL, Starlink som opportunistisk signal, CentiSpace, en generisk C-bandsutformning och generiska utformningar för UHF/L/S/C/brett C, var och en med sin käll-URL och opublicerade värden märkta REPRESENTATIVE) eller skrivna direkt i scenariot; per signal den bandbegränsade effektspektraltätheten, effektandelar i bandet, Gabor-bandbredd, kodjitter mot C/N0 och avstånd samt avståndsnoggrannheten, inhämtningens sökrymd, detektionssannolikhet med kvadratisk lag och genomsnittlig seriell och kodparallell inhämtningstid, den spektrala separationskoefficienten in i och från GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b och AltBOC med försämringen av C/N0, samt toleransen för J/S mot CW, bredband och matchat brus ur SSC-kedjan i spektrumtypen; en bandavvägning mellan jonosfärsfördröjning, fritt rumsdämpning, avståndsnoggrannhet vid lika C/N0 och lika EIRP samt jammertolerans; och kvalitativa formkontroller av en utformning mot en beskriven mätning

seg-040b3f5cc70e = De kontrollerade slutna uttrycken i de två raderna ovan, falsklarmsidentiteten för kvadratisk lag P_d(snr = { "0" }) = P_fa och Holmes genomsnittliga inhämtningstid, och reduktion till spektrumtypens egen SSC-kedja (samma kod Jammer::ssc). Själva utformningarna är indata: förinställningar märkta REPRESENTATIVE eller WORKSHOP är inte publicerade specifikationer, förbättrad Feher-QPSK, kodskiftnyckling och OFDM-spektra är approximerade, och formkontrollerna jämför former, inte kalibrerade nivåer.

seg-c2b9c8e4a364 = Vattenfall över spektrum med flera band (UHF, L, S, C) med utformade signaler och jammers per band

seg-609df4e0a085 = Typen <c1/> utvidgad bortom L-bandet: band angivna som en förinställd signalutformning (ritad med varje komponent, bandbegränsad till sändningsbandbredden, C/N0 och J/S hänförda till den följda komponenten) eller som en egen bärvåg och modulation; extra vattenfallspaneler över valfritt frekvensområde på samma tidslinje och färgskala; en bredbandig (spärr)jammer vid sidan av CW, smalband, chirp och matchat brus; J/S och effektiv C/N0 per band ur den oförändrade kedjan för spektral separationskoefficient

seg-a3b398f66ad3 = Reduktion till den befintliga spektrumkedjan och anti-jam-ekvationen i jamming-typen (ett band med en komponent ger samma tal som före utvidgningen) och signalspektra i de kontrollerade raderna. Jammereffekter, tidslinje, frontändens bandbredder och de utformade signalerna är indata, och en utformad signal trunkeras vid sitt sändningsband (ingen emission utanför bandet).

seg-f92d6cbc58d4 = Koefficienter för specifik regndämpning för varje band som en LEO-PNT-länk använder

seg-96b6a118d374 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 ekvationerna ({ "1" }) till ({ "5" }): k_H, alpha_H, k_V, alpha_V ur kurvanpassningarna i Tables { "1" } till { "4" }, de väg- och polarisationsberoende (k, alpha) och den specifika dämpningen k R^alpha; används av regntermen i typen <c1/>

seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) Table { "5" }, rekommendationens egna tabellerade k_H, alpha_H, k_V, alpha_V, incheckade i tests/fixtures/leo_link/p838_3_table5.csv med PDF-URL och hämtningsdatum. Tabellen är avrundad till sina tryckta siffror, så tröskeln är den avrundningen

seg-f4a311f936de = Långsiktig regndämpning längs snedväg på en länk mellan jord och rymd

seg-2b2dba8bf5a7 = ITU-R P.618-14 section { "2.2.1.1" } steps { "2" } till { "10" } (sned och horisontell väg under regnhöjden, horisontell reduktion och vertikala justeringsfaktorer, A0.01 och dess skalning till { "0.001" } % till { "5" } % av ett genomsnittligt år), med regnhöjden (P.839) och R0.01 (P.837) som indata eftersom motorn inte bär någon av de digitala kartorna; tillämpad per band och epok av typen <c1/>

seg-325d1bb9c26d = ITU-R Study Group { "3" } valideringsexempelfil CG-3M3J-13-ValEx-Rev8.3.0 för P.618-14, så som den tabelleras av valideringssidorna i ITU-Rpy, med varje platss regnhöjd enligt P.839-4 ur samma exempel; incheckad i tests/fixtures/leo_link/p618_14_rain_attenuation.csv med URL:erna och hämtningsdatum. Kontrollerar proceduren givet h_R och R0.01, inte kartorna

seg-6b51ec84bdce = Troposfärisk amplitudscintillation på en länk mellan jord och rymd

seg-869894dec004 = ITU-R P.618-14 section { "2.4.1" } steps { "3" } till { "9" } (referens-sigma ur N_wet, effektiv väglängd, antennens medelvärdesfaktor, fädningsdjup för { "0.01" } % till { "50" } % av tiden), med N_wet som indata eller beräknad ur temperatur, fuktighet och tryck med uttrycken i ITU-R P.453-14; under { "4" } GHz markerar typen <c1/> värdet som en extrapolering

seg-7fc4a1e7960a = ITU-R Study Group { "3" } valideringsexempel (CG-3M3J-13-ValEx-Rev8.3.0) för scintillationen i P.618-14, med varje platss N_wet enligt P.453-14 ur samma exempel; incheckade i tests/fixtures/leo_link/p618_14_scintillation.csv med URL:erna och hämtningsdatum. Uttrycket för våt refraktivitet ur temperatur och fuktighet täcks inte av den här raden

seg-e0d40cf4ea79 = Byggnadsinträngningsförlust för en LEO-PNT-användare inomhus

seg-4f06274e38ec = ITU-R P.2109-2 Annex { "1" } ekvationerna ({ "1" }) till ({ "10" }) med Table { "1" }: den förlust som inte överskrids med sannolikheten P för traditionella och värmeeffektiva byggnader vid vägens elevation vid fasaden, { "80" } MHz till { "100" } GHz; tillämpad per band och epok på en användare inomhus av typen <c1/> (UHF-fallet inomhus)

seg-99c648f9c6eb = Värdena i ITU-R Study Group { "3" } arbetsbok för validering av Clutter och BEL, så som de är avskrivna i valideringsskriptet för referensimplementationen i MATLAB (github.com/eeveetza/p2109), incheckade i tests/fixtures/leo_link/p2109_bel.csv med URL och hämtningsdatum. Arbetsboken skriver ut tre decimaler

seg-8c5e291c8ff8 = Förstaordningens jonosfärsfördröjning per band, den jonosfärsfria kombinationen och fritt rumsdämpning

seg-89df726127f9 = Gruppfördröjning { "40.3" } STEC/f^{ "2" } per band; de jonosfärsfria koefficienterna f1^2/(f1^{ "2" } - f2^{ "2" }) och -f2^2/(f1^{ "2" } - f2^{ "2" }) och brusförstärkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) för valfritt bandpar; fritt rumsdämpning { "20" } log10({ "4" } pi R f/c) enligt linkbudget::free_space_loss_db i dess form för kilometer och megahertz

seg-9bf00f744174 = IS-GPS-200 section { "20.3.3.3.3.2" }, som anger förhållandet för gruppfördröjning mellan L1/L2 gamma = (77/60)^{ "2" } som följer av förstaordningens skalning med 1/f^{ "2" }, och Friis överföringsformel (Proc. IRE, { "1946" }). Kontrollerar skalningslagarna, inte en sned TEC

seg-c584a867fcda = Maximal Doppler som en stillastående användare ser från en LEO- eller MEO-bana

seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: en sökning över varje banposition och varje användare på satellitens horisont för en cirkulär bana, med jordens rotation, efter den största avståndshastigheten, plus banhastigheten och den största jordfasta satellithastigheten; rapporteras per band som Doppler-omslutningen av typen <c1/> och används som sökfönster vid kallstart i dess lågenergimodell

seg-4abd3afebad2 = Leclere, Marathe and Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Table { "1" } (stillastående mottagare på en sfär med { "6371" } km, jordens rotation den enda andra effekten): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz på L1. Täcker cirkulära tvåkroppsbanor

seg-d9eb3e7e69c2 = En LEO-PNT-passage och dess länkbudget per band mot de MEO-GNSS-satelliter som är i sikte

seg-d986e44443dd = Typen <c1/>: satelliter ur en utformad passage, element, en TLE via SGP4 eller en Walker-konstellation från constellation-design; per band och epok blickvinklarna, avståndet, avståndshastigheten och avståndsaccelerationen på sluten form (kontrollerade vid varje körning mot centrala differenser och rapporterade), fritt rumsdämpning, EIRP med ett isoflux-, gaussiskt eller platt mönster, en patch-, halvsfärisk eller isotrop användarantenn, gasdämpning enligt ITU-R P.676-10 Annex { "2" }, regn och scintillation enligt P.618, byggnadsinträngningsförlust enligt P.2109, polarisationsfel, systembrustemperatur, C/N0, Doppler och Dopplers ändringstakt, och förstaordningens fördröjning ur en sned TEC enligt Klobuchar eller vertikal TEC skalad med Chapman-andelen under satelliten; jonosfärsfria par med kodbrus vid passagens topp; Galileo- eller GPS-bärvågor ur sina mottagna effekter enligt gränssnittsdokumenten genom samma mottagare

seg-c558a6519038 = Slutna uttryck och självkonsistens: identiteterna för avståndshastighet och avståndsacceleration mot numeriska derivator, att isoflux-förstärkningen tar ut tillväxten i avstånd, läroboksgränserna för polarisationsförlust, den kvalitativa observationen LEO mot GNSS (en klockformad passage på minuter som toppar flera dB över de platta GNSS-bärvågorna på 44-51 dB-Hz). EIRP och mönster är publicerade mottagna effekter omvandlade till en EIRP eller representativa val, gastermen är den ersatta förenklade metoden i P.676-10, och ingenting jämförs med en uppmätt C/N0 i LEO

seg-95a077a980b6 = Namngivna förinställningar för LEO-PNT-system med angivna källor, och en systemoberoende motor

seg-4b47033cda24 = leo_link::presets: generiskt flerbandssystem (UHF, L, S, C), generiskt C-band, Xona Pulsar X1/X5, Iridium STL, Starlink som en opportunistisk signal med enbart Doppler, CentiSpace och en valfri förinställning Celeste IOD, var och en med sin källa märkt PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP, där workshopförinställningen ligger i den valfria förinställningsfilen för Celeste IOD och endast kompileras in om den filen finns; varje band och varje bana kan åsidosättas i ett scenario, och ett scenario får inte namnge någon förinställning alls

seg-399dc53ceafb = Avskrift av de angivna publika värdena och en konsistenskontroll: en EIRP som sätts ur en publicerad lägsta mottagen effekt förutsäger den publicerade högsta inom { "0.5" } dB med ett platt mönster. Det är en kontroll av avståndsspridningen, inte en validering av någon satellits antenn; representativa förinställningar gör inget påstående om ett verkligt system

seg-a39f34973373 = Positionsbestämning med låg energi: tid till första positionsbestämning och energi per positionsbestämning mot arbetscykel

seg-f3b9b669a76f = leo_link::energy och avsnittet [iot] i typen <c1/>: koherent integrering begränsad av Dopplers ändringstakt, icke-koherenta summor med kvadratisk lag till ett detektionströskelvärde, en Doppler-binsökning över banans omslutning för stillastående användare (kall) eller ett stött fönster (varm), parallell eller seriell kodsökning, navigationsmeddelandets tid vid kallstart, energi per positionsbestämning och batteritid över intervall mellan positionsbestämningar, för varje LEO-band och GNSS-signalen

seg-a5fa1ef1be9b = Intern konsistens hos en angiven utformningsmodell: varje effekt, tröskel och sökval är indata, och modellen bortser från tvetydighet vid bitkanter, missad detektion och ny inhämtning. Inte jämförd med en uppmätt mottagare

seg-7e94f8b38cff = Globalt genomsnittliga vikter för avståndsfel i signalen i rymden för valfri banhöjd

seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: den radiella vikten w_R och den kvadrerade transversella vikten w_AC^{ "2" } som medelvärden av cos^{ "2" } och en halv sin^{ "2" } av siktlinjens nadirvinkel över användare likformigt fördelade på den synliga jordkalotten ovanför en elevationsmask, för valfri banradie, med Simpson-integration; används av varje SISRE-värde i leo-navmsg (vid { "510" } km w_R { "0.46" } och w_AC^{ "2" } 1/2.5)

seg-b9b5fe9d3b25 = Den publicerade tabellen över SISRE-viktfaktorer av Montenbruck, Steigenberger och Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } och 1/49, GLONASS { "0.98" } och 1/45, Galileo { "0.98" } och 1/61, BeiDou MEO { "0.98" } och 1/54, BeiDou IGSO/GEO { "0.99" } och 1/126. Samma medelvärde utvärderat vid LEO-radier ger LEO-vikterna; ingen publicerad LEO-tabell är fastlåst, så LEO-värdena är den kontrollerade metoden tillämpad, inte separat kontrollerade

seg-3cbb8b6afe3c = Användaralgoritmen för sänd efemerid enligt Galileo ICD som bas för ett navigationsmeddelande i LEO

seg-88efbce1f836 = leo_navmsg::elements::kepler_point: den keplerska utvärderingen enligt Galileo OS SIS ICD (Keplers ekvation, korrektioner av andra harmoniken, jordfast nod) skriven separat från motorns RINEX-utvärderare, som returnerar positionen med breddargumentet, inklinationen och noden som korrektionssystemet längs/tvärs/radiellt byggs på, och tilläggstermerna av Liu et al. { "2025" }

seg-6a90728fcea9 = RTKLIB 2.4.2-p13 eph2pos ECEF-positioner (en oberoende implementation av samma ICD-algoritm) för verkliga sända poster från BKG/IGS från 2024-09-10, båda incheckade med proveniens i tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Detta kontrollerar den keplerska användaralgoritmen; korrektionerna längs/tvärs/radiellt som läggs ovanpå täcks av sina egna rader, och Liu-termerna av raden för Liu et al. { "2025" } med 22 parametrar

seg-d65102fd4a1d = CRC-24Q-ramkontroll för navigationsmeddelandet i LEO

seg-aed568016867 = leo_navmsg::codec::crc24q: generatorpolynom 0x1864CFB, begynnelsevärde { "0" }, ingen reflektion, ingen slutlig XOR, kontrollen som Kshanas LEO-ram bär över varje föregående byte

seg-18c79d18e4e4 = CRC-katalogens kontrollvärde för dessa parametrar (reveng.sourceforge.io CRC catalogue, CRC-24/LTE-A: width { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), vilka är CRC-24Q-parametrarna i RTCM { "10403" } och Galileo OS SIS ICD, och exempelramen för meddelandetyp { "1005" } som är tryckt i RTCM { "10403" }

seg-82b9b0f7b07c = Anpassare av sänd efemerid i LEO och avståndsfel i signalen i rymden mot anpassningsintervall och uppdateringsperiod

seg-8c7065aa22bd = Anpassaren och avvägningen i typen <c1/>: en referensbana integrerad med zonal J2-J6 eller EGM2008-gravitation till vald grad och med luftmotstånd, och en fri eller styrd klocka med slumpfrö; en Levenberg-Marquardt-anpassning av Galileos keplerska uppsättning på icke-singulära element med svaga apriorivärden, sedan korrektionspolynom längs banan, tvärs banan och radiellt med linjär minsta kvadrat; klockpolynomet anpassat efter avdrag för användarens relativistiska term; SISRE (enbart bana och med klocka) över användningsperioder centrerade i sina anpassningsfönster, mot anpassningsintervall och uppdateringsperiod. Kontrollerad del: anpassningen med 16 parametrar och dess SISRE för enbart bana mot anpassningsintervall på verkliga precisa banor, och den integrerade referensbanan med J2-J6/EGM2008({ "20" }, { "70" })/luftmotstånd mot Orekit { "12.2" } inom { "4.6" } mm över { "6" } h (tröskel { "2" } cm, samma täthetsindata); korrektionspolynomen, klockanpassningen (fri eller styrd klocka med slumpfrö) och avvägningen för uppdateringsperioden förblir modellerade

seg-8121e7db3db3 = Uppdatering av LEO-navigationsmeddelandet mitt under passagen med en kontinuitetskontroll vid bytet

seg-34c310d85c42 = Analysen midpass-update i <c1/>: den högsta passagen över en användare inom ett sökspann, meddelanden enligt ett globalt schema med användningsperioder centrerade i sina anpassningsfönster, och vid varje byte hoppet i 3D-position, klockhoppet, hoppet i användarens pseudoavstånd, det största hoppet över varje synlig siktlinje (sluten form över nadirkonen), avståndsfelet före och efter, och PASS/FAIL mot ett tröskelvärde

seg-418f2cd21141 = Intern konsistens (hoppidentiteten och konbegränsningen mot provtagning med råstyrka). Tröskelvärdet är indata; inget publicerat kontinuitetskrav för LEO är fastlåst

seg-7635a8339e78 = Dokumenterad binär kodning av LEO-navigationsmeddelandet med en budget för kvantiseringsfel

seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshanas egen ram (preamble, version, modell, längd, nyttolast, CRC-24Q) för de fyra efemeridmodellerna, klockpolynomet, SVID, issue of data, band, hälsa, en Klobuchar-uppsättning, NeQuick-G-koefficienter och UTC-parametrar, varje fält med angiven bredd och steg (field_table), kvantisering med vägran utanför intervallet, och en budget för den största förändringen i position och klocka som en förändring med ett halvt steg i varje fält ger över giltighetsfönstret

seg-4261a9fac5d9 = Identiteter för rundtur och själva budgeten. Formatet är Kshanas eget, modellerat efter de publicerade meddelandekomponenterna och Galileos ICD-fältuppsättning; det är inte bitlayouten för Celeste eller något annat system (ingen är publik), så det finns ingen extern layout att kontrollera mot

seg-17ca41d7fd71 = Exporter av LEO-navigationsmeddelanden i RINEX-4-stil och som CSV

seg-185e12ccef0d = leo_navmsg::text: ett block i RINEX-4-stil (> EPH-posthuvud, rad för satellit och epok med tre klocktermer, D19.12-rader för sänd bana) med systembokstaven L och posttyperna KP16, KRAC, LU22 och APOL, märkt i varje huvud som ett Kshana-tillägg som inte är en del av RINEX { "4.02" }, och en CSV-tabell med ett standardkolumnschema och förinställda scheman, var och en med en importerare

seg-5cc5b6382437 = Rundturer och kalenderaritmetiken. RINEX { "4.02" } definierar inga navigationsposter för LEO (IGS RINEX { "4.02" }), så layouten är ett dokumenterat tillägg med arXiv { "2401.17767" } angiven som tidigare arbete; ingen extern läsare av den finns att kontrollera mot

seg-ff15935ba1b3 = Liu et al. { "2025" } efemeridmodell för LEO med 22 parametrar och dess anpassning på verkliga precisa banor

seg-6af1b6f3bbd4 = varianten Liu22 av leo_navmsg::elements::EphemerisModel, utvärderad av kepler_point med Liu22Extra: uppsättningen med 16 parametrar plus en hastighet för halva storaxeln a_dot, en hastighet för medelrörelsen n_dot som ingår som n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk, avskriven ur artikelns Eq. { "1" } (anpassningsjämförelsen beror inte på denna skalkonvention, så betydelsen av ett sänt nDot-värde är inte kontrollerad här), och radieharmonikerna Crs1, Crc1, Crs3, Crc3 en och tre gånger per varv på det okorrigerade breddargumentet. Dess anpassning med leo_navmsg::fit::fit_message tar artikelns Section { "2.3" } start och estimator (varje korrektion startar på noll; vanlig minsta kvadrat utan apriorivärden; artikelns tak på 100 iterationer), men stannar enligt Kshanas regel för parameterkonvergens (varje steg under { "1e-3" } av sin formella sigma) i stället för artikelns regel om en RMS-ändring under { "0.1" } mm. Anpassad över bågar om { "20" } och { "30" } minuter av en tabellerad precis bana

seg-e79047fc95af = ATOMIC:s ECEF-polynom utan klocka och den syntetiska modelljämförelsen för LEO på fem höjder

seg-e261843e35b1 = varianten EcefPoly av leo_navmsg::elements::EphemerisModel: ett ECEF-polynom per axel utan klocktermer, den relativistiska termen ur -2 r.v/c^{ "2" }, poängsatt mot en styrd klocka. Även modelljämförelseanalysen (liu_comparison över LIU2025_TABLE), som anpassar modellen med 22 parametrar vid artikelns fem höjder över bågar om 20 minuter av en bana integrerad av Kshana och skriver ut resultatet bredvid den publicerade SISRE

seg-a3b92fdcc591 = Fakta om ATOMIC-modellen ur InsideGNSS (polynom av 6:e ordningen, ungefär en minuts giltighet, uppdatering var { "30" } s, klocka styrd, { "24" } cm klockfel). Det är beskrivande fakta utan publicerade tal att jämföra mot. Tabellen för fem höjder skriver ut SISRE enligt Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } och { "0.75" } cm vid { "320" }, { "475" }, { "786" }, { "966" } och { "1336" } km över en båge om 20 minuter) bredvid Kshanas anpassning på sin egen integrerade bana ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } och { "0.51" } cm; kvoter { "0.46" } till { "0.77" }), inte fastlåst, eftersom artikeln anpassade verkliga precisa banor och referenserna skiljer sig. Modellen med 22 parametrar och dess anpassning är i sig kontrollerade mot verkliga banor i raden Liu et al. { "2025" } efemeridmodell för LEO med 22 parametrar och dess anpassning på verkliga precisa banor. Revision { "0.30" }: tabellens värden flyttades med anpassningen enligt artikelns konvention (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

seg-7a9fca5166d4 = Tjänster för jonosfär med en frekvens och UTC i ett navigationsmeddelande för LEO

seg-bc73bfeca68e = leo_navmsg::services: den sända Klobuchar-fördröjningen vid valfri bärvåg (motorns L1-modell skalad med (f_L1/f)^{ "2" }), den effektiva joniseringsnivån Az = ai0 + ai1 mu + ai2 mu^{ "2" } enligt NeQuick-G med reglerna för alla noll och [{ "0" }, { "400" }] sfu, och systemtid till UTC med ICD:ns tre skottsekundsfall

seg-0af8030f4d21 = Doppler som en markmottagare måste hantera från en navigationssatellit i LEO

seg-9714103964d6 = Exakt avståndshastighet för en satellit vars jordfasta position och hastighet kommer från en tvåkroppsbana med den sekulära J2-driften och jordens rotation (leo_fusion::geom::EarthOrbit::state, hastigheten den exakta tidsderivatan av positionen), omräknad till Doppler vid en bärvåg; den största absoluta Dopplern, Dopplers ändringstakt och jerk ovanför en elevationsmask över ett fönster (leo_fusion::doppler::doppler_envelope), rapporterad per LEO-system av typen <c1/> i doppler-läge

seg-ebf6cee8ec4c = Publicerade värden återgivna ur den angivna banan och bärvågen: Iridium Doppler upp till plus eller minus { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) och Xona Pulsar X1 maximal Doppler { "32" } till { "34" } kHz (Leclère, Marathe and Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). Värdet för Iridium är en avrundad övre gräns, därav tröskeln på { "5" }%. Dopplers ändringstakt och jerk rapporteras men är inte kontrollerade: den modellerade jerken vid en passage rakt ovanför för Pulsar X1 är cirka { "1.0" } Hz/s^{ "2" } mot det publicerade { "1.26" }

seg-d2e18c8bdc14 = Positionsbestämning ur LEO-Doppler, med en och flera satelliter, med tillstånd för klockdrift och hastighet

seg-de6cb3c06490 = Gauss-Newton-positionsbestämning i batch ur avståndshastighet med analytiska partialer (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), en konstant användarhastighet som tillval, en höjdspseudomätning för en användare på ytan, dämpade steg; den formella kovariansen vid referensen; projektioner längs banan, tvärs banan och vertikalt; noggrannheten för en enskild passage mot användarens förskjutning tvärs banan; tiden för närmaste passage. Läget doppler i typen <c1/> lägger till felet mot fönsterlängd och ett läge med enbart Doppler för opportunistiska signaler (förinställningen starlink-sop)

seg-84e2eb636579 = Intern konsistens: återvinning utan brus, den kinematiska identiteten rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho deriverad numeriskt, noll Doppler vid närmaste passage, spegellösningen för en enskild passage, och slumpmässiga fel mot den formella kovariansen. Värdet för Starlink av Kozhaya, Saroufim och Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: cirka { "2" } m på { "20" } s med tre satelliter) är endast en jämförelse: den modellerade mottagaren, med en perfekt efemerid och varje fel samlat i en Doppler-sigma på { "30" } Hz, är flera gånger mindre noggrann över samma fönster, och artikelns mottagare och mätfrekvens återges inte

seg-7f462969d2d4 = Gemensam positionsbestämning med pseudoavstånd från GNSS och LEO med biaser mellan system och felmodeller per signal

seg-b9b5298e3408 = Viktade Gauss-Newton-positionsbestämningar med minsta kvadrat över valfri blandning av system, en mottagarklocka per system (biasen mellan systemen skattas tillsammans med positionen) eller en känd sänd offset på referenstidsskalan; sigma per mätning levereras av anroparen, som standard motorns termiska brus för kodföljningsslingan (navsignal::dll_code_jitter_chips) vid C/N0 för elevationen, kombinerat med avståndsfelet i signalen i rymden; ovägd DOP (GDOP, PDOP, HDOP, VDOP, TDOP) i det lokala geodetiska systemet, formella sigma för öst-nord-upp och sigma för biaserna; det gemensamma läget i <c1/> jämför positionsbestämningar med enbart GNSS, enbart LEO och fusionerade, och sveper DOP mot antalet LEO-satelliter som läggs till

seg-ee9a4a0cb530 = Konvergens vid precis punktpositionering med enbart GNSS och med LEO-förstärkning

seg-a54f36c27d90 = Ett utvidgat Kalmanfilter för PPP med flyttalsosäkerhet på jonosfärsfri kod och fas: statiska koordinater, en vit mottagarklocka, en bias mellan system per extra system, en slumpvandrande zenitfördröjning från våt atmosfär avbildad med 1/sin(elevation), en flyttalsosäkerhet per satellitbåge som läggs till vid uppgång och tas bort vid nedgång, och det precisa fel i bana och klocka som är gemensamt för en satellits kod och fas, behandlat som en korrelerad uppdatering med två rader i en Joseph-stabiliserad form; mätningar simulerade ur samma modell; konvergenstid (fel under trösklarna till körningens slut), felkurvor och positionens NEES medelvärdesbildat över körningen för enbart GNSS och varje LEO-fall, körd som typen <c1/>

seg-be4593802ccf = Chi-kvadrattestet för NEES är en intern konsistenskontroll (referens och filter delar modellen). Trenden jämförs med Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min förkortat till { "7.0" }, { "3.2" }, { "2.1" } och { "1.3" } min med { "60" }, { "96" }, { "192" } och { "288" } LEO-satelliter. Det medföljande scenariot ger { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } och { "2.3" } min med sina egna representativa skal om { "1000" } km och { "60" } deg, brus och stationer; artikelns konstellationer, brus och definition av konvergens återges inte, så detta är en MODELLED konsistens i trenden (monoton förkortning, den största konstellationen under en tredjedel av tiden med enbart GNSS), inte en validering

seg-8ef013b46d0f = Positioneringsnoggrannhet för 5G icke-terrestriska nät utifrån signalbandbredd

seg-12b1e4657370 = Cramér-Rao-gränsen för ankomsttid ur den effektiva (Gabor-)bandbredden i rot ur medelkvadrat, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), för ett platt OFDM-spektrum (beta = B/sqrt({ "12" })), ett bandbegränsat BPSK-spektrum (täljare på sluten form) eller valfritt spektrum med kvadratur, och på frekvensen hos en komplex ton, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); positionsbestämningar med ankomsttid i nedlänken med en okänd mottagarklocka och en positionsbestämning med Doppler från en enda satellit över en passage i 3GPP n256 MSS S-bandet, körda som typen <c1/>

seg-9306f1c06081 = LEO-assisterad tidsöverföring till UTC mot C/N0 och mottagarens oscillator

seg-c618feb01476 = Klockmätningar från varje LEO-satellit i sikte vid en känd position, kombinerade med inversvarians ur pseudoavståndets brusmodell, filtrerade av ett Kalmanfilter med två tillstånd (fas, frekvens) vars processbrus är oscillatorklassens vita frekvensbrus och frekvensbrus med slumpvandring (slot_timing::ClockNoise, clock_state::ClockClass; glidvariansen för holdover::coast_phase_variance), en klockreferens med slumpfrö ur samma nivåer, och uttrycket i IS-GPS-200 section { "20.3.3.5.2.4" } för systemtid till UTC med en osäkerhet i sänd offset tillagd som en bias per körning; läget timing i <c1/> sveper oscillatorer och förskjutningar i C/N0

seg-4a878bd4a90f = Intern konsistens: det publicerade offsetuttrycket utvärderat för hand, det normaliserade felet över { "40" } frön, och golvet som sätts av osäkerheten i offseten. NIST:s värde för Iridium-mottagare för tidssynkronisering med en miniatyratomklocka (under { "40" } ns från UTC(NIST) över { "40" } dygn) är endast en jämförelse; det medföljande Iridium-scenariot ger { "10" } till { "11" } ns RMS vid nominell effekt med sitt representativa avståndsfel på { "5" } m. Flickerfrekvensbrus och jonosfärsfördröjning simuleras inte

seg-cef79d82f0d4 = LEO-täckning och geometrisk försämring av precisionen för användare vid polerna och i Arktis mot MEO-GNSS

seg-462a5e95d480 = Satelliter i sikte och median för PDOP, HDOP och VDOP med tillgänglighet mot latitud, över samplade longituder och epoker, för enbart MEO-GNSS-systemen, enbart LEO-systemen och alla tillsammans, varje system med sin egen mask och klockmodell, körd som läget polar i <c1/>; banorna är elementuppsättningar för SGP4/SDP4 vid svepets epok (2026-01-01T00:{ "00" }:{ "00" } UTC i läget polar) förda till det jordfasta systemet på den kontrollerade vägen för jordbanor (IAU 2006/2000A, UT1 = UTC, ingen polarrörelse)

seg-d92777401093 = Namngivna LEO-PNT-system som valfria datainställningar, var och en med sin källa

seg-5130bfe2410c = Systemoberoende indata: varje system är Walker-skal, explicita element eller en GNSS-förinställning, en signal (bärvåg, chipptakt, bandbredd, mottagen effekt eller intervall för C/N0), en SISRE, en Doppler-sigma och en klockmodell; förinställningar fyller endast i det som ett scenario lämnar ute, en fil vardera med källor märkta PUBLIC (med URL), WORKSHOP eller HÄRLEDD och de opublicerade värdena förtecknade som representativa: Xona Pulsar X1/X5, Iridium STL, Starlink som opportunistiska signaler, CentiSpace, ett representativt system i C-bandet, efemeridmodellen ATOMIC utan klocka, och en förinställning härledd ur en workshop i den valfria förinställningsfilen för Celeste IOD, som hålls tillbaka genom att filen och dess scenarier raderas

seg-c6f71b3937cd = Avskrift av de angivna publika värdena, kontrollerad för struktur (varje publik källa har en URL, Walker-mönster delar jämnt, C/N0 ur mottagen effekt över kT vid { "290" } K), inte mot någon extern referens. Representativa värden namnges i varje förinställning och är illustrativa

seg-dec52b5b9cd6 = Ett LEO-PNT-system från början till slut: signalutformning, länkbudget för passagen, navigationsmeddelande och fusionerad positionsbestämning, där varje stegs utdata lämnas vidare till nästa

seg-39443b31d418 = Typen <c1/>: en utformning i leo-signal (publik förinställning eller direkt i scenariot) sätter centrum, bandbredd, chipptakt och EIRP-fördelning för ett band i leo-pass; passagen ger C/N0 för den följda komponenten och bandbegränsat kodjitter per epok; en linje enligt minsta kvadrat för C/N0 i sin(elevation), SISRE för meddelandet i leo-navmsg (anpassad vid passagesatellitens bana, plus en angiven term för banbestämning i kvadratisk summering) och utformningens bärvåg och chipptakt går till varje LEO-system i en gemensam positionsbestämning i leo-pvt och, som tillval, till LEO-fallen i leo-ppp; varje överlämning rapporteras med sitt värde och sin enhet

seg-854d3c1428d0 = Självkonsistens hos överlämningarna: varje värde som förs vidare är lika med det uppströms stegets egna utdata, och att ändra en uppströms indata flyttar varje nedströms värde som beror på den. Stegen behåller sina egna etiketter; kedjan tillför ingen fysik och ingen extern referens

seg-55ca63edff02 = Detektering av spoofing med LEO-Doppler och konsistens i passagegeometrin

seg-b12fc1728220 = Avsnittet <c2/> i typen <c1/>: en spoofer förfalskar, självkonsistent i avstånd och avståndshastighet, de signaler som syns vid en påstådd position som hoppar och/eller skjuts bort från den sanna efter en start (per LEO-band och för MEO-GNSS-signalen); mottagaren förutsäger varje avståndshastighet ur den sända banan och en oberoende apriori position och hastighet, och testar de uppmätta avståndshastigheterna med en generaliserad chi-kvadratstatistik enligt minsta kvadrat över ett fönster av epoker (klockdriften antingen en störparameter eller med en apriori), på GNSS-kanalerna, LEO-kanalerna och alla kanaler, med termiskt brus i frekvenslåsningsslingan (FLL) ur C/N0 (Kaplan & Hegarty { "2006" }, section { "5.6.2" }); detektionssannolikhet ur den icke-centrala chi-kvadratfördelningen vid en angiven falsklarmssannolikhet, detektion förklarad vid en angiven sannolikhet för missad detektion

seg-787c07c08c7f = Slutna uttryck och identiteter, inte en extern mätning: gradienten av avståndshastigheten mot en central differens, informationsformens statistik mot den täta kovariansformen, en ren klockdrift som ger noll, en push förklarad av aprioriinformationen som ger högst |dx|^2/sigma_p^{ "2" }, statistiken kvadratisk i ett hopp. Inget detektionsvärde jämförs med en uppmätt attack; spoofern är idealiserad (ingen signatur i effekt, ankomstvinkel eller korrelationstopp)

seg-5f341f85ac07 = Detektering av spoofing genom konsistens mellan band i en LEO-signal med flera band

seg-2f9c4d351b0f = För varje LEO-satellit och par av avståndsmätande band bildar avsnittet <c1/> den geometrifria pseudoavståndskombinationen, tar bort mottagarens jonosfärsmodell och testar dess steg från epok till epok mot de två bandens kodbrus och en angiven tolererad omodellerad jonosfärstakt (tvåsidigt gaussiskt, exakt detektionssannolikhet); en spoofer som förfalskar vissa band och inte andra, eller varje band utan jonosfären, syns vid sin start; en som förfalskar varje band och simulerar jonosfären syns inte, vilket resultatet anger

seg-87fd44fa1d94 = Identiteter: startsteget för en jonosfärsfri spoofer är lika med parets modellerade skillnad i jonosfärsfördröjning, tröskeln är den tvåsidiga normalkvantilen gånger stegets standardavvikelse plus takten som gräns. Mottagarens jonosfärsmodell är motorns, så den autentiska residualen är noll i medel per konstruktion; ingen extern referens

seg-97dbcd5f2728 = Jonosfärssondering: sned TEC ur dubbelbandsfördröjningen i en LEO-passage

seg-844de34fd2f3 = För varje bandpar hos en <c1/>-satellit anger rapporten det sneda totala elektroninnehåll som den geometrifria kodkombinationen återvinner vid passagens topp, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), och dess 1-sigma ur de två bandens termiska kodbrus, så att varje LEO-PNT-utformning med flera band kan vägas som en jonosfärssond

seg-0a63a69e181d = Datumkovarians för månsystemet med stationerna skattade, mot utökad precision med 50 siffror

seg-de2ee45f6527 = Datumkovariansen med sju parametrar enligt Helmert för scenariot lunar-frame-campaign med jordstationerna skattade (station { "1" } förankrad), så som lunar_frame_campaign beräknar den i binary64: den gemensamma Fisher-informationen för station och fyr ackumulerad ur fördröjningsjakobianen, stationsblocket marginaliserat med ett Schur-komplement genom en spektral Jacobi-invers, H = AᵀSA bildad med Helmert-designen och inverterad spektralt. Problemet är dåligt konditionerat per konstruktion (konditionstal för Helmert { "2.1e8" } till { "2.3e8" }, konditionstal för den gemensamma informationen { "1.6e12" } till { "3.0e13" }): en relativ ändring på { "1e-9" } i Schur-korrektionen flyttar datumsigmorna med upp till { "28" } %. Rapporteras: de sju datumsigmorna, konditionstalet för Helmert och den svagaste riktningen. PÅSTÅENDE, SNÄVAT: motorns datumsigma och konditionstal ligger inom det apriori värsta-fall-felgränsen för en bakåtstabil pipeline med dubbel precision på det här problemet; detta påstår inte att de är så noggranna som dubbel precision tillåter (en faktoriseringsväg är ungefär tusen gånger noggrannare på samma indata, och den valfria kvadratrotslösaren ungefär tio miljoner gånger), och den svagaste riktningen är kontrollerad endast där dess tröskel ligger under en rät vinkel (kontrollen med fasta stationer)

seg-71b463388e80 = Datumlösare med kvadratrotsinformation mot utökad precision med 50 siffror

seg-5ec3e3c2bf19 = En valfri lösare med kvadratrotsinformation (lunar-frame-campaign solver = "srif"; standard oförändrad) som aldrig bildar eller inverterar någon informationsmatris för datum: Householder-QR (ortogonal-triangulär uppdelning) av den blekta fördröjningsjakobianen som en mätuppdatering i ett filter med kvadratrotsinformation, jordstationerna marginaliserade genom det avslutande triangulära blocket (vars Gram-produkt är Schur-komplementet), en andra QR av R_bb A för Helmert-datum med sju parametrar, sigma som radnormerna av den triangulära inversen, och spektrumet (konditionstal, svagaste riktning) ur en ensidig Jacobi-singulärvärdesuppdelning. Skalärprodukter kompenseras med en felfri produkt med Dekker-delning, så varje operation är en korrekt avrundad grundoperation i IEEE-754 eller en kvadratrot; identiska resultat på varje plattform argumenteras ur detta, inte testade över plattformar

seg-433b52bf0ba2 = Förtroendeövervakare för sjöfart: aritmetiken de vilar på (NMEA-avkodning, geodetiska förskjutningar, de kinematiska statistikerna och sensorresidualstatistikerna)

seg-c61c575f9c38 = För ett fartyg avkodar <c1/> de NMEA { "0183" }-meningar som en mottagare och dess instrument sänder ut (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), bildar öst-nord-förskjutningen mellan positionsbestämningar (<c2/>) och utifrån dessa den statistik som övervakarna avgör på: den underförstådda hastigheten, residualen för dödräkning, den underförstådda accelerationen och den underförstådda svängtakten över fönster om { "30" } s, residualerna för kurs mot färdriktning, loggfart mot fart över grund och antennhöjd (medianer över { "10" } s), samt spridningen och ökningen av satelliternas signal-brusförhållande.

seg-32fcf6956dac = VAD SOM KONTROLLERAS EXTERNT, snävt angivet: ({ "1" }) avkodningen av varje fält som övervakarna läser, mot pynmea2 { "1.19.0" } (MIT) på { "8" } syntetiska loggar ({ "1,086" } epoker), till { "1e-9" } i fältets enhet (latitud och longitud, höjd, geoidseparation, HDOP, hastigheter, färdriktning, kurs, signal-brusförhållande; heltal och datum exakt; tid på dygnet till { "1e-6" } s), med största skillnader i nivå med sista siffran i en double; ({ "2" }) öst-nord-förskjutningen mellan två positionsbestämningar, som avstånd och bäring, mot WGS84-geodeten i geographiclib { "2.1" } (MIT) på { "223" } par av positionsbestämningar med baslinjer upp till { "2" } km, från -45 till { "70" } grader latitud och över antimeridianen, till { "0.01" } m och { "0.001" } grader (bäringen mot geodetens medelazimut, kordans riktning); ({ "3" }) övervakarnas indatastatistik vid { "341" } bedömda epoker av en syntetisk resa på { "400" } s med en sväng och ett positionssteg, mot omräkningar i Python som använder geographiclib för avstånd och azimut, pynmea2 för avkodning och numpy för medianer och standardavvikelser: underförstådd hastighet till { "0.005" } m/s, residual för dödräkning till { "0.02" } m, acceleration till { "5e-4" } m/s^{ "2" }, svängtakt till { "1e-3" } deg/s, residualmedianerna samt signal-brusspridningen och dess ökning till { "1e-6" }. VAD SOM INTE KONTROLLERAS: övervakarnas fönsterlängder, tillåtna marginaler och trösklar är projektets egna regler; Python-koden återger dem utifrån samma dokumentation, så överensstämmelsen styrker implementeringen av aritmetiken, inte reglerna. THS-meningen har ingen pynmea2-klass och ROT-meningen läses inte; ingen av dem täcks. Tabellen från en NMEA-talker och satellitnummer till ett satellit-id i RINEX-stil är projektets egen (endast numret, talkern och värdet jämförs). Indata för tidssteg, värdklocka och autentiseringsstatus har ingen oberoende referens. Alla data är syntetisk text från receiver_trust::synth; inget här är en mätning och inget påstående görs om hur någon övervakare presterar vid verklig störning. Bäring: jämförd med geodetens medelazimut. Den förhandsregistrerade jämförelsen mot framåtazimuten vid positionsbestämning { "1" } misslyckades vid { "0.001" } grader ({ "77" } av { "223" } par, sämsta { "8.3e-3" } grader) på grund av en definitionsmässig oförenlighet, inte aritmetik; ändringen gjordes efter den första körningen och båda resultaten är registrerade (jämförelsen med framåtazimut finns kvar i testet som en beskrivande gräns på { "0.01" } grader som inte förhandsregistrerats). Redovisat: de första körningarna visade indata som prövade för lite (acceleration och svängtakt klämdes till noll i varje epok, och antimeridianspåret korsade den aldrig), en bugg i den syntetiska generatorn (ingen längdgradsomslagning) och, för bäringen, att den registrerade referenskvantiteten (geodetens framåtazimut vid den första positionsbestämningen) skiljer sig från kordans riktning med ungefär hälften av meridiankonvergensen ({ "77" } av { "223" } par utanför { "0.001" } grader, sämsta { "8.3e-3" }); indata korrigerades och bäringen jämfördes mot medelazimuten med samma tolerans (ändringarna { "1" } till { "3" } i förhandsregistreringen, gjorda efter att resultaten setts och alltså inte blinda); jämförelserna av kurs och färdriktning gjordes cirkulära ({ "360" } och { "0" } grader är en och samma kurs, ändring { "5" }). Mutation: en skalning med { "1e-4" } av östförskjutningen får geodesijämförelsen att misslyckas.

seg-1fdbb476c8ab = Förtroendepoäng för sjöfart: sammanvägningen av övervakarnas evidens till en poäng på 0-100 och dess tre band

seg-0d76b33144f1 = Varje övervakare reducerar sin evidens till ett förhållande mellan statistik och tröskel; poängen är { "100" } minus summan över övervakarna av vikt gånger en begränsad linjär ramp av förhållandet ({ "0" } upp till { "0.5" }, { "1" } vid { "1.5" }), begränsad till { "0" } till { "100" } och avrundad till { "0.1" }, med band vid { "90" } och { "55" }; varje epok anger de övervakare som gjorde avdrag och deras poäng.

seg-b2d3c6d6ac36 = Implementering mot specifikation, INTE en extern oberoende referens: en clean-room-återimplementering i Python (scripts/maritime_score_cleanroom.py), skriven av en läsare som endast fått docs/RECEIVER-TRUST.md och docs/MARITIME-TRUST.md och inte Rust-källkoden, stämmer med score_from_ratios på { "600" } kvotvektorer (poäng, band, poäng per avdrag och avdragens ordning, skillnad { "0" }), efter att dokumentationen kompletterats där den första läsaren fann den tyst eller motsägelsefull (ordning vid lika, avrundning, kvoten för en övervakare som antingen klarar eller inte klarar, två exempel vars siffror inte stämde med formeln). Det visar att dokumentationen är tillräcklig och att koden gör det den säger. VAD SOM INTE KONTROLLERAS, och varför raden förblir MODELLED: själva regeln (vikterna, rampen, bandgränserna, evidenshållningen) är projektets egen, förhandsregistrerad men utan extern källa, och inget här visar att en poäng på { "80" } eller { "40" } betyder det en navigatör skulle vilja att den betyder vid verklig störning; inget tal av det slaget anges. Övervakarnas trösklar är likaså projektets egna (rad A kontrollerar bara deras aritmetik).

seg-f52fceaf06ca = Formatkontroll av NMEA { "0183" }-träningsströmmar och avkodade värden

seg-684f86418933 = Syntetiska NMEA { "0183" }-strömmar för bryggan, avsedda för besättningsträning (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW och PKSHT-markören, genererade från ett referensspår med modellerade effekter av mottagare, himmel, jamming och spoofing. Endast textutdata; ingenting sänds.

seg-4591ed75149c = VAD SOM KONTROLLERAS EXTERNT, snävt angivet: alla { "225,227" } meningar i åtta syntetiska träningsströmmar (fyra biblioteksscenarier, frön { "1" } och { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW och PKSHT-markören) tolkas i pynmea2 { "1.19.0" }, en oberoende NMEA-tolkare, med giltig kontrollsumma och förväntad talker och typ. Position, fart över grund, kurs över grund, färdriktning, UTC-tid och datum, positionsstatus och GGA-satellitantal som den avkodar är lika med generatorns referensspår inom toleranser som fastställdes före den första jämförelsen ({ "1.5e-6" } deg, { "0.06" } kn, { "0.07" } km/h, { "0.11" } deg kurs, { "0.5" } deg färdriktning, { "0.02" } s), körda av scripts/gen_nmea_training_ref.py med fixturen i tests/fixtures/nmea_training_ref/. Förväntningen på GGA-satellitantalet rättades efter den första körningen till NMEA-konventionen ({ "00" } utan positionsbestämning); numeriska toleranser oförändrade från förhandsregistreringens commit. VAD SOM INTE KONTROLLERAS: att någon mottagare, kartplotter eller brygg-system accepterar strömmarna; realismen i modellerna för mottagare, himmel, jamming eller spoofing (nominell himmel, modellerat brus, drag- och replay-profiler, alla MODELLED); HDOP, höjd samt DOP- och GSA/GSV-innehållet utöver syntax och antal; instruktörsloggen. Ingenting sänds, och ingen prestanda mot jamming eller spoofing görs gällande.

seg-1be1cfcb95c8 = Störningskarta: betydelsen av noggrannhetskoder, AIS-värden för ej tillgängligt, tilldelning av rutnätsceller, ruttlängd per cellstatus och maskning av inlandet

seg-71cff2a675e8 = Tolkningen av de koder för navigationsnoggrannhet och integritet i ADS-B som kartan använder (den EPU-gräns en NACp-kod står för, den inneslutningsradiegräns en NIC-kod står för, samt klasserna låg och god som metoden härleder från dem); de AIS-värden för position och fart som betyder ej tillgängligt och som AIS-läsaren kasserar; den fasta latitud/longitud-rutnätscell som en position faller i; ruttlängden och dess fördelning på cellstatus (degraded, not degraded, unassessed, not observed) som ruttexponeringen redovisar; och huruvida en position ligger inåt land från en landpolygon med mer än en buffert. En cell som flaggats som degraded eller anomalous är ett påstående om rapporterade noggrannhetsfält eller orimliga positioner, inte ett konstaterande av störning, och inget här kontrollerar det.

seg-beee15333c89 = VAD SOM KONTROLLERAS EXTERNT, snävt angivet: fem oberoende implementeringar läser samma syntetiska indata. ({ "1" }) pyModeS { "2.21" } avkodar syntetiska DF17-ramar för driftstatus och luftburen position; Kshanas NACp-EPU-gränser stämmer inom { "0.5" } m (största skillnad { "0.4" } m), dess NIC-inneslutningsgränser för koderna { "5" } till { "11" } stämmer inom { "1" } m, och dess klasser låg och god placerar alla { "12" } NACp-koder och varje NIC-kod som referensen producerar ({ "0" } till { "11" }) på samma sida av de trösklar som referensens gränser innebär ({ "0" } avvikelser). ({ "2" }) pyais { "3.3.0" } avkodar AIVDM-meningar av typ { "1" } vars nyttolastbitar skriptet packar från de råa ITU-R M.1371-fältvärdena; Kshana avvisar exakt de avkodade värdena för ej tillgänglig position (latitud { "91" }, longitud { "181" }) och fart ({ "102.3" } kn), och behåller { "0" } till { "102.2" } kn som avkodat ({ "0" } avvikelser över { "94" } ramar). ({ "3" }) shapely { "2.2.0" } covers() på cellpolygoner stämmer med grid::Grid::cell_of för { "1770" } punkter över cellstorlekarna { "0.5" }, { "0.25" }, { "1" } och { "0.07" } grader, inklusive punkter nära kanter, båda polerna och antimeridianen ({ "0" } avvikelser). ({ "4" }) shapely { "2.2.0" } skärning mellan rutt och cell med geodetiska WGS84-längder från GeographicLib { "2.1" } stämmer med ruttexponeringen på { "8" } syntetiska rutter, däribland två som korsar antimeridianen: total längd inom { "0.6" } % (största skillnad { "0.49" } %, sfären mot ellipsoiden) och varje cellstatus längd inom { "0.6" } % plus { "125" } m per del (största { "21" } % av den toleransen). ({ "5" }) shapely { "2.2.0" } contains() med pyproj azimutal ekvidistant avstånd till kustlinjen stämmer med inlandsmasken på { "2000" } m på { "992" } gittercentrumpunkter runt fyra syntetiska öar, varav en med en sjö ({ "0" } avvikelser; { "4" } punkter inom { "20" } m från bufferten uteslöts och räknades). Toleranserna fastställdes i tests/fixtures/interference_map_ref/PREREGISTRATION.md före varje jämförelse och ändrades inte efteråt; två fel i de syntetiska indata som den första körningen hittade är registrerade där. VAD SOM INTE KONTROLLERAS: Kshana avkodar inte råa Mode S-ramar eller AIVDM-meningar, så detta validerar tolkningen av redan avkodade värden, inte en avkodare. Referensens NIC-inneslutningsradier för koderna { "1" }, { "2" } och { "4" } skiljer sig från DO-260B ({ "20" }, { "8" } och { "2" } NM), så endast koderna { "5" } till { "11" } jämförs numeriskt. Regeln för positionen ({ "0" }, { "0" }), höjdgolvet, källtypsfiltret, hashningen av identifierare, metodens trösklar och statistik samt valet av cellstorlek är Kshanas egna och kontrolleras inte mot något. Ruttjämförelsen använder samma rätlinjiga definition av banan i latitud och longitud på båda sidor, så den kontrollerar längder och celltilldelning, inte att den banan är den rätta för ett fartyg eller ett flygplan. Inget här visar att en flaggad cell är störning. Indata är syntetiska; referensfixturerna skrivs av scripts/gen_interference_map_ref.py (pyModeS är GPL-3.0 och används endast i det offlineskriptet; CI behöver ingen Python).

seg-57ace69bdf1a = Trådformat för förtroendetelemetri: Prometheus-textexponering och OpenTelemetry OTLP/HTTP JSON

seg-654126a9d073 = GNSS-förtroende (poäng, band, orsaker, grind och, på begäran, position) som Prometheus-textexponering som serveras på /metrics och som OTLP/HTTP JSON-mätvärden, med ett tak för kardinaliteten hos orsaketiketter.

seg-b037c999443b = SIEM-händelser för förtroendetelemetri: Common Event Format (CEF) över syslog

seg-ffd8d7062055 = Händelser vid bandbyte (eller per epok) som Common Event Format-nyttolaster i ett RFC { "5424" }-kuvert över UDP eller TCP, med en dokumenterad fältmappning och CEF-escaping.

seg-51640405c9b7 = SIEM-händelser för förtroendetelemetri: Log Event Extended Format (LEEF) över syslog

seg-1b3245506847 = Händelser vid bandbyte (eller per epok) som Log Event Extended Format { "2.0" }-nyttolaster i ett RFC { "5424" }-kuvert över UDP eller TCP, med en dokumenterad fältmappning.

seg-563ccb0adbe5 = VAD SOM KONTROLLERAS: det här cratets egna tester med exakta strängar av den dokumenterade LEEF-fältmappningen och fälten i RFC { "5424" }-kuvertet; ingen underhållen LEEF-tolkare med öppen källkod finns (en sökning i Python-paketindexet hittade ingen), så formatet kontrolleras mot sin egen specifikation läst av samma författare, inte mot en extern oberoende referens. VAD SOM INTE KONTROLLERAS: huruvida LEEF-nyttolasterna accepteras av någon leverantörs tolkare eller SIEM; escapingreglerna utöver de dokumenterade; beteendet hos en verklig syslog-insamlare.

seg-96a95b89faa5 = Integritet hos bevispaket: signatur, hashkedja och verifieringsförfarande

seg-943a853d8a4a = Ett signerat, hashkedjat bevispaket för en GNSS-förtroendehändelse: SHA-256 över varje fil och en kedja över manifestet, en Ed25519-signatur över manifestets exakta byte, och en verifierare som namnger varje fel (en ändrad, borttagen, omdöpt, utbytt eller tillagd fil, ett omordnat eller redigerat manifest, ett manifest som hashats om utan nyckeln, ett omsignerat paket, en felaktig fastlåst nyckel samt ett tidsstämpelstoken som är borttaget, utbytt, skräp eller avser ett annat dokument).

seg-c15736afcbc9 = RFC { "3161" }-tidsstämpeltoken: verifiering av signatur och kedja

seg-cd64bbf39459 = evidence::tsa::verify_token, och tillvalet <c1/> för ett pakets timestamp.tsr: ett RFC { "3161" } TimeStampResp eller ett naket TimeStampToken (CMS SignedData över en TSTInfo) kontrollerat offline mot betrodda förankringar på det sätt som <c2/> kontrollerar det: de signerade attributens innehållstyp och meddelandesammandrag över TSTInfo; signaturen över de signerade attributen (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 och P-384; offentliga RSA-operationer på crypto-bigint); ESS signing-certificate v1 (SHA-1) eller v2-hashen som namnger signerarcertifikatet, funnet bland tokenets och anroparens obetrodda certifikat; signerarens kritiska, enda utökade nyckelanvändning timeStamping; kedjan till en betrodd självutfärdad förankring med varje certifikats signatur, CA-status och nyckelanvändning, och varje certifikat giltigt vid tokenets genTime; samt meddelandeavtrycket mot data. Kontrolleras inte: spärrning (CRL, OCSP), namn- och policybegränsningar, nonce

seg-c04042b0270a = Tröskelvärden för störning hos receiver-trust, kalibrerade på datamängden JammerTest { "2024" }

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: den förhandsregistrerade kalibreringen av övervakarna för C/N0-fall, AGC och jamming-indikator på den publika datamängden JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, hämtad vid körning, aldrig medföljande): per mapp en tidslinje på { "1" } s från mon_rf.csv och rinex.csv, övervakarna körs en gång, varje epok efter kalibreringen märks ren eller jamming utifrån mappens attack_log (förskjuten från CEST till UTC, { "60" } s skyddsmarginal), varje tröskel svepas över ett fast rutnät, den minsta tröskeln med en poolad falsklarmssannolikhet för rena epoker på högst { "0.01" } väljs, samt antal undanhållna epoker med utelämnande av en mapp i taget; en korskontroll av UBX-läsaren. Urvalet levereras endast som den valfria profilen [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); standardregeln och varje utdata utan den är oförändrade

seg-65a8361b4a22 = Jammertest-poängsättning: en mottagarlogg poängsatt per schemalagt test (detektionsfördröjning, missade larm, falsklarm, tid till återhämtning) mot den publicerade testplanen

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRA:s testkatalog och sändningsplan (MIT, hämtad med fastlåst SHA-256, aldrig medföljande) läses som schemalagd referens med katalog-id:n bevarade; en körning av receiver-trust poängsätts per test (första larm minus planerad start, detekterat/sent/missat mot en tolerans, tid till den första larmfria sträckan, larm utanför varje lucka och dess skyddsmarginal), med ett signerat bevispaket som bär resultatkortet. Schemat är planerade luckor, inte registrerade sändningstider.

seg-0d227bbcb5f1 = Testbänksexport (kshana bench-export): jordfasta och geodetiska kolumner, kolumner för lokal hastighet, kolumner för attityd och NMEA { "0183" }-utdata

seg-c6a6e08afadd = Rörelse-CSV:ns jordfasta position, geodetiska position, jordfasta hastighet, kolumner för färdriktning/stampning/rullning och UTC, samt NMEA GGA/RMC-meningarna, skrivna från syntetiska scenarier (gnss-ins inklusive automotive-urban-canyon, jamming, gnss-sim). Endast rörelse och händelser; ingen signal skrivs och ingen prestanda hos någon simulator eller mottagare görs gällande.

seg-f953ad11fe08 = VAD SOM KONTROLLERAS EXTERNT, snävt angivet: mot pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } och scipy { "1.18.1" }, körda av scripts/gen_testbench_ref.py på { "4" } syntetiska scenarier, med toleranser fastställda före den första jämförelsen (var och en skribentens sämsta avrundningsfall): de jordfasta kolumnerna är lika med WGS { "84" }-omvandlingen av de geodetiska kolumnerna (sämsta { "1.3e-4" } m, tröskel { "3e-4" }) och omvänt ({ "1.3e-9" } deg, tröskel { "2e-9" }; höjd { "1.3e-4" } m, tröskel { "3e-4" }) på varje rad; den jordfasta hastigheten roterad till nord-öst-ned med PROJ:s topocentriska operation är lika med motorns sanna NED-hastighet ({ "7.5e-5" } m/s, tröskel { "2e-4" }); färdriktning, stampning och rullning är lika med scipys yaw-pitch-roll av motorns sanna kvaternion ({ "5.0e-7" } deg, tröskel { "1e-6" }); varje NMEA-mening tolkas i pynmea2 med giltig kontrollsumma och dess avkodade position ({ "1.2e-3" } m, tröskel { "5e-3" }), höjd, fart, kurs ({ "5.0e-4" } deg, tröskel { "1e-3" }) och tid är lika med rörelsevärdena; UTC-kolumnen är lika med oberoende datum-tid-aritmetik. SHA-256 för de exakta CSV- och NMEA-byten som kontrollerats är fastlåst. VAD SOM INTE KONTROLLERAS: scenariots referensbana i sig (körprofilen och dess integrering); konventionerna (färdriktning är kroppens yaw, inte kursen, och skiljer sig från den med upp till cirka { "77" } grader på automotive-urban-canyon; GGA-kvalitet, satellitantal och HDOP är platshållare); huruvida någon laboratoriesimulator läser filerna som avsett; prestanda hos någon simulator eller mottagare. Referenserna kontrollerar omvandlingar och kodningar, inte scenariots fysik. Hanteringen av lokalt system kontrolleras endast genom hastighetsrotationen och NMEA-farten och -kursen (CSV:n har ingen kolumn för lokal position).

seg-ee99388f7b15 = compliance (kshana compliance-report): en mappning från Kshanas utdata till klausuler i offentliga ramverk enbart med nummer, ifylld från de angivna körningarna; ett resultat räknas för en förmåga först när det bär den evidens som mappningen anger, en tom mängd ger inget belägg, och formuleringen är "ger belägg för"; rapporten är inte ett konstaterande att något ramverk är uppfyllt och inte ett betyg eller ett godkännande av någon.

seg-8659260fd38e = Referenser kontrollerade mot ett skriptextraherat rubrikindex över de citerade offentliga dokumenten, lästa 2026-10-10 (tests/compliance_references.rs). VAD SOM KONTROLLERAS: { "49" } citerade referenser till klausuler, avsnitt, stycken eller rubriker finns i det citerade dokumentet, och { "7" } citerade URL:er gick att nå på det registrerade datumet ({ "2" } via en andra väg); negativa kontroller misslyckas. VAD SOM INTE KONTROLLERAS: att någon omskrivning, mappning eller lucka är korrekt; EN { "16803" }-klausuler (betalda, endast katalogtext); senare revisioner; indexet är inte en oberoende implementering.

seg-98c360d82d56 = Marina integrationer: Signal K-insticksmodul, OpenCPN-grindström och poängpanel, referensbygge

seg-7af9ce566646 = Förtroendepoängen, bandet, orsakerna, grindtillståndet och den av mottagaren rapporterade positionen publicerade under navigation.gnss.kshana i en Signal K-server med en notifiering för varning, larm och normal (integrations/signalk); den grindade NMEA-strömmen, med positionsbestämningen markerad ogiltig medan förtroendet är kollapsat och en PKSHT-mening per cykel, serverad till OpenCPN över TCP av själva grinden eller av ett litet relä, och en inbyggd OpenCPN-poängpanel som läser PKSHT-meningen (integrations/opencpn); samt systemd-enheter och en container som kör grinden (deploy/reference-build). Där de visar utdata bär de den rådgivande försäkran: Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering.

seg-00a0f52f7458 = VAD SOM KONTROLLERAS, snävt angivet: att dessa integrationer fungerar mot den verkliga programvara de är skrivna för. EVIDENS finns incheckad i integrations/signalk/evidence/README.md (med sina JSON-filer) och integrations/opencpn/evidence/README.md (med sina skärmbilder och loggar), var och en med skriptet som återskapar den. ({ "1" }) Signal K: insticksmodulen laddad i det fastlåsta npm-paketet signalk-server { "2.33.0" }, i ett privat nätverksnamnrymd enbart för loopback, matad med syntetiska data. Serverns egna REST- och WebSocket-gränssnitt visade de publicerade sökvägarna, poängmetadata och en notifiering som gick från frånvarande till warn, alarm, normal (efter hållningen) och warn igen när data upphörde. Med det verkliga kshana körd av insticksmodulen på den NMEA som servern själv tog emot gick notifieringen till warn och sedan alarm och den rapporterade positionen publicerades; serverns egen navigation.position skrevs av dess NMEA-leverantör, aldrig av insticksmodulen. Körd om mot levande JSON-schema { "1.2" }. ({ "2" }) OpenCPN: insticksmodulen byggd mot OpenCPN:s insticks-API-header och wxWidgets { "3.2.4" }, laddad i Ubuntu { "24.04" }-paketet av OpenCPN { "5.8.4" } under en virtuell skärm; OpenCPN laddade den, körde dess initiering och lämnade över PKSHT-meningarna i den grindade strömmen, och panelen blev röd i bandet för ej betrodd. I en ren körning slutade OpenCPN:s egen fartygsposition att uppdateras, och dess positionsindikator föll, när grinden markerade positionsbestämningen som ogiltig. En andra körning matad direkt av grindens TCP-lyssnare visade leverans till insticksmodulen men inte ett rent före-och-efter. ({ "3" }) Relätesterna spelar upp ett inspelat utdrag av den grindade strömmen genom ett verkligt TCP-uttag och kontrollerar vad en konsument tar emot (byten oförändrade, giltiga kontrollsummor på varje mening inklusive de omskrivna, GGA och RMC i överensstämmelse, en PKSHT per cykel med grindfältet där positionsbestämningen är ogiltig), och end-to-end-skriptet kontrollerar att en konsument av grindens lyssnare tar emot exakt de byte som samma grind skriver till standardutdata. ({ "4" }) PKSHT-tolkarna (JavaScript och C++) körs över meningar inspelade från kshana-utdata och avvisar en felaktig kontrollsumma, version eller en poäng utanför { "0" } till { "100" }. ({ "5" }) systemd-enheterna kontrolleras med systemd-analyze verify (systemd { "255" }, binärfiler ersatta med stubbar) och med skydd för ett skal i ExecStart, omstartspolicyn och sandlådenycklarna; containerns ingångspunkts hantering av argument kontrolleras med en stubbbinär. VAD SOM INTE KONTROLLERAS: det finns ingen extern oberoende referens för något värde som dessa integrationer visar. Förtroendevärdena själva är raderna ovan, och en integrationskörning visar bara att ledningarna bär dem; det är därför den här raden är MODELLED och inte VALIDATED (docs/VALIDATION.md). Inget verkligt fartyg, ingen verklig mottagare, ingen lång körning, ingen annan version av någon av värdarna, inget annat operativsystem eller skrivbord användes; alla data är syntetisk text och inget här är en mätning. Notifieringens ljud och visuella hantering i en verklig Signal K-klient, OpenCPN:s verktygsfältsknapp, inställningar och inaktuellt tillstånd samt paketering för OpenCPN:s insticksmodulshanterare prövades inte. Sandlådenycklarna i systemd kontrollerades endast för syntax, kördes inte under en levande systemd, och containeravbildningens bygge och dess hälsokontroll har ingen incheckad evidens här. Inget tal för detektion eller falsklarm görs gällande. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering.

seg-475397d05dd0 = <s1>receiver_trust (live: grinden, dess TCP-lyssnare, PKSHT); utanför craten: integrations/signalk (JavaScript), integrations/opencpn (JavaScript-relä, inbyggd C++-insticksmodul), deploy/reference-build (systemd-enheter, container)</s1>

seg-89ab9ef155eb = BOC({ "1,1" })-spårning: DLL-skalning och upplösning av bump-jump-osäkerhet (tillval)

seg-ef24be9b5917 = Fältet boc i iq::track::LoopConfig (tillval, None som standard): de tre DLL-diskriminatorerna omskalade för att läsa kodfelet i chips med enhetslutning på sinus-BOC({ "1,1" })-huvudtoppen, och en bump-jump-övervakare på mycket tidiga och mycket sena korrelatorer vid en halv subbärvågsperiod ({ "0.5" } chip) som hoppar kod-NCO:n mot huvudtoppen när en upp/ned-räknare når N ({ "8" } som standard). Utan tillvalet är varje utdata oförändrat.

seg-2c32955cbfb3 = IQ-kanal för jonosfärisk scintillation (Cornell-modellen) mot uppmätt { "50" } Hz GPS L1-scintillation

seg-2fdcb373ab25 = iq::channel::scint, Cornell-scintillationsmodellen (Rice-intensitet, andra ordningens Butterworth-spektrum, fas arg z) driven vid ett uppmätt fönsters S4 och intensitetens dekorrelationstid, jämförd på det den genererar utöver de två indata; realdata::scint50 läser den uppmätta loggen, trendrensar den och kör jämförelsen.

seg-160507ac3702 = Alternativ med cellmedelvärdesbildande CFAR vid IQ-acquisition

seg-7c0a1adc9ae6 = iq::acq::ca_cfar och ca_cfar_cells (tillval): en cell i ett acquisition-rutnät jämförs med medelvärdet av referensceller i sin Dopplerrad (skydds- och stegfördröjningar, som sluter sig runt perioden), vid en faktor alfa satt utifrån den slutna formen för falsklarmssannolikheten i CA-CFAR för M icke-koherenta block (ca_cfar_pfa, ca_cfar_alpha). Sampeleffektdetektorn förblir standard och varje befintligt utdata är oförändrat.

seg-5bd3bf0c22a7 = Spektrummodell: banden för GLONASS, BeiDou och Galileo E6 (tillval)

seg-9c16189c63ac = spectrum::default_band löser, enbart med namn (MORE_BAND_NAMES), GLONASS L1OF och L2OF på varje FDMA-kanal K = -7 till { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a och B3I (BPSK({ "10" })) samt Galileo E6 (BPSK({ "5" })), med bärvågor och lägsta mottagna effekter från deras gränssnittsspecifikationer; standardbanduppsättningen och varje befintligt utdata är oförändrade.

seg-63b7da996265 = Primära avståndskoder för BeiDou B1I mot en oberoende generator

seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits och b1i: Gold-koderna i BDS-SIS-ICD-B1I-3.0 trunkerade till { "2046" } chips, PRN { "1" } till { "63" }, så som IQ-lagret genererar, acquirerar och spårar dem.

seg-b4787b04338e = GPS L1C avstånds- och överläggskoder mot de tryckta kontrollkolumnerna i IS-GPS-800J

seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits och l1c_o_bits: Weil-avståndskoderna L1CP och L1CD (beräknad Legendre-sekvens, Weil-index, expansionssekvens insatt före chip p) och S1-överläggskoderna L1CO, PRN { "1" } till { "63" }.

seg-5cba09089e09 = Primära koder för LunaNet AFS-I och AFS-Q mot de tryckta kontrollkolumnerna i LSIS-AFS V1.0

seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits och afs_q_primary_bits (signalnamnen lunanet-afs-i och lunanet-afs-q i kshana iq): Gold-koden AFS-I ({ "2047" } kortcyklad till { "2046" }, G2 fördröjd per PRN) och den primära Weil-koden AFS-Q (beräknad Legendre-sekvens, Weil-index, expansionssekvens insatt före chip p), PRN { "1" } till { "210" }.

seg-7b1ae0c7ca28 = Tertiära koder och meddelandelager för LunaNet AFS (SB1 BCH, CRC-24Q, interfolierare) mot LSIS-AFS V1.0

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synkroniseringsmönster, SB1 BCH({ "51,8" })-kodare och avkodare med 256 hypoteser, CRC-24Q, blockinterfolieraren { "60" } x { "98" }, en symbolströmskontrollerare (kshana lunanet-afs-check) och en testströmsgenerator med platshållarunderramar. LDPC-kodningen med hastighet 1/2 för underramarna { "2" } till { "4" } är inte implementerad (dess matriser finns i en separat bilaga).

seg-0d7b17524c04 = Standardpaket: scenarier poängsatta mot trösklar angivna före körningen

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): testprofilerna för nivåerna { "1" } till { "4" } i DHS Resilient PNT-ramverket, noggrannhetsnivåerna och integritetsutvärderingen i IMO MSC.1/Circ.1575 samt övervaknings-, bedömnings- och begränsningspaketen i ICAO Doc { "9849" } Appendix F: varje test kör en medföljande scenariotyp och jämför resultatfält med trösklar angivna i paketet, och test som behöver en mottagarlogg listas som NEEDS INPUT och poängsätts inte.

seg-d9ea966abdd6 = Ingen extern oberoende referens för scenarioresultaten: varje pakettest kör en MODELLED scenariotyp. Trösklarna är paketförfattarens angivna profil (DHS-ramverket anger inga värden; IMO:s noggrannhetsgränser är Tabell C-1 i MSC.1/Circ.1575, läst i sin helhet; ICAO-paketet följer ICAO:s egen presentation av RFI Mitigation Plan eftersom Doc { "9849" } är en betalpublikation och inte lästes), incheckade före varje poängsatt körning i PREREGISTRATION.md-filer i xval-stil under standards/. En MET-tröskel säger att ett modellerat scenario uppfyllde en angiven tröskel, ingenting om en produkt

seg-8a8f2c85e0c3 = Bevispaket för laboratorieringlopp (scenario, testförhållanden, mottagarlogg, poäng)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) och exporten kshana.test-conditions/1 av mottagarloggar från kshana bench-export: ett signerat paket som registrerar scenariots hash, hashen för de angivna förhållandena, loggens hash och poängen mot de angivna händelserna, och som avvisar förhållanden som inte stämmer med poängsättningens händelser eller en logg vars hash inte är den angivna. Ingen signal skrivs, spelas upp eller schemaläggs.

seg-76da58fe670a = Ingen extern oberoende referens: paketet länkar hashar och en MODELLED poäng för mottagarloggen, kontrollerad på syntetiska data (den exporterade NMEA:n från ett medföljande scenario behandlad som mottagarens logg). Ingen laboratoriekörning görs gällande

seg-a9189e4fe413 = IQ-spårningsmotor mot GNSS-SDR { "0.0.19" } på oberoende inspelningar

seg-364de05e5b1b = Hela IQ-lagrets spårningsmotor (iq::track genom kshana iq track: acquisition-överlämning, korrelatorer, NCO:er, Costas-PLL av andra ordningen på { "15" } Hz, DLL av första ordningen på { "2" } Hz med bärvågsstöd och EML-envelopp, låsindikator och C/N0-skattare) på GPS L1 C/A vid { "30" } till { "45" } dB-Hz.

seg-259d201c2ff8 = CRPA-antennförstärkningar i jamming-typen mot en oberoende omräkning i numpy

seg-192144c57783 = Jamming-typens valfria [crpa]-sektion: en stråle per kanal mot varje satellit (nollstyrning med jammern som nollpunkt, eller MVDR på sigma^{ "2" } I + P_j a_j a_j^H), som skalar varje länks brus med ||w||^{ "2" } och jammern med |w^H a_j|^{ "2" } före den befintliga C/N0-ekvationen för anti-jam.

seg-a2f34cff9338 = Terrängskuggning av jammern i jamming-typen mot en oberoende omräkning i numpy på en verklig SRTM-ruta

seg-334c569d9cae = Jamming-typens valfria [terrain]-sektion: den storcirkelburna terrängprofilen mellan jammer och mottagare på en SRTM .hgt-ruta med en jordbuktning med k-faktor, den dominerande knivseggen (största Fresnel-Kirchhoff nu) och förlusten för en enda knivsegg enligt ITU-R P.526-15 avsnitt { "4.1" }, subtraherad från jammerns mottagna effekt.

seg-825c121c7512 = Hysteres vid acquisition och frontändens kvantiserare i jamming-typen mot oberoende omräkningar

seg-f7207263d881 = Jamming-typens valfria sektioner [acquisition] (en satellit acquireras vid eller över en acquisition-tröskel efter en fördröjning för återacquisition och hålls så länge den ligger vid eller över spårningströskeln) och [front_end] (AGC-avläsningen { "10" } log10({ "1" } + J/N) och ADC:ns kvantiseringsförlust för gaussisk indata dras av från varje länk, flaggad som ogiltig för icke-gaussiska jammers).

seg-9c46f1c76486 = Begränsad FLL-inlåsning under standardutformningens golv för FLL-till-PLL-överlämning (tillval)

seg-efa1d1a9e904 = Tillvalet carrier.fll_pull_in_max_s i iq::track (fältet fll_pull_in_max_s i iq::track::LoopConfig): under fll_assist = pull-in lämnar FLL över till PLL efter en fast inlåsningstid oavsett PLI, med en motsvarande återgångsvilotid tills PLI först når fll_off_pli.

seg-ac0f97e945a7 = RTKLIB .pos-lösningsläsare för receiver-trust

seg-0b8bc2c89de4 = Läser en RTKLIB-lösningsfil (kalendertid eller GPS-vecka/TOW-tid, latitud/longitud eller ECEF-position, använda satelliter) in i tidslinjen för receiver-trust (receiver_trust::machines::rtklib).

seg-3de364392f92 = Ingen extern oberoende referens: ingen fil producerad av RTKLIB lästes, och kolumnlayouten kommer från RTKLIB-manualen. Kontrollerad endast på självskrivna filer; ECEF-omvandlingen återanvänder frames::ecef_to_geodetic, som har egna rader

seg-849393517c04 = NovAtel OEM7 ASCII- och binärloggar (BESTPOS, RANGE, RXSTATUS) för receiver-trust

seg-7e0021922025 = Läser BESTPOS (position), RANGE (C/No per signal) och RXSTATUS (mottagarens jammer-flagga, som epokens självrapport) från ASCII- och binära OEM7-loggar, CRC-kontrollerat, skrivskyddat (receiver_trust::machines::novatel).

seg-1f7c6d1009a8 = Ingen extern oberoende referens som godkännandetröskel. Fältlayouterna och CRC följer den offentliga OEM7-dokumentationen (docs.novatel.com); CRC-rutinen kontrollerades en gång mot det CRC som dokumentationen anger för sitt eget BESTPOSA-exempel (citerat, inte återgivet ordagrant). Fixturerna är självskrivna; ingen logg från en verklig mottagare lästes

seg-a45c53a9deb3 = Läsare för bärvåg-till-brus i RTCM { "3" } MSM4 och MSM7 för receiver-trust

seg-0a0c9976236f = Läser C/N0 för varje signalcell i RTCM { "3" } MSM4- och MSM7-meddelanden (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) från en ramström, CRC-24Q-kontrollerat (receiver_trust::machines::rtcm3). Layouter från de BSD-licensierade pyrtcm-tabellerna, inte från RTCM-standardens text.

seg-2af6fc1abe98 = ReferenceImpl i en engångskontroll, inte ett test i sviten: avkodaren i pyrtcm { "1.2.0" } läser samma självskrivna ramar till samma C/N0 och epoktid. Den delar sina tabellers källa med den här läsaren, så den kontrollerar bithanteringen, inte layouten. Ingen inspelning från en verklig mottagare eller basstation lästes

seg-cd554a7c1649 = GNSS-SDR-övervakaradapter för receiver-trust

seg-22b587ac642d = Läser meddelanden från GNSS-SDR Monitor (Gnss_Synchro) och PVT-monitor, vidarebefordrade till JSON-rader med proto-fältnamnen, till C/N0 per kanal, positionsbestämning, använda satelliter, HDOP och himmel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-d22aed9d9a16 = Ingen extern oberoende referens: fältnamnen kommer från GNSS-SDR-dokumentationen; varken läsaren eller relay.py kördes mot en levande GNSS-SDR eller en verklig inspelning

seg-217e5953c128 = IMU-logginläsning, gyroindata för färdriktning och Allan-anpassning av parametrar för hybridsensorer

seg-9dadc819daef = Läser en IMU-CSV (dokumenterade kolumner, eller EuRoC-layouten); integrerar girhastigheten till den färdriktning som övervakaren för färdriktning mot kurs läser ([log.imu]); och anpassar accelerometerns och gyrots brusparametrar för scenarierna hybrid och fusion från en stillastående logg med överlappande Allan-avvikelse (imu-fit).

seg-9099f3467e9e = Ingen extern oberoende referens: anpassningen kontrolleras på syntetiska loggar med vitt brus och kända koefficienter, färdriktningen på loggar med konstant girhastighet. Ingen verklig IMU-logg anpassades, och q_aa anpassas inte

seg-15a852a2dcb0 = Home Assistant MQTT-discovery och tillståndsexportör för förtroendetelemetri

seg-6d6b07b26966 = Ett JSON-tillståndsdokument och Home Assistant MQTT-discovery-meddelanden för förtroendeströmmen, utskrivna som text på varje yta och publicerade över MQTT { "3.1.1" } QoS { "0" } av CLI:t (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-79a8f3864af3 = Ingen extern oberoende referens: paketen lästes av en loopback-lyssnare skriven för testet, inte av en verklig broker, och Home Assistant kördes inte

seg-68caf86157c2 = ROS { "2" }-paket för receiver-trust och gnss_lib_py-brygga

seg-e7d7d99fe538 = En ROS-fri brygga som skriver positions- och satellitmeddelanden som NMEA och poängsätter dem genom Python-bindningen (integrations/ros2/kshana_trust), och en brygga från gnss_lib_py NavData till receiver-trust genom formatet rtklib-pos (integrations/gnss_lib_py).

seg-05ded40b17d2 = Ingen extern oberoende referens: ROS-noden kördes inte på en levande ROS { "2" }-graf, och fältnamnen i ublox_ubx_msgs kontrollerades inte mot en körande drivrutin. gnss_lib_py (MIT) kördes för brygg-testet

seg-6eee4b0e40b9 = <s1>Föregående</s1>Verifieringsmatris

seg-c3e7639ccf1a = <s1>Nästa</s1>Varför rader förblir Modelled

seg-65185cb68d6b = Felbudget för navigering och tidssynkronisering för en kedja av uppdragsfaser från uppskjutning till återinträde (<c1/>)

seg-86a132e1a243 = Typen <c1/>: ett dokument med faser, var och en av åtta registrerade typer, körda i ordning med 6x6-kovariansen, klockan och referenssystemet överlämnade enligt en angiven regel (<c2/>; <c3/>, vitt accelerationsbrus över ett angivet glapp på en rätlinjig modell; <c4/>, dödräkning och därefter källans golv, aldrig under det, aldrig en återställning); omvandlingar av referenssystem mellan GCRF, MCI och MCMF samt av tidsskalor via TT, var och en en egen budgetrad, med månens tillstånd från ett valfritt utsnitt av en DE440-kärna och den analytiska serien som angiven reserv; marginalen mot ett angivet krav, den svagaste länken, händelserna och en tidslinjefigur. Varje tal är en angiven indata eller en modell av en sådan

seg-cf8a0dc4088e = Handberäkningar i testerna (den rätlinjiga tillväxten av kovariansen, den genomsnittliga sideriska rotationen, den sekulära hastigheten hos månklockan) och, enbart för månens tillstånd, de incheckade DE440-utsnitten mot fastlåsta värden från JPL Horizons (sämst { "2.6" } m och { "7e-6" } m/s). Inga uppdragsdata jämförs med kedjan; dess faser är rader för sig. Dokumentet är en angiven kedja med ILLUSTRATIVE indata, enbart offentliga källor och inget stöd från någon rymdorganisation

seg-87b2b2459b45 = Uppskjutning och stigning till en parkeringsbana med GNSS-inhämtning och bortfall (<c1/>)

seg-725e7ce83533 = Fasen <c1/>: en kovarians för position och hastighet med konstant hastighet och vitt accelerationsbrus (dödräkningsklassen), en GNSS-positionsbestämning med angiven noggrannhet som tillämpas efter inhämtningstiden och utanför angivna bortfall, en klocka med bias och drift som styrs av samma positionsbestämningar, samt insättningstillståndet i parkeringsbanan

seg-22e5c301626e = Riccati-jämviktstillståndet och handberäkningen av prediktionen i testerna. Ingenting här modellerar en bärraket eller en mottagare; varje tal är en angiven indata

seg-eb66a49b0306 = Relativ navigering till dockningsenveloppen i låg omloppsbana runt jorden över sensorsträckor (<c1/>)

seg-658a0448d80d = Fasen <c1/>: det relativa tillståndet i målets LVLH-axlar med Clohessy-Wiltshire-övergången i sluten form, en 6x6-Kalmankovarians med vitt accelerationsbrus och positionsuppdateringar vars varians är sensorns vid aktuellt avstånd, över sträckor med en angiven sensor (ILLUSTRATIVE optisk kamera, lidar och radioavståndsmätning); dockningsfönstret är tiden från den punkt där den relativa sigman håller sig inom infångningsenveloppen till slutet av fasen. Jagarens absoluta kovarians överlämnas oförändrad och en rad anger det

seg-97f4aa0575e6 = En endimensionell handberäkning av prediktion och uppdatering i testet; Clohessy-Wiltshire-övergången är den som cw_dynamics kontrollerar mot en oberoende numerisk integration. Sensorerna är ILLUSTRATIVE och ingen verklig rendezvous jämförs

seg-b45a8a357faf = Trans-lunar injektion och färd i cislunart rum: propagerat medeltillstånd och kovarians med spårningsuppdateringar (<c1/>)

seg-ab5c79789754 = Fasen <c1/>: medeltillståndet med motorns Cowell-propagator (jordens punktmassa och J2, solen och månen som tredje kroppar, månen från trådens DE440-kärna där den täcker segmentet och solen från den analytiska serien); kovariansen med en tillståndsövergångsmatris framåtdifferens av den propagationen (den nominella körningen och sex störda körningar per segment) med vitt accelerationsbrus; TLI-brännarens storlek och riktningsfel; <c2/>-positionsbestämningar vars tillgänglighet och PDOP kommer från svepet över rymdtjänstvolymen längs en oskulerande bana som står i för bågen; avstånds- och avståndshastighetsspårning längs den geocentriska riktningen skalad med markstationsnätets driftcykel, med uppdatering i Joseph-form

seg-86dae517e339 = Liouvilles sats (determinanten för tillståndsövergångsmatrisen för den konservativa delen är ett) och en finare differens i testerna; medeltillståndet jämförs med en offentlig bana i raden nedan, som det missar. Brännfelet, uppdateringarna och kovariansen jämförs inte med någonting

seg-7a3eb4fae324 = Kovarians vid återinträdesgränssnittet, korridorsannolikhet, maximal retardation och landningsområde (<c1/>)

seg-93f07906d7bf = Fasen <c1/>: returfärden för <c2/> utan brännare, som slutar vid återinträdesgränssnittet; banvinkeln och dess sigma ur hela kovariansen med en gradient av finita differenser; sannolikheten att vinkeln ligger inom en angiven korridor; den maximala retardationen vid den nominella vinkeln och vid båda korridorkanterna från motorns plana ballistiska punktmassa-återinträde (utstudsning detekteras) bredvid Allen-Eggers slutna form; landningsområdet från en angiven känslighet i sträckriktningen och gränssnittskovariansen tvärs banplanet. Ingen lyftkraft, styrning eller uppvärmning modelleras

seg-8d5695aad35b = Handberäkningar i testerna (vinkelns sigma är den vinkelräta hastighetens sigma delat med farten; Gauss-massan i en korridor). Det plana återinträdet är motorns eget och Allen-Eggers-formen är en jämförelse i sluten form; inget genomfört återinträde jämförs

seg-3f0951532f6e = Täckning och spårningsdrift för markstationsnätet för en trådfas (<c1/> i <c2/>)

seg-5204af351299 = Överlägget för markstationsnätet: stationer med en lägsta elevation, fordonets synlighet på en angiven geometri (återinträdestillståndet flugen tvåkropps med J2, månens position för färden, eller en angiven driftcykel), stationsöverlämningar som förlorar en angiven tid vardera, och den resulterande driftcykeln som förs över till uppdateringsfrekvensen för fasens markspårning; det längsta intervallet utan någon station i sikte är en budgetrad

seg-0d1d229a3ab7 = Kontroller av zenit- och antipodgeometri samt den förväntade synligheten för ett avlägset mål i testerna. Inget verkligt nät, ingen antenn och inget schema modelleras

seg-4ba700726208 = Relativ navigering till dockning i en månbana (<c1/>)

seg-2e30e78e49f7 = Typen och fasen <c1/>: en gemensam Gauss-Newton-skattning i satser för två fordon över bågen (tjugoett parametrar: båda tillstånden och bestående positionsbias i signal i rymden, gemensamma och oberoende), uppbyggd över en kvarts, en halv och hela bågen med stegfyrdelning, från en absolut positionsbestämning per fordon (AFS-pilotkodens spårningsgräns, ILLUSTRATIVE reläuppsättning) och ett avstånd över länken mellan fordonen, under cratens månkraftmodell; det genomsnittliga normaliserade kvadratiska skattningsfelet, Clohessy-Wiltshire-kontrollen på en cirkulär bana och den överlämnade 6x6-kovariansen

seg-09fa0c35d004 = Självkonsistens under en förhandsregistrering (xval/mission-thread-lunar/PREREGISTRATION.md, resultat och skattarens historik i RESULTS.md): den genomsnittliga NEES för det relativa tillståndet är { "5.85" } till { "5.93" } mot bandet { "5.2" } till { "6.8" } i fyra konfigurationer, MET på den fjärde skattarutformningen efter att tre utformningar med sekventiella filter missat; referensen och skattaren delar en kraftmodell, så detta säger ingenting om modellfel. Propagatorn den delar jämförs med LRO och CAPSTONE i en rad nedan

seg-c85d7e5e63a3 = Budget för landningsspridning vid en polarplats på månen (<c1/>)

seg-bd88ab3ad105 = Typen och fasen <c1/>: en inertiell felmodell med fem tillstånd per axel (position, hastighet, accelerometerbias, lutning, gyrobias) över en driven nedstigning, stödd av AFS-positionsbestämningar (fristående eller differentiella, med fallet med tre reläer och klockstöd), en terrängrelativ positionsbestämning (motorns terrängmatchare på syntetiskt relief, eller en Cramer-Rao-gräns på en LOLA-DEM med en regel för bländarproblemet) och månens tid, med en Monte Carlo-ellips för beröringspunkten

seg-a5ddb83a5cf1 = Den inertiella driften i sluten form, de återanvända typernas egna resultat och kalibreringen av 3-sigma-ellipsen (andelen innanför stämmer med sin förväntan) i testerna. Ingen genomförd eller testad landning jämförs

seg-8dfc1600cf8c = Tillgänglighet för positionering och tidssynkronisering på ytan per plats och årstid vid månens poler (<c1/>)

seg-f91c1da9ab55 = Typen och fasen <c1/>: reläers tillgänglighet och PDOP, synlighet för jorden och solen samt en styrd ytklocka för varje plats och årstid, med terrängsiluetten från <c2/>; en körning för en enda plats ger exakt samma tillgänglighet och PDOP som den typen, bit för bit

seg-e3a782dce8be = Exakt likhet med den befintliga typen för en plats, samt monotonicitetskontroller, i testerna. Reläuppsättningen är ILLUSTRATIVE och ingen ytmätning jämförs

seg-0db91d70a079 = Driven stigning från en polarplats på månen till en insättningsbana (<c1/>)

seg-b5b1125d515c = Typen och fasen <c1/>: den inertiella felmodellen med fem tillstånd per axel körd över en driven stigning med specifik kraft längs banan, stödd av AFS-positionsbestämningar och månens tid, som redovisar kovariansen för position och hastighet vid insättningen som förs vidare till banan och spridningen vid motoravstängning (redovisad, inte förd vidare)

seg-76e0d23b7483 = Den inertiella driften i sluten form och monotonicitetskontroller i testerna. Ingen genomförd stigning jämförs

seg-1983ce9cc6da = Propageringen med månens kraftmodell mot offentliga rekonstruerade banor för månsatelliter och cislunara banor

seg-57f53a7d1fa2 = Propagatorn som månens typer delar (GRAIL GL0660B grad och ordning { "150" }, jorden och solen som tredje kroppar, relativitet, DE440-månorientering) jämförd med de offentliga JPL Horizons-banorna för LRO ({ "24" } h, prov var { "10" }:e minut) och CAPSTONE (ett varv på { "6.5" } dygn, prov varje timme), under trösklar som fastställdes i en incheckad fil före körningen

seg-321d0721970d = JPL Horizons rymdfarkostefemerider för LRO och CAPSTONE, mot trösklar som fastställts i förväg i xval/mission-thread-lunar/PREREGISTRATION.md (tillägg { "1" } till { "6" }). LRO: MET, { "33" } m största 3D-skillnad och { "2.4" } m radiellt RMS mot { "500" } m och { "60" } m. CAPSTONE: NOT MET, en skillnad i slutposition på { "136.8" } km mot { "25" } km och en skillnad i periapsis på { "28.4" } km mot { "10" } km, orsakerna är inte isolerade. Raden är modellerad eftersom CAPSTONE-tröskeln inte nås och jämförelsen testar den delade propagatorn, inte något filter, någon signal eller budget

seg-c557d317389a = Propageringen av medeltillståndet i cislunart rum mot den offentliga banan för Artemis I (<c1/>)

seg-539d4c3e9b56 = Propageringen av medeltillståndet i fasen <c1/> (Cowell, jordens punktmassa och J2, solen och månen som tredje kroppar, månen från ett DE440-utsnitt) jämförd med den offentliga JPL Horizons-banan för Artemis I över en frirörelsebåge på { "72" } h från 2022-11-16 { "18" }:{ "00" } TDB, vid epoker var { "12" }:e timme, under trösklar som fastställdes i en incheckad fil före körningen

seg-362b1a7b9e5e = JPL Horizons mål -1023 (NASA:s navigationsbana som flugits efter TLI), mot trösklar som fastställts i förväg i xval/mission-thread/PREREGISTRATION.md (tillägg { "1" } ändrar bara den begärda tidsspannet). NOT MET och fastslaget som missat: { "45.3" } km största positionsskillnad mot { "5" } km, och { "0.249" } m/s hastighetsskillnad vid { "72" } h mot { "0.05" } m/s. En diagnostik som skrevs efter utfallet placerar missen i fem impulsiva hastighetssteg på { "0.09" } till { "0.22" } m/s i referensen (den förhandsregistrerade bedömningen att fönstret inte innehöll någon brännare var fel); under de övriga { "67" } timmarna återger modellen nästa timtillstånd med en median på { "0.38" } m. Testar bara medeltillståndet för en enda frirörelsebåge: ingen kovarians, inget filter, ingen uppdatering och ingen annan fas

seg-150ae9c3d755 = Område för störkälla: ett möjligt sändarområde utifrån positionsrapporter från flygplan och fartyg

seg-b5c49044a7a1 = Ett möjligt område för var en källa till försämrade navigeringsrapporter kan finnas, utifrån ADS-B-rapporter (NIC/NACp) eller AIS-positionsrapporter: radiosikt på en 4/3-jordradie från rapporthöjden och ett höjdintervall för sändarantennen, en begränsad effektiv räckvidd för den okända effekten, påverkade enheter som drar posteriorn mot sin räckvidd och opåverkade enheter med sikt som trycker emot den, grupperade i sessioner i tid och rum. Utdata är områden med högst täthet vid angivna konfidensnivåer, en posteriortyngdpunkt med en momentellips, sessionens start, slut, varaktighet, påverkad yta och antal skilda flygplan över publiceringsminimum, en profil över dygnet och timmar per dag. Terrängfritt; en enda källa per session; trovärdigheten är villkorad av modellen. Valfri fusion med en TDOA-positionsbestämning från geolokalisering.

seg-953a8b4f9f41 = Ännu ingen extern. Endast syntetiska rundturer framåt och bakåt, från en generator som delar skattarens modell, så de kontrollerar koden och kalibreringen av de angivna nivåerna under den modellen och ingenting om verkliga sändare. En extern kontroll mot de publicerade sändarplatserna i Jammertest { "2025" } förhandsregistrerades (docs/emitter-region/PREREGISTRATION.md, godkänd av ägaren före varje poängsatt körning) och kördes en gång (docs/emitter-region/RESULTS.md): ADS-B NOT ASSESSABLE ({ "2" } schemalagda sessioner, färre än det registrerade minimet på { "4" }) och AIS NOT ASSESSABLE (ingen publicerad session), så ingen tröskel testades och raden förblir MODELLED

seg-d5a79853b72f = { "93" } av { "93" } typer, { "3334" } av { "3334" } numeriska fält

seg-877f989ae75e = De { "61" } förmågekorten från <c1/>, därefter alla { "412" } rader i verifieringsmatrisen.
