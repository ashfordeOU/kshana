# docs--kind-aocs: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-5cd8b3d8c098 = Källa: <c1/>

seg-7f2ade997df5 = <c1/> (scenariotyp)

seg-7eff466eb018 = Rymdfarkosters attitydstyrning: en tröghetspekande vridning av en stel hubb med tre eller fler balanserade reaktionshjul under MRP-återkoppling (L = -K sigma - P omega), minimumnorm-vridmoment för hjulen begränsade till varje motors gräns, RK4 med nollte ordningens hållning; eventuellt sluten med ett multiplikativt EKF från ett simulerat gyro (vinkel- och hastighetsslumpvandring) och en stjärnkamera. Redovisar insvängningstid, slutligt och maximalt pekfel, maximalt hjulvarvtal och vridmoment, den mättade andelen, drift i rörelsemängdsmoment och, med estimatorn, dess attitydfel och NEES. Slingan för det sanna tillståndet är VALIDATED mot Basilisk { "2.9.1" }; estimatorn är MODELLED.

seg-a499721d08b1 = En körning av <c1/> sammanfattas som: aocs: { "4" } hjul, { "600" } s vridning från { "82.06" } deg -> sätter sig under { "0.1" } deg vid { "481.0" } s | slutligt { "2.37e-2" } deg | maximalt hjul { "1797" } rpm | slinga för sant tillstånd

seg-2ad4d3f07a6a = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-ed0c5c6266d9 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-a09eb69b36d7 = Exemplet <c1/> anger bland annat:

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-b054c73f22e5 = inget värde

seg-6e22c97374b0 = Resultatetikett (motorns): VALIDATED styrlag och hjuldynamik (mot Basilisk { "2.9.1" } på slingan för sant tillstånd); den här körningens indata är scenariots egna — attitydstyrning med reaktionshjul under MRP-återkoppling, tröghetspekning, inget sensorbrus, ingen friktion

seg-08c624d5324d = Diagrammet som motorn skriver för scenarios/aocs-slew.toml, typ aocs

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-d69a588facf1 = <b>VALIDATED</b> Tröghetspekande attitydstyrning av en stel hubb med tre eller fler balanserade reaktionshjul: MRP-återkopplingslagen L_r = -K sigma_BR - P omega_BR (Schaub och Junkins), minimumnorm-motormoment för hjulen G_s u = -L_r begränsade till varje hjuls l Tester: <a1>aocs_basilisk_oracle.rs</a1>.

seg-7bc495b05d9a = <b>MODELLED</b> Det multiplikativa EKF:et av Lefferts-Markley-Shuster: attitydfel i kroppsfast system och gyrobiastillstånd, propagering med gyrohastigheten minus biasskattningen och Farrenkopfs diskreta processbrus (vinkel- och hastighetsslumpvandring), uppdatering från stjärnkamera

seg-7e3e0dcc936f = <b>VALIDATED</b> Tröghetspekande attitydstyrning av en stel hubb med tre eller fler balanserade reaktionshjul: MRP-återkopplingslagen L_r = -K sigma_BR - P omega_BR (Schaub och J. Oberoende referens (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; bsk-hjulkörningen som ett separat verktyg, aldrig länkat eller inkluderat i källkoden): rymdfarkostens hubb, reactionWheelStateEffector (BalancedWheels, vridmomentsgräns på), simpleNav, inertial3D, attTrackingError, mrpFeedback (ingen integralterm) och rwMotorTorque vid dt = { "0.1" } s med dess RK4, mot Kshanas egen implementering i tre fall (tre ortogonala hjul; en fyrhjulspyramid; ett mättande fyrhjulsfall),

seg-d7889856073b = <b>MODELLED</b> Det multiplikativa EKF:et av Lefferts-Markley-Shuster: attitydfel i kroppsfast system och gyrobiastillstånd, propagering med gyrohastigheten minus biasskattningen och Farre. Oberoende referens (InternalConsistency): Inre samstämmighet: filtrets normaliserade skattningsfel i kvadrat mot sanning simulerad från samma sensormodeller över Monte Carlo-frön, och konvergens hos attityd- och biasskattningarna. VAD SOM INTE GÖR DET: ingen extern estimator eller flygdata har jämförts (Basilisk { "2.9.1" } har ingen MEKF-modul); sensormodellerna är lärobokens, utan snedställning, skalfaktor eller effekter av stjärnkamerans synfält.

seg-3b71575e0c23 = Slingan för det sanna tillståndet är VALIDATED mot Basilisk { "2.9.1" }; estimatorn är MODELLED. (typkatalog (<c1/>))

seg-c7ff0ddbd040 = Multiplikativ EKF-attitydskattning från ett gyro och en stjärnkamera är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-cc4e7274d409 = Ämnessida: <a1>AOCS.md</a1>

seg-b022bad77259 = <s1>Föregående</s1>acm-link

seg-1fb6e680fd4a = <s1>Nästa</s1>aperture-duty-cycle
