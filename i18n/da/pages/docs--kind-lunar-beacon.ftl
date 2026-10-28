# docs--kind-lunar-beacon: translations (da)

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-3c4e3d725bb6 = Kilde: <c1/>

seg-5e402fc935cb = <c1/> (scenarietype)

seg-142ad48fe422 = Udvidelse af en lunar orbital navigationstjeneste med overfladefyr, som en kørbar før/efter-tabel. En bruger ved sydpolen ser et spredt orbitalt sæt i en smal flig af himlen, så afstandsgeometrien er dårligt konditioneret; nogle få OPMÅLTE OVERFLADEFYR leverer de sigtelinjerækker med lav elevation og bred azimut, som et sæt helt oppe over hovedet mangler, og den horisontale præcisionsfortynding falder kraftigt. Scenariet rapporterer tre konfigurationer ved én epoke — kun satellitter, satellitter plus de synlige fyr og en større konstellation som alternativ vej til samme geometri — hver med sine antal synlige kilder, sin fulde DOP og den realiserede 1-sigma-nøjagtighed i METER, opnået ved at gange igennem med en brugerækvivalent afstandsfejl pr. fyr, sammensat som kvadratroden af summen af kvadraterne af urtidssynkroniserings-, flervejs- og opmålingsled. Fyrenes synlighed er den geometriske horisont ved to højder på en måne uden atmosfære (ingen atmosfære, så grænsen er præcis), og DOP-sammensætningen er den samme kerne, som er krydskontrolleret mod gnss_lib_py i tests/dop_reference.rs. HVORFOR DENNE TYPE FINDES: modulet bag den har ligget i motoren og været kontrolleret mod en uafhængig DOP-vej siden L08/L09, men det kunne ikke nås fra en kørsel — ingen type, ingen dispatch-gren, ingen medfølgende fil. README annoncerede funktionen, og verifikationsmatrixen havde slet INGEN række for den, så den var på samme tid hævdet i prosa og ikke hævdet i registret, mens den var uopnåelig i motoren. Standardværdierne er den geometri, der allerede har et committet golden-resultat (en bruger ved -80 grader med en antenne på { "2" } m, tre fyr ved -80/0, -79/+{ "60" } og -79/-60 ved { "2" } km, et illustrativt LCNS-øjebliksbillede med seks satellitter ved t={ "0" }, en maske på { "5" } grader), så en bar kørsel gengiver en tabel, som en uafhængig reference allerede dækker, i stedet for at opfinde nye tal. MODELLED: konstellationsdesignet, fyrenes placering og hver fejlbudgetstørrelse er illustrative input, ikke en udrullet opmåling eller et målt link; kun DOP-aritmetikken, den lukkede horisontformel og relationen sigma = DOP x sigma_URE er forankret eksternt. Ikke en forpligtelse på tjenesteydelse.

seg-22ea11fcf367 = Én kørsel af <c1/> opsummeres som: Lunar surface-beacon augmentation — mask { "5.0" } deg, epoch +{ "0" } s, per-beacon sigma_URE { "1.1576" } m { "6" } satellites, no beacons sats { "5" } beacons { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } realised 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satellites + { "1" } visible beacons sats { "5" } beacons { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } realised 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satellites, no beacons sats { "19" } beacons { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } realised 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m beacons improve PDOP by 2.355x; a larger constellation instead, 4.002x MODELLED: konstellationen, fyrenes placering og fejlbudgettet er illustrative input. DOP-kernen nedenunder er den, der er valideret mod gnss_lib_py, og fyrenes horisont er den lukkede form fra L01.

seg-25522022cf9a = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-acfef3f325e4 = Eksemplet <c1/> sætter blandt andet:

seg-a53e353706f6 = Diagrammet, som motoren skriver for scenarios/lunar-beacon.toml, type lunar-beacon

seg-89e2f6bb2540 = <b>MODELLED</b> Fyrunderstøttet præcisionsfortynding for en bruger på månens overflade: rækkerne for de synlige satellitters sigtelinjer og rækkerne for afstandsbestemmelse til de synlige overfladefyr sættes sammen til én designmatrix og evalueres gennem den fælles DOP-kerne, og t Tests: <a1>validate_p2_beacon_before_after_table.rs</a1>.

seg-654a3554b1e3 = <b>MODELLED</b> Fyrunderstøttet præcisionsfortynding for en bruger på månens overflade: rækkerne for de synlige satellitters sigtelinjer og rækkerne for afstandsbestemmelse til de synlige overfladefyr sættes sam. Uafhængig reference (ReferenceImpl): DOP-aritmetikken er kernen crate::orbit::dop, som separat er valideret eksternt mod gnss_lib_py i tests/dop_reference.rs; denne række låner ikke den rækkes status igen. Fyrenes synlighedshorisont er den lukkede form fra L01, og sigma = DOP x sigma_URE er standardrelationen i GNSS (Kaplan og Hegarty, Understanding GPS/GNSS, afsnit { "7" }). Inden for denne række er selve understøttelsen kontrolleret mod en uafhængig

seg-4d1fc06e907b = MODELLED: konstellationsdesignet, fyrenes placering og hver fejlbudgetstørrelse er illustrative input, ikke en udrullet opmåling eller et målt link; kun DOP-aritmetikken, den lukkede horisontformel og relationen sigma = DOP x sigma_URE er forankret eksternt. (kategori-katalog (<c1/>))

seg-aaafed663400 = HVAD DER ER FORANKRET, OG HVAD DER IKKE ER Forankret: DOP-sammensætningen er kernen, som er krydskontrolleret mod gnss_lib_py i tests/dop_reference.rs; fyrenes synlighed er den lukkede form for den geometriske horisont ved to højder på en måne uden atmosfære (ingen atmosfære, så der er ingen refraktiv udvidelse, og grænsen er præcis); og sigma = DOP x sigma_URE er standardrelationen (Kaplan & Hegarty, Understanding GPS/GNSS, afsnit { "7" }). IKKE forankret — MODELL (kommentar i scenariefilen, linje { "40" } til { "49" })

seg-2516c4208769 = DOP-understøttelse med fyr på månens overflade er MODELLED, ikke valideret: kontrolleret mod en separat implementering i selve denne kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-ebb9724de60a = <s1>Forrige</s1>lunar-attack-surface

seg-ca9b68783354 = <s1>Næste</s1>lunar-differential-pnt

seg-b81e98467952 = <s1>Næste</s1>lunar-descent
