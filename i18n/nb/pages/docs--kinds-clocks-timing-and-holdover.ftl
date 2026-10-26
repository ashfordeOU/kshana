# docs--kinds-clocks-timing-and-holdover: translations (nb)

seg-b03d56f501c3 = Type

seg-78cba87823f7 = Klokkens holdover mot spesifikasjonen; valgfritt Monte Carlo-ensemble (runs > { "1" }).

seg-cb0b7da83f5c = Diagrammet motoren skriver for scenarios/clock-ensemble.toml, typen clock

seg-c0924aa36e64 = MODELLED holdover-test av et system for tidssynkronisering, vurdert ut fra en tidsfeilregistrering som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-logg, en chrony tracking- eller statistikklogg, en TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns). Testen har fire trinn, og Kshana utfører ingen av dem: en låst GRUNNLINJE, GNSS FJERNET av operatøren (antennekabelen eller simulatorutgangen; Kshana sender ingenting og styrer ingenting) på et oppgitt tidspunkt, HOLDOVER på systemets egen oscillator, og GJENOPPRETTING etter at operatøren har gjenopprettet GNSS på et andre oppgitt tidspunkt. Registreringen deles ved disse to tidspunktene. Grunnlinje: tidsfeilstatistikk og ITU-T-maskene skrevet for en låst klokke. Holdover: statistikk, den relative frekvensavviket systemet holdt (en minstekvadraters linje), maskene skrevet for holdover eller en autonom klokke, ePRTC-A-holdoverenvelopen fra den oppgitte låste varigheten, og tiden til hvert tidsfeilbudsjett overskrides. Gjenoppretting: om og når |TE| kom innenfor et oppgitt bånd og ble der, toppen og det største trinnet. Hver grense er avskrevet fra en offentlig ITU-T-tabell (maskene for tidssynkronisering i telekommunikasjon); ordlyden er 'målt mot masken', og de to tidspunktene er operatørens opplysning, ikke verifisert. En registrering som er for kort for en maske er INCOMPLETE, aldri ekstrapolert. Se docs/TIMING-HIL.md.

seg-8ce93392747b = Diagrammet motoren skriver for scenarios/holdover-test-ptp4l.toml, typen holdover-test

seg-540545e6f846 = MODELLED kjede for pålitelig kvantetidssynkronisering: et budsjett for tidsoverføring fra ende til ende for kvante (optisk gitterklokke + sammenfiltring/enkeltfotonlenke) mot klassisk (CSAC + toveis RF), et gjenbrukt beskyttelsesnivå for tidssynkronisering + et kvalitetsmål for sikkerhet mot forsinknings- og replay-angrep (1-P_md), en sannsynlighet for deteksjon av klokkeanomali + CUSUM-latens, og avveiningen mellom kvante og klassisk som ærlig TradeEvidence med en post for representativitet og gap til flyging. Illustrative parametere for enhet og lenke fra offentlige kilder; modellerer klassen, ingen TRL, ingen flyging og ingen sertifisering påstås.

seg-09760f892c7b = Diagrammet motoren skriver for scenarios/quantum-time-transfer.toml, type quantum-time-transfer
