# docs--security: translations (nl)

seg-4609cf7fb790 = Beveiligingsbeleid

seg-ff991a587e4b = Bron: <c1/>

seg-7315b27c34f8 = Een kwetsbaarheid melden

seg-2f06a8b277b7 = Meld het privé, via een van beide routes:

seg-31999fe1b838 = <b>Privé melden van kwetsbaarheden via GitHub</b>: de knop <em>Report a vulnerability</em> op het <a1>tabblad Security</a1> van de repository. De melding is alleen zichtbaar voor de maintainers, en een oplossing kan in een privé-fork worden voorbereid en als GitHub Security Advisory worden gepubliceerd.

seg-7bdcc2ffe39e = <b>E-mail</b>: <b><a1>contact@ashforde.org</a1></b>, met details en reproductiestappen.

seg-fbc3db22c061 = Open geen openbare issue voor veiligheidsgevoelige meldingen. Wij streven ernaar binnen enkele werkdagen de ontvangst te bevestigen.

seg-4c11dabdd8f6 = Ondersteunde versies

seg-19c99cf3a67e = Vóór 1.0: alleen de nieuwste getagde release wordt ondersteund.

seg-1379eab9a8e3 = Geheugenveiligheid

seg-cf966fa35408 = De bibliotheekcrate declareert <c1/> in de crate-root (<c2/>), zodat een <c3/>-blok, fn, impl of extern ergens in de bibliotheek een compileerfout is en niet iets wat een reviewer moet opmerken. Het attribuut staat niet achter een <c4/>, dus het geldt voor elke configuratie waarin de bibliotheek wordt geleverd, en alle drie compileren er zonder problemen onder: de standaard Rust-build, de Python-extensiemodule (<c5/>) en de WebAssembly-module (<c6/>).

seg-3f9e707e7d0b = Het bereik, precies gesteld, omdat <c1/> per crate geldt:

seg-e7e22e711c53 = Het geldt alleen voor de bibliotheekcrate. De CLI-binary (<c1/>), de hulpbinaries onder <c2/>, de afzonderlijk gepubliceerde crate <c3/> en de buiten de workspace gehouden kruisvalidatiecrates <c4/> zijn afzonderlijke crate-roots en vallen er niet onder. Geen van hen bevat vandaag <c5/>, maar dat is discipline, geen door de compiler afgedwongen eigenschap.

seg-b8f1e374d873 = Het zegt niets over afhankelijkheden. Die worden afzonderlijk bewaakt door <c1/> in CI, voor de root-crate en, als eigen job, voor de buiten de workspace gehouden MCP-servercrate, en gevolgd via Dependabot-meldingen en beveiligingsupdates op de repository.

seg-df3008a05522 = Opmerking over exportcontrole en dual-use

seg-0782e60d11fa = PNT-veerkracht en kwantumsensing kunnen onder dual-use-exportcontroles vallen. Deze openbare repository is beperkt tot generieke, gepubliceerde modellen en methoden. Draag hier geen exportgevoelig detail over veerkracht of anti-spoofing bij; dat hoort in een privé-overlay. Twijfelt u, stuur dan eerst een e-mail.

seg-f6bb0582f6f2 = <s1>Vorige</s1>Licenties

seg-834cbd4e96d3 = <s1>Volgende</s1>Bijdragen
