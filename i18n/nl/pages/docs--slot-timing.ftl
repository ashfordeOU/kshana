# docs--slot-timing: translations (nl)

seg-3a0e724a8a2b = Tier

seg-fffbeccd4266 = Symbool

seg-2247a2344710 = Betekenis

seg-f917e7fcac09 = Wat het is

seg-adc34608c46b = Klasse

seg-f63dd3d7aad4 = Bron

seg-1ff32b87e030 = Satellieten

seg-582fd72f1a1a = Oordeel

seg-430edd66bda0 = Niet gemodelleerd

seg-f23c8bd5f203 = Bron: <c1/>

seg-1f2727dc4ca4 = De scenariosoort <c1/> beantwoordt drie vragen voor een klok die vrij loopt tussen synchronisaties en het verkeer binnen een <b>tijdgeïndexeerd slot</b> moet houden: een routerings-, taak- of contactslot waarvan de <b>guard</b> de grootste absolute tijdfout is, aan beide zijden, waarbij het slot nog werkt.

seg-6b39d8afeb5d = <b>Wanneer bezwijkt de guard?</b> Seconden vanaf de laatste positiebepaling tot de voorspelde tijdfout de guard bereikt, met elke bijdragende term afzonderlijk vermeld en de dominante benoemd.

seg-60476d723e1a = <b>Hoeveel tijd is er nu nog?</b> Dezelfde maat min de tijd die al is verstreken sinds de synchronisatie.

seg-84010982db35 = <b>Hoe vaak moet de klok zich laten synchroniseren?</b> Het grootste interval tussen synchronisaties dat de fout binnen de guard houdt, na aftrek van de latentie voordat een synchronisatie van kracht wordt.

seg-3388d46925f1 = Een optionele sectie <c1/> voegt het timing protection level (TPL) toe voor een ontvanger in een baan; zie <a1>Een ontvanger in een baan spoofen</a1>.

seg-2eb266d992b0 = Voer het meegeleverde voorbeeld uit met <c1/>.

seg-624e7a70c4f6 = Afkortingen: GNSS, Global Navigation Satellite System; TCXO, temperatuurgecompenseerde kristaloscillator; OCXO, oventgestuurde kristaloscillator; RAFS, rubidium-atoomfrequentiestandaard; CSAC, atoomklok op chipschaal; USO, ultrastabiele oscillator; DSAC, atoomklok voor de diepe ruimte; ADEV, Allan-deviatie; FM, frequentiemodulatie (hier: ruis op de frequentie van de klok); PM, fasemodulatie (ruis op zijn fase); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, de Telecommunication Standardization Sector van de International Telecommunication Union; TIE, tijdintervalfout; MTIE, maximale tijdintervalfout; TDEV, tijddeviatie; max|TE|, maximale absolute tijdfout; CUSUM, detector voor verandering op basis van cumulatieve som; TPL, timing protection level; LEO, lage baan om de aarde; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (een IEEE Transactions); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, de GPS Block II Follow-on-satellieten; SHA-256, het 256-bit Secure Hash Algorithm; PPS, puls per seconde.

seg-f2a0c73ef648 = Het foutmodel

seg-6bc3f9e78346 = De voorspelde tijdfout na <c1/> seconden doorlopen vanaf een synchronisatie is

seg-3fbb186c716a = dekkingsfactor ({ "3" } is ongeveer { "99.7" } % van een Gauss-fout)

seg-883965151598 = tijdfout van één sigma van de synchronisatie

seg-b63c0447865f = fout van één sigma van de frequentie die bij de synchronisatie bekend is; een frequentie geschat over een venster <c1/> draagt ongeveer <c2/>

seg-ab28fc69d3ac = variantie van witte faseruis: jitter van de tijdfout, een constante ondergrens

seg-8792541a7b6d = dichtheden van witte, random-walk- en random-run-FM (de van-Loan-termen van <c1/>)

seg-5d36b32c4de8 = flicker-FM-ondergrens van de Allan-variantie

seg-65da5a90685f = resterende fractionele frequentie-afwijking na de synchronisatie

seg-816e427d51f9 = frequentie-afwijking door een temperatuurverandering <c1/> via de temperatuurcoëfficiënt <c2/>

seg-e23d0ac960aa = lineaire verouderingssnelheid

seg-43e5f75b369c = Elke FM-term is gelijk aan <c1/> voor zijn eigen ruistype, met <c2/> (Zucca en Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Voor witte, random-walk- en random-run-FM is die relatie exact. Voor flicker-FM is het de gangbare schatting van de fout in de tijdvoorspelling (Riley, NIST SP { "1065" }): flicker-FM heeft zonder laagfrequente afkap geen gesloten vorm. De frequentie-afwijkingen tellen in grootte op omdat hun tekens onbekend zijn, dus het deterministische deel is een ongunstigste geval. Elke term is niet-negatief en niet-dalend in <c3/>, dus <c4/> heeft één wortel, gevonden door insluiten en bisectie.

seg-f9038fba23e2 = Waar de klok vandaan komt

seg-5c44b2f8d015 = Scenariosleutel

seg-cb92ae98c231 = Standaard van de klasse

seg-7594664253f2 = één geciteerde ADEV van één seconde en een roodruisondergrens die twee en vier decaden eronder is gesynthetiseerd

seg-794e4932b470 = MODELLED: het antwoord voor een stabiele klok wordt bepaald door de aangenomen ondergrens

seg-5ea820aaa69f = Datasheet-voorinstelling

seg-c943490619f3 = de voorinstellingen voor telecomtijdsynchronisatie (<c1/>, <c2/>, <c3/>, <c4/>), elk een benoemde Microchip-datasheet

seg-a20353d50011 = MODELLED: een envelop van datasheetmaxima

seg-b543f3dcd11a = Inline datasheet

seg-4983ec096617 = de eigen ADEV-tabel, veroudering en temperatuurcoëfficiënt van de klant

seg-b079bca8a611 = MODELLED: een envelop van de opgegeven maxima

seg-119d94700cab = Gemeten record

seg-ae6835f0c3c5 = een faserecord; zijn overlappende ADEV wordt gefit met gewogen kleinste kwadraten

seg-6e1c4702186d = de inversie is VALIDATED op een achtergehouden echt record (hieronder)

seg-f4cc2be238b7 = De drie klassen die in { "0.28.0" } zijn toegevoegd, citeren elk één openbare datasheet:

seg-47f6ddc3bd02 = ADEV van één seconde

seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, kolom basis-TCXO

seg-becbff195fff = Microchip OX-208-datasheet, Rev 12-1-2021

seg-19d8d32203f6 = Microchip 8040C Rubidium Frequency Standard-datasheet, DS00003047A

seg-48babc170b93 = De rijen van EndRun met lange middelingstijden convergeren over die tabel ({ "4e-13" } voor elke oscillator behalve de TCXO, { "8e-13" }, bij { "10 000" } s, en { "6e-14" } voor alle bij { "100 000" } s), wat erop wijst dat ze het gedisciplineerde product beschrijven en niet de vrij lopende oscillator, dus ze worden niet gebruikt.

seg-85c7211bb49b = <b>De recordfit is gewogen.</b> Een schatting van de Allan-variantie met <c1/> equivalente vrijheidsgraden heeft een variantie van ongeveer <c2/>, dus elk punt gaat erin met residu <c3/>. Een ongewogen fit liet de korte middelingstijden over de termen voor lange middelingstijden beslissen: op een testrecord met witte FM leverde die een valse flickerondergrens op die een doorbraak na { "2 000" } s met { "30" } % verkortte. Een datasheet of record ondersteunt alleen middelingstijden tot zijn langste punt; een doorbraak daarbuiten wordt gemarkeerd als <c4/>.

seg-5b61a42c76c2 = Toetsing: de inversie op een achtergehouden echte klok

seg-2220a1490923 = <c1/> gebruikt het record van { "556" } 990 samples van een 5071A-caesiumstandaard, gemeten tegen een waterstofmaser (A. Wallin, verspreid met <c2/>; hetzelfde record dat de schatterreferentie <c3/> gebruikt). Met de maser als referentie is het record een vrije run van 6.4 dagen.

seg-9bae4571f67c = Fit het ruismodel alleen op het <b>eerste derde</b> van het record.

seg-15b2cb621db7 = Voorspel met dat model de doorlooptijd waarop de tijdfout van één sigma { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } en { "2.5" } ns bereikt.

seg-1bd9ac435bfa = Laat op de <b>andere twee derden</b> de klok elke { "997" } s vanaf een synchronisatiepunt doorlopen, met de frequentie geschat uit het voorafgaande derde, en meet waar de effectieve waarde (RMS) van de doorloopfout elke drempel bereikt.

seg-d7640a2ec444 = De drempel voor slagen, vastgelegd voordat de test voor het eerst draaide, is dat elke voorspelde doorbraak binnen een factor { "1.5" } van de gemeten doorbraak ligt. Een controle, de ADEV van één seconde gelezen als witte FM, moet die drempel niet halen, zodat de drempel een goed model van een slecht model kan onderscheiden. De test toont zijn tabel; een mutatie die het witte-FM-niveau halveert, laat hem falen. Het ruwe record bestaat uit door git genegeerde gegevens van derden: <c1/> haalt ze op, en de workflow <c2/> draait de test met <c3/>, zodat een ontbrekend bestand daar faalt in plaats van wordt overgeslagen.

seg-3d11f7c6d4ab = Wat dit toetst: het pad van fitten en dan inverteren, op een atoomstandaard die door witte FM wordt gedomineerd, over doorlooptijden tot ongeveer { "50 000" } s. Wat het niet toetst: de bronnen van datasheet en klasse, de deterministische termen en een kristaloscillator (volgende sectie).

seg-bfcc5555ed50 = Dezelfde voorspelling op een echte kristaloscillator: conservatief, niet getoetst aan een externe referentie

seg-b77b3f503ca2 = <c1/> gebruikt een gemeten OCXO: { "19 982" } frequentiemetingen van één seconde van de oscillator van { "10" } MHz in een HP-impedantieanalysator, tegen een waterstofmaser (A. Wallin, { "2015" }, verspreid met <c2/>; <c3/>). Het ruismodel en een lineaire drift worden gefit op het eerste derde; elke doorloop op de andere twee derden start vanaf een frequentie geschat over de voorafgaande { "100" } s, en het model draagt de onzekerheid van die schatting (<c4/>, de eigen Allan-deviatie van het model bij { "100" } s).

seg-e05821406c28 = Gefit op

seg-c70aadbd47d4 = Voorspelde ÷ gemeten doorbraak, { "0.2" } tot { "10" } ns

seg-d71582148b20 = Lezing

seg-dcc3fd23bede = het eerste derde (achtergehouden)

seg-f9bb286f5868 = { "0.59" } tot { "0.70" }

seg-612784f70090 = conservatief: nooit later dan gemeten, meestal buiten de drempel van { "1.5" }

seg-121fa832c30f = het evaluatiesegment zelf (diagnostisch)

seg-b4be9afa69ac = { "0.98" } tot { "1.17" }

seg-75e1515b970a = de inversie klopt; het verschil bij het achtergehouden deel is de oscillator die verandert

seg-c91da69e9c09 = De ruisondergrens van de oscillator is tijdens het record gehalveerd: de Allan-deviatie van het eerste derde vlakt af bij ongeveer { "7.5e-12" }, de rest bij ongeveer { "3.5e-12" }. Een model dat vroeg is gefit, overschat de ruis, en dat is de veilige richting. <b>Het kristalgeval is daarom niet getoetst aan een externe referentie en blijft MODELLED.</b> Fit voor een kristal op een gestabiliseerd record en fit opnieuw naarmate het onderdeel veroudert.

seg-6230fed0e164 = <b>Hoe het protocol is gekozen, vermeld omdat het niet blind was.</b> Een eerste verkennende run hergebruikte het caesiumprotocol (frequentie uit het voorafgaande derde, geen frequentieterm) en voorspelde doorbraken die { "1.4" } tot { "2.5" } keer later lagen dan gemeten: optimistisch, de gevaarlijke richting. De frequentie van een kristal zwerft, dus een frequentie die uren vóór de synchronisatie is geschat, is verouderd, en het model had geen term voor hoe goed de frequentie bij de synchronisatie bekend is. De term <c1/> is om die reden toegevoegd en dit protocol is vastgelegd voordat de test werd geschreven; de drempel voor slagen is niet verschoven. De test controleert ook dat, zonder de term, de voorspelling binnen de steekproef bij elke drempel optimistisch is, dus de term is dragend.

seg-88e01cac525a = Dezelfde voorspelling op atoomklokken in een baan: { "8" } van { "10" }, niet getoetst aan een externe referentie

seg-17962966b6d6 = <c1/> gebruikt de gecombineerde definitieve IGS-klokken met { "30" } s voor { "14" } dagen ({ "17" } tot { "30" } augustus { "2025" }; <c2/>, elk bestand vastgepind met SHA-256): elke klok van een GPS Block IIF-satelliet tegen de IGS-tijdschaal. Het protocol (satellietset, gapregel, fitvenster, een synchronisatie elke { "3 570" } s met de frequentie uit het voorafgaande uur, drempels van { "1" } tot { "20" } ns, de drempel van { "1.5" }, en de regel dat de klasse alleen slaagt als elke satelliet slaagt) is opgeschreven voordat er gegevens waren gedownload.

seg-1b5832633c87 = Voorspelde ÷ gemeten doorbraak

seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

seg-9a6fac366156 = { "0.76" } tot { "1.46" }

seg-c14941cb5537 = binnen de drempel

seg-dbaaf875f1fb = { "1.51" } tot { "1.99" }

seg-3601e13c39b6 = optimistisch

seg-ea41cf6dbec2 = { "1.20" } tot { "1.61" }

seg-099fb000bf57 = niet geëvalueerd

seg-a7699b256ee1 = uitgesloten door de gapregel (een ontbrekende dag)

seg-eb71202e0b91 = Acht van de tien is bruikbaar bewijs, maar van twee satellieten wordt voorspeld dat ze langer zouden volhouden dan ze deden, en dat is de gevaarlijke richting, en het protocol eist dat elke satelliet slaagt. <b>Het baangeval blijft daarom MODELLED.</b> Block IIF-satellieten dragen zowel rubidium- als caesiumstandaarden en de IGS-bestanden vermelden niet welke actief is, dus het resultaat geldt voor de satellieten en niet voor één kloktype. Waarom G25 en G30 verschillen, is niet onderzocht.

seg-a9be8a92b6b9 = Een bench-run voor een onderdeel dat representatief is voor de vlucht (afgebakend, niet uitgevoerd)

seg-43597df55508 = Het openbare OCXO-record is { "5.5" } uur lang, van één laboratoriuminstrument, terwijl de oscillator nog stabiliseerde. Wat het kristalgeval zou toetsen aan een externe referentie, is een langere gemeten vrije run van een OCXO of CSAC die representatief is voor de vlucht, tegen een referentie:

seg-e2698f00a84a = een tijdintervalteller die de { "1" } PPS van de oscillator vergelijkt met een door GNSS gedisciplineerde of maserreferentie, minstens { "10" } dagen met één sample per seconde, temperatuur gelogd;

seg-c4c902ac028e = hetzelfde achtergehouden protocol: fit op het eerste derde, voorspel de doorbraken, meet op de rest, met dezelfde drempel en controle;

seg-0faaa6279195 = het record en zijn hash gepubliceerd naast de test, zodat de rij reproduceerbaar is.

seg-9b2255563582 = Het hangt af van toegang tot referentiehardware en wordt niet beloofd.

seg-6cb2dc94d1bf = Tegen welke zwervingsmaat moet een slot worden geaccepteerd?

seg-f6d24245dca6 = Tijdstandaarden bieden drie families van maten. Voor een tijdgeïndexeerd slot meet er maar één datgene wat het slot laat falen.

seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) is de grootste piek-tot-piek-TIE binnen een venster van gegeven lengte. Hij is blind voor een constante offset: een klok die { "1" } µs afwijkt maar volkomen stabiel is, heeft een MTIE dicht bij nul en mist elk slot. Hij meet hoeveel de fout <em>verandert</em>, niet waar hij <em>is</em>.

seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) wordt opgebouwd uit tweede verschillen van gemiddelde fase. Hij verwijdert een constante offset en een constante frequentiefout, en dat zijn precies de termen die een doorloop domineren. Hij karakteriseert het ruistype; hij is geen acceptatiemaat voor absolute tijdsynchronisatie.

seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; de budgetmaat van G.8271) is de grootste absolute tijdfout ten opzichte van de referentietijdschaal. Hij is rechtstreeks met een guard te vergelijken.

seg-7eefc395a118 = <b>Conclusie.</b> Accepteer een slot op basis van max|TE| ten opzichte van de referentietijdschaal van het netwerk, geëvalueerd als een voorspelde envelop vanaf de laatste synchronisatie bij een vermelde dekkingsfactor. Dat is wat <c1/> is: omdat elke term groeit met <c2/>, is het maximum over een doorloop van lengte <c3/> gelijk aan <c4/>. MTIE en TDEV blijven nuttig als diagnostiek: TDEV om te bepalen welke ruisterm moet worden aangepakt, MTIE(L) om te begrenzen hoeveel de fout beweegt tijdens een slot van lengte <c5/>.

seg-51d4ee8484d7 = Twee verfijningen die de keuze van de maat met zich meebrengt:

seg-a52524111ed7 = <b>De guard geldt voor de relatieve fout tussen twee knooppunten.</b> Als zender en ontvanger allebei onafhankelijk doorlopen, tellen hun stochastische fouten kwadratisch op en hun deterministische fouten in grootte. Wanneer het stochastische deel domineert, kan elk knooppunt <c1/> krijgen; wanneer veroudering of temperatuur domineert, <c2/>.

seg-073fe7cd8e63 = De dekkingsfactor is een ontwerpkeuze, geen eigenschap van de klok.

seg-eb1cbf9fda2d = <c1/> begrenst ongeveer { "99.7" } % van de Gauss-fouten op één tijdstip, niet over elk slot in een dag; een routeringsplan met veel sloten per dag heeft het risico per slot nodig dat het kan verdragen.

seg-04734b8a115b = Een ontvanger in een baan spoofen

seg-9e734bbda345 = De sectie <c1/> evalueert <c2/> voor dezelfde klok:

seg-a2f21a643389 = <b>Geometrie.</b> Een spoofer op de grond bereikt een LEO-satelliet alleen zolang de satelliet boven zijn horizon staat: bij { "550" } km hoogstens ongeveer twaalf minuten per overvlucht. Een spoofer die met snelheid <c1/> oploopt, kan de klok daarom hoogstens <c2/> maal dat venster verschuiven, of maal de tijd tot de volgende onafhankelijke controle als die korter is (<c3/>).

seg-ff59489b08b8 = <b>Dynamica.</b> Een gemeenschappelijke tijdverschuiving verschuift elke pseudorange even sterk en wordt opgenomen in de klokbias, niet in de positie, dus een positiecontrole met een baanpropagator telt niet als kruiscontrole voor tijdsynchronisatie.

seg-4302cc49b91f = <b>Kruiscontroles.</b> Een satelliet heeft zelden een tweede onafhankelijke ontvanger voor tijdsynchronisatie. Hij heeft de doorloop van zijn eigen klok (de monitor van <c1/>), een tweewegtijdoverdracht met een grondstation tijdens contacten, en tijdvergelijkingen over intersatellietlinks. Een crosslink is alleen onafhankelijk van één grondspoofer als de buur op datzelfde moment buiten de footprint van die spoofer ligt, wat het rapport controleert aan de hand van het aantal satellieten per baanvlak.

seg-16c15664a51c = <b>Voorwaardelijke grens.</b> De monitorondergrens plus de doorloop van de klok over de CUSUM-detectielatentie, die exact terugvalt op <c1/> wanneer de klok geen flicker-, witte-fase- of random-run-term heeft. Zoals die grens geldt hij alleen gegeven detectie.

seg-f7678693be22 = Dit alles is MODELLED: een bolvormige, niet-roterende aarde, een overvlucht, één terrestrische spoofer met een vermelde maximale oploopsnelheid. De aankomstrichting van de signalen bij een naar het zenit gerichte antenne is een echte kruiscontrole die een antennepatroon vereist en niet is gemodelleerd. <a1><c1/></a1> legt uit waarom een ondertekend besturingsbericht deze dreiging niet wegneemt.

seg-070a4e72b5ea = Frequentiesprongen, stralingseffecten en relativistische frequentie-afwijkingen; een thermisch model (de temperatuurverandering is een stap bij de synchronisatie); het synchronisatieprotocol zelf (een synchronisatie zet de fout terug op <c1/>).

seg-a2766c0f19d0 = <s1>Vorige</s1>Optische verbindingen door de atmosfeer

seg-85ad3eb72a80 = <s1>Volgende</s1>Telecomtijdsynchronisatie
