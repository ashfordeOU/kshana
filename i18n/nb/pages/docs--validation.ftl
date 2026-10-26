# docs--validation: translations (nb)

seg-70860389903a = Klokke

seg-583dc9ff6178 = Bibliotek

seg-d01db1c2710a = Referanse

seg-619f89bf160c = Realisering av månens referansesystem

seg-2db69c58f694 = Differensiell PNT på Månen

seg-2eb6d1b0483d = RAIM / ARAIM

seg-da3532b1444d = SBAS / DO-229E

seg-d3af26f389f5 = IONEX / Klobuchar

seg-d6476863f862 = Funksjon

seg-ad856ad710eb = Status

seg-d12d4565b01d = Geodetisk VLBI på månen, kernel-bane

seg-5ed34a5b402e = Felles månebanebestemmelse med flere teknikker + klokke

seg-4bcec6e2dd9f = Månens navigasjonstjenestevolum

seg-c04a3591074c = Eksport for interoperabilitet på månen

seg-20fee61b3107 = Feilmodellbibliotek for kvanteenheter

seg-eaf341ff4522 = GNSS-fri kvantenavigasjon

seg-75636f9419b2 = Kjente begrensninger

seg-9c0eb89a2fbe = Pakke

seg-f63dd3d7aad4 = Kilde

seg-638b8d451550 = Sensor

seg-04f69a0edb2f = type

seg-b03d56f501c3 = Type

seg-35bf9a48e566 = Størrelse

seg-f3526b0d95f8 = Målt

seg-7634c6f4b32c = Link

seg-b966dd26caa6 = Datasett

seg-4fe4920a3fa1 = Standard

seg-84430d202cd4 = Kilde: <c1/>

seg-028f26d1374e = <b>Om toleranser.</b> «Validert» nedenfor betyr at en kalibreringstest krever at den simulerte statistikken stemmer med referansesammenhengen innenfor en <b>håndhevet grense</b>, for tiden <b>{ "20" }–{ "25" } % relativ feil</b> (midlet over seed) for Allan-/støybudsjett-sammenhengene. Observert median-overensstemmelse er ofte mye strammere (noen få prosent), men den <em>garanterte</em> grensen er porten, ikke medianen. Der et tall som «~{ "2" } %» står, er det en typisk observasjon, ikke den håndhevede toleransen. Se <a1>Claims vs. reality</a1>.

seg-94a480ed9ccb = Opprykksregelen

seg-a550784412a6 = En rad i den maskinkontrollerte verifikasjonsmatrisen (<c1/>) er VALIDATED bare når en uavhengig referanse <b>uavhengig av Kshana</b> stemmer med implementasjonen <b>innenfor en toleranse som er oppgitt før sammenligningen kjøres</b>, i en test som kjører i porten. Dette avsnittet er det ene stedet regelen er skrevet ned; matrisen, prosaen per rad og utgivelsesmerknadene henviser til det.

seg-5e14faed9f05 = De aksepterte typene uavhengig referanse

seg-4297b6a1b385 = Hva som teller

seg-a42c0c36b37f = Eksempler som allerede finnes i matrisen

seg-e39aeb132e03 = Virkelige målte data for størrelsen raden påstår: en observasjon av den fysiske verden, ikke et modellutdata.

seg-e77977db9de1 = De tilbakeholdte to tredjedelene av en virkelig cesiumklokkeregistrering; arkiverte normalpunkter fra månelaseravstandsmåling; UTC(k)-serien i BIPM Circular T (Bureau International des Poids et Mesures); terrengflisen fra SRTM (Shuttle Radar Topography Mission).

seg-6325fe1fafaf = Et uavhengig tredjepartsbibliotek eller -verktøy som beregner en <b>entydig definert</b> størrelse på de samme inndataene, der biblioteket selv implementerer domeneberegningen. Overensstemmelse mellom bibliotek og bibliotek er en ekte kontroll bare fordi størrelsen har ett riktig svar.

seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, SciPys statistiske fordelinger.

seg-056adffae706 = Publiserte referansevektorer, tabeller eller verifikasjonseksempler: tall en standard, et byrå eller en referansetekst skriver ut slik at implementasjoner kan kontrolleres mot dem.

seg-991fb822e99c = SOFA/ERFA-vektorer (Standards of Fundamental Astronomy), AIAA-vektorene (American Institute of Aeronautics and Astronautics) for SGP4-verifikasjon, valideringseksemplene til ITU-R (International Telecommunication Union, Radiocommunication Sector), det gjennomgåtte ARAIM-eksemplet fra Working Group C, JPL (Jet Propulsion Laboratory) Horizons.

seg-2a774e48055a = To ytterligere standarder avgjør grensetilfellene. Begge er tatt i bruk for utgivelse { "0.30" }.

seg-f5c6cf536ba1 = <b>P1, en publisert regnet verdi.</b> En publisert regnet verdi beregnet ut fra den samme lukkede formen raden implementerer, teller som en publisert referansevektor, når publikasjonen er uavhengig av Kshana og sammenligningen fastsetter en oppgitt toleranse. Verdien må være skrevet ut som et tall i publikasjonen (en verdi lest av et plott teller bare hvis leseusikkerheten ligger innenfor den oppgitte toleransen), og testen må få Kshana til å beregne den fra publikasjonens inndata; å sammenligne en konstant med dokumentet den ble kopiert fra, er en transkripsjonskontroll, ikke P1.

seg-0b043b552e76 = <b>P2, et uavhengig numerisk bibliotek.</b> Et uavhengig numerisk bibliotek som numpy eller LAPACK (Linear Algebra PACKage) som beregner en entydig definert lineær-algebra-størrelse på oppgitte inndata på nytt, teller som et uavhengig bibliotek. Biblioteket må utføre dekomponerings-, invers-, løsnings- eller minste kvadraters-trinnet med sin egen algoritme, på inndata som er committet sammen med fixturen; den validerte påstanden er da den lineære algebraen på de inndataene, ikke de fysiske størrelsene i et representativt scenario. Et skript som evaluerer en skalar lukket form på nytt med numpy-aritmetikk, er en andre implementasjon av vår egen, ikke P2.

seg-b7911d589f7a = Vilkår som gjelder for alle typer: referansen er ikke skrevet, kjørt eller publisert av dette prosjektet (dette depotets egen artikkelserie er derfor ikke uavhengig av det); toleransen ligger i testen og ble fastsatt før den første sammenligningen; en datastyrt test som hoppes over når de offentlige dataene mangler, sier fra om det når den hoppes over.

seg-7e6057a2cad7 = Hva som ikke teller

seg-80cfbb204767 = <b>Vår egen andre implementasjon</b>: en andre kodevei i denne craten (<c1/>), eller et skript i dette depotet som evaluerer den samme lukkede formen på nytt.

seg-d6efaf8399f9 = <b>Overensstemmelse med vårt eget tidligere utdata</b>: gullreferanser, regresjonsfestinger, øyeblikksbilder eller en tabell fra dette prosjektets egne artikler.

seg-4d0365b383e5 = <b>En transkripsjon av konstantene i en henvisning</b>: å kontrollere en koeffisient, forhåndsinnstilling, databladtall eller parameterark mot dokumentet det ble kopiert fra.

seg-3bf8025077fb = <b>Et designvalg</b>: en tildeling, vekting, terskel, varslingsgrense eller et representativt scenario. Det finnes ingen ekstern sannhet for et valg.

seg-4f0aafd7166e = <b>En intern identitet</b>: en numerisk integral mot sin egen analytiske form, en rundtur, en invertering, en egenskaps- eller monotonitetstest.

seg-4f4408e4ebab = <b>En integrasjonskjøring mot en ekte vert</b> (<c1/>): å laste en plugin inn i en ekte Signal K-server eller OpenCPN, eller å mate utdata fra en ekte gate til en TCP-forbruker, og kontrollere at verten tar imot inndataene og viser den forventede tilstanden. Det viser at rørleggerarbeidet fungerer. Verten er ikke en uavhengig referanse for noen verdi integrasjonen bærer, så det finnes ingenting eksternt å sammenligne mot, og en slik rad (raden for marine integrasjoner) er MODELLED, ikke VALIDATED. <c2/> er sin egen referansetype, tillatt bare på MODELLED-rader: <c3/> i <c4/> feiler hvis en VALIDATED-rad har den, og <c5/> krever allerede at hver VALIDATED-rad er <c6/>.

seg-a39a87c56a16 = <b>Plausibilitet på virkelige inndata</b>: virkelige data brukt bare som inndata, med påstander om størrelsesorden i stedet for en sammenligning mot en ekstern verdi.

seg-db6f5d98b4ef = En toleranse valgt etter å ha sett sammenligningen.

seg-f4f18b7549df = Hvordan regelen håndheves

seg-19a62c7e0aee = Hver VALIDATED-rad oppgir, i <c1/> i <c2/>, hvilken type den hviler på (Measured, Library, Reference, P1 eller P2), den uavhengige kilden (sitert fra radens egen referansetekst) og den ene testen som bærer sammenligningen. Enhetstestene ved siden av tabellen feiler når en VALIDATED-rad ikke er oppgitt eller er oppgitt to ganger, når en oppgave navngir en rad som ikke er VALIDATED, når den oppgitte kilden ikke er den radens referansetekst navngir eller er Kshana selv, når den oppgitte testen ikke er en raden siterer, eller når en P2-rad ikke navngir noe uavhengig numerisk bibliotek. <c3/> krever deretter at den oppgitte testen finnes på disk som en ekte <c4/> som ikke er ignorert. Det maskinen ikke kan kontrollere, er om den navngitte testen sammenligner mot den oppgitte kilden; det forblir en menneskelig lesing. Antall per type er ikke skrevet inn her: tabellen er kilden.

seg-e8ae3e380f40 = Eksisterende VALIDATED-rader gjennomgått på nytt under regelen

seg-1dd44545a67a = Regelen ble brukt på de eksisterende radene så vel som på framtidige opprykk.

seg-38db7b6e7053 = <b>P1-rader navngitt av valideringsstudien for { "0.30" }, hver støttet:</b> Enveis linkbudsjett (designkontrolltabellen for Galileo X-bånd i JPL Pub 82-76, bygd opp igjen fra linjepostene til { "4.6e-3" } dB frirommstap); Båndbegrensede lukkede former for ethvert avstandssignal ({ "90.3" } prosent av effekten i hovedloben og den publiserte koherente early-late-jitteren); Maksimal Doppler for en navigasjonssatellitt i lav jordbane (de publiserte tallene for Xona Pulsar X1 og Iridium); Maksimal Doppler en statisk bruker ser fra en LEO- eller MEO-bane (tabell { "1" } i Pulsar-artikkelen, { "20" } verdier); Doppler en bakkemottaker må håndtere fra en LEO-navigasjonssatellitt (de samme publiserte tallene fra en flydd bane). Hver publikasjon er uavhengig av Kshana, skriver ut tallene sine, og testen oppgir sin toleranse.

seg-8e38103d05d6 = <b>Ytterligere rader som hviler på P1, funnet i gjennomgangen på nytt, hver støttet:</b> Avveining i utforming av avstandskode (den publiserte kryss-korrelasjonen for Gold på −{ "23.9" } dB); Månens koordinattid (Ashby og Patla { "2024" }, hvis kontroll av månens hastighet mot DE440 er en Library-kontroll); Lukkede former for effekttetthetsspektre for L-bånd-signaler (Q-verdier fra Kaplan og Hegarty); Førsteordens ionosfærisk forsinkelse per bånd (gruppeforsinkelsesforholdet i IS-GPS-200); Globalt gjennomsnittlige vekter for avstandsfeil i signal i rommet (tabellen til Montenbruck, Steigenberger og Hauschild { "2018" }).

seg-0014c53752ac = <b>P2-rader navngitt av studien, hver støttet:</b> Fisher-informasjon og Cramér–Rao-observerbarhet (numpy <c1/>/<c2/>); Identifiserbarhet av månens datum; Koblet gauge for månens referansesystem og tidsskala; Autonom pipeline for feilobserverbarhet i fritt nettverk (numpy/SciPy SVD, singulærverdidekomponering). Hver beregner en entydig definert lineær-algebra-størrelse på committede inndata på nytt med en annen algoritme enn Kshanas Jacobi-egenløser.

seg-e9d01633d002 = <b>Ytterligere rader som hviler på P2, funnet i gjennomgangen på nytt, hver støttet:</b> MCDA-utledning av prioriteter (multi-criteria decision analysis) (AHP, analytic hierarchy process, egenvektoren fra SciPy/LAPACK; tabellen Random Index som den også gjengir, er en transkripsjon og telles ikke); Koastvarians for klokkens holdover (SciPy <c1/> av Van Loan-utvidet matrise); Realisering av månens referansesystem (en numpy SVD Umeyama-løsning); CRPA-stråleforming (controlled reception pattern antenna) (komplekst LAPACK-system); Beskyttelsesnivåkjerne for ARAIM på månen (RTKLIBs LU-invers med SciPy-kvantiler); Konsistens for månens referansesystem/dynamikk på tvers av leverandører (en numpy SVD minste kvadraters tilpasning av tre publiserte efemerider).

seg-1fd94e94e89d = <b>Flagget i første runde, støttet på nytt i runde { "2" } av kjøringen for { "0.30" }.</b> Tre rader ble flagget som ikke støttet av den skrevne regelen. Hver hviler nå på en sammenligning som er forhåndsregistrert før fixturen ble hentet, så ingen rad er flagget; en enhetstest ved siden av <c1/> fester den (nå tomme) listen.

seg-3ef9479dea55 = <b>Integritet (RAIM/ARAIM/SBAS).</b> De siterte testene pleide bare å kreve plausibilitet på virkelig IGS-geometri (International GNSS Service). Raden hviler nå på tre biblioteksreferanser: ARAIMs flerhypotese-løsningsseparasjon i Airborne Design Document v4.2 mot Stanford MAAST for ARAIM { "2" } ({ "270" } virkelige tilfeller, verste VPL-forskjell { "2.2e-3" } m mot { "0.05" } m); snapshot-RAIM-deteksjon og -ekskludering mot RTKLIB <c1/> ({ "2016" } av { "2016" } beslutninger identiske) med helningsbeskyttelsesnivået; og SBAS DO-229E L1-beskyttelsesnivåene mot Stanford MAAST på virkelige WAAS-kringkastinger ({ "2868" } par innenfor { "1.6e-5" } m). Raden sier rett ut at funksjonene med uniform sigma <c2/> og <c3/> ikke er ADD-konforme, og at sammenligningen for SBAS med dobbel frekvens L5 er et funn.

seg-16a4261c77ec = <b>Planetposisjoner over solsystemet fra JPL Standish Keplerian-elementene.</b> Den etterpå fastsatte terskelen på dobbelt nominell feil er erstattet av en forhåndsregistrert terskel: RMS høyst tallet i Explanatory Supplement tabell { "8.10.1" } per planet og komponent, mot JPL Horizons DE441, med jordsplittingen og ICRF-rotasjonen dekket.

seg-8d5b51a942e0 = <b>Lystid mellom himmellegemer i solsystemet.</b> Lystidsløseren sammenlignes nå med Horizons-lystider innenfor { "1e-6" } s på DE441-posisjoner, en forhåndsregistrert terskel som ikke arver posisjonsterskelen.

seg-e96900bc322f = <b>MODELLED-rader som de to retningslinjene gjør mulige å løfte</b> (bare gjennom kjøringen for { "0.30" } rad for rad, aldri ved denne teksten): under P1 grensen for geolokalisering av emittere med TDOA/FDOA (time and frequency difference of arrival), koblingen mellom relativistisk klokkerate og referansesystem, synkroniseringsmaskene i ITU-T (Telecommunication Standardization Sector) (bare for maskeverdier anbefalingene skriver ut som tall; de overførte knekkpunktene kontrollert mot seg selv teller ikke) og grensen for 5G-posisjonering i ikke-terrestriske nettverk (bare hvis et publisert regnet tall finnes); under P2 integritetsblindhet i felles modus, det skalare MHSS-beskyttelsesnivået for tid (multiple-hypothesis solution separation) og GLS-blekingen (generalised least squares). De to benchmark-radene for tidsintegritet (klassifisereren for Stanford-integritetsdiagram og skåreren for integritetsdekning) er regelbasert klassifisering, ikke lineær algebra, så P2 rekker ikke til dem; de trenger et uavhengig verktøy, og det eneste som ble funnet (gLAB) har en ikke-kommersiell lisens.

seg-50a08fe5918b = <b>Konsistens med tidligere avslag.</b> Vallado-kontrollen i raden for oppskytingsvindu ville nå kvalifisert under P1 hvis testen beregner det utskrevne regnede eksempelet; planen for { "0.30" } løfter den gjennom Orekit i stedet. Tabellen for kryssing mellom klokkeklasser for månetid forblir MODELLED: tabellen den gjengir, kommer fra dette prosjektets egen artikkel, som ikke er uavhengig.

seg-02423542480f = Støyledd

seg-2bd49b92f14b = Paritet for Allan-estimatorer (ADEV/MDEV/TDEV/OHDEV (ADEV: Allan-avvik; MDEV: modifisert Allan-avvik; OHDEV: overlappende Hadamard-avvik))

seg-c429a25d17ae = To kontroller mot primærkilden <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), begge til en relativ toleranse på <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: estimatorene for overlappende ADEV, modifisert ADEV, tidsavvik og overlappende Hadamard gjengir avvikene for det kanoniske datasettet <b>NBS14</b> med 10 punkter (<b>SP { "1065" } tabell 29/30, s. { "107" }</b>) ved tau = { "1" }, { "2" } — overensstemmelsen er faktisk ~{ "1e-6" } (f.eks. overlappende ADEV (OADEV) ved τ = { "2" }: { "85.952868" } mot { "85.95287" }). ({ "2" }) <c2/>: de samme fire estimatorene gjengir <b>SP { "1065" } §{ "12.4" } datasettet med 1000 punkter</b> (<b>tabell { "31" }, s. { "108" }</b>) ved midlingsfaktorene { "1" } / { "10" } / { "100" }, der datasettet regenereres i kode fra SP { "1065" } LCG (ligning { "73" }) — hermetisk, ingen fixture. De samme dataene og tabell 31-tallene er regresjonsmålet i aewallin/allantools (<c3/>), gjengitt her uten tredjepartskode. Dette fester <em>estimatormatematikken</em> mot referansen, atskilt fra radene for støy-<em>kalibrering</em> nedenfor.

seg-79e6f7d1e7f0 = Paritet for Allan-estimatorer på <b>virkelig målt maskinvare</b>

seg-8c72a9df2547 = <c1/>: estimatorene for overlappende Allan og overlappende Hadamard gjengir <b>Stable32</b>-referanseavvikene for en <b>virkelig cesium-primærstandard 5071A målt mot en hydrogenmaser</b> ({ "556 990" } fasesampler ved τ₀ = { "1" } s; { "1" } PPS (pulse per second) inn i en teller 53230A, feb { "2014" }; samlet av A. Wallin, distribuert med <c2/>). Kontrollert over <b>hele desimalstigen for τ ({ "16" } midlingsfaktorer, τ = { "1" } s … { "4" }×10⁴ s)</b>: godt samplede faktorer mot en relativ grense på <b>{ "1e-3" }</b> (observert overensstemmelse er faktisk ≤ { "3e-5" }, f.eks. OADEV({ "1" } s) { "3.317111e-10" } mot Stable32 { "3.3171e-10" }), sparsomme faktorer ved lang τ må havne innenfor Stable32s utskrevne konfidensbånd på { "1" }‑σ. Dette utfyller den syntetiske NBS14-pariteten ovenfor med en kontroll mot en målt klokke. Den rå fasefilen er tredjepartsdata uten omfordelingslisens, så den er git-ignorert; <c3/> gjengir den, og testen skriver ut et hoppvarsel (CI (kontinuerlig integrasjon) forblir grønn) når den mangler. Bare de offentlige Stable32-referansetallene er committet (<c4/>); ingen tredjepartskode brukes.

seg-1a7f0e741913 = Paritet for Allan-estimatorer på den <b>kanoniske Stable32 PHASE.DAT</b>

seg-00e382874a00 = <c1/>: estimatorene for overlappende Allan, modifisert Allan og tidsavvik gjengir <b>Stable32</b>-referanseavvikene for <b>PHASE.DAT</b> — serien med 1001 punkter som distribueres med Stable32 og som uavhengige verktøy (f.eks. <c2/>) bruker som sitt standard regresjonsmål — over <b>hele stigen av midlingsfaktorer ({ "139" } faktorer)</b> mot en relativ grense på <b>{ "1e-3" }</b> (observert ≤ { "5e-5" }). En andre, uavhengig virkelig referanseserie ved siden av kontrollen mot målt cesium ovenfor. PHASE.DAT følger med det kommersielle verktøyet Stable32, så den rå serien er git-ignorert; <c3/> gjengir den, og testen hoppes over grønt (CI forblir grønn) når den mangler. Bare de offentlige Stable32-referansetallene er committet (<c4/>); ingen tredjepartskode brukes.

seg-9dde9e0c8055 = Stabilitet for optisk klokke på en <b>reell målt kurve</b>

seg-ea908ba3a79f = <c1/>: inverteringen av klokkestøyparametere (<c2/>) reproduserer den <b>publiserte σ_y(τ) for den optiske ⁸⁸Sr-gitterklokken fra Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), kurven er lagt inn i repoet i <c3/>): den gjenvunne koeffisienten for hvit frekvensstøy √q_wf ≈ { "4.33e-16" } stemmer med artikkelens kortsiktige stabilitet på ≈4.7e-16/√τ (~{ "10" }% RMS (rot av middelkvadrat) over kurven), og tilpasningen påviser et målt gulv som ikke er null (q_rw > { "0" }). Dette forankrer <b>inverteringen fra målt ADEV til støyparametere mot en reell optisk klokke</b>; holdover-til-terskel-gevinsten som er bygget på den, forblir MODELLED.

seg-e1e930dcd0a1 = Anomalideteksjon: ROC (receiver operating characteristic) AUC (area under the curve) på <b>reell ESA (European Space Agency) OPS-SAT-telemetri</b>

seg-2b637daa985c = <c1/> (reproduserer etikettene)

seg-c667434b580d = <c1/>: på datasettet <b>OPSSAT-AD</b> (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — reelle OPS-SAT-housekeepingsegmenter med anomalietiketter som fasit — reproduserer Kshanas Mann–Whitney ROC AUC (<c2/>) <b>scikit-learn <c3/></b> til <b>< { "1e-9" }</b> på den tilbakeholdte testdelen ({ "529" } segmenter, { "113" } anomalier), for to deterministiske skårer: en åpen detektor med ett enkelt trekk (antall topper i segmentet, <b>AUC ≈ { "0.851" }</b>) og en diagonal Mahalanobis-skåre med 8 trekk, tilpasset de normale treningssegmentene (AUC ≈ { "0.556" }); <c4/> omslutter punktestimatet med et konfidensintervall der den nedre grensen ligger over tilfeldighetsnivået. Dette validerer <b>AUC-beregningen på reelle ESA-data</b> og en åpen detektors <b>etikettbaserte separasjon</b> — det reproduserer <b>ikke</b> den beste publiserte metrikken i OPSSAT-AD-artikkelen (en veiledet FCNN (fully connected neural network), F1 ≈ { "0.95" }), som krever deres trente modell. CC-BY-dataene er lagt inn i repoet (<c5/>, hermetisk); referansen regenereres av <c6/>.

seg-5f2d41617fb2 = Syntese av gravitasjonsfeltfunksjonaler (gravitasjonsstøttet / GNSS-fritt (GNSS: global navigation satellite system) navigasjonskart)

seg-4c1126137428 = <c1/>: kjernen for sfærisk-harmoniske gravitasjonsfunksjonaler (<c2/> / <c3/>) — «kartleseren» som en gravitasjonsstøttet navigatør sammenligner mot — er validert mot <b>normaltyngdestandarden GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, vedtatt av IAG (International Association of Geodesy)). Når GRS80-normalfeltet bygges fra de publiserte like zonale harmoniske J₂…J₈ og tyngdekraften (gravitasjon + sentrifugal) syntetiseres på ellipsoiden, reproduseres den lukkede <b>Somigliana</b>-normaltyngden og de publiserte ekvator- og polverdiene γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s², til <b>{ "3.5e-12" }</b> relativt over alle breddegrader (grense { "1e-9" }). Den samme kjernen laster den sentrale <b>reelle ICGEM-jordmodellen (International Centre for Global Earth Models) EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA (National Geospatial-Intelligence Agency), offentlig eiendom via ICGEM; leseren <c4/> er også brukt på GRAIL-månefeltet (Gravity Recovery and Interior Laboratory) i <c5/>) og gir et fysisk avgrenset kart over tyngdeforstyrrelser (RMS ≈ { "26" } mGal, maks ≈ { "89" } mGal ved d/o { "70" }). Validerer <b>at syntesekoden er korrekt</b>; <em>nøyaktigheten til posisjonsbestemmelse</em> med gravitasjonsstøtte forblir MODELLED (det finnes ingen offentlig bane med gravimeter på en plattform og referanse).

seg-7dc3ff4c6eea = Støytypespesifikk edf (konfidensintervaller)

seg-7e8a93fb2eea = <c1/>: χ²-konfidensbåndet for hvert punkt i overlappende ADEV bruker de støytypespesifikke effektive frihetsgradene (lukkede former fra NIST SP { "1065" } tabell { "5" } for hvit og flimrende fasemodulasjon, hvit og flimrende frekvensmodulasjon og random-walk-frekvensmodulasjon (WPM/FPM/WFM/FFM/RWFM) — det enkle settet i Stable32), der potenslovtypen til registreringen er identifisert ut fra MDEV-stigningen i log-log-plott. Tre uavhengige kontroller: (a) de fem formlene reproduserer håndberegnede verdier ved N={ "64" },m={ "4" } til { "1e-12" }; (b) et <b>Monte Carlo-utvalg med hvit FM (FM: frekvensmodulasjon)</b> ({ "4 000" } registreringer) måler estimatorens faktiske kjikvadrat-edf = { "2" }·mean²/Var(σ²) og stemmer med formelen innenfor { "20" }% (og er klart bedre enn det konservative antallet uten overlapp); (c) <c2/> reproduserer den trykte <b>SP { "1065" } tabell { "32" } (s. { "109" })</b> edf = { "146.177" } for datasettet med 1000 punkter ved m={ "10" } (hvit FM) til { "5e-3" }, og tabellens { "95" }%-konfidensgrenser ({ "8.223942e-2" } / { "1.035201e-1" }) til <{ "0.2" }% (den lille resten er Wilson–Hilferty-tilnærmingen av χ² mot NISTs eksakte χ²). Den eksporterte ADEV-kurven bærer den identifiserte støytypen, edf og { "95" }%-båndet for hver τ.

seg-7048ac695b99 = Hvit FM (kortsiktig)

seg-b6982cb2ca25 = <c1/>: simulert overlappende ADEV reproduserer publisert sigma_y({ "1" } s) — vanligvis innenfor noen få prosent, med <b>håndhevet grense på { "20" }%</b> (CSAC og målet for optisk gitterklokke) — og kurven for hvit FM sigma_y(tau)=sigma_y(1s)/sqrt(tau) over tau = { "1" }, { "10" }, { "100" } s innenfor en <b>grense på { "25" }%</b> (stemmer med databladet for CSAC (chip-scale atomic clock) { "3e-10" } / { "1e-10" } / { "3e-11" }).

seg-11fc7c4b61ff = Random-walk-FM (langsiktig)

seg-1e211f342e79 = <c1/>: simulert ADEV stemmer med sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) til ~{ "20" }% (gjennomsnitt over seed).

seg-dcfca4041429 = Aldring / lineær drift

seg-2d5c6a44cbdb = <c1/> + kalibrert bort

seg-492f91ba2f79 = Deterministisk; holdover-estimatoren fjerner forskyvning og aldring med en kvadratisk prediktor, slik at resten er den stokastiske grensen. Testet i <c1/> / <c2/>.

seg-2ea6a14cac1c = Kalman-estimator + integritetsgrense

seg-8c8f8a5eba5a = <c1/>: et filter med to tilstander (fase, frekvens) der den eksakte van Loan-prosessstøyen stemmer med referansemodellen; fri drift reproduserer den analytiske holdover-variansen <c2/> til { "1e-9" }. Kovariansoppdateringen er i <b>stabilisert Joseph-form</b> <c3/>, som forblir positivt semidefinitt (kontrollert med Cholesky) gjennom { "500" } prediksjons- og oppdateringstrinn ved et ekstremt <c4/>-forhold, og stemmer med den naive formen til { "1e-9" } der denne er velkondisjonert. Kjøringslaget rapporterer integritet som andelen av avbruddsprøvene som ligger innenfor beskyttelsesgrensen på 3 sigma (<c5/>).

seg-f332f06e80f9 = Filterets selvkonsistens (NIS (normalised innovation squared) / NEES (normalised estimation error squared))

seg-333e1701b6d0 = <c1/> (modell)

seg-c1304de95180 = <c1/>: en Monte Carlo-vurdering av konsistens (Bar-Shalom §{ "5.4" }). Det tilpassede filterets samlede <b>NIS → { "1" }</b> og <b>NEES → { "2" }</b> havner innenfor sine { "95" }%-χ²-bånd (NIS-båndet bruker det samlede antallet hvite innovasjoner; NEES-båndet bruker antallet uavhengige kjøringer, siden estimeringsfeil er korrelert over tid). En test med <b>sveip over Q/R-misforhold</b> bekrefter at overvåkeren rapporterer <c2/> bare ved enhetsinnstilling og <c3/> ved feilinnstilling ×0.1/×0.5/×2/×{ "10" }, der NIS skalerer som ≈1/q_factor slik det er utledet. Vises som <c4/> i klokkeresultatets JSON (JavaScript Object Notation) og i et kort i lekeplassen. χ²-båndene bruker Wilson–Hilferty-kvantilen (<c5/>, kontrollert mot tabell).

seg-078c4009b24f = Modell for toveis tidsoverføring

seg-22f8cdeda335 = <c1/>: den gjensidige felles forsinkelsen kansellerer nøyaktig i estimatet <c2/> (utledet for hånd, eksakt), og to enveismålinger gir i gjennomsnitt <c3/> (gjennomsnitt over seed); den ikke-gjensidige differensialforsinkelsen er en farget prosess med hvit FM + random-walk-FM, hvis Allan-avvik følger <c4/> (gjennomsnitt over seed, ~{ "20" }%, via lenkens egen <c5/>). <em>Parameterne</em> (<c6/> og <c7/> per lenke) er representative TWSTFT-/optiske tall (TWSTFT: two-way satellite time and frequency transfer), ikke tilpasset en bestemt terminal.

seg-6ab219622143 = Sikkerhet (skåre for spoofing-deteksjon)

seg-29dd10011ed1 = <c1/>: overvåkerens 1-sigma-gulv <c2/>, den resulterende minste påvisbare forskyvningen på <c3/> sigma og skåren <c4/> er utledet for hånd og enhetstestet. Modellen (innovasjon / klokkestøttet deteksjon i RAIM-stil (RAIM: receiver autonomous integrity monitoring)) er forsvarlig; <em>parameterne</em> (overvåkingsvindu <c5/>, deteksjonsmultiplikator <c6/>, målestøy <c7/>) er representative, ikke tilpasset en bestemt mottaker.

seg-ca51e4f1e19c = Deteksjon av spoofing-angrep

seg-e991f5b2fdb2 = <c1/>: en spoofing med gradvis økende falsk tid flagges når forskyvningen overstiger klokkens deteksjonsgrense; deteksjonstidspunktet stemmer med det håndutledede <c2/> innenfor ett rutetrinn, og en klokke hvis grense overstiger spesifikasjonen lar spoofingen nå terskelen uoppdaget. Samme forbehold om <c3/> som for sikkerhetsskåren.

seg-3d2f6d2b7722 = Flimrende FM (gulv)

seg-55697d598918 = <c1/> (av som standard)

seg-55000870c060 = Syntetisert som en sum av logaritmisk fordelte Ornstein-Uhlenbeck-prosesser (OU) kalibrert til et konfigurerbart flatt ADEV-gulv; <c1/> validerer at gulvet er flatt over midlingstiden og ligger på det konfigurerte nivået (gjennomsnitt over seed). Aktiveres per klokke via <c2/>. De siterte referansescenarioene lar det stå av: CSAC domineres av hvit FM over databladets område (1-1000 s), og det systematiske gulvet til den optiske klokken (~{ "5e-17" }) er representert ved nøyaktighetstallet.

seg-e2e3de9a61a4 = Monte Carlo-utvalgsstatistikk

seg-9785d05ec5a7 = <c1/> (aggregering)

seg-cc6c6bb5eb83 = <c1/>: persentiler etter nærmeste rang og gjennomsnitt over <c2/> reproduserbare realiseringer; en enkelt kjøring kollapser spredningen, båndet per tidstrinn er ordnet <c3/>, og gjentatte kjøringer er bit-identiske. Dette er statistisk aggregering over den allerede validerte enkeltkjøringen, ikke en ny fysisk modell.

seg-72a9d5de61f5 = sigma_y({ "1" } s)

seg-ebbe708d9cbc = csac-sa45s (CSAC)

seg-c43fe67d4200 = Datablad for Microchip SA65 / SA.45s

seg-e3bde4355d78 = optical-sr-lattice (Sr-gitter)

seg-87793f684233 = optisk gitterklokke med strontium, mål for rombruk, arXiv:{ "1503.08457" }

seg-b03f5856d451 = Status: hvit FM og random-walk-FM validert; aldring modellert og kalibrert bort; flimrende FM modellert og validert (av som standard i de siterte scenarioene).

seg-c5ff448dcb88 = Modenhet: tallene for optiske klokker er <em>målet for rombruk</em> på bakkemaskinvare -- ingen optisk strontiumklokke har vært i rommet. Laboratorieklokker med Sr når { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). CSAC-tallene stammer fra en kommersiell komponent i bruk.

seg-b59a4b8e6d88 = Sammenhenger: Riley, NIST SP { "1065" }, lign. { "67" } -- hvit FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); random-walk-FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, tilsvarende q_rw*tau/3 for en Wiener-prosess i frekvens med diffusjon q_rw.

seg-dca7ee671d91 = Pakke { "2" } — treghetsbasert dødregning (kvante-treghetsmåleenhet)

seg-98452a081241 = Konstant/gjenværende bias -> posisjon

seg-6aa386251acf = posisjonsfeil = { "0.5" }<em>b</em>T^{ "2" }-familien (Groves AESS (Aerospace and Electronic Systems Society), innføring); håndutledet diskret test i <c1/>.

seg-c60c0b54c485 = Hastighets-random-walk (hvit akselerasjon)

seg-7ce1f40566cf = <c1/>: simulert standardavvik (SD) for posisjonsfeilen stemmer med sigma_x(T)=sqrt(S_a*T^3/3) (Groves lign. 54) til ~{ "12" }% observert (gjennomsnitt over seed; håndhevet grense { "20" }%).

seg-8ac776795d40 = Fysikken i akselerometer med kaldatom-interferometer (CAI) (fra grunnprinsipper)

seg-4eafc81873ed = <c1/>: et kaldatom-interferometer av Mach–Zehnder-type med tre pulser. Kontrollert for hånd mot lærebokgeometri — Rb-87 <c2/>; <c3/> ved { "1" } g, <c4/>; projeksjonsstøy <c5/> ved <c6/>, <c7/>; <c8/> per skudd; skaleringslovene <c9/> og <c10/>; eksponentielt kontrasttap. <c11/> <b>utleder</b> den hvite akselerasjons-PSD-en (effekttetthetsspekter) som den klassiske <c12/> bruker. Ærlig avgrensning: bare <b>gulvet for kvanteprojeksjonsstøy</b> (~{ "0.09" } ug/sqrtHz her) — langt under reelle, vibrasjonsbegrensede enheter (1-50 ug/sqrtHz); vibrasjonstensoren, Coriolis og systematiske lysforskyvninger er ennå ikke modellert (se <a1><c13/></a1>).

seg-ed78f40a8d80 = Gyrobias + vinkel-random-walk (ARW) -> helning -> gravitasjonskobling

seg-a73e97ac4a0e = En gjenværende gyrobias og ARW gir en holdningsfeil; helningen kobler gravitasjon (<c1/>) inn i horisontal feil i spesifikk kraft. <c2/> validerer den rene kubiske posisjonsveksten fra bias eksakt, og ARW-veksten i holdning som en Wiener-prosess (gjennomsnitt over seed). Aktiveres per sensor via <c3/> og <c4/>; av i de siterte scenarioene med bare akselerometer.

seg-e68d093e952a = Biasustabilitet (1/f-flimmergulv)

seg-5ad1e7d55d07 = <c1/>: en 1/f-flimmerprosess (samme OU-syntese som er validert for klokken) der det flate gulvet i Allan-avviket ligger på koeffisienten for biasustabilitet; null er ingen operasjon, et gulv som ikke er null endrer banen, og begge er reproduserbare. Aktiveres per sensor via <c2/>.

seg-b631c1bfce05 = Akselerasjons-random-walk (rate random walk)

seg-4a4a70363412 = <c1/>: biasen er en Wiener-prosess med <c2/>, kontrollert som gjennomsnitt over seed til ~{ "20" }%. Aktiveres per sensor via <c3/>.

seg-49c4a2532dca = Kryssvalidering mot NaveGo (støykoeffisienter for IMU (inertial measurement unit))

seg-e558aa705560 = <c1/>: en ekstern kryssjekk mot <b>NaveGo</b> (R. Gonzalez, åpen kildekode-verktøykasse for INS/GNSS (INS: inertial navigation system), <c2/>). Reproduserer den syntetiske rundturen i NaveGos <c3/> på dens <b>publiserte referanseprofil for Microstrain 3DM-GX3-35</b>: når vår overlappende ADEV-estimator (validert mot NBS14/Stable32) mates med hvit sensorstøy på NaveGos 1-σ-nivåer, gjenvinner den koeffisientene for hastighets- og vinkel-random-walk (VRW, ARW) (<c4/>) til <c5/> (faktisk ~{ "0.4" }%), der grenen for hvit støy ligger på stigningen −1/2. Bekrefter at vår Allan-pipeline og NaveGos definisjoner av VRW/ARW er i overensstemmelse. Den registrerte STIM300-loggen <c6/> på { "40" } MB leses ikke inn (avhengig av binærformat).

seg-171b215f0526 = Skaleringsfaktor, finere kryssaksetermer

seg-b690ed87f493 = <c1/> i denne pakken med 1-DOF (én frihetsgrad)

seg-c1bd4e24c091 = Den eldre enakse-pakken har ingen feil i skaleringsfaktor eller krysskobling. Det treaksede strapdown-biblioteket og <c1/>-pakken modellerer skaleringsfaktor, skjevstilling, g-følsomhet, kvantisering og ratetrapp (<c2/>; se tabellen over påstander nedenfor).

seg-ce2b3237acfe = biasstabilitet

seg-129dc6af8f10 = støy, rot av PSD

seg-7109e60b8c9b = cold-atom-quat (kvante)

seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

seg-09b42bed82c9 = nav-grade-quartz (klassisk)

seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

seg-8714c547449a = Honeywell QA-2000 / Groves AESS, innføring

seg-79fc524162b5 = Ærlig vurdering: fordelen med kaldatomer er <b>langsiktig biasstabilitet</b> (~2600 ganger lavere), som dominerer under et langt GNSS-avbrudd via { "0.5" }<em>b</em>T^{ "2" }. Kortsiktig støy er på samme nivå (kvante ~{ "22" } mot klassisk ~{ "20" } ug/sqrtHz) — kvantesensoren vinner maratonet, ikke sprinten. Modenhet: kaldatom-akselerometre er på laboratorie- eller tidlig stadium (JRC122785), mens kvarts i navigasjonsklassen er i bruk.

seg-e02e93f4f30a = Pakke { "3" } — tidsoverføring (optisk mot radiofrekvens (RF), optisk lenke mellom satellitter)

seg-2b87e5f0ba7e = Hvit tidsjitter -> synkroniseringspresisjon

seg-229295aa1f70 = <c1/>: simulert synkroniserings-RMS reproduserer lenkejitteren sigma_j; utvalgsgjennomsnittet midles som sigma/sqrt(N) til <{ "20" }% (gjennomsnitt over seed).

seg-4325ec478bca = Tidssynkronisering -> enveis avstandsmåling

seg-aa7a1f463683 = avstand = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (eksakt, håndutledet test).

seg-7ad8bb95bf35 = Flimmer-/TDEV-gulv, rest av toveis resiprositet

seg-5bf72778b6c2 = <c1/> (typen <c2/>): flimrende fasestøy (Kasdin–Walter, flat TDEV), en døgnvariasjon i ikke-resiprositet og en konstant resiprositetsrest på toveisserien; pakken <c3/> med hvit jitter er uendret.

seg-dae3fa0375fe = jitter for enkeltprøve

seg-4a141a45a8ff = kilde

seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

seg-c78abd60ec97 = mål som er troverdig i bane

seg-9dfc1d4334a3 = optisk lenke mellom satellitter, synkroniseringsmål på pikosekundnivå; laboratorie-O-TWTFT (TWTFT: two-way time and frequency transfer) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

seg-0e730e8e2237 = målt i én enkelt økt

seg-b9faad47d802 = TWSTFT hos BIPM/PTB/NIST (BIPM: Det internasjonale byrået for mål og vekt; PTB: Physikalisch-Technische Bundesanstalt, Tysklands nasjonale metrologiinstitutt)

seg-51e2e5782c96 = Ærlig vurdering: tallet for optisk er et synkroniseringsmål i bane på pikosekundnivå (ikke fløyet). Gulvet i terrestriske optiske laboratorier er ~{ "1" } fs (langt bedre); en godt konstruert mikrobølgelenke (mikrobølgelenken (MWL) i ACES (Atomic Clock Ensemble in Space), ~{ "0.3" } ps) kan måle seg med optisk, så grunnlinjen «RF = { "0.5" } ns» gjelder spesifikt vanlig TWSTFT. Avstandsomregningen er enveis (avstand = c<em>dt); toveis/rundtur halverer den (avstand = c</em>dt/2).

seg-5fa72f18f983 = Pakke { "4" } — hybrid fusjon (avslutningen)

seg-3de12b094504 = Setter sammen Pakke { "1" } (klokke), Pakke { "2" } (treghet) og Pakke { "3" } (tidsoverføring) til én PNT-suite (posisjonering, navigasjon og tidssynkronisering). Suiten må holde BÅDE tidssynkronisering (< krav til tid) og posisjon (< krav til posisjon) innenfor grensene; <c1/> er tiden til en av dem brytes. Valgfri tidsoverføring med optisk lenke mellom satellitter (ISL) synkroniserer klokken på nytt under avbruddet (bare tidsstøtte — posisjonen synkroniseres ikke på nytt, siden tidsoverføring gir tid, ikke posisjon).

seg-4f7cd8f86565 = Aspekt

seg-19deb2a3537c = Samlet PNT-skåring (tid OG posisjon)

seg-77a7595ffad7 = <c1/> håndutledet <c2/>-test (pnt_holdover = den første av tid/posisjon som brytes).

seg-d0e39bf123d8 = Integritet + sikkerhet for hybridpakken

seg-3fb63eb2b6b8 = <c1/>: en Kalman-estimator for tid som er disiplinert mot referansen (nominelt) og forankret på nytt ved hver optiske resynkronisering; integritet er beskyttelsesgrensens dekning (grensen inkluderer jittergulvet i lenken), og sikkerhet er skåren for spoofing-deteksjon. Testet for begge suitene, inkludert tilfellet med lenkestøtte.

seg-c3be96b7cb41 = Felles fusjonsestimator

seg-e9d5448ea06c = <c1/>: ett felles Kalman-filter ([fase, frekv] ⊕ [pos, vel]) er navigatøren, disiplinert av GNSS (lærer forskyvningene fra en initialkovarians som ikke er null) og støttet av tidsoverføring; den felles kovariansen gir en felles integritet som er testet som pålitelig (≥{ "0.9" }) for begge suitene med sensorer som er konsistente med støyen. Pakken observerer posisjon og tid <b>hver for seg</b>, og for dette er det optimale filteret blokkdiagonalt; estimering av konstant bias med utvidet tilstand og dynamisk kryssstøtte er fremtidig arbeid.

seg-915ec766439f = Koblet filter for klokke + posisjon (kovarians på tvers av blokker)

seg-fd718a51859a = <c1/>: ett enkelt stablet <c2/>-Kalman-filter (oppdateringer i Joseph-form) der <b>pseudoavstands</b>målingen <c3/> kobler posisjons- og klokkeblokkene. Tester: en felles pseudoavstand gjør <c4/> forskjellig fra null (frakoblede filtre holder den nøyaktig på { "0" }); to ulike geometrier løser sammen opp injiserte posisjons- og klokkeforskyvninger som en enkelt avstand ikke kan skille; en <b>bare-klokke</b>-posisjonsbestemmelse skjerper <b>posisjonen</b> gjennom kryss-kovariansen (gevinsten koblingen gir og frakoblede filtre ikke kan gi); og en Monte Carlo-<b>NEES er χ²({ "4" })-konsistent</b> (Bar-Shalom §{ "5.4" }, kjøringsbasert bånd). 1-DOF (pakkens dimensjonalitet); ennå ikke koblet inn i den kjørbare pakken, og utvidelsen til 3-D med 8 tilstander er fremtidig arbeid.

seg-31ecf062b941 = Sammensetning av validerte delmodeller

seg-9b849cb4fe8d = arver

seg-4e1c8b6791f3 = ledd for klokke/treghet/tidsoverføring er validert i sine egne pakker.

seg-b672e5499976 = Løst koblet GNSS/INS (<c1/>-pakke)

seg-277425f2cbcf = <c1/>: et EKF med 15 feiltilstander (δp, δv, ψ, akselerometer-/gyrobias; Groves §{ "14" }) styrer den treaksede strapdown-navigatoren med tilbakekobling. Tester: en injisert posisjonsfeil nulles med perfekt referansestøtte; den støttede løsningen holdes begrenset til meter mens en frittgående INS divergerer forbi { "100" } m; og den fusjonerte posisjons-RMS over et avbrudd på { "60" } s er bedre enn ustøttet dødregning med grensen i utvalgstesten (~{ "4" }× målt før { "0.27.3" }; marginen er større etter rettelsen nedenfor). Koblingen for gyrobias kontrolleres mot strapdown-beregningen selv: en kjent gjenværende gyrobias må gi den holdningsfeilen filteret forutsier (<c2/>), og en bred prior må lære en gyrobias i flykontrollerklassen og samtidig holde seg begrenset; begge feiler med fortegnet fra før 0.27.3. <b>Revidert i { "0.27.3" }:</b> koblingen hadde feil fortegn, så estimatene for gyrobias ble dratt feil vei og bare en stram prior holdt pakken stabil; de publiserte tallene for avbrudd ble endret (CHANGELOG, Fixed). Ærlig begrensning: akselerometerbias og helning er bare svakt adskillbare ved løs kobling, så kalibrering per bias gjøres ikke gjeldende.

seg-1c9a9f76a432 = Tett koblet GNSS/INS (pseudoavstand)

seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: innovasjonen dannes i avstandsdomenet (Jacobi-matrise for siktelinje på δp). Tester: fire satellitter nuller en injisert horisontal feil på { "8" } m/−{ "5" } m til < { "0.1" } m; <b>to satellitter</b> (ingen PVT-posisjonsbestemmelse (posisjon, hastighet og tid) er mulig) reduserer likevel den horisontale feilen med > { "5" }×; en enkelt satellitt rett over observerer bare komponenten langs siktelinjen (vertikalt) og lar den horisontale være urørt; ugyldige inndata avvises. Bare pseudoavstand — bærebølgefase og en eksplisitt tilstand for mottakerklokke står på veikartet.

seg-240b681b6021 = Nøyaktighet i kryssstøtte mellom sensorer (full Kalman-/faktorgraf-fusjon)

seg-efe7e288276b = <c1/> i pakken <c2/>

seg-e5371874c57d = Hybridpakken er en sammensetning på systemnivå med tidsstøtte, ikke en optimal estimator. Filtre finnes andre steder: det løst og tett koblede EKF (extended Kalman filter) i <c1/>-pakken (radene over) og UKF-et (unscented Kalman filter) med 17 tilstander i typen <c2/>. Ingen faktorgraf-glatter er modellert.

seg-189758709fd2 = Resultat: kvantesuiten holder full PNT gjennom et avbrudd på { "1.8" } h; den klassiske suiten er <b>begrenset av posisjonen</b> (IMU i navigasjonsklassen bryter først). Tidsoverføring med optisk lenke mellom satellitter holder selv den klassiske KLOKKEN låst, og isolerer treghetssensoren som den klassiske suitens svake ledd — hovedargumentet for kvantetreghet og optisk tidssynkronisering sammen.

seg-a4c5b45ea8a5 = Geometri — GNSS-tilgjengelighet fra baner

seg-d347bb63c1fd = Sirkulær tolegemeutbredelse

seg-60c369fbbd97 = <c1/>: periode <c2/> (mu = { "3.986004418e14" }), posisjonen kommer tilbake etter én periode, ekvatorial/polar planaritet — håndutledede tester.

seg-1260a2fef95f = Eksentrisk (Kepler-)utbredelse

seg-49df9d526f9c = <c1/>: Keplers ligning <c2/> løst med Newton (rest < { "1e-12" }); perigeum-/apogeumradier <c3/>; det sirkulære tilfellet stemmer med den lukkede formen til { "1e-9" }.

seg-958f03424508 = Sekulær drift i J2 for node/apsider

seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); noden går bakover (prograd) / fremover (retrograd) / er stasjonær (polar), og apsidene fryser ved den kritiske inklinasjonen { "63.4" } deg — håndutledede tester av fortegn og null. Bare tolegeme + sekulær, ikke oskulerende.

seg-dcba8d368326 = Siktlinjesynlighet (jordokkultasjon + elevasjonsmaske)

seg-2eee9a8f894b = En satellitt på motsatt side av jorden er okkultert, en satellitt rett utover radielt står i { "90" } deg elevasjon, og en tangentiell satellitt står ved horisonten — eksakte håndutledede tester.

seg-f251c75eb367 = Synlighet -> GNSS-tilstand -> tidslinje

seg-70fbb9f3cc2b = <c1/> synlige = nominelt, 1-3 degraded, { "0" } nektet; Walker-delta-generator; en integrasjonstest driver en holdover-kjøring for klokken fra den utledede tidslinjen.

seg-988d3fedb7f5 = Optimerer for konstellasjonsutforming + geometri med dekningsstriper (streets of coverage)

seg-2a636487a4e6 = <c1/>: <c2/> søker gjennom rutenettet <c3/> og returnerer cellen som best oppfyller et <c4/> (færrest mulig satellitter for et dekningsmål / størst dekning / lavest verste PDOP (PDOP: position dilution of precision)) — en test slår fast at valget er likt en uavhengig brute force-skanning av det samme sveipet, og et gjennomgått eksempel bekrefter at en GPS-utforming (Global Positioning System) Walker 24/6/1 dekker minst like godt som en uttynnet utforming med 18 satellitter. De analytiske lukkede formene for <b>dekningsstriper (streets of coverage)</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) er kontrollert for hånd mot lærebokgeometri (GPS ved { "5" }°-maske: λ ≈ { "71.16" }°, halv stripebredde for 4 satellitter ≈ { "62.83" }°) og oppdager underbefolkningsgapet (<c9/>). Den fullstendige løseren til Rider for minste antall satellitter for <em>global</em> dekning (antall plan, som er følsomt for sømmer) er ennå ikke implementert.

seg-a1c1364cc45a = Dilution of precision (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometric dilution of precision; HDOP: horizontal dilution of precision; VDOP: vertical dilution of precision; TDOP: time dilution of precision)) -> posisjonsnøyaktighet

seg-a1706d47f895 = <c1/>: <c2/> fra designmatrisen for siktelinjer. <b>Ekstern uavhengig referanse</b> (<c3/>): de fem DOP-faktorene reproduserer de som er beregnet av <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — et uavhengig, fagfellevurdert GNSS-bibliotek, brukt her slik ERFA (Essential Routines for Fundamental Astronomy) brukes for referansesystemene) over <b>{ "8" } geometrier</b> fra velkondisjonerte til nesten singulære (DOP i hundrevis), til <b>{ "1e-6" }</b> relativt; opphav og regenerering i <c4/>. Som en ekstra kontroll mot lukket form reproduserer en geometri med regulær tetraeder de analytiske DOP-verdiene (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) til { "1e-9" }. Posisjons-sigma = PDOP × brukerekvivalent avstandsfeil.

seg-504d5aa92cbc = Posisjonsfeil = σ_UERE × DOP for motorens egen minste kvadraters posisjonsbestemmelse

seg-fc3443210358 = <c1/>, <c2/>: en Monte Carlo med fast seed (N = { "20,000" } epoker per geometri, σ = { "1.5" } m, ChaCha8-seed { "36" } + i) av <c3/> med enhetsvekter, løst fra den sanne posisjonen, på de <b>{ "8" } geometriene i <c4/></b> (de hvis DOP er tilpasset gnss_lib_py), mot σ²·Q der Q er kovariansfaktoren til selve kjernen <c5/> (<c6/>, den samme aritmetikken). <b>Toleransene er fastsatt på forhånd</b> (commit e50c88d2, før første kjøring, etter notatet om geometriutforming for { "0.36" }, avsnitt { "5.2" }), hver som et antall standardfeil: varianser i øst, nord, opp og klokke innenfor { "5" } %; RMS for H/V/P innenfor { "2.5" } %; korrelasjon øst–nord innenfor { "0.035" }; middelverdier innenfor { "5" } standardfeil; andelen i den horisontale { "95" } %-ellipsen innenfor { "0.95" } ± { "0.0077" }. Første kjøring: alle { "104" } kontroller består (verste varians { "3.2" } %, RMS { "1.6" } %, korrelasjon { "0.012" }, middelverdi { "2.2" } standardfeil, ellipse { "0.0039" }). <b>Negative kontroller</b> feiler som kravet er: PDOP doblet feiler for hver geometri; feil som vokser som 1/sin(elevasjon) mot den uvektede Q feiler en variansjekk for hver geometri der den laveste satellitten står under { "20" }°. <b>Hvordan den henger sammen med raden over:</b> den raden validerer DOP for disse geometriene mot gnss_lib_py; denne legger til steget fra disse faktorene til meter gjennom motorens løser. <b>En første, separat kontroll er beholdt ved siden av</b> (<c7/>, <c8/>, kjørt før forhåndsregistreringen og rapportert som det): fire håndvalgte himmelutsnitt (åpen, klynget, canyon, halv himmel; σ { "1" } m) med kjikvadrat-konfidensintervaller på { "1e-6" } totalt over { "20" } kontroller; forhold { "0.987" } til { "1.009" }, og egne negative kontroller (en DOP-feil på { "10" } %, feil som 1/sin(elevasjon)) feiler som kravet er. <b>Hvorfor MODELLED:</b> ingen eksternt datasett; den viser ikke at feilen til en reell mottaker følger modellen, og σ_UERE er en inndata.

seg-94bffbd8385b = Tilgjengelighet med flere konstellasjoner

seg-a40eab03bbbe = <c1/>: ekstra <c2/> slås sammen til ett satellittsett for synlighet/DOP; en test av samlet antall bekrefter unionen.

seg-0b905100d91c = Kringkastet ionosfære (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → skrå L1-forsinkelse

seg-05e278f04770 = <c1/>: <c2/>, den kringkastede enfrekvensmodellen med åtte koeffisienter. <b>Ekstern uavhengig referanse</b> (<c3/>): den skrå L1-forsinkelsen reproduserer <b><c4/> i RTKLIB (et åpent bibliotek for sanntids kinematisk posisjonering)</b> (tomojitakasu/RTKLIB, <c5/> — den faktiske GNSS-referansen, kompilert fra kildekode og kjørt uavhengig) over <b>{ "10" } tilfeller</b> som spenner over elevasjon, asimut, lokal tid og to koeffisientsett (kshanas standard + RTKLIBs), til <b>< { "1e-4" } m</b>. Leseren for IONEX-TEC-kart (IONosphere map EXchange format; TEC: total electron content) for GIM-filer (global ionosphere map) finnes nå (<c6/>, <c7/> med bilineær interpolasjon i rom og tid og en skrå avbildning, enhetstestet i selve pakken); en kryssjekk av denne interpolasjonen mot et reelt GIM-produkt fra CODE (Center for Orbit Determination in Europe) gjenstår som oppfølging. Selve den kringkastede modellen er validert eksternt.

seg-39e235557ecc = Deteksjonskjerne for RAIM/ARAIM (ARAIM: advanced receiver autonomous integrity monitoring) (χ² / ikke-sentral χ² / normal) → terskler og multiplikatorer

seg-8906f922b9b9 = <c1/>: deteksjonsterskelen for øyeblikksbilde / løsningsseparasjon / ARAIM (<c2/>), ikke-sentraliteten for tapt deteksjon <c3/> (<c4/>) og multiplikatorene K_fa/K_md/K_V (<c5/>) beregnes alle fra en avhengighetsfri regularisert ufullstendig gammafunksjon. <b>Ekstern uavhengig referanse</b> (<c6/>): <b>{ "171" } tilfeller</b> reproduserer <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> — en uavhengig Cephes-/Boost-implementasjon, en annen algoritme) over driftsområdene for P_fa / P_md / redundans, til <b>≤ { "1e-6" } relativt</b>. Geometrien som omslutter kjernen (stigningen/kovariansen fra <c11/>) er DOP-kjernen som er validert mot gnss_lib_py. <b>Avgrensning:</b> denne raden forankrer <em>den statistiske kjernen</em>. Selve <em>verdien</em> av beskyttelsesnivået i ARAIM MHSS-allokeringen (multiple-hypothesis solution separation) er forankret separat mot det publiserte regneeksempelet fra ARAIM Technical Subgroup i WG-C (Working Group C) (<c12/>, VPL (vertical protection level) { "18.2926" } m mot { "18.3" } m, HPL (horizontal protection level) { "13.4063" } m mot { "13.45" } m, innenfor referansens egen toleranse på { "0.05" } m; se standardmerknaden nedenfor og <a1><c13/></a1>).

seg-b17f1501a267 = SBAS-beskyttelsesnivå (satellite-based augmentation system) (DO-229E vedlegg J) → horisontalt / vertikalt beskyttelsesnivå (HPL / VPL)

seg-abe00b67e4cb = <c1/>: <c2/>, vektet minste kvadrater (LS: least squares) <c3/> → hovedaksen i den horisontale feilellipsen + vertikal σ, skalert med K-faktorene i DO-229E. <b>Ekstern uavhengig referanse</b> (<c4/>): kshanas HPL reproduserer <b>RTKLIB SBAS-PL-forken</b> (<c5/> <c6/>, implementasjonen «DO-229D Appendix J» av Siki & Takács { "2017" }), kjørt av <c7/> på <b>reelle EGNOS-data (European Geostationary Navigation Overlay Service)</b> (kringkastede meldinger fra GEO (geostasjonær bane) PRN120 + reell RINEX (Receiver Independent Exchange Format) fra BUTE/Budapest, 2017-02-19), over <b>{ "6" } epoker</b> til <b>< { "2e-3" } m</b>. σ per satellitt er orakelets eget fulle SBAS-budsjett (UDRE (user differential range error) + GIVE (grid ionospheric vertical error) ionosfære + troposfære + luftbårent). ESA gLAB { "v6.0.0" } (<c8/>) ble kompilert og bekreftet å bruke nøyaktig samme konvensjon. <b>Merknad om K_V:</b> begge referansene runder av MOPS (minimum operational performance standards) K_V → { "5.33" }; kshana bruker det eksakte <c9/> (~{ "0.06" } % mindre VPL), så den vertikale komponenten er validert som det K-faktorfrie <c10/> (= VPL fra referansen / { "5.33" }). HPL sammenlignes direkte (K_H = { "6.0" } på begge sider).

seg-fd16d642cafd = Reell konstellasjonsgeometri fra TLE-er (linje 2 / Kepler)

seg-1311ef1cb4bb = <c1/> (parsing)

seg-5117debbce89 = <c1/>: parser de midlere Kepler-elementene på linje 2 (store halvakse fra midlere bevegelse); et kjent elementsett for ISS (International Space Station) gir de riktige elementene og perioden ved rundtur. For en blokk med bare linje 2 er utbredelsen motorens tolegemeløsning (+ valgfri J2) av de <em>midlere</em> elementene — forsvarlig for et øyeblikksbilde fra en felles epoke, men avviker fra SGP4 (Simplified General Perturbations { "4" }) over tid.

seg-26d22e76e28d = Utbredelse med SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (fullstendige TLE-er)

seg-1099f1bffa01 = <c1/>: fullstendig SGP4 for nær jorden + SDP4 for dypt rom (sekulære/periodiske ledd fra måne og sol + { "12" } h / { "24" } h geopotensiell resonans). Validert i <c2/> mot de offisielle vektorene i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 («Revisiting Spacetrack Report #3») — alle { "666" } referansetilstander (nær jorden, dypt rom, resonante, feilkodetilfeller) stemmer med en verste posisjonsfeil på ≈ { "4.1" } mm. Et fullstendig sett med to linjer (linje { "1" } + linje { "2" }) utbres med SGP4; bare linje 2 forblir Kepler; de to kan blandes. Referansesystemet er TEME (true equator, mean equinox), brukt konsekvent for brukeren og satellittene (ingen TEME→ECEF-reduksjon (ECEF: Earth-centred, Earth-fixed) — tilstrekkelig for geometri for tilgjengelighet/DOP).

seg-c8fc6a49d249 = Nutasjon etter IAU (International Astronomical Union) 2000A / 2000B + reduksjon TEME→GCRS (GCRS: Geocentric Celestial Reference System)

seg-b31c49596100 = <c1/>: den <b>fullstendige IAU 2000A</b>-serien ({ "678" } lunisolare + { "687" } planetære ledd, <c2/>) og trunkeringen 2000B med 77 ledd (<c3/>) er hver validert <b>bit for bit</b> mot de publiserte referansevektorene i SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) ved JD_TT { "2453736.5" } — <c4/> gir Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> gir Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — begge til <b>{ "1e-13" } rad</b>. Tabellen for 2000A er maskingenerert fra ERFA-kilden <c6/> av <c7/> (reproduserer den innsjekkede <c8/> bit for bit). Nutasjonsmatrisen (<c9/>), likedagjevningsligningen og hele kjeden TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) (<c10/>, Vallado AIAA-2006-6980) er testet for egenskapene egen rotasjon / rundtur / presesjon pluss nutasjon, nutasjonsmatrisen mot ERFA <c11/> element for element til { "1e-14" }, og hele kjeden TEME→GCRS mot Vallados publiserte eksempel TEME→GCRF (AIAA 2006-6753, 2004-04-06) til <b>{ "0.11" } m</b> (<c12/>); før denne ende-til-ende-kontrollen ble lagt til, hadde nutasjonsmatrisen feil fortegn på Δψ, en dreining på { "2" }·Δψ (omtrent { "25" }″) som egenskapstestene ikke kunne se (se CHANGELOG, Unreleased, Fixed); 2000A og 2000B stemmer overens til < { "1" } mas som påkrevd. Kjeden er basert på jevndøgn/GMST (GMST: Greenwich mean sidereal time); reduksjonen med CIO (X,Y,s) som er uavhengig av jevndøgn og dens uavhengige numeriske kryssjekk med ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — et rent Rust-verktøysett for planetgeometri; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m i GNSS-bane, godt innenfor målet på < { "10" } m) står i CIO-raden nedenfor.

seg-0be3c40cc81a = IGRF-14 (IGRF: International Geomagnetic Reference Field) modell for det geomagnetiske hovedfeltet

seg-9dbb3b1b18a1 = <c1/>: IAGAs Schmidt-normaliserte sfærisk-harmoniske felt (grad/orden { "13" }, { "2025.0" } + sekulær variasjon; koeffisientene er maskingenerert fra den offisielle <c2/> av <c3/> og reproduserer <c4/> bit for bit). Validert på fem uavhengige fronter: ({ "1" }) eksakte stikkprøver av koeffisienter mot IAGA-filen (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) syntesen av grad 1 reproduserer det <b>eksakte lukkede feltet fra en tiltet dipol</b> <c5/> til { "1e-6" }; ({ "3" }) det <b>fullstendige analytiske feltet av grad 13 er lik −∇V</b> av det skalare potensialet (differanser, til { "1e-4" }) — som prøver Legendre-derivatene og leddet 1/sinθ ende til ende; ({ "4" }) dipolaksen reproduserer den kjente <b>geomagnetiske nordpolen</b> (~{ "80.7" }°N, −{ "72.7" }°E) og <b>dipolstyrken</b> (~{ "29.7" } µT), og det globale feltet ligger i det fysiske området { "22" }–{ "67" } µT med riktig fortegn for inklinasjon på hver halvkule; og ({ "5" }) <b>ekstern uavhengig referanse</b> — hele syntesen reproduserer verdiene fra den offisielle <b>IGRF-14-nettjenesten til British Geological Survey</b> ved { "2025.0" } (geodetisk, WGS-84 (WGS: World Geodetic System)-høyde) til <b>< { "2" } nT</b> for X/Y/Z/F og <c6/> for D/I i fire punkter, blant dem { "400" } km høyde (<c7/>).

seg-c1027d5ffc44 = CIO-basert reduksjon GCRS↔ITRS (ITRS: International Terrestrial Reference System) etter IAU 2006/2000A

seg-aad81285e8cf = <c1/>: kjeden fra himmelsystem til jordsystem som er uavhengig av jevndøgn. CIP-koordinatene (Celestial Intermediate Pole) <c2/> og CIO-lokatorserien <c3/> med 66 ledd er validert <b>bit for bit</b> mot den publiserte SOFA/ERFA-vektoren <c4/> ved JD_TT { "2453736.5" } — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); matrisen GCRS→CIRS (CIRS: Celestial Intermediate Reference System) mot <c5/> (alle ni elementer til { "1e-12" }); jordrotasjonsvinkelen (ERA) mot <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). Tabellen <c7/> er maskingenerert fra ERFA-referansen <c8/> av <c9/> (reproduserer <c10/> bit for bit). Hele <c11/> (CIO <c12/> = polbevegelse · ERA · GCRS→CIRS) er testet for egen rotasjon + rundtur, og vist å være konsistent med den eldre TEME-reduksjonen etter jevndøgn/GMST-1982 innenfor { "1" } m ved en radius på { "7 000" } km (konvensjonene avviker med omtrent { "5" } cm der). <b>Uavhengig kryssjekk fra tredjepart (<c13/>):</b> den samme <c14/> sammenlignes mot <b>ANISE</b> (den rene Rust-reimplementasjonen av NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)) som roterer GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) fra <c15/> hos JPL (Jet Propulsion Laboratory), med <b>identiske jordorienteringsparametere fra IERS (International Earth Rotation and Reference Systems Service) <c16/> gitt til begge sider</b>, over åtte kvartalsvise epoker { "2020" }–{ "2023" }. De to uavhengige realiseringene av referansesystemet stemmer til en <b>største relative rotasjon på { "0.028" }″ — ≤ { "0.86" } m på bakken, ≤ { "0.93" } m i LEO (low Earth orbit), ≤ { "3.6" } m i GNSS-bane</b> (middelvinkel { "0.023" }″). Dette er kryssjekken av referansesystem på «< { "10" } m» fra ROADMAP, <b>levert</b>; resten er den forventede forskjellen i modell/datum mellom ITRF93 og IERS-2010-CIO, ikke en feil (det bit-for-bit-forankrede grunnlaget er fortsatt SOFA/ERFA-vektorene over). ANISE er en crate med MPL-2.0 (MPL: Mozilla Public License) / edition 2024, så kontrollen ligger i en frittstående underkrate utenfor arbeidsområdet som aldri berører avhengighetsgrafen til den publiserte <c17/> eller noen standard CI-port.

seg-fa5889f379d2 = Rundtur for eksport til SP3 (Standard Product { "3" }, formatet for presise baner) (konstellasjon → SP3-c → ny parsing)

seg-cd53434eba3a = <c1/>: det reelle øyeblikksbildet <c2/> fra Celestrak ({ "30" } GPS-satellitter) utbres med SGP4, eksporteres til SP3-c (<c3/> → <c4/>), parses på nytt (<c5/>), og de gjenvunne ECEF-posisjonene sammenlignes med SGP4-referansen i hver epoke over { "24" } h — verste rest <b>< { "0.5" } m</b> (skriverens serialisering i millimeter; milepælens toleranse på { "10" } m i TLE-klassen (TLE: two-line element set) er oppfylt med god margin). CLI-stien (kommandolinjegrensesnitt) <c6/> er også dekket: det medfølgende banescenarioet eksporterer en SP3 med 30 satellitter som kan parses på nytt, og et scenario uten bane avvises.

seg-fa5ee52e59aa = Reell geometri for GPS-konstellasjonen fra TLE-er (SGP4 → ECEF)

seg-1329a53ca94c = <c1/>: et ekte <b>øyeblikksbilde <c2/> fra Celestrak</b> (2021-07-28, { "30" } operative GPS-satellitter; opphav i <c3/>) parses, og hver satellitt utbres gjennom den validerte SGP4-kjernen til et felles tidspunkt og roteres TEME→ECEF. Slår fast at hele konstellasjonen havner på GPS-skallet i MEO (medium Earth orbit) innenfor { "1" }%, og at alle satellitter i sikte (ni satellitter) fra et sted på midlere breddegrad med åpen himmel gir PDOP { "1.64" } der den vertikale dilution er større enn den horisontale (slik den må være for en bakkebruker). Dette prøver SGP4 på en reell konstellasjon, ved siden av de reelle datastiene for SP3 (presis) og RINEX (kringkastet).

seg-a1b7d74bbe02 = Walker-generator med SGP4-middelelementer

seg-01f1635b75e4 = <c1/>: et utformet Walker-delta-mønster sendes ut som SGP4-middelelementer (Kozai-middelbevegelse valgt slik at SGP4-store halvakse havner på målskallet) og utbres gjennom den validerte kjernen. Tester: en GPS-lignende Walker med 24 satellitter ligger på MEO-skallet innenfor { "1" }%, planene er nøyaktig { "90" }° fra hverandre i RAAN (right ascension of the ascending node) gjenvunnet fra banenormalene, og middelbevegelsen reproduserer perioden på ~{ "718" } min for GPS-skallet.

seg-6e8c472ec9fa = PDOP-sveip for konstellasjon + FoM-er (figures of merit) for dekning/revisitt

seg-dcdbf9c78ca5 = <c1/> (monotoni)

seg-5a70f090db45 = <c1/>: <c2/> tabulerer dekning og median/verste PDOP over et <c3/>-rutenett; <c4/> rapporterer dekningsandelen og revisitt-gapene i et bakkepunkt. Validert ved de fysiske monotonitetene som en designavveining må følge: flere satellitter senker aldri dekningen og senker strengt median-PDOP (en full utforming med 24 satellitter dekker kontinuerlig ved PDOP ~{ "1.7" }), og fortetting av en uttynnet konstellasjon krymper strengt det verste revisitt-gapet. Det midlere revisitt-gapet overstiger aldri det største. Dette er geometritabeller for avveininger, ikke et sertifisert lenke-/dekningsbudsjett.

seg-9f0747d71ecc = Ærlig vurdering: dette er et deterministisk geometrilag (sirkulære baner, kuleformet jord med middelradius { "6371" } km, ren siktlinje). Det fastslår <em>tilgjengelighet</em> og <em>geometrisk</em> posisjonsnøyaktighet (dilution of precision × et representativt budsjett for avstandsfeil) fra reell geometri, ikke en navigasjonsløsning med presise efemerider. Referansen <c1/> plasserer et romfartøy inne i GNSS-skallet: det har bare posisjonsbestemmelse ~{ "59" }% av døgnet, kvanteklokken holder en tidsløsning på { "5" } ns gjennom hvert gap (tilgjengelighet { "1.0" }) mens chip-scale-klokken holder ~{ "0.73" }.

seg-e2c433c35ba8 = Numerisk (Cowell) propagator og kraftmodell

seg-20ace4e0a710 = Den numeriske propagatoren (<c1/>) integrerer en hierarkisk kraftmodell (<c2/>) med de adaptive integratorene (<c3/>). Hvert ledd nedenfor er validert mot analytisk fasit eller en håndutledet lukket form; forstyrrelsene er <b>av som standard</b>, så de utgitte referansefilene (golden) er urørt. Den sammensatte modellen er også kryssjekket mot et annet verktøy: <c4/> kjører { "11" } tilfeller med LEO og GTO (geostasjonær overgangsbane), { "275" } epoker per time, mot propagatoren DormandPrince853 i Orekit { "12.2" }, og de konservative nivåene (tolegeme → J2–J6 → sol/måne → kanonkule-SRP) stemmer til en verste verdi på { "0.08" } m over { "24" } h (VALIDATED i matrisen); luftmotstandsnivået er bare karakterisert ({ "333" } m) og forblir MODELLED.

seg-ec74e57ff801 = Cowell-propagator mot analytisk Kepler-fasit

seg-8d773778ff0e = <c1/>: den uforstyrrede (tolegeme-)banen reproduserer den <b>eksakte Kepler-løsningen med universelle variabler til under en meter over en LEO-bane på { "24" } h</b> (en strammere grense enn «mot en numerisk referanse < { "10" } m»); spesifikk energi og dreieimpuls er bevart til ~{ "1e-9" } relativt; nodeforskyvningen fra J2 reproduserer den lukkede <c2/> til førsteordens teori (innenfor { "2" } %, resten av orden O(J2²)). <c3/> returnerer <c4/> i stedet for et stille feil svar når Newton ikke konvergerer (nær perigeum e = { "0.999" }). Den robuste <c5/> (startverdi fra Markley { "1995" }, <c6/>) konvergerer der og over { "0" } ≤ e ≤ { "0.999999" }, innenfor { "0.9" } ε·|E| av mpmath-røtter med 50 siffer (<c7/>).

seg-549d15780f79 = Adaptive integratorer (RK4 (Runge–Kutta av fjerde orden) med trinndobling + det innebygde paret Dormand–Prince RK5({ "4" }), DP5({ "4" }) nedenfor)

seg-1fcc7553c627 = <c1/>: RK4 integrerer <c2/> til < { "1e-9" }, viser et fall i feil på ~{ "16" }× per halvert trinn (konvergens av 4. orden) og bevarer den harmoniske oscillatoren over en periode. Det innebygde feilestimatet i DP5({ "4" }) er <b>O(h⁵)</b> (halvering av trinnet kutter det ~{ "32" }×), integrerer oscillatoren over { "50" } perioder med energibevaring til < { "1e-6" }, og når samme sluttpunkt ved samme toleranse med <b>færre funksjonsevalueringer</b> enn trinndobling; <c3/> klarer den samme Kepler-grensen under en meter og stemmer med RK4-stien til < { "1" } m på en J2..J6-bane. <b>DOP853</b> (<c4/>): Hairers par av orden { "8" }({ "5,3" }) med tett utdata reproduserer DOP853 i SciPy { "1.18.1" } trinn for trinn (ett enkelt trinn innenfor { "5.6e-15" }; identiske trinntall i kjøringene med e = { "0.7" } og Arenstorf, ett skifte mellom aksept og forkastelse på { "501" } trinn i LEO-kjøringen; sluttilstander innenfor { "1.6e-12" }) og stemmer med den eksakte Kepler-løsningen like godt som SciPy gjør (<c5/>).

seg-345ae1eb05ec = Zonalt harmonisk felt J2–J6

seg-a88e67186e69 = <c1/>: <c2/> kontrolleres på tre måter — det <b>reduseres til den <c3/> som er validert med 666 vektorer, til maskinpresisjon</b> når det begrenses til <c4/>; det <b>stemmer med den numeriske gradienten av sitt eget zonale potensial</b> gjennom hele J2..J6-feltet (gullstandarden for konservative felt); og de odde leddene <c5/> mot de like leddene <c6/>/<c7/> viser den karakteristiske (anti)symmetrien nord–sør under <c8/>. En utbredt J2..J6-bane bevarer total energi til ~{ "1e-8" } over et døgn.

seg-5536986d9c8f = Gravitasjon fra tredje legeme (sol og måne)

seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>stemmer med den eksakte gradienten av sitt forstyrrende potensial</b>, forsvinner i geosenteret og treffer lærebokverdiene for LEO (~{ "5e-7" } m/s² sol, ~{ "1.1e-6" } m/s² måne). Efemeriden for sola med lav presisjon fra Montenbruck–Gill treffer håndutledede J2000-ankere (perihelavstand ≈ { "1.471e11" } m, ~−{ "23" }° deklinasjon ved solverv, ~{ "1" }°/døgn bevegelse); månens efemeride holder seg innenfor omhyllingen av perigeum/apogeum, gjenvinner middelavstanden på ~{ "384 400" } km, overstiger aldri inklinasjonen på { "5.3" }° og er tilbake innenfor { "1" }° etter én siderisk måned. Koblingen av høyresiden (RHS) som er drevet av epoken, er <b>bit-eksakt</b> (leddet i RHS er lik <c4/> i den samplede posisjonen ved t = { "0" } og t = { "1" } døgn), og et epokeskift på et kvart år gir en annen bane.

seg-9c8756f9d534 = Strålingstrykk fra sola (SRP) + konisk skygge

seg-e6110e015204 = <c1/>: <c2/> (kanonkule <c3/>) er <b>bit-identisk</b> med den lukkede formen i fullt sollys, forankrer <b>strålingstrykket ved 1 AU (AU: astronomisk enhet) til ≈ { "4.5398e-6" } N/m²</b>, ligger i LEO-båndet på ~{ "1.36e-7" } m/s² med retning bort fra sola, fireparten når avstanden til sola dobles (omvendt kvadrat), og er <b>nøyaktig null</b> dypt i umbra. <c4/> gir <c5/> i fullt sollys og <c6/> i total umbra (eksakt), en glatt monoton penumbra som stiger { "0" } → { "1" } over båndet <c7/> som <b>strekker seg utenfor umbra-sylinderen</b>.

seg-17b48db4038b = Atmosfærisk luftmotstand (første hastighetsavhengige ledd)

seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado tabell 8-4, stykkevis eksponentiell) <b>forankrer ved { "1.225" } kg/m³ ved havnivå</b>, avgrenses under overflaten, avtar monotont gjennom LEO, ligger i båndet ~{ "1e-12" } kg/m³ ved { "400" } km med en fysisk gjenvunnet skalahøyde på ~{ "58" } km; <c3/> virker mot den samroterende relative hastigheten ved en LEO-størrelse på ~{ "2e-6" } m/s². Den avgjørende kontrollen: en bane på { "300" } km mister spesifikk energi <b>monotont</b> og store halvakse avtar med en begrenset verdi på ~km/døgn, mens vakuumgrunnlinjen bevarer energien til < { "1e-9" }.

seg-133eed361425 = Post-newtonsk (Schwarzschild) relativistisk korreksjon

seg-c8e26480f148 = <c1/>: <c2/> (IERS-form <c3/> <c4/>) går i en sirkulær bane over i den lukkede formen <c5/> (radiell, <b>utover</b>, komponenter utenfor aksen er nøyaktig null), viser det <b><c6/>-forholdet i LEO fra læreboken til tolegemeløsningen</b>, stemmer med den håndforenklede formen for radiell hastighet <c7/> til < { "1e-12" }, og <b>forstyrrer banen i propagatoren samtidig som den holder store halvakse under en meter per døgn</b> — det konservative motstykket til at luftmotstanden får banen til å avta.

seg-d39e75019595 = Ærlig avgrensning: standardinnstillingene i den utgitte <c1/> integrerer det zonale feltet. Det <b>tesserale</b> EGM2008-feltet av høy grad (<c2/>, grad/orden { "70" }), de faste/havbaserte/atmosfæriske <b>tidevannene</b> (<c3/>) og <b>Lense–Thirring</b>-leddet for dragning av referansesystemet er nå implementert og satt sammen i kraftmodellen for presis tilpasning av efemerider (<c4/> — se nedenfor). Det tesserale feltet er også et valgfritt ledd i Cowell-<c5/> (<c6/>, av som standard), validert mot Orekit { "12.2" } <c7/> til grad/orden { "70" } ({ "6" } tilfeller over { "24" } h, verste |Δr| { "0.036" } m; <c8/>). Det finnes to felt-evaluatorer: den historiske <c9/> (sfæriske partiellderiverte; gyldig til grad ~{ "180" } bort fra polene; utdata er låst) og <c10/> (Holmes–Featherstone { "2002" }, modifisert forover-kolonne, gradient uten 1/cos φ; gyldig til grad { "2190" } ved alle breddegrader). EGM2008 til { "2190" } lastes ved kjøring (<c11/>, <c12/>, ikke bundlet). <c13/> stemmer med Orekit { "12.2" } til { "7.3e-17" } m/s² i åtte punkter gjennom grad { "2190" }; det forblir MODELLED fordi pyshtools ikke nådde terskelen nær polen som var fastsatt på forhånd (en mpmath-kontroll legger feilen i pyshtools; <c14/>). En bane på { "200" }×{ "200" } over { "24" } h stemmer med Orekit til { "0.13" } m, men dens forhåndsregistrerte sensitivitetskontroll for grad 70 ble ikke nådd ({ "0.73" } m < { "1" } m), så grad { "71" }–{ "200" } er karakterisert, ikke validert, i bane (<c15/>). Den termosfæriske tettheten fra NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) er portet (<c16/>: bit-identisk med den C-porten som er offentlig eiendom, på { "720" } punkter, innenfor { "1.9e-6" } relativt av pymsis, de { "17" } publiserte testtilfellene reprodusert; <c17/>) og er et valgfritt nivå for luftmotstandstetthet (<c18/>, <c19/>; standard forblir den statiske Vallado-modellen). Dette validerer porten, ikke modellens nøyaktighet mot målt tetthet. DE440 (DE: Development Ephemeris) for sol og måne er et valgfritt efemeridenivå (<c20/>). Skyggen for SRP med oblat WGS-84-jord er valgfri (<c21/>) og stemmer med lysforholdet i Orekit { "12.2" } innenfor { "7.4e-9" } over { "2400" } geometrier (<c22/>); varianten med randmørkning har ingen ekstern uavhengig referanse (MODELLED). Luftmotstandsnivået med NRLMSISE-00 stemmer med Orekit { "12.2" } sin egen NRLMSISE-00-luftmotstand over { "24" } h til { "0.03" } m mot opptil { "142" } km forskyvning fra luftmotstand (<c23/>, VALIDATED under de felles konvensjonene). En kryssjekk mot GMAT (General Mission Analysis Tool) gjenstår som oppfølging.

seg-46d06796e0e4 = Tidevann på geopotensialet (<c1/>)

seg-81b18c4caad3 = Tidsvarierende korreksjoner ΔC̄_nm, ΔS̄_nm til Stokes-koeffisientene (IERS Conventions { "2010" }, kapittel { "6" }), validert mot konvensjonenes egne publiserte tall — ikke mot et annet verktøy.

seg-78dc5baf4d9d = Bidrag

seg-7c6c910bbf89 = Fast jordtidevann (IERS lign. { "6.6" } / 6.8b / { "6.14" })

seg-ac1dbcc895f0 = <c1/>: det permanente (nullfrekvente) tidevannet ΔC̄₂₀ havner innenfor { "1" } % av det IERS-publiserte −{ "4.1736" }×{ "10" }⁻⁹ (anelastiske Love-tall); <b>regneeksempelet for K1 i trinn 2 reproduseres bit for bit</b> (sinus-/cosinusamplituder { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² til { "0.1" }×{ "10" }⁻¹²); den normaliserte Legendre-stien er låst av lukkede håndverdier uavhengig av rekursjonen.

seg-f2e2c5334721 = Havtidevann (IERS lign. { "6.15" }, FES2004 (Finite Element Solution { "2004" }, tidevannsatlas), { "8" } komponenter)

seg-0369f153806f = Den innlagte delmengden av FES2004 (<c1/> → <c2/>, parsing fra Doodson til multiplikator) reproduserer M2-koeffisientene ({ "2,2" }) i kilden eksakt; Doodson-fasen for K1 er lik θ_g + π; den sektorielle størrelsen av grad 2 er fysisk og en størrelsesorden under det faste jordtidevannet.

seg-52a19a291a41 = Atmosfærisk S2-lufttidevann (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

seg-86b3d3a39bc7 = De innlagte Ray-harmoniske omregnes gjennom overflatelastrelasjonen (lign. { "6.21" }) til en topp ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % av havets M2-ledd). Ærlig forbehold: <b>det finnes ingen publisert uavhengig referanse for geopotensialkoeffisienter for lufttidevann</b>, så det er validert ved integritet i kilden + størrelsesorden, en svakere terskel enn for fast jord- og havtidevann.

seg-63ac45ba51dc = Manøvrer og banedesign (<c1/>)

seg-a2ff4b0619d4 = Impulsiv ΔV + kovariansutbredelse

seg-12f469864d28 = En hastighetsdiskontinuitet med en kovarians på { "6" }×{ "6" } ført videre (deterministisk brenning ⇒ identitets-STM (state-transition matrix); kovariansen for utførelsesfeil roteres fra brenningens system — ECI (Earth-centred inertial) eller LVLH (local vertical, local horizontal) — inn i hastighetsblokken).

seg-f3f0e4a7ec05 = Integrasjon av endelig brenning mot Tsiolkovskij

seg-f7b35b7acdba = Integrasjon med konstant skyvekraft over en brennebue (masse som tilstand) der oppnådd ΔV stemmer med den lukkede <b>Tsiolkovskij</b>-rakettligningen til <b>bedre enn { "0.01" } %</b>.

seg-46ae334a0604 = Rundtur for Lambert-løser (Izzo { "2015" })

seg-3e2b483cd1b7 = Lambert-resultatet for én omløpsrunde (<c1/>, <c2/>, flytid ⇒ <c3/>, <c4/>) er <b>sendt en rundtur gjennom den eksakte Kepler-propagatoren med universelle variabler</b> — det må lande tilbake på <c5/>.

seg-04d69337acb3 = Porkchop-sveip mot Hohmann-gulvet

seg-fb5298b7983c = Minimum i rutenettet for oppskyting × ankomst av C3 / ankomst-V∞ kontrolleres mot det <b>analytiske C3-gulvet for Hohmann-overgang</b> for to koplanare sirkulære baner.

seg-bf2eb36e3eb6 = Lambert-løser mot et uavhengig bibliotek

seg-40511ea76e12 = <c1/>: { "13" } overganger med én omløpsrunde fra LEO til GEO til heliosentrisk, prograd og retrograd, mot lamberthub { "1.0.0" } <c2/>; verste forskjell i grensehastighet { "7e-12" } m/s.

seg-164d7ea14d4e = Ærlig avgrensning: ingen banehastighetsoptimalisator, ingen Lambert-grener med flere omløp, og en syntetisk koplanar-sirkulær heliosentrisk modell (ingen planetefemeride DE, så en kryssjekk av C3 for jord–Mars mot GMAT er ikke kjørt).

seg-9d2d78ad22c4 = Banebestemmelse (OD) (<c1/>, <c2/>)

seg-95d5ac7f6c29 = Batch-korrektor med Gauss–Newton

seg-3fe29c4621b2 = Den generiske <c1/>-løseren når den eksakte vektede minste kvadraters løsning på en lineær tilpasning, gjenvinner sanne parametere på en ikke-lineær <c2/>-tilpasning og løser en multilaterasjon av avstand i 3-D fra støyfrie avstander.

seg-b31d1ffa99b1 = Batch-banebestemmelse fra avstander

seg-0b37139dffa9 = <c1/> gjenvinner <c2/> fra avstandssporing fra bakkestasjoner (utbredt over kraftmodellen tolegeme + J2) til <b>under en meter / mm·s⁻¹ fra støyfrie avstander</b>, og til <b>~{ "2" } m med en rest etter tilpasning ved støygulvet på { "5" } m</b> — kjennetegnet på en konsistent minste kvadraters tilpasning.

seg-fb29199bf8bd = Sekvensiell OD (med unscented-filter)

seg-3c1f33052d48 = <c1/> gjenvinner tilstanden rekursivt til innenfor titalls meter med den samme dynamikken og avstandsmodellen.

seg-7a636cc9eef0 = Batch- og sekvensiell OD mot en uavhengig estimator

seg-68bf6e73c582 = <c1/>: { "8" } scenarioer ({ "6" } støyfrie LEO/MEO/eksentriske med { "3" }–{ "4" } stasjoner, { "2" } ved σ = { "5" } m) mot batch-estimatorene for minste kvadrater og Kalman i Orekit { "12.2" } på en tilpasset kraftmodell; verste batch { "1e-3" } m / { "1e-6" } m/s, sekvensiell { "0.9" } m.

seg-55a86bc79831 = | OD med batch for avstandsrate / az-el med elevasjonsmaske | <c1/> (ekstern sammenligning, én terskel fastsatt på forhånd ble ikke nådd) | <c2/>: { "8" } scenarioer mot batch minste kvadrater i Orekit { "12.2" } med egne øyeblikkelige geometriske målinger; synlige sett er identiske, målingsverdier innenfor { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, tilstandsovergangsmatrise innenfor { "1.2e-14" }, støyfylte tilstander innenfor { "1.74" } cm og RMS per type innenfor { "2.7e-4" }; den forhåndsregistrerte tilstandsterskelen støyfritt ≤ { "1" } cm ble ikke nådd i { "2" } av { "4" } scenarioer ({ "1.46" } og { "1.74" } cm; Orekits eget estimat ligger så langt fra sin simulerte referanse, mens kshanas ligger innenfor { "1e-8" } m). Se <c3/>. |

seg-35a85fb744cd = Ærlig avgrensning: undervisnings-OD bruker faste inertiale stasjoner, et topocentrisk system med kuleformet jord og øyeblikkelige geometriske målinger (ingen lystid, aberrasjon, refraksjon eller jordrotasjon); tilstandsovergangsmatrisen i stien for avstandsrate/vinkel er variasjonell (integrert med RK4 med analytiske partiellderiverte for tolegeme + J2), ikke på lukket form; det finnes ikke noe sekvensielt filter for avstandsrate eller vinkler. Stien med bare avstand beholder sin Jacobi-matrise med finite differanser. (Motoren med full kraft for efemeridetilpasning nedenfor har sin egen variasjonelle tilstandsovergangsmatrise.)

seg-8f425e278f7c = Validering av kraftmodell ved tilpasning av efemerider (<c1/>)

seg-9207d7139b87 = En presis estimator for batch minste kvadrater med full kraft og posisjonsobservasjoner: det tesserale geopotensialet fra EGM2008 (evaluert i det jordfaste systemet gjennom CIO-reduksjonen) satt sammen med tredje legeme sol/måne, SRP, luftmotstand, GR (general relativity) av Schwarzschild/Lense–Thirring og tidevannene over, tilpasset et spor av inertiale posisjonsbestemmelser med en Jacobi-matrise fra variasjonell tilstandsovergangsmatrise. Validert på <b>syntetiske</b> data, der referansen er Kshanas egen integrator, slik at hver rest tilhører estimatoren og ikke dynamikken.

seg-fc676106563e = Sammensetning av presis kraftmodell

seg-57726d970436 = <c1/>: feltet av grad 0 er den eksakte punktmassen i hver epoke (det sentrale leddet er rotasjonsinvariant); grad 8 legger til oblatheten i J2-båndet; tredje legeme sola og tidevannsleddet kobles inn bit-troverdig; en konstant radiell empirisk akselerasjon er rent radiell i RTN (radial, transversal, normal).

seg-98b036354077 = Variasjonell tilstandsovergangsmatrise

seg-71787d9334db = Hver kolonne i Φ over en halv LEO-bane (geopotensial av grad 8 + sol + måne) stemmer med en uavhengig ny utbredelse med <b>sentral finite differanse (FD) over hele buen</b> til <b>< { "1" }×{ "10" }⁻⁶ relativt</b> i både posisjons- og hastighetsresponsen — den dokumenterte kryssjekken STM↔FD. Φ({ "0" }) = I; den utvidede og den vanlige propagatoren stemmer til under en millimeter.

seg-0b453776136b = Selvgjenvinning med batch minste kvadrater

seg-c651db308332 = En Kshana-bue på 1 time (grad 6 + sol + måne) observert uten støy gjenvinnes fra en forskyvning på { "150" } m / { "0.1" } m·s⁻¹ til <b>epoketilstanden innenfor { "1" }×{ "10" }⁻² m</b> med nesten null RMS etter tilpasning; med hvit støy på { "5" } m legger 3-D-RMS etter tilpasning seg på <b>~σ-støygulvet</b>, uten skjevhet. SRP <b>C_R gjenvinnes fra { "1.0" } til innenfor { "1" } %</b> av referansen { "1.4" }.

seg-06bd2857f832 = Redigering av uteliggere og RTN-rapportering

seg-8b9dea5c0727 = En grov feil på { "500" } m forkastes av redigering med 5 σ etter tilpasning (nøyaktig én observasjon), og lar en ren tilpasning på millimeternivå stå igjen; restene rapporteres dekomponert i radiell/transversal/normal i tillegg til 3-D.

seg-e3969a15df96 = Nivå med empiriske akselerasjoner (RTN konstant + 1-CPR (CPR: syklus per omløp))

seg-c46af7926511 = De ni empiriske parameterne med a priori-begrensning holder seg under { "1" }×{ "10" }⁻⁸ m·s⁻² på referanse uten empiriske ledd uten å forstyrre tilpasningen; en konstant akselerasjon på tvers av banen på { "3" }×{ "10" }⁻⁸ m·s⁻² som er injisert i referansen, gjenvinnes til innenfor { "20" } %.

seg-fd79199b52d1 = Ærlig avgrensning: den syntetiske bølgen bruker nominelle jordorienteringsparametere (EOP: UT1 (Universal Time { "1" }, jordrotasjonstid) ≈ TT (Terrestrial Time), ingen polbevegelse) — eksakt for selvgjenvinning, siden den samme modellen genererer og tilpasser buen. Valideringene mot datasett fra romorganisasjoner legger <b>reelle</b> EOP fra finals2000A og SP3/SPK (SPK: planetefemeridekjerne) som referanse oppå denne motoren gjennom CIO-kjeden for referansesystemer (<c1/>, <c2/>, <c3/>, <c4/>).

seg-934f0f8e4f5f = Reelle presise baner fra romorganisasjoner (<c1/>, <c2/>, <c3/>)

seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

seg-14a2999d0739 = Kshanas motor med full kraft tilpasset en ordrett del av <b>ESA/ESOCs (ESOC: European Space Operations Centre) egen endelige bane</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) for Galileo <b>E11</b> over { "8" } h, hver ITRF-posisjonsbestemmelse rotert inn i GCRS med reelle EOP fra finals2000A: <b>3-D-RMS etter tilpasning { "0.133" } m</b> med ren kraft + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> med det empiriske nivået, fra et rått overlapp på { "78.7" } km. Hele buen på { "24" } h er <b>{ "0.611" } m</b>. Alt langt innenfor grensen på { "5" } m. Feltet er konvergert for gravitasjon ved d/o-8 (identisk ved d/o 8/10/12); jobben <c4/> kjører full d/o-70. Opphav + SHA-256 (SHA: Secure Hash Algorithm) i <c5/>; fullstendig dokumentasjon i <c6/>.

seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

seg-403b15ec1b9b = Motor med full kraft (+ luftmotstand) tilpasset en ordrett del av <b>ESAs egen reduserte-dynamiske presise bane for Swarm-A</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) over { "3" } h ved d/o-70, reelle EOP fra finals2000A gjennom CIO-kjeden: nivået <b>dynamic</b> (bare tilstand, statisk tetthet, <c2/>={ "1" }) gir <b>3-D-RMS etter tilpasning { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — resten er i hovedsak luftmotstand langs banen), nivået <b>reduced-dynamic</b> (+ empiriske CPR-akselerasjoner) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm mot ESAs bane på ~{ "2" } cm. Opphav + SHA-256 i <c4/>; fullstendig dokumentasjon i <c5/>.

seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter), måne — validert, over { "5" } m (ærlig)

seg-d2be90186a89 = Tilpasning av kraftmodell <b>med månen som sentrum</b> (<c1/>): GRAIL-gravitasjonsfeltet <b>GRGM660PRIM</b> (d/o { "100" }) i månens kroppsfaste hovedaksesystem (<c2/>, IAU { "2015" } mean-Earth + den faste forskyvningen DE421 (Development Ephemeris { "421" }) mean-Earth → hovedakse (ME→PA), brukt slik SPICE definerer den siden { "0.36" }: til da ble den brukt i feil retning, omtrent { "208" }″ feil) + tredje legeme jord/sol, tilpasset gjennom den <em>samme</em> generiske Gauss–Newton-estimatoren som jorddatasettene til den reelle rekonstruerte banen fra <b>JPL Horizons for LRO</b> (NAIF −{ "85" }), { "4" } h / { "241" } epoker, ~{ "98" } km. Ærlig resultat etter tilpasning ({ "0.36" }): <b>dynamic { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>reduced-dynamic { "6.67" } m</b> (RTN 3.41/4.58/3.44, { "1" }+2 per omløp empirisk), fra et rått overlapp på { "39.9" } m (før rettelsen av ME→PA: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>over</b> grensen på < { "5" } m, og det er ikke estimatoren som er årsaken (identisk ved d/o 100/150 og <c3/> 1e-6/1e-9). En <b>kryssvalidering av DE-klasse</b> (<c4/>: månens PA-orientering fra DE440 (Development Ephemeris { "440" }) + efemeriden DE440 via ANISE) <b>rettet</b> påstanden om begrensende faktor — den ga { "12.0" } m dynamic og { "6.67" } m reduced-dynamic, som den rettede analytiske stabelen nå stemmer med på begge nivåer (det tidligere dynamiske gapet, { "12.6" } → { "12.0" } m, var feilen i forskyvningen ME→PA), så det operative gulvet er <b>ikke</b> den analytiske orienteringen/efemeriden, men en rest som det empiriske nivået ikke kan redusere (mest forenlig med ikke-modellert ikke-gravitasjonell dynamikk for LRO over den korte buen); den slanke analytiske stabelen stemmer allerede med DE-klasse for den reduserte-dynamiske banen. Opphav + SHA-256 i <c5/>; fullstendig dokumentasjon i <c6/>. <b>Validert mot reell referanse fra romorganisasjoner: { "3" } av { "3" }; som når < { "5" } m: { "2" } av { "3" }.</b>

seg-3d3cbf5f043d = Navigasjon med gravitasjonskart / alt-PNT (<c1/>, <c2/>, <c3/>, <c4/>)

seg-89f2cbf55842 = Sfærisk-harmonisk felt for gravitasjonsanomalier

seg-76cae5c530f2 = <c1/>: et felt av lav grad, fullt normalisert, kontrollert mot de lukkede Legendre-funksjonene (<c2/>, <c3/>, <c4/>) og en håndutledet anomali med ett ledd på { "1.897" } mGal.

seg-f00f82b70e6e = Målemodell for kaldatomgravimeter

seg-49090598c525 = Gulvet for hvit støy er utledet fra ASD for CAI-akselerometeret (<c1/>), injisert som en deterministisk sekvens med fast seed (matcheren får aldri støyfri referanse, men kjøringen er likevel bit-reproduserbar).

seg-0556db62c45f = Partikkelfilter med sekvensiell viktighetsresampling

seg-3df4251aedbd = <c1/>: den deterministiske kjernen er låst eksakt — ESS (effective sample size) som spenner over { "1" }…N, systematisk resampling som velger indekser i forhold til vekt, den veide konvekse kombinasjonen av middelverdi, en gaussisk likelihood som trekker estimatet mot målingen, og determinisme i predict med fast seed.

seg-7dca80b16a00 = Likelihood for kartmatching + gjenvinning

seg-eb40ab2607ae = <c1/>: <c2/> har topp (= { "1" }) ved perfekt treff og faller til <c3/> ved én sigma; et partikkelfilter over et særpreget syntetisk terrengfelt gjenvinner den sanne posisjonen til innenfor { "0.1" }.

seg-446d9f03a860 = Referanseoppgave på 60 minutter uten GPS

seg-ed29fb24d9d5 = <c1/> (<c2/>): et avbrudd på ~{ "700" } km / én time der den inertiale løsningen driver til <b>≈ { "70" } km</b> gjenvinnes til <b>≈ { "145" } m (< { "500" } m)</b> av en hierarkisk matcher fra grov til fin — bit-reproduserbar, stabil over støyrealiseringer og påviselig begrenset av forfiningen (ett enkelt grovt rutenett stopper opp ved ~{ "2" } km).

seg-81a2963c26cc = SRTM (Shuttle Radar Topography Mission) <c1/> DEM-leser (digital elevation model) + bilineær prøve (UAVHENGIG REFERANSE A)

seg-5e7bbf951faf = <c1/> / <c2/>: en håndbygd <c3/>-buffer på { "2" }×{ "2" } med hjørnene [{ "100,200" };{ "300,400" }] interpoleres bilineært til <b>nøyaktig { "250.0" }</b> i cellens midtpunkt (uavhengig referanse på lukket form), rundturen med 16 bit big-endian er eksakt, og radvendingen plasserer den nordligste filraden ved den høyeste lagrede breddegraden — alt mot <b>spesifikasjonen for driveren GDAL (Geospatial Data Abstraction Library) SRTMHGT (Shuttle Radar Topography Mission height-file format)</b> (16 bit med fortegn big-endian, radvis, nordlig rad først, tomt -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Et innsjekket fiksturdatasett på { "11" }×{ "11" } (<c4/>) prøver parseren i CI; og en <b>innsjekket reell SRTM v3-rute fra NASA/USGS (USGS: United States Geological Survey) i offentlig eie</b> (N36W117, Death Valley, desimert til 6 buesekunder, { "722" } KB, <c5/>) leses i CI (ikke ignorert, <c6/>) og plasserer <b>Badwater Basin ved ≈ −{ "78" } m innenfor det dokumenterte båndet [−{ "95" },−{ "70" }] m</b> (oppmåling av NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) ≈ −{ "86" } m) med høyeste punkt i ruten ≈ { "2161" } m — sannhetskilden er oppmålingen, DEM-en er under test (ikke sirkulært). Større publiserte punkthøyder (Mount Whitney { "4421" } m) ligger i fulle rutetester bak <c7/>.

seg-80f985ea3e11 = Konvergens for terrengreferert navigasjon (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) (UAVHENGIG REFERANSE B)

seg-9ad7bf3a8c3e = <c1/> (<c2/>): en <b>håndutledet</b> injisert INS-drift ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km ved ~{ "12" }° bredde, beregnet som drift° × M_per_deg × cos lat) gjenvinnes til <b>< { "500" } m</b> (innenfor gulvet for rutenettets oppløsning <c3/>), en reduksjon på > { "100" }× mot fri treghetsnavigasjon — kontrollert mot det <em>injiserte</em> tallet, aldri mot DEM-en (ikke sirkulært), bit-reproduserbar og stabil over støy-seeder.

seg-5b7c1dc72436 = Fusjonsgevinst for kombinert gravitasjon + magnetisme + terreng (UAVHENGIG REFERANSE C)

seg-7e3818f2ee2b = <c1/> (<c2/>): tre skalare kanaler (Δg · |B| anomali i skorpa · høyde) fusjonert som en produktlikelihood gir en <b>begrenset rest på < { "500" } m</b> over avbruddet på 60 min som, som gjennomsnitt over seed, er <b>ikke dårligere enn den beste enkeltkanalen</b> (additivitet i informasjon / lavere CRLB (Cramér–Rao lower bound)). Ligger i det publiserte CEP-området (circular error probable) for TERCOM / terrengreferert navigasjon (TRN) på «titalls meter» (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: error-state Kalman filter), <a2>https://peerj.com/articles/cs-3118/</a2>).

seg-fe23ff839bce = Ærlig avgrensning: gravitasjonsfeltet er av lav grad + syntetiske masseanomalier (mascons), <b>ikke</b> hele koeffisientsettet EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques); den magnetiske kanalen ligger på det glatte IGRF-hovedfeltet pluss <b>syntetiske</b> mascons for anomalier i skorpa (et reelt høyfrekvent skorpekart er en oppfølging); CI-terrengfeltet for benchmarkene for <em>posisjonsbestemmelse</em> er det selvstendige syntetiske DEM-et, mens leseren <c1/> nå er validert i CI mot en innsjekket reell SRTM v3-rute (over); de reelle rutene i full oppløsning forblir bak <c2/>. En Monte Carlo for feil i kartrepresentasjonen gjenstår som oppfølging. Alle tre navigatørene er nå koblet inn i scenariomotoren som <c3/> (<c4/>, <c5/>, <c6/>).

seg-d9f7e199e5d0 = Feilmodell for INS / IMU — validering mot datablad (<c1/>)

seg-48266c2faaed = Den stokastiske feilmodellen for IMU er validert mot <b>publiserte spesifikasjoner fra produsentenes datablad / datasett</b> — aldri mot en verdi Kshana selv har produsert. Broen fra en spesifikasjon i feltenheter til SI-støymodellen (International System of Units) er den vanlige identifikasjonen med Allan-avvik (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): koeffisienten for random walk <c1/> er den overlappende ADEV avlest ved τ = { "1" } s på stigningen τ⁻¹ᐟ², og koeffisienten for biasustabilitet er det flate Allan-platået (<c2/>, hermetisk — ingen nedlasting).

seg-702de63000d2 = Evidens / uavhengig referanse

seg-c3fed48b98b1 = Lag for enhetskonvertering (risiko nr. #1 for sirkularitet)

seg-6cdc88d36bfd = Kontrollert for hånd: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

seg-75afa5abcd08 = Gyro, vinkel-random-walk

seg-d5fd60857e4d = ADIS16465 ARW { "0.15" } deg/√hr (datablad fra Analog Devices) gjenvunnet fra ADEV({ "1" } s) til < { "5" }%.

seg-c5e2d361b83f = Akselerometer, hastighets-random-walk

seg-4413d3bb39b4 = ADIS16465 VRW { "0.1" } m/s/√hr gjenvunnet til < { "5" }%.

seg-ebeb0bb0e0fb = Allan-stigning for hvit støy

seg-f674ce82dc2c = ADIS16460, gren for hvit støy, stigning i log-log −{ "0.5" } ± { "0.05" }.

seg-40afd130f31d = Plattå for biasustabilitet under kjøring

seg-94acb18a94cb = ADIS16465 gyro-biasustabilitet (BI) { "2.0" } deg/hr gjenvunnet som det flate Allan-minimum til < { "15" }%.

seg-b359e0e92e20 = Andre IMU-profil

seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) begge gjenvunnet til < { "5" }%.

seg-fea9287d6533 = Ærlig avgrensning: dette validerer <b>den stokastiske feilmodellen</b> mot Allan-koeffisienter fra datablad. Kjøretøydatasettet <b>KF-GINS</b> fra i2Nav-WHU (WHU: Wuhan University) brukes som en separat kontroll som er avhengig av data: det løst koblede lukkede EKF-et med feiltilstander og GNSS-armlengdemodell er en VALIDATED rad i <a1>verifikasjonsmatrisen</a1> (<em>Løst koblet GNSS/INS-EKF med armlengde på KF-GINS-datasettet</em>), sammenlignet med C++-referansebanen til KF-GINS under terskler registrert før kjøringen. Den kjøres bare der datasettet er levert (<c1/>); uten det kjøres den syntetiske leseren og testene for armlengde. De tett koblede variantene og variantene med bærebølgefase dekkes ikke av den raden (raden for tett koblet GNSS/INS med bærebølgefase er MODELLED).

seg-f0ab98c1a79d = Dypt rom og Mars-PNT — D0-grunnlag (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-bd222b27949c = Den første milepælen for motoren for navigasjon i dypt rom: kjernen, som var hardkodet for jorden, generaliseres til et vilkårlig sentralt legeme, med Mars-dynamikk, en søm for efemeridetilbydere, tid under mikrosekundet og primitivene for lystid og relativistisk forsinkelse. <b>Alle eksisterende jordscenarioer er byte-identiske</b> — referansefilene (golden) for reproduserbarhet på tvers av plattformer (<c1/>, <c2/>) består uendret uten regenerering, håndhevet per commit.

seg-e0cdbfcbb28a = Abstraksjon for sentralt legeme (jorden byte-identisk)

seg-7d20649189fa = <c1/>: <c2/> med <c3/>. <c4/> slår fast at <c5/> og <c6/> er lik de gamle jordfunksjonene med <b>eksakt bitlikhet</b> (<c7/>), og at en jordbue med standard <c8/> er byte-identisk — referansefilene for reproduserbarhet er uendret (samme SHA, ingen regenerering).

seg-658acc8112e3 = Mars-gravitasjon (GMM-3 (GMM: Goddard Mars Model) tesseral, kroppsfast)

seg-9b058665cf4b = <c1/>: zonale C̄20/C̄30/C̄{ "40" } fra J2/J3/J4 i MRO110 (gravitasjonsløsning fra Mars Reconnaissance Orbiter) (<c2/>, J2 gir rundtur til { "1.9604e-3" }) + sektorielle/tesserale C̄22/S̄{ "22" }, C̄32/S̄{ "32" } fra MRO110B2 (Konopliv et al. { "2011" }; tabulert i Liu, Baoyin & Ma { "2012" }), evaluert i det kroppsfaste Mars-systemet til IAU. <c3/> kontrollerer rundturen, avviket i J2-skala fra punktmasse, og at feltet virkelig er kroppsfast (en reorientering på en kvart Mars-dag endrer den inertiale akselerasjonen). Høyere grad/orden lastes fra en innlagt <c4/> via <c5/>.

seg-1dcbee768418 = Kroppsfast Mars-system (IAU-pol)

seg-0708e5b37d69 = <c1/>: IAU-rotasjonen 3-1-3 <c2/> (konvensjon fra WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), den samme som <c3/>). Tester: ortonormal til { "1e-12" } med det +{ "1" }, identitet ved rundtur, nullmeridianen rykker fram med <c4/> per døgn.

seg-5b6355a143c7 = Utbredelse med Mars / sola som sentrum

seg-4ab87f666765 = <c1/> (selvkonsistens)

seg-12e3d173340b = <c1/>: en bane i lav Mars-bane (Low-Mars-Orbit) kommer tilbake til starten etter én Kepler-periode (lukking); spesifikk energi ε=v²/2−μ/r driver <{ "1e-9" } over buen; den sekulære nodeforskyvningen fra Mars-J2 stemmer med Vallados analytiske rate (beregnet uavhengig ≈ −{ "5.15" } °/døgn ved { "60" }° inkl.) til { "3" }%; en heliosentrisk bane gjenvinner Mars-året på ~687 døgn (vis-viva + uavhengig gjenvinning av perioden fra buen). Ingen eksterne data.

seg-acff4c016089 = Kryssvalidering mot DE440 (heliosentrisk Mars)

seg-ed164e298754 = <c1/> (UTENFOR arbeidsområdet; MPL-2.0-ANISE avgrenset til sin egen Cargo.lock; speiler <c2/>): sammenligner Kshanas Mars-utbredelse med sola som sentrum mot JPL DE440 (via ANISE), med Horizons-referanse sitert ordrett (opphav + SHA-256). <b>Reprodusert resultat</b> (seed JD (Julian date) { "2459580.5" } TDB (Barycentric Dynamical Time), <c3/> SHA-256 <c4/>): posisjonsrest <b>{ "137" } m ved bue på 1 døgn</b> ({ "5.97" }×{ "10" }⁻¹⁰ av den heliosentriske avstanden på { "2.299" }×10¹¹ m), voksende til { "3.3" } km ved { "5" } d, { "87.9" } km ved { "30" } d, { "1.71" } Mm ved { "90" } d — resten <em>vokser</em> med buelengden fordi en tolegememodell med sola som sentrum bevisst utelater planetforstyrrelsene (først og fremst Jupiter) og den interne bevegelsen i Mars-systemet som barysentrisk efemeride i DE440 inneholder, så veksten er det ærlige kjennetegnet på ikke-modellert n-legemedynamikk, ikke en integratorfeil; en kort bue som forblir en liten brøkdel av den heliosentriske avstanden bekrefter at maskineriet med sola som sentrum er riktig. Kjøres bare når DE440-kjernen finnes (<c5/>, eller hentes automatisk ~{ "32" } MB) — en manuell kontroll av DE-klasse / <c6/>, <b>ikke</b> en standard CI-port, slik at den publiserte craten og alle standardportene forblir byte for byte urørt.

seg-a7d79066a53b = Lystid + Shapiro-forsinkelse

seg-798148171dab = <c1/>: den iterative løsningen for lystid i forsinket epoke (konvergerer |Δτ|<{ "1e-12" } s, begrenset) og Shapiro-forsinkelsen Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Tester: jord–sol ≈ { "499" } s og jord–måne ≈ { "1.28" } s via den innebygde efemeriden; en syntetisk sender med konstant hastighet gjenvinner den analytiske forsinkede løsningen til <{ "1e-9" } s (løseren er påvist uavhengig av enhver reell efemeride); Shapiro stemmer eksakt med en håndberegnet verdi og gir ~{ "100" }–{ "250" } µs for en streifende stråle ved øvre konjunksjon for jord–Mars.

seg-1bc28f6bdc8f = Søm for efemeridetilbydere

seg-34d6a07ad252 = <c1/>: <c2/> + kjernefri <c3/> (Montenbruck–Gill sol/måne, geosentrisk); returnerer <c4/> for legemer den ikke har noen serie for (for eksempel Mars), der ANISE-tilbyderen av DE-klasse er veien — den samme delingen innebygd mot ANISE som for <c5/>/<c6/>.

seg-5e1fed7a98c0 = Todelt tid + TT↔TDB

seg-5ebca9b5f2db = <c1/>: en <c2/> med Knuth-two-sum-akkumulering gjenvinner intervaller under mikrosekundet som JD med én enkelt f64 mister nær J2000 (>{ "1000" }× bedre, testet); <c3/>/<c4/> bruker den dominerende periodiske serien til Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, kontrollert for hånd ved J2000). Additivt — den eksisterende tidsstien med én enkelt f64 er uendret.

seg-d2da2e1d1711 = Radiometriske observable for dypt rom og CCSDS Tracking Data Message — D1 (<c1/>, <c2/>)

seg-b98f508f2375 = Den andre milepælen for motoren for navigasjon i dypt rom: <b>observasjonsmodellen</b> som gjør kjernen for lystid og relativistisk forsinkelse fra D0 om til de faktiske størrelsene en sporingsøkt i Deep Space Network (DSN) eller ESTRACK (European Space Tracking network) rapporterer — avstand, Doppler med én/to/tre veier, koherent transponderomsetning, regenerativ / PN-avstandsmåling (PN: pseudo-noise), Δ-DOR (DOR: differential one-way ranging) og utbredelsesmediene — pluss inn- og utdata for <b>CCSDS (Consultative Committee for Space Data Systems) 503.0-B Tracking Data Message (TDM)</b> som leser inn og skriver ut en standard sporingsfil fra en romorganisasjon. <b>Ærlig avgrensning:</b> dette er <b>eksakte geometriske modeller</b> etter konvensjonene til Moyer / CCSDS; <em>målestøyen</em> er den <c1/> per observasjon som den som kaller leverer, ikke bakt inn i modellen. For å reprodusere en <em>bestemt reell sporingsøkt</em> trengs reelle TDM-data pluss løseren for banebestemmelse i dypt rom — det er <b>D2</b>, ikke D1. Alt nedenfor er additivt (referansefilene for reproduserbarhet er uendret; samme SHA, ingen regenerering).

seg-d1d2dc7906c8 = Avstand og Doppler med 1/2/3 veier (Moyer, løsning med to ledd)

seg-e2176b844df8 = <c1/>: <c2/>/<c3/> setter sammen D0-løsningene for lystid i forsinket (nedlenke) og fremskyndet (oppenke) form; konvensjonen for hele rundturen er <c4/> (m), dokumentert og konsistent. <c5/>/<c6/>/<c7/> danner bærebølgeskiftet <c8/> (Hz) fra avstandsraten langs siktelinjen, <b>fortegnskonvensjon: et romfartøy som nærmer seg gir et positivt (blått) skift</b>. Tester: toveis avstand = sum av leddene til <{ "1" } mm (~{ "2" } AU rundtur jord–sol); enveis avstand = <c9/> eksakt; enveis Doppler stemmer med den analytiske <c10/> for en radiell sender med konstant hastighet til ppt; treveis med stasjoner på samme sted kollapser byte for byte til toveis.

seg-638697be5b5b = Koherent transponderomsetning (eksakte DSN-forhold)

seg-781aa4041c58 = <c1/>: de eksakte rasjonale omsetningstallene i DSN/CCSDS <c2/> (Moyer §{ "13" }; DSN 810-005 modul 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testet for eksakt likhet; et udefinert båndpar <b>panikker</b> (feiler høylytt, finner aldri på et forhold). <c3/> bruker båndbærebølgen + forholdet ende til ende og er lik den eksplisitte <c4/> til maskinpresisjon.

seg-f24f9da1570c = Regenerativ / PN-avstandsmåling (CCSDS { "414" }; flertydighet)

seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (den utvetydige avstanden i oppløsningsskala per chip) og <c4/> = det × kodelengde (den fulle utvetydige avstanden for PN-koden <c5/>), etter CCSDS 414.1-B. Testet: en avstandsklokke på { "1" } MHz gir ~{ "149.9" } m; PN-koden med vektet avstemning i CCSDS-414.1 ({ "1 009 470" } chips) ved { "1" } Mchip/s gir den utvetydige designavstanden på ~{ "151 000" } km; en dobling av chiprate halverer flertydigheten per chip.

seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" }, himmelplan)

seg-93055e944306 = <c1/>: den differensielle forsinkelsen i himmelplanet <c2/> (s) for en interferometergrunnlinje <c3/> (CCSDS 506.1-B). Testet: stemmer med den eksakte analytiske projeksjonen <c4/> for en kjent forskyvning på linje med grunnlinjen til { "1e-15" } s, størrelsen for liten vinkel <c5/>, og <b>nullpunktet</b> (et romfartøy på linje med kvasaren gir nøyaktig null differensiell forsinkelse).

seg-4e5258bb04d5 = Kalibrering av plasma 1/f² med to frekvenser

seg-e3b340103825 = <c1/>: <c2/> = <c3/> (den dispersive gruppeforsinkelsen <c4/> fra ladde partikler, <c5/>); <c6/> koronakolonnen <c7/> i Cassini-klassen (analytisk stedfortreder, ikke en kalibrert korona); <c8/> dispersjonsinversjonen <c9/> som DSN bruker til å fjerne plasma. Testet: 1/f²-loven <c10/>; koronaen øker mot konjunksjon; og en <b>injisert TEC gjenvinnes til <{ "1" } %</b> (faktisk ≪ { "1e-9" } uten støy) — <c11/>.

seg-e1e265ab499a = Medier for tropo / iono (gjenbruker GNSS-modeller)

seg-2d9aa52f318b = <c1/>/<c2/>: bakkestasjonssegmentet for dypt rom krysser den samme jordatmosfæren som GNSS-pakken allerede modellerer, så disse delegerer til <c3/> (Saastamoinen-zenit + Niell-avbildning, ikke-dispersiv) og <c4/> (kringkastet iono). Testet koblet inn + med fysisk riktig fortegn: tropo positiv og større ved lav elevasjon enn i zenit; iono en ikke-negativ skrå forsinkelse (numerisk nøyaktighet dekkes av GNSS-pakkens egne tester mot datablad).

seg-44ba6e0411fd = Parsing / utskrift av CCSDS-TDM { "503" } + radiometrisk bro

seg-18eafe936dcb = <c1/>: en leser <b>og</b> skriver for CCSDS 503.0-B-2 KVN (keyword-value notation) (hode + segmentene <c2/> / <c3/>; postene <c4/>/<c5/>/<c6/>/<c7/>). Tester (<c8/> + <c9/>): referansefikstur parses til de forventede navngitte feltene; <b>parse→utskrift→parse gir en lik struktur</b> (semantisk rundtur); broen <c10/> avbilder de utvetydige postene <c11/>/<c12/> til <c13/> (antall veier fra <c14/> <c15/>/<c16/>/<c17/>, bånd fra <c18/>, km→m); en fil med flere segmenter nullstiller tilstandsmaskinen. <b>Ærlig hopp over i stedet for å gjette:</b> vinkler/frekvenser, ukjente bånd, epoker som dag i året og ukjente tidssystemer <b>hoppes over</b>, aldri feilavbildet, og <c19/> står igjen som <c20/> for den som kaller å vekte.

seg-e8ca55dd29b1 = Benchmark for DSN/ESTRACK (modellpresisjon ≫ publisert gulv)

seg-247b9e7b2be8 = <c1/>: observablene er eksakte geometriske beregninger, så den ærlige benchmarken er at <b>modellens egen numeriske feil ligger langt under det publiserte målegulvet for DSN/ESTRACK</b> — modellen er ikke flaskehalsen for nøyaktighet, men σ som den som kaller leverer. Hver test beregner en observabel på to uavhengige måter (eller gjenvinner en injisert referanse) og slår fast at resten ligger under gulvet: <b>avstand</b> gir rundtur til <{ "1" } mm ≪ gulvet på ~{ "1" } m for PN-avstandsmåling (DSN 810-005 mod. { "214" } / CCSDS 414.1-B); <b>Doppler</b> stemmer med den eksakte lukkede forsinkede avstandsraten <c2/> til ~{ "10" }⁻⁶ m/s, flere × under gulvet på ~{ "0.05" } mm/s i X-bånd (DSN 810-005 mod. { "203" } / Moyer) — resten er f64-gulvet for avstandsdifferanser ved ~{ "1" } AU, en numerisk egenskap, ikke en modellfeil; <b>Δ-DOR</b> reproduserer den lukkede projeksjonen til en ekvivalent vinkel i himmelplanet ≪ { "1" } nrad ≪ gulvet på ~{ "1" }–{ "10" } nrad (DSN 810-005 mod. { "210" } / CCSDS 506.1-B); <b>plasma</b> med to frekvenser gjenvinner den injiserte forsinkelsen til ≪ { "1" } %; og <b>Shapiro</b>-forsinkelsen ligger i det publiserte båndet på ~{ "100" }–{ "250" } µs for konjunksjon jord–Mars. De publiserte tallene er oppgitt og merket som <b>størrelsesorden</b> for DSN-spesifikasjoner, ikke oppdiktede eksakte tall, og modulens dokumentasjon sier uttrykkelig at dette tester MODELLPRESISJON, ikke reproduksjon av en reell sporingsøkt (det er D2 + reelle TDM).

seg-2a25e6a8a5b1 = Redusert-dynamisk OD i dypt rom — D2 (<c1/>, <c2/>, <c3/>)

seg-0d7a1b75a0ea = Den tredje milepælen for motoren for navigasjon i dypt rom: <b>estimatoren</b> som gjør de radiometriske observablene fra D1 om til en gjenvunnet bane — et numerisk robust kvadratrot-informasjonsfilter (Square-Root Information Filter, SRIF) med redusert-dynamiske empiriske akselerasjoner, en klokke om bord med tre tilstander, en modell for Mars-luftmotstand og de radiometriske partiellderiverte som kobler avstand/Doppler til filtertilstanden, lukket ende til ende av en syntetisk gjenvinning av banebestemmelse i lav Mars-bane (LMO). <b>Ærlig avgrensning:</b> gjenvinningen er en <b>syntetisk lukket sløyfe</b> (referanse og filter deler den samme Mars-propagatoren, og observasjonene er den samme geometriske observasjonsmodellen som filteret inverterer, pluss injisert gaussisk støy) — den validerer <b>estimatormaskineriet</b>, ikke den absolutte nøyaktigheten til Mars-kraftmodellen; den eksterne kryssjekken av DE-klasse er craten <c1/> som er avhengig av kjernen (D0.8b). Alt nedenfor er additivt (referansefilene for reproduserbarhet er uendret; samme SHA, ingen regenerering).

seg-51f203291066 = SRIF-kjerne (kvadratrot-informasjonsfilter)

seg-9d5fd8c1d37d = <c1/>: et håndrullet kvadratrot-informasjonsfilter etter Bierman — øvre trekantet <c2/> med <c3/>, informasjonsvektor <c4/>, Householder-oppdateringer av måling/tid, ren <c5/>-aritmetikk (ingen nalgebra). Tester: det sekvensielle SRIF stemmer med løsningen fra batch vektet minste kvadrater (<c6/>) i <b>både tilstand og kovarians til { "1e-9" }</b> på et utformet lineært gaussisk problem (<c7/>); den gjenvunne kovariansen <c8/> er <b>symmetrisk ({ "1e-12" }) og positivt definitt per konstruksjon</b> etter en lang sekvens av oppdateringer av måling og tid (<c9/>, Cholesky lykkes); og informasjon akkumuleres (sporet av <c10/> avtar monotont når målinger med identisk geometri tas inn).

seg-f9ffa1ef4688 = Redusert-dynamiske empiriske akselerasjoner (innstilling cruise↔LMO)

seg-b0612a7140c3 = <c1/>: filteret <c2/> med ni tilstander og empiriske RTN-akselerasjoner som Gauss–Markov-prosesstilstander av første orden, JPL/ESOC-teknikken for redusert dynamikk eksponert som ett enkelt <c3/>-grep (nær dynamisk ⇒ glatter støy på en ballistisk bue; nær kinematisk ⇒ det empiriske nivået absorberer en ikke-modellert manøver/luftmotstand). Tester: et nær-kinematisk filter følger en <b>trinnvis (thruster-)manøver</b> med <½ av resten til det nær-dynamiske, mens det nær-dynamiske filteret <b>glatter en støyfull ballistisk bue</b> bedre (<c4/>); sveip av stramheten flytter resten etter tilpasning <b>monotont</b>, et kontinuum og ikke en bryter (<c5/>).

seg-9d5db4d63990 = Klokke om bord med 3 tilstander (fase/frekv/drift, van Loan Q, Allan)

seg-fe5beef74e24 = <c1/>: feiltilstand for fase + relativ frekvens + frekvensdrift med <b>eksakt van Loan-diskret prosessstøy</b> og en Joseph-stabilisert oppdatering. Tester: den diskretiserte <c2/> stemmer med det håndutledede van Loan-polynomet <b>til { "1e-12" }</b> og <b>reduseres eksakt til Q for tostatus-KalmanClock når drift = { "0" }</b> (en strengt større mengde); en fri drift over flere trinn lar fasevariansen vokse til den analytiske holdover-relasjonen i NIST SP { "1065" } gjennom random-run-leddet <c3/>; driftstilstanden <b>gjenvinner en sann aldringsrampe til <{ "5" } %</b>; en <b>Allan-profil i USO-klassen gjenvinnes</b> (overlappende ADEV ved τ={ "1" } s innenfor kalibreringsgrensen) og estimatoren forblir NEES-konsistent (>{ "95" } % innenfor 3σ) og PSD gjennom en kjøring med hard <c4/>. <c5/> bærer de siterte CSAC/USO/DSAC-tallene (USO: ultra-stable oscillator; DSAC: Deep Space Atomic Clock) <c6/> og Doppler-gulvet <c7/>.

seg-8666d18daa2b = Mars-luftmotstand (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

seg-6a64c2b9e553 = <c1/>: en stykkevis eksponentiell profil for nøytral tetthet på Mars (overflate ~{ "0.020" } kg/m³, skalahøyde nær overflaten ~{ "11" } km, lavstøv-middelet fra Mars-GRAM { "2010" } / MCD (Mars Climate Database)) og den kvadratiske luftmotstandsakselerasjonen tatt relativt til den <b>samroterende</b> Mars-atmosfæren, pluss en variant <c2/> som SRIF kan multiplisere. Tester: tettheten avtar monotont og kontinuerlig over båndene, den gjenvunne skalahøyden nær overflaten er den fysiske ~{ "11" } km, luftmotstanden er <b>strengt antiparallell med den relative hastigheten</b> (kryssproduktet forsvinner til { "1e-12" }) med en fornuftig størrelse i LMO på ~{ "3e-4" } m/s², og den er lineær i det ballistiske leddet. <b>Ærlig avgrensning:</b> en representativ ingeniøratmosfære, ikke en Mars-GRAM/MCD validert for flyging med avhengighet av støv/årstid/lokal tid.

seg-452f32dace80 = Radiometriske partiellderiverte (avstand/Doppler) for SRIF

seg-6661d241cdaf = <c1/> / <c2/>: de partiellderiverte for avstanden langs siktelinjen <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) og avstandsraten <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) som kobler D1-observablene til filtertilstanden, pluss den partiellderiverte for klokkefrekvensen ved enveis Doppler <c5/>. Tester: begge partiellderiverte stemmer med en <b>sentral finite differanse av observablen til { "1e-6" }</b> (<c6/>, <c7/>); en enkelt avstandsoppdatering <b>krymper kovariansen i den observerte retningen (siktelinjen, LOS) med ≫{ "1000" }×</b> og holder den positivt definitt (PD), og en Doppler-oppdatering krymper variansen i <b>hastighet</b> langs LOS (<c8/>, <c9/>).

seg-9a2cb6292477 = Mars-LMO, OD ende til ende fra radiometriske data

seg-6318968b683a = <c1/>: en referansebue i lav Mars-bane utbredt under gravitasjonen <c2/> genererer støyfull toveis <b>avstand (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> mot to sporingsstasjoner; det redusert-dynamiske SRIF gjenvinner den fra en starttilstand som er <b>forstyrret med ~{ "2.7" } km</b>. Oppnådd: konvergert posisjons-<b>RMS ≈ { "0.2" } m</b> (under en meter, langt innenfor ferdigkriteriet meter til titalls meter) over en bue på 3 omløp med kadens { "30" } s, med den <b>faktoriserte kovariansen positivt definitt i hver epoke</b> (garantien til SRIF, slått fast hele veien). <b>Kontinuumet i innstilling fra cruise til LMO</b> prøves ende til ende: med en ikke-modellert luftmotstand i referansen som filtermalen mangler, gjenvinner det redusert-dynamiske grepet (stramhet { "1" }) til ~{ "14" } m mot ~{ "677" } m for kjøringen nær dynamisk (stramhet { "0" }) — en forbedring på { "48" }× fordi det empiriske nivået absorberer luftmotstanden. <b>Ærlig avgrensning:</b> syntetisk lukket sløyfe (referanse = den samme propagatoren som filteret bruker); den eksterne kryssjekken av DE-klasse er <c3/> som er avhengig av kjernen (D0.8b), aldri kjørt her, uten nettverk.

seg-559176eb1a82 = Scenario for PNT i dypt rom og fusjon av enveis + toveis — D3 (<c1/>, <c2/>)

seg-bdb5da496071 = Den fjerde milepælen for motoren for navigasjon i dypt rom: et kjørbart <b>Mars-PNT-produktscenario</b> som binder sammen Mars-legemet / referansesystemet fra D0, de radiometriske observablene fra D1 og den redusert-dynamiske OD fra D2 i én scenariotype <c1/>. Det modellerer en liten <b>relékonstellasjon i MARCONI-stil</b> som kringkaster et enveis (klokkekoblet) signal i rommet pluss videresender en toveis (koherent, klokkefri) lenke til en stasjon for dypt rom, og navigerer tre referansebrukere (Mars-overgang, orbiter i lav Mars-bane, fast overflatepunkt) gjennom <b>den felles estimatoren for fusjon av enveis + toveis i D3.1</b> — et SRIF med tolv tilstander som utvider den redusert-dynamiske bane-/empiriblokken fra D2 med en klokke om bord med tre tilstander. <b>Ærlig avgrensning:</b> hvert kvalitetsmål er estimatorens <b>formelle kovariansgrense</b> (1σ / 3σ posisjon per epoke) og den oppnådde RMS mot en <b>syntetisk lukket sløyfe</b> som referanse (referanse og filter deler den samme Mars-dynamikken og den samme geometriske observasjonsmodellen, pluss injisert gaussisk støy) — et simulert navigasjonskvalitetsmål, <b>IKKE</b> et sertifisert beskyttelsesnivå for luftfart og <b>IKKE</b> en påstand om flyging (ingen sertifisert feilmodell, ingen integritetsovervåker, ingen reelle sporingsdata). Alt nedenfor er additivt (referansefilene for reproduserbarhet er uendret; samme SHA, ingen regenerering).

seg-b81920d2df82 = Felles radiometrisk fusjon av enveis + toveis (fusjonert slår hver av dem alene)

seg-cd9d2a7dd08f = <c1/>: det redusert-dynamiske SRIF fra D2.2 utvidet med de tre klokketilstandene om bord (<c2/>), som tar inn en blandet tidsserie av <b>toveis</b> (klokkefri, fester banen — null klokkekolonner i den partiellderiverte) og <b>enveis</b> (klokkekoblet — frekvenspartiellen <c3/>) avstand/Doppler gjennom <c4/>. Strukturen kalibrer-så-fri-drift: toveis-passeringer fester banen, enveisdata kalibrerer så klokken og lar banen drive fritt mellom passeringene med en feil begrenset av klokkens Allan-stabilitet. Testet i <c5/> <c6/>: den <b>fusjonerte</b> løsningen slår <b>hver av koblingstypene alene</b>; feilen ved fri drift i en kjøring med bare enveis vokser med gapet mellom toveis-passeringer, i tråd med Allan-grensen for klokkeklassen; den felles kovariansen forblir SPD (symmetrisk positivt definitt) hele veien.

seg-26a4bfa8e6ad = MARCONI-konstellasjon (areostasjonær radius, okkultasjon)

seg-f2c2e1b83411 = <c1/>: et sett med fem releer — tre <b>areostasjonære</b> releer ved <c2/> (den Mars-synkrone radiusen fra publisert μ/spinnrate; testet i båndet <b>{ "20 400" }–{ "20 500" } km</b>) med lik avstand { "120" }° i lengdegrad og { "5" }° inklinasjon, pluss to releer i en høyere ({ "1.4" }× areostasjonær) sirkulær bane med { "60" }° inklinasjon for dekning i himmelplanet. Reléenes tilstander per epoke integreres framover under gravitasjonen <c3/>; testen av <b>Mars-okkultasjon</b> for synlighet er geometrien der korden klarer kulen (<c4/>, testet: en relé diametralt motsatt er okkultert, en relé rett over er synlig). <b>Ærlig avgrensning:</b> en minimal representativ geometri for kringkasting pluss relé bygget på publiserte Mars-konstanter — ikke en bestemt utforming av en konstellasjon for flyging.

seg-b53ea4dd9f7d = Scenarioet <c1/> kan nås via CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

seg-3a01d13ad2e7 = <c1/> / <c2/> er koblet inn som scenarioet <c3/> på alle flater (D3.3): CLI-kjøreren, Python-bindingen, WASM-/lekeplassbygget og MCP-serverens dispatch ruter alle til det (rundturstesten <c5/> for <c4/>). Referansescenarioer som følger med: <c6/>, <c7/>, <c8/>. Resultatet bærer en eksplisitt <c9/> som merker kvalitetsmålet som en kovariansgrense (ikke et sertifisert PL), og utdataene <c10/> / <c11/> gjentar merkingen om ærlighet.

seg-28a49a455a74 = MARCONI / LightShip-målene gjengitt: <b>< { "100" } m orbiter</b>, <b>< { "15" } m rover</b>

seg-28da71940857 = <c1/>: de publiserte programmålene for MARCONI / LightShip (orbiter < { "100" } m, overflate/rover < { "15" } m) gjengitt i simulering. <b>Felles forutsetninger:</b> standardkonstellasjonen MARCONI med fem relé; hvert relé i sikte gir én enveis avstand og Doppler per epoke; en koherent toveis stasjonspassering hvert <b>{ "30" } min</b>; støy i DSN-klassen (<b>avstands-σ = { "1" } m, Doppler-σ = { "0.1" } mm/s</b>); det felles reduserte-dynamikk-filteret for bane + 3-tilstands klokkefusjon startet fra en a priori-tilstand forstyrret med <b>~{ "2.7" } km</b> (stramhet { "0.1" }); kvalitetsmål (FoM) = konvergert 3D-posisjons-RMS over siste halvdel av buen mot den syntetiske referansen. <b>Orbiter</b> (LMO ~{ "400" } km / { "60" }° inklinasjon, <b>USO</b>-klokke, { "60" } s kadens, ~{ "2" } t ≈ en bue på én omløpsbane): oppnådd konvergert RMS <b>≈ { "0.40" } m</b> ≪ målet på { "100" } m (i gjennomsnitt { "3.1" } relé i sikte, kovariansen SPD hele veien). <b>Rover</b> (fast ekvatorial overflatepunkt, <b>USO</b>-klokke, { "30" } s kadens, bue på ~{ "2" } t): oppnådd konvergert RMS <b>≈ { "5.1" } m</b> < målet på { "15" } m (i gjennomsnitt { "3.0" } relé i sikte, kovariansen SPD). <b>Begge mål nådd uten å løsne på noen påstand</b>: USO er den <em>minst</em> kapable av de realistiske klokkeklassene om bord (en DSAC ville bare hjelpt), og toveiskadensen på 30 min er forsiktig for en rutinemessig reléplan, så forutsetningene er fysisk rimelige for et system i MARCONI-klassen i stedet for å være tilpasset for å lykkes. <b>Ærlig avgrensning:</b> simulert gjengivelse under de oppgitte forutsetningene, IKKE en flygepåstand eller et sertifisert beskyttelsesnivå; den syntetiske referansen i lukket sløyfe deler filterets Mars-dynamikk og observasjonsmodell.

seg-37b2bad62854 = Månens koordinattid: relativistisk klokkegang Jord-Måne (<c1/>)

seg-787705fa0fac = En tidsskala for månens koordinattid (LTC/TCL (TCL: Temps-Coordonnée Lunaire, det franske navnet på månens koordinattid)) krever den sekulære raten som en klokke på månens overflate går med i forhold til en klokke på jordens geoide (TT). <c1/> beregner den fra første prinsipper: en første post-newtonsk identitet som summerer <b>forskjellen i selvpotensial</b> (IAUs konvensjonelle geoidepotensial <c2/> <c3/> minus månens overflatepotensial <c4/>) og <b>det kinetiske leddet (andreordens Doppler)</b> <c5/> fra månens geosentriske hastighet (differensiert numerisk fra månerekken til Montenbruck-Gill i <c6/>). Det dominerende selvpotensialleddet gir <b>≈ { "57.5" } µs/døgn</b>, det kinetiske leddet <b>≈ −{ "0.5" } µs/døgn</b>, til sammen <b>≈ { "57" } µs/døgn</b>. Scenarioet <c7/> rapporterer denne raten, den akkumulerte LTC−TT-forskjellen over en horisont, og støtter et minimalt ensemble med invers varians (en lunar papirklokke); TT↔LTC-konverteringer går rundt til < { "1" } ns/døgn.

seg-beeb6561ef6b = Uavhengig referanse / ærlig avgrensning

seg-4500e65ede97 = Relativistisk klokkegang Jord-Måne (LTC/TCL)

seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Referanse: en intern relativistisk identitet i lukket form</b> (IAU <c6/> / geopotensialet etter IERS-konvensjonene og selvpotensialet GM/r (GM: gravitasjonsparameter, G ganger massen)), <b>kontrollert mot det publiserte båndet for månens klokkegang [{ "56" }, { "59" }] µs/døgn</b>. Tester (<c7/>): selvpotensialleddet ≈ { "57.5" } µs/døgn, månens fart ≈ { "1" } km/s, det kinetiske leddet et lite negativt tall, totalen innenfor båndet med de navngitte leddene som summerer til den, LTC−TT-forskjellen over 1 døgn ≈ { "57" } µs, og en rundtur TT↔LTC på < { "1" } ns/døgn. <b>Ærlig avgrensning:</b> hovedtallet i µs/døgn er <b>referanseavhengig</b>: det avhenger av de valgte referanseflatene (jordens geoide <c8/> mot en lunar selenoide), tidsmiddelvinduet og de forsømte sentrifugal-/J₂-korreksjonene under µs/døgn, og derfor er det et <b>bånd</b>, ikke ett enkelt sertifisert tall, som publiseres. Dette er en <c9/> selvkonsistenssjekk, <b>IKKE</b> en ekstern validering, <b>IKKE</b> absolutt nøyaktighet under nanosekundet og <b>IKKE</b> sertifisert for operativ tidshold.

seg-b4e3228c84b8 = Lunar geodetisk VLBI: nærfeltsforsinkelse for en jordgrunnlinje som observerer et månefyr (<c1/>)

seg-bbb634953ebf = En geodetisk VLBI-observabel (very-long-baseline interferometry) for to bakkestasjoner på jorden (en grunnlinje) som observerer et enveissignal fra en sender i NovaMoon-klassen på månens overflate. Månen er i <b>nærfeltet</b>, ikke en planbølge, så den geometriske forsinkelsen er den eksakte differansen mellom to avstander <c1/> i stedet for projeksjonen på himmelplanet. Den fullstendige observabelen legger til differansen mellom stasjonenes klokkeforskyvninger og et differensiert Shapiro-ledd fra jordens potensial (gjenbrukt fra <c2/>). Stasjonene plasseres i geosentriske treghetskoordinater (GCRS) via <c3/> + <c4/>; fyret via <c5/> (geosentrisk Måne) + <c6/> (selenografisk→MCMF (MCMF: månesentrert, månefast)) + <c7/> (IAU-2015 ME kroppsfast→treghet). Scenarioet <c8/> sampler forsinkelsen, dens endring per tid (numerisk differanse) og nærfeltskorreksjonen over en passering.

seg-b2b758337ebc = Den <b>uavhengige referansen</b> er planbølge-Δ-DOR-observabelen <c1/> i <c2/> fra samme kodebase: i fjernfeltsgrensen (et syntetisk fyr på { "1e15" } m) må den geometriske forsinkelsen gå over i <c3/> til maskinpresisjon; ved den virkelige månedistansen er nærfeltskorreksjonen for bølgefrontens krumning ulik null (titalls til hundrevis av µs). Fyrets partielle deriverte <c4/> (og stasjonenes partielle deriverte) er verifisert med sentral differanse (relativ feil < { "1e-5" }).

seg-107b9d328f69 = Lunar geodetisk VLBI-forsinkelse + partielle deriverte

seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Referanse: <c8/></b>: planbølge-<c9/> (<c10/>) fra samme kodebase i fjernfeltsgrensen, pluss <b>partielle deriverte med endelig differanse</b>. Tester (<c11/>): stasjonsstørrelse ≈ jordradius, fyrets avstand ved månedistanse ({ "356" }–{ "407" } Mm), geometrisk forsinkelse i fjernfeltet stemmer med <c12/> til < { "1e-9" } s, en ikke-null nærfeltskorreksjon ved månedistanse, partielle deriverte for fyr og stasjon med endelig differanse innenfor { "1e-5" } relativt, et eksakt klokkeledd og en endelig scenariokjøring sendt via <c13/>. <b>Ærlig avgrensning:</b> <c14/>, <b>IKKE</b> validert mot virkelige VLBI-data. Polbevegelsen er utelatt (<c15/>), så stasjonenes treghetsposisjoner har en rammefeil på noen få meter; fyret blander en månerekke for middelekvator ved datoen med en ICRF-forskyvning (International Celestial Reference Frame) i kroppsfast ramme (<c16/>), en rammeinkonsistens under modellens nøyaktighet, men ikke streng; og det finnes ingen lystidsiterasjon, ingen jordrotasjon under lystiden, ingen medier (tropo/iono/plasma) og ingen aberrasjonsledd utover det differensierte Shapiro-leddet. Ingen TRL (teknologisk modenhetsnivå), flygearv eller støtte fra noe byrå hevdes. { "0.30" }: mot ANISE-lystider gjennom DE440 ligger ingen forsinkelse i denne analytiske banen innenfor { "1" } ps (største avvik { "24" } µs); funnet er festet.

seg-d90c67f098f7 = <c1/> (DE440 Jord og Måne, DE440 lunare hovedakser, ITRF93 jordorientering, hver lystid konvergert i den barysentriske rammen), kjørt av scenarioet <c2/> når de tre kjernestiene er satt. <b>Uavhengig referanse: bibliotek</b>: NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) konvergerte lystider til DSS-14/43/63, forhåndsregistrert: { "75" } forsinkelser innenfor { "1" } ps (verst { "0.06" } ps), fyrets og stasjonenes partielle deriverte innenfor { "1e-6" }, ved { "25" } epoker nær J2000 (et tillegg etter at { "2024" } epoker feilet på SPICEs egen dobbeltpresisjons-emisjonsepoke, omtrent { "6" } ps, opplyst og festet). Scenarioets differensierte Shapiro-ledd, forsinkelsesrate og nærfeltskorreksjon sammenlignes ikke.

seg-8bed75c5402d = Lunar felles multiteknikk-banebestemmelse + klokke: simulert gjenvinning i lukket sløyfe (<c1/>)

seg-d518eead07c4 = En batch-minstekvadraters tilpasning for én epoke (øyeblikksbilde) (<c1/>, et Householder QR-steg siden { "0.30" }) som <b>fusjonerer teknikkene geodetisk VLBI, radiometrisk/lunar lokal avstandsmåling og avstandsmåling mellom satellitter</b> på et SIMULERT lunart nettverk for å gjenvinne, <em>sammen</em>, 3D-posisjonen til en stasjon på månens overflate, posisjonene til hver satellitt i en liten konstellasjon og klokkeforskyvningen til hver enhet. Observablene er: ({ "1" }) geodetiske VLBI-forsinkelser for en jordgrunnlinje til månestasjonen behandlet som fyret (gjenbruker <c2/>, geosentrisk treghet), hovedteknikken; ({ "2" }) geosentriske radiometriske avstander fra jordstasjon til satellitt (som multilaterer konstellasjonen fra de godt spredte jordstasjonene) og lunare lokale avstander mellom stasjon og satellitt (MCI (månesentrert treghet) euklidsk avstand pluss det differensierte klokkeleddet); ({ "3" }) avstander mellom satellitter (samme form); pluss én pseudo-observasjon for stasjonsklokkesynkronisering som forankrer den ellers uobserverbare felles klokkeforskyvningen. Tilstandsvektoren er <c3/>. Det er <b>ingen kraftmodellpropagering inne i løseren</b>: satellittene er faste, distinkte, illustrative punkter på en representativ månebane; dette er en bevisst ren øyeblikkstilpasning. Internt skaleres posisjonene og klokkene estimeres i avstandsekvivalente meter slik at normalmatrisen forblir velkondisjonert i f64; VLBI- og månedistanseavstandene er middelfjernet omkring nominell geometri slik at Jacobi-matrisen med endelig differanse ikke lider av katastrofal utslettelse. Scenarioet <c4/> kjører løsningen med og uten VLBI-leddene på samme seed/referanse og rapporterer begge løsningene pluss forbedringsfaktoren for stasjonens observerbarhet.

seg-f634e976b583 = Det <b>ærlige hovedresultatet</b>: lunar lokal avstandsmåling fra en polstasjon til en håndfull satellitter som alle ligger mot én side av himmelen, etterlater stasjonens posisjon <b>svakt observert langs én retning</b>, så løsningen med bare avstander er dårlig kondisjonert og den gjenvunne 3D-feilen for stasjonen er stor (eller løsningen konvergerer ikke). <b>Å legge til VLBI-forsinkelsene for jordgrunnlinjen gjør stasjonens fulle 3D-posisjon observerbar</b>, og den gjenvunne stasjonsfeilen faller til meternivå. Testen <c1/> hevder at stasjonsfeilen med VLBI er markant (≥{ "5" }×) mindre enn feilen med bare avstander på identisk innsatt referanse: at VLBI gjenoppretter den ellers uobserverbare stasjonsretningen er hele poenget med fasen.

seg-d5feea2381b7 = Den <b>uavhengige referansen</b> er intern konsistens: en innsatt referansetilstand (stasjon ~{ "50" } m/akse, satellitter ~{ "30" } m/akse, klokker ~{ "1e-7" } s, med et seedet jitter per komponent) avbildes til syntetiske observabler gjennom <em>samme</em> geometrimodell som løseren inverterer, seedet gaussisk støy legges til (illustrative standardverdier: VLBI σ ≈ { "1e-11" } s, avstands-σ ≈ { "0.1" } m, ISL σ ≈ { "0.1" } m; vekter <c1/>), og estimatoren må gjenvinne den innsatte referansen innenfor støyen fra en startgjetning med nuller. Et Monte Carlo-gjennomsnitt av NEES <c2/> over seeds (<c3/>) ligger innenfor et løst bånd omkring <c4/>, en sjekk av kovariansens realisme.

seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: løserens lineære algebra)

seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Uavhengig referanse i { "0.30" }: P2</b>: numpy { "2.4.6" } (LAPACK gelsd og inv) beregner på nytt hvert Gauss-Newton-steg, den konvergerte vektede løsningen, de formelle sigmaene og stasjonsfeilen på de innsjekkede Jacobi-matrisene for seks nettverk (<c4/>, steg innenfor { "2.4e-11" }, sigmaer innenfor { "1.3e-11" }); de fysiske observasjonsmodellene og størrelsene forblir MODELLED. <b>Tidligere referanse: <c5/></b>: gjenvinning av en innsatt simulert referanse + konsistens av NEES-kovarians. Tester (<c6/>): full fusjon gjenvinner referansen (stasjon < { "5" } m, satellitt-RMS < { "5" } m, klokker < { "1e-8" } s, konvergert); VLBI gjenoppretter 3D-observerbarhet for stasjonen (stasjonsfeil ≥{ "5" }× mindre med VLBI enn med bare avstander på samme referanse); deterministisk (samme seed → bit-identisk løsning, annen seed → annen, men gjenvunnet); gjennomsnittlig NEES innenfor et løst bånd omkring <c7/>; endelige/vaktede rapporterte tall selv når løsningen med bare avstander er dårlig kondisjonert; scenarioet sendt via <c8/>. <b>Ærlig avgrensning:</b> dette er en <b>simulert gjenvinning i lukket sløyfe</b> (referansen deler observasjonsmodellen), <b>IKKE</b> validering mot virkelige data; ingen kraftmodellpropagering inne i løseren; satellittposisjonene og geometrien mellom jord- og månestasjon er illustrative. Ingen TRL, ingen flygearv og ingen støtte fra noe byrå hevdes.

seg-7620f3a821f6 = Realisering av lunart referansesystem: 7-parameters Helmert-datumtilpasning (<c1/>)

seg-240271b9d7de = Der <c1/> <em>anvender</em> IAU { "2015" } WGCCRE for månens kroppsorientering (en foroverrettet modell), <em>estimerer</em> (realiserer) denne modulen et lunart referansesystem fra et nettverk av estimerte punktkoordinater knyttet til et datum. Estimeringskjernen er en klassisk <b>likedannethetstransformasjon med 7 parametere (Helmert)</b>: tre translasjoner, tre småvinkelrotasjoner og én skalaparameter, som avbilder punkter <c2/> (estimert ramme) til <c3/> (datumramme) som <c4/>, med <c5/> bygget fra <c6/>. De sju parametrene <c7/> estimeres fra ≥ { "3" } ikke-kollineære punktpar med vektet minste kvadrater gjennom <c8/>: foroverrettet modell predikerer hver <c9/> fra dens <c10/> og flater ut alle tre komponentene for alle punkter til observabelvektoren, de observerte datumkoordinatene danner <c11/>, vektene er <c12/>, og løsningen starter fra <c13/>. Rotasjonsvinkler estimeres i µrad og skala i ppb slik at Jacobi-matrisen med endelig differanse forblir godt skalert ved størrelsen på koordinatene på månens overflate (~{ "1.7e6" } m). En liten <c14/> sammensetter den realiserte lille rotasjonen gjennom IAU-orienteringen kropp→ICRF (<c15/>) og returnerer den realiserte rammens gjenværende småvinkelforskyvning om ICRF-aksene: et bevisst enkelt skifte av uttrykksramme, <b>ikke</b> et uavhengig estimat av månens pol.

seg-75769fc9671c = Den <b>uavhengige referansen</b> er intern konsistens: en kjent Helmert-transformasjon (translasjon ~titalls m, rotasjon ~µrad, skala ~{ "1e-7" }) <em>settes inn</em> i et godt spredt syntetisk punktnettverk (varierende selenografisk bredde/lengde → MCMF, noen punkter i høyde), seedet gaussisk støy legges til, og tilpasningen må gjenvinne de innsatte parametrene. På støyfrie data skjer gjenvinningen til ~maskinpresisjon (translasjon < { "1e-6" } m, rotasjon < { "1e-9" } rad, skala < { "1e-12" }); med metersstøy havner de gjenvunne parametrene innenfor noen få ganger den formelle σ, og RMS av restene etter tilpasning ligger nær støynivået. Scenarioet <c1/> rapporterer det gjenvunne datumet, gjenvinningsfeilen per parameter mot den innsatte referansen, RMS av restene etter tilpasning og ICRF-orienteringsknytningen for den realiserte rotasjonen.

seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Referanse: <c6/></b>: gjenvinning av en innsatt likedannethetstransformasjon med 7 parametere pluss den algebraiske rundturidentiteten til <c7/>. Tester (<c8/>): støyfri gjenvinning av den innsatte transformasjonen (translasjon < { "1e-6" } m, rotasjon < { "1e-9" } rad, skala < { "1e-12" }); gjenvinning med støy innenfor noen få ganger σ og RMS av restene nær støynivået; rundtur ved å anvende og så invertere; deterministisk (samme seed → bit-identisk, annen seed → annen, men gjenvunnet); ICRF-knytningen ved null rotasjon er null og knytningen bevarer rotasjonens størrelse; scenarioet sendt via <c9/>. <b>Ærlig avgrensning:</b> dette er en <b>selvkonsistenssjekk</b>: den gjenvinner en <em>innsatt</em> transformasjon på et <em>syntetisk</em> nettverk, <b>IKKE</b> en realisering av det lunare referansesystemet mot virkelige sporings-/VLBI-data, og den hevder ingen absolutt rammenøyaktighet. ICRF-orienteringsknytningen er et enkelt skifte av uttrykksform, ikke et uavhengig polestimat. Ingen TRL, ingen flygearv og ingen støtte fra noe byrå hevdes.

seg-f14930d33f47 = Lunar navigasjonstjenestevolum: DOP / dekning / tilgjengelighet + generalisert lunar ARAIM-PL (<c1/>)

seg-9b4f13e138e4 = Denne modulen <em>setter sammen</em> allerede bygde deler til en analyse av lunart navigasjons-<b>tjenestevolum</b>: den sveiper et selenografisk bredde-/lengdenett over en tidshorisont mot en <b>illustrativ konstellasjon i månebane fra offentlige kilder i klassen Moonlight / LCNS</b> (LCNS: Lunar Communications and Navigation Services) og rapporterer DOP / dekning / tilgjengelighet pluss en generalisert lunar ARAIM-omhylling av beskyttelsesnivå. De to gjenbrukene er bærende og eksplisitte. <b>DOP-geometrien</b> er kjernen <c1/> som er <b>VALIDATED</b> (mot gnss_lib_py): <c2/> er bare et tynt høydemaskefilter pluss den kjernen, og en test hevder identiteten (<c3/> er lik et direkte <c4/> på de samme synlige posisjonene). <b>Integritet</b> gjenbruker det lunare ARAIM-maskineriet i LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> generaliserer det eksisterende beskyttelsesnivået for sørpolen til et vilkårlig overflatepunkt, og en test hevder at det <b>reduseres til sørpoltilfellet</b> (ved sørpolen med samme geometri og budsjett returnerer det nøyaktig det eksisterende <c8/>-resultatet til < { "1e-9" }).

seg-456bf257f689 = Konstellasjonsparametrene er en <b>illustrativ tilnærming til offentlige ESA-beskrivelser</b> av systemklassen (≈ { "4" } satellitter i elliptiske frosne månebaner som favoriserer dekning av sørpolen, med apolun over den sørlige halvkulen; { "4" } er bibliotekets standard, og den medfølgende <c1/> setter { "8" } fordi beskyttelsesnivået trenger minst { "6" } i sikte). De er <b>ikke</b> den virkelige Moonlight/LCNS-efemeriden og antyder <b>ingen</b> tilknytning, støtte, arv, sertifisering eller TRL. Sammensetningen (dekning / tilgjengelighet / integritet) er <b>MODELLED</b>: et sett sirkulære/elliptiske Kepler-reléer (ikke en differensielt korrigert LCNS-efemeride for { "9" }:{ "2" } NRHO (nesten rettlinjet haloomløpsbane)), en måne med middelrotasjon (ingen fysisk librasjon / presesserende pol) og publiserte integritetsparametere fra LunaNet LNIS. Den viser <em>metoden</em> for tjenestevolum, ikke et operativt tilgjengelighetstall. Deterministisk (ren geometri; ingen tilfeldighet). Scenarioet <c2/> rapporterer dekningsprosenten, omhyllingene for antall synlige og PDOP, omhyllingen for HPL/VPL over volumet og tilgjengeligheten av beskyttelsesnivå mot alarmgrensen.

seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>DOP-geometri validert ved gjenbruk</b> av kjernen <c7/> som er validert mot gnss_lib_py; integritet gjenbruker den publiserte lunare ARAIM fra LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Tester (<c9/>): <c10/> er en identitet på den validerte kjernen; <c11/> ved sørpolen er lik det eksisterende <c12/>-PL til < { "1e-9" } (reduseres til sørpoltilfellet); dekningen er ikke-avtakende med konstellasjonsstørrelsen; synligheten respekterer høydemasken; scenarioet er deterministisk og sendes via <c13/>. <b>Ærlig avgrensning:</b> konstellasjonen er <b>illustrativ, fra offentlige kilder, IKKE tilknyttet ESA</b>, ikke den virkelige Moonlight/LCNS-efemeriden; sammensetningen av dekning/tilgjengelighet/integritet er <b>MODELLED</b> (sirkulære/elliptiske Kepler-reléer, måne med middelrotasjon, publiserte LNIS-parametere), <b>IKKE</b> et operativt tilgjengelighetstall for Moonlight. Ingen TRL, ingen flygearv og ingen støtte fra noe byrå hevdes.

seg-4ff4929f71df = Lunar differensiell PNT: felles-modus-kansellering + gjenværende feil som vokser med grunnlinjen + DGNSS-beskyttelsesnivåer (<c1/>)

seg-8f94c4bf3fe6 = En lunar DGNSS-analog (differensiell satellittnavigasjon) / SBAS: en <b>referansestasjon i klassen NovaMoon</b> på et <em>kjent</em> selenografisk sted beregner differensielle korreksjoner per satellitt fra en <b>illustrativ konstellasjon fra offentlige kilder i klassen Moonlight / LCNS</b>, og en bevegelig bruker med en grunnlinje fra den anvender dem slik at <b>felles-modus</b>-feilene i kringkastet efemeride kanselleres. Hver satellitt <c1/> har en innsatt felles 3D-banefeilvektor <c2/> og en felles klokkefeil <c3/>. Referansestasjonens pseudoavstandsrest er korreksjonen <c4/>; brukerens rå feil er <c5/>; den korrigerte brukerfeilen er differansen <c6/>. <b>Klokkeleddet <c7/> kanselleres eksakt</b> (det er identisk i begge observasjonene), og <b>baneleddet faller sammen til projeksjonen på differansen mellom de to siktelinjeenhetsvektorene</b>, som → { "0" } når grunnlinjen → { "0" } (gulvet for romlig dekorrelasjon) og vokser ≈ lineært med grunnlinjen. De korrigerte avstandsfeilene per satellitt avbildes gjennom brukergeometrien med en liten, avhengighetslett vektet minstekvadraters øyeblikksløsning (tilstand <c8/> via <c9/>; en konstant avstandsbias absorberes av klokkeukjenten i stedet for å ødelegge posisjonsbestemmelsen) for å gi brukerens <b>posisjons</b>feil. Brukerens <b>beskyttelsesnivå gjenbruker maskineriet for SBAS-beskyttelsesnivå i DO-229E</b> (<c10/>, K-faktorer for presisjonsinnflyging) med den differensielle rest-σ som hver satellitts 1-σ-feilbudsjett.

seg-06978cfaebe3 = NovaMoon nevnes <b>bare som en systemklasse</b> (en offentlig beskrivelse av en lunar referansestasjon); konstellasjonen gjenbruker den illustrative <c1/> fra offentlige kilder. Dette er illustrative parametere for å utøve den differensielle <em>metoden</em>, <b>ikke</b> en virkelig efemeride, og de antyder <b>ingen</b> tilknytning, støtte, arv, sertifisering eller TRL. Scenarioet <c2/> rapporterer brukerens posisjonsfeil med og uten korreksjoner, reduksjonsfaktoren, kurven for feil mot grunnlinje og beskyttelsesnivået. I standardkonfigurasjonen er den korrigerte brukerfeilen ved en grunnlinje på { "50" } km ≈ { "0.008" } m mot ≈ { "24" } m ukorrigert (en reduksjon på ~{ "3000" }×), og ≈ { "0" } ved null grunnlinje.

seg-6bb4dbe998f9 = Den <b>uavhengige referansen</b> er intern konsistens: kanselleringen av felles modus er en <b>eksakt algebraisk identitet</b> (med <c1/>, korrigert feil < { "1e-6" } m ved null grunnlinje; klokkeleddet kanselleres til maskinpresisjon ved enhver grunnlinje), resten <b>vokser monotont med grunnlinjen</b>, og beskyttelsesnivået er <b>samme DO-229E-algoritme</b> som SBAS-stakken er festet mot. Resten fra romlig dekorrelasjon er en geometrisk modell av <b>første orden</b>, <b>ikke</b> en tilpasset dekorrelasjonsmodell fra virkelig lunar sporing.

seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Referanse: <c6/></b>: identiteten for differensiell feilkansellering pluss gjenbruk av maskineriet for SBAS-beskyttelsesnivå i DO-229E (<c7/>). Tester (<c8/>): ved null grunnlinje er den korrigerte brukerfeilen og hver korrigerte avstandsfeil per satellitt ~{ "0" } (< { "1e-6" } m) og ≪ den ukorrigerte feilen; klokkeleddet kanselleres eksakt ved enhver grunnlinje (tilfellet uten banefeil); den korrigerte feilen vokser monotont med grunnlinjen mens den forblir ≪ ukorrigert ved moderate grunnlinjer; differensiell slår frittstående med klar margin (> { "2" }×); beskyttelsesnivået er lik et direkte kall til <c9/> og skalerer med rest-σ; underbestemt geometri returnerer <c10/>; scenarioet er deterministisk (seedet) og sendes via <c11/>. <b>Ærlig avgrensning:</b> <b>MODELLED</b>: kanselleringen av felles modus er en eksakt identitet, men resten fra romlig dekorrelasjon er en geometrisk modell av <b>første orden</b>, <b>IKKE</b> en tilpasset dekorrelasjonsmodell fra virkelig lunar sporing, og dette er <b>IKKE</b> validert mot virkelige data. NovaMoon nevnes <b>bare som en systemklasse</b> (illustrativ, fra offentlige kilder, <b>ikke tilknyttet ESA</b>). Ingen TRL, ingen flygearv og ingen støtte fra noe byrå hevdes.

seg-08e8a73f3426 = Lunar interoperabilitetseksport: LunaNet/IOAG-tilpasset CCSDS OEM + KIF med rundturskontroll av overensstemmelse (<c1/>)

seg-39b875078d27 = Lunart referansesystem, lunar tidsskala og lunar efemeride eksporteres i <b>LunaNet/IOAG-tilpassede (IOAG: Interagency Operations Advisory Group), CCSDS-baserte utvekslingsformer</b>. Denne fasen <b>finner ikke opp</b> et eget overføringsformat: den <b>gjenbruker</b> pakkens eksisterende CCSDS OEM-sender og -parser (Orbit Ephemeris Message) { "2.0" } (<c1/> / <c2/>) og Kshana Interchange Format-konvolutten (<c3/>), merket på nytt for lunar kontekst. <c4/> setter OEM-feltet <c5/> til <b>IAU { "2015" } WGCCRE lunar kroppsramme</b> (<c6/> middel-Jord eller <c7/> hovedakse), <c8/> til den <b>lunare tidsskalaen</b> (<c9/> / <c10/> / <c11/>) og <c12/> til <c13/>, over en eksempel-efemeride i <b>illustrativ LCNS-klasse fra offentlige kilder</b> (posisjoner fra <c14/>, hastighet ved sentral endelig differanse). <c15/> sender ut en LunaNet/IOAG-tilpasset lunar tidsbeskrivelse (skala-id, sekulær rate i µs/døgn fra <c16/>, det publiserte båndet { "56" }–{ "59" } µs/døgn, referanseflate) som går rundt gjennom serde_json. <c17/> pakker OEM + beskrivelse + rammemerke inn i den eksisterende KIF-konvolutten med ærlighetsmerket MODELLED.

seg-bbfce5323abb = Den <b>uavhengige referansen</b> er rundtur og feltkontroll av overensstemmelse. Fordi <c1/> leverer <em>begge</em> retninger, går OEM rundt gjennom <c2/> (tilbake til et likt segment, med lunar ramme/tid og antall tilstander bevart) <b>og</b> kontrolleres uavhengig av <c3/>, som verifiserer at hvert nødvendige CCSDS/LunaNet-hodenøkkelord finnes, at <c4/> har et lunart <c5/>-token og at <c6/> ikke er tom, at innrammingen <c7/> holder, og at datalinjene med posisjon og hastighet er velformede, og returnerer en strukturert beståttvurdering pluss listen over felt som finnes og mangler, slik at en ødelagt eksport (for eksempel en fjernet <c8/>) fanges opp og navngis. Tidsmetadataene går rundt gjennom <c9/>, og KIF-konvolutten går rundt gjennom <c10/> til like artefakter som bærer merket MODELLED.

seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Referanse: <c7/></b>: deterministisk rundtur (CCSDS OEM via <c8/>; KIF via <c9/>; tidsmetadata via serde_json) pluss kontroll av feltnavn mot publisert CCSDS OEM + LunaNet/IOAG-feltsemantikk. Tester (<c10/>): den eksporterte OEM har lunart <c11/> (<c12/>/<c13/>) og <c14/> (<c15/>/<c16/>), <c17/>, objektet og velformede datalinjer; de lunare tidsmetadataene går rundt (rate/bånd/referanse) og avviser søppel; KIF-konvolutten serialiseres og deserialiseres til en lik verdi med ærlighetsmerket MODELLED til stede; en bevisst ødelagt OEM (uten <c18/>) feiler <c19/> og rapporteres som manglende; scenarioet sendes via <c20/>. <b>Ærlig avgrensning:</b> feltets <b>navn/enheter</b> er tilpasset <b>offentlige</b> standarder (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } lunare rammer, LunaNet Interoperability Specification / IOAGs lunare arkitektur); eksporten er <b>MODELLED</b>: deterministisk rundtur + kontroll av feltnavn er den uavhengige referansen, dette er <b>IKKE</b> en sertifisert test av interoperabilitet eller overensstemmelse, efemeriden er <b>illustrativ, fra offentlige kilder, ikke tilknyttet ESA</b>, og ingen TRL, flygearv eller støtte fra noe byrå hevdes.

seg-69a214b7236d = Forhåndsregistrerte prediksjoner

seg-343fe86f6a50 = En forhåndsregistrert prediksjon er et MODELLED-resultat som er frosset før det finnes noen data å vurdere det mot, med vurderingsprotokollen fastlagt samtidig. Det er ikke en validering og legger ikke til noen registerrad. Hver ligger i <c1/>, med sine frosne inndata, sitt resultat og deres SHA-256-hasher, og <c2/> feiler hvis en eneste frosset byte flyttes; en endret forutsetning besvares med en ny, datert prediksjon ved siden av den gamle, aldri ved å redigere den.

seg-e65d79893e2c = Prediksjon

seg-f9e2d4b52b79 = Frosset

seg-dd68891f75e2 = Vurdert mot

seg-d5a09f26a028 = Dekning fra lunar referansestasjon

seg-c68f124a16e7 = c05dac1d, 2026-10-12

seg-293404a9cb92 = publisert nøyaktighet, tilgjengelighet, dekning og beskyttelsesnivåer for en lunar differensiell stasjon ved sørpolen, fra hvilken som helst part

seg-4e7d9449a880 = ennå ikke vurdert (ingen publiserte resultater)

seg-ad1995b3ed17 = Representativitet for demonstrasjonen og register over gap til flyging (<c1/>)

seg-86b70551c37f = Et simuleringsresultat er bare nyttig som evidens hvis det oppgir, åpent og tydelig, hva det er forankret i, hva det forutsetter og hva som fortsatt skiller det fra et flygesystem. Representativitetsregisteret gjør dette til et førsteklasses, maskinkontrollert resultat: en <c1/>-post bærer demonstrasjonens eksterne <c2/>-forankringer, dens modellerte forutsetninger, dens <c3/>-gap til flyging (hvert med fasen/aktiviteten som ville lukke det) og TRL-båndet den er representativ for. Det er følgesvennen per resultat til <c4/>-matrisen på funksjonsnivå.

seg-ccd039d5e6a4 = Den <b>uavhengige referansen</b> er et sett invarianter i lukket form, håndhevet av <c1/>: en <c2/>-post må oppgi minst én <c3/>-forankring (en simulering kan ikke valideres mot seg selv); en <c4/>-post må oppgi minst ett gap til flyging og kan ikke hevde et representativt TRL-bånd over { "4" } (modning utover det krever maskinvare-/flygeevidens, som er et gap, ikke et simuleringsresultat); TRL-båndet må være velformet; og en <c5/>-post må ikke hevde noe. Disse invariantene operasjonaliserer disiplinen «representativitet begrunnet + gjenstående gap mot flyging tydelig identifisert».

seg-6b29111096ca = Register over representativitet og gap til flyging

seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Referanse: <c8/></b>: ærlighetsinvarianter i lukket form knyttet til grensen mellom status og referansetype i <c9/>. Tester (<c10/>): en Validated-post uten ekstern forankring feiler; en intern (ReferenceImpl) forankring tilfredsstiller ikke Validated; en Modelled-post uten gap feiler; en Modelled-post over TRL { "4" } feiler; misdannede TRL-bånd fanges opp; posten serialiseres til JSON med de forventede feltene og gir en lesbar rapport. <b>Ærlig avgrensning:</b> registeret kontrollerer <em>klassifiseringen</em> av et resultats evidens: det beviser ikke at de navngitte forankringene peker til levende tester (de kurateres, nøyaktig som matrisen <c11/>); påstanden om «maskinkontrollert» gjelder bare invariantene for status/forankring/gap/TRL.

seg-7e9190395eb6 = Samlet evidens for avveining mellom kvante og klassisk (<c1/>)

seg-534e48755e2c = Hvert kvante-PNT-anvendelsesområde besvarer det samme spørsmålet på samme måte: fastsett én sammenligningsramme (scenario + seed + motorversjon), send en kvantekandidat og en klassisk grunnlinje gjennom én nøytral kodevei, vurder dem på felles kvalitetsmål, og rapporter, med et konfidensintervall og et ærlig merke for validert/modellert, hvor kvante vinner og hvor det ikke gjør det. <c1/> gir dette svaret én enkelt form slik at vertikalene for tidssynkronisering, navigasjon og anomalideteksjon alle sender ut <b>samme</b> reproduserbare, ærlig merkede objekt. Det implementerer ingen avveining på nytt: tallene per kvalitetsmål kommer fra de eksisterende motorene (<c2/>, <c3/> og vertikalmodulene); dette er kontrakten pluss omslaget for reproduserbarhet og representativitet, bygget på representativitetsregisteret og verifikasjonsmerkene.

seg-5a52fb6670d1 = Den <b>uavhengige referansen</b> er identiteter i lukket form for nytte/vinner pluss en tro innpakning av den eksisterende avveiningsutdataen. <c1/>: nyttefaktoren er polaritetskorrekt (orientert slik at <c2/> alltid betyr at kvantesiden er bedre, både for holdover-kvalitetsmål der høyere er bedre og for feilkvalitetsmål der lavere er bedre); et evidensobjekt bygget fra et virkelig <c3/> gjengir sine nyttefaktorer; uærlig evidens avvises (en Modelled-representativitet uten gap, eller et <c4/>-kvalitetsmål der avveiningsposten ikke har noen ekstern forankring); JSON er deterministisk og bærer feltene for ramme/seed/motor/kvalitetsmål/representativitet.

seg-ae87cea429ba = Evidens for avveining mellom kvante og klassisk

seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Referanse: <c5/></b>: identiteter i lukket form for nytte/vinner + tro innpakning av <c6/>; ærlighet knyttet til representativitetsregisteret og grensen mellom verifikasjonsstatus og referansetype. Tester (<c7/>) som ovenfor. <b>Ærlig avgrensning:</b> rammeverket standardiserer <em>hvordan</em> en avveining rapporteres og reproduseres; fysikken bak hvert kvalitetsmål er det den bidragende motoren leverer, med sitt eget merke for validert/modellert: <c8/> oppgraderer ikke et modellert kvalitetsmål til validert.

seg-ce13223e04d0 = Feilmodellbibliotek for kvanteenheter (<c1/>)

seg-c206fc7d58d6 = Ett sted som eksponerer kvante-PNT-enhetene demonstratoren avveier: optiske / fangede-ion / kvikksølv-ion-klokker, klassiske referanseklokker, kaldatom-interferometeret og tidsoverføringslenker, hver som en <c1/> med sin hovedspesifikasjon og en representativitetspost. Mesteparten av enhetsfysikken er <b>gjenbrukt</b> (klokkestabiliteter fra <c2/> og <c3/>; kaldatom-interferometeret fra <c4/>/<c5/>; klassiske optiske/RF-lenker fra <c6/>). Den ene helt nye modellen er <b>tidsoverføringslenken med sammenfiltring / enkeltfoton</b>, hvis tidspresisjon er skuddbegrenset: <c7/> i den detekterte koinsidensraten <c8/> og integrasjonen <c9/>, forringet av en straff for mørketellinger <c10/> og med et gulv gitt av en uunngåelig systematikk.

seg-7e8f4f3a5442 = Den <b>uavhengige referansen</b> er de gjenbrukte, publiserte klokke-/CAI-koeffisientene pluss identiteter i lukket form for skuddstøy og tap. <c1/>: den gjenbrukte rekkefølgen av klokkestabilitet er fornuftig (optisk gitter < kvikksølv-ion < CSAC i σ_y({ "1" } s)); sammenfiltringspresisjonen forbedres som <c2/> ({ "4" }× integrasjon halverer σ) når den er skuddbegrenset; den detekterte koinsidensraten faller { "10" }× per { "10" } dB lenketap; mørketellinger forringer presisjonen monotont; systematikkgulvet begrenser presisjonen nedenfra; hvert enhetskort er en gyldig, Modelled representativitetspost.

seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Referanse: <c5/></b>: gjenbrukte publiserte klokke-/CAI-koeffisienter + identiteter i lukket form for skuddstøy og tap for sammenfiltringslenken. Tester (<c6/>) som ovenfor. <b>Ærlig avgrensning:</b> klokke-/CAI-enhetsparametrene er gjenbrukt fra motorens eksisterende modeller med publiserte koeffisienter; sammenfiltringslenkemodellen er MODELLED ut fra publisert oppførsel for kvanteklokkesynkronisering med illustrative verdier for paringsrate/virkningsgrad/tap fra offentlige kilder: den er <b>ikke</b> validert mot en målt lenke, og virkelig kilde-/kanal-/detektormaskinvare er et oppgitt gap til flyging.

seg-f6d8e7ad6bec = Pålitelig kvantetidssynkronisering: kjede fra ende til ende, sikker utsending, anomali + avveining (<c1/>)

seg-3160cfec0d1f = Scenarioet <c1/> setter sammen tidskjeden en kvante-PNT-demonstrator trenger: et brukertidsbudsjett fra ende til ende (referanseklokkens driftsfeil under coast og lenkens tidspresisjon kombinert kvadratisk) for en <b>kvante</b>kjede (optisk gitterklokke + sammenfiltrings-/enkeltfotonlenke) mot en <b>klassisk</b> kjede (CSAC + RF-toveislenke); et <b>tidsbeskyttelsesnivå</b> (TPL, gjenbrukt fra <c2/>) som begrenser den uoppdagede tidsfeilen; et <b>sikkerhetskvalitetsmål for forsinkelses-/gjentakelsesangrep</b> <c3/> ved en oppgitt falsk-alarm-rate (gjenbrukt fra <c4/>); en <b>sannsynlighet for deteksjon av klokkeanomali + latens for endringsdeteksjon med CUSUM (kumulativ sum)</b>; og sammenligningen kvante mot klassisk som ærlig <c5/> med en post for representativitet + gap til flyging.

seg-6fa095264bdc = Den <b>uavhengige referansen</b> er et kvadratisk budsjett i lukket form over gjenbrukte, separat validerte kjerner (ADEV mot Stable32/NIST; TPL-grensen; <c1/>/<c2/>). <c3/>: kvantepresisjonen forbedres med integrasjonstiden; kvantekjeden kan vinne <em>og</em> kan tape presisjonskvalitetsmålet (ærlig: ikke en universell seier; en svært tapsfylt lenke snur resultatet); beskyttelsesnivået er endelig og positivt; sikkerhetskvalitetsmålet ligger i [{ "0,1" }] og vokser med angrepsforsinkelsen; sannsynligheten for anomalideteksjon er monoton i feilstørrelsen; og avveiningsevidensen er internt ærlig (<c4/>).

seg-42a7d1170cc3 = Pålitelig kvantetidssynkronisering (kjede + sikker utsending + anomali + avveining)

seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Referanse: <c5/></b>: kvadratisk budsjett i lukket form over gjenbrukte validerte kjerner (ADEV/Stable32-NIST, TPL-grense, analytisk Pd/Pmd for deteksjon); ærlighet knyttet til representativitetsregisteret. Tester (<c6/>) som ovenfor. <b>Ærlig avgrensning:</b> klokke-/lenkeparametrene er illustrative, fra offentlige kilder; sammenfiltringslenken er den MODELLED skuddbegrensede modellen fra <c7/>; dette modellerer <em>klassen</em> av pålitelige tidssystemer: det er <b>ikke</b> validert mot en målt lenke fra ende til ende, og virkelig klokke-/lenke-/romkanalmaskinvare er et oppgitt gap til flyging; ingen TRL, flygearv eller sertifisering hevdes.

seg-c6ae292a6331 = GNSS-fri kvantenavigasjon (<c1/>)

seg-f34f784e928c = Scenarioet <c1/> sammenligner dødregning under et GNSS-bortfall med et <b>kvante</b>treghetsbudsjett (et kaldatom-interferometer som akselerometer, gjenbrukt fra <c2/>/<c3/>, hvis CAI-hvitstøygulv er validert til innenfor ~{ "2" } størrelsesordener av Freier et al. { "2016" }) mot et <b>klassisk</b> INS på navigasjonsnivå. Det rapporterer veksten i posisjonsfeil under coast, holdover-tiden til en posisjonsterskel og avveiningen kvante mot klassisk som ærlig <c4/>. Observerbarheten oppgis ærlig: uten ekstern posisjonsbestemmelse under bortfallet er akselerometerets bias uobserverbar, så posisjonsfeilen vokser uten grense (≈ ½·bias·t² pluss et ledd for hastighetens tilfeldige gange); en kvantesensor med lavere bias <em>bremser</em> veksten, men lukker ikke gapet: bare en ekstern posisjonsbestemmelse gjør det.

seg-4cfde3de8f94 = Den <b>uavhengige referansen</b> er de gjenbrukte treghetsbudsjettene (<c1/>/<c2/>, begge implementerer trekket <c3/>) pluss driftsidentiteter i lukket form. <c4/>: kvantebudsjettet slår det klassiske over et langt bortfall (lavere feil, lengre holdover); feilen vokser med bortfallets varighet for begge (observerbarhetsgapet); fordelen avhenger av bortfallet og er ikke en konstant seiersfaktor (kvantekurven er støydominert ved kort coast, biasdominert ved lang); avveiningsevidensen er internt ærlig.

seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Referanse: <c5/></b>: gjenbrukte treghetsbudsjetter (CAI validert ved gjenbruk ~{ "2" } størrelsesordener mot Freier { "2016" }; klassisk drift i lukket form); ærlighet knyttet til representativitetsregisteret. Tester (<c6/>) som ovenfor. <b>Ærlig avgrensning:</b> en statisk sammenligning av dødregningsbudsjetter, ikke et dynamisk filter på virkelige baner; at bias er uobserverbar uten posisjonsbestemmelse er oppgitt; enhetsparametrene er illustrative, fra offentlige kilder; modellerer <em>klassen</em> av GNSS-fri kvantenavigasjon: virkelig kaldatom-IMU-maskinvare, en dynamisk plattform og flygemiljøet er oppgitte gap til flyging; ingen TRL/flyging/sertifisering hevdes.

seg-e23e583ecf21 = Feil-/anomalideteksjon for kvante-PNT-systemer (<c1/>)

seg-6e6df91ae779 = Scenarioet <c1/> definerer en merket katalog over kvante-PNT-feil (frekvenshopp, drift og låsetap i klokke; biassteg og bortfall i sensor), vurderer en deteksjonsstatistikk på nominelle mot feilbefengte vinduer og rapporterer detektorens diskriminering som en ROC AUC og en minste detekterbar feil ved en fast falsk-alarm-rate. Vinkelen kvante mot klassisk: en mer stabil kvanteklokke som referanse senker monitorens støy-σ, så den oppdager mindre feil; dette sendes ut som ærlig <c2/> med en representativitetspost.

seg-eeb3c7d1f507 = Den <b>uavhengige referansen</b> er en AUC i lukket form for den gaussiske deteksjonsstatistikken (nominell <c1/>, feil <c2/> ⇒ <c3/>) kontrollert mot den eksternt validerte <c4/> (validert mot scikit-learn) og de analytiske tersklene til <c5/>. <c6/>: den analytiske AUC stemmer med kjente verdier ({ "0.5" } ved μ={ "0" }, →{ "1" } for stor μ/σ, monoton); det empiriske bootstrap-AUC-konfidensintervallet omslutter lukket form; kvantemonitoren har høyere AUC og en mindre minste detekterbar feil; fordelen forsvinner for svært store feil (begge oppdager perfekt: ikke en universell margin); katalogen har fem merkede klasser; avveiningen er internt ærlig.

seg-9dda4ab0647a = Feil-/anomalideteksjon for kvante-PNT

seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Referanse: <c7/></b>: gaussisk AUC i lukket form kontrollert mot den eksternt validerte bootstrap-AUC fra <c8/> (mot scikit-learn) og de analytiske tersklene til <c9/>. Tester (<c10/>) som ovenfor. <b>Ærlig avgrensning:</b> deteksjonsstatistikken er en gaussisk modell, ikke virkelig telemetri; feilkatalogen er merket syntetisk; støynivåene for kvante-/klassisk monitor er illustrative, fra offentlige kilder; modellerer <em>klassen</em> av kvante-PNT-anomalideteksjon: virkelig maskinvaretelemetri med merker fra fasit er et oppgitt gap til flyging; ingen TRL/flyging/sertifisering hevdes.

seg-24ad75143bed = Overensstemmelse med standarder: utvekslingsformater, lenkebudsjett og integritet (kontroller mot uavhengig ekstern referanse)

seg-9d31773e0ecd = Disse standardene er validert ved å gjenvinne de <b>ordrette regneeksemplene / referanseverdiene som er publisert i selve standardene</b> (eller i en uavhengig referanseimplementasjon), ikke ved Kshanas egen rundtur. Å gjenvinne en standards eget vedleggseksempel er den sterkeste tilgjengelige kontrollen av overensstemmelse for en parser av utvekslingsformat.

seg-7ec3d508c64f = Ekstern referanse

seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

seg-65de0a1335d6 = <c1/>: <c2/> gjenvinner de eksakte epokene og tilstandsvektorene X/Y/Z/Ẋ/Ẏ/Ż i KVN OEM-eksemplet i <b>CCSDS 502.0-B-3, vedlegg G §G6, figur G-11</b> («OEM Example with No Acceleration, No Covariance», s. G-10): begge efemeridesegmentene, inkludert kildeverdiene med ledende null (<c3/>). Fixturen <c4/> er gjengitt tegn for tegn fra den offisielle Blue Book (de redaksjonelle markørene «< intervening data records omitted here >», som ikke er gyldige OEM-poster, er ikke tatt med).

seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

seg-a5c6b58e0053 = <c1/>: <c2/> gjenvinner alle { "41" } RANGE-poster (første { "3198.03679519614" } km, siste { "3270.46440460551" } km) og metadataene i KVN TDM-eksemplet i <b>CCSDS 503.0-B-2, vedlegg E, figur E-9</b> («Range Data with TIMETAG_REF=TRANSMIT», s. E-9). Fixturen <c3/> er ordrett fra Blue Book. (Dette er den uavhengige referansen fra den publiserte Blue Book ved siden av den eksisterende, håndskrevne rundturen med <c4/> i <c5/>.)

seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

seg-aaffd3d25c5f = <c1/>: koderen gjengir testvektorene på bytenivå for primærhodet fra det uavhengige <b>biblioteket <c2/></b> (us-irs/spacepackets-py, <c3/>), for eksempel <c4/> og alle-maks-tilfellet <c5/>, pluss det kanoniske telemetritilfellet (TM) med bare enere, hver sendt rundt gjennom dekoding. Bitfeltbredder og rekkefølge etter <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (lenkebudsjett, DSN 810-005)

seg-c6caa639e1c6 = <c1/>: kjeden for FSPL (friromsdemping) og C/N₀ gjengir den publiserte designkontrolltabellen for telemetri i dypt rom i <b>J. H. Yuen (red.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), tabell 1-1</b>: nedlenken til Galileo i X-bånd ({ "8420.43" } MHz) ved { "6.37" } AU: friromstap <b>{ "290.54" } dB</b> (<{ "0.05" } dB) og mottatt <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). Båndsentrene ligger innenfor nedlenketildelingene for dypt rom i DSN/CCSDS-401 (DSN 810-005 modul { "201" }). <em>Standard oppdragsparametre</em> forblir representative (ikke en kalibrert transponder); det er lenke<em>ligningen</em> dette fester.

seg-c2cee7d5c7b1 = GNSS-standarder: status for ekstern referanse og de ærlige gjenstående gapene:

seg-d8f653b3c955 = Status og ærlig forbehold

seg-fff735bd32a1 = <b>Kjerne, geometri og ARAIM-beskyttelsesnivået er eksternt validert.</b> Deteksjons<em>kjernen</em> (χ²-terskelen for feildeteksjon, ikke-sentralitetsparameteren i ikke-sentral χ² for ikke-deteksjon og K-multiplikatorene fra normalfordelingen) gjengir <b>SciPy</b> (<c1/>, { "171" } tilfeller, ≤ { "1e-6" } rel), og den omsluttende geometrien gjengir <b>gnss_lib_py</b> (DOP). <em>Verdien</em> av ARAIM-beskyttelsesnivået (PL) er nå også festet: mot WG-C (WG: Working Group) ARAIM Reference ADD (Algorithm Description Document) v3.1 «LPV-200 (LPV: localizer performance with vertical guidance) numerical example» gir <c2/> / <c3/> VPL { "18.2926" } m mot { "18.3" } m, HPL { "13.4063" } m mot { "13.45" } m og σ_v,acc { "1.3694" } m mot { "1.3694" } m, innenfor referansens egen <c4/> = { "0.05" } m (typen <c5/>). Omfang: feilmodi opp til én satellitt eller én konstellasjon (<c6/>); delmengder av feil med flere hendelser og utelukkelse er ikke implementert, og klassisk RAIM har fortsatt <b>ingen kanonisk publisert testvektor fra inndata til HPL</b>. Se <a1><c7/></a1>.

seg-e6a47dfb7e54 = <b>Beskyttelsesnivå-algoritmen er nå eksternt validert.</b> Gitt (el, az, σ) per satellitt gjengir kshanas <c1/> <b>RTKLIB SBAS-PL-forgreningen</b> (<c2/> <c3/>, Siki & Takács { "2017" }, «DO-229D Appendix J»), matet med det verktøyets <b>egen</b> σ beregnet fra <b>virkelige EGNOS</b>-kringkastingsmeldinger + virkelig BUTE RINEX, til <b>< { "2e-3" } m HPL</b> over { "6" } epoker (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) bekreftet den identiske konvensjonen. K-faktorene (<c6/>, <c7/>, <c8/>) stemmer med DO-229E vedlegg J. <b>Hva som er validert og hva som ikke er det:</b> dette fester PL-<em>algoritmen</em> (σ inn → HPL/VPL ut); σ-<em>modelleringen</em> oppstrøms fra rå UDRE/GIVE-meldinger ligger utenfor kshanas omfang: der er det uavhengige verktøy for <em>hele kjeden</em> fortsatt uenige med meter på virkelige data. K_V stemte ved referansens avrundede { "5.33" } (kshanas eksakte <c9/> → VPL ~{ "0.06" } % mindre; det vertikale er validert uten K-faktor som <c10/>).

seg-4ef39e8ea75c = <b>Kringkastingsmodellen er eksternt validert.</b> Klobuchar L1-modellen gjengir <b>RTKLIBs <c1/></b> (<c2/>, < { "1e-4" } m): <em>implementasjonslikhet</em> med den faktiske åpne referansen, siden det ikke finnes noe offisielt regneeksempel med <em>målt referanse</em>. Leseren for IONEX TEC-kart finnes nå (<c3/>, enhetstestet); det gjenstående gapet er en kryssjekk av den mot et virkelig GIM-produkt, ikke kringkastingsmodellen. Se Klobuchar-radene i <a1>Påstander mot virkelighet</a1>.

seg-fa3058dffb2a = GPS L1 C/A-spredningskode (IS-GPS-200)

seg-53ac231770fb = Kodegenerering er eksternt validert.

seg-04db7c613bd5 = <c1/> (<c2/>): C/A-kodegeneratoren med G1/G2 LFSR (linear-feedback shift register) gjengir <b>de publiserte kodefasetildelingene i IS-GPS-200 tabell 3-Ia</b>, de ti første chipsene oktalt for PRN (pseudo-random noise) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }), eksakt. Dette fester <b>chipsekvensen i spredningskoden</b> mot GPS-grensesnittspesifikasjonen; delene rundt, modulasjon, spektral separasjon og kodesporing med DLL (delay-locked loop) (<c3/>), forblir MODELLED.

seg-e5f1b960777a = Tidssynkronisering for nettverk, spektrum, solsystemet, konstellasjoner, kampanjer og LEO-PNT

seg-c5bf3b23d688 = Funksjonene som er lagt til i linjen { "0.28" } er vurdert rad for rad i den genererte <a1><c1/></a1>; denne delen oppsummerer hvilke av dem som har en ekstern uavhengig referanse. En rad er VALIDATED bare med en uavhengig ekstern referanse; alt annet er MODELLED.

seg-d791a48b3895 = Funksjon (type)

seg-d4779be2efd8 = Ekstern uavhengig referanse, eller hvorfor den forblir modellert

seg-0d7bb0fc1c5e = Telecom MTIE (maximum time interval error) og TDEV (time deviation) på en holdover-serie (<c1/>)

seg-18894b55b6c1 = <c1/>: { "17" } MTIE- og { "12" } TDEV-midlingsfaktorer på en innsjekket holdover-serie på { "2" } 048 sampler fra en chip-skala-klokke mot allantools { "2024.06" }, til < { "1e-12" } / < { "1e-9" } relativt. Verdiene PASS/FAIL for ITU-T-maskene (International Telecommunication Union Telecommunication Standardization Sector) og forhåndsinnstillingene for oscillatorer fra databladene forblir MODELLED. Se <a1><c2/></a1>.

seg-ff9cb967ae08 = Holdover-prediksjon fra en målt klokkeregistrering (<c1/>)

seg-7821227795d8 = <c1/>: tilpass på første tredjedel av den virkelige 5071A-cesiumregistreringen, prediker tidspunktet for brudd på én sigma ved seks terskler, mål det på de tilbakeholdte to tredjedelene; terskel en faktor på { "1.5" } begge veier, observerte forhold { "0.84" } til { "1.03" }. Slotvaktbudsjettet og posisjonsbestemmelseskadensen som bygger på det forblir MODELLED.

seg-2667e3ddf829 = Spektrale effekttettheter i L-bånd i lukket form og spektral separasjon (<c1/>)

seg-1a0c6ef49f98 = <c1/> lukkede former mot publiserte verdier (matriseraden «Closed-form L-band signal power spectral densities…»). Fossefallsvisningen med J/S (jammer-to-signal ratio) per bånd og effektiv C/N0 (carrier-to-noise density), og inn- og utdata for SigMF (Signal Metadata Format), forblir MODELLED.

seg-46278e9c03c1 = Planetposisjoner fra JPL (Jet Propulsion Laboratory) Standish-elementene, og lystid mellom legemer (<c1/>)

seg-43cfeb9f2403 = { "0.30" }, forhåndsregistrert mot JPL Horizons (DE441): <c1/> og <c2/>, RMS per planet og komponent høyst lik tallet i Explanatory Supplement tabell { "8.10.1" } (verst { "0.778" }), inkludert delingen av Jorden og ICRF-rotasjonen; <c3/>, lystidsløseren på DE441-posisjoner innenfor { "1e-6" } s av lystiden fra Horizons (verst { "6.7e-9" } s). Den tidligere sammenligningen med dobbel nominell verdi (<c4/>), hvis terskel ble satt etter den første sammenligningen, beholdes som en ikke-portende regresjon. Uranus/Neptun fra tabell { "1" }, Pluto, månene, legemskonstantene og <c5/> forblir MODELLED.

seg-b96d8ea13c87 = Walker-geometri og de publiserte GPS-, Galileo- og GLONASS-sporene (GLObal NAvigation Satellite System); global GPS-dilution of precision (<c1/>)

seg-85c293b8d235 = <c1/>: Walker 24/3/1 gjengir definisjonstabellen for Galileo Open Service til { "1e-9" }°, sporformelen i GLONASS-grensesnittkontrollen og GPS-ekvatorkrysningene; medianen for GPS-grunnlinjens HDOP { "0.940" } mot { "0.94" } i ytelsesstandarden for Standard Positioning Service. Vilkårlige dekningskart for flere konstellasjoner rundt et hvilket som helst legeme forblir MODELLED.

seg-f0187be4b97f = Kampanjer: lenkede oppdrag, sveip, Monte Carlo-ensembler, kjøringer med delte betingelser (<c1/>)

seg-b5c45fc12e5f = <c1/> ({ "11" } tester): en kampanje med én fase gjengir den frittstående kjøringen byte for byte, et sveip med én node leser det samme tallet, et seedet ensemble er bytestabilt. Sammensetningsidentiteter, ikke en ekstern uavhengig referanse.

seg-bc25d20125e7 = LEO (low Earth orbit) lenkefysikk: ITU-R (ITU Radiocommunication Sector) P.838 regnkoeffisienter, P.618 regndemping og scintillasjon, P.2109 tap ved inntrengning i bygninger, første ordens ionosfære, maksimal Doppler

seg-b1f3bd37d169 = <c1/>, <c2/>: ITU-R-anbefalingenes egne tabeller og valideringseksemplene fra Study Group { "3" } (innsjekket med kilde og hentedato), gruppeforsinkelsesforholdet i IS-GPS-200 for ionosfæren og den publiserte tabellen over maksimal Doppler av Leclere, Marathe og Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

seg-492917f11386 = LEO-navigasjonsmelding: brukeralgoritmen for kringkastet efemeride i Galileo ICD (interface control document), CRC-24Q (24-bit cyclic redundancy check), globalt gjennomsnittlige SISRE-vekter (signal-in-space range error) (<c1/>)

seg-514a7da01582 = <c1/>: brukeralgoritmen for Galileo gjengir RTKLIB (et åpent bibliotek for sanntids kinematisk posisjonsbestemmelse) til { "1" } mm på fire virkelige kringkastede Galileo-efemerider; CRC-24Q gir katalogkontrollverdien 0xCDE703 og kontrollbytene i RTCM-eksempelrammen (Radio Technical Commission for Maritime Services) { "1005" }; SISRE-vektene gjengir den publiserte MEO/GEO-tabellen. Tilpasseren, oppdateringen midt i passeringen, binærkodingen, tekst i RINEX-4-stil/CSV (comma-separated values) og de valgbare efemeridemodellene forblir MODELLED.

seg-94bbcd43e03a = LEO-signalutforming, passering og lenkebudsjett, Doppler og felles GNSS+LEO-posisjonsbestemmelse, PPP-konvergens (precise point positioning), 5G NTN-posisjonsbestemmelse (non-terrestrial network), LEO-tidsoverføring (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-4c37a8cfac87 = <c1/>, <c2/>: lukkede former, filterkonsistens (for eksempel PPP-filterets kjøringsmidlede NEES innenfor sitt { "95" }%-bånd) og sammenligninger av publiserte trender; ingen feltdata.

seg-91cf4e399f0a = Ett LEO-PNT-system fra ende til ende (<c1/>)

seg-fb947da2e8b4 = <c1/>: hver videreført verdi er lik oppstrømstrinnets egen utdata, og å endre en oppstrøms inndata flytter hvert nedstrøms tall som avhenger av den.

seg-7e230aa73770 = LEO-robusthet og vertikaler (spoofing via Doppler og via konsistens mellom bånd, ionosfæresondering)

seg-ab2542cfc295 = <c1/> ({ "10" } tester). Scenarioene for robusthet og vertikaler er oppført i <a1><c2/></a1>.

seg-2d3ead293658 = Utdata som er gjengivelser, ikke evidens, har tester, men ingen matriserad: utvekslingseksportene (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeride (Systems Tool Kit), SigMF (Signal Metadata Format)), hver lest tilbake av en validator skrevet fra formatets spesifikasjon (<c1/>, { "13" } tester; se <a1><c2/></a1>); animasjonene (<c3/>: byte-identiske nykjøringer, eksakt antall bilder, velformet SVG (Scalable Vector Graphics), ingen ekstern adresse i HTML-spilleren (HyperText Markup Language)); og kjøringsrapporten (<c4/>, <c5/>: hvert medfølgende scenario rapporterer uten tom seksjon eller plassholderverdi, merkene stemmer med matrisen, og den registrerte kommandoen gjengir <c6/> og rapporten byte for byte).

seg-903e4e51dda1 = Driftsomhylling

seg-e226ad523a3d = Hver pakke utøves over sin oppgitte omhylling av inndata av <c1/>, som hevder at hver numeriske utdata er endelig (ingen NaN/Inf (NaN: not a number)) og begrenset. Tabellen viser det testede inndataområdet per pakke, den forventede utdataoppførselen og den dekkende testen.

seg-8bd4f586f3c7 = Sveipet inndata

seg-3ebc1201a545 = Testet område

seg-a1198518d667 = Forventet utdata

seg-7bf563f5420a = Dekkende test

seg-4906c027a805 = <c1/> (tidsspesifikasjon)

seg-d91e18ce3773 = { "1" } – { "500" } ns

seg-10cf765fdd75 = endelige kvalitetsmål for holdover/tidssynkronisering/sikkerhet

seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (kaldatom → enkel MEMS (micro-electro-mechanical systems))

seg-456c32a126a2 = endelig, begrenset posisjons-RMS/p95

seg-dae96fd3a01b = <c1/> (høydemaske)

seg-a54c3c8933c6 = endelig DOP/tilgjengelighet; begrenset

seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

seg-b6d0d587046e = endelig P_md / sikkerhet, begrenset

seg-fda0b32d7784 = { "10" } – { "1000" } m

seg-132fdea2270f = endelig holdover for tid/posisjon

seg-c9099375b99f = bane (virkelig)

seg-952b94eda0ff = virkelige TLE-er fra Celestrak <c1/>

seg-60009932477c = øyeblikksbilde med 30 satellitter, streng kontrollsum

seg-deb16d50741e = lastes bare med gyldige kontrollsummer; begrenset geometri

seg-c46d726e35b3 = klokke (flicker)

seg-15939085bf3a = <c1/> på/av

seg-504a95f55b88 = { "0" } mot { "1e-12" }

seg-e1cce0c2028e = å slå på 1/f-gulvet <b>forverrer</b> p95 for tid under coast

seg-bdd4e56bdef9 = fusjon (realisme)

seg-09af9dd78fe3 = <c1/> { "0" } mot { "5.88e-7" } m/s²

seg-0a6723be642c = null mot realistisk ikke-null

seg-a9eb04be2b9f = filteret konvergerer fortsatt, innenfor { "3" }× feilen ved null bias

seg-2a839953aa6a = Radene for flicker-FM og fusjonsbias lukker to bestemte realismegap: støyleddene er <b>av som standard, men påvirker påviselig utdataene når de slås på</b>, og det felles fusjonsfilteret <b>avhenger ikke av at biaser er nullstilt</b>: det konvergerer også med en realistisk restbias på kaldatomnivå.

seg-4f0e9f9d4cdf = Kvante- og klassiske kjøringer bruker nå uavhengige seeds for RNG (random-number generator) (klassisk seed = seed + 0x9e3779b97f4a7c15) slik at støyrealiseringene deres er ukorrelerte: rettet etter gjennomgang.

seg-3b6b785f401a = <c1/> er segmentbevisst: bortfallstidslinjer deles i sammenhengende segmenter ved ny GNSS-innhenting, og den rapporterte verdien er den verste (korteste) coasten blant dem. Den er fortsatt begrenset av tidsrutenettets oppløsning (en nedre grense).

seg-4a830113b13d = ISL-tidsoverføringens resynkronisering modellerer den gjenværende lenkeusikkerheten som ferskt jitter med null middelverdi per målesteg pluss ny forankring ved det konfigurerte intervallet.

seg-30c4d89aa433 = Påstander mot virkelighet: hurtigreferanse

seg-27a22de7b8c0 = En fiendtlig granskers sjekkliste. For hvert uttrykk som kan leses som mer enn det er: hva Kshana gjør i dag, og hvor den virkelige versjonen ligger på veikartet.

seg-759eb0cfafe4 = Uttrykk du kan se

seg-6a2d3691d642 = Hva det faktisk er i dag

seg-bbd0145bfb95 = Hva det <b>ikke</b> er (ennå)

seg-a6fdb038b003 = «hybrid kvante-/klassisk PNT-simulator»

seg-4421f8bd0967 = en klassisk stokastisk simulator drevet av publiserte Allan-/støykoeffisienter for kvantesensorer

seg-3885661aafff = kvantefysikk fra første prinsipper (Mach–Zehnder-fase, projeksjonsstøy, systematikk): se <a1><c1/></a1>

seg-1d28debd0302 = «felles Kalman-fusjon» / fusjonspakken

seg-d13beba21ba7 = den kjørbare pakken <c1/> observerer klokken og posisjonen <b>hver for seg</b> (en direkte tidsbestemmelse og en direkte posisjonsbestemmelse), der den optimale estimatoren faktisk er blokkdiagonal: to filtre med to tilstander og et kombinert kvalitetsmål

seg-25c2fe6fa6d3 = et <em>koblet</em> filter for <b>pseudoavstands</b>tilfellet <b>finnes</b> nå som <c1/> (4 tilstander stablet <c2/>, kovarians mellom blokkene ulik null, validert med NEES), men er <b>ennå ikke koblet inn i den kjørbare pakken</b>, og pakken er <b>1-DOF (én frihetsgrad)</b>: 3D-utvidelsen med 8 tilstander er fremtidig arbeid

seg-5cce1ca5b86f = Sikkerhetskvalitetsmål (type <c1/>)

seg-d55c30f63023 = <c1/> for en <b>stokastisk detektor for tidsspoofing</b>: en tosidig χ²₁- / Neyman–Pearson-test på en klokkestøttet monitorstatistikk, terskel satt ut fra en målsatt <c2/>, <c3/> evaluert <b>ved spesifikasjonens størrelse</b> både i lukket form og med Monte Carlo (som stemmer til noen få ×1/√N)

seg-dbf2039a4a8e = en RAIM/ARAIM-detektor med flere satellitter: se <a1><c1/></a1>; monitorstatistikken er en gaussisk modell med klokkens PSD-avledede σ, ikke en korrelasjon på signalnivå

seg-32bcb801e49c = «klokkestøttet spoofingdeteksjon»

seg-58e4d22075e9 = en <b>enkeltklokke</b>-monitor for tidsavvik (gaussisk statistikk, σ fra klokkens PSD), IKKE RAIM med flere SV (SV: space vehicle, altså en satellitt)

seg-f3f6f95bc559 = RAIM i avstandsdomenet med flere SV og beskyttelsesnivåer

seg-a5faedaab13e = P_md for spoofingdetektor (lukket form mot Monte Carlo)

seg-0362489c341a = den analytiske <c1/>-baserte <c2/> og det empiriske estimatet fra <c3/> forsøk stemmer innenfor samplingsfeilen (≈ 1/√N); validert i testene <c4/> / <c5/> ved en stresset avbøyning (μ/σ = { "2" })

seg-8fa5c9468ff5 = en målt ROC for detektoren mot registrerte spoofingdata

seg-8f895aa1c657 = pseudoavstandsmodellen i <c1/>

seg-a5e5e1e7a0e9 = en <b>foroverrettet simulering</b>: <c1/>. Hver atmosfæremodell er enhetstestet mot håndregnede verdier (ZHD (zenith hydrostatic delay) ≈ { "2.3" } m, Niell = { "1" } i senit, Klobuchar-obliquitet), og den fullstendige Klobuchar-kringkastingsmodellen er <b>kryssjekket mot RTKLIBs <c2/></b> referanseimplementasjon til under en millimeter (<c3/>, { "6.1278" } m for RTKLIBs tilfelle med standardkoeffisienter: det finnes ingen offisiell publisert Klobuchar-testvektor, så dette er implementasjonslikhet, ikke målt referanse); en <b>kjøring uten støy gjengir geometri + korreksjoner til under en millimeter</b> (RAIM-rest ≈ { "0" })

seg-adc8a5d89cbd = en posisjons<b>løsning</b> fra virkelige signaler (PPP/RTK (PPP: precise point positioning)), tofrekvent ionosfærefri kombinasjon eller løsing av bærebølgeflertydighet: ikke modellert

seg-a56533528c6e = jamming-modell (type <c1/>)

seg-0a4a28fcd53a = en <b>lenkebudsjett</b>kjede: J/S fra friromstap + antenneforsterkning per retning → effektiv C/N₀ via anti-jam-ligningen (spredningsforsterkning × spektral separasjon <c1/>) → låsetap ved en terskel (Kaplan & Hegarty §{ "9.4" })

seg-b53e210487fb = flerveisutbredelse, dynamikken i AGC (automatic gain control) over tid, selve innhentingssøket (den valgfrie <c1/>-hysteresen er et terskelpar); det valgfrie <c2/>-kvantiseringstapet er det for en gaussisk inndata, ikke gyldig for en CW-jammer; den valgfrie <c3/>-gruppen er smalbåndet og ideell (ingen kobling eller feiltilpasning), og den valgfrie <c4/>-skyggeleggingen er én knivegg på én SRTM-rute; <c5/> er en representativ konstant per type, ikke utledet fra jammerens målte PSD

seg-523d66d56f97 = Integritetskvalitetsmål (klokke-/holdover-pakker)

seg-d0702ee52d37 = filterets <b>selvkonsistens</b> (andelen bortfallssampler innenfor filterets egen k·σ-grense)

seg-b4b68065e521 = HPL/VPL, integritetsrisiko / P_HMI, alarmgrenser, DO-229E/316/ED-259A: disse rapporteres separat av typen <c1/> (RAIM / ARAIM) og SBAS-funksjonene, og slås aldri sammen med dette kvalitetsmålet

seg-d5b1f858f0e3 = kvalitetsmål for eldre <c1/>-scenario<b>pakke</b>

seg-e9fe365d7318 = et <b>enakset (1-DOF)</b> feilbudsjett for akselerometer/gyro (VRW/ARW, biasustabilitet) med tilbakestilling til referansen

seg-604e8d96c2c2 = den <em>eldre</em> pakken er 1-DOF; <b>3-aksestien leveres i pakken <c1/></b> (neste rad)

seg-e2a4a1c47f2c = 3-akset strapdown-<b>bibliotek</b> + <c1/>-<b>pakke</b> (<c2/>, <c3/>)

seg-01e5672a37a4 = en verifisert navigator med kvaternion/NED (NED: nord-øst-ned) med en deterministisk IMU-feilmodell: <b>skalafaktor, feiljustering, g-følsomhet, kvantisering, ratehelling</b> modellert (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }), nå <b>drevet av scenariopakken <c1/></b> og <b>kan konfigureres per sensor fra TOML (Tom's Obvious Minimal Language, scenarioformatet)</b> (<c2/>)

seg-acecd6b81859 = <b>ikke modellert:</b> vibrasjonsrektifiseringsfeil, temperaturgradientdrift. Feilen ved fusjonert coast er begrenset av et gulv gitt av attitydefeilen ved overlevering (tilt/akselerometerbias er svakt separerbare), så kalibrering per bias hevdes ikke

seg-6b04fc376c0d = «Hybrid PNT-integrasjon» (<c1/>-pakke)

seg-cd3125081b5c = dødregning i åpen sløyfe avgrenset av GNSS-tilbakestillinger til referansen

seg-578c93c67ae7 = en koblet (løs/tett) GNSS–INS Kalman-blanding: det er den separate pakken <c1/> (EKF) og typen <c2/>

seg-57f603da0331 = «Positioneringsytelse» (klokkepakker)

seg-278aafe7fadf = RMS for klokkefase<b>tid</b> i ns (<c1/>)

seg-a6af364cbcdc = en nøyaktighet i posisjonsdomenet som RMS/CEP/SEP/DOP-vektet (SEP: spherical error probable)

seg-b68c5a4363a5 = kvalitetsmål for treghetsposisjon (<c1/>)

seg-850e030bb5e3 = en <b>enakset</b> posisjons-RMS/p95 i meter, fra én seed med mindre <c1/> ber om et ensemble (da gjennomsnitt, spredning og et bootstrap-konfidensintervall på { "95" }% per mål)

seg-be77929afa2c = en ensemblefordeling av CEP / 2DRMS (to ganger avstands-RMS) (veikart: Monte Carlo-CEP)

seg-75f239679dc2 = «validert til ~{ "2" }%»

seg-2d593a99a2b1 = en <em>typisk</em> observert overensstemmelse; den <b>håndhevede grensen er { "20" }–{ "25" }%</b> relativ feil

seg-34cfd0e08235 = en garantert nøyaktighetsgrense på { "2" }%

seg-d3402cc1ebd5 = «reproduserbar / bit-identisk»

seg-46ea210bcdad = bit-identisk nykjøring på <b>samme OS (operating system) + festet toolchain</b>; på tvers av Linux, macOS og Windows kontrollerer CI en innsjekket SHA-256 av hvert resultats fingeravtrykk av inndata og form (<c1/>) og de numeriske verdiene til { "1e-6" } (<c2/>)

seg-38c6528122a8 = et byte-identisk fullstendig resultat på tvers av operativsystemer (forskjeller i siste siffer i libm)

seg-b0e21aea4ccd = SGP4 GPS-scenario (<c1/>)

seg-1131aa869f1d = et ekte øyeblikksbilde av Celestrak <c1/> (2021-07-28, { "30" } satellitter, strenge kontrollsummer), hver satellitt propagert fra sin egen TLE-epoke

seg-21c2f1b5d7e2 = en gjeldende konstellasjon: oppdater øyeblikksbildet med <c1/> (se <a1><c2/></a1>); katalognumrene fra NORAD (North American Aerospace Defense Command) er de virkelige

seg-6948bd06c7e5 = Kryssjekker mot Lunar-PNT-artikler (regresjonsevidens, ikke matriserader)

seg-9ee0faf0b359 = Den lunare/cislunare suiten (funksjonene «Lunar & cislunar» og «Lunar PNT suite» i README) har sine publiserte artikkelpåstander uavhengig kryssjekket i <c1/>, hver mot en uavhengig referanse fra en <em>annen</em> implementasjon:

seg-b4edbf832fe6 = <b>fotavtrykk for sending/fangst i bane</b> mot <c1/> (Cephes Bessel J1);

seg-c856d319a46e = <b>DOP for overflatefyrgeometri</b> mot en uavhengig NumPy-løsning av <c1/>;

seg-33ee672d98d7 = <b>vekst av prediksjonsfeil for UT1/EOP-persistens</b> mot en NumPy-gjenparsing av de samme ordrette IERS <c1/>-radene;

seg-9b6e59789117 = <b>plan familie av retrograde fjernbaner (DRO)</b> mot NASA/JPL Three-Body Periodic Orbit Database;

seg-c77384abd1cc = <b>presisjonsbudsjett for RF-avstandsmåling</b> mot en referanse fra første prinsipper.

seg-a451dbe09e10 = Fixturer og skript for generering av uavhengig referanse ligger under <c1/>. Disse styrker evidensen bak funksjoner som forblir <b>MODELLED</b> i den maskinkontrollerte matrisen (<c2/>); de er regresjonssjekker, <b>ikke</b> nye VALIDATED matriserader, så de endrer ikke selv antallet i den maskinkontrollerte matrisen. Antallet gjengis ikke her, fordi en håndskrevet kopi av det driver bort: den gjeldende fordelingen står i den genererte overskriften til <a1><c3/></a1>, som <c4/> skriver fra <c5/> og <c6/> fester.

seg-a353a63661de = <s1>Forrige</s1>Interoperabilitetseksport og -import

seg-fdae3b73ab67 = <s1>Neste</s1>Verifikasjonsmatrise

seg-59c12422e6e7 = Tidevann på geopotensialet (src/tides.rs)

seg-10f0b4616abe = Manøvrer og banedesign (src/maneuver.rs)

seg-56cdbd59ce5d = Banebestemmelse (OD) (src/orbit_determination.rs, src/batch_ls.rs)

seg-3a2c69fcbb86 = Validering av kraftmodell ved efemeridetilpasning (src/precise_od.rs)

seg-05a25c6ef750 = Virkelige presise baner fra byråer (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

seg-279f4619bc2d = Gravitasjonskart / alt-PNT-navigasjon (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

seg-7b512df70323 = INS / IMU-feilmodell: validering mot databladene (src/inertial/)

seg-b385e665cfff = PNT i dypt rom og Mars: grunnlaget D0 (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

seg-5887e7e1a218 = Radiometriske observabler i dypt rom og CCSDS Tracking Data Message: D1 (src/radiometric.rs, src/ccsds_tdm.rs)

seg-a9cf84a14301 = Banebestemmelse med redusert dynamikk i dypt rom: D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

seg-dc406cb825db = PNT-scenario i dypt rom og fusjon av enveis + toveis: D3 (src/mars_pnt.rs, src/deepspace_od.rs)

seg-7784f9436dd2 = Månens koordinattid: relativistisk klokkegang Jord-Måne (src/lunar_time.rs)

seg-8a34cb900611 = Lunar geodetisk VLBI: nærfeltsforsinkelse for en jordgrunnlinje som observerer et månefyr (src/lunar_vlbi.rs)

seg-d47906a347b3 = Lunar felles multiteknikk-banebestemmelse + klokke: simulert gjenvinning i lukket sløyfe (src/lunar_combination.rs)

seg-17b9f0ae9dee = Realisering av lunart referansesystem: 7-parameters Helmert-datumtilpasning (src/lunar_frame_realise.rs)

seg-3cfffa3eeb79 = Lunar navigasjonstjenestevolum: DOP / dekning / tilgjengelighet + generalisert lunar ARAIM-PL (src/lunar_service.rs)

seg-d80bf3320a15 = Lunar differensiell PNT: felles-modus-kansellering + gjenværende feil som vokser med grunnlinjen + DGNSS-beskyttelsesnivåer (src/lunar_dpnt.rs)

seg-23c3d8a79acf = Lunar interoperabilitetseksport: LunaNet/IOAG-tilpasset CCSDS OEM + KIF med rundturskontroll av overensstemmelse (src/lunar_interop.rs)

seg-a697f4f424b8 = Representativitet for demonstrasjonen og register over gap til flyging (src/representativeness.rs)

seg-4c924153299d = Samlet evidens for avveining mellom kvante og klassisk (src/qtrade.rs)

seg-bd1a5835c5db = Feilmodellbibliotek for kvanteenheter (src/quantum_devices.rs)

seg-6b1bb731f966 = Pålitelig kvantetidssynkronisering: kjede fra ende til ende, sikker utsending, anomali + avveining (src/timetransfer_chain.rs)

seg-3332c6c1ae86 = GNSS-fri kvantenavigasjon (src/quantum_nav_od.rs)

seg-9b46a5add4ab = Feil-/anomalideteksjon for kvante-PNT-systemer (src/quantum_faults.rs)
