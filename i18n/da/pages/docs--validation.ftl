# docs--validation: translations (da)

seg-70860389903a = Ur

seg-583dc9ff6178 = Bibliotek

seg-d01db1c2710a = Reference

seg-619f89bf160c = Realisering af månens referencesystem

seg-2db69c58f694 = Differentiel PNT på Månen

seg-2eb6d1b0483d = RAIM / ARAIM

seg-da3532b1444d = SBAS / DO-229E

seg-d3af26f389f5 = IONEX / Klobuchar

seg-d6476863f862 = Funktion

seg-ad856ad710eb = Status

seg-d12d4565b01d = VLBI til geodæsi på Månen, kernesti

seg-5ed34a5b402e = Fælles OD med flere teknikker på Månen + ur

seg-4bcec6e2dd9f = Servicevolumen for månenavigation

seg-c04a3591074c = Interoperabilitetseksport for Månen

seg-20fee61b3107 = Bibliotek med fejlmodeller for kvanteenheder

seg-eaf341ff4522 = GNSS-fri kvantenavigation

seg-75636f9419b2 = Kendte begrænsninger

seg-9c0eb89a2fbe = Pakke

seg-f63dd3d7aad4 = Kilde

seg-638b8d451550 = Sensor

seg-04f69a0edb2f = type

seg-b03d56f501c3 = Type

seg-35bf9a48e566 = Led

seg-f3526b0d95f8 = Målt

seg-7634c6f4b32c = Forbindelse

seg-b966dd26caa6 = Datasæt

seg-4fe4920a3fa1 = Standard

seg-84430d202cd4 = Kilde: <c1/>

seg-028f26d1374e = <b>Om tolerancer.</b> "Valideret" betyder nedenfor, at en kalibreringstest hævder, at den simulerede statistik stemmer med referencerelationen inden for en <b>håndhævet grænse</b>, i øjeblikket <b>{ "20" }–{ "25" } % relativ fejl</b> (middelværdi over seeds) for relationerne for Allan/støjbudget. Den mediane observerede overensstemmelse er ofte meget strammere (nogle få procent), men den <em>garanterede</em> grænse er grænsen, ikke medianen. Hvor et tal som "~{ "2" } %" optræder, er det en typisk iagttagelse, ikke den håndhævede tolerance. Se <a1>Påstande mod virkelighed</a1>.

seg-94a480ed9ccb = Oprykningsreglen

seg-a550784412a6 = En række i den maskinkontrollerede verifikationsmatrix (<c1/>) er kun VALIDATED, når en uafhængig reference, der er <b>uafhængig af Kshana</b>, stemmer med implementeringen <b>inden for en tolerance, der er angivet, før sammenligningen køres</b>, i en test, der kører i gaten. Dette afsnit er det eneste sted, hvor reglen står skrevet; matrixen, prosaen for hver række og udgivelsesnoterne retter sig efter det.

seg-5e14faed9f05 = De accepterede typer af uafhængig reference

seg-4297b6a1b385 = Hvad der tæller

seg-a42c0c36b37f = Eksempler, der allerede findes i matrixen

seg-e39aeb132e03 = Rigtige måledata for den størrelse, rækken påstår noget om: en observation af den fysiske verden, ikke et modeloutput.

seg-e77977db9de1 = De tilbageholdte to tredjedele af en rigtig optagelse fra et cæsiumur; arkiverede normalpunkter fra månens laserafstandsmåling; BIPM's (International Bureau of Weights and Measures) serie Circular T UTC(k); SRTM-terrænfliserne (Shuttle Radar Topography Mission).

seg-6325fe1fafaf = Et uafhængigt bibliotek eller værktøj fra tredjepart, der beregner en <b>entydigt defineret</b> størrelse på de samme inputs, hvor biblioteket selv implementerer domæneberegningen. Overensstemmelse mellem to biblioteker er kun en ægte kontrol, fordi størrelsen har ét rigtigt svar.

seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, SciPys statistiske fordelinger.

seg-056adffae706 = Offentliggjorte referencevektorer, tabeller eller verifikationseksempler: tal, som en standard, en myndighed eller en referencetekst trykker, så implementeringer kan kontrolleres mod dem.

seg-991fb822e99c = Vektorer fra SOFA/ERFA (Standards of Fundamental Astronomy), verifikationsvektorerne for SGP4 fra AIAA (American Institute of Aeronautics and Astronautics), valideringseksemplerne fra ITU-R (International Telecommunication Union, Radiocommunication Sector), det gennemarbejdede ARAIM-eksempel fra Working Group C, JPL (Jet Propulsion Laboratory) Horizons.

seg-2a774e48055a = To yderligere standarder afgør grænsetilfældene. Begge er vedtaget til udgivelse { "0.30" }.

seg-f5c6cf536ba1 = <b>P1, en offentliggjort gennemarbejdet værdi.</b> En offentliggjort gennemarbejdet værdi, beregnet ud fra den samme lukkede form, som rækken implementerer, tæller som en offentliggjort referencevektor, når publikationen er uafhængig af Kshana, og sammenligningen fastlåser en angivet tolerance. Værdien skal være trykt som et tal i publikationen (en værdi aflæst fra en graf tæller kun, hvis aflæsningsusikkerheden ligger inden for den angivne tolerance), og testen skal lade Kshana beregne den ud fra publikationens inputs; at sammenligne en konstant med det dokument, den er kopieret fra, er en transskriptionskontrol, ikke P1.

seg-0b043b552e76 = <b>P2, et uafhængigt numerisk bibliotek.</b> Et uafhængigt numerisk bibliotek som numpy eller LAPACK (Linear Algebra PACKage), der genberegner en entydigt defineret størrelse i lineær algebra på angivne inputs, tæller som et uafhængigt bibliotek. Biblioteket skal udføre dekompositionen, inversen, løsningen eller mindste-kvadraters-trinnet med sin egen algoritme, på inputs, der er committet sammen med fixturen; den validerede påstand er så den lineære algebra på disse inputs, ikke de fysiske størrelser i et repræsentativt scenarie. Et script, der genberegner en skalar lukket form med numpy-aritmetik, er en anden implementering af vores egen, ikke P2.

seg-b7911d589f7a = Betingelser, der gælder for alle typer: den uafhængige reference er ikke skrevet, kørt eller udgivet af dette projekt (dette repositoriums egen artikelserie er derfor ikke uafhængig af det); tolerancen står i testen og blev fastsat før den første sammenligning; en datastyret test, der springes over, når dens offentlige data mangler, siger det, når den springes over.

seg-7e6057a2cad7 = Hvad der ikke tæller

seg-80cfbb204767 = <b>Vores egen anden implementering</b>: en anden kodesti i denne crate (<c1/>) eller et script i dette repositorium, der genberegner den samme lukkede form.

seg-d6efaf8399f9 = <b>Overensstemmelse med vores eget tidligere output</b>: gyldne værdier, regressionsfastlåsninger, snapshots eller en tabel fra dette projekts egne artikler.

seg-4d0365b383e5 = <b>En transskription af konstanter fra en kilde</b>: kontrol af en koefficient, en forudindstilling, et tal fra et datablad eller et parameterark mod det dokument, den er kopieret fra.

seg-3bf8025077fb = <b>Et designvalg</b>: en allokering, vægtning, tærskel, alarmgrænse eller et repræsentativt scenarie. Der findes ingen ekstern reference for et valg.

seg-4f0aafd7166e = <b>En intern identitet</b>: et numerisk integral mod sin egen analytiske form, en rundtur, en invertering, en egenskabs- eller monotonitetstest.

seg-4f4408e4ebab = <b>En integrationskørsel mod en rigtig vært</b> (<c1/>): at indlæse et plugin i en rigtig Signal K-server eller OpenCPN eller føre en rigtig gates output til en TCP-forbruger og kontrollere, at værten accepterer inputtet og viser den forventede tilstand. Det viser, at rørføringen virker. Værten er ikke en uafhængig reference for nogen værdi, integrationen bærer, så der er intet eksternt at sammenligne med, og en sådan række (rækken for de marine integrationer) er MODELLED, ikke VALIDATED. <c2/> er en egen type uafhængig reference, kun tilladt på MODELLED-rækker: <c3/> i <c4/> fejler, hvis en VALIDATED-række har den, og <c5/> kræver allerede, at hver VALIDATED-række er <c6/>.

seg-a39a87c56a16 = <b>Plausibilitet på rigtige inputs</b>: rigtige data brugt kun som input, med påstande om størrelsesorden i stedet for en sammenligning med en ekstern værdi.

seg-db6f5d98b4ef = En tolerance valgt efter at have set sammenligningen.

seg-f4f18b7549df = Sådan håndhæves reglen

seg-19a62c7e0aee = Hver VALIDATED-række angiver i <c1/> i <c2/>, hvilken type den bygger på (Measured, Library, Reference, P1 eller P2), den uafhængige kilde (citeret fra rækkens egen tekst om den uafhængige reference) og den ene test, der bærer sammenligningen. Enhedstestene ved siden af tabellen fejler, når en VALIDATED-række ikke er angivet eller er angivet to gange, når en angivelse nævner en række, der ikke er VALIDATED, når den angivne kilde ikke er den, som rækkens tekst om den uafhængige reference nævner, eller er Kshana selv, når den angivne test ikke er en, som rækken henviser til, eller når en P2-række ikke nævner noget uafhængigt numerisk bibliotek. <c3/> kræver derefter, at den angivne test findes på disken som en rigtig <c4/>, der ikke er ignoreret. Hvad maskinen ikke kan kontrollere, er, om den nævnte test sammenligner med den angivne kilde; det forbliver en menneskelig læsning. Antal pr. type er ikke skrevet her: tabellen er kilden.

seg-e8ae3e380f40 = Eksisterende VALIDATED-rækker gennemgået på ny efter reglen

seg-1dd44545a67a = Reglen blev anvendt på de eksisterende rækker såvel som på fremtidige oprykninger.

seg-38db7b6e7053 = <b>P1-rækker nævnt af valideringsstudiet for { "0.30" }, hver især understøttet:</b> Link-budget i én retning (designkontroltabellen for JPL Pub 82-76 Galileo X-bånd, genopbygget ud fra sine enkeltposter til { "4.6e-3" } dB frirumstab); Båndbegrænsede lukkede former for ethvert afstandssignal ({ "90.3" } procent af hovedlobens effekt og den offentliggjorte koherente early-late-jitter); Maksimal Doppler for en navigationssatellit i lav jordbane (de offentliggjorte tal for Xona Pulsar X1 og Iridium); Maksimal Doppler, en statisk bruger ser fra en LEO- eller MEO-bane (tabel { "1" } i Pulsar-artiklen, { "20" } værdier); Doppler, en jordmodtager skal kunne håndtere fra en navigationssatellit i LEO (de samme offentliggjorte tal fra en fløjet bane). Hver publikation er uafhængig af Kshana, trykker sine tal, og testen angiver sin tolerance.

seg-8e38103d05d6 = <b>Yderligere rækker, der bygger på P1, fundet ved gennemgangen, hver især understøttet:</b> Afvejning i udformning af afstandskode (de offentliggjorte −{ "23.9" } dB for Gold-krydskorrelation); Månens koordinattid (Ashby og Patla { "2024" }, hvis kontrol af månens hastighed mod DE440 er en biblioteks-kontrol); Lukkede former for effektspektraltætheden af L-bånd-signaler (Q-værdier fra Kaplan og Hegarty); Ionosfæreforsinkelse af første orden pr. bånd (gruppeforsinkelsesforholdet i IS-GPS-200); Globalt gennemsnitlige vægte for afstandsfejl i signalet i rummet (tabellen fra Montenbruck, Steigenberger og Hauschild { "2018" }).

seg-0014c53752ac = <b>P2-rækker nævnt af studiet, hver især understøttet:</b> Fisher-information og Cramér–Rao-observerbarhed (numpy <c1/>/<c2/>); Identificerbarhed af månens datum; Koblet gauge for månens referencesystem og tidsskala; Autonom pipeline for fejlobserverbarhed i frit netværk (numpy/SciPy SVD, singulærværdidekomposition). Hver genberegner en entydigt defineret størrelse i lineær algebra på committede inputs med en anden algoritme end Kshanas Jacobi-egenløser.

seg-e9d01633d002 = <b>Yderligere rækker, der bygger på P2, fundet ved gennemgangen, hver især understøttet:</b> Udledning af prioriteter ved MCDA (multi-criteria decision analysis) (egenvektoren i AHP, analytic hierarchy process, fra SciPy/LAPACK; den Random Index-tabel, den også gengiver, er en transskription og tælles ikke med); Varians ved urets holdover-fremskrivning (SciPy <c1/> af Van Loans udvidede matrix); Realisering af månens referencesystem (en Umeyama-løsning med numpy SVD); CRPA-beamforming (controlled reception pattern antenna) (komplekst LAPACK-solve); Kerne for ARAIM-beskyttelsesniveau ved månen (RTKLIBs LU-invers med SciPy-kvantiler); Konsistens mellem udbydere af månens referencesystem/dynamik (en numpy SVD-mindste-kvadraters-tilpasning af tre offentliggjorte efemerider).

seg-1fd94e94e89d = <b>Markeret ved første gennemgang, bygget på ny i runde { "2" } af kørslen for { "0.30" }.</b> Tre rækker blev markeret som ikke understøttet af den skrevne regel. Hver hviler nu på en sammenligning, der blev præregistreret, før dens fixture blev hentet, så ingen række er markeret; en enhedstest ved siden af <c1/> fastlåser den (nu tomme) liste.

seg-3ef9479dea55 = <b>Integritet (RAIM/ARAIM/SBAS).</b> De anførte tests plejede kun at hævde plausibilitet på rigtig IGS-geometri (International GNSS Service). Rækken hviler nu på tre biblioteksreferencer: ARAIM's solution separation med flere hypoteser i Airborne Design Document v4.2 mod Stanford MAAST for ARAIM { "2" } ({ "270" } rigtige tilfælde, værste VPL-forskel { "2.2e-3" } m mod { "0.05" } m); detektion og udelukkelse ved snapshot-RAIM mod RTKLIB <c1/> ({ "2016" } af { "2016" } beslutninger identiske) med beskyttelsesniveauet for hældning; og SBAS DO-229E L1-beskyttelsesniveauer mod Stanford MAAST på rigtige WAAS-udsendelser ({ "2868" } par inden for { "1.6e-5" } m). Rækken siger ligeud, at funktionerne med ensartet sigma <c2/> og <c3/> ikke er ADD-konforme, og at sammenligningen af SBAS med dobbelt frekvens på L5 er et fund.

seg-16a4261c77ec = <b>Planeternes positioner i hele solsystemet ud fra JPL's Keplerelementer fra Standish.</b> Den efterfølgende tærskel på det dobbelte af den nominelle fejl er erstattet af en præregistreret tærskel: RMS højst lig tallet i Explanatory Supplement tabel { "8.10.1" } pr. planet og komponent, mod JPL Horizons DE441, med Jordens opdeling og ICRF-rotationen dækket.

seg-8d5b51a942e0 = <b>Lystid mellem legemer i solsystemet.</b> Løseren for lystid sammenlignes nu med lystider fra Horizons inden for { "1e-6" } s på DE441-positioner, en præregistreret tærskel, der ikke arver positionstærsklen.

seg-e96900bc322f = <b>MODELLED-rækker, som de to politikker gør oprykkelige</b> (kun gennem kørslen række for række for { "0.30" }, aldrig ved denne tekst): under P1 grænsen for geolokalisering af emittere med TDOA/FDOA (time and frequency difference of arrival), koblingen mellem relativistisk urrate og referencesystem, synkroniseringsmaskerne fra ITU-T (Telecommunication Standardization Sector) (kun for maskeværdier, som anbefalingerne trykker som tal; de transskriberede knækpunkter, kontrolleret mod sig selv, tæller ikke) og grænsen for positionering i 5G-netværk uden for jorden (kun hvis et offentliggjort gennemarbejdet tal findes); under P2 integritetsblindhed ved fælles mode, det skalære MHSS-beskyttelsesniveau (multiple-hypothesis solution separation) for tid og GLS-hvidgørelsen (generalised least squares). De to benchmark-rækker for tidsintegritet (klassifikatoren for Stanford-integritetsdiagrammet og scoreren for integritetsdækning) er regelbaseret klassifikation, ikke lineær algebra, så P2 når dem ikke; de kræver et uafhængigt værktøj, og det eneste fundne (gLAB) har en ikke-kommerciel licens.

seg-50a08fe5918b = <b>Sammenhæng med tidligere afvisninger.</b> Vallado-kontrollen i rækken for opsendelsesvinduet ville nu kvalificere sig under P1, hvis dens test beregner det trykte gennemarbejdede eksempel; planen for { "0.30" } rykker den op gennem Orekit i stedet. Tabellen for krydsningstidspunktet for månens tid pr. urklasse forbliver MODELLED: den tabel, den gengiver, stammer fra dette projekts egen artikel, som ikke er uafhængig.

seg-02423542480f = Støjled

seg-2bd49b92f14b = Paritet for Allan-estimatorer (ADEV/MDEV/TDEV/OHDEV (ADEV: Allan-deviation; MDEV: modificeret Allan-deviation; OHDEV: overlappende Hadamard-deviation))

seg-c429a25d17ae = To kontroller mod primærkilden <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), begge til en relativ tolerance på <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: estimatorerne for overlappende ADEV, modificeret ADEV, tidsdeviation og overlappende Hadamard gengiver deviationerne for det kanoniske datasæt <b>NBS14</b> med 10 punkter (<b>SP { "1065" } tabel 29/30, s. { "107" }</b>) ved tau = { "1" }, { "2" } — overensstemmelsen er faktisk ~{ "1e-6" } (fx overlappende ADEV (OADEV) ved τ = { "2" }: { "85.952868" } mod { "85.95287" }). ({ "2" }) <c2/>: de samme fire estimatorer gengiver <b>datasættet med 1000 punkter i SP { "1065" } §{ "12.4" }</b> (<b>tabel { "31" }, s. { "108" }</b>) ved middelingsfaktorer { "1" } / { "10" } / { "100" }, hvor datasættet regenereres i kode ud fra LCG'en i SP { "1065" } (lign. { "73" }) — hermetisk, ingen fixture. De samme data og tallene i tabel 31 er regressionsmålet i aewallin/allantools (<c3/>), her gengivet uden kode fra tredjepart. Det fastlåser <em>estimatorernes matematik</em> mod referencen, adskilt fra rækkerne for støj-<em>kalibrering</em> nedenfor.

seg-79e6f7d1e7f0 = Paritet for Allan-estimatorer på <b>rigtig målt hardware</b>

seg-8c72a9df2547 = <c1/>: estimatorerne for overlappende Allan og overlappende Hadamard gengiver referencedeviationerne fra <b>Stable32</b> for en <b>rigtig cæsium-primærstandard 5071A målt mod en brintmaser</b> ({ "556 990" } fasesampler ved τ₀ = { "1" } s; { "1" } PPS (puls pr. sekund) ind i en tæller 53230A, feb { "2014" }; indsamlet af A. Wallin, distribueret med <c2/>). Kontrolleret over <b>hele dekadestigen for τ ({ "16" } middelingsfaktorer, τ = { "1" } s … { "4" }×10⁴ s)</b>: velsamplede faktorer mod en relativ grænse på <b>{ "1e-3" }</b> (den observerede overensstemmelse er faktisk ≤ { "3e-5" }, fx OADEV({ "1" } s) { "3.317111e-10" } mod Stable32 { "3.3171e-10" }), mens sparsomme faktorer ved lang τ skal lande inden for Stable32's trykte konfidensbånd på { "1" }‑σ. Det supplerer den syntetiske NBS14-paritet ovenfor med en kontrol mod et målt ur. Den rå fasefil er data fra tredjepart uden licens til videredistribution, så den er git-ignoreret; <c3/> gengiver den, og testen udskriver en besked om, at den springes over (CI (continuous integration) forbliver grøn), når den mangler. Kun de offentlige referencetal fra Stable32 er committet (<c4/>); der bruges ingen kode fra tredjepart.

seg-1a7f0e741913 = Paritet for Allan-estimatorer på den <b>kanoniske Stable32 PHASE.DAT</b>

seg-00e382874a00 = <c1/>: estimatorerne for overlappende Allan, modificeret Allan og tidsdeviation gengiver referencedeviationerne fra <b>Stable32</b> for <b>PHASE.DAT</b> — serien med 1001 punkter, der distribueres med Stable32, og som uafhængige værktøjer (fx <c2/>) bruger som deres standardmål for regression — over <b>hele stigen af middelingsfaktorer ({ "139" } faktorer)</b> mod en relativ grænse på <b>{ "1e-3" }</b> (observeret ≤ { "5e-5" }). En anden, uafhængig rigtig referenceserie ved siden af kontrollen med målt cæsium ovenfor. PHASE.DAT leveres med det kommercielle værktøj Stable32, så den rå serie er git-ignoreret; <c3/> gengiver den, og testen springes grønt over (CI forbliver grøn), når den mangler. Kun de offentlige referencetal fra Stable32 er committet (<c4/>); der bruges ingen kode fra tredjepart.

seg-9dde9e0c8055 = Stabilitet af optisk ur på en <b>rigtig målt kurve</b>

seg-ea908ba3a79f = <c1/>: inversionen af urets støjparametre (<c2/>) gengiver den <b>offentliggjorte σ_y(τ) for et ⁸⁸Sr-ur med optisk gitter fra Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), kurve medleveret i <c3/>): den genfundne koefficient for hvid frekvensstøj √q_wf ≈ { "4.33e-16" } stemmer med artiklens korttidsstabilitet på ≈4.7e-16/√τ (~{ "10" } % RMS (root mean square) over kurven), og tilpasningen finder et målt gulv forskelligt fra nul (q_rw > { "0" }). Det fastlåser <b>inversionen fra målt ADEV til støjparametre mod et rigtigt optisk ur</b>; fordelen ved holdover til tærsklen, der bygger på den, forbliver MODELLED.

seg-e1e930dcd0a1 = ROC (receiver operating characteristic) AUC (area under the curve) for anomalidetektion på <b>rigtig telemetri fra ESA (European Space Agency) OPS-SAT</b>

seg-2b637daa985c = <c1/> (gengiver mærkater)

seg-c667434b580d = <c1/>: på datasættet <b>OPSSAT-AD</b> (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — rigtige housekeeping-segmenter fra OPS-SAT med anomalimærkater fra virkeligheden — gengiver Kshanas Mann–Whitney-ROC-AUC (<c2/>) <b>scikit-learn <c3/></b> på <b>< { "1e-9" }</b> på det tilbageholdte testsplit ({ "529" } segmenter, { "113" } anomalier), for to deterministiske scorer: en gennemsigtig detektor med ét træk (segmentets antal toppe, <b>AUC ≈ { "0.851" }</b>) og en score med 8 træk og diagonal Mahalanobis, tilpasset de normale træningssegmenter (AUC ≈ { "0.556" }); <c4/> omslutter punktestimatet med en nedre grænse, der ligger over tilfældighed. Det validerer <b>AUC-beregningen på rigtige ESA-data</b> og en gennemsigtig detektors <b>adskillelse af mærkater</b> — det gengiver <b>ikke</b> OPSSAT-AD-artiklens bedste offentliggjorte mål (en superviseret FCNN (fully connected neural network), F1 ≈ { "0.95" }), som kræver deres trænede model. CC-BY-data medleveret (<c5/>, hermetisk); den uafhængige reference regenereres af <c6/>.

seg-5f2d41617fb2 = Syntese af funktionaler af tyngdefeltet (tyngdestøttet / GNSS-frit (GNSS: global navigation satellite system) navigationskort)

seg-4c1126137428 = <c1/>: kernen for sfærisk-harmoniske tyngdefunktionaler (<c2/> / <c3/>) — “kortlæseren”, en tyngdestøttet navigator matcher mod — er valideret mod <b>normaltyngdestandarden GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, vedtaget af IAG (IAG: International Association of Geodesy)). Opbygning af GRS80's normalfelt ud fra dets offentliggjorte lige zonale harmoniske J₂…J₈ og syntese af tyngde (gravitation + centrifugal) på ellipsoiden gengiver den lukkede <b>Somigliana</b>-normaltyngde og de offentliggjorte værdier ved ækvator/pol γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s² på <b>{ "3.5e-12" }</b> relativt over alle breddegrader (grænse { "1e-9" }). Den samme kerne indlæser den toneangivende <b>rigtige ICGEM-jordmodel (International Centre for Global Earth Models) EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA (National Geospatial-Intelligence Agency), offentligt tilgængelig via ICGEM; læseren <c4/> afprøves også på GRAIL-månefeltet (Gravity Recovery and Interior Laboratory) i <c5/>) og frembringer et fysisk afgrænset kort over tyngdeforstyrrelser (RMS ≈ { "26" } mGal, maks. ≈ { "89" } mGal ved d/o { "70" }). Validerer <b>syntesekodens korrekthed</b>; <em>nøjagtigheden af positionsbestemmelsen</em> med tyngdestøtte forbliver MODELLED (ingen offentlig bane med gravimeter på en platform og reference).

seg-7dc3ff4c6eea = Støjtypespecifik edf (konfidensintervaller)

seg-7e8a93fb2eea = <c1/>: χ²-konfidensbåndet for hvert punkt i overlappende ADEV bruger de støjtypespecifikke effektive frihedsgrader (de lukkede former i NIST SP { "1065" } tabel { "5" } for hvid og flicker-fasemodulation, hvid og flicker-frekvensmodulation og random walk-frekvensmodulation (WPM/FPM/WFM/FFM/RWFM) — det enkle sæt i Stable32), idet optagelsens potenslovstype identificeres ud fra hældningen af dens MDEV i log-log. Tre uafhængige kontroller: (a) de fem formler gengiver håndberegnede værdier ved N={ "64" },m={ "4" } på { "1e-12" }; (b) et <b>Monte Carlo-ensemble med hvid FM (FM: frekvensmodulation)</b> ({ "4 000" } optagelser) måler estimatorens faktiske chi-i-anden-edf = { "2" }·middel²/Var(σ²) og stemmer med formlen inden for { "20" } % (og slår tydeligt det konservative antal uden overlap); (c) <c2/> gengiver den trykte <b>SP { "1065" } tabel { "32" } (s. { "109" })</b> edf = { "146.177" } for datasættet med 1000 punkter ved m={ "10" } (hvid FM) på { "5e-3" } og tabellens konfidensgrænser på { "95" } % ({ "8.223942e-2" } / { "1.035201e-1" }) på <{ "0.2" } % (den lille rest er Wilson-Hilferty-approksimationen af χ² mod NIST's eksakte χ²). Den eksporterede ADEV-kurve bærer den identificerede støjtype, edf og båndet på { "95" } % for hver τ.

seg-7048ac695b99 = Hvid FM (kort sigt)

seg-b6982cb2ca25 = <c1/>: simuleret overlappende ADEV gengiver offentliggjort sigma_y({ "1" } s) — typisk inden for nogle få procent, <b>håndhævet grænse { "20" } %</b> (CSAC og målet for optisk gitter) — og kurven for hvid FM sigma_y(tau)=sigma_y(1s)/sqrt(tau) over tau = { "1" }, { "10" }, { "100" } s inden for en <b>grænse på { "25" } %</b> (stemmer med databladet for CSAC (chip-scale atomic clock) { "3e-10" } / { "1e-10" } / { "3e-11" }).

seg-11fc7c4b61ff = Random walk-FM (lang sigt)

seg-1e211f342e79 = <c1/>: simuleret ADEV stemmer med sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) på ~{ "20" } % (middelværdi over seeds).

seg-dcfca4041429 = Ældning / lineær drift

seg-2d5c6a44cbdb = <c1/> + kalibreret væk

seg-492f91ba2f79 = Deterministisk; holdover-estimatoren fjerner offset og ældning med en kvadratisk prædiktor, så resten er den stokastiske grænse. Testet i <c1/> / <c2/>.

seg-2ea6a14cac1c = Kalman-estimator + integritetsgrænse

seg-8c8f8a5eba5a = <c1/>: et filter med to tilstande (fase, frekvens), hvis eksakte van Loan-processtøj stemmer med sandhedsmodellen; fremskrivning gengiver den analytiske holdover-varians <c2/> på { "1e-9" }. Kovariansopdateringen er i <b>Josephs stabiliserede form</b> <c3/>, som forbliver positivt semidefinit (kontrolleret med Cholesky) gennem { "500" } predict/update-trin ved et ekstremt forhold <c4/>, og stemmer med den naive form på { "1e-9" }, hvor den er veltilpasset. Kørselslaget melder Integrity som den andel af udfaldsprøver, der ligger inden for 3-sigma-beskyttelsesgrænsen (<c5/>).

seg-f332f06e80f9 = Filterets selvkonsistens (NIS (normalised innovation squared) / NEES (normalised estimation error squared))

seg-333e1701b6d0 = <c1/> (model)

seg-c1304de95180 = <c1/>: en Monte Carlo-vurdering af konsistens (Bar-Shalom §{ "5.4" }). Det matchede filters samlede <b>NIS → { "1" }</b> og <b>NEES → { "2" }</b> lander inden for deres χ²-bånd på { "95" } % (NIS-båndet bruger det samlede antal hvide innovationer; NEES-båndet bruger antallet af uafhængige kørsler, da estimationsfejl er korreleret i tid). En test med <b>sweep af Q/R-uoverensstemmelse</b> kontrollerer, at monitoren kun melder <c2/> ved enhedstuning og <c3/> ved fejltuning på ×0.1/×0.5/×2/×{ "10" }, hvor NIS skalerer som ≈1/q_factor som udledt. Vises som <c4/> i urets resultat-JSON (JavaScript Object Notation) og på et kort på legepladsen. χ²-båndene bruger Wilson–Hilferty-kvantilen (<c5/>, kontrolleret mod tabel).

seg-078c4009b24f = Model for tovejs tidsoverførsel

seg-22f8cdeda335 = <c1/>: den reciprokke fælles forsinkelse udlignes nøjagtigt i estimatet <c2/> (udledt i hånden, eksakt), og to målinger i én retning middeler til <c3/> (middelværdi over seeds); den ikke-reciprokke differentielle forsinkelse er en farvet proces med hvid FM + random walk-FM, hvis Allan-deviation følger <c4/> (middelværdi over seeds, ~{ "20" } %, via linkets egen <c5/>). <em>Parametrene</em> (pr. link <c6/>, <c7/>) er repræsentative tal for TWSTFT/optisk (TWSTFT: two-way satellite time and frequency transfer), ikke tilpasset en bestemt terminal.

seg-6ab219622143 = Sikkerhed (score for spoofing-detektion)

seg-29dd10011ed1 = <c1/>: monitorens 1-sigma-gulv <c2/> og det deraf følgende mindst detekterbare offset på <c3/> sigma og scoren <c4/> er udledt i hånden og enhedstestet. Modellen (innovation / urstøttet detektion i RAIM-stil (RAIM: receiver autonomous integrity monitoring)) er sund; <em>parametrene</em> (overvågningsvindue <c5/>, detektionsmultiplikator <c6/>, målestøj <c7/>) er repræsentative, ikke tilpasset en bestemt modtager.

seg-ca51e4f1e19c = Detektion af spoofing-angreb

seg-e991f5b2fdb2 = <c1/>: en stigende falsk tids-spoofing meldes, når dens offset overskrider urets detektionsgrænse; detektionstidspunktet stemmer med det udledte <c2/> inden for ét gittertrin, og et ur, hvis grænse overskrider specifikationen, lader spoofingen nå tærsklen uopdaget. Samme forbehold for <c3/> som for sikkerhedsscoren.

seg-3d2f6d2b7722 = Flicker-FM (gulv)

seg-55697d598918 = <c1/> (slået fra som standard)

seg-55000870c060 = Syntetiseret som en sum af logaritmisk fordelte Ornstein-Uhlenbeck-processer (OU), kalibreret til et konfigurerbart fladt ADEV-gulv; <c1/> validerer, at gulvet er fladt over middelingstiden og ligger på det konfigurerede niveau (middelværdi over seeds). Slås til pr. ur via <c2/>. De anførte referencescenarier lader det være slået fra: CSAC er domineret af hvid FM over hele sit dataområde (1-1000 s), og det systematiske gulv for det optiske ur (~{ "5e-17" }) er repræsenteret ved dets nøjagtighedstal.

seg-e2e3de9a61a4 = Statistik for Monte Carlo-ensemble

seg-9785d05ec5a7 = <c1/> (aggregering)

seg-cc6c6bb5eb83 = <c1/>: percentiler efter nærmeste rang og middelværdi over <c2/> reproducerbare realiseringer; en enkelt kørsel klapper spredningen sammen, båndet pr. tidstrin er ordnet <c3/>, og genkørsler er bit-identiske. Det er statistisk aggregering over den allerede validerede enkeltkørsel, ikke en ny fysisk model.

seg-72a9d5de61f5 = sigma_y({ "1" } s)

seg-ebbe708d9cbc = csac-sa45s (CSAC)

seg-c43fe67d4200 = Datablad for Microchip SA65 / SA.45s

seg-e3bde4355d78 = optical-sr-lattice (Sr-gitter)

seg-87793f684233 = optisk gitterur med strontium, mål rettet mod rummet, arXiv:{ "1503.08457" }

seg-b03f5856d451 = Status: hvid FM og random walk-FM valideret; ældning modelleret og kalibreret væk; flicker-FM modelleret og valideret (slået fra som standard i de anførte scenarier).

seg-c5ff448dcb88 = Modenhed: tallene for det optiske ur er <em>målet rettet mod rummet</em> på hardware på jorden -- intet optisk strontiumur har fløjet. Sr-ure i laboratorier når { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). Tallene for CSAC stammer fra en udrullet kommerciel komponent.

seg-b59a4b8e6d88 = Relationer: Riley, NIST SP { "1065" }, lign. { "67" } -- hvid FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); random walk-FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, ækvivalent med q_rw*tau/3 for en Wiener-proces for frekvens med diffusion q_rw.

seg-dca7ee671d91 = Pakke { "2" } — inertial dødregning (kvanteinertimåleenhed)

seg-98452a081241 = Konstant/resterende bias -> position

seg-6aa386251acf = positionsfejl = familien { "0.5" }<em>b</em>T^{ "2" } (Groves AESS (Aerospace and Electronic Systems Society) Tutorial); håndudledt diskret test i <c1/>.

seg-c60c0b54c485 = Velocity random walk (hvid acceleration)

seg-7ce1f40566cf = <c1/>: simuleret standardafvigelse (SD) for positionsfejl stemmer med sigma_x(T)=sqrt(S_a*T^3/3) (Groves lign. 54) på ~{ "12" } % observeret (middelværdi over seeds; håndhævet grænse { "20" } %).

seg-8ac776795d40 = Fysik i et accelerometer med kolde atomer og interferometri (CAI) (ud fra første principper)

seg-4eafc81873ed = <c1/>: et Mach-Zehnder-interferometer med kolde atomer og tre pulser. Efterkontrolleret i hånden mod lærebogens geometri — Rb-87 <c2/>; <c3/> ved { "1" } g, <c4/>; projektionsstøj <c5/> ved <c6/>, <c7/>; pr. skud <c8/>; skaleringslovene <c9/> og <c10/>; eksponentielt henfald af kontrast. <c11/> <b>udleder</b> den hvide PSD (power spectral density) for acceleration, som den klassiske <c12/> forbruger. Ærligt omfang: kun <b>gulvet for kvanteprojektionsstøj</b> (~{ "0.09" } ug/sqrtHz her) — langt under rigtige, vibrationsbegrænsede enheder (1-50 ug/sqrtHz); vibrationstensoren, Coriolis og systematikken fra lysforskydning er endnu ikke modelleret (se <a1><c13/></a1>).

seg-ed78f40a8d80 = Gyrobias + angular random walk (ARW) -> hældning -> kobling til tyngde

seg-a73e97ac4a0e = En resterende gyrobias og ARW driver en holdningsfejl; hældningen kobler tyngden (<c1/>) ind i en horisontal fejl i den specifikke kraft. <c2/> validerer den rene bias' kubiske positionsvækst eksakt og ARW's vækst i holdning som en Wiener-proces (middelværdi over seeds). Slås til pr. sensor via <c3/> og <c4/>; slået fra i de anførte scenarier med kun accelerometer.

seg-e68d093e952a = Biasustabilitet (1/f flicker-gulv)

seg-5ad1e7d55d07 = <c1/>: en 1/f-flickerproces (den samme OU-syntese som er valideret for uret), hvis flade Allan-deviationsgulv ligger ved koefficienten for biasustabilitet; nul er en no-op, et gulv forskelligt fra nul ændrer banen, begge reproducerbare. Slås til pr. sensor via <c2/>.

seg-b631c1bfce05 = Random walk i acceleration (rate random walk)

seg-4a4a70363412 = <c1/>: biasen er en Wiener-proces med <c2/>, kontrolleret som middelværdi over seeds på ~{ "20" } %. Slås til pr. sensor via <c3/>.

seg-49c4a2532dca = Krydsvalidering mod NaveGo (støjkoefficienter for IMU (inertimåleenhed))

seg-e558aa705560 = <c1/>: en ekstern krydskontrol mod <b>NaveGo</b> (R. Gonzalez, open source-værktøjskasse til INS/GNSS (INS: inertialt navigationssystem), <c2/>). Gengiver den syntetiske rundtur i NaveGos <c3/> på dens <b>offentliggjorte referenceprofil for Microstrain 3DM-GX3-35</b>: når vores estimator for overlappende ADEV (valideret mod NBS14/Stable32) fodres med hvid sensorstøj ved NaveGos 1-σ-niveauer, genfinder den koefficienterne for velocity random walk og angle random walk (VRW, ARW) (<c4/>) på <c5/> (faktisk ~{ "0.4" } %), med den hvide støjgren ved hældningen −1/2. Bekræfter, at vores Allan-pipeline og NaveGos definitioner af VRW/ARW stemmer. Den optagede STIM300-log <c6/> på { "40" } MB indlæses ikke (låst af binært format).

seg-171b215f0526 = Skalafaktor, finere krydsakseled

seg-b690ed87f493 = <c1/> i denne pakke med 1-DOF (én frihedsgrad)

seg-c1bd4e24c091 = Den ældre pakke med én akse har ingen fejl i skalafaktor eller krydskobling. Biblioteket til strapdown med tre akser og pakken <c1/> modellerer skalafaktor, skævhed i montering, g-følsomhed, kvantisering og hastighedsrampe (<c2/>; se tabellen med påstande nedenfor).

seg-ce2b3237acfe = biasstabilitet

seg-129dc6af8f10 = rod af støjens PSD

seg-7109e60b8c9b = cold-atom-quat (kvante)

seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } t)

seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

seg-09b42bed82c9 = nav-grade-quartz (klassisk)

seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

seg-79fc524162b5 = Ærlig ramme: fordelen ved kolde atomer er <b>langtidsstabiliteten af bias</b> (~2600x lavere), som dominerer et langt GNSS-udfald via { "0.5" }<em>b</em>T^{ "2" }. Korttidsstøjen er sammenlignelig (kvante ~{ "22" } mod klassisk ~{ "20" } ug/sqrtHz) — kvantesensoren vinder maratonløbet, ikke sprinten. Modenhed: accelerometre med kolde atomer er på laboratorie-/tidligt stadie (JRC122785), kvarts af navigationsklasse er udrullet.

seg-e02e93f4f30a = Pakke { "3" } — tidsoverførsel (optisk mod radiofrekvens (RF), optisk link mellem satellitter)

seg-2b87e5f0ba7e = Hvid tidsjitter -> synkroniseringspræcision

seg-229295aa1f70 = <c1/>: simuleret RMS for synkronisering gengiver linkets jitter sigma_j; stikprøvemiddelværdien middeler som sigma/sqrt(N) på <{ "20" } % (middelværdi over seeds).

seg-4325ec478bca = Tid -> afstandsmåling i én retning

seg-aa7a1f463683 = afstand = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (eksakt, håndudledt test).

seg-7ad8bb95bf35 = Flicker-/TDEV-gulv, rest af tovejs reciprocitet

seg-5bf72778b6c2 = <c1/> (kind <c2/>): flicker-fasestøj (Kasdin–Walter, fladt TDEV), en døgnlig ikke-reciprocitet og en konstant rest af reciprocitet på tovejsserien; pakken <c3/> med hvid jitter er uændret.

seg-dae3fa0375fe = jitter for enkelt sample

seg-4a141a45a8ff = kilde

seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

seg-c78abd60ec97 = mål, der er troværdigt i kredsløb

seg-9dfc1d4334a3 = optisk link mellem satellitter, mål for synkronisering i pikosekunder; O-TWTFT i laboratorium (TWTFT: two-way time and frequency transfer) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

seg-0e730e8e2237 = målt i én session

seg-b9faad47d802 = BIPM/PTB/NIST (BIPM: International Bureau of Weights and Measures; PTB: Physikalisch-Technische Bundesanstalt, Tysklands nationale metrologiinstitut) TWSTFT

seg-51e2e5782c96 = Ærlig ramme: tallet for optisk er et mål for synkronisering på pikosekundniveau i kredsløb (ikke fløjet). Gulvet for optisk i terrestrisk laboratorium er ~{ "1" } fs (langt bedre); et velkonstrueret mikrobølgelink (mikrobølgelinket MWL i ACES (Atomic Clock Ensemble in Space), ~{ "0.3" } ps) kan konkurrere med optisk, så baseline “RF = { "0.5" } ns” er specifikt almindelig TWSTFT. Omregning til afstand er i én retning (afstand = c<em>dt); tovejs/rundtur halverer den (afstand = c</em>dt/2).

seg-5fa72f18f983 = Pakke { "4" } — hybrid fusion (slutsten)

seg-3de12b094504 = Sammensætter Pakke { "1" } (ur), Pakke { "2" } (inertial) og Pakke { "3" } (tidsoverførsel) til én PNT-suite (positionering, navigation og tidssynkronisering). Suiten skal holde BÅDE tid (< specifikation for tid) og position (< specifikation for position) inden for grænserne; <c1/> er tiden, indtil en af dem brydes. Valgfri tidsoverførsel via optisk link mellem satellitter (ISL) synkroniserer uret igen under udfaldet (kun støtte til tid — positionen synkroniseres ikke igen, da tidsoverførsel giver tid, ikke position).

seg-4f7cd8f86565 = Aspekt

seg-19deb2a3537c = Samlet PNT-scoring (tid OG position)

seg-77a7595ffad7 = <c1/> håndudledt <c2/>-test (pnt_holdover = den første af tid/position, der brydes).

seg-d0e39bf123d8 = Integritet + sikkerhed for hybrid-pakken

seg-3fb63eb2b6b8 = <c1/>: en Kalman-estimator for tid, disciplineret mod sandheden (nominelt) og genforankret ved hver optisk resync; Integrity er indeslutning i beskyttelsesgrænsen (grænsen indeholder linkets jittergulv), Security er scoren for spoofing-detektion. Testet for begge suiter, også tilfældet med linkstøtte.

seg-c3be96b7cb41 = Fælles fusionsestimator

seg-e9d5448ea06c = <c1/>: ét fælles Kalman-filter ([fase, frekvens] ⊕ [pos, hast]) er navigatoren, disciplineret af GNSS (lærer offsets ud fra en kovarians forskellig fra nul i starten) og støttet af tidsoverførsel; den fælles kovarians giver en fælles integritet, der er testet pålidelig (≥{ "0.9" }) for begge suiter med støjkonsistente sensorer. Pakken observerer position og tid <b>hver for sig</b>, hvortil det optimale filter er blokdiagonalt; estimation af konstant bias med udvidet tilstand og dynamisk krydsstøtte er fremtidigt arbejde.

seg-915ec766439f = Koblet filter for ur+position (kovarians på tværs af blokke)

seg-fd718a51859a = <c1/>: ét stablet Kalman-filter <c2/> (opdateringer i Josephs form), hvis <b>pseudoafstands</b>-måling <c3/> kobler positions- og urblokkene. Tests: en fælles pseudoafstand får <c4/> til at afvige fra nul (afkoblede filtre holder den nøjagtigt på { "0" }); to forskellige geometrier løser i fællesskab indsprøjtede positions- og uroffsets, som en enkelt afstand ikke kan adskille; en <b>kun-ur</b>-positionsbestemmelse skærper <b>positionen</b> gennem krydskovariansen (det udbytte, koblingen giver, og som afkoblede filtre ikke kan); og en Monte Carlo-<b>NEES er χ²({ "4" })-konsistent</b> (Bar-Shalom §{ "5.4" }, kørselsbaseret bånd). 1-DOF (pakkens dimensionalitet); endnu ikke koblet ind i den kørbare pakke, og udvidelsen til 3-D med 8 tilstande er fremtidigt arbejde.

seg-31ecf062b941 = Sammensætning af validerede delmodeller

seg-9b849cb4fe8d = arver

seg-4e1c8b6791f3 = led for ur/inertial/tidsoverførsel er valideret i deres egne pakker.

seg-b672e5499976 = Løst koblet GNSS/INS (pakken <c1/>)

seg-277425f2cbcf = <c1/>: en EKF med fejltilstand og 15 tilstande (δp, δv, ψ, bias i accel/gyro; Groves §{ "14" }) driver strapdown-navigatoren med tre akser med tilbagekobling. Tests: en indsprøjtet positionsfejl nulstilles under støtte med perfekt sandhed; den støttede løsning forbliver afgrænset til meter, mens en frit kørende INS divergerer forbi { "100" } m; og den fusionerede positions-RMS over et udfald på { "60" } s slår uunderstøttet dødregning med ensembletestens grænse (~{ "4" }× målt før { "0.27.3" }; marginen er større efter rettelsen nedenfor). Koblingen med gyrobias kontrolleres mod strapdown selv: en kendt resterende gyrobias skal give den holdningsfejl, filteret forudsiger (<c2/>), og en bred prior skal lære en gyrobias af flykontrollerklasse, mens den forbliver afgrænset; begge fejler med fortegnet før 0.27.3. <b>Revideret i { "0.27.3" }:</b> koblingen havde forkert fortegn, så estimater af gyrobias skubbede den forkerte vej, og kun en stram prior holdt pakken stabil; de offentliggjorte tal for udfald ændrede sig (CHANGELOG, Fixed). Ærlig grænse: ved løs kobling kan bias i accel og hældning kun svagt adskilles, så kalibrering pr. bias påstås ikke.

seg-1c9a9f76a432 = Tæt koblet GNSS/INS (pseudoafstand)

seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: innovationen dannes i afstandsdomænet (Jacobi-matrix for sigtelinjen på δp). Tests: fire satellitter nulstiller en indsprøjtet horisontal fejl på { "8" } m/−{ "5" } m til < { "0.1" } m; <b>to satellitter</b> (ingen bestemmelse af position, hastighed og tid (PVT) mulig) skærer stadig den horisontale fejl med > { "5" }×; en enkelt satellit lige overhead observerer kun komponenten langs sigtelinjen (den vertikale) og lader den horisontale være urørt; fejlbehæftede inputs afvises. Kun pseudoafstand — bærebølgefase og en eksplicit tilstand for modtagerens ur er på køreplanen.

seg-240b681b6021 = Troskab i krydsstøtte mellem sensorer (fuld Kalman-/faktorgraf-fusion)

seg-efe7e288276b = <c1/> i pakken <c2/>

seg-e5371874c57d = Hybrid-pakken er en sammensætning på systemniveau + tidsstøtte, ikke en optimal estimator. Filtre findes andre steder: den løst og tæt koblede EKF (extended Kalman filter) i pakken <c1/> (rækkerne ovenfor) og UKF'en med 17 tilstande (unscented Kalman filter) i kind <c2/>. Ingen faktorgraf-smoother er modelleret.

seg-189758709fd2 = Resultat: den helt kvantebaserede suite holder fuld PNT gennem et udfald på { "1.8" } t; den helt klassiske suite er <b>begrænset af positionen</b> (IMU af navigationsklasse bryder først). Tidsoverførsel via optisk ISL holder selv det klassiske UR låst og isolerer inertialsensoren som den klassiske suites svage led — kerneargumentet for kvanteinertial + optisk tidssynkronisering sammen.

seg-a4c5b45ea8a5 = Geometri — GNSS-tilgængelighed ud fra baner

seg-d347bb63c1fd = Cirkulær propagering med to legemer

seg-60c369fbbd97 = <c1/>: periode <c2/> (mu = { "3.986004418e14" }), positionen vender tilbage efter én periode, planaritet ved ækvator/pol — håndudledte tests.

seg-1260a2fef95f = Excentrisk (Kepler-) propagering

seg-49df9d526f9c = <c1/>: Keplers ligning <c2/> løst med Newton (rest < { "1e-12" }); radier i perigæum/apogæum <c3/>; det cirkulære tilfælde stemmer med stien i lukket form på { "1e-9" }.

seg-958f03424508 = J2 sekulær drift af knude/apsider

seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); knuden regredierer (prograd) / rykker frem (retrograd) / er stationær (polær), og apsiderne fryser ved den kritiske inklination { "63.4" } grader — håndudledte test af fortegn/nul. Kun to legemer + sekulær, ikke oskulerende.

seg-dcba8d368326 = Sigtelinjesynlighed (jordens afskærmning + elevationsmaske)

seg-2eee9a8f894b = Antipodal satellit afskærmet, radialt udadgående satellit ved { "90" } grader elevation, tangentiel satellit på horisonten — eksakte håndudledte tests.

seg-f251c75eb367 = Synlighed -> GNSS-tilstand -> tidslinje

seg-70fbb9f3cc2b = <c1/> synlige = nominel, 1-3 forringet, { "0" } nægtet; Walker-delta-generator; integrationstest driver en kørsel med ur-holdover ud fra den afledte tidslinje.

seg-988d3fedb7f5 = Optimering af konstellationsudformning + geometri for dækningsstriber (streets of coverage)

seg-2a636487a4e6 = <c1/>: <c2/> gennemsøger gitteret <c3/> og returnerer den celle, der bedst opfylder et <c4/> (færrest satellitter for et dækningsmål / størst dækning / laveste værste PDOP (PDOP: position dilution of precision)) — en test hævder, at valget er lig med en uafhængig brute-force-scanning af det samme sweep, og et gennemarbejdet eksempel bekræfter, at en GPS-udformning (Global Positioning System) Walker 24/6/1 dækker mindst lige så godt som en udtyndet med 18 satellitter. De analytiske lukkede former for <b>streets-of-coverage</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) er efterkontrolleret i hånden mod lærebogens geometri (GPS ved en maske på { "5" }°: λ ≈ { "71.16" }°, halv bredde af striben med 4 satellitter ≈ { "62.83" }°) og opdager hullet ved for få satellitter (<c9/>). Den fulde løser fra Rider for færrest satellitter til <em>global</em> dækning (antallet af baneplaner, som er følsomt over for sømmen) er endnu ikke implementeret.

seg-a1c1364cc45a = Præcisionsfortynding (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometric dilution of precision; HDOP: horizontal dilution of precision; VDOP: vertical dilution of precision; TDOP: time dilution of precision)) -> positionsnøjagtighed

seg-a1706d47f895 = <c1/>: <c2/> ud fra designmatricen for sigtelinjen. <b>Ekstern uafhængig reference</b> (<c3/>): de fem DOP-faktorer gengiver dem, som <b>gnss_lib_py { "1.0.4" }</b> beregner (Stanford NAV Lab — et uafhængigt, fagfællebedømt GNSS-bibliotek, brugt her, som ERFA (Essential Routines for Fundamental Astronomy) bruges til referencesystemerne), over <b>{ "8" } geometrier</b> fra veltilpassede til næsten singulære (DOP i hundredvis), på <b>{ "1e-6" }</b> relativt; proveniens + regenerering i <c4/>. Som en ekstra kontrol i lukket form gengiver en geometri med regulær tetraeder de analytiske DOP'er (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) på { "1e-9" }. Positions-sigma = PDOP × brugerens ækvivalente afstandsfejl.

seg-504d5aa92cbc = Positionsfejl = σ_UERE × DOP for motorens egen mindste-kvadraters-positionsbestemmelse

seg-fc3443210358 = <c1/>, <c2/>: en Monte Carlo med seed (N = { "20,000" } epoker pr. geometri, σ = { "1.5" } m, ChaCha8-seed { "36" } + i) af <c3/> med enhedsvægte, løst fra den sande position, på <b>de { "8" } geometrier i <c4/></b> (dem hvis DOP er matchet med gnss_lib_py), mod σ²·Q, hvor Q er kovariansfaktoren for selve kernen <c5/> (<c6/>, den samme aritmetik). <b>Tolerancer præregistreret</b> (commit e50c88d2, før den første kørsel, efter designnotatet for geometri for { "0.36" }, afsnit { "5.2" }), hver et antal standardfejl: varianser for øst, nord, op og ur inden for { "5" } %; RMS for H/V/P inden for { "2.5" } %; korrelation mellem øst og nord inden for { "0.035" }; middelværdier inden for { "5" } standardfejl; andelen i den horisontale ellipse på { "95" } % inden for { "0.95" } ± { "0.0077" }. Første kørsel: alle { "104" } kontroller består (værste varians { "3.2" } %, RMS { "1.6" } %, korrelation { "0.012" }, middelværdi { "2.2" } standardfejl, ellipse { "0.0039" }). <b>Negative kontroller</b> fejler som krævet: fordoblet PDOP fejler på hver geometri; fejl, der vokser som 1/sin(elevation) mod den uvægtede Q, fejler en variankontrol på hver geometri, hvis laveste satellit ligger under { "20" }°. <b>Hvordan det hænger sammen med rækken ovenfor:</b> den række validerer disse geometriers DOP mod gnss_lib_py; denne tilføjer trinnet fra disse faktorer til meter gennem motorens løser. <b>En første, separat kontrol er bevaret ved siden af</b> (<c7/>, <c8/>, kørt før præregistreringen og meldt som sådan): fire håndvalgte himle (åben, klynget, kanyon, halv himmel; σ { "1" } m) med chi-i-anden-konfidensintervaller på { "1e-6" } samlet over { "20" } kontroller; forhold { "0.987" } til { "1.009" }, og dens egne negative kontroller (en DOP-fejl på { "10" } %, fejl som 1/sin(elevation)) fejler som krævet. <b>Hvorfor MODELLED:</b> intet eksternt datasæt; det viser ikke, at en rigtig modtagers fejl følger modellen, og σ_UERE er et input.

seg-94bffbd8385b = Tilgængelighed med flere konstellationer

seg-a40eab03bbbe = <c1/>: yderligere <c2/> flettes til ét satellitsæt for synlighed/DOP; en test af det samlede antal bekræfter foreningsmængden.

seg-0b905100d91c = Udsendt ionosfære (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → skrå forsinkelse på L1

seg-05e278f04770 = <c1/>: <c2/>, den udsendte enkeltfrekvensmodel med otte koefficienter. <b>Ekstern uafhængig reference</b> (<c3/>): den skrå forsinkelse på L1 gengiver <b>RTKLIB'ens (et open source-bibliotek til real-time kinematic-positionering) <c4/></b> (tomojitakasu/RTKLIB, <c5/> — den faktiske åbne GNSS-reference, kompileret fra kildekode og kørt uafhængigt) over <b>{ "10" } tilfælde</b> med variation i elevation, azimut, lokal tid og to koefficientsæt (kshanas standard + RTKLIBs), på <b>< { "1e-4" } m</b>. Læseren af IONEX-TEC-kort (IONosphere map EXchange format; TEC: total electron content) for GIM-filer (global ionosphere map) findes nu (<c6/>, <c7/> med bilineær interpolation i rum og tid og en skrå afbildning, enhedstestet i selve cratet); en krydskontrol af den interpolation mod et rigtigt GIM-produkt fra CODE (Center for Orbit Determination in Europe) er stadig en opfølgning. Selve den udsendte model er eksternt valideret.

seg-39e235557ecc = Detektionskerne for RAIM/ARAIM (ARAIM: advanced receiver autonomous integrity monitoring) (χ² / ikke-central χ² / normal) → tærskler og multiplikatorer

seg-8906f922b9b9 = <c1/>: detektionstærsklen for snapshot / solution-separation / ARAIM (<c2/>), den ikke-centralitet <c3/> for oversete detektioner (<c4/>) og multiplikatorerne K_fa/K_md/K_V (<c5/>) beregnes alle ud fra en afhængighedsfri regulariseret ufuldstændig gammafunktion. <b>Ekstern uafhængig reference</b> (<c6/>): <b>{ "171" } tilfælde</b> gengiver <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> — en uafhængig implementering fra Cephes/Boost, en anden algoritme) over driftsområderne for P_fa / P_md / redundans, på <b>≤ { "1e-6" } relativt</b>. Geometrien, der omgiver kernen (hældning/kovarians fra <c11/>), er DOP-kernen, der er valideret mod gnss_lib_py. <b>Omfang:</b> denne række fastlåser den <em>statistiske kerne</em>. <em>Værdien</em> af beskyttelsesniveauet i ARAIM MHSS-allokeringen (multiple-hypothesis solution separation) er fastlåst separat mod det offentliggjorte gennemarbejdede eksempel fra WG-C (Working Group C) ARAIM Technical Subgroup (<c12/>, VPL (vertical protection level) { "18.2926" } m mod { "18.3" } m, HPL (horizontal protection level) { "13.4063" } m mod { "13.45" } m, inden for referencens egen tolerance på { "0.05" } m; se noten om standarder nedenfor og <a1><c13/></a1>).

seg-b17f1501a267 = Beskyttelsesniveau for SBAS (satellite-based augmentation system) (DO-229E bilag J) → horisontalt / vertikalt beskyttelsesniveau (HPL / VPL)

seg-abe00b67e4cb = <c1/>: <c2/>, den vægtede <c3/> med mindste kvadrater (LS: least squares) → hovedakse i den horisontale fejlellipse + vertikal σ, skaleret med K-faktorerne i DO-229E. <b>Ekstern uafhængig reference</b> (<c4/>): kshanas HPL gengiver <b>RTKLIB SBAS-PL-forken</b> (<c5/> <c6/>, implementeringen af “DO-229D Appendix J” af Siki & Takács { "2017" }), kørt med <c7/> på <b>rigtige EGNOS-data (European Geostationary Navigation Overlay Service)</b> (udsendte meddelelser for GEO (geostationær bane) PRN120 + rigtig BUTE/Budapest-RINEX (Receiver Independent Exchange Format), 2017-02-19), over <b>{ "6" } epoker</b> på <b>< { "2e-3" } m</b>. σ pr. satellit er referencens eget fulde SBAS-budget (UDRE (user differential range error) + GIVE (grid ionospheric vertical error) iono + tropo + airborne). ESA gLAB { "v6.0.0" } (<c8/>) blev kompileret og bekræftet til at bruge den identiske konvention. <b>Note om K_V:</b> begge uafhængige referencer afrunder MOPS (minimum operational performance standards) K_V → { "5.33" }; kshana bruger den eksakte <c9/> (~{ "0.06" } % mindre VPL), så den vertikale er valideret som den K-faktorfrie <c10/> (= referencens VPL / { "5.33" }). HPL matches direkte (K_H = { "6.0" } på begge sider).

seg-fd16d642cafd = Rigtig konstellationsgeometri ud fra TLE'er (linje 2 / Kepler)

seg-1311ef1cb4bb = <c1/> (parsing)

seg-5117debbce89 = <c1/>: parser de gennemsnitlige Keplerelementer på linje 2 (halv storakse ud fra den gennemsnitlige bevægelse); et kendt elementsæt for ISS (International Space Station) går rundt og giver de rigtige elementer og periode. For en blok med kun linje 2 er propagering motorens to legemer (+ valgfri J2) af de <em>gennemsnitlige</em> elementer — sundt for et snapshot fra en fælles epoke, med drift i forhold til SGP4 (Simplified General Perturbations { "4" }) over tid.

seg-26d22e76e28d = Propagering med SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (fulde TLE'er)

seg-1099f1bffa01 = <c1/>: fuld SGP4 nær Jorden + SDP4 i det dybe rum (sekulære/periodiske led fra Måne og Sol + geopotentialresonans på { "12" } t / { "24" } t). Valideret i <c2/> mod de officielle vektorer i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 (“Revisiting Spacetrack Report #3”) — alle { "666" } referencetilstande (nær Jorden, dybt rum, resonante, tilfælde med fejlkode) stemmer med en værste positionsfejl på ≈ { "4.1" } mm. Et fuldt sæt med to linjer (linje { "1" } + linje { "2" }) propageres med SGP4; kun linje 2 forbliver Kepler; de to kan blandes. Referencesystemet er TEME (true equator, mean equinox), brugt konsekvent for brugeren og satellitterne (ingen reduktion fra TEME→ECEF (ECEF: Earth-centred, Earth-fixed) — tilstrækkeligt til geometri for tilgængelighed/DOP).

seg-c8fc6a49d249 = Nutation IAU (International Astronomical Union) 2000A / 2000B + reduktion fra TEME→GCRS (GCRS: Geocentric Celestial Reference System)

seg-b31c49596100 = <c1/>: den <b>fulde IAU 2000A</b>-række ({ "678" } luni-solare + { "687" } planetariske led, <c2/>) og trunkeringen 2000B med 77 led (<c3/>) er hver især valideret <b>bit for bit</b> mod de offentliggjorte referencevektorer fra SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) ved JD_TT { "2453736.5" } — <c4/> giver Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> giver Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — begge på <b>{ "1e-13" } rad</b>. Tabellen for 2000A er maskingenereret ud fra ERFA-kilden <c6/> af <c7/> (gengiver den committede <c8/> bit for bit). Nutationsmatricen (<c9/>), ækvinoktiets ligning og den fulde kæde TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) (<c10/>, Vallado AIAA-2006-6980) er testet for egenskaberne ægte rotation/rundtur/præcession-plus-nutation, nutationsmatricen mod ERFA <c11/> element for element på { "1e-14" }, og hele kæden TEME→GCRS mod Vallados offentliggjorte eksempel TEME→GCRF (AIAA 2006-6753, 2004-04-06) på <b>{ "0.11" } m</b> (<c12/>); indtil den kontrol fra ende til anden blev tilføjet, bar nutationsmatricen Δψ med forkert fortegn, en drejning på { "2" }·Δψ (omkring { "25" }″), som egenskabstestene ikke kunne se (se CHANGELOG, Unreleased, Fixed); 2000A mod 2000B stemmer på < { "1" } mas som krævet. Kæden er baseret på ækvinoktium/GMST (GMST: Greenwich mean sidereal time); reduktionen med CIO (X,Y,s) uden ækvinoktium og dens uafhængige numeriske krydskontrol mod ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — et rent Rust-værktøj til planetgeometri; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m ved GNSS-bane, godt inden for målet på < { "10" } m) findes i rækken for CIO nedenfor.

seg-0be3c40cc81a = IGRF-14 (IGRF: International Geomagnetic Reference Field) model for Jordens geomagnetiske hovedfelt

seg-9dbb3b1b18a1 = <c1/>: IAGA's Schmidt-normaliserede sfærisk-harmoniske felt (grad/orden { "13" }, { "2025.0" } + sekulær variation; koefficienter maskingenereret ud fra den officielle <c2/> af <c3/>, gengiver <c4/> bit for bit). Valideret på fem uafhængige fronter: ({ "1" }) eksakte stikprøver af koefficienter mod IAGA-filen (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) syntesen af grad 1 gengiver det <b>eksakte felt fra en hældende dipol i lukket form</b> <c5/> på { "1e-6" }; ({ "3" }) det <b>fulde analytiske felt af grad 13 er lig med −∇V</b> af det skalare potentiale (finite differences, på { "1e-4" }) — hvilket afprøver Legendre-afledede og leddet 1/sinθ fra ende til anden; ({ "4" }) dipolaksen gengiver den kendte <b>geomagnetiske nordpol</b> (~{ "80.7" }°N, −{ "72.7" }°E) og <b>dipolens styrke</b> (~{ "29.7" } µT), og det globale felt ligger i det fysiske bånd på { "22" }–{ "67" } µT med det rigtige fortegn for inklination på hver halvkugle; og ({ "5" }) <b>ekstern uafhængig reference</b> — den fulde syntese gengiver værdierne fra den officielle <b>webtjeneste for IGRF-14 fra British Geological Survey</b> ved { "2025.0" } (geodætisk, WGS-84-højde (WGS: World Geodetic System)) på <b>< { "2" } nT</b> for X/Y/Z/F og <c6/> for D/I i fire punkter, herunder { "400" } km højde (<c7/>).

seg-c1027d5ffc44 = Reduktion fra GCRS↔ITRS (ITRS: International Terrestrial Reference System) baseret på CIO, IAU 2006/2000A

seg-aad81285e8cf = <c1/>: kæden fra himmelsystem til jordsystem uden ækvinoktium. CIP-koordinaterne (Celestial Intermediate Pole) <c2/> og CIO-lokatorserien <c3/> med 66 led er valideret <b>bit for bit</b> mod den offentliggjorte SOFA/ERFA-vektor <c4/> ved JD_TT { "2453736.5" } — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); matricen GCRS→CIRS (CIRS: Celestial Intermediate Reference System) mod <c5/> (alle ni elementer på { "1e-12" }); jordens rotationsvinkel (ERA) mod <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). Tabellen <c7/> er maskingenereret ud fra ERFA-referencen <c8/> af <c9/> (gengiver <c10/> bit for bit). Den fulde <c11/> (CIO <c12/> = polbevægelse · ERA · GCRS→CIRS) er testet for ægte rotation + rundtur og vist konsistent med den ældre reduktion af TEME efter ækvinoktium/GMST-1982 inden for { "1" } m ved en radius på { "7 000" } km (konventionerne adskiller sig med omkring { "5" } cm dér). <b>Uafhængig krydskontrol fra tredjepart (<c13/>):</b> den samme <c14/> sammenlignes med <b>ANISE</b> (den rene Rust-genimplementering af NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)), der roterer GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) fra JPL's (Jet Propulsion Laboratory) <c15/>, med <b>identiske parametre for jordens orientering fra IERS (International Earth Rotation and Reference Systems Service) <c16/> givet til begge sider</b>, over otte kvartalsvise epoker { "2020" }–{ "2023" }. De to uafhængige realiseringer af referencesystemet stemmer inden for en <b>maksimal relativ rotation på { "0.028" }″ — ≤ { "0.86" } m på jorden, ≤ { "0.93" } m i LEO (lav jordbane), ≤ { "3.6" } m ved GNSS-bane</b> (middelvinkel { "0.023" }″). Det er krydskontrollen af referencesystemer på “< { "10" } m” fra ROADMAP, <b>leveret</b>; resten er den forventede forskel i model/datum mellem ITRF93 og IERS-2010-CIO, ikke en defekt (det bit-for-bit-ankerpunkt forbliver vektorerne fra SOFA/ERFA ovenfor). ANISE er en crate under MPL-2.0 (MPL: Mozilla Public License) / edition 2024, så kontrollen ligger i en selvstændig undercrate uden for workspacet, som aldrig rører den udgivne afhængighedsgraf for <c17/> eller nogen standardgate i CI.

seg-fa5889f379d2 = Rundtur ved eksport til SP3 (Standard Product { "3" }, det præcise baneformat) (konstellation → SP3-c → parse igen)

seg-cd53434eba3a = <c1/>: det rigtige Celestrak-udtræk <c2/> ({ "30" } GPS-satellitter) propageres med SGP4, eksporteres til SP3-c (<c3/> → <c4/>), parses igen (<c5/>), og de genfundne ECEF-positioner sammenlignes med SGP4-sandheden ved hver epoke over { "24" } t — værste rest <b>< { "0.5" } m</b> (skriverens serialisering i millimeter; milepælens tolerance på { "10" } m i TLE-klassen (TLE: two-line element set) er opfyldt med stor margin). Stien <c6/> i CLI (kommandolinjegrænseflade) er også dækket: det medfølgende bane-scenarie eksporterer en SP3 med 30 satellitter, der kan parses igen, og et scenarie uden bane afvises.

seg-fa5ee52e59aa = Rigtig GPS-konstellationsgeometri ud fra TLE'er (SGP4 → ECEF)

seg-1329a53ca94c = <c1/>: et ægte <b>Celestrak-udtræk <c2/></b> (2021-07-28, { "30" } operationelle GPS-satellitter; proveniens i <c3/>) parses, og hver satellit propageres gennem den validerede SGP4-kerne til et fælles tidspunkt, roteret TEME→ECEF. Hævder, at hele konstellationen lander på GPS-skallen i mellemhøj jordbane (MEO) inden for { "1" } %, og at alle satellitter i sigte (ni satellitter) fra et sted på mellembredde med åben himmel giver PDOP { "1.64" }, hvor den vertikale fortynding overskrider den horisontale (som den skal for en bruger på jorden). Det afprøver SGP4 på en rigtig konstellation sammen med de rigtige datastier for SP3 (præcis) og RINEX (udsendt).

seg-a1b7d74bbe02 = Walker-generator med gennemsnitlige SGP4-elementer

seg-01f1635b75e4 = <c1/>: et udformet Walker-delta-mønster udsendes som gennemsnitlige SGP4-elementer (Kozai-gennemsnitsbevægelse valgt, så den halve storakse i SGP4 lander på målskallen) og propageres gennem den validerede kerne. Tests: en Walker med 24 satellitter af GPS-typen ligger på MEO-skallen inden for { "1" } %, baneplanerne er adskilt nøjagtigt { "90" }° i RAAN (right ascension of the ascending node) genfundet ud fra banenormalerne, og gennemsnitsbevægelsen gengiver GPS-skallens periode på ~{ "718" } min.

seg-6e8c472ec9fa = Sweep af PDOP for konstellation + kvalitetsmål (FoM) for dækning/genbesøg

seg-dcdbf9c78ca5 = <c1/> (monotoni)

seg-5a70f090db45 = <c1/>: <c2/> stiller dækning og median/værste PDOP op i en tabel over et gitter <c3/>; <c4/> melder dækningsandelen og hullerne i genbesøg i et punkt på jorden. Valideret ved de fysiske monotonier, en designafvejning skal overholde: tilføjelse af satellitter sænker aldrig dækningen og sænker strengt median-PDOP (en fuld udformning med 24 satellitter dækker kontinuerligt ved PDOP ~{ "1.7" }), og fortætning af en udtyndet konstellation forkorter strengt det værste hul i genbesøg. Det gennemsnitlige hul i genbesøg overstiger aldrig maksimum. Det er tabeller til afvejning af geometri, ikke et certificeret link-/dækningsbudget.

seg-9f0747d71ecc = Ærlig ramme: dette er et deterministisk geometrilag (cirkulære baner, kugleformet Jord med middelradius { "6371" } km, ren sigtelinje). Det fastslår <em>tilgængelighed</em> og den <em>geometriske</em> positionsnøjagtighed (præcisionsfortynding × et repræsentativt budget for afstandsfejl) ud fra rigtig geometri, ikke en navigationsløsning med præcise efemerider. Referencen <c1/> placerer et rumfartøj inde i GNSS-skallen: det har kun en positionsbestemmelse ~{ "59" } % af døgnet, kvanteuret holder en tidsløsning på { "5" } ns gennem hvert hul (tilgængelighed { "1.0" }), mens chipskala-uret når ~{ "0.73" }.

seg-e2c433c35ba8 = Numerisk propagator (Cowell) og kraftmodel

seg-20ace4e0a710 = Den numeriske propagator (<c1/>) integrerer en hierarkisk kraftmodel (<c2/>) med de adaptive integratorer (<c3/>). Hvert led nedenfor er valideret mod analytisk sandhed eller en håndudledt lukket form; forstyrrelserne er <b>slået fra som standard</b>, så de udgivne gyldne værdier er urørte. Den sammensatte model er også krydskontrolleret mod et andet værktøj: <c4/> kører { "11" } tilfælde i LEO og GTO (geostationary transfer orbit), { "275" } timeepoker, mod propagatoren DormandPrince853 i Orekit { "12.2" }, og de konservative trin (to legemer → J2–J6 → Sol/Måne → SRP med kanonkugle) stemmer på højst { "0.08" } m over { "24" } t (VALIDATED i matrixen); trinnet med luftmodstand er kun karakteriseret ({ "333" } m) og forbliver MODELLED.

seg-ec74e57ff801 = Cowell-propagator mod analytisk Kepler-sandhed

seg-8d773778ff0e = <c1/>: den uforstyrrede (to legemer) bane gengiver den <b>eksakte Kepler-løsning med universelle variable på under en meter over en LEO-bane på { "24" } t</b> (en strammere grænse end "mod en numerisk reference < { "10" } m"); specifik energi og impulsmoment bevares på ~{ "1e-9" } relativt; J2-regressionen af knuden gengiver den lukkede <c2/> efter første ordens teori (inden for { "2" } %, resten af orden O(J2²)). <c3/> returnerer <c4/> frem for et stille forkert svar, når Newton ikke konvergerer (nær perigæum e = { "0.999" }). Den robuste <c5/> (starter fra Markley { "1995" }, <c6/>) konvergerer dér og over { "0" } ≤ e ≤ { "0.999999" } inden for { "0.9" } ε·|E| af rødder i mpmath med 50 cifre (<c7/>).

seg-549d15780f79 = Adaptive integratorer (RK4 (Runge–Kutta af fjerde orden) med trindobling + det indlejrede par Dormand–Prince RK5({ "4" }), DP5({ "4" }) nedenfor)

seg-1fcc7553c627 = <c1/>: RK4 integrerer <c2/> på < { "1e-9" }, viser et fald i fejlen på ~{ "16" }× pr. halveret trin (konvergens af 4. orden) og bevarer den harmoniske oscillator over en periode. Det indlejrede fejlestimat for DP5({ "4" }) er <b>O(h⁵)</b> (halvering af trinnet skærer det ~{ "32" }×), integrerer oscillatoren over { "50" } perioder med bevarelse af energi på < { "1e-6" } og når det samme slutpunkt ved samme tolerance med <b>færre funktionsevalueringer</b> end trindobling; <c3/> klarer den samme Kepler-grænse på under en meter og stemmer med RK4-stien på < { "1" } m på en J2..J6-bane. <b>DOP853</b> (<c4/>): Hairers par { "8" }({ "5,3" }) med tæt output gengiver SciPy { "1.18.1" }s DOP853 trin for trin (enkelt trin inden for { "5.6e-15" }; identiske antal trin på kørslerne med e = { "0.7" } og Arenstorf, ét skift mellem accept/afvisning i { "501" } trin på LEO-kørslen; sluttilstande inden for { "1.6e-12" }) og stemmer med den eksakte Kepler-løsning lige så tæt som SciPy (<c5/>).

seg-345ae1eb05ec = Zonalt harmonisk felt J2–J6

seg-a88e67186e69 = <c1/>: <c2/> kontrolleres på tre måder — den <b>reduceres til den <c3/>, der er valideret med 666 vektorer, til maskinpræcision</b>, når den begrænses til <c4/>; den <b>stemmer med den numeriske gradient af sit eget zonale potentiale</b> gennem hele J2..J6-feltet (guldstandarden for konservative felter); og de ulige led <c5/> mod de lige led <c6/>/<c7/> viser den karakteristiske (anti)symmetri nord–syd under <c8/>. En propageret J2..J6-bane bevarer den samlede energi på ~{ "1e-8" } over et døgn.

seg-5536986d9c8f = Tyngde fra tredje legeme (Sol og Måne)

seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>stemmer med den eksakte gradient af sit forstyrrende potentiale</b>, forsvinder i geocentret og rammer lærebogens størrelser i LEO (~{ "5e-7" } m/s² Sol, ~{ "1.1e-6" } m/s² Måne). Efemeriden for Solen med lav præcision fra Montenbruck–Gill rammer håndudledte ankerpunkter i J2000 (afstand i perihelium ≈ { "1.471e11" } m, ~−{ "23" }° deklination ved solhverv, ~{ "1" }°/dag bevægelse); Månens efemeride holder sig inden for sin kuvert for perigæum/apogæum, genfinder middelafstanden på ~{ "384 400" } km, overskrider aldrig inklinationen på { "5.3" }° og vender tilbage til inden for { "1" }° efter én siderisk måned. Koblingen af den epokestyrede højre side (RHS) er <b>bit-eksakt</b> (RHS-leddet er lig med <c4/> i den samplede position ved t = { "0" } og t = { "1" } dag), og et skift af epoken med et kvart år giver en anden bane.

seg-9c8756f9d534 = Solstrålingstryk (SRP) + konisk skygge

seg-e6110e015204 = <c1/>: <c2/> (kanonkugle <c3/>) er <b>bit-identisk</b> med den lukkede form i fuldt solskin, fastlåser <b>strålingstrykket ved 1 AU (AU: astronomisk enhed) til ≈ { "4.5398e-6" } N/m²</b>, ligger i båndet ~{ "1.36e-7" } m/s² i LEO med skub væk fra Solen, fjerdedeles, når afstanden til Solen fordobles (omvendt kvadrat), og er <b>præcis nul</b> dybt i umbraen. <c4/> giver <c5/> i fuldt solskin og <c6/> i total umbra (eksakt), en jævn monoton penumbra, der stiger { "0" } → { "1" } over båndet <c7/>, som <b>rækker ud over umbra-cylinderen</b>.

seg-17b48db4038b = Atmosfærisk luftmodstand (første hastighedsafhængige led)

seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado tabel 8-4, stykkevis eksponentiel) <b>forankres ved { "1.225" } kg/m³ ved havets overflade</b>, begrænses under overfladen, aftager monotont gennem LEO, ligger i et bånd omkring ~{ "1e-12" } kg/m³ ved { "400" } km med en fysisk genfundet skalahøjde på ~{ "58" } km; <c3/> modvirker den medroterende relative hastighed med en størrelse på ~{ "2e-6" } m/s², som er typisk i LEO. Signaturkontrollen: en bane i { "300" } km højde mister specifik energi <b>monotont</b>, og dens store halvakse aftager med en afgrænset størrelse på ~km/dag, mens vakuum-baselinen bevarer energien med mindre end { "1e-9" }.

seg-133eed361425 = Post-newtonsk (Schwarzschild) relativistisk korrektion

seg-c8e26480f148 = <c1/>: <c2/> (IERS-formen <c3/> <c4/>) går i en cirkulær bane over i den lukkede form <c5/> (radial, <b>udadrettet</b>, komponenter uden for aksen nøjagtigt nul), viser det lærebogsmæssige <b>forhold på <c6/> i LEO i forhold til tolegemeløsningen</b>, stemmer med den håndforenklede form med radial hastighed <c7/> til bedre end { "1e-12" }, og i propagatoren <b>forstyrrer den banen, mens den store halvakse holdes inden for under en meter/dag</b> — det konservative modstykke til luftmodstandens henfald.

seg-d39e75019595 = Ærligt omfang: de udgivne standardindstillinger for <c1/> integrerer det zonale felt. Det højgradede EGM2008-<b>tesseralfelt</b> (<c2/>, grad/orden { "70" }), de faste/oceaniske/atmosfæriske <b>tidevand</b> (<c3/>) og <b>Lense–Thirring</b>-leddet for medslæbning af referencesystemet er nu implementeret og indgår i den præcise kraftmodel til tilpasning af efemerider (<c4/> — se nedenfor). Tesseralfeltet er desuden et valgfrit led i Cowell-<c5/> (<c6/>, som standard slået fra) og er valideret mod Orekit { "12.2" } <c7/> op til grad/orden { "70" } ({ "6" } tilfælde over { "24" } timer, værste |Δr| { "0.036" } m; <c8/>). Der findes to felt-evaluatorer: den historiske <c9/> (sfæriske partielle afledede; gyldig til grad ~{ "180" } væk fra polerne; output er fastlåst) og <c10/> (Holmes–Featherstone { "2002" }, modificeret fremadrettet søjlerekursion, gradient uden 1/cos φ; gyldig til grad { "2190" } ved enhver breddegrad). EGM2008 til { "2190" } indlæses ved kørsel (<c11/>, <c12/>, ikke medleveret). <c13/> stemmer med Orekit { "12.2" } inden for { "7.3e-17" } m/s² i otte punkter op til grad { "2190" }; den forbliver MODELLED, fordi pyshtools ikke nåede den tærskel nær polen, som blev fastsat på forhånd (en mpmath-kontrol placerer fejlen i pyshtools; <c14/>). En bane på { "200" }×{ "200" } over { "24" } timer stemmer med Orekit inden for { "0.13" } m, men dens kontrol af følsomhed over for grad 70, som blev fastsat på forhånd, slog fejl ({ "0.73" } m < { "1" } m), så graderne { "71" }–{ "200" } er karakteriseret, ikke valideret, i banen (<c15/>). NRLMSISE-00-termosfæredensiteten (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) er portet (<c16/>: bit-identisk med den C-port, der er i det offentlige domæne, på { "720" } punkter, inden for { "1.9e-6" } relativt til pymsis, og de { "17" } offentliggjorte testtilfælde gengives; <c17/>) og er et valgfrit niveau for luftmodstandens densitet (<c18/>, <c19/>; standarden forbliver den statiske Vallado-model). Det validerer porten, ikke modellens nøjagtighed i forhold til målt densitet. DE440 (DE: Development Ephemeris) for Sol og Måne er et valgfrit efemerideniveau (<c20/>). WGS-84-skyggen for solstrålingstryk (SRP) med oblat Jord er valgfri (<c21/>) og stemmer med Orekit { "12.2" }s belysningsforhold inden for { "7.4e-9" } over { "2400" } geometrier (<c22/>); dens variant med randfortunkling har ingen ekstern uafhængig reference (MODELLED). NRLMSISE-00-luftmodstandsniveauet stemmer med Orekit { "12.2" }s egen NRLMSISE-00-luftmodstand over { "24" } timer inden for { "0.03" } m ved op til { "142" } km luftmodstandsforskydning (<c23/>, VALIDATED under de fælles konventioner). En GMAT-krydskontrol (GMAT: General Mission Analysis Tool) udestår som opfølgning.

seg-46d06796e0e4 = Tidevand på geopotentialet (<c1/>)

seg-81b18c4caad3 = Tidsvarierende korrektioner ΔC̄_nm, ΔS̄_nm til Stokes-koefficienterne (IERS Conventions { "2010" }, kapitel { "6" }), valideret mod konventionernes egne offentliggjorte tal — ikke mod et andet værktøj.

seg-78dc5baf4d9d = Bidrag

seg-7c6c910bbf89 = Fast jordtidevand (IERS lign. { "6.6" } / 6.8b / { "6.14" })

seg-ac1dbcc895f0 = <c1/>: det permanente (nulfrekvente) tidevand ΔC̄₂₀ ligger inden for { "1" } % af det af IERS offentliggjorte −{ "4.1736" }×{ "10" }⁻⁹ (anelastiske Love-tal); <b>regneeksemplet for trin 2 K1 gengives bit for bit</b> (sin/cos-amplituder { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² inden for { "0.1" }×{ "10" }⁻¹²); den normaliserede Legendre-sti er fastlåst af lukkede håndregnede værdier, der er uafhængige af rekursionen.

seg-f2e2c5334721 = Havtidevand (IERS lign. { "6.15" }, FES2004 (Finite Element Solution { "2004" }, tidevandsatlas), { "8" } konstituenter)

seg-0369f153806f = Den medleverede delmængde af FES2004 (<c1/> → <c2/>, fortolkning af Doodson til multiplikator) gengiver kildens M2-koefficienter ({ "2,2" }) nøjagtigt; K1-Doodson-fasen er lig med θ_g + π; den sektorielle størrelse af grad 2 er fysisk og en størrelsesorden under det faste jordtidevand.

seg-52a19a291a41 = Atmosfærisk S2-lufttidevand (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

seg-86b3d3a39bc7 = De medleverede Ray-harmoniske omregnes via overfladebelastningsrelationen (lign. { "6.21" }) til en top-ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % af havets M2-led). Ærligt forbehold: <b>der findes ingen offentliggjort uafhængig reference for geopotentialkoefficienter for lufttidevandet</b>, så det er valideret ved kildens integritet og størrelsesorden, en svagere tærskel end for det faste og det oceaniske tidevand.

seg-63ac45ba51dc = Manøvrer og banedesign (<c1/>)

seg-a2ff4b0619d4 = Impulsivt ΔV og propagering af kovarians

seg-12f469864d28 = En hastighedsdiskontinuitet med en { "6" }×{ "6" }-kovarians ført videre (deterministisk afbrænding ⇒ identitets-STM (tilstandsovergangsmatrix); kovariansen for udførelsesfejl roteres fra afbrændingens referencesystem — ECI (Earth-centred inertial) eller LVLH (local vertical, local horizontal) — ind i hastighedsblokken).

seg-f3f0e4a7ec05 = Integration af endelig afbrænding i forhold til Tsiolkovskij

seg-f7b35b7acdba = Integration af konstant fremdrift over en afbrændingsbue (massen som tilstand), hvor det opnåede ΔV stemmer med den lukkede <b>Tsiolkovskij</b>-raketligning med <b>bedre end { "0.01" } %</b>.

seg-46ae334a0604 = Lambert-løser (Izzo { "2015" }) rundtur

seg-3e2b483cd1b7 = Lambert-resultatet for én omløbsrevolution (<c1/>, <c2/>, flyvetid ⇒ <c3/>, <c4/>) <b>sendes en rundtur gennem den nøjagtige Kepler-propagator med universelle variable</b> — det skal lande tilbage på <c5/>.

seg-04d69337acb3 = Porkchop-sweep i forhold til Hohmann-gulvet

seg-fb5298b7983c = Minimummet i gitteret af opsendelse × ankomst for C3 / ankomst-V∞ kontrolleres mod <b>det analytiske C3-gulv for Hohmann-overgang</b> mellem to koplanare cirkulære baner.

seg-bf2eb36e3eb6 = Lambert-løser i forhold til et uafhængigt bibliotek

seg-40511ea76e12 = <c1/>: { "13" } overgange med én revolution fra LEO til GEO til heliocentrisk, prograde og retrograde, mod lamberthub { "1.0.0" } <c2/>; største forskel i randhastighed { "7e-12" } m/s.

seg-164d7ea14d4e = Ærligt omfang: ingen baneoptimerer, ingen Lambert-grene med flere revolutioner og en syntetisk koplanar-cirkulær heliocentrisk model (ingen planetarisk DE-efemeride, så en GMAT-krydskontrol af C3 mellem Jorden og Mars er ikke kørt).

seg-9d2d78ad22c4 = Banebestemmelse (OD) (<c1/>, <c2/>)

seg-95d5ac7f6c29 = Gauss–Newton-batchkorrektor

seg-3fe29c4621b2 = Den generiske <c1/>-løser når den nøjagtige vægtede mindste kvadraters løsning på en lineær tilpasning, genfinder de sande parametre på en ikke-lineær <c2/>-tilpasning og løser en 3D-afstandsmultilateration ud fra støjfri afstande.

seg-b31d1ffa99b1 = Batch-banebestemmelse ud fra afstande

seg-0b37139dffa9 = <c1/> genfinder <c2/> ud fra afstandssporing fra jordstationer (propageret over tolegeme- + J2-kraftmodellen) til <b>under en meter / mm·s⁻¹ ud fra støjfri afstande</b> og til <b>~{ "2" } m med et residual efter tilpasning på støjgulvet på { "5" } m</b> — kendetegnet for en konsistent mindste kvadraters tilpasning.

seg-fb29199bf8bd = Sekventiel OD (med unscented-filter)

seg-3c1f33052d48 = <c1/> genfinder rekursivt tilstanden inden for nogle titals meter på samme dynamik og afstandsmodel.

seg-7a636cc9eef0 = Batch- og sekventiel OD i forhold til en uafhængig estimator

seg-68bf6e73c582 = <c1/>: { "8" } scenarier ({ "6" } støjfri LEO/MEO/excentriske med { "3" }–{ "4" } stationer, { "2" } ved σ = { "5" } m) mod Orekit { "12.2" }s batch-mindste-kvadraters- og Kalman-estimatorer på en tilpasset kraftmodel; værste batch { "1e-3" } m / { "1e-6" } m/s, sekventiel { "0.9" } m.

seg-55a86bc79831 = | Batch-OD med afstandsrate / azimut-elevation og elevationsmaske | <c1/> (ekstern sammenligning, én tærskel fastsat på forhånd blev ikke nået) | <c2/>: { "8" } scenarier mod Orekit { "12.2" }s batch-mindste-kvadrater med egne øjeblikkelige geometriske målinger; de synlige mængder er identiske, måleværdierne inden for { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, tilstandsovergangsmatricen inden for { "1.2e-14" }, støjede tilstande inden for { "1.74" } cm og RMS pr. type inden for { "2.7e-4" }; tærsklen for støjfri tilstand ≤ { "1" } cm, som blev fastsat på forhånd, er ikke nået i { "2" } af { "4" } scenarier ({ "1.46" } og { "1.74" } cm; Orekits eget estimat ligger så langt fra dets simulerede reference, mens kshanas ligger inden for { "1e-8" } m). Se <c3/>. |

seg-35a85fb744cd = Ærligt omfang: undervisnings-OD bruger faste inertiale stationer, et sfærisk topocentrisk referencesystem for Jorden og øjeblikkelige geometriske målinger (ingen lystid, aberration, refraktion eller jordrotation); tilstandsovergangsmatricen for afstandsrate/vinkelstien er variationel (RK4-integreret med analytiske tolegeme- + J2-partielle afledede), ikke lukket; der er intet sekventielt filter for afstandsrate eller vinkler. Stien kun med afstand beholder sin Jacobi-matrix med differenskvotienter. (Motoren til tilpasning af efemerider med fuld kraftmodel nedenfor har sin egen variationelle tilstandsovergangsmatrix.)

seg-8f425e278f7c = Validering af kraftmodel ved tilpasning af efemerider (<c1/>)

seg-9207d7139b87 = En præcis batch-mindste-kvadraters-estimator for positionsobservationer med fuld kraftmodel: EGM2008-tesseralgeopotentialet (evalueret i det jordfaste referencesystem gennem CIO-reduktionen) sammensat med tredjelegemet Sol/Måne, SRP, luftmodstand, Schwarzschild/Lense–Thirring-GR (generel relativitet) og tidevandet ovenfor, tilpasset et spor af inertiale positionsbestemmelser med en Jacobi-matrix af variationel tilstandsovergangsmatrix. Valideret på <b>syntetiske</b> data, hvor referencen er Kshanas egen integrator, så hvert residual stammer fra estimatoren og ikke fra dynamikken.

seg-fc676106563e = Sammensætning af præcis kraftmodel

seg-57726d970436 = <c1/>: grad-0-feltet er den nøjagtige punktmasse ved hver epoke (det centrale led er rotationsinvariant); grad 8 tilføjer J2-båndets fladtrykning; tredjelegemet Sol og tidevandsleddet kobles ind bit-tro; en konstant radial empirisk acceleration er rent radial i RTN (radial, transversal, normal).

seg-98b036354077 = Variationel tilstandsovergangsmatrix

seg-71787d9334db = Hver søjle af Φ over en halv LEO-bane (grad-8-geopotential + Sol + Måne) stemmer med en uafhængig <b>central differenskvotient over hele buen (FD)</b> ved gen-propagering med <b>< { "1" }×{ "10" }⁻⁶ relativt</b> i både positions- og hastighedsresponsen — den dokumenterede krydskontrol af STM mod FD. Φ({ "0" }) = I; den udvidede og den almindelige propagator stemmer med under en millimeter.

seg-0b453776136b = Selvgenfinding med batch-mindste-kvadrater

seg-c651db308332 = En Kshana-bue på 1 time (grad 6 + Sol + Måne), observeret uden støj, genfindes fra en forskydning på { "150" } m / { "0.1" } m·s⁻¹ til <b>epoketilstanden inden for { "1" }×{ "10" }⁻² m</b> med næsten nul RMS efter tilpasning; med hvid støj på { "5" } m lander 3D-RMS efter tilpasning på <b>~σ-støjgulvet</b>, uden bias. SRP-<b>C_R genfindes fra { "1.0" } til inden for { "1" } %</b> af referencen på { "1.4" }.

seg-06bd2857f832 = Redigering af outliers og RTN-rapportering

seg-8b9dea5c0727 = En grov fejl på { "500" } m afvises af 5-σ-redigering efter tilpasning (præcis én observation), hvilket efterlader en ren tilpasning på millimeterniveau; residualer rapporteres opdelt i radial/transversal/normal samt som 3D.

seg-e3969a15df96 = Niveau med empirisk acceleration (RTN-konstant + 1-CPR (CPR: cycle-per-revolution))

seg-c46af7926511 = De ni empiriske parametre med a priori-begrænsning forbliver under { "1" }×{ "10" }⁻⁸ m·s⁻² på empirifri reference uden at forstyrre tilpasningen; en konstant acceleration på { "3" }×{ "10" }⁻⁸ m·s⁻² på tværs af sporet, som er lagt ind i referencen, genfindes inden for { "20" } %.

seg-fd79199b52d1 = Ærligt omfang: den syntetiske bølge bruger nominelle parametre for jordorientering (EOP: UT1 (Universal Time { "1" }, jordrotationstid) ≈ TT (Terrestrial Time), ingen polbevægelse) — nøjagtigt for selvgenfinding, da den samme model genererer og tilpasser buen. Valideringerne mod agenturdatasæt lægger <b>rigtige</b> finals2000A-EOP og SP3/SPK-reference (SPK: planetarisk efemeridekerne) oven på denne motor gennem CIO-referencesystemkæden (<c1/>, <c2/>, <c3/>, <c4/>).

seg-934f0f8e4f5f = Rigtige præcise baner fra agenturer (<c1/>, <c2/>, <c3/>)

seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

seg-14a2999d0739 = Kshanas motor med fuld kraftmodel tilpasset et ordret udsnit af <b>ESA/ESOC (ESOC: European Space Operations Centre)s egen endelige bane</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) for Galileo <b>E11</b> over { "8" } timer, hver ITRF-positionsbestemmelse roteret til GCRS med rigtige finals2000A-EOP: <b>3D-RMS efter tilpasning { "0.133" } m</b> med ren kraft + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> med det empiriske niveau, ud fra et rå overlap på { "78.7" } km. Hele buen på { "24" } timer er <b>{ "0.611" } m</b>. Alt langt inden for tærsklen på { "5" } m. Feltets tyngdekraft er konvergeret ved d/o-8 (identisk ved d/o 8/10/12); jobbet <c4/> kører den fulde d/o-70. Proveniens + SHA-256 (SHA: Secure Hash Algorithm) i <c5/>; fuld optegnelse i <c6/>.

seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

seg-403b15ec1b9b = Motor med fuld kraftmodel (+ atmosfærisk luftmodstand) tilpasset et ordret udsnit af <b>ESA's egen reducerede-dynamik-præcisionsbane for Swarm-A</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) over { "3" } timer ved d/o-70, rigtige finals2000A-EOP gennem CIO-kæden: niveauet <b>dynamisk</b> (kun tilstand, statisk densitet, <c2/>={ "1" }) giver <b>3D-RMS efter tilpasning { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — residualet er næsten ren luftmodstand langs sporet), niveauet <b>reduceret dynamik</b> (+ empiriske CPR-accelerationer) giver <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm mod ESA's bane på ~{ "2" } cm. Proveniens + SHA-256 i <c4/>; fuld optegnelse i <c5/>.

seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter) måne — valideret, over { "5" } m (ærligt)

seg-d2be90186a89 = <b>Månecentreret</b> tilpasning af kraftmodel (<c1/>): GRAIL-<b>GRGM660PRIM</b>-tyngdefeltet (d/o { "100" }) i månens kropsfaste hovedaksesystem (<c2/>, IAU { "2015" } mean-Earth + den faste DE421-forskydning (Development Ephemeris { "421" }) fra mean-Earth til hovedakser (ME→PA), anvendt, som SPICE definerer den, siden { "0.36" }: indtil da blev den anvendt i den forkerte retning, ca. { "208" }″ ved siden af), + tredjelegemerne Jorden/Solen, tilpasset gennem den <em>samme</em> generiske Gauss–Newton-estimator som Jord-datasættene til den rigtige <b>JPL Horizons-LRO</b>-rekonstruerede bane (NAIF −{ "85" }), { "4" } timer / { "241" } epoker, ~{ "98" } km. Ærligt resultat efter tilpasning ({ "0.36" }): <b>dynamisk { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>reduceret dynamik { "6.67" } m</b> (RTN 3.41/4.58/3.44, { "1" }+2-pr.-omløb empirisk), ud fra et rå overlap på { "39.9" } m (før rettelsen af ME→PA: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>over</b> tærsklen på < { "5" } m, og det er ikke estimatoren (identisk ved d/o 100/150 og <c3/> 1e-6/1e-9). En <b>krydsvalidering i DE-kvalitet</b> (<c4/>: DE440 (Development Ephemeris { "440" }) lunar PA-orientering + DE440-efemeride via ANISE) <b>rettede</b> påstanden om den begrænsende faktor — den gav { "12.0" } m dynamisk og { "6.67" } m reduceret dynamik, hvilket den rettede analytiske stak nu matcher på begge niveauer (det tidligere dynamiske gab, { "12.6" } → { "12.0" } m, var fejlen i ME→PA-forskydningen), så det operative gulv er <b>ikke</b> den analytiske orientering/efemeride, men et residual, som det empiriske niveau ikke kan reducere (det passer bedst med umodellerede ikke-gravitationelle kræfter på LRO over den korte bue); den slanke analytiske stak matcher allerede DE-kvalitet for banen med reduceret dynamik. Proveniens + SHA-256 i <c5/>; fuld optegnelse i <c6/>. <b>Valideret mod rigtig agenturreference: { "3" } af { "3" }; under < { "5" } m: { "2" } af { "3" }.</b>

seg-3d3cbf5f043d = Navigation med tyngdekortlægning / alt-PNT (<c1/>, <c2/>, <c3/>, <c4/>)

seg-89f2cbf55842 = Tyngdeanomalifelt med kugleflademodes

seg-76cae5c530f2 = <c1/>: et felt af lav grad, fuldt normaliseret, kontrolleret mod de lukkede Legendre-funktioner (<c2/>, <c3/>, <c4/>) og en håndafledt anomali med ét led på { "1.897" } mGal.

seg-f00f82b70e6e = Målemodel for koldatom-gravimeter

seg-49090598c525 = Gulvet for hvid støj udledes af CAI-accelerometerets ASD (<c1/>) og tilføres som en deterministisk sekvens med seed (matcheren får aldrig støjfri reference, men kørslen kan alligevel gengives bit for bit).

seg-0556db62c45f = Partikelfilter med sekventiel vigtighedsresampling

seg-3df4251aedbd = <c1/>: den deterministiske kerne er fastlåst nøjagtigt — ESS (effektiv stikprøvestørrelse) fra { "1" } til N, systematisk resampling, der vælger indekser i forhold til vægten, den vægtede middelværdi som konveks kombination, en gaussisk sandsynlighedsfunktion, der trækker estimatet hen på målingen, og determinisme i prædiktion med seed.

seg-7dca80b16a00 = Kortmatchningens sandsynlighed + genfinding

seg-eb40ab2607ae = <c1/>: <c2/> har sin top (= { "1" }) ved perfekt match og falder til <c3/> ved én sigma; et partikelfilter over et karakteristisk syntetisk terrænudsnit genfinder den sande position inden for { "0.1" }.

seg-446d9f03a860 = Benchmark med 60 minutters GPS-nægtelse

seg-ed29fb24d9d5 = <c1/> (<c2/>): et udfald på ~{ "700" } km / én time, hvor den inertiale løsning driver til <b>≈ { "70" } km</b>, genfindes til <b>≈ { "145" } m (< { "500" } m)</b> af en hierarkisk matcher fra grov til fin — kan gengives bit for bit, stabil på tværs af støjrealiseringer og påviseligt begrænset af forfining (et enkelt groft gitter går i stå ved ~{ "2" } km).

seg-81a2963c26cc = SRTM-indlæser (Shuttle Radar Topography Mission) til <c1/>-DEM (digital elevation model) + bilineær stikprøve (UAFHÆNGIG REFERENCE A)

seg-5e7bbf951faf = <c1/> / <c2/>: en håndbygget <c3/>-buffer på { "2" }×{ "2" } med hjørner [{ "100,200" };{ "300,400" }] interpoleres bilineært til <b>præcis { "250.0" }</b> i cellens midte (lukket uafhængig reference), 16-bit-big-endian-rundturen er nøjagtig, og rækkevendingen placerer den nordligste filrække ved den højeste lagrede breddegrad — alt sammen mod <b>specifikationen af GDAL-driveren (Geospatial Data Abstraction Library) SRTMHGT (Shuttle Radar Topography Mission height-file format)</b> (16-bit med fortegn, big-endian, rækkevis, nordlig række først, tomrum -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). En indlagt fixture på { "11" }×{ "11" } (<c4/>) afprøver fortolkeren i CI; og en <b>indlagt rigtig SRTM v3-flise fra NASA/USGS (USGS: United States Geological Survey) i det offentlige domæne</b> (N36W117, Death Valley, decimeret til 6 buesekunder, { "722" } KB, <c5/>) læses i CI (ikke ignoreret, <c6/>) og placerer <b>Badwater Basin ved ≈ −{ "78" } m inden for det dokumenterede bånd på [−{ "95" },−{ "70" }] m</b> (NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration)-opmåling ≈ −{ "86" } m) med flisens maksimum ≈ { "2161" } m — sandhedskilden er opmålingen, DEM'et er det, der afprøves (ikke cirkulært). Større offentliggjorte punkthøjder (Mount Whitney { "4421" } m) forbliver i fuldflisetests bag <c7/>.

seg-80f985ea3e11 = Konvergens for terrænreferencet navigation (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) (UAFHÆNGIG REFERENCE B)

seg-9ad7bf3a8c3e = <c1/> (<c2/>): en <b>håndafledt</b> indlagt INS-drift ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km ved ~{ "12" }° bredde, beregnet som drift° × M_per_deg × cos bredde) genfindes til <b>< { "500" } m</b> (inden for gitterets opløsningsgulv <c3/>), en reduktion på > { "100" }× i forhold til fri inertialnavigation — kontrolleret mod det <em>indlagte</em> tal, aldrig mod DEM'et (ikke cirkulært), kan gengives bit for bit og er stabil på tværs af støj-seeds.

seg-5b7c1dc72436 = Fusionsgevinst for kombineret tyngde+magnetisme+terræn (UAFHÆNGIG REFERENCE C)

seg-7e3818f2ee2b = <c1/> (<c2/>): tre skalare kanaler (Δg · |B| anomali i skorpen · højde) fusioneret som en produkt-sandsynlighedsfunktion giver et <b>afgrænset < { "500" } m</b> residual over udfaldet på 60 min, som, middelværdi over seeds, er <b>ikke dårligere end den bedste enkeltkanal</b> (informationsadditivitet / lavere CRLB (Cramér–Rao lower bound)). Ligger i det offentliggjorte TERCOM- / terrænreferencerede navigations-regime (TRN) med "nogle titals meter" CEP (circular error probable) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: error-state Kalman filter), <a2>https://peerj.com/articles/cs-3118/</a2>).

seg-fe23ff839bce = Ærligt omfang: tyngdefeltet er af lav grad + syntetiske mascons, <b>ikke</b> det fulde EGM2008/EIGEN-koefficientsæt (EIGEN: European Improved Gravity model of the Earth by New techniques); den magnetiske kanal hviler på det glatte IGRF-hovedfelt plus <b>syntetiske</b> mascons for anomalier i skorpen (et rigtigt højfrekvent skorpekort er en opfølgning); CI-terrænfeltet for benchmarks af <em>navigationspositionsbestemmelse</em> er det selvstændige syntetiske DEM, mens selve <c1/>-læseren nu er valideret i CI mod en indlagt rigtig SRTM v3-flise (ovenfor); de fuldt opløste rigtige fliser forbliver bag <c2/>. En Monte Carlo-undersøgelse af kortrepræsentationsfejl udestår som opfølgning. Alle tre navigatorer er nu koblet ind i scenariemotoren som <c3/> (<c4/>, <c5/>, <c6/>).

seg-d9f7e199e5d0 = Fejlmodel for INS / IMU — validering mod datablade (<c1/>)

seg-48266c2faaed = IMU's stokastiske fejlmodel er valideret mod <b>offentliggjorte specifikationer fra producenters datablade / datasæt</b> — aldrig mod en værdi, som Kshana selv har frembragt. Broen fra en specifikation i feltenheder til SI-støjmodellen (International System of Units) er den sædvanlige identifikation via Allan-deviation (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): koefficienten for tilfældig gang <c1/> er den overlappende ADEV aflæst ved τ = { "1" } s på hældningen τ⁻¹ᐟ², og koefficienten for biasustabilitet er Allan-plateauet (<c2/>, hermetisk — ingen download).

seg-702de63000d2 = Evidens / uafhængig reference

seg-c3fed48b98b1 = Enhedsomregningslag (risiko for cirkularitet nr. 1)

seg-6cdc88d36bfd = Kontrolleret i hånden: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

seg-75afa5abcd08 = Tilfældig vinkelgang i gyro

seg-d5fd60857e4d = ADIS16465 ARW { "0.15" } deg/√hr (Analog Devices' datablad) genfundet ud fra ADEV({ "1" } s) til < { "5" }%.

seg-c5e2d361b83f = Tilfældig hastighedsgang i accelerometer

seg-4413d3bb39b4 = ADIS16465 VRW { "0.1" } m/s/√hr genfundet til < { "5" }%.

seg-ebeb0bb0e0fb = Allan-hældning for hvid støj

seg-f674ce82dc2c = ADIS16460, hvid gren, log-log-hældning −{ "0.5" } ± { "0.05" }.

seg-40afd130f31d = Plateau for biasustabilitet under kørsel

seg-94acb18a94cb = ADIS16465, gyroens biasustabilitet (BI) { "2.0" } deg/hr genfundet som det flade Allan-minimum til < { "15" }%.

seg-b359e0e92e20 = Anden IMU-profil

seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) begge genfundet til < { "5" }%.

seg-fea9287d6533 = Ærligt omfang: dette validerer den <b>stokastiske fejlmodel</b> mod Allan-koefficienter fra datablade. Køretøjsdatasættet i i2Nav-WHU (WHU: Wuhan University) <b>KF-GINS</b> bruges som en særskilt, datastyret kontrol: det løst koblede EKF med lukket sløjfe og fejltilstand og GNSS-løftearmsmodel er en VALIDATED række i <a1>verifikationsmatrixen</a1> (<em>Løst koblet GNSS/INS-EKF med løftearm på KF-GINS-datasættet</em>), sammenlignet med KF-GINS C++-referencebanen under tærskler, som blev registreret før kørslen. Den kører kun, hvor datasættet er leveret (<c1/>); uden det kører den syntetiske indlæser og løftearmstestene. De tæt koblede varianter og varianterne med bærebølgefase er ikke dækket af den række (rækken med tæt koblet GNSS/INS med bærebølgefase er MODELLED).

seg-f0ab98c1a79d = Rumdybde- og Mars-PNT — D0-fundament (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-bd222b27949c = Den første milepæl i motoren til rumdybdenavigation: generalisering af den kerne, der var hårdkodet til Jorden, til et vilkårligt centrallegeme, tilføjelse af Mars-dynamik, en søm til efemeridelevandører, tid under mikrosekundet og primitiver for lystid / relativistisk forsinkelse. <b>Hvert eksisterende Jord-scenarie er byte-identisk</b> — de platformsuafhængige gyldne filer for reproducerbarhed (<c1/>, <c2/>) består uændret uden regenerering, håndhævet for hver commit.

seg-e0cdbfcbb28a = Abstraktion af centrallegeme (Jorden byte-identisk)

seg-7d20649189fa = <c1/>: <c2/> med <c3/>. <c4/> hævder, at <c5/> og <c6/> er lig med de gamle Jord-funktioner med <b>nøjagtig bitlighed</b> (<c7/>), og en Jord-bue med standard-<c8/> er byte-identisk — de gyldne filer for reproducerbarhed er uændrede (samme SHA, ingen regenerering).

seg-658acc8112e3 = Mars-tyngde (GMM-3 (GMM: Goddard Mars Model) tesseral, kropsfast)

seg-9b058665cf4b = <c1/>: zonaler C̄20/C̄30/C̄{ "40" } fra MRO110 (tyngdeløsning fra Mars Reconnaissance Orbiter) J2/J3/J4 (<c2/>, J2 går rundt til { "1.9604e-3" }) + MRO110B2 sektoriel/tesseral C̄22/S̄{ "22" }, C̄32/S̄{ "32" } (Konopliv et al. { "2011" }; tabuleret i Liu, Baoyin & Ma { "2012" }), evalueret i det kropsfaste IAU-referencesystem for Mars. <c3/> kontrollerer rundturen, afvigelsen fra punktmassen på J2-skala og at feltet virkelig er kropsfast (en omorientering på en kvart Mars-dag ændrer den inertiale acceleration). Højere grad/orden indlæses fra en medleveret <c4/> via <c5/>.

seg-1dcbee768418 = Kropsfast referencesystem for Mars (IAU-pol)

seg-0708e5b37d69 = <c1/>: IAU-rotationen 3-1-3 <c2/> (konvention fra WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), den samme som i <c3/>). Tests: ortonormal til { "1e-12" } med determinant +{ "1" }, identitet ved rundtur, nulmeridianen skrider frem med <c4/> pr. dag.

seg-5b6355a143c7 = Propagering centreret om Mars / Solen

seg-4ab87f666765 = <c1/> (selvkonsistens)

seg-12e3d173340b = <c1/>: en lav Mars-bane vender tilbage til sit udgangspunkt efter én Kepler-periode (lukning); den specifikke energi ε=v²/2−μ/r driver mindre end { "1e-9" } over buen; den sekulære knuderegression fra Mars-J2 stemmer med den analytiske Vallado-rate (uafhængigt beregnet ≈ −{ "5.15" } °/dag ved { "60" }° incl.) til { "3" }%; en heliocentrisk bane genfinder Mars-året på ~687 dage (vis-viva + uafhængig genfinding af perioden ud fra buen). Ingen eksterne data.

seg-acff4c016089 = DE440-krydsvalidering (heliocentrisk Mars)

seg-ed164e298754 = <c1/> (workspace-EXCLUDED; MPL-2.0-ANISE begrænset til sin egen Cargo.lock; spejler <c2/>): sammenligner Kshanas Sol-centrerede Mars-propagering med JPL DE440 (via ANISE), Horizons-reference citeret ordret (proveniens + SHA-256). <b>Gengivet resultat</b> (seed JD (Julian date) { "2459580.5" } TDB (Barycentric Dynamical Time), <c3/> SHA-256 <c4/>): positionsresidual <b>{ "137" } m ved bue på 1 dag</b> ({ "5.97" }×{ "10" }⁻¹⁰ af den heliocentriske afstand på { "2.299" }×10¹¹ m), voksende til { "3.3" } km ved { "5" } d, { "87.9" } km ved { "30" } d, { "1.71" } Mm ved { "90" } d — residualet <em>vokser</em> med buelængden, fordi en Sol-centreret tolegememodel bevidst udelader de planetariske forstyrrelser (især Jupiter) og Mars-systemets indre bevægelse, som DE440-barycenterefemeriden indeholder, så væksten er den ærlige signatur af den umodellerede n-legemedynamik, ikke en integratorfejl; at en kort bue forbliver en lille brøkdel af den heliocentriske afstand bekræfter, at den Sol-centrerede maskineri er korrekt. Kører kun, når DE440-kernen er til stede (<c5/>, eller hentes automatisk ~{ "32" } MB) — en manuel / <c6/> kontrol i DE-kvalitet, <b>ikke</b> en standard CI-port, så den udgivne crate og hver standardport forbliver byte for byte urørt.

seg-a7d79066a53b = Lystid + Shapiro-forsinkelse

seg-798148171dab = <c1/>: den iterative løsning af lystid ved forsinket epoke (konvergerer |Δτ|<{ "1e-12" } s, med loft) og Shapiro-forsinkelsen Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Tests: Jord–Sol ≈ { "499" } s og Jord–Måne ≈ { "1.28" } s via den indbyggede efemeride; en syntetisk emitter med konstant hastighed genfinder den analytiske forsinkede løsning til <{ "1e-9" } s (løseren er påvist uafhængig af enhver rigtig efemeride); Shapiro stemmer nøjagtigt med en håndberegnet værdi og giver ~{ "100" }–{ "250" } µs for en strejfende stråle ved overlig konjunktion mellem Jorden og Mars.

seg-1bc28f6bdc8f = Søm til efemeridelevandører

seg-34d6a07ad252 = <c1/>: <c2/> + kernefri <c3/> (Montenbruck–Gill Sol/Måne, geocentrisk); returnerer <c4/> for legemer, den ikke har nogen række for (fx Mars), hvor DE-kvalitets-ANISE-leverandøren er vejen — den samme opdeling mellem indbygget og ANISE som <c5/>/<c6/>.

seg-5e1fed7a98c0 = Tidsangivelse i to dele + TT↔TDB

seg-5ebca9b5f2db = <c1/>: en <c2/> med Knuth-two-sum-akkumulering genfinder intervaller under mikrosekundet, som den enkelte f64-JD mister nær J2000 (>{ "1000" }× bedre, testet); <c3/>/<c4/> bruger den dominerende periodiske Fairhead–Bretagnon-række (|TDB−TT|≲{ "1.7" } ms, kontrolleret i hånden ved J2000). Additivt — den eksisterende tidssti med enkelt f64 er uændret.

seg-d2da2e1d1711 = Radiometriske observable for rumdybde og CCSDS Tracking Data Message — D1 (<c1/>, <c2/>)

seg-b98f508f2375 = Den anden milepæl i motoren til rumdybdenavigation: <b>observationsmodellen</b>, der gør D0-kernen for lystid/relativistisk forsinkelse til de størrelser, en sporingspassage fra Deep Space Network (DSN) eller ESTRACK (European Space Tracking network) faktisk rapporterer — afstand, Doppler med én/to/tre veje, kohærent transponderomsætning, regenerativ/PN-afstandsmåling (PN: pseudo-noise), Δ-DOR (DOR: differential one-way ranging) og udbredelsesmedierne — plus ind- og uddata for <b>CCSDS (Consultative Committee for Space Data Systems) 503.0-B Tracking Data Message (TDM)</b>, som indlæser/udsender en standard sporingsfil fra et agentur. <b>Ærligt omfang:</b> det er <b>nøjagtige geometriske modeller</b> efter Moyers / CCSDS' konventioner; <em>målestøjen</em> er den <c1/> pr. observation, som kalderen leverer, og er ikke indbygget i modellen. At gengive en <em>bestemt rigtig sporingspassage</em> kræver rigtige TDM-data plus løseren til banebestemmelse i rumdybden — det er <b>D2</b>, ikke D1. Alt nedenfor er additivt (de gyldne filer for reproducerbarhed er uændrede; samme SHA, ingen regenerering).

seg-d1d2dc7906c8 = Afstand og Doppler med 1/2/3 veje (Moyers løsning med to ben)

seg-e2176b844df8 = <c1/>: <c2/>/<c3/> sammensætter D0's forsinkede (nedadgående ben) og fremrykkede (opadgående ben) lystidsløsninger; konventionen for hele rundturen er <c4/> (m), dokumenteret og konsistent. <c5/>/<c6/>/<c7/> danner bærebølgeforskydningen <c8/> (Hz) ud fra afstandsraten langs sigtelinjen, <b>fortegnskonvention: et rumfartøj, der nærmer sig, giver en positiv (blå) forskydning</b>. Tests: afstand med to veje = summen af benene til <{ "1" } mm (~{ "2" } AU rundtur Jord–Sol); afstand med én vej = <c9/> nøjagtigt; Doppler med én vej stemmer med den analytiske <c10/> for en radial emitter med konstant hastighed til ppt; tre veje med samlokaliserede stationer går byte for byte over i to veje.

seg-638697be5b5b = Kohærent transponderomsætning (nøjagtige DSN-forhold)

seg-781aa4041c58 = <c1/>: de nøjagtige rationale DSN/CCSDS-omsætningstal <c2/> (Moyer §{ "13" }; DSN 810-005 modul 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testet for nøjagtig lighed; et udefineret båndpar <b>panikker</b> (fejler højlydt, opfinder aldrig et forhold). <c3/> anvender bærebølgen for båndet + forholdet fra ende til anden og er lig med den eksplicitte <c4/> til maskinpræcision.

seg-f24f9da1570c = Regenerativ / PN-afstandsmåling (CCSDS { "414" }; flertydighed)

seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (den entydige afstand ved opløsning pr. chip) og <c4/> = det gange kodelængden (den fulde entydige afstand for PN-koden <c5/>), efter CCSDS 414.1-B. Testet: et afstandsur på { "1" } MHz giver ~{ "149.9" } m; PN-koden med vægtet afstemning fra CCSDS-414.1 ({ "1 009 470" } chips) ved { "1" } Mchip/s giver den entydige designafstand på ~{ "151 000" } km; en fordobling af chiprate halverer flertydigheden pr. chip.

seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" }, himmelplan)

seg-93055e944306 = <c1/>: den differentielle forsinkelse i himmelplanet <c2/> (s) for en interferometer-baseline <c3/> (CCSDS 506.1-B). Testet: stemmer med den nøjagtige analytiske projektion <c4/> for en kendt forskydning på linje med baselinen til { "1e-15" } s, den lille vinkels størrelse <c5/> og <b>nulpunktet</b> (et rumfartøj på linje med kvasaren giver nøjagtigt nul differentiel forsinkelse).

seg-4e5258bb04d5 = Kalibrering af plasma 1/f² med to frekvenser

seg-e3b340103825 = <c1/>: <c2/> = <c3/> (gruppeforsinkelsen fra det dispersive <c4/>-ladede partikelmedium, <c5/>); <c6/> koronasøjlen af typen Cassini <c7/> (analytisk stedfortræder, ikke en kalibreret korona); <c8/> den <c9/>-dispersionsinversion, som DSN bruger til at fjerne plasma. Testet: 1/f²-loven <c10/>; koronaen stiger mod konjunktion; og en <b>indlagt TEC genfindes til <{ "1" } %</b> (faktisk ≪ { "1e-9" } uden støj) — <c11/>.

seg-e1e265ab499a = Medier i tropo- / ionosfæren (genbrug af GNSS-modeller)

seg-2d9aa52f318b = <c1/>/<c2/>: jordstationssegmentet i rumdybden krydser den samme jordatmosfære, som GNSS-pakken allerede modellerer, så disse delegerer til <c3/> (Saastamoinen-zenit + Niell-afbildning, ikke-dispersiv) og <c4/> (udsendt iono). Testet koblet + fysisk fortegn: tropo positiv og større ved lav elevation end i zenit; iono en ikke-negativ skrå forsinkelse (den numeriske troskab er GNSS-pakkens egne tests mod datablade).

seg-44ba6e0411fd = CCSDS-TDM { "503" } fortolkning / udsendelse + radiometrisk bro

seg-18eafe936dcb = <c1/>: en CCSDS 503.0-B-2 KVN-læser (keyword-value notation) <b>og</b> -skriver (header + segmenterne <c2/> / <c3/>; poster <c4/>/<c5/>/<c6/>/<c7/>). Tests (<c8/> + <c9/>): referencefixturen fortolkes til de forventede navngivne felter; <b>parse→emit→parse er en lige struktur</b> (semantisk rundtur); broen <c10/> afbilder de entydige poster <c11/>/<c12/> til <c13/> (vej fra <c14/> <c15/>/<c16/>/<c17/>, bånd fra <c18/>, km→m); en fil med flere segmenter nulstiller tilstandsmaskinen. <b>Ærligt spring over frem for at gætte:</b> vinkler/frekvenser, ukendte bånd, epoker som dag i året og ikke-genkendte tidssystemer <b>springes over</b>, afbildes aldrig forkert, og <c19/> efterlades som <c20/> til kalderen at vægte.

seg-e8ca55dd29b1 = DSN/ESTRACK-benchmark (modelpræcision ≫ offentliggjort gulv)

seg-247b9e7b2be8 = <c1/>: observablene er nøjagtige geometriske beregninger, så den ærlige benchmark er, at <b>modellens egen numeriske fejl ligger langt under det offentliggjorte målegulv for DSN/ESTRACK</b> — modellen er ikke flaskehalsen for nøjagtigheden, det er det σ, som kalderen leverer. Hver test beregner en observabel på to uafhængige måder (eller genfinder en indlagt reference) og hævder, at residualet ligger under gulvet: <b>afstand</b> går rundt til <{ "1" } mm ≪ PN-afstandsgulvet på ~{ "1" } m (DSN 810-005 mod. { "214" } / CCSDS 414.1-B); <b>Doppler</b> stemmer med den nøjagtige lukkede forsinkede afstandsrate <c2/> til ~{ "10" }⁻⁶ m/s, flere × under X-bånd-gulvet på ~{ "0.05" } mm/s (DSN 810-005 mod. { "203" } / Moyer) — residualet er f64-gulvet ved afstandsdifferens ved ~{ "1" } AU, en numerisk egenskab og ikke en modelfejl; <b>Δ-DOR</b> gengiver den lukkede projektion til en tilsvarende vinkel i himmelplanet ≪ { "1" } nrad ≪ gulvet på ~{ "1" }–{ "10" } nrad (DSN 810-005 mod. { "210" } / CCSDS 506.1-B); <b>plasma</b> med to frekvenser genfinder den indlagte forsinkelse til ≪ { "1" } %; og <b>Shapiro</b>-forsinkelsen ligger i det offentliggjorte bånd på ~{ "100" }–{ "250" } µs for konjunktion mellem Jorden og Mars. De offentliggjorte tal er angivet og betegnet som DSN-specifikationer af <b>størrelsesorden</b>, ikke opdigtede nøjagtige tal, og modulets dokumentation er eksplicit på, at dette måler MODELPRÆCISION, ikke gengivelse af en rigtig passage (det er D2 + rigtig TDM).

seg-2a25e6a8a5b1 = OD i rumdybden med reduceret dynamik — D2 (<c1/>, <c2/>, <c3/>)

seg-0d7a1b75a0ea = Den tredje milepæl i motoren til rumdybdenavigation: <b>estimatoren</b>, der gør D1's radiometriske observable til en genfundet bane — et numerisk robust Square-Root Information Filter (SRIF) med empiriske accelerationer med reduceret dynamik, et ur ombord med tre tilstande, en Mars-luftmodstandsmodel og de radiometriske partielle afledede, som forbinder afstand/Doppler med filtertilstanden, lukket fra ende til anden af en syntetisk genfinding af banebestemmelse i lav Mars-bane (LMO). <b>Ærligt omfang:</b> genfindingen er en <b>syntetisk lukket sløjfe</b> (reference og filter deler den samme Mars-propagator, og observationerne er den samme geometriske observationsmodel, som filteret inverterer, plus indlagt gaussisk støj) — den validerer <b>estimatorens maskineri</b>, ikke den absolutte troskab af Mars' kraftmodel; den eksterne krydskontrol i DE-kvalitet er den kernestyrede <c1/>-crate (D0.8b). Alt nedenfor er additivt (de gyldne filer for reproducerbarhed er uændrede; samme SHA, ingen regenerering).

seg-51f203291066 = SRIF-kerne (square-root information filter)

seg-9d5fd8c1d37d = <c1/>: et håndrullet Bierman-kvadratrodsinformationsfilter — øvre trekantet <c2/> med <c3/>, informationsvektor <c4/>, Householder-måleopdateringer/tidsopdateringer, ren <c5/>-aritmetik (ingen nalgebra). Tests: det sekventielle SRIF stemmer med batch-løsningen med vægtede mindste kvadrater (<c6/>) i <b>både tilstand og kovarians til { "1e-9" }</b> på et udformet lineært gaussisk problem (<c7/>); den genfundne kovarians <c8/> er <b>symmetrisk ({ "1e-12" }) og positiv definit pr. konstruktion</b> efter en lang sekvens af måle-/tidsopdateringer (<c9/>, Cholesky lykkes); og information akkumuleres (sporet af <c10/> aftager monotont, når målinger med identisk geometri indarbejdes).

seg-f9ffa1ef4688 = Empiriske accelerationer med reduceret dynamik (afstemning mellem krydstogt og LMO)

seg-b0612a7140c3 = <c1/>: filteret med ni tilstande <c2/> med empiriske RTN-accelerationer som Gauss–Markov-processer af første orden som tilstande, JPL/ESOC-teknikken med reduceret dynamik udstillet som ét enkelt <c3/>-greb (næsten dynamisk ⇒ udjævner støj på en ballistisk bue; næsten kinematisk ⇒ det empiriske niveau absorberer en umodelleret manøvre/luftmodstand). Tests: et næsten kinematisk filter følger en <b>trinvis (thruster-)manøvre</b> med <½ af residualet fra det næsten dynamiske, mens det næsten dynamiske filter <b>udjævner en støjet ballistisk bue</b> bedre (<c4/>); et sweep over stramheden flytter residualet efter tilpasning <b>monotont</b>, et kontinuum og ikke en kontakt (<c5/>).

seg-9d5db4d63990 = Ur ombord med 3 tilstande (fase/frekvens/drift, van Loan Q, Allan)

seg-fe5beef74e24 = <c1/>: fejltilstand for fase + relativ frekvens + frekvensdrift med den <b>nøjagtige diskrete processtøj fra van Loan</b> og en Joseph-stabiliseret opdatering. Tests: den diskretiserede <c2/> stemmer med det håndafledte van Loan-polynomium <b>til { "1e-12" }</b> og <b>reduceres nøjagtigt til KalmanClock-Q med to tilstande, når drift = { "0" }</b> (en streng overmængde); en coast med flere trin lader fasevariansen vokse til NIST SP { "1065" }-relationen for holdover gennem <c3/>-leddet for tilfældig løbetur; drifttilstanden <b>genfinder en sand aldringsrampe til <{ "5" } %</b>; en <b>Allan-profil af USO-klassen genfindes</b> (overlappende ADEV ved τ={ "1" } s inden for kalibreringsporten), og estimatoren forbliver NEES-konsistent (>{ "95" } % inden for 3σ) og PSD gennem en kørsel med kraftig <c4/>. <c5/> bærer de citerede CSAC/USO/DSAC-tal (USO: ultra-stable oscillator; DSAC: Deep Space Atomic Clock) <c6/> og Doppler-gulvet <c7/>.

seg-8666d18daa2b = Atmosfærisk luftmodstand på Mars (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

seg-6a64c2b9e553 = <c1/>: en stykkevis eksponentiel profil af Mars' neutrale densitet (overflade ~{ "0.020" } kg/m³, skalahøjde nær overfladen ~{ "11" } km, Mars-GRAM { "2010" } / MCD (Mars Climate Database), middel med lidt støv) og den kvadratiske luftmodstandsacceleration taget relativt til den <b>medroterende</b> Mars-atmosfære, plus en <c2/>-variant, som SRIF kan gange. Tests: densiteten aftager monotont og kontinuert på tværs af bånd, den genfundne skalahøjde nær overfladen er den fysiske ~{ "11" } km, luftmodstanden er <b>strengt antiparallel med den relative hastighed</b> (krydsproduktet forsvinder til { "1e-12" }) med en fornuftig størrelse i LMO på ~{ "3e-4" } m/s², og den er lineær i det ballistiske led. <b>Ærligt omfang:</b> en repræsentativ ingeniørmæssig atmosfære, ikke en flyvevalideret Mars-GRAM/MCD med afhængighed af støv/årstid/lokal tid.

seg-452f32dace80 = Radiometriske partielle afledede (afstand/Doppler) til SRIF

seg-6661d241cdaf = <c1/> / <c2/>: de partielle afledede af afstanden langs sigtelinjen <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) og afstandsraten <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ), som forbinder D1's observable med filtertilstanden, plus den partielle afledede af urfrekvensen ved Doppler med én vej <c5/>. Tests: begge partielle afledede stemmer med en <b>central differenskvotient af observablen til { "1e-6" }</b> (<c6/>, <c7/>); en enkelt afstandsopdatering <b>skrumper kovariansen i den observerede retning (sigtelinjen, LOS) med ≫{ "1000" }×</b> og holder den positiv definit (PD), og en Doppler-opdatering skrumper LOS-<b>hastighedens</b> varians (<c8/>, <c9/>).

seg-9a2cb6292477 = Mars-LMO, banebestemmelse fra ende til anden ud fra radiometriske data

seg-6318968b683a = <c1/>: en reference-bue i lav Mars-bane, propageret under <c2/>-tyngde, genererer støjet <b>afstand (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> med to veje mod to sporingsstationer; SRIF med reduceret dynamik genfinder den ud fra en begyndelsestilstand, der er <b>forstyrret med ~{ "2.7" } km</b>. Opnået: konvergeret positions-<b>RMS ≈ { "0.2" } m</b> (under en meter, langt inden for målet fra meter til nogle titals meter) over en bue på 3 omløb med { "30" } s kadence, med den <b>faktoriserede kovarians positiv definit ved hver epoke</b> (SRIF's garanti, hævdet hele vejen igennem). <b>Kontinuummet for afstemning mellem krydstogt og LMO</b> afprøves fra ende til anden: med en reference med umodelleret luftmodstand, som filterskabelonen mangler, genfinder knappen for reduceret dynamik (stramhed { "1" }) til ~{ "14" } m mod ~{ "677" } m for kørslen, der er næsten dynamisk (stramhed { "0" }) — en forbedring på { "48" }× fordi det empiriske niveau absorberer luftmodstanden. <b>Ærligt omfang:</b> syntetisk lukket sløjfe (reference = den samme propagator, som filteret bruger); den eksterne krydskontrol i DE-kvalitet er den kernestyrede <c3/> (D0.8b), aldrig kørt her, intet netværk.

seg-559176eb1a82 = Scenarie for PNT i rumdybden og fusion af én vej + to veje — D3 (<c1/>, <c2/>)

seg-bdb5da496071 = Den fjerde milepæl i motoren til rumdybdenavigation: et kørbart <b>Mars-PNT-produktscenarie</b>, der binder D0's Mars-legeme / referencesystem, D1's radiometriske observable og D2's OD med reduceret dynamik sammen i én scenarietype <c1/>. Det modellerer en lille <b>relæ-konstellation i stil med MARCONI</b>, der udsender et signal i rummet med én vej (urkoblet) plus videresender en forbindelse med to veje (kohærent, urfri) til en rumdybdestation, og navigerer tre referencebrugere (Mars-overgang, orbiter i lav Mars-bane, fast overfladepunkt) gennem <b>D3.1's fælles estimator, der fusionerer én vej + to veje</b> — et SRIF med tolv tilstande, der udvider D2's blok med reduceret dynamik for bane/empiri med et ur ombord med tre tilstande. <b>Ærligt omfang:</b> hvert kvalitetsmål er estimatorens <b>formelle kovariansgrænse</b> (1σ / 3σ i position pr. epoke) og den opnåede RMS mod en <b>syntetisk lukket sløjfe</b> som reference (reference og filter deler den samme Mars-dynamik og den samme geometriske observationsmodel, plus indlagt gaussisk støj) — et simuleret navigationskvalitetsmål, <b>IKKE</b> et luftfartscertificeret beskyttelsesniveau og <b>IKKE</b> en flyvepåstand (ingen certificeret fejlmodel, ingen integritetsmonitor, ingen rigtige sporingsdata). Alt nedenfor er additivt (de gyldne filer for reproducerbarhed er uændrede; samme SHA, ingen regenerering).

seg-b81920d2df82 = Fælles radiometrisk fusion af én vej + to veje (fusioneret slår hver for sig)

seg-cd9d2a7dd08f = <c1/>: D2.2's SRIF med reduceret dynamik udvidet med de tre urtilstande ombord (<c2/>), der indlæser en blandet tidsserie af <b>to veje</b> (urfri, fastholder banen — nul urkolonner i den partielle afledede) og <b>én vej</b> (urkoblet — frekvensens partielle afledede <c3/>) afstand/Doppler gennem <c4/>. Strukturen kalibrer-så-coast: passager med to veje fastholder banen, data med én vej kalibrerer derefter uret og lader banen coaste mellem passagerne med en fejl, der er afgrænset af urets Allan-stabilitet. Testet i <c5/> <c6/>: den <b>fusionerede</b> løsning slår <b>hver af forbindelsestyperne alene</b>; coastfejlen i en kørsel kun med én vej vokser med afstanden mellem passager med to veje i tråd med Allan-grænsen for urklassen; den fælles kovarians forbliver SPD (symmetrisk positiv definit) hele vejen.

seg-26a4bfa8e6ad = MARCONI-konstellation (areostationær radius, okkultation)

seg-f2c2e1b83411 = <c1/>: et sæt med fem relæer — tre <b>areostationære</b> relæer ved <c2/> (Mars' synkrone radius ud fra offentliggjort μ/rotationsrate; testet i båndet <b>{ "20 400" }–{ "20 500" } km</b>) med lige afstand på { "120" }° i længdegrad og { "5" }° inklination, plus to relæer i en højere ({ "1.4" }× areostationær) cirkulær bane med { "60" }° inklination for dækning i himmelplanet. Relætilstande pr. epoke integreres fremad under <c3/>-tyngde; testen af synlighed ved <b>Mars-okkultation</b> er geometrien, hvor korden frit passerer kuglen (<c4/>, testet: et diametralt modsat relæ er okkulteret, et relæ lige oven over er synligt). <b>Ærligt omfang:</b> en minimal repræsentativ geometri for udsendelse plus relæ bygget af offentliggjorte Mars-konstanter — ikke et bestemt flyvekonstellationsdesign.

seg-b53ea4dd9f7d = Scenarie <c1/> kan nås via CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

seg-3a01d13ad2e7 = <c1/> / <c2/> er koblet ind som scenariet <c3/> på alle overflader (D3.3): CLI-kørslen, Python-bindingen, WASM-/playground-bygningen og MCP-serverens dispatch fører alle til det (rundtur-test for <c4/> <c5/>). Medleverede referencescenarier: <c6/>, <c7/>, <c8/>. Resultatet bærer en eksplicit <c9/>, der betegner kvalitetsmålet som en kovariansgrænse (ikke et certificeret PL), og uddata <c10/> / <c11/> gentager ærlighedsmærkatet.

seg-28a49a455a74 = MARCONI / LightShip-målene gengivet: <b>< { "100" } m orbiter</b>, <b>< { "15" } m rover</b>

seg-28da71940857 = <c1/>: de offentliggjorte programmål for MARCONI / LightShip (orbiter < { "100" } m, overflade/rover < { "15" } m) gengivet i simulation. <b>Fælles forudsætninger:</b> standardkonstellationen MARCONI med fem relæer; hvert relæ i sigte giver en afstand + Doppler med én vej pr. epoke; en kohærent stationspassage med to veje hvert <b>{ "30" } min</b>; støj af DSN-klassen (<b>afstand σ = { "1" } m, Doppler σ = { "0.1" } mm/s</b>); det fælles fusionsfilter med reduceret dynamik for bane + ur med 3 tilstande, startet fra en a priori-tilstand, der er <b>~{ "2.7" } km</b> forstyrret (stramhed { "0.1" }); kvalitetsmål = konvergeret 3D-positions-RMS over buens bagerste halvdel i forhold til den syntetiske reference. <b>Orbiter</b> (LMO ~{ "400" } km / { "60" }° incl., <b>USO</b>-ur, kadence { "60" } s, bue på ~{ "2" } timer ≈ ét omløb): opnået konvergeret RMS <b>≈ { "0.40" } m</b> ≪ målet på { "100" } m (middel { "3.1" } relæer i sigte, kovarians SPD hele vejen). <b>Rover</b> (fast ækvatorialt overfladepunkt, <b>USO</b>-ur, kadence { "30" } s, bue på ~{ "2" } timer): opnået konvergeret RMS <b>≈ { "5.1" } m</b> < målet på { "15" } m (middel { "3.0" } relæer i sigte, kovarians SPD). <b>Begge mål er nået uden at løsne nogen påstand</b> — USO er den <em>mindre</em> kapable af de realistiske urklasser ombord (et DSAC ville kun hjælpe), og kadencen på 30 min for to veje er konservativ for en rutinemæssig relænetværksplan, så forudsætningerne er fysisk rimelige for et system af MARCONI-klassen og ikke tunet til at bestå. <b>Ærligt omfang:</b> simuleret gengivelse under de angivne forudsætninger, IKKE en flyvepåstand eller et certificeret beskyttelsesniveau; den syntetiske reference i lukket sløjfe deler filterets Mars-dynamik og observationsmodel.

seg-37b2bad62854 = Månens koordinattid — relativistisk urrate Jord–Måne (<c1/>)

seg-787705fa0fac = En tidsskala for månens koordinattid (LTC/TCL (TCL: Temps-Coordonnée Lunaire, den franske betegnelse for månens koordinattid)) kræver den sekulære rate, hvormed et ur på månens overflade går i forhold til et ur på Jordens geoide (TT). <c1/> beregner den ud fra første principper: en første post-newtonsk identitet, der summerer <b>forskellen i selvpotentiale</b> (IAU's <c2/> konventionelle geoidepotentiale <c3/> minus Månens selvpotentiale på overfladen <c4/>) og det <b>kinetiske led (andenordens Doppler)</b> <c5/> fra Månens geocentriske hastighed (differenskvotient af den lunare række fra Montenbruck–Gill i <c6/>). Det dominerende selvpotentialeled giver <b>≈ { "57.5" } µs/dag</b>, det kinetiske led <b>≈ −{ "0.5" } µs/dag</b>, i alt <b>≈ { "57" } µs/dag</b>. Scenariet <c7/> rapporterer denne rate, den akkumulerede LTC−TT-forskydning over en horisont og understøtter et minimalt ensemble med invers varians (et månens papirur); omregninger mellem TT og LTC går rundt til < { "1" } ns/dag.

seg-beeb6561ef6b = Uafhængig reference / ærligt omfang

seg-4500e65ede97 = Relativistisk urrate Jord–Måne (LTC/TCL)

seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Uafhængig reference: en intern lukket relativistisk identitet</b> (IAU's <c6/> / geopotentialet fra IERS-konventionerne og selvpotentialet GM/r (GM: gravitationsparameter, G gange massen)), <b>krydskontrolleret mod det offentliggjorte bånd for månens urrate [{ "56" }, { "59" }] µs/dag</b>. Tests (<c7/>): selvpotentialeleddet ≈ { "57.5" } µs/dag, Månens hastighed ≈ { "1" } km/s, det kinetiske led lidt negativt, summen i båndet med de navngivne led, der summerer til den, LTC−TT-forskydningen på 1 dag ≈ { "57" } µs og en rundtur mellem TT og LTC på < { "1" } ns/dag. <b>Ærligt omfang:</b> hovedtallet i µs/dag er <b>afhængigt af referencen</b> — det afhænger af de valgte referenceflader (Jordens geoide <c8/> i forhold til en selenoide på Månen), vinduet for tidsmiddelværdi og de forsømte centrifugal-/J₂-korrektioner under µs/dag — hvorfor det udgivne output er et <b>bånd</b> og ikke ét enkelt certificeret tal. Dette er en <c9/>-kontrol af selvkonsistens, <b>IKKE</b> en ekstern validering, <b>IKKE</b> absolut nøjagtighed under nanosekundet og <b>IKKE</b> certificeret til operativ tidsholdning.

seg-b4e3228c84b8 = Geodætisk VLBI på Månen — nærfeltsforsinkelse for en baseline på Jorden, der observerer et fyr på Månen (<c1/>)

seg-bbb634953ebf = En geodætisk VLBI-observabel (very-long-baseline interferometry) for to jordstationer (en baseline), der observerer et signal med én vej fra en sender af NovaMoon-klassen på månens overflade. Månen er i <b>nærfeltet</b> og ikke en plan bølge, så den geometriske forsinkelse er den nøjagtige forskel mellem to afstande <c1/> og ikke projektionen i himmelplanet. Den fulde observabel tilføjer forskellen i stationernes urforskydning og et differentieret Shapiro-led for Jordens potentiale (genbrugt fra <c2/>). Stationerne placeres i geocentriske inertiale koordinater (GCRS) via <c3/> + <c4/>; fyret via <c5/> (geocentrisk Måne) + <c6/> (selenografisk→MCMF (MCMF: Moon-centred, Moon-fixed)) + <c7/> (IAU-2015 ME kropsfast→inertial). Scenariet <c8/> udtager stikprøver af forsinkelsen, dens differenskvotientrate og nærfeltskorrektionen over en passage.

seg-b2b758337ebc = Den <b>uafhængige reference</b> er den planbølge-Δ-DOR-observable <c1/> i <c2/> fra den samme kodebase: i fjernfeltsgrænsen (et syntetisk fyr ved { "1e15" } m) skal den geometriske forsinkelse gå over i <c3/> til maskinpræcision; ved sand månedistance er nærfeltskorrektionen for bølgefrontens krumning forskellig fra nul (nogle tiere til hundreder af µs). De partielle afledede for fyret <c4/> (og for stationerne) er kontrolleret med central differenskvotient (relativ fejl < { "1e-5" }).

seg-107b9d328f69 = Forsinkelse og partielle afledede for geodætisk VLBI på Månen

seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Uafhængig reference: <c8/></b> — den planbølge-<c9/> (<c10/>) fra den samme kodebase i fjernfeltsgrænsen, plus <b>partielle afledede med differenskvotient</b>. Tests (<c11/>): stationsstørrelse ≈ Jordens radius, fyrets afstand ved månedistance ({ "356" }–{ "407" } Mm), den geometriske forsinkelse i fjernfeltet stemmer med <c12/> til < { "1e-9" } s, en nærfeltskorrektion forskellig fra nul ved månedistance, partielle afledede for fyr/station med FD inden for { "1e-5" } relativt, et nøjagtigt urled og en endelig scenariekørsel via <c13/>. <b>Ærligt omfang:</b> <c14/>, <b>IKKE</b> valideret mod rigtige VLBI-data. Polbevægelsen er udeladt (<c15/>), så stationernes inertiale positioner har en referencesystemfejl på nogle få meter; fyret blander en række for Månen med middelækvator for datoen med en kropsfast ICRF-forskydning (International Celestial Reference Frame) (<c16/>), en inkonsistens i referencesystemet under modellens troskab, men ikke stringent; og der er ingen iteration af lystid, jordrotation under lystid, medier (tropo/iono/plasma) eller aberration ud over det differentierede Shapiro-led. Ingen TRL (technology readiness level), flyvearv eller agenturs tilslutning er påstået. { "0.30" }: mod ANISE-lystider gennem DE440 ligger ingen forsinkelse på denne analytiske sti inden for { "1" } ps (største gab { "24" } µs); resultatet er fastlåst.

seg-d90c67f098f7 = <c1/> (DE440 for Jorden og Månen, DE440-hovedakser for Månen, ITRF93-jordorientering, hver lystid konvergeret i det barycentriske referencesystem), kørt af scenariet <c2/>, når de tre kernestier er sat. <b>Uafhængig reference: bibliotek</b> — lystider konvergeret med NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) til DSS-14/43/63, fastsat på forhånd: { "75" } forsinkelser inden for { "1" } ps (værst { "0.06" } ps), partielle afledede for fyr og station inden for { "1e-6" }, ved { "25" } epoker nær J2000 (en ændring, efter at { "2024" } epoker slog fejl på SPICE's egen emissionsepoke i dobbelt præcision, ca. { "6" } ps, oplyst og fastlåst). Det differentierede Shapiro-led, forsinkelsesraten og nærfeltskorrektionen i scenariet er ikke sammenlignet.

seg-8bed75c5402d = Fælles OD med flere teknikker + ur på Månen — simuleret genfinding i lukket sløjfe (<c1/>)

seg-d518eead07c4 = En batch-mindste-kvadraters tilpasning for én epoke (øjebliksbillede) (<c1/>, et Householder-QR-trin siden { "0.30" }), der <b>fusionerer teknikkerne geodætisk VLBI, radiometrisk/lokal afstandsmåling på Månen og afstandsmåling mellem satellitter</b> på et SIMULERET lunart netværk for <em>sammen</em> at genfinde 3D-positionen af en station på månens overflade, positionerne af hver satellit i en lille konstellation og hvert aktivs urforskydning. Observablene er: ({ "1" }) geodætiske VLBI-forsinkelser for baseline på Jorden til månestationen behandlet som fyret (genbrug af <c2/>, geocentrisk inertial) — hovedteknikken; ({ "2" }) geocentriske radiometriske afstande fra jordstation til satellit (som multilaterer konstellationen ud fra de vidt spredte jordstationer) og lokale afstande mellem station og satellit på Månen (euklidisk MCI-afstand (Moon-centred inertial) plus det differentierede urled); ({ "3" }) afstande mellem satellitter (samme form); plus én pseudoobservation af stationsurets synkronisering, der forankrer den ellers uobserverbare fælles urforskydning. Tilstandsvektoren er <c3/>. Der er <b>ingen propagering af kraftmodel inde i løseren</b> — satellitterne er faste, adskilte, illustrative punkter på en repræsentativ månebane; det er en bevidst ren tilpasning af et øjebliksbillede. Internt skaleres positioner, og ure estimeres i afstandsækvivalente meter, så normalmatricen forbliver veltilstandet i f64; VLBI-afstandene og afstandene på Månen er middelfjernet omkring den nominelle geometri, så Jacobi-matrixen med differenskvotienter ikke rammes af katastrofal udslettelse. Scenariet <c4/> kører løsningen med og uden VLBI-benene på samme seed/reference og rapporterer begge løsninger plus forbedringsfaktoren for stationens observerbarhed.

seg-f634e976b583 = Det <b>ærlige hovedresultat</b>: lokal afstandsmåling på Månen fra en polarstation til en håndfuld satellitter, der alle står mod den ene side af himlen, efterlader stationens position <b>svagt observeret langs én retning</b>, så løsningen med kun afstand er dårligt konditioneret, og den genfundne 3D-fejl for stationen er stor (eller løsningen konvergerer ikke). <b>Når VLBI-forsinkelserne for baseline på Jorden lægges til, bliver stationens fulde 3D-position observerbar</b>, og den genfundne stationsfejl falder til meterniveau. Testen <c1/> hævder, at stationsfejlen med VLBI er mærkbart (≥{ "5" }×) mindre end fejlen med kun afstand på den samme indlagte reference — at VLBI genskaber den ellers uobserverbare stationsretning er hele pointen med fasen.

seg-d5feea2381b7 = Den <b>uafhængige reference</b> er intern konsistens: en indlagt referencetilstand (station ~{ "50" } m/akse, satellitter ~{ "30" } m/akse, ure ~{ "1e-7" } s, med en jitter pr. komponent fra seed) afbildes til syntetiske observable gennem den <em>samme</em> geometrimodel, som løseren inverterer, gaussisk støj fra seed lægges til (illustrative standarder: VLBI σ ≈ { "1e-11" } s, afstand σ ≈ { "0.1" } m, ISL σ ≈ { "0.1" } m; vægte <c1/>), og estimatoren skal genfinde den indlagte reference inden for støjen ud fra et startgæt på nuller. En Monte Carlo-middel-NEES <c2/> over seeds (<c3/>) ligger inden for et løst bånd omkring <c4/>, en kontrol af kovariansens realisme.

seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: løserens lineære algebra)

seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Uafhængig reference for { "0.30" }: P2</b> — numpy { "2.4.6" } (LAPACK gelsd og inv) genberegner hvert Gauss–Newton-trin, den konvergerede vægtede løsning, de formelle sigmaer og stationsfejlen på de indlagte Jacobi-matricer for seks netværk (<c4/>, trin inden for { "2.4e-11" }, sigmaer inden for { "1.3e-11" }); de fysiske observationsmodeller og størrelser forbliver MODELLED. <b>Tidligere uafhængig reference: <c5/></b> — genfinding af en indlagt simuleret reference + NEES-kovariansens konsistens. Tests (<c6/>): fuld fusion genfinder referencen (station < { "5" } m, satellit-RMS < { "5" } m, ure < { "1e-8" } s, konvergeret); VLBI genskaber stationens 3D-observerbarhed (stationsfejl ≥{ "5" }× mindre med VLBI end med kun afstand på den samme reference); deterministisk (samme seed → bit-identisk løsning, anden seed → anderledes, men genfundet); middel-NEES inden for et løst bånd omkring <c7/>; endelige/sikrede rapporterede tal, selv når kun afstand er dårligt konditioneret; scenariet sendt via <c8/>. <b>Ærligt omfang:</b> dette er en <b>simuleret genfinding i lukket sløjfe</b> — referencen deler observationsmodellen — <b>IKKE</b> validering mod rigtige data; ingen propagering af kraftmodel inde i løseren; satellitpositionerne og geometrien for jordstation/månestation er illustrative. Ingen TRL, flyvearv eller agenturs tilslutning er påstået.

seg-7620f3a821f6 = Realisering af lunart referencesystem — tilpasning af datum med 7-parameter Helmert (<c1/>)

seg-240271b9d7de = Hvor <c1/> <em>anvender</em> IAU's WGCCRE-orientering af Månens legeme fra { "2015" } (en fremadrettet model), <em>estimerer</em> (realiserer) dette modul et lunart referencesystem ud fra et netværk af estimerede punktkoordinater knyttet til et datum. Estimationskernen er en klassisk <b>ligedannethedstransformation (Helmert) med 7 parametre</b> — tre translationer, tre rotationer med lille vinkel og én skalaparameter — der afbilder punkter <c2/> (estimeret referencesystem) til <c3/> (datumreferencesystem) som <c4/>, med <c5/> bygget af <c6/>. De syv parametre <c7/> estimeres ud fra ≥ { "3" } ikke-kollineære punktpar med vægtede mindste kvadrater gennem <c8/>: den fremadrettede model forudsiger hvert <c9/> ud fra dets <c10/> og flader alle tre komponenter af alle punkter ud i observationsvektoren, de observerede datumkoordinater danner <c11/>, vægtene er <c12/>, og løsningen starter fra <c13/>. Rotationsvinkler estimeres i µrad og skala i ppb, så Jacobi-matricen med differenskvotienter forbliver veltilskalet ved størrelsen af koordinater på månens overflade (~{ "1.7e6" } m). En lille <c14/> sammensætter den realiserede lille rotation gennem IAU's orientering fra legeme til ICRF (<c15/>) og returnerer det realiserede referencesystems residuale forskydning med lille vinkel om ICRF-akserne — en bevidst simpel ændring af udtryksform for referencesystemet, <b>ikke</b> et uafhængigt estimat af månens pol.

seg-75769fc9671c = Den <b>uafhængige reference</b> er intern konsistens: en kendt Helmert-transformation (translation ~nogle tiere m, rotation ~µrad, skala ~{ "1e-7" }) <em>lægges ind</em> i et vidt spredt syntetisk punktnetværk (varierende selenografisk bredde/længde → MCMF, nogle punkter i højde), gaussisk støj fra seed lægges til, og tilpasningen skal genfinde de indlagte parametre. På støjfri data er genfindingen til ~maskinpræcision (translation < { "1e-6" } m, rotation < { "1e-9" } rad, skala < { "1e-12" }); med støj på en meter lander de genfundne parametre inden for nogle få × den formelle σ, og RMS-residualet efter tilpasning ligger nær støjniveauet. Scenariet <c1/> rapporterer det genfundne datum, genfindingsfejlen pr. parameter i forhold til den indlagte reference, RMS-residualet efter tilpasning og ICRF-orienteringsknytningen for den realiserede rotation.

seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Uafhængig reference: <c6/></b> — genfinding af en indlagt ligedannethedstransformation med 7 parametre plus den algebraiske identitet for rundtur i <c7/>. Tests (<c8/>): støjfri genfinding af den indlagte transformation (translation < { "1e-6" } m, rotation < { "1e-9" } rad, skala < { "1e-12" }); genfinding med støj inden for nogle få × σ og RMS-residual nær støjniveauet; anvend-så-invertér-rundtur; deterministisk (samme seed → bit-identisk, anden seed → anderledes, men genfundet); ICRF-knytning ved nulrotation er nul, og knytningen bevarer rotationens størrelse; scenariet sendt via <c9/>. <b>Ærligt omfang:</b> dette er en kontrol af <b>selvkonsistens</b> — den genfinder en <em>indlagt</em> transformation på et <em>syntetisk</em> netværk — <b>IKKE</b> en realisering af det lunare referencesystem mod rigtige sporings-/VLBI-data, og den påstår ingen absolut nøjagtighed af referencesystemet. ICRF-orienteringsknytningen er en simpel ændring af udtryksform, ikke et uafhængigt polestimat. Ingen TRL, flyvearv eller agenturs tilslutning er påstået.

seg-f14930d33f47 = Servicevolumen for månenavigation — DOP / dækning / tilgængelighed + generaliseret ARAIM-PL på Månen (<c1/>)

seg-9b4f13e138e4 = Dette modul <em>sammensætter</em> allerede byggede dele til en <b>servicevolumen</b>-analyse for månenavigation: det sweeper et selenografisk bredde-/længdegitter over en tidshorisont mod en <b>illustrativ konstellation i månebane af klassen Moonlight / LCNS fra offentlige kilder</b> (LCNS: Lunar Communications and Navigation Services) og rapporterer DOP / dækning / tilgængelighed plus en generaliseret ARAIM-kurve for beskyttelsesniveau på Månen. De to genbrug er bærende og eksplicitte. <b>DOP-geometrien</b> er den <b>VALIDATED</b> (mod gnss_lib_py) kerne <c1/> — <c2/> er et tyndt filter for elevationsmaske plus den kerne, og en test hævder identiteten (<c3/> er lig med et direkte <c4/> på de samme synlige positioner). <b>Integritet</b> genbruger LunaNet LNIS' (LunaNet Interoperability Specification) maskineri for ARAIM på Månen <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> generaliserer det eksisterende beskyttelsesniveau ved sydpolen til et vilkårligt overfladepunkt, og en test hævder, at det <b>reduceres til sydpolstilfældet</b> (ved sydpolen med samme geometri/budget returnerer det nøjagtigt det eksisterende <c8/>-resultat til < { "1e-9" }).

seg-456bf257f689 = Konstellationens parametre er en <b>illustrativ tilnærmelse af ESA's offentlige beskrivelser</b> af systemklassen (≈ { "4" } satellitter på elliptiske frosne månebaner, der favoriserer dækning af sydpolen — apolun over den sydlige halvkugle; { "4" } er bibliotekets standard, og den medleverede <c1/> sætter { "8" }, fordi beskyttelsesniveauet kræver mindst { "6" } i sigte). De er <b>ikke</b> den rigtige Moonlight/LCNS-efemeride og antyder <b>ingen</b> tilknytning, tilslutning, arv, certificering eller TRL. Sammensætningen (dækning / tilgængelighed / integritet) er <b>MODELLED</b>: et sæt relæer i cirkulær/elliptisk Kepler-bane (ikke en differentielt korrigeret LCNS-/NRHO-efemeride (near-rectilinear halo orbit) { "9" }:{ "2" }), en Måne med middelrotation (ingen fysisk libration / præcederende pol) og offentliggjorte integritetsparametre fra LunaNet LNIS. Den viser <em>metoden</em> for servicevolumen, ikke et operativt tal for tilgængelighed. Deterministisk (ren geometri; ingen tilfældighed). Scenariet <c2/> rapporterer dækningsprocenten, kuverterne for antal synlige og PDOP, HPL/VPL-kuverten over volumenet og tilgængeligheden af beskyttelsesniveauet i forhold til alarmgrænsen.

seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>DOP-geometri valideret ved genbrug</b> af den kerne <c7/>, der er valideret mod gnss_lib_py; integritet genbruger ARAIM på Månen fra den offentliggjorte LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Tests (<c9/>): <c10/> er en identitet på den validerede kerne; <c11/> ved sydpolen er lig med det eksisterende <c12/>-PL til < { "1e-9" } (reduceres til sydpolstilfældet); dækningen er ikke-aftagende med konstellationens størrelse; synligheden respekterer elevationsmasken; scenariet er deterministisk og sendes via <c13/>. <b>Ærligt omfang:</b> konstellationen er <b>illustrativ, fra offentlige kilder, IKKE tilknyttet ESA</b> — ikke den rigtige Moonlight/LCNS-efemeride; sammensætningen af dækning/tilgængelighed/integritet er <b>MODELLED</b> (relæer i cirkulær/elliptisk Kepler-bane, Måne med middelrotation, offentliggjorte LNIS-parametre), <b>IKKE</b> et operativt tal for tilgængelighed for Moonlight. Ingen TRL, flyvearv eller agenturs tilslutning er påstået.

seg-4ff4929f71df = Differentiel PNT på Månen — udslettelse af fællestilstand + residual, der vokser med baseline + DGNSS-beskyttelsesniveauer (<c1/>)

seg-8f94c4bf3fe6 = En analogi til DGNSS (differentiel satellitnavigation) / SBAS på Månen: en <b>referencestation af NovaMoon-klassen</b> på et <em>kendt</em> selenografisk sted beregner differentielle korrektioner pr. satellit ud fra en <b>illustrativ konstellation af klassen Moonlight / LCNS fra offentlige kilder</b>, og en roving-bruger, der er forskudt fra den med en baseline, anvender dem, så de <b>fælles</b> fejl i den udsendte efemeride udlignes. Hver satellit <c1/> bærer en indlagt fælles 3D-banefejlvektor <c2/> og en fælles urfejl <c3/>. Referencestationens pseudoafstandsresidual er korrektionen <c4/>; brugerens rå fejl er <c5/>; den korrigerede brugerfejl er deres forskel <c6/>. <b>Urleddet <c7/> udlignes nøjagtigt</b> (det er identisk i begge observationer), og <b>banedelen går over i projektionen på forskellen mellem de to enhedsvektorer for sigtelinjen</b>, som → { "0" }, når baselinen → { "0" } (gulvet for rumlig dekorrelation) og vokser ≈ lineært med baselinen. De korrigerede afstandsfejl pr. satellit afbildes gennem brugergeometrien af en lille, afhængighedslet løsning af et øjebliksbillede med vægtede mindste kvadrater (<c8/>-tilstand via <c9/>; en konstant afstandsbias optages af urets ukendte i stedet for at ødelægge positionsbestemmelsen) og giver brugerens <b>positionsfejl</b>. Brugerens <b>beskyttelsesniveau genbruger maskineriet for SBAS-beskyttelsesniveau fra DO-229E</b> (<c10/>, K-faktorer for præcisionsindflyvning) med det differentielle residuale σ som hver satellits 1-σ-fejlbudget.

seg-06978cfaebe3 = NovaMoon henvises <b>kun til som systemklasse</b> (en offentlig beskrivelse af en referencestation på Månen); konstellationen genbruger den illustrative <c1/> fra offentlige kilder. Det er illustrative parametre til at afprøve den differentielle <em>metode</em>, <b>ikke</b> en rigtig efemeride, og de antyder <b>ingen</b> tilknytning, tilslutning, arv, certificering eller TRL. Scenariet <c2/> rapporterer brugerens positionsfejl med og uden korrektioner, reduktionsfaktoren, kurven for fejl som funktion af baseline og beskyttelsesniveauet. I standardkonfigurationen er den korrigerede brugerfejl ved en baseline på { "50" } km ≈ { "0.008" } m mod ≈ { "24" } m ukorrigeret (en reduktion på ~{ "3000" }×) og ≈ { "0" } ved nul baseline.

seg-6bb4dbe998f9 = Den <b>uafhængige reference</b> er intern konsistens: udslettelsen af fællestilstanden er en <b>nøjagtig algebraisk identitet</b> (med <c1/> er den korrigerede fejl < { "1e-6" } m ved nul baseline; urleddet udlignes til maskinpræcision ved enhver baseline), residualet <b>vokser monotont med baselinen</b>, og beskyttelsesniveauet er den <b>samme DO-229E-algoritme</b>, som SBAS-stakken er fastlåst mod. Residualet fra rumlig dekorrelation er en geometrisk model af <b>første orden</b>, <b>ikke</b> en tilpasset dekorrelationsmodel fra rigtig sporing på Månen.

seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Uafhængig reference: <c6/></b> — identiteten for differentiel fejludligning plus genbrug af maskineriet for SBAS-beskyttelsesniveau fra DO-229E (<c7/>). Tests (<c8/>): ved nul baseline er den korrigerede brugerfejl og hver korrigeret afstandsfejl pr. satellit ~{ "0" } (< { "1e-6" } m) og ≪ den ukorrigerede fejl; urleddet udlignes nøjagtigt ved enhver baseline (tilfældet med banefejl nul); den korrigerede fejl vokser monotont med baselinen, mens den forbliver ≪ den ukorrigerede ved moderate baselines; differentiel slår selvstændig med en tydelig margin (> { "2" }×); beskyttelsesniveauet er lig med et direkte kald af <c9/> og skalerer med residualet σ; underbestemt geometri returnerer <c10/>; scenariet er deterministisk (seed) og sendes via <c11/>. <b>Ærligt omfang:</b> <b>MODELLED</b> — udslettelsen af fællestilstanden er en nøjagtig identitet, men residualet fra rumlig dekorrelation er en geometrisk model af <b>første orden</b>, <b>ikke</b> en tilpasset dekorrelationsmodel fra rigtig sporing på Månen, og dette er <b>ikke</b> valideret mod rigtige data. NovaMoon henvises <b>kun til som systemklasse</b> (illustrativ, fra offentlige kilder, <b>ikke tilknyttet ESA</b>). Ingen TRL, flyvearv eller agenturs tilslutning er påstået.

seg-08e8a73f3426 = Eksport til interoperabilitet på Månen — CCSDS OEM + KIF afstemt til LunaNet/IOAG med formatkontrol ved rundtur (<c1/>)

seg-39b875078d27 = Månens referencesystem, tidsskala og efemeride eksporteres i <b>CCSDS-baserede udvekslingsformer afstemt til LunaNet/IOAG (IOAG: Interagency Operations Advisory Group)</b>. Denne fase opfinder <b>ikke</b> et nyt ledningsformat: den <b>genbruger</b> cratens eksisterende CCSDS OEM-udsender (Orbit Ephemeris Message) { "2.0" } og -fortolker (<c1/> / <c2/>) og Kshana Interchange Format-konvolutten (<c3/>), mærket om til lunar kontekst. <c4/> sætter OEM's <c5/> til <b>IAU's WGCCRE-legemereferencesystem for Månen fra { "2015" }</b> (<c6/> mean-Earth eller <c7/> hovedakser), <c8/> til <b>månens tidsskala</b> (<c9/> / <c10/> / <c11/>) og <c12/> til <c13/>, over en <b>illustrativ efemeride af klassen LCNS fra offentlige kilder</b> som eksempel (positioner fra <c14/>, hastighed ved central differenskvotient). <c15/> udsender en deskriptor for månetid afstemt til LunaNet/IOAG (skalaens id, sekulær rate i µs/dag fra <c16/>, det offentliggjorte bånd på { "56" }–{ "59" } µs/dag, referenceflade), som går rundt gennem serde_json. <c17/> pakker OEM + deskriptor + referencesystemets mærkat ind i den eksisterende KIF-konvolut med ærlighedsmærkatet MODELLED.

seg-bbfce5323abb = Den <b>uafhængige reference</b> er rundtur / feltkontrol. Fordi <c1/> leverer <em>begge</em> retninger, sendes OEM'en en rundtur gennem <c2/> (tilbage til et lige segment, med månens referencesystem/tid og antallet af tilstande bevaret) <b>og</b> kontrolleres uafhængigt af <c3/>, som verificerer, at hvert krævet CCSDS/LunaNet-headerkeyword er til stede, at <c4/> bærer et lunart <c5/>-token, og at <c6/> ikke er tom, at indrammingen <c7/> holder, og at linjerne med position+hastighed er velformede — og returnerer en struktureret bestået-markering plus listen over til stede/manglende felter, så en ødelagt eksport (fx et manglende <c8/>) opdages og navngives. Tidsmetadataene går rundt gennem <c9/>, og KIF-konvolutten går rundt gennem <c10/> til lige artefakter med mærkatet MODELLED.

seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Uafhængig reference: <c7/></b> — deterministisk rundtur (CCSDS OEM via <c8/>; KIF via <c9/>; tidsmetadata via serde_json) plus kontrol af feltnavne mod offentliggjorte felt-semantikker for CCSDS OEM + LunaNet/IOAG. Tests (<c10/>): den eksporterede OEM bærer det lunare <c11/> (<c12/>/<c13/>) og tokens for <c14/> (<c15/>/<c16/>), <c17/>, objektet og velformede datalinjer; månens tidsmetadata går rundt (rate/bånd/reference) og afviser sludder; KIF-konvolutten serialiseres og deserialiseres til en lige værdi med ærlighedsmærkatet MODELLED til stede; en bevidst ødelagt OEM (uden <c18/>) fejler <c19/> og rapporteres som manglende; scenariet sendes via <c20/>. <b>Ærligt omfang:</b> feltets <b>navne/enheder</b> er afstemt til <b>offentlige</b> standarder (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } lunare referencesystemer, LunaNet Interoperability Specification / IOAG's lunare arkitektur); eksporten er <b>MODELLED</b> — deterministisk rundtur + kontrol af feltnavne er den uafhængige reference, dette er <b>IKKE</b> en certificeret test af interoperabilitet, efemeriden er <b>illustrativ, fra offentlige kilder, ikke tilknyttet ESA</b>, og ingen TRL, flyvearv eller agenturs tilslutning er påstået.

seg-69a214b7236d = Forudsigelser fastsat på forhånd

seg-343fe86f6a50 = En forudsigelse fastsat på forhånd er et MODELLED resultat, der fastfryses, før der findes data til at bedømme det, og hvor protokollen for bedømmelsen fastlægges samtidig. Den er ikke en validering og tilføjer ingen række i registeret. Hver ligger i <c1/> med sine fastfrosne inddata, sit resultat og deres SHA-256-hashes, og <c2/> fejler, hvis en fastfrosset byte ændres; en ændret forudsætning besvares med en ny, dateret forudsigelse ved siden af den gamle, aldrig ved at redigere den.

seg-e65d79893e2c = Forudsigelse

seg-f9e2d4b52b79 = Fastfrosset

seg-dd68891f75e2 = Bedømt mod

seg-d5a09f26a028 = Dækning fra en referencestation på Månen

seg-c68f124a16e7 = c05dac1d, 2026-10-12

seg-293404a9cb92 = offentliggjort nøjagtighed, tilgængelighed, dækning og beskyttelsesniveauer for en differentiel station ved månens sydpol, fra en hvilken som helst part

seg-4e7d9449a880 = endnu ikke bedømt (ingen offentliggjorte resultater)

seg-ad1995b3ed17 = Register over repræsentativitet og afstand til flyvning i en demonstration (<c1/>)

seg-86b70551c37f = Et simuleringsresultat er kun brugbart som evidens, hvis det på selve siden angiver, hvad det er forankret i, hvad det antager, og hvad der stadig adskiller det fra et flyvesystem. Registeret over repræsentativitet gør det til et førsteklasses, maskinkontrolleret output: en <c1/>-post bærer demonstrationens eksterne <c2/>-forankringer, dens modellerede forudsætninger, dens <c3/>-afstande til flyvning (hver med den fase/aktivitet, der ville lukke den), og det TRL-bånd, den er repræsentativ for. Det er ledsageren pr. resultat til matrixen <c4/> på funktionsniveau.

seg-ccd039d5e6a4 = Den <b>uafhængige reference</b> er et sæt lukkede invarianter, håndhævet af <c1/>: en <c2/>-post skal angive mindst én <c3/>-forankring (en simulation kan ikke valideres mod sig selv); en <c4/>-post skal angive mindst én afstand til flyvning og kan ikke påstå et repræsentativt TRL-bånd over { "4" } (modning ud over det kræver hardware-/flyvningsevidens, hvilket er en afstand og ikke et simuleringsoutput); TRL-båndet skal være velformet; og en <c5/>-post må ikke hævde noget. Disse invarianter operationaliserer disciplinen "repræsentativitet begrundet + resterende afstande til flyvning tydeligt identificeret".

seg-6b29111096ca = Register over repræsentativitet og afstand til flyvning

seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Uafhængig reference: <c8/></b> — lukkede ærlighedsinvarianter knyttet til grænsen mellem status og type af uafhængig reference i <c9/>. Tests (<c10/>): en Validated-post uden ekstern forankring fejler; en intern forankring (ReferenceImpl) opfylder ikke Validated; en Modelled-post uden afstand fejler; en Modelled-post over TRL { "4" } fejler; fejlformede TRL-bånd opdages; posten serialiseres til JSON med de forventede felter og giver en læsbar rapport. <b>Ærligt omfang:</b> registeret kontrollerer <em>klassificeringen</em> af et resultats evidens — det beviser ikke, at de navngivne forankringer fører til levende tests (de er kuraterede, præcis som matrixen <c11/>); påstanden om "maskinkontrolleret" er afgrænset til invarianterne for status/forankring/afstand/TRL.

seg-7e9190395eb6 = Samlet evidens for afvejning mellem kvante og klassisk (<c1/>)

seg-534e48755e2c = Ethvert anvendelsesområde for kvante-PNT besvarer det samme spørgsmål på samme måde: fastlæg ét sammenligningsgrundlag (scenarie + seed + motorversion), send en kvantekandidat og en klassisk baseline gennem én neutral kodesti, bedøm dem på fælles kvalitetsmål og rapportér — med et konfidensinterval og et ærligt mærkat for valideret/modelleret — hvor kvante vinder, og hvor det ikke gør. <c1/> giver dette svar én enkelt form, så lodretterne for tidssynkronisering, navigation og anomalidetektion alle udsender det <b>samme</b> reproducerbare, ærligt mærkede objekt. Det genimplementerer ingen afvejning: tallene pr. kvalitetsmål kommer fra de eksisterende motorer (<c2/>, <c3/> og lodretternes moduler); dette er kontrakten plus indpakningen for reproducerbarhed/repræsentativitet, bygget på registeret over repræsentativitet og verifikationsmærkaterne.

seg-5a52fb6670d1 = Den <b>uafhængige reference</b> er lukkede identiteter for fordel/vinder plus en tro indpakning af det eksisterende resultat af afvejningen. <c1/>: fordelsforholdet har korrekt polaritet (orienteret, så <c2/> altid betyder, at kvantesiden er bedre, både for holdover, hvor højere er bedre, og for fejlkvalitetsmål, hvor lavere er bedre); et evidensobjekt bygget af et rigtigt <c3/> gengiver sine fordelsforhold; uærlig evidens afvises (repræsentativitet af typen modelleret uden afstand, eller et kvalitetsmål af typen <c4/>, hvis afvejningspost ikke bærer nogen ekstern forankring); JSON er deterministisk og bærer felterne for referencesystem/seed/motor/kvalitetsmål/repræsentativitet.

seg-ae87cea429ba = Samlet evidens for afvejning mellem kvante og klassisk

seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Uafhængig reference: <c5/></b> — lukkede identiteter for fordel/vinder + tro indpakning af <c6/>; ærlighed knyttet til registeret over repræsentativitet og grænsen mellem verifikationsstatus og type af uafhængig reference. Tests (<c7/>) som ovenfor. <b>Ærligt omfang:</b> værktøjet standardiserer, <em>hvordan</em> en afvejning rapporteres og gengives; fysikken bag hvert kvalitetsmål er det, den bidragende motor leverer, båret med dens eget mærkat for valideret/modelleret — <c8/> opgraderer ikke et modelleret kvalitetsmål til valideret.

seg-ce13223e04d0 = Bibliotek med fejlmodeller for kvanteenheder (<c1/>)

seg-c206fc7d58d6 = Ét sted, der udstiller de kvante-PNT-enheder, demonstratoren afvejer — optiske / fangede-ion / kviksølv-ion-ure, klassiske referenceure, koldatom-interferometeret og tidsoverførselsforbindelser — hver som et <c1/> med sin hovedspecifikation og en repræsentativitetspost. Det meste af enhedsfysikken er <b>genbrugt</b> (urstabiliteter fra <c2/> og <c3/>; koldatom-interferometeret fra <c4/>/<c5/>; klassiske optiske/RF-forbindelser fra <c6/>). Den ene virkelig nye model er <b>tidsoverførselsforbindelsen med sammenfiltring / enkeltfotoner</b>, hvis tidsmæssige præcision er begrænset af haglstøj: <c7/> i den detekterede koincidensrate <c8/> og integration <c9/>, forringet af en straf for mørketællinger <c10/> og med gulv i en uafvendelig systematisk fejl.

seg-7e8f4f3a5442 = Den <b>uafhængige reference</b> er de genbrugte, offentliggjorte ur-/CAI-koefficienter plus lukkede identiteter for haglstøj/tab. <c1/>: den genbrugte rækkefølge af urstabilitet er fornuftig (optisk gitter < kviksølv-ion < CSAC i σ_y({ "1" } s)); præcisionen for sammenfiltring forbedres som <c2/> ({ "4" }× integration halverer σ), når den er begrænset af haglstøj; den detekterede koincidensrate falder { "10" }× pr. { "10" } dB forbindelsestab; mørketællinger forringer præcisionen monotont; det systematiske gulv afgrænser præcisionen nedadtil; hvert enhedskort er en gyldig, modelleret repræsentativitetspost.

seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Uafhængig reference: <c5/></b> — genbrugte offentliggjorte ur-/CAI-koefficienter + lukkede identiteter for haglstøj/tab for forbindelsen med sammenfiltring. Tests (<c6/>) som ovenfor. <b>Ærligt omfang:</b> enhedsparametrene for ur/CAI er genbrugt fra motorens eksisterende modeller med offentliggjorte koefficienter; modellen for forbindelsen med sammenfiltring er MODELLED ud fra offentliggjort adfærd for kvanteursynkronisering med illustrative værdier for parrate/effektivitet/tab fra offentlige kilder — den er <b>ikke</b> valideret mod en målt forbindelse, og rigtig hardware til kilde/kanal/detektor er en angivet afstand til flyvning.

seg-f6d8e7ad6bec = Pålidelig kvantetidssynkronisering — kæde fra ende til anden, sikker udbredelse, anomali + afvejning (<c1/>)

seg-3160cfec0d1f = Scenariet <c1/> sammensætter den tidskæde, en kvante-PNT-demonstrator har brug for: et tidsbudget for brugeren fra ende til anden (referenceurets coastfejl og forbindelsens tidspræcision kombineret i kvadratur) for en <b>kvante</b>kæde (optisk gitterur + forbindelse med sammenfiltring/enkeltfotoner) i forhold til en <b>klassisk</b> kæde (CSAC + RF-forbindelse med to veje); et <b>beskyttelsesniveau for tid</b> (TPL, genbrugt fra <c2/>), der afgrænser den uopdagede tidsfejl; et <b>sikkerhedskvalitetsmål mod forsinkelses-/replay-angreb</b> <c3/> ved en angivet falsk-alarmrate (genbrugt fra <c4/>); en <b>sandsynlighed for detektion af uranomali + latens for ændringsdetektion med CUSUM (cumulative sum)</b>; og sammenligningen mellem kvante og klassisk som ærlig <c5/> med en repræsentativitetspost + afstande til flyvning.

seg-6fa095264bdc = Den <b>uafhængige reference</b> er et lukket kvadraturbudget over genbrugte, hver for sig validerede kerner (ADEV mod Stable32/NIST; TPL-grænsen; <c1/>/<c2/>). <c3/>: kvantepræcisionen forbedres med integrationstiden; kvantekæden kan vinde <em>og</em> kan tabe på præcisionsmålet (ærligt — ikke en universel sejr; en meget tabsgivende forbindelse vender resultatet); beskyttelsesniveauet er endeligt og positivt; sikkerhedsmålet ligger i [{ "0,1" }] og vokser med angrebsforsinkelsen; sandsynligheden for detektion af anomalier er monoton i fejlens størrelse; og afvejningsevidensen er internt ærlig (<c4/>).

seg-42a7d1170cc3 = Pålidelig kvantetidssynkronisering (kæde + sikker udbredelse + anomali + afvejning)

seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Uafhængig reference: <c5/></b> — lukket kvadraturbudget over genbrugte validerede kerner (ADEV/Stable32-NIST, TPL-grænse, analytisk detektion Pd/Pmd); ærlighed knyttet til registeret over repræsentativitet. Tests (<c6/>) som ovenfor. <b>Ærligt omfang:</b> ur-/forbindelsesparametre er illustrative, fra offentlige kilder; forbindelsen med sammenfiltring er den MODELLED model, begrænset af haglstøj, fra <c7/>; dette modellerer <em>klassen</em> af pålidelige tidssystemer — den er <b>ikke</b> valideret mod en målt forbindelse fra ende til anden, og rigtig hardware til ur/forbindelse/rumkanal er en angivet afstand til flyvning; ingen TRL, flyvearv eller certificering er påstået.

seg-c6ae292a6331 = GNSS-fri kvantenavigation (<c1/>)

seg-f34f784e928c = Scenariet <c1/> sammenligner dødregning under et GNSS-udfald med et <b>kvante</b>-inertialbudget (et accelerometer med koldatom-interferometer, genbrugt fra <c2/>/<c3/>, hvis CAI-gulv for hvid støj er valideret til inden for ~{ "2" } størrelsesordener af Freier et al. { "2016" }) i forhold til et <b>klassisk</b> INS af navigationskvalitet. Det rapporterer væksten i positionsfejl over coasten, holdover-tiden til en positionstærskel og afvejningen mellem kvante og klassisk som ærlig <c4/>. Observerbarheden angives ærligt: uden en ekstern positionsbestemmelse under udfaldet er accelerometerets bias uobserverbar, så positionsfejlen vokser uden grænse (≈ ½·bias·t² plus et led for tilfældig hastighedsgang); en kvantesensor med lavere bias <em>bremser</em> den vækst, men lukker ikke gabet — det gør kun en ekstern positionsbestemmelse.

seg-4cfde3de8f94 = Den <b>uafhængige reference</b> er de genbrugte inertialbudgetter (<c1/>/<c2/>, som begge implementerer traitet <c3/>) plus lukkede identiteter for drift. <c4/>: kvantebudgettet slår det klassiske over et langt udfald (lavere fejl, længere holdover); fejlen vokser med udfaldets varighed for begge (observerbarhedsgabet); fordelen afhænger af udfaldet og er ikke en konstant gevinstfaktor (kvantekurven er støjdomineret ved kort coast og biasdomineret ved lang); afvejningsevidensen er internt ærlig.

seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Uafhængig reference: <c5/></b> — genbrugte inertialbudgetter (CAI valideret ved genbrug ~{ "2" } størrelsesordener i forhold til Freier { "2016" }; klassisk lukket drift); ærlighed knyttet til registeret over repræsentativitet. Tests (<c6/>) som ovenfor. <b>Ærligt omfang:</b> en statisk sammenligning af dødregningsbudgetter, ikke et dynamisk filter på rigtige baner; at bias er uobserverbar uden en positionsbestemmelse er angivet; enhedsparametre er illustrative, fra offentlige kilder; modellerer <em>klassen</em> af GNSS-fri kvantenavigation — rigtig koldatom-IMU-hardware, en dynamisk platform og flyvemiljøet er angivne afstande til flyvning; ingen TRL/flyvning/certificering er påstået.

seg-e23e583ecf21 = Fejl- / anomalidetektion for kvante-PNT-systemer (<c1/>)

seg-6e6df91ae779 = Scenariet <c1/> definerer et mærket katalog over kvante-PNT-fejl (urfrekvenssprong, drift, tab af lås; sensorbiastrin, udfald), bedømmer en detektionsstatistik på nominelle mod fejlbehæftede vinduer og rapporterer detektorens diskrimination som en ROC AUC og en mindste detekterbar fejl ved en fast falsk-alarmrate. Vinklen kvante mod klassisk: en mere stabil kvanteurreference sænker monitorens støj σ, så den detekterer mindre fejl — udsendt som ærlig <c2/> med en repræsentativitetspost.

seg-eeb3c7d1f507 = Den <b>uafhængige reference</b> er en lukket AUC for den gaussiske detektionsstatistik (nominel <c1/>, fejl <c2/> ⇒ <c3/>), krydskontrolleret mod den eksternt validerede <c4/> (valideret mod scikit-learn) og de analytiske tærskler i <c5/>. <c6/>: den analytiske AUC stemmer med kendte værdier ({ "0.5" } ved μ={ "0" }, →{ "1" } for stor μ/σ, monoton); det empiriske bootstrap-AUC-konfidensinterval omslutter den lukkede form; kvantemonitoren har højere AUC og en mindre mindste detekterbar fejl; fordelen forsvinder for enorme fejl (begge detekterer perfekt — ikke en universel margin); kataloget har fem mærkede klasser; afvejningen er internt ærlig.

seg-9dda4ab0647a = Fejl-/anomalidetektion for kvante-PNT

seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Uafhængig reference: <c7/></b> — lukket gaussisk AUC krydskontrolleret mod den eksternt validerede <c8/>-bootstrap-AUC (mod scikit-learn) og analytiske tærskler i <c9/>. Tests (<c10/>) som ovenfor. <b>Ærligt omfang:</b> detektionsstatistikken er en gaussisk model, ikke rigtig telemetri; fejlkataloget er mærket syntetisk; støjniveauerne for kvante-/klassisk monitor er illustrative, fra offentlige kilder; modellerer <em>klassen</em> af anomalidetektion i kvante-PNT — rigtig hardwaretelemetri med mærkater for reference er en angivet afstand til flyvning; ingen TRL/flyvning/certificering er påstået.

seg-24ad75143bed = Standarder: formatkontrol — udvekslingsformater, linkbudget og integritet (kontroller mod ekstern uafhængig reference)

seg-9d31773e0ecd = Disse standarder er valideret ved at genfinde de <b>ordrette regneeksempler / referenceværdier, der er offentliggjort i selve standarderne</b> (eller i en uafhængig referenceimplementering), ikke ved Kshanas egen rundtur. At genfinde en standards eget bilagseksempel er den stærkeste tilgængelige formatkontrol for en fortolker af et udvekslingsformat.

seg-7ec3d508c64f = Ekstern uafhængig reference

seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

seg-65de0a1335d6 = <c1/>: <c2/> genfinder de nøjagtige epoker og tilstandsvektorerne X/Y/Z/Ẋ/Ẏ/Ż i KVN-OEM-eksemplet i <b>CCSDS 502.0-B-3, bilag G §G6, figur G-11</b> ("OEM Example with No Acceleration, No Covariance", s. G-10) — begge efemeridesegmenter, inklusive kildeværdierne med foranstillet nul (<c3/>). Fixturen <c4/> er gengivet tegn for tegn fra den officielle Blue Book (de redaktionelle markeringer "< intervening data records omitted here >", som ikke er gyldige OEM-poster, er ikke med).

seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

seg-a5c6b58e0053 = <c1/>: <c2/> genfinder alle { "41" } RANGE-poster (første { "3198.03679519614" } km, sidste { "3270.46440460551" } km) og metadataene i KVN-TDM-eksemplet i <b>CCSDS 503.0-B-2, bilag E, figur E-9</b> ("Range Data with TIMETAG_REF=TRANSMIT", s. E-9). Fixturen <c3/> er ordret fra Blue Book. (Dette er den uafhængige reference fra den offentliggjorte Blue Book ved siden af den hidtidige, håndskrevne rundtur med <c4/> i <c5/>.)

seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

seg-aaffd3d25c5f = <c1/>: koderen gengiver testvektorerne på byteniveau for primær header fra det uafhængige <b>bibliotek <c2/></b> (us-irs/spacepackets-py, <c3/>) — fx <c4/> og den helt maksimale <c5/> — plus det kanoniske telemetritilfælde (TM) med kun ettaller, hver sendt en rundtur gennem afkodning. Bitfeltbredder/-rækkefølge efter <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (linkbudget, DSN 810-005)

seg-c6caa639e1c6 = <c1/>: kæden for FSPL (free-space path loss) og C/N₀ gengiver den offentliggjorte design-control-tabel for telemetri i rumdybden fra <b>J. H. Yuen (red.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), tabel 1-1</b> — Galileos X-bånds-downlink ({ "8420.43" } MHz) ved { "6.37" } AU: frirumstab <b>{ "290.54" } dB</b> (<{ "0.05" } dB) og modtaget <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). Båndcentrene ligger inden for DSN/CCSDS-401-allokeringerne til downlink i rumdybden (DSN 810-005 modul { "201" }). <em>Standardparametrene for missionen</em> forbliver repræsentative (ikke en kalibreret transponder); det er link-<em>ligningen</em>, der er fastlåst her.

seg-c2cee7d5c7b1 = GNSS-standarder — status for uafhængig reference og de ærlige resterende afstande:

seg-d8f653b3c955 = Status og ærligt forbehold

seg-fff735bd32a1 = <b>Kerne, geometri og ARAIM-beskyttelsesniveauet er eksternt valideret.</b> Detektions<em>kernen</em> — χ²-tærsklen for fejldetektion, ikke-centralitetsparameteren for ikke-central-χ² ved manglende detektion og de normalfordelte K-multiplikatorer — gengiver <b>SciPy</b> (<c1/>, { "171" } tilfælde, ≤ { "1e-6" } rel.), og den omsluttende geometri gengiver <b>gnss_lib_py</b> (DOP). <em>Værdien</em> af ARAIM-beskyttelsesniveauet (PL) er nu også fastlåst: mod WG-C's (WG: Working Group) ARAIM Reference ADD (Algorithm Description Document) v3.1 "LPV-200 (LPV: localizer performance with vertical guidance) numerical example" giver <c2/> / <c3/> VPL { "18.2926" } m mod { "18.3" } m, HPL { "13.4063" } m mod { "13.45" } m og σ_v,acc { "1.3694" } m mod { "1.3694" } m, inden for referencens egen <c4/> = { "0.05" } m (typen <c5/>). Omfang: fejltilstande op til én satellit eller én konstellation (<c6/>); delmængder af fejl med flere hændelser og eksklusion er ikke implementeret, og klassisk RAIM har stadig <b>ingen kanonisk offentliggjort testvektor fra inddata til HPL</b>. Se <a1><c7/></a1>.

seg-e6a47dfb7e54 = <b>Algoritmen for beskyttelsesniveau er nu eksternt valideret.</b> Givet (el, az, σ) pr. satellit gengiver kshanas <c1/> <b>RTKLIB-forken for SBAS-PL</b> (<c2/> <c3/>, Siki & Takács { "2017" }, "DO-229D Appendix J") — fodret med det værktøjs <b>egen</b> σ beregnet ud fra <b>rigtige EGNOS</b>-udsendte meddelelser + rigtig BUTE RINEX — til <b>< { "2e-3" } m HPL</b> over { "6" } epoker (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) bekræftede den identiske konvention. K-faktorerne (<c6/>, <c7/>, <c8/>) stemmer med DO-229E Appendix J. <b>Hvad der er valideret, og hvad der ikke er:</b> dette fastlåser PL-<em>algoritmen</em> (σ ind → HPL/VPL ud); den opstrøms σ-<em>modellering</em> ud fra rå UDRE/GIVE-meddelelser ligger uden for kshanas omfang — det er der, hvor uafhængige <em>værktøjer til hele kæden</em> stadig er uenige med meter på rigtige data. K_V blev matchet ved referencens afrundede { "5.33" } (kshanas nøjagtige <c9/> → VPL ~{ "0.06" } % mindre; den lodrette er valideret uden K-faktor som <c10/>).

seg-4ef39e8ea75c = <b>Udsendt model eksternt valideret.</b> Klobuchar L1-modellen gengiver <b>RTKLIBs <c1/></b> (<c2/>, < { "1e-4" } m) — <em>implementeringsparitet</em> med den facto åbne reference, da der ikke findes noget officielt regneeksempel med <em>målt reference</em>. Læseren af IONEX TEC-kort findes nu (<c3/>, enhedstestet); det resterende gab er en krydskontrol af den mod et rigtigt GIM-produkt, ikke den udsendte model. Se rækkerne for Klobuchar i <a1>Påstande i forhold til virkeligheden</a1>.

seg-fa3058dffb2a = GPS L1 C/A-spredningskode (IS-GPS-200)

seg-53ac231770fb = Kodegenerering kontrolleret eksternt.

seg-04db7c613bd5 = <c1/> (<c2/>): C/A-kodegeneratoren med G1/G2 LFSR (lineært tilbagekoblet skifteregister) gengiver <b>de offentliggjorte kodefasetildelinger i IS-GPS-200 Table 3-Ia</b> — de første ti chips i oktal for PRN (pseudo-random noise) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }) — præcist. Det fastlægger <b>spredekodens chipsekvens</b> mod GPS-grænsefladespecifikationen; de omgivende dele til modulation, spektral adskillelse og DLL-kodesporing (delay-locked loop) (<c3/>) forbliver MODELLED.

seg-e5f1b960777a = Tidssynkronisering til net, spektrum, solsystemet, konstellationer, kampagner og LEO-PNT

seg-c5bf3b23d688 = De funktioner, der blev tilføjet i linjen { "0.28" }, bedømmes række for række i den genererede <a1><c1/></a1>; dette afsnit opsummerer, hvilke af dem der har en uafhængig ekstern reference. En række er kun VALIDATED med en uafhængig ekstern reference; alt andet er MODELLED.

seg-d791a48b3895 = Funktion (type)

seg-d4779be2efd8 = Ekstern reference, eller hvorfor rækken forbliver modelleret

seg-0d7bb0fc1c5e = Telecom-MTIE (maximum time interval error) og TDEV (time deviation) på en holdover-serie (<c1/>)

seg-18894b55b6c1 = <c1/>: { "17" } MTIE-middelingsfaktorer og { "12" } TDEV-middelingsfaktorer på en indlæst holdover-serie fra et chipskala-ur med { "2" } 048 sampler, mod allantools { "2024.06" }, til < { "1e-12" } / < { "1e-9" } relativt. ITU-T-maskernes (International Telecommunication Union Telecommunication Standardization Sector) PASS/FAIL-afgørelser og de forudindstillede oscillatorer fra databladene forbliver MODELLED. Se <a1><c2/></a1>.

seg-ff9cb967ae08 = Holdover-forudsigelse ud fra en målt urregistrering (<c1/>)

seg-7821227795d8 = <c1/>: tilpasning på den første tredjedel af den virkelige 5071A-cæsiumregistrering, forudsigelse af tidspunktet for overskridelse af én sigma ved seks tærskler, målt på de to tilbageholdte tredjedele; tærskel: en faktor { "1.5" } begge veje, observerede forhold { "0.84" } til { "1.03" }. Slot-guard-budgettet og positionsbestemmelsens kadence, der bygger på den, forbliver MODELLED.

seg-2667e3ddf829 = Lukkede former for effekttæthedsspektre i L-båndet og spektral adskillelse (<c1/>)

seg-1a0c6ef49f98 = <c1/> lukkede former mod offentliggjorte værdier (matrixrække "Closed-form L-band signal power spectral densities…"). Vandfaldsdiagrammet med J/S (jammer-to-signal ratio) pr. bånd og effektiv C/N0 (carrier-to-noise density) samt SigMF-ind- og -udlæsning (Signal Metadata Format) forbliver MODELLED.

seg-46278e9c03c1 = Planeters positioner ud fra JPL's (Jet Propulsion Laboratory) Standish-elementer og lystid mellem legemer (<c1/>)

seg-43cfeb9f2403 = { "0.30" }, præregistreret mod JPL Horizons (DE441): <c1/> og <c2/>, RMS pr. planet og komponent højst lig tallet i Explanatory Supplement Table { "8.10.1" } (værst { "0.778" }), inklusive opdelingen af Jorden og ICRF-rotationen; <c3/>, lystidsløseren på DE441-positioner inden for { "1e-6" } s af Horizons' lystid (værst { "6.7e-9" } s). Den tidligere sammenligning med dobbelt nominel tærskel (<c4/>), hvis tærskel blev sat efter den første sammenligning, beholdes som en regressionskontrol uden afgørende rolle. Uranus/Neptun fra Table { "1" }, Pluto, månerne, legemekonstanterne og <c5/> forbliver MODELLED.

seg-b96d8ea13c87 = Walker-geometri og de offentliggjorte GPS-, Galileo- og GLONASS-slots (GLObal NAvigation Satellite System); global GPS-geometrisk præcisionsfortynding (<c1/>)

seg-85c293b8d235 = <c1/>: Walker 24/3/1 gengiver Galileos definitionstabel for den åbne tjeneste til { "1e-9" }°, GLONASS-slotformlen i grænsefladekontrollen og GPS' ækvatorkrydsninger; GPS-baseline-medianen for HDOP { "0.940" } mod { "0.94" } i standarden for Standard Positioning Service. Vilkårlige dækningskort for flere konstellationer omkring et hvilket som helst legeme forbliver MODELLED.

seg-f0187be4b97f = Kampagner: sammenkædede missioner, sweeps, Monte Carlo-ensembler, kørsler under fælles betingelser (<c1/>)

seg-b5c45fc12e5f = <c1/> ({ "11" } tests): en kampagne med én fase gengiver den selvstændige kørsel byte for byte, et sweep med ét knudepunkt læser det samme tal, et ensemble med seed er byte-stabilt. Sammensætningsidentiteter, ikke en ekstern reference.

seg-bc25d20125e7 = LEO-linkfysik (low Earth orbit): ITU-R-regnkoefficienter (ITU Radiocommunication Sector) P.838, regndæmpning og scintillation P.618, indtrængningstab i bygninger P.2109, førsteordens ionosfære, maksimal Doppler

seg-b1f3bd37d169 = <c1/>, <c2/>: ITU-R-anbefalingernes egne tabeller og valideringseksemplerne fra Study Group { "3" } (indlæst med kilde og hentedato), IS-GPS-200-forholdet for gruppeforsinkelse til ionosfæren og den offentliggjorte tabel over maksimal Doppler fra Leclere, Marathe og Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

seg-492917f11386 = LEO-navigationsbesked: brugeralgoritmen for broadcast-efemeriden i Galileo-ICD'en (interface control document), CRC-24Q (24-bit cyklisk redundanskontrol), globalt gennemsnitlige SISRE-vægte (signal-in-space range error) (<c1/>)

seg-514a7da01582 = <c1/>: Galileo-brugeralgoritmen gengiver RTKLIB (et open source-bibliotek til realtidskinematisk positionsbestemmelse) til { "1" } mm på fire virkelige Galileo-broadcast-efemerider; CRC-24Q giver katalogets kontrolværdi 0xCDE703 og kontrolbytes i RTCM-eksempelrammen (Radio Technical Commission for Maritime Services) { "1005" }; SISRE-vægtene gengiver den offentliggjorte MEO/GEO-tabel. Tilpasningen, opdateringen midt i en passage, den binære kodning, tekst i RINEX-4-stil/CSV (comma-separated values) og de valgbare efemeridemodeller forbliver MODELLED.

seg-94bbcd43e03a = LEO-signaludformning, passage og linkbudget, Doppler og fælles GNSS+LEO-positionsbestemmelse, PPP-konvergens (precise point positioning), 5G NTN-positionsbestemmelse (non-terrestrial network), LEO-tidsoverførsel (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-4c37a8cfac87 = <c1/>, <c2/>: lukkede former, filterkonsistens (for eksempel at PPP-filterets kørselsgennemsnitlige NEES ligger inden for sit { "95" }%-bånd) og sammenligninger med offentliggjorte tendenser; ingen feltdata.

seg-91cf4e399f0a = ét LEO-PNT-system fra ende til anden (<c1/>)

seg-fb947da2e8b4 = <c1/>: hver videregivet værdi er lig med det foregående trins eget output, og en ændring af et inputtal opstrøms flytter alle nedstrøms tal, der afhænger af det.

seg-7e230aa73770 = LEO-robusthed og vertikaler (spoofing via Doppler og via konsistens mellem bånd, ionosfæresondering)

seg-ab2542cfc295 = <c1/> ({ "10" } tests). Robusthedsscenarierne og vertikalscenarierne er opført i <a1><c2/></a1>.

seg-2d3ead293658 = Output, der er gengivelser og ikke evidens, har tests, men ingen matrixrække: udvekslingseksporterne (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeride (Systems Tool Kit), SigMF (Signal Metadata Format)), der hver især læses tilbage af en validator skrevet ud fra formatets specifikation (<c1/>, { "13" } tests; se <a1><c2/></a1>); animationerne (<c3/>: byte-identiske genkørsler, nøjagtige antal billeder, velformet SVG (Scalable Vector Graphics), ingen ekstern adresse i HTML-afspilleren (HyperText Markup Language)); og kørselsrapporten (<c4/>, <c5/>: hvert medfølgende scenarie rapporterer uden tomt afsnit eller pladsholderværdi, etiketterne svarer til matrixen, og den optagede kommando gengiver <c6/> og rapporten byte for byte).

seg-903e4e51dda1 = Driftsområde

seg-e226ad523a3d = Hver pakke afprøves over sit angivne inputområde af <c1/>, som kontrollerer, at hvert numerisk output er endeligt (ingen NaN/Inf (NaN: not a number)) og afgrænset. Tabellen viser det afprøvede inputområde pr. pakke, den forventede outputadfærd og den dækkende test.

seg-8bd4f586f3c7 = Input, der er gennemløbet

seg-3ebc1201a545 = Afprøvet område

seg-a1198518d667 = Forventet output

seg-7bf563f5420a = Dækkende test

seg-4906c027a805 = <c1/> (tidskrav)

seg-d91e18ce3773 = { "1" } – { "500" } ns

seg-10cf765fdd75 = endelige kvalitetsmål for holdover, tidssynkronisering og sikkerhed

seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (koldt atom → simpel MEMS (micro-electro-mechanical systems))

seg-456c32a126a2 = endelig, afgrænset positions-RMS/p95

seg-dae96fd3a01b = <c1/> (elevationsmaske)

seg-a54c3c8933c6 = endelig DOP/tilgængelighed; afgrænset

seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

seg-b6d0d587046e = endelig P_md / sikkerhed, afgrænset

seg-fda0b32d7784 = { "10" } – { "1000" } m

seg-132fdea2270f = endelig holdover af tidssynkronisering/position

seg-c9099375b99f = bane (virkelig)

seg-952b94eda0ff = virkelige Celestrak-<c1/>-TLE'er

seg-60009932477c = øjebliksbillede med 30 satellitter, streng kontrolsum

seg-deb16d50741e = indlæses kun med gyldige kontrolsummer; afgrænset geometri

seg-c46d726e35b3 = ur (flicker)

seg-15939085bf3a = <c1/> til/fra

seg-504a95f55b88 = { "0" } mod { "1e-12" }

seg-e1cce0c2028e = aktivering af 1/f-gulvet <b>forværrer</b> coast for p95 af tidssynkroniseringen

seg-bdd4e56bdef9 = fusion (realisme)

seg-09af9dd78fe3 = <c1/> { "0" } mod { "5.88e-7" } m/s²

seg-0a6723be642c = nul mod realistisk værdi forskellig fra nul

seg-a9eb04be2b9f = filteret konvergerer stadig, inden for { "3" }× fejlen ved nul bias

seg-2a839953aa6a = Rækkerne for flicker-FM og fusionsbias lukker to bestemte realismehuller: støjleddene er <b>slået fra som standard, men påvirker påviseligt outputtet, når de slås til</b>, og det fælles fusionsfilter <b>afhænger ikke af, at bias er nulstillet</b> — det konvergerer også med en realistisk restbias på koldt-atom-niveau.

seg-4f0e9f9d4cdf = Kvante- og klassiske kørsler bruger nu uafhængige RNG-seeds (random-number generator) (klassisk seed = seed + 0x9e3779b97f4a7c15), så deres støjrealiseringer er ukorrelerede — rettet efter gennemgang.

seg-3b6b785f401a = <c1/> er segmentbevidst: udfaldstidslinjer opdeles i sammenhængende segmenter ved GNSS-genindfangning, og den rapporterede værdi er det værste (korteste) coast på tværs af dem. Den er stadig begrænset af tidsgitterets opløsning (en nedre grænse).

seg-4a830113b13d = ISL-tidsoverførslens gensynkronisering modellerer den resterende linkusikkerhed som friskt, middelværdifrit jitter pr. målingstrin plus gen-forankring ved det konfigurerede interval.

seg-30c4d89aa433 = Påstande mod virkelighed — hurtig oversigt

seg-27a22de7b8c0 = En fjendtlig bedømmers tjekliste. For hvert udtryk, der kan læses som mere, end det er: hvad Kshana gør i dag, og hvor den virkelige version ligger på køreplanen.

seg-759eb0cfafe4 = Udtryk, du kan se

seg-6a2d3691d642 = Hvad det i virkeligheden er i dag

seg-bbd0145bfb95 = Hvad det <b>ikke</b> (endnu) er

seg-a6fdb038b003 = "hybrid kvante/klassisk PNT-simulator"

seg-4421f8bd0967 = en klassisk stokastisk simulator drevet af offentliggjorte Allan-/støjkoefficienter for kvantesensorer

seg-3885661aafff = kvantefysik fra første principper (Mach–Zehnder-fase, projektionsstøj, systematiske fejl) — se <a1><c1/></a1>

seg-1d28debd0302 = "fælles Kalman-fusion" / fusionspakke

seg-d13beba21ba7 = den kørbare <c1/>-pakke observerer uret og positionen <b>hver for sig</b> (en direkte tidsbestemmelse og en direkte positionsbestemmelse), for hvilket den optimale estimator reelt er blokdiagonal — to filtre med to tilstande og et samlet kvalitetsmål

seg-25c2fe6fa6d3 = et <em>koblet</em> filter til <b>pseudorange</b>-tilfældet <b>findes</b> nu som <c1/> (4 tilstande stablet <c2/>, krydsblokkovarians forskellig fra nul, NEES-valideret), men er <b>endnu ikke koblet ind i den kørbare pakke</b>, og pakken er <b>1-DOF (én frihedsgrad)</b> — den 3D-udvidelse med 8 tilstande er fremtidigt arbejde

seg-5cce1ca5b86f = Sikkerhedskvalitetsmål (<c1/>-type)

seg-d55c30f63023 = <c1/> for en <b>stokastisk tidsspoofing-detektor</b>: en tosidet χ²₁ / Neyman–Pearson-test på en urstøttet monitorstatistik, tærskel fastsat ud fra et mål-<c2/>, <c3/> evalueret <b>ved specifikationens størrelse</b> både i lukket form og ved Monte Carlo (som stemmer inden for nogle få ×1/√N)

seg-dbf2039a4a8e = en RAIM/ARAIM-detektor med flere satellitter — se <a1><c1/></a1>; monitorstatistikken er en gaussisk model med urets σ udledt af PSD, ikke en korrelation på signalniveau

seg-32bcb801e49c = "urstøttet spoofing-detektion"

seg-58e4d22075e9 = en <b>enkelt-ur</b>-monitor for tidsafvigelse (gaussisk statistik, σ fra urets PSD), IKKE RAIM med flere SV (SV: space vehicle, altså en satellit)

seg-f3f6f95bc559 = RAIM med flere SV i afstandsdomænet med beskyttelsesniveauer

seg-a5faedaab13e = spoofing-detektorens P_md (lukket form mod Monte Carlo)

seg-0362489c341a = det analytiske <c2/> baseret på <c1/> og det empiriske estimat over <c3/> forsøg stemmer inden for stikprøvefejlen (≈ 1/√N); valideret i <c4/> / <c5/>-tests ved en belastet afvigelse (μ/σ = { "2" })

seg-8fa5c9468ff5 = en målt ROC for detektoren mod optagede spoofing-data

seg-8f895aa1c657 = <c1/> pseudorange-model

seg-a5e5e1e7a0e9 = en <b>fremadrettet simulering</b>: <c1/>. Hver atmosfæremodel er enhedstestet mod værdier udregnet i hånden (ZHD (zenith hydrostatic delay) ≈ { "2.3" } m, Niell = { "1" } i zenit, Klobuchar-skråstilling), og den fulde Klobuchar-broadcast-model er <b>krydskontrolleret mod RTKLIB's <c2/></b>-referenceimplementering til under en millimeter (<c3/>, { "6.1278" } m for RTKLIB-tilfældet med standardkoefficienter — der findes ingen officielt offentliggjort Klobuchar-testvektor, så dette er implementeringsparitet, ikke målt sandhed); en <b>kørsel uden støj gengiver geometri + korrektioner til under en millimeter</b> (RAIM-residual ≈ { "0" })

seg-adc8a5d89cbd = en positions<b>løsning</b> ud fra virkelige signaler (PPP/RTK (PPP: precise point positioning)), iono-fri kombination på to frekvenser eller opløsning af heltalsmultiplicitet i bærebølgefasen — ikke modelleret

seg-a56533528c6e = jamming-model (<c1/>-type)

seg-0a4a28fcd53a = en <b>linkbudget</b>-kæde: J/S ud fra fririumstab + antenneforstærkning pr. retning → effektiv C/N₀ via anti-jam-ligningen (afspredningsgevinst × spektral adskillelse <c1/>) → tab af lås ved en tærskel (Kaplan & Hegarty §{ "9.4" })

seg-b53e210487fb = flerstiet udbredelse, AGC-dynamik (automatic gain control) i tid, selve indfangningssøgningen (den valgfri <c1/>-hysterese er et tærskelpar); den valgfri <c2/>-kvantiseringsstøj er den for et gaussisk input og gælder ikke for en CW-jammer; den valgfri <c3/>-array er smalbåndet og ideel (ingen kobling eller fejltilpasning), og den valgfri <c4/>-skygning er én knivæg på én SRTM-tile; <c5/> er en repræsentativ konstant pr. type, ikke udledt af jammerens målte PSD

seg-523d66d56f97 = Integritetskvalitetsmål (ur-/holdover-pakker)

seg-d0702ee52d37 = filterets <b>selvkonsistens</b> (andelen af udfaldssamples inden for filterets egen k·σ-grænse)

seg-b4b68065e521 = HPL/VPL, integritetsrisiko / P_HMI, alarmgrænser, DO-229E/316/ED-259A — de rapporteres særskilt af <c1/>-typen (RAIM / ARAIM) og SBAS-funktionerne og indgår aldrig i dette kvalitetsmål

seg-d5b1f858f0e3 = ældre <c1/>-scenarie<b>pakke</b>s kvalitetsmål

seg-e9fe365d7318 = et <b>énaksligt (1-DOF)</b> fejlbudget for accelerometer/gyro (VRW/ARW, bias-instabilitet) med nulstilling til sandheden

seg-604e8d96c2c2 = den <em>ældre</em> pakke er 1-DOF; <b>3-aksestien leveres i <c1/>-pakken</b> (næste række)

seg-e2a4a1c47f2c = 3-akset strapdown-<b>bibliotek</b> + <c1/>-<b>pakke</b> (<c2/>, <c3/>)

seg-01e5672a37a4 = en verificeret kvaternion/NED-navigator (NED: north-east-down) med en deterministisk IMU-fejlmodel — <b>skalafaktor, fejljustering, g-følsomhed, kvantisering, ratetrin</b> er modelleret (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }) — nu <b>drevet af <c1/>-scenariepakken</b> og <b>kan konfigureres pr. sensor fra TOML (Tom's Obvious Minimal Language, scenarieformatet)</b> (<c2/>)

seg-acecd6b81859 = <b>ikke modelleret:</b> vibrationsrektificeringsfejl, temperaturgradientdrift. Fejlen i den fusionerede coast er begrænset af et gulv fra attitudefejlen ved overdragelsen (tilt/accelerometer-bias kan kun svagt adskilles), så kalibrering pr. bias hævdes ikke

seg-6b04fc376c0d = "Hybrid PNT-integration" (<c1/>-pakke)

seg-cd3125081b5c = åben-sløjfe dødregning indrammet af GNSS-nulstillinger til sandheden

seg-578c93c67ae7 = en koblet (løs/tæt) GNSS–INS Kalman-blanding — det er den separate <c1/>-pakke (EKF) og <c2/>-typen

seg-57f603da0331 = "Positioneringsydelse" (urpakker)

seg-278aafe7fadf = urfasens <b>tidssynkroniserings</b>-RMS i ns (<c1/>)

seg-a6af364cbcdc = en nøjagtighed i positionsdomænet vægtet efter RMS/CEP/SEP/DOP (SEP: spherical error probable)

seg-b68c5a4363a5 = kvalitetsmål for inertialposition (<c1/>)

seg-850e030bb5e3 = en <b>énaksig</b> positions-RMS/p95 i meter fra ét seed, medmindre <c1/> beder om et ensemble (så gennemsnit, spredning og et bootstrap-konfidensinterval på { "95" }% pr. metrik)

seg-be77929afa2c = en fordeling af ensemble-CEP / 2DRMS (to gange afstands-RMS) (køreplan: Monte Carlo-CEP)

seg-75f239679dc2 = "valideret til ~{ "2" }%"

seg-2d593a99a2b1 = en <em>typisk</em> observeret enighed; den <b>håndhævede grænse er { "20" }–{ "25" }%</b> relativ fejl

seg-34cfd0e08235 = en garanteret nøjagtighedsgrænse på { "2" }%

seg-d3402cc1ebd5 = "reproducerbar / bit-identisk"

seg-46ea210bcdad = bit-identisk genkørsel på <b>samme OS (operating system) + fastlåst toolchain</b>; på tværs af Linux, macOS og Windows kontrollerer CI en indlæst SHA-256 af hvert resultats inputfingeraftryk og form (<c1/>) samt de numeriske værdier til { "1e-6" } (<c2/>)

seg-38c6528122a8 = et byte-identisk fuldt resultat på tværs af operativsystemer (forskelle i sidste ciffer i libm)

seg-b0e21aea4ccd = SGP4 GPS-scenarie (<c1/>)

seg-1131aa869f1d = et ægte Celestrak-<c1/>-øjebliksbillede (2021-07-28, { "30" } satellitter, strenge kontrolsummer), hver satellit propageret fra sin egen TLE-epoke

seg-21c2f1b5d7e2 = en aktuel konstellation — opdatér øjebliksbilledet med <c1/> (se <a1><c2/></a1>); NORAD-katalognumrene (North American Aerospace Defense Command) er de virkelige

seg-6948bd06c7e5 = Krydskontroller mod artikler om månens PNT (regressionsevidens, ikke matrixrækker)

seg-9ee0faf0b359 = Suiten for måne og cislunart rum (funktionerne "Lunar & cislunar" og "Lunar PNT suite" i README) har sine påstande fra offentliggjorte artikler uafhængigt krydskontrolleret i <c1/>, hver mod en reference fra en <em>anden</em> implementering:

seg-b4edbf832fe6 = <b>orbitalt sende-/opsamlingsfodaftryk</b> mod <c1/> (Cephes Bessel J1);

seg-c856d319a46e = <b>DOP for overfladefyrenes geometri</b> mod en uafhængig NumPy-løsning med <c1/>;

seg-33ee672d98d7 = <b>vækst i forudsigelsesfejlen for UT1/EOP-persistens</b> mod en NumPy-genafløsning af de samme ordrette IERS-<c1/>-rækker;

seg-9b6e59789117 = <b>den plane familie af fjerne retrograde baner</b> mod NASA/JPL's Three-Body Periodic Orbit Database;

seg-c77384abd1cc = <b>præcisionsbudget for RF-afstandsmåling</b> mod en reference fra første principper.

seg-a451dbe09e10 = Fixtures og orakel-generatorscripts ligger under <c1/>. De styrker evidensen bag funktioner, der forbliver <b>MODELLED</b> i den maskinkontrollerede matrix (<c2/>); de er regressionskontroller og <b>ikke</b> nye VALIDATED matrixrækker, så de ændrer ikke selv antallet i den maskinkontrollerede matrix. Det antal er ikke gentaget her, fordi en håndskrevet kopi af det kommer ud af trit: den aktuelle fordeling står i den genererede overskrift i <a1><c3/></a1>, som <c4/> skriver ud fra <c5/>, og som <c6/> holder fast.

seg-a353a63661de = <s1>Forrige</s1>Eksport og import til udveksling

seg-fdae3b73ab67 = <s1>Næste</s1>Verifikationsmatrix

seg-59c12422e6e7 = Tidevand på geopotentialet (src/tides.rs)

seg-10f0b4616abe = Manøvrer og banedesign (src/maneuver.rs)

seg-56cdbd59ce5d = Banebestemmelse (OD) (src/orbit_determination.rs, src/batch_ls.rs)

seg-3a2c69fcbb86 = Validering af kraftmodeller ved tilpasning til efemerider (src/precise_od.rs)

seg-05a25c6ef750 = Virkelige præcise baner fra agenturer (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

seg-279f4619bc2d = Navigation med tyngdekort / alt-PNT (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

seg-7b512df70323 = INS/IMU-fejlmodel — validering mod referencer i databladene (src/inertial/)

seg-b385e665cfff = Dybrum og Mars-PNT — D0-fundament (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

seg-5887e7e1a218 = Radiometriske observable til dybrum og CCSDS Tracking Data Message — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

seg-a9cf84a14301 = Reduceret-dynamisk OD til dybrum — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

seg-dc406cb825db = Dybrum-PNT-scenarie og envejs+tovejs-fusion — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

seg-7784f9436dd2 = Månens koordinattid — relativistisk urrate mellem Jorden og Månen (src/lunar_time.rs)

seg-8a34cb900611 = Geodætisk VLBI på Månen — nærfeltsforsinkelse for en jordbaseline, der observerer en månefyr (src/lunar_vlbi.rs)

seg-d47906a347b3 = Fælles multiteknik-OD + ur på Månen — simuleret genfinding i lukket sløjfe (src/lunar_combination.rs)

seg-17b9f0ae9dee = Realisering af månens referencesystem — tilpasning af 7-parameter Helmert-datum (src/lunar_frame_realise.rs)

seg-3cfffa3eeb79 = Servicevolumen for navigation på Månen — DOP / dækning / tilgængelighed + generaliseret ARAIM-PL til Månen (src/lunar_service.rs)

seg-d80bf3320a15 = Differentiel PNT på Månen — ophævelse af fælles mode + residual, der vokser med baseline + DGNSS-beskyttelsesniveauer (src/lunar_dpnt.rs)

seg-23c3d8a79acf = Interoperabilitetseksport for Månen — CCSDS OEM + KIF tilpasset LunaNet/IOAG med formatkontrol ved round-trip (src/lunar_interop.rs)

seg-a697f4f424b8 = Repræsentativitet af demonstrationen og register over huller til flyvning (src/representativeness.rs)

seg-4c924153299d = Samlet evidens for afvejningen mellem kvante og klassisk (src/qtrade.rs)

seg-bd1a5835c5db = Bibliotek med fejlmodeller for kvanteenheder (src/quantum_devices.rs)

seg-6b1bb731f966 = Pålidelig kvantetidssynkronisering — kæde fra ende til anden, sikker udbredelse, anomali + afvejning (src/timetransfer_chain.rs)

seg-3332c6c1ae86 = GNSS-fri kvantenavigation (src/quantum_nav_od.rs)

seg-9b46a5add4ab = Fejl-/anomalidetektion for kvante-PNT-systemer (src/quantum_faults.rs)
