# docs--clock-log-formats: translations (nl)

seg-ca2fcdd60f65 = Bron: <c1/>

seg-0dfd1160c5d7 = Klokloggegevensformaten

seg-f52a62872493 = <c1/> leest een gemeten klokloggegevensbestand in tot één genormaliseerde fasereeks: een uniform raster van samples <c2/>, met het steekproefinterval <c3/> opgegeven of gevonden, elk hiaat geteld en de eenheden van het log benoemd. Er worden acht formaten gelezen, elk een gedocumenteerde deelverzameling. Alles buiten die deelverzameling wordt geweigerd met een fout die benoemt wat is aangetroffen, in plaats van bij benadering te worden gelezen.

seg-dbdbfec37ab6 = <b>Afkortingen.</b> RINEX is het Receiver Independent Exchange Format. TICC is de tijdintervalteller van TAPR (Tucson Amateur Packet Radio). ADEV is de overlappende Allan-deviatie, TDEV de tijdsdeviatie en MTIE de maximale tijdintervalfout. <c1/> is het steekproefinterval in seconden.

seg-1d5a6c2090af = Waar een log kan worden gebruikt

seg-2a391645eeeb = <b><c1/></b>: <c2/> in plaats van <c3/> of <c4/>. De fase van het log, in ns, is de tijdfoutreeks die aan de maskers wordt getoetst, en het rapport krijgt een blok <c5/> dat zegt hoe het is gelezen.

seg-4c2a67008451 = <b>Het type clock</b>: een tabel <c1/> voegt een blok <c2/> aan de run toe: hoe het log is gelezen, de SHA-256 van de tabel (<c3/>; de <c4/> van de run omvat de tabel niet) en van de fasesamples, en de overlappende ADEV, TDEV en MTIE bij octaafmiddelingsfactoren. Hiervoor is <c5/> nodig. De gesimuleerde holdover is ongewijzigd.

seg-2f464fe709c9 = Zonder de tabel worden beide typen geparst, gehasht en gerapporteerd zoals voorheen.

seg-c931c5ec2f4a = De formaten

seg-0b758195e7eb = <b><c1/></b>: ASCII-fase- of frequentielogs in TimeLab-stijl, de platte tekstvorm die TimeLab exporteert en die de ASCII-import ervan en Stable32 lezen. Er staat één meting per regel: ofwel één kolom met een uniforme <c2/>, ofwel twee kolommen <c3/>. Kolommen kunnen worden gescheiden door witruimte, komma's of puntkomma's.

seg-a7ae9e712bea = Regels die beginnen met <c1/>, <c2/> of <c3/> zijn commentaar. Een commentaar van de vorm <c4/> (of <c5/>) stelt <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> of <c12/>, voor fase), <c13/> (<c14/> of <c15/>) of <c16/> (<c17/> of <c18/>, voor de eerste van twee kolommen) in.

seg-84cf463d5e74 = Eén voorafgaande niet-numerieke regel wordt als kolomkop beschouwd.

seg-84f4b59bcdbf = Frequentiegegevens (fractionele frequentie) worden alleen als enkele kolom geaccepteerd. Ze worden geïntegreerd tot fase als <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = De binaire en <c1/>-projectbestanden van TimeLab worden niet gelezen.

seg-3af6e4e7bc73 = Regels in timestampmodus (<c1/>, <c2/>) en het pseudo-timestampkanaal van de TimeLab-modus (<c3/>) zijn tijdstempels van gebeurtenissen. De fase van het gekozen kanaal is zijn tijdstempel min de nominale tik: <c4/>, waarbij <c5/> het gehele aantal <c6/> sinds de eerste gebeurtenis is. Een gemiste gebeurtenis is een hiaat.

seg-cecf9df4ff10 = Regels in intervalmodus (<c1/>, of elk label dat met <c2/> begint) worden rechtstreeks als fase gelezen, één meting per <c3/>. Het scenario moet <c4/> opgeven, omdat de regel geen tijd bevat.

seg-5ec2509907dd = Regels die met <c1/> beginnen en regels die niet <c2/> zijn (zoals het opstartmenu) worden overgeslagen en geteld.

seg-cb4b7062dd5a = logs van linuxptp en chrony

seg-c6c70813a988 = Deze vijf formaten lezen wat een draaiende tijddaemon over zijn eigen klok schrijft. Ze dienen om achteraf een tijdsynchronisatieketen te controleren (een boundary clock, de PHC van een grandmaster, een chrony-client) met dezelfde schatters als de andere logs. Ze lezen geen configuratie van een daemon, en niets hier communiceert met een daemon.

seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: de servoregels van linuxptp, waarbij elk formaat alleen regels van zijn eigen programma leest. Een meting is een regel van de vorm

seg-e32842403b6b = De tijdstempel is de eerste <c1/> in de regel (de monotone klok van de daemon). Hij wordt ook gelezen na een syslog-voorvoegsel, waarbij een proces-id zoals <c2/> geen fractie heeft en niet wordt overgenomen.

seg-72678cd6c03e = De fase is de gelogde <c1/>, in nanoseconden, omgerekend naar seconden. Het is de door de daemon gemeten tijdfout van zijn slave-klok ten opzichte van zijn referentie, zoals gelogd: positief als de slave voorloopt. Het is de fout die onder servoregeling overblijft, niet de drift van een vrijlopende klok.

seg-f9080412572a = De woorden tussen de tijdstempel en <c1/> benoemen de bron (<c2/>, <c3/> voor een voorvoegsel <c4/>, <c5/>, <c6/>). Een log met meer dan één bron heeft <c7/> nodig; de fout somt ze op.

seg-5bef874341f2 = Metingen voordat de servo voor het eerst <c1/> (vergrendeld) meldt, worden weggelaten en geteld in <c2/>: <c3/> en <c4/> zijn de ontgrendelde toestand en de staptoestand, waarvan de offsets overgangsverschijnselen bij het invangen zijn. Een servo die <c5/> nooit bereikt, wordt geweigerd. Een regel zonder toestandsveld wordt gelezen zoals hij is.

seg-121fbe1486cf = Samenvattingsregels (<c1/>), berichten <c2/> en <c3/> en regels van andere programma's worden overgeslagen en geteld.

seg-92164f4a56be = Tijdstempels die teruglopen (een herstarte daemon) worden geweigerd; splits het log.

seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: de bestanden <c3/> en <c4/> van chrony, gelezen op kolompositie. Een meting is een regel met ten minste { "14" } kolommen (tracking) of { "13" } (statistics) die begint met een UTC-datum en -tijd van de vorm <c5/>. De regel met kolomkoppen wordt overgeslagen en geteld; de <c6/>-lijn eronder wordt overgeslagen zonder te worden geteld.

seg-bae4f6895d14 = Tracking: kolom { "7" }, de lokale offset bij de klokupdate, in seconden. Het IP-adres of de referentie-id verandert met de geselecteerde bron, dus zonder <c1/> wordt elke regel als één lokale klok gelezen. <c2/> houdt één referentie-id aan.

seg-12b284cd7d8c = Statistics: kolom { "5" }, de geschatte offset van een bron, in seconden. Er is één reeks per bronadres, en het log heeft <c1/> nodig als het er meer dan één bevat.

seg-197645e3c7c5 = Tijdstippen zijn seconden vanaf 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, zonder verwerking van schrikkelseconden. Chrony schrijft een regel per update of per bronsample, dus de tussenruimte is niet uniform. <c1/> is de mediane tussenruimte; een meting binnen een halve <c2/> na de laatst bewaarde wordt weggelaten en geteld in <c3/>, en een grotere tussenruimte is een hiaat, dat <c4/> meldt. Geef <c5/> en <c6/> op voor een log met een vast pollinginterval.

seg-61fbb0479c95 = De kolommen van chrony en de regelindelingen van linuxptp zijn die uit de openbare documentatie van de daemons. De fixtures in <c1/> zijn voor Kshana geschreven met verzonnen waarden (zie de <c2/> ervan); er is geen echt log gelezen, dus een indeling die tussen daemonversies verschilt, kan nog steeds worden geweigerd of verkeerd gelezen. Een regel die niet overeenkomt, wordt overgeslagen en geteld, nooit geraden.

seg-b120a37b7d60 = <c1/> en hiaten

seg-6fd68aad2fd7 = Als het log tijdstempels bevat en er geen <c1/> is opgegeven, is <c2/> de mediane tussenruimte van opeenvolgende tijdstempels, afgerond op vier significante cijfers, en wordt de bron gemeld als <c3/>. De tussenruimte van een teller wijkt van de nominale af met de frequentie-offset van de referentie, ten hoogste delen op { "10" }^{ "6" }. Een <c4/> in het scenario wint altijd (bron <c5/>), daarna een commentaar <c6/> in de header (bron <c7/>).

seg-59e52611a7d3 = Samples worden op het raster <c1/> geplaatst, en een ontbrekend tijdstip is een hiaat. Metingen die meer dan { "1" } % van <c2/> naast het raster liggen, worden weggelaten en geteld, evenals duplicaten (de eerste blijft). Het hiaatbeleid is een van de volgende:

seg-61b1664a7c48 = <c1/> (de standaard): elk hiaat is een fout die de hiaten telt;

seg-593c998b65e0 = <c1/>: houd de langste hiaatvrije reeks;

seg-f184ce746389 = <c1/>: vul interne hiaten door lineaire interpolatie en meld het aantal gevulde.

seg-1f3dc3429615 = De schatters hebben een hiaatvrije opname nodig, en daarom worden hiaten hier opgelost.

seg-0f061f726ec5 = <s1>Vorige</s1>Holdovertest en tijdsynchronisatiehardware in de lus

seg-3c89cfcbbd04 = <s1>Volgende</s1>Hardwareveiligheid

seg-9b52cd5eb4be = tau0 en hiaten
