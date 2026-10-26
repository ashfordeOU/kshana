# docs--licensing: translations (nl)

seg-a1bee28d1dfd = Bron: <c1/>

seg-b8dd205e82c4 = Kshana heeft een <b>dubbele licentie</b>. U mag de open engine gebruiken onder <b>ofwel</b> de opensourcelicentie (AGPL-3.0) <b>ofwel</b> een <b>commerciële licentie</b> van Ashforde OÜ. Kies de licentie die past bij hoe u de engine wilt gebruiken.

seg-5faea0aba960 = Dit document legt het model in gewone taal uit. Het is een gids, geen juridisch advies, en het wijzigt de licenties zelf niet. De bindende voorwaarden staan in <a1><c1/></a1> (de GNU AGPL-3.0) en in elke commerciële overeenkomst die u met Ashforde OÜ sluit. Als die twee ooit tegenstrijdig zijn, gaan die documenten voor.

seg-89bd60937f0b = Optie A — opensource: GNU AGPL-3.0-only

seg-785200a5419a = De standaard. De volledige tekst staat in <a1><c1/></a1>. Kort gezegd mag u Kshana volgens de AGPL gratis gebruiken, bestuderen, wijzigen en herdistribueren, <b>mits</b>:

seg-5bc05999ee9d = als u Kshana of een afgeleide <b>distribueert</b>, u de <b>volledige bijbehorende broncode</b> onder de AGPL beschikbaar stelt; en

seg-5c9136766fdf = als u gebruikers met een <b>gewijzigde</b> Kshana <b>via een netwerk</b> laat werken (de onderscheidende bepaling van de AGPL, §{ "13" }), u <b>die gebruikers</b> de bijbehorende broncode van uw gewijzigde versie onder de AGPL moet aanbieden.

seg-234be920d38f = De AGPL is een <a1>open-sourcelicentie van de OSI</a1> en een sterke copyleft. Het is de juiste keuze voor academisch werk, opensourceprojecten, interne evaluatie en onderzoek, en voor iedereen die zijn eigen afgeleide werk graag open houdt.

seg-16c9cc91e4eb = Optie B: commerciële licentie (van Ashforde OÜ)

seg-197bfc5a5166 = Als de AGPL u niet past, verleent Ashforde OÜ dezelfde engine in licentie onder commerciële voorwaarden. Dat is de juiste keuze als u het volgende wilt:

seg-6de2b04016e5 = <b>{ -brand } inbouwen in een eigen product met gesloten broncode</b> zonder uw eigen broncode vrij te geven;

seg-e31db28c1e09 = <b>een netwerkdienst aanbieden</b> die op een aangepaste { -brand } is gebouwd, <b>zonder</b> de verplichting tot bronopenbaarmaking van §{ "13" };

seg-9d3578395a59 = { -brand } integreren in een groter systeem waarvan de andere componenten niet onder de AGPL kunnen vallen (bijvoorbeeld de eigen toolchain van een hoofdaannemer); of

seg-99d049c650a3 = garantie-, vrijwaring- of ondersteuningsvoorwaarden verkrijgen die de AGPL uitdrukkelijk uitsluit.

seg-f68b536b93c0 = Een commerciële licentie heft de copyleft-verplichtingen voor uw gebruik op, onder overeengekomen voorwaarden. <b>Contact: <a1>contact@ashforde.org</a1>.</b>

seg-55f1a2f687d9 = Waarom een dubbele licentie op deze manier

seg-42c1ce05ca5c = Het doel is <b>openbaar verifieerbaar</b> te zijn (zodat elke beoordelaar de engine kan uitvoeren en controleren), <b>zonder</b> dat een kapitaalkrachtige concurrent de gevalideerde engine kan forken, sluiten en als eigen concurrerend product kan uitbrengen zonder iets terug te geven. De netwerkcopyleft van de AGPL bereikt dat: een gesloten of gehoste afgeleide moet terugkeren naar open source, of een commerciële licentie van ons nemen. Openbare geloofwaardigheid en een verdedigde kern, tegelijkertijd.

seg-32b1d38914fe = Wat <b>niet</b> onder deze dubbele licentie valt

seg-27636d757dba = <b>De native OpenCPN-plug-in</b> (<c1/>) valt onder <b>GPL-3.0-or-later</b> (zie het bestand <c2/> in die map), niet onder AGPL-3.0, en wordt <b>niet</b> onder de commerciële licentie aangeboden. Zij wordt in OpenCPN geladen en is gebouwd tegen de headerbestanden van de plug-in-API onder GPL-2.0-or-later, wat de gebruikelijke basis voor OpenCPN-plug-ins is. De rest van <c3/> (de Signal K-plug-in en het OpenCPN-TCP-relay) blijft AGPL-3.0-only.

seg-f90c983e0ee3 = <b>{ -brand } Pro</b> en andere eigen overlays zijn <b>afzonderlijke producten met gesloten broncode</b> onder hun eigen commerciële voorwaarden. Zij maken geen deel uit van deze repository en worden niet onder de AGPL aangeboden.

seg-e340445b7f17 = <b>Afhankelijkheden</b> behouden hun eigen (permissieve) licenties. Wij houden de afhankelijkheidsboom bewust permissief (Apache-2.0 / MIT / BSD / ISC / …), juist zodat de commerciële editie netjes kan worden aangeboden: een copyleft-afhankelijkheid zou haar besmetten. Zie <a1><c1/></a1>.

seg-810191f19d4d = <b>Primaire geheugencodes van Galileo E1</b> (<c1/>, <c2/>; <b>sinds { "0.36" } niet meegeleverd</b>: elke gebruiker levert zijn eigen kopie aan, <c3/> of <c4/> / <c5/>, ingelezen door <c6/>). Dit zijn de primaire E1-B- en E1-C-codes van bijlage C.7 en C.8 van het Galileo Open Service Signal-In-Space Interface Control Document (OS SIS ICD), Issue { "2.0" }, januari { "2021" }, © European Union { "2021" }, ongewijzigd gehaald uit de bijlagen van de pdf (bron-URL, SHA-256 en een kruiscontrole met Issue { "1.3" } staan in <a1><c7/></a1>). Zij vallen <b>niet</b> onder de AGPL-3.0 of de commerciële licentie, en geen van beide licenties verleent er iets over. Wat het ICD zelf zegt, geciteerd uit Issue { "2.0" }:

seg-daef032cbe43 = Terms of Use §{ "3" }: "The information contained in the OS SIS ICD, including its Annexes, is subject to intellectual property rights". "The OS SIS ICD may only be partly or wholly reproduced and/or transmitted to a third party in accordance with the herein described permitted use and under the following conditions: the present “Terms of Use and Disclaimers”, as well as the terms of Annex G, are accepted, reproduced and transmitted entirely and unmodified together with the reproduced and/or transmitted information; the copyright notice “© European Union { "2021" }” is not removed from any page." En: "The use of the information contained in the OS SIS ICD, including the spreading codes which are subject to IPR, is authorised under the terms and conditions stated in Annex G."

seg-0fb25fafd9a2 = Bijlage G (Issue { "2.0" }; Bijlage H in Issue { "2.1" }, zelfde formulering) definieert "Technical Data of the OS SIS ICD" als inclusief de "E1 and E5 Memory Codes", en verleent een covenant not to assert die "non-exclusive and royalty-free" en "non-transferable and non-licensable" is. De lijst in §G.3, die zij uitputtend noemt, omvat: "a) the use of the Technical Data of the OS SIS ICD, including their integration and incorporation into any Products"; "b) the storage of the Technical Data of the OS SIS ICD, provided the source is acknowledged"; "c) the reproduction of the OS SIS ICD, in whole or in part, its distribution and its publication for non-commercial not-for-profit purposes and scale without amending the document or adding any element"; en "d) providing links to the EU website where the document is published". "Products" betekent software, apparaten en diensten met toegevoegde waarde "making use of the OS Signal". Ook staat er: "The Authorised Person shall not state or imply in any promotional material or elsewhere that the Products were developed by, are used by or for or have been approved or endorsed by the EU".

seg-8531368368ba = <b>Besluit ({ "0.36" }): niet herdistribueren.</b> Er wordt geen expliciete open licentie vermeld. Gebruik binnen een softwareproduct (G.3 a) en opslag met bronvermelding (G.3 b) vallen onder de eigen voorwaarden van het ICD, maar herdistributie (G.3 c) alleen voor niet-commerciële doeleinden zonder winstoogmerk en met de Terms en Bijlage G ongewijzigd erbij gereproduceerd. Omdat { -brand } ook onder een commerciële licentie wordt aangeboden, zijn de bestanden uit de repository en de pakketten verwijderd; de engine leest tijdens de uitvoering de eigen kopie van de gebruiker, en zonder die kopie geven de Galileo E1-signalen een foutmelding die uitlegt hoe ze moeten worden aangeleverd. Elke gebruiker beroept zich rechtstreeks op de machtiging van de EU; { -brand } kan die niet doorgeven. { -brand } is niet ontwikkeld door, wordt niet gebruikt door, is niet goedgekeurd door en wordt niet onderschreven door de Europese Unie.

seg-e18986aeab7f = <b>Merken.</b> "{ -brand }" en de bijbehorende merken zijn handelsmerken van Ashforde OÜ. Geen van beide licenties verleent rechten op de naam of de merken; forks en afgeleide distributies moeten een andere naam gebruiken. Zie <a1><c1/></a1>.

seg-f6b7345c2c60 = Bijdragen

seg-1709eb19c2c5 = Bijdragen worden aanvaard onder de inbound-bijdragevoorwaarden van het project, die uw bijdrage in licentie geven onder de AGPL <b>en</b> Ashforde OÜ het recht verlenen haar op te nemen in de commercieel gelicentieerde editie (zodat de dubbele licentie blijft werken). Zie <a1><c1/></a1>.

seg-940c8cce5137 = Vragen

seg-e678f2ecc571 = Licentievragen, commerciële offertes en "welke optie geldt voor ons?" → <b><a1>contact@ashforde.org</a1></b>.

seg-05d34a27a0ba = <s1>Vorige</s1>Changelog

seg-4f7f660eea0a = <s1>Volgende</s1>Beveiliging

seg-2d2b32369c30 = Wat niet onder deze dubbele licentie valt
