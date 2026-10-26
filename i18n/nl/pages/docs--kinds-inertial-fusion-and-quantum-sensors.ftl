# docs--kinds-inertial-fusion-and-quantum-sensors: translations (nl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-ec26df467b88 = Gezamenlijke Kalman-sensorfusie voor PNT op dezelfde hybride invoer.

seg-c8a1c797f4b1 = De grafiek die de engine schrijft voor scenarios/fusion-pnt.toml, soort fusion

seg-38df285a3f25 = Los en strak gekoppelde GNSS/INS-error-state-EKF.

seg-7d993b676006 = De grafiek die de engine schrijft voor scenarios/gnss-ins.toml, soort gnss-ins

seg-c6edf89eb8d4 = Hybride kwantum+klassieke strak gekoppelde GNSS/INS-UKF met 17 toestanden (MODELLED): { "15" } INS-foutentoestanden + een door CAI afgeleide correctie van de accelerometerbias + een klok met 2 toestanden (fase+frequentie) uit de klokengine met q-parameters, aangedreven door het ingekaderde CAI-foutmodel. De kwaliteitsmaat is de zelfconsistentie van het filter (NEES + innovatiewitheid tegen χ²-grenzen): een uitspraak over zelfconsistentie, GEEN garantie voor nauwkeurigheid in de praktijk. Alleen simulatie; geen TRL>{ "3" }, geen vluchterfgoed, geen externe validatie.

seg-2968660fa880 = De grafiek die de engine schrijft voor scenarios/hybrid-ukf.toml, soort hybrid-ukf

seg-22cd963c7042 = Hybride PNT-slotsteen: klok + IMU + ondersteuning met tijdoverdracht.

seg-52378a7b074c = De grafiek die de engine schrijft voor scenarios/hybrid-pnt.toml, soort hybrid

seg-bdedf28adc48 = 1-DOF-inertiële koppelnavigatie tijdens een GNSS-uitval.

seg-873c402bb724 = De grafiek die de engine schrijft voor scenarios/imu-deadreckoning.toml, soort inertial

seg-5b9a6efe6337 = Foutmodel voor INS/TRN-uitloop: positiefout tegen uitloopduur, opgebouwd uit IMU-coëfficiënten in plaats van gesweept als aangenomen driftsnelheid. Vijf groeibijdragen — accelerometerbias, gyrobias-kanteling via de zwaartekracht, velocity random walk, angle random walk en schaalfactor tegen de afgelegde afstand — elk gepropageerd door een inertiaal foutmodel met negen toestanden in het lokale horizontale vlak met Schuler-terugkoppeling op een vermelde breedtegraad en hoogte (de leidende-orde-wetten voor korte uitloop t², t³, t^{ "1.5" }, t^{ "2.5" } en t¹/t² worden ernaast gerapporteerd) en gecombineerd volgens een VERMELDE regel (wortel uit de som van kwadraten als standaard, of lineaire som, of deterministische som met stochastische rss; alle drie worden bij elke run berekend, zodat de keuze zichtbaar is in plaats van begraven). De uitloopduren waarbij door de aanroeper opgegeven positiedrempels worden bereikt ({ "10" } m en { "50" } m als standaard) worden gevonden met de bestaande bisectie van de engine, elk met een uitsplitsing per bijdrage die de dominante bron noemt, en het kruispunt van elke afzonderlijke bijdrage wordt bovendien algebraïsch geïnverteerd zodat beide overeenkomen. Een modus voor terreinrelatieve navigatie begrenst de uitloop met periodieke positiebepalingen en rapporteert het grootste interval tussen positiebepalingen dat elke drempel houdt; een positiebepaling met alleen positie laat snelheidsfout en kanteling over de positiebepaling heen bestaan, dus ze begrenst de uitloop niet altijd bij enige frequentie van positiebepalingen, en het rapport zegt dat in plaats van een nul terug te geven. MODELLED: de coëfficiënten van de IMU-klasse zijn representatieve bandcijfers, geen datasheet, en het residu van de terreinpositiebepaling is een invoer. Een niet bereikte drempel wordt gerapporteerd als null met een status, nooit als nul. Geen gecertificeerd prestatieproduct voor inertiële navigatie.

seg-134a4c91da3a = De grafiek die de engine schrijft voor scenarios/ins-trn-coast.toml, soort ins-trn-coast

seg-04310cd6cbec = MODELLED detectie van storingen/anomalieën voor kwantum-PNT-systemen: een gelabelde storingencatalogus (klokfrequentiesprong/-drift/-lockverlies; sensorbiasstap/-uitval), een ROC AUC van de detectiestatistiek (met een bootstrap-betrouwbaarheidsinterval uit de extern getoetste eval_stats) en een minimaal detecteerbare storing bij een vaste valse-alarmkans, waarbij de door een kwantumklok ondersteunde monitor (minder ruis) kleinere storingen detecteert — als eerlijke TradeEvidence + representativiteit. Gaussiaans model van de detectiestatistiek (AUC = Phi(mu/(sigma*sqrt2))); modelleert de klasse, illustratieve parameters uit openbare bronnen, geen TRL, geen vluchtervaring, geen certificering.

seg-2f1d14239d1a = De grafiek die de engine schrijft voor scenarios/quantum-anomaly-detect.toml, soort quantum-anomaly-detect

seg-790fbfdd80f0 = MODELLED GNSS-vrije kwantumnavigatie: tijdens een GNSS-uitval een inertiaal budget van een kwantumsensor (koudeatoominterferometer) tegenover een klassiek INS van navigatiekwaliteit — groei van de positiefout over de uitloopperiode, holdover tot een positiedrempel, en de afweging quantum tegenover klassiek als eerlijke TradeEvidence met representativiteit. Eerlijke opmerking over waarneembaarheid: zonder externe positiebepaling is de accelerometerbias niet waarneembaar, dus de fout groeit; de kwantumsensor vertraagt dit, maar sluit die kloof niet. Illustratieve apparaatparameters uit openbare bronnen; modelleert de klasse, geen TRL, geen vluchtervaring, geen certificering.

seg-1bdbf1a737b2 = De grafiek die de engine schrijft voor scenarios/quantum-gnss-free-nav.toml, soort quantum-gnss-free-nav

seg-eb55d253dd11 = Afweging van PNT quantum tegenover klassiek ({ "13503" }): voordeel in holdover van tijdsynchronisatie + inertiale holdover van een kandidaatklok (een gemeten ADEV-curve — het scharnierpunt voor verdedigbaarheid — of een kwantumklokklasse) tegenover een klassieke basislijnklasse, met het voorbehoud over de aanname van de lange-tau-ondergrens meegegeven op het artefact, plus een GNSS-ontzegde envelop van veerkracht tegenover tijd. MODELLED; kwantificeert (valideert nooit) een apparaat van een partner. De kandidaatklok is een gemeten curve (<c1/> + <c2/>, even lang, minstens { "2" } punten; zij wint wanneer beide vormen zijn gegeven) of een <c3/>.

seg-c74c63ffd859 = De grafiek die de engine schrijft voor scenarios/quantum-trade.toml, soort quantum-trade
