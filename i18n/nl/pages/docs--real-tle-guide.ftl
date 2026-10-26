# docs--real-tle-guide: translations (nl)

seg-a6da23b43f90 = <s1>Volgende</s1>Campagnes

seg-bc9ae2eda129 = Bron: <c1/>

seg-68b27f011ced = Echte constellatie-TLE's gebruiken

seg-109e8a920fc2 = Het meegeleverde <c1/> bevat al <b>echte TLE's</b> (two-line element sets): de Celestrak-snapshot <c2/> van de operationele GPS-constellatie (Global Positioning System) zoals gecatalogiseerd op 2021-07-28, { "30" } satellieten, met <c3/>. Elke satelliet wordt gepropageerd met SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), dat is getoetst aan de officiële vectoren van AIAA (American Institute of Aeronautics and Astronautics) 2006-6753. Dezelfde snapshot is als <c4/> vastgelegd, en <c5/> haalt een verse op. Lees sectie { "3" } voordat u een geometriegetal eruit aanhaalt: dat scenario propageert elke satelliet vanaf zijn eigen epoche.

seg-faed28835cb2 = Voor een synthetisch, op zichzelf staand voorbeeld geeft <c1/> zes GPS-achtige satellieten als kale line-2-records, gepropageerd als analytische Kepler-elementen, en elk scenario <c2/> zonder een blok <c3/> bouwt een Walker-constellatie.

seg-1c9b96a07f5b = Om de <b>actuele</b> GPS-constellatie (of een andere) te bestuderen, plaatst u een verse snapshot.

seg-95bb71044de0 = { "1" }. Een actuele snapshot downloaden

seg-ab93ab55ddd9 = <a1>Celestrak</a1> herdistribueert de elementensets uit de NORAD-catalogus (North American Aerospace Defense Command), minstens dagelijks ververst. Voor GPS:

seg-da7b4b89848b = Andere nuttige groepen: <c1/>, <c2/> (GLONASS, het Russische Global Navigation Satellite System), <c3/>, <c4/> (het ISS, International Space Station, en andere bemande stations).

seg-d7fe0dccbc36 = Het bestand is een reeks records van drie regels (naam, regel { "1" }, regel { "2" }). De parser van Kshana negeert naamregels, dus u kunt het bestand ongewijzigd plakken.

seg-c2d6ca2089a1 = { "2" }. In een scenario plaatsen

seg-6e221c5b640a = Stel in elk baanscenario het blok <c1/> van de constellatie in op de inhoud van de snapshot:

seg-f2b0e78ef568 = (PRN is het nummer van de pseudorandom-noise-code die een GPS-satelliet uitzendt.)

seg-976bcb48df94 = Een paar van regel { "1" } + regel { "2" } wordt gepropageerd met <b>SGP4/SDP4</b> (weerstands- en diepe-ruimtetermen); een kale regel { "2" } wordt behandeld als analytische gemiddelde Kepler-elementen. De twee mogen worden gemengd.

seg-fa1d59fc7817 = <c1/> weigert elke regel waarvan de modulo-10-checksum in kolom 69 onjuist is — een goede integriteitscontrole op een vers gedownload bestand. De standaardwaarde is <c2/> omdat de synthetische onderwijsscenario's plaatshouderchecksums gebruiken.

seg-90d3872ebf87 = { "3" }. Opmerkingen over epochen — lees dit voordat u een geometriegetal aanhaalt

seg-5e9056a30d53 = SGP4 propageert elke satelliet vanaf <b>zijn eigen TLE-epoche</b>, en <c1/> (in <c2/>) geeft alleen propagators terug, dus de scenariotijd <c3/> wordt als <c4/> op elke satelliet afzonderlijk toegepast. Dat is alleen de juiste conventie als alle elementensets in het bestand dezelfde epoche delen.

seg-3d04797ae50e = <b>Een groepsbestand van Celestrak biedt u dat niet.</b> Het bestand wordt op één moment <em>gedownload</em>, maar de elementenset van elke satelliet wordt op zijn eigen cadans ververst, dus de epochen erin zijn over dagen gespreid. Gemeten aan de sets die in deze repository zijn vastgelegd (regel { "1" }, kolommen { "19" }–{ "32" }):

seg-5f67557dd207 = fixture

seg-ce4855643f31 = sets

seg-49a5b4798be4 = spreiding van epochen

seg-b758a9b7ee02 = { "70.6" } h

seg-79e6ea88957c = { "76.4" } h

seg-e1e30f69fa4f = { "335.7" } h

seg-9d38cc073c94 = { "70.6" } h is { "5.9" } GPS-omlopen. Als ze ongewijzigd worden gepropageerd, is de fasering in het baanvlak door elkaar gehaald: de satellieten zitten op de juiste hoogten en inclinaties, maar niet waar ze op één bepaalde dag waren, dus de zichtbare set, de DOP (dilution of precision) en elke daaruit berekende beschikbaarheid beschrijven een constellatie die nooit heeft bestaan. Niets in de parser meet deze spreiding voor u, en de typen <c1/> en <c2/> lijnen epochen niet uit: een TLE-blok in een scenario wordt altijd per satelliet-epoche gepropageerd.

seg-fa82a18e4418 = <b>Doe in plaats daarvan dit.</b> Bewaar de epoche naast de propagator, kies één referentiemoment en verschuif de <c1/> van elke satelliet daarnaartoe. <c2/> is openbaar, dus de parselus is kort; <c3/> (<c4/>) is het uitgewerkte voorbeeld in deze boom:

seg-78092818695e = TEME is het frame met ware evenaar en gemiddelde equinox waarin SGP4 werkt; <c1/> roteert het met <c2/> naar aardvaste coördinaten.

seg-78f483dfc3fa = Als u niet uitlijnt, zeg dat dan wanneer u het getal rapporteert: het is een uitspraak over baan-<em>schillen</em>, niet over een echte hemel.

seg-34fddbd3d57f = Hoeveel dit uitmaakt is gemeten in <c1/>, dat dezelfde verschuivingen toepast (referentiemoment: de laatste epoche in de gecombineerde GPS- en Galileo-fixtures, 2026-06-07T07:{ "21" }:{ "04" } UTC (Coordinated Universal Time)) via een ARAIM-beschikbaarheidsrun (advanced receiver autonomous integrity monitoring) van { "24" } h met twee constellaties. Onder een VAL (vertical alert limit) van { "12" } m geeft de uitgelijnde hemel voor alleen GPS { "0.993" }, voor gepoold GPS+Galileo { "1.000" } en voor de tegen constellatiefouten robuuste dubbele { "0.990" }; de niet-uitgelijnde conventie per satelliet-epoche geeft { "0.208" }, { "0.671" } en { "0.031" } voor dezelfde invoer — een andere conclusie, geen kleine fout.

seg-49f6c8f71d99 = <a1><c1/></a1> — de baanscenario's.

seg-c842884cb3e7 = <a1><c1/></a1> — de velden van het type <c2/>; de typen <c3/>, <c4/>, <c5/> en <c6/> nemen dezelfde tabel <c7/>, en <a2><c8/></a2> neemt één <c9/>.

seg-a2c5db6dcf42 = <a1><c1/></a1> — de ARAIM-engine die de test met echte hemel aandrijft.

seg-106047488885 = <c1/> — de parser (<c2/>, <c3/>).

seg-c9068c1bc579 = <s1>Vorige</s1>Resultaatschema
