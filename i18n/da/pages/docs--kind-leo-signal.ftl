# docs--kind-leo-signal: translations (da)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-051999733048 = Kilde: <c1/>

seg-16ae2a08d3c8 = <c1/> (scenarietype)

seg-97b8d07150d4 = LEO-PNT-signaludformninger: parametriserede positionerings-, navigations- og tidssynkroniseringssignaler (PNT) i lav jordbane (LEO) for ethvert system, bånd og enhver struktur. Et SIGNAL er et bånd (centerfrekvens, sendebåndbredde, ITU-allokering RNSS/RDSS/MSS/EESS/non-RNSS/other) og komponenter (akkvisition, data, pilot; enhver delmængde), hver med en modulation (BPSK(n) med brøk-n, BOC(m,n), MBOC({ "6,1" },p) eller et fladt OFDM-lignende bånd), en effektandel, valgfrie FDMA-underbærebølgeforskydninger, en kodelængde og en datahastighed. Signalerne kommer fra indbyggede offentlige forudindstillingsfiler (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; hver med sin kilde-URL og hver ikke-offentliggjort værdi mærket REPRÆSENTATIV) eller skrives direkte i scenariet. PR. SIGNAL: den båndbegrænsede effektspektrale tæthed og den andel af hver komponents effekt, som sendebåndet slipper igennem (BPSK-lukket form ved siden af den numeriske værdi), RMS-båndbredden (Gabor), den termiske støjjitter i delay-lock-loopens kodesporing mod C/N0 og early-late-afstand ud fra den båndbegrænsede kohærente (eller ikke-kohærente) early-late-formel af Betz & Kolodziejski { "2009" } med dens lærebogsform for ubegrænset bånd og dens Gabor-grænse for forsvindende afstand, afstandsnøjagtigheden i meter, akkvisitionens søgerum (Doppler-intervaller ud fra banens maksimale Doppler plus oscillator- og brugerled, gange kodeintervaller), detektionssandsynlighed efter kvadratisk lov og den gennemsnitlige serielle og kodeparallelle akkvisitionstid, signalets spektrale separationskoefficient mod GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og E5 AltBOC og for hver af dem mod signalet med C/N0-forringelsen, samt den CW-, bredbånds- og tilpassede J/S, som den sporede komponent tåler, fra spektrumtypens egen SSC-maskineri. EN BÅNDAFVEJNING: førsteordens ionosfærisk forsinkelse ({ "40.3" } TEC/f^{ "2" }), fripladstab, afstandsnøjagtighed ved samme C/N0 og ved samme EIRP samt tolerance over for jammere. Valgfrie FORMKONTROLLER holder en udformnings spektrum op mod en beskrevet måling (MODELLED konsistens). VALIDATED: BPSK-effekten i båndet ({ "90.3" } % i hovedloben) og de lukkede former for Gabor-båndbredde, den båndbegrænsede jitter, der reduceres til lærebogens kohærente early-late-form og til dens Gabor-grænse, den forskudte BPSK's spektrale separationskoefficient mod dens lukkede form efter Parseval, AltBOC-spektrets enhedsareal og den maksimale LEO-Doppler mod de offentliggjorte værdier for Xona Pulsar (32-34 kHz) og Iridium ({ "36" } kHz). MODELLED: hver udformning, effektfordeling, C/N0- og jammerniveau; EFQPSK-, CSK- og OFDM-spektre er tilnærmede.

seg-37e5fdff9d4d = Én kørsel af <c1/> opsummeres som: scenarie leo-signal | { "5" } signaler | støjgulv -202.0 dBW/Hz | fineste afstandsbestemmelse generic-c-wide { "0.022" } m ved { "45.0" } dB-Hz

seg-b538d3ff9fdb = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-6aaf62f55e65 = Eksemplet <c1/> sætter blandt andet:

seg-9fd02351d844 = ms

seg-05e8854de548 = chip

seg-d12bc1d2b815 = kohærent

seg-0f29946fe4fb = Resultatmærkat (motorens egen): MODELLED: parametriserede signaludformninger til positionering, navigation og tidssynkronisering (PNT) fra lav jordbane (LEO), båndbegrænset til deres sendebåndbredde. De lukkede former nedenunder er VALIDATED (BPSK-effekt i båndet og Gabor-båndbredde, den båndbegrænsede early-late-kodesporingsjitter, der reduceres til textboo

seg-8bf45b6989d1 = Diagrammet, som motoren skriver for scenarios/leo-band-trade.toml, type leo-signal

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: sinusintegralet (sine_integral), BPSK-R-andelen af effekten inden for et dobbeltsidet bånd i lukket form (bpsk_power_in_band_closed_form), den båndbegrænsede BPSK-Gabor-båndbredde i lukket form (bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: den største satellit-Doppler ved en overflyvning lige over hovedet ved elevationsmasken for en cirkulær bane, v R_E cos(el) / (R_E + h) gange f / c, ud fra hver forudindstillings egen bærebølge og banehøjde; typen <c1/> tilføjer o

seg-e0a4f53c5a96 = <b>MODELLED</b> Typen <c1/>: parametriserede signaludformninger (bånd, sendebåndbredde, ITU-allokering; akkvisitions-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller flade spektre, effektandele, FDMA-underbærebølger, kodelængder og datahastigheder. Tests: <a1>leo_signal_reference.rs</a1>.

seg-9ca82c79430e = <b>MODELLED</b> Typen <c1/> udvidet ud over L-båndet: bånd angivet som en forudindstillet signaludformning (tegnet med hver komponent, båndbegrænset til sendebåndbredden, C/N0 og J/S henført til den sporede komponent) eller som en brugerdefineret bærebølge og modulation. Tests: <a1>leo_signal_reference.rs</a1>.

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: den største satellit-Doppler ved en overflyvning lige over hovedet ved elevationsmasken for en cirkulær bane, v R_E cos(el) / (R_E + h) gange f / c,. Uafhængig reference (ExternalDataset): Offentliggjorte værdier: Xona Pulsar X1 maksimal Doppler { "32" } til { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridium-Doppler op til +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Jordens rotation er udeladt, hvilket flytter værdien med op til omkring { "2.3" } kHz; begge offentliggjorte værdier nås uden den.

seg-1ab79cdbd269 = de præcise spektre for enhanced Feher QPSK, code shift keying og OFDM: en BPSK-envelope med rektangulære chips eller et fladt bånd træder i stedet, som hver forudindstilling angiver (resultat <c1/>)

seg-0561c3ed88fb = spredekodernes linjestruktur og krydskorrelationen mellem koder ved multipel adgang (resultat <c1/>)

seg-8b4df054a7b3 = sende- og modtagefiltrene ud over en ideel mursten-væg ved sendebåndbredden: ingen udstråling uden for båndet, ingen filtergruppeforsinkelse (resultat <c1/>)

seg-ad5f7cc4a439 = flervejsudbredelse, modtagerens kvantisering og automatisk forstærkningsstyring (resultat <c1/>)

seg-e38fc1a121ab = Jordens rotation i Doppler-grænsen (op til omkring { "0.46" } km/s afstandshastighed ved ækvator) (resultat <c1/>)

seg-32a132809a9b = ionosfærisk forsinkelse ud over første orden og fordelingen af elektronindholdet over og under en LEO-satellit: den skrå TEC er et input (resultat <c1/>)

seg-8189e06f4a56 = atmosfære-, regn- og polarisationstab: kun fripladstabet sammenlignes (regn har betydning i C-bånd) (resultat <c1/>)

seg-445cecb7370c = akkvisition ud over et enkelt integrationsvindue med en falskalarmstraf: ingen verifikationslogik med flere vinduer, en ensartet kodefase-apriori, det værst tænkelige tilfælde af straddling (resultat <c1/>)

seg-8eefe4197d7f = <s1>Forrige</s1>leo-pvt

seg-60423e1ed0ca = <s1>Næste</s1>link-budget
