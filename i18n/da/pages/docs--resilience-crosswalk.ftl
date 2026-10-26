# docs--resilience-crosswalk: translations (da)

seg-88372b30ed79 = Grænse

seg-aab745a65e76 = Modul

seg-ad856ad710eb = Status

seg-b03d56f501c3 = Type

seg-4dbf41c0ec3b = Funktion

seg-f472e43c1100 = Hvad den viser

seg-fa4468d4cb80 = Tilgængelighed

seg-fe4d868448ef = Kilde: <c1/>

seg-d745715d5332 = Krydsreference til rammeværk for PNT-resiliens

seg-aa1c24d63df5 = <b>Tilpasset, ikke vurderet eller godkendt.</b> Dette kobler Kshanas simulerede funktioner til de offentliggjorte rammeværker for PNT-resiliens (PNT: positionering, navigation og tidssynkronisering). Det er en <em>simuleringsbaseret selvvurdering, tilpasset</em> DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency) Resilient PNT Conformance Framework (RPCF) v2.0, RethinkPNT/Firesmith-modellen Resist-Detect-Respond-Recover (RDRR) og Yang Yuanxis kriterier for resilient PNT. Det er <b>hverken</b> en vurdering, en godkendelse, en akkreditering eller en compliance-erklæring, og det bærer ingen anbefaling fra DHS, IEEE (Institute of Electrical and Electronics Engineers) eller nogen myndighed. Hver række er mærket med sin ærlige verifikationsstatus (<c1/> mod en ekstern uafhængig reference eller <c2/> ud fra grundprincipper med tests); selve laget for resiliensscore er <b>MODELLED</b>. To af dets kerner har egne VALIDATED-rækker i verifikationsmatrixen, kernen for invers Simpson-diversitet (<c3/>) og kernen for rangordensstatistik (<c4/>); det validerer aritmetikken, ikke de score, der er bygget på den.

seg-652fcf3ec12d = Scoringsmotoren (<c1/>) bruger disse funktioner og udsender delscore for hver dimension, aldrig ét fantomtal. Se <c2/> for de maskinkontrollerede statusinvarianter.

seg-7a71de89a9fd = DHS RPCF v2.0: hvad rammeværket definerer, og Kshanas egne delscorekategorier

seg-1985dbfe351d = Det offentliggjorte rammeværk (Resilient PNT Conformance Framework, version { "2.0" }, { "26" } april { "2022" }, DHS Science and Technology Directorate sammen med CISA) definerer tre <b>kernefunktioner</b> (afsnit { "5.2" }: Prevent, Respond, Recover), <b>resiliensniveauerne { "0" } til { "4" }</b> (afsnit { "5.3" }) og <b>otte nummererede minimumskrav</b> fordelt på niveau { "1" } til { "4" } (afsnit { "5.3" }, gentaget i { "5.5" }) samt en evalueringsmetode (afsnit { "8" }). Det definerer <b>ikke</b> en liste med syv teknikkategorier. En tidligere version af denne side og kommentarerne i resiliensmodulet beskrev syv "RPCF technique categories"; ordene Obfuscate og Diversify forekommer ikke i v2.0. Dokumentets tekst blev genlæst den 2026-10-09, og ingen sådan liste blev fundet.

seg-178d1e119dce = De syv navne på delscore, som scoringsmotoren udsender (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; "OLVIDMR" er vores huskeord), er derfor <b>Kshanas egne scoringskategorier</b>, bevaret for at holde output stabilt. De er ikke DHS-begreber, og rækkerne nedenfor siger ikke, at DHS kræver dem. Hvor en kategori svarer til et krav i rammeværket, siger den sidste kolonne det; hvor den ikke gør, står der "ingen".

seg-5a9eb11bb965 = Kshanas delscorekategori

seg-e117e6f71845 = Kshana-funktion brugt som drivkraft

seg-7677dafa7016 = Nærmeste RPCF v2.0-reference

seg-27e0f6b39605 = Obfuscate

seg-7327b9cbc106 = Angiven teknik × kildekvalitet (ingen direkte adfærdsdrivkraft)

seg-b63e61fa5fa2 = ingen (en forebyggelsesteknik; afsnit { "5.2" }, Prevent)

seg-7ed4f2e21189 = Angiven teknik × kildekvalitet

seg-8579207ae2e5 = Verify

seg-30b8cb030965 = AUC (arealet under kurven) for forstyrrelsesdetektoren under scenariet (spoof-/jam-/meacon-monitorer)

seg-3d358c029f50 = Niveau { "2" } krav { "4" }; niveau { "3" } krav { "7" }

seg-fcb8cb7d4c97 = Isolate

seg-b3cd355743da = Niveau { "3" } krav { "6" }

seg-ffa87d149a20 = Diversify

seg-1282685a888b = Antal uafhængige grupper → invers Simpson-effektiv diversitet

seg-f0dd4c4ef1c5 = Niveau { "4" } krav { "8" }; afsnit { "5.5" } (fælles fejl)

seg-2d91b12a9e56 = Mitigate

seg-d183b552df76 = Tilgængelighed under afvisning

seg-c337df73e231 = afsnit { "5.2" }, Respond

seg-2da4df22d35d = Recover

seg-85d7e3292549 = Holdover-udløb × port for afgrænset forringelse

seg-3aec9f076902 = Niveau { "2" } krav { "5" }; afsnit { "5.2" }, Recover

seg-36958650abc0 = Den detaljerede kobling for hvert krav til det virkelige rammeværk, med hvad Kshanas output leverer belæg for, og hvad der er tilbage, findes i <a1>compliance/dhs-rpcf.md</a1>.

seg-a085dd81c769 = Funktionerne i RethinkPNT / Firesmith RDRR

seg-1b972717180b = Drivkraft

seg-6eaf161f8871 = Resist

seg-6046a8914dc7 = Middelværdi af delscorene Obfuscate/Limit/Isolate/Diversify

seg-242e2c01ebc2 = Detect

seg-45c8da13581f = Delscore for Verify (detektorens AUC)

seg-d29232baaaa6 = Respond

seg-36ab7ce187e6 = Delscore for Mitigate (tilgængelighed)

seg-f98dc190541c = Holdover × afgrænset port; nøgletal for resiliens-tidslinjen (KPI'er: detect/react/recover/loss)

seg-e7190928bed6 = Yang Yuanxis kriterier (den delmængde, som tidssynkroniserings- og detektionskvalitetsmålene udtaler sig om)

seg-52836e247425 = Kriterium

seg-cbbe4c0baf3f = Pålidelighed

seg-32d64f865b21 = Filterets integritetsandel

seg-214372f29bd1 = Kontinuitet

seg-ad5e76a596b8 = Holdover × afgrænset port

seg-d92fb15e6dfa = Nøjagtighed

seg-0de1f9119e0f = Stedfortræder for tidssynkronisering/kvalitet — <b>nøjagtighed i positionsdomænet indgår ikke i scoren</b>. <c1/> omsætter en leveret positionskovarians og HPL (horisontalt beskyttelsesniveau) til CEP/SEP/2DRMS (circular error probable, spherical error probable, twice the distance root mean square), men intet scenarie fører den ind i resiliensscoren

seg-0aa925a09499 = MODELLED (kun i tidsdomænet)

seg-6b661e6e4399 = Hvad denne krydsreference ikke hævder

seg-51a48d0c718d = Intet tildelt RPCF-niveau. Det angivne niveau er en <em>foreløbig, simuleringsbaseret</em> aflæsning med en eksplicit port for afgrænset forringelse, ikke en tildelt modenhed.

seg-df73b7c76ae5 = Ingen nøjagtighed i positionsdomænet i scoren. Delscorene for resiliens er bygget af metrikker for tidsdomænet og detektion. Motoren beregner positioner andre steder (typerne <c1/>, <c2/> og <c3/>) og beskyttelsesniveauer (typen <c4/>), men scoringslaget bruger dem ikke.

seg-30a1b1a4dfea = Ingen feltvalidering. Referencepanelet og trusselsensemblet er syntetiske, parameterforankrede reduktioner (<c1/>), angivet som en begrænsning af første rang.

seg-83c465cd78b0 = Ledsagestudiet (<c1/>) findes netop for at vise, at en sammenlægning af disse dimensioner til én samlet score eller ét niveau giver en vurdering, hvis rangordning af arkitekturer er ustabil under forsvarlige valg af vægte og trusler — så denne krydsreference er et målelag, der skal læses dimension for dimension, ikke en enkelt karakter at vurdere et produkt efter.

seg-32bd45dc031d = Resiliens- og vertikalscenarier, der udnytter disse lag

seg-4e36adba1c55 = De medfølgende scenarier nedenfor kører det trussels- og genoprettelsesapparat, som rækkerne i krydsreferencen peger på. Hvert er en virkelig kørsel af den nævnte type; hvert er <b>MODELLED</b> (ingen feltdata).

seg-44664e49d449 = Scenarie (<c1/>)

seg-44b8d7435bfd = Lagdelt PNT under en fælles jamming-/spoofing-trussel: en seedet Monte Carlo af lagafvisning, inverse-varians-fusion af de overlevende, forholdet mellem totalt tab for ét lag og for lagdelt PNT, og hvordan korreleret afvisning får det forhold til at falde sammen. Dens identiteter mellem Monte Carlo og lukket form samt fusion kontrolleres af tests i cratet; typen har ingen række i verifikationsmatrixen, så den bedømmes her som MODELLED.

seg-1734506ad287 = GNSS (globalt navigationssatellitsystem) forstyrret af jamming, et PNT-lag i lav jordbane (LEO) bærer brugeren, integritet bevaret (tre faser på én tidslinje).

seg-ff8cc090bdce = Én jammer mod en modtager med fire bånd; hvilken spoofing-monitor ser hvilken spoofer.

seg-0a93502a4a19 = Marginen for jammer-til-signal (J/S) ud fra modtaget effekt.

seg-f2230253bdff = Detektion af spoofing ud fra konsistens mellem Doppler og passagegeometri.

seg-d8ca900a8c14 = Tidssynkronisering af basestationer og kritisk infrastruktur i holdover, med LEO-tid.

seg-2a61d07bf177 = Brugere på vej, bane, hav, i polarområder og i tingenes internet (IoT) med et LEO-lag.

seg-8723073167ad = GNSS/INS (inertialt navigationssystem)-dødregning gennem en byprofil og gennem jamming på et lille ubemandet luftfartøj.

seg-6ee1ef707b20 = Hvor længe et INS holder et skib eller et tog inden for sin grænse, når GNSS er afvist.

seg-7ca913e1729b = En maritim jammer; detektion af en spoofer, der trækker et skibs rapporterede position væk.

seg-c49548e8393b = <s1>Forrige</s1>Kort over DO-316 / DO-229E

seg-dedf3b53d31f = <s1>Næste</s1>Modtagertillid
