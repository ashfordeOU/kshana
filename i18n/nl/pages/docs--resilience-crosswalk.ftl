# docs--resilience-crosswalk: translations (nl)

seg-aab745a65e76 = Module

seg-88372b30ed79 = Limiet

seg-ad856ad710eb = Status

seg-b03d56f501c3 = Type

seg-4dbf41c0ec3b = Functie

seg-f472e43c1100 = Wat het laat zien

seg-fa4468d4cb80 = Beschikbaarheid

seg-fe4d868448ef = Bron: <c1/>

seg-d745715d5332 = Cross-walk van PNT-resilienceframeworks

seg-aa1c24d63df5 = <b>Afgestemd op, niet beoordeeld of goedgekeurd.</b> Dit brengt de gesimuleerde capabilities van Kshana in verband met de gepubliceerde PNT-resilienceframeworks (PNT: positionering, navigatie en tijdsynchronisatie). Het is een <em>van simulatie afgeleide zelfbeoordeling, afgestemd op</em> het Resilient PNT Conformance Framework (RPCF) v2.0 van DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency), het Resist-Detect-Respond-Recover (RDRR)-model van RethinkPNT/Firesmith en de criteria voor resilient PNT van Yang Yuanxi. Het is <b>geen</b> beoordeling, goedkeuring, accreditatie of compliance-verklaring, en het draagt geen onderschrijving van DHS, IEEE (Institute of Electrical and Electronics Engineers) of enige autoriteit. Elke rij is gelabeld met haar eerlijke verificatiestatus (<c1/> aan een externe onafhankelijke referentie, of <c2/> vanuit eerste principes met tests); de resilience-scorelaag zelf is <b>MODELLED</b>. Twee van haar kernels hebben hun eigen rijen VALIDATED in de verificatiematrix, de inverse-Simpson-diversiteitskernel (<c3/>) en de rangordestatistiekkernel (<c4/>); dat valideert de rekenkunde, niet de scores die erop zijn gebouwd.

seg-652fcf3ec12d = De scoreengine (<c1/>) gebruikt deze capabilities en geeft subscores per dimensie, nooit één fantoomgetal. Zie <c2/> voor de machinaal gecontroleerde statusinvarianten.

seg-7a71de89a9fd = DHS RPCF v2.0: wat het framework definieert, en de eigen subscorecategorieën van Kshana

seg-1985dbfe351d = Het gepubliceerde framework (Resilient PNT Conformance Framework, Version { "2.0" }, { "26" } April { "2022" }, DHS Science and Technology Directorate met CISA) definieert drie <b>kernfuncties</b> (sectie { "5.2" }: Prevent, Respond, Recover), <b>resilienceniveaus { "0" } tot { "4" }</b> (sectie { "5.3" }) en <b>acht genummerde minimumeisen</b> verdeeld over de niveaus { "1" } tot { "4" } (sectie { "5.3" }, herhaald in { "5.5" }), plus een evaluatieaanpak (sectie { "8" }). Het definieert <b>geen</b> lijst van zeven techniekcategorieën. Een eerdere versie van deze pagina, en de opmerkingen in de resiliencemodule, beschreven zeven "RPCF technique categories"; de woorden Obfuscate en Diversify komen in v2.0 niet voor. De tekst van dat document is op 2026-10-09 opnieuw gelezen en er is geen dergelijke lijst gevonden.

seg-178d1e119dce = De zeven namen van subscores die de scoreengine afgeeft (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; "OLVIDMR" is ons geheugensteuntje) zijn daarom <b>de eigen scorecategorieën van Kshana</b>, behouden voor stabiele uitvoer. Het zijn geen DHS-termen en de rijen hieronder zeggen niet dat DHS ze eist. Waar een categorie aansluit bij een eis van het framework, staat dat in de laatste kolom; waar niet, staat er "none".

seg-5a9eb11bb965 = Subscorecategorie van Kshana

seg-e117e6f71845 = Capability van Kshana die als drijver dient

seg-7677dafa7016 = Dichtstbijzijnde verwijzing in RPCF v2.0

seg-27e0f6b39605 = Obfuscate

seg-7327b9cbc106 = Opgegeven techniek × bronkwaliteit (geen directe gedragsdrijver)

seg-b63e61fa5fa2 = none (een preventietechniek; sectie { "5.2" }, Prevent)

seg-7ed4f2e21189 = Opgegeven techniek × bronkwaliteit

seg-8579207ae2e5 = Verify

seg-30b8cb030965 = AUC (area under the curve) van de verstoringsdetector onder het scenario (spoofing-, jamming- en meaconingmonitors)

seg-3d358c029f50 = Niveau { "2" } eis { "4" }; niveau { "3" } eis { "7" }

seg-fcb8cb7d4c97 = Isolate

seg-b3cd355743da = Niveau { "3" } eis { "6" }

seg-ffa87d149a20 = Diversify

seg-1282685a888b = Aantal onafhankelijke groepen → effectieve diversiteit volgens inverse Simpson

seg-f0dd4c4ef1c5 = Niveau { "4" } eis { "8" }; sectie { "5.5" } (common mode)

seg-2d91b12a9e56 = Mitigate

seg-d183b552df76 = Beschikbaarheid onder ontzegging

seg-c337df73e231 = sectie { "5.2" }, Respond

seg-2da4df22d35d = Recover

seg-85d7e3292549 = Holdover-coast × poort voor begrensde degradatie

seg-3aec9f076902 = Niveau { "2" } eis { "5" }; sectie { "5.2" }, Recover

seg-36958650abc0 = De afbeelding per eis op het echte framework, met waarvoor de uitvoer van Kshana bewijs levert en wat overblijft, staat in <a1>compliance/dhs-rpcf.md</a1>.

seg-a085dd81c769 = RDRR-functies van RethinkPNT / Firesmith

seg-1b972717180b = Drijver

seg-6eaf161f8871 = Resist

seg-6046a8914dc7 = Gemiddelde van de subscores Obfuscate/Limit/Isolate/Diversify

seg-242e2c01ebc2 = Detect

seg-45c8da13581f = Subscore Verify (AUC van de detector)

seg-d29232baaaa6 = Respond

seg-36ab7ce187e6 = Subscore Mitigate (beschikbaarheid)

seg-f98dc190541c = Holdover × begrensde poort; kernprestatie-indicatoren van de resilience-tijdlijn (KPI's: detect/react/recover/loss)

seg-e7190928bed6 = Criteria van Yang Yuanxi (de deelverzameling waartoe de kwaliteitsmaten voor tijdsynchronisatie en detectie iets zeggen)

seg-52836e247425 = Criterium

seg-cbbe4c0baf3f = Betrouwbaarheid

seg-32d64f865b21 = Integriteitsfractie van het filter

seg-214372f29bd1 = Continuïteit

seg-ad5e76a596b8 = Holdover × begrensde poort

seg-d92fb15e6dfa = Nauwkeurigheid

seg-0de1f9119e0f = Indicator voor tijdsynchronisatie/kwaliteit — <b>nauwkeurigheid in het positiedomein maakt geen deel uit van de score</b>. <c1/> zet een opgegeven positiecovariantie en HPL (horizontal protection level) om in CEP/SEP/2DRMS (circular error probable, spherical error probable, twice the distance root mean square), maar geen enkel scenario voert die in de resiliencescore in

seg-0aa925a09499 = MODELLED (alleen het domein van tijdsynchronisatie)

seg-6b661e6e4399 = Wat deze cross-walk niet beweert

seg-51a48d0c718d = Geen toegekend RPCF-niveau. Het toegewezen niveau is een <em>voorlopige, van simulatie afgeleide</em> lezing met een expliciete poort voor begrensde degradatie, geen toegekende volwassenheid.

seg-df73b7c76ae5 = Geen nauwkeurigheid in het positiedomein in de score. De resilience-subscores zijn opgebouwd uit meetwaarden voor het domein van tijdsynchronisatie en voor detectie. De engine berekent elders wel posities (de soorten <c1/>, <c2/> en <c3/>) en protection levels (de soort <c4/>), maar de scorelaag gebruikt ze niet.

seg-30a1b1a4dfea = Geen veldvalidatie. Het referentiepanel en het dreigingsensemble zijn synthetische, op parameters gebaseerde reducties (<c1/>), vermeld als een volwaardige beperking.

seg-83c465cd78b0 = De begeleidende studie (<c1/>) bestaat juist om te laten zien dat het samenvoegen van deze dimensies tot één samengestelde score of één niveau een beoordeling oplevert waarvan de rangschikking van architecturen onstabiel is bij verdedigbare keuzes van weging en dreiging — dus deze cross-walk is een meetlaag die per dimensie moet worden gelezen, geen enkel cijfer om een product aan te beoordelen.

seg-32bd45dc031d = Resilience- en verticale scenario's die deze lagen uitoefenen

seg-4e36adba1c55 = De meegeleverde scenario's hieronder laten de dreigings- en herstelmechanismen draaien waar de rijen van de cross-walk naar verwijzen. Elk is een echte run van de genoemde soort; elk is <b>MODELLED</b> (geen veldgegevens).

seg-44664e49d449 = Scenario (<c1/>)

seg-44b8d7435bfd = Gelaagde PNT onder een gedeelde jamming-/spoofingdreiging: een gezaaide Monte Carlo van laagontzegging, inverse-variantiefusie van de overlevenden, de verhouding van totaal verlies tussen één laag en gelaagd, en hoe gecorreleerde ontzegging die verhouding doet instorten. De identiteiten tussen Monte Carlo en gesloten vorm en van de fusie worden door tests in de crate gecontroleerd; de soort heeft geen rij in de verificatiematrix, dus ze wordt hier als MODELLED gelabeld.

seg-1734506ad287 = GNSS (global navigation satellite system) gestoord, een PNT-laag in een lage aardbaan (LEO) draagt de gebruiker, integriteit behouden (drie fasen op één tijdlijn).

seg-ff8cc090bdce = Eén jammer tegen een ontvanger met vier banden; welke spoofingmonitor welke spoofer ziet.

seg-0a93502a4a19 = De jammer-tot-signaalmarge (J/S) uit het ontvangen vermogen.

seg-f2230253bdff = Spoofingdetectie via consistentie van Doppler en passagegeometrie.

seg-d8ca900a8c14 = Tijdsynchronisatie van basisstations en kritieke infrastructuur in holdover, met LEO-tijd.

seg-2a61d07bf177 = Gebruikers van weg, spoor, scheepvaart, poolgebieden en Internet of Things (IoT) met een LEO-laag.

seg-8723073167ad = GNSS/INS (inertial navigation system) dead reckoning door een stedelijke canyon en door jamming op een klein onbemand vliegtuig.

seg-6ee1ef707b20 = Hoe lang een INS een schip of een trein binnen zijn grens houdt bij ontzegd GNSS.

seg-7ca913e1729b = Een maritieme jammer; detectie van een spoofer die de gerapporteerde positie van een schip wegsleept.

seg-c49548e8393b = <s1>Vorige</s1>Kaart van DO-316 / DO-229E

seg-dedf3b53d31f = <s1>Volgende</s1>Ontvangervertrouwen
