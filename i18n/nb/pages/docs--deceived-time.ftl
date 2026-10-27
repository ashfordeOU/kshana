# docs--deceived-time: translations (nb)

seg-d46702617926 = Kilde: <c1/>

seg-f44d01df7b1c = En signert kommando utført på et villedet tidspunkt fører likevel til feilruting

seg-6497012e401e = Et teknisk notat for operatører av tidsindekserte nett: konstellasjoner som ruter, tildeler oppgaver eller overleverer etter en tidsplan, der hver node handler når egen klokke når et planlagt tidspunkt.

seg-714bce435435 = Forkortelser: GNSS, Global Navigation Satellite System; TPL, timing protection level; PNT, positioning, navigation and timing.

seg-a7208323de1c = Påstanden

seg-246715a1c559 = Å autentisere styremeldinger, også med postkvantesignaturer, beviser hvem som sendte en melding og at den ikke ble endret. Det beviser ikke <b>når mottakeren handler på den</b>. En node utfører en tidsindeksert kommando mot sin egen klokke. Hvis den klokken er trukket med <c1/>, kjøres en kommando som gjelder for tidspunkt <c2/> ved sann tid <c3/>, med alle signaturer intakte. Når <c4/> overstiger slottvernet, havner trafikken i feil slott, en link bytter mens den andre enden fortsatt peker et annet sted, eller en overlevering skjer for tidlig. Nettet feilruter, og hver integritetskontroll i kommandoveien melder suksess.

seg-8683f0749042 = Hvorfor klokken er det myke målet

seg-1af5aea2ef5b = <b>GNSS-tid er den vanlige referansen, og den kan spoofes.</b> En node som disiplinerer klokken sin mot GNSS arver den tiden mottakeren leverer. En spoofer som holder mottakerens egne kvalitetsflagg grønne, kan trekke tiden sakte.

seg-354a4c706264 = <b>Ferskhetskontroller bruker den samme klokken.</b> Et gyldighetsvindu («godta denne kommandoen til <c1/>») eller en replay-teller knyttet til tid vurderes mot den lokale klokken, så en trukket klokke kan også utvide vinduet der en fanget signert kommando godtas.

seg-a4b8a5db0975 = <b>Angrepet trenger ingen nøkkel.</b> Ingenting i den signerte kanalen berøres. Sterkere kryptografi øker kostnaden ved å forfalske en kommando og lar denne kostnaden stå uendret.

seg-e514b03fbae3 = Dette står ved siden av postkvantearbeid, ikke mot det: de to tetter ulike hull. Signaturer stopper en forfalsket kommando. Tidsintegritet hindrer at en ekte kommando utføres på feil tidspunkt.

seg-09f493386dbc = Hva som begrenser det

seg-750bd90b0ee1 = Fire tiltak, hvert kvantifisert av scenariotypen <c1/> (<a1><c2/></a1>):

seg-77cf39b434b5 = <b>En klokkestøttet monitor.</b> Sammenlign GNSS-tid med nodens egen klokke som går i coasting over et vindu, og gi alarm når forskjellen er for stor til å være klokkestøy. Den betingede TPL begrenser feilen som kan gå ubemerket før alarmen.

seg-e58f7fb94ac5 = <b>Uavhengige kontroller, planlagt.</b> En toveis tidsoverføring fra en bakkestasjon eller en kryssforbindelsessammenligning med en nabo utenfor spooferens rekkevidde setter en øvre grense for hvor lenge et sakte trekk kan pågå. Intervallet mellom dem er en sikkerhetsparameter, ikke bare en driftsparameter.

seg-69590f56817c = <b>Geometri.</b> En spoofer på bakken når en satellitt i lav jordbane bare mens den er over spooferens horisont, så trekket begrenses av spooferens rampehastighet ganger det vinduet. Som regnestykke: en rampe på { "10" } ns/s holdt i { "600" } s er { "6" } µs. Det medfølgende eksempelet (<c1/>: bane på { "550" } km, maksimal rampe på { "10" } ns/s) rapporterer en spoofer-eksponering på { "732" } s og et rampebegrenset trekk på { "7 321" } ns.

seg-e8e52ce05943 = <b>Et vern dimensjonert fra grensen, og en sikker handling ved alarm.</b> Slottvernet bør dekke den største uoppdagede feilen monitoren og kontrollene tillater, ikke bare klokkens frie støy. Ved alarm bør en node holde sin siste gode tidsplan på den coastende klokken i stedet for å følge GNSS.

seg-c11b66f214ac = Hva dette notatet ikke påstår

seg-8b0ed39ead25 = Det påstår ikke at en spoofet satellitt er observert feilrute; det anslår ikke noen operatørs eksponering; og grensene det viser til, er MODELLED, betinget av deteksjon og av de oppgitte trusselforutsetningene. Det argumenterer for en sammensetning: en gyldig signatur og et riktig utføringstidspunkt er separate egenskaper, og et tidsindeksert nett trenger begge.

seg-c1bf6467e3c9 = <s1>Forrige</s1>Telekom-tidssynkronisering

seg-d4e9bfd42982 = <s1>Neste</s1>Holdover-test og tidsmaskinvare i sløyfen
