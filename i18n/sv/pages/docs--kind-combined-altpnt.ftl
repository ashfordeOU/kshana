# docs--kind-combined-altpnt: translations (sv)

seg-a83b25413fd8 = Källa: <c1/>

seg-92b24377c9be = <c1/> (scenariotyp)

seg-216efc4e6fba = Scenariotyp i motor v{ $version }, familj <a1>GPS-nekad alternativ PNT</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-f496b7f4c63a = Kombinerad navigator för gravitation + magnetfält + terräng i GPS-nekad miljö: tre skalära fältkanaler sammanslagna per vägpunkt för en skarpare positionsbestämning med mindre drift (lägre CRLB) än något enskilt fält.

seg-670730bd221e = En körning av <c1/> sammanfattas som: combined-altpnt | fri tröghetsdrift { "70659" } m | gravitation { "464" } m magnetfält { "782" } m terräng { "368" } m | FUSED { "365" } m

seg-cf6981466329 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-078f09d100fa = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-557db767b9c3 = Exemplet <c1/> anger bland annat:

seg-df8d5e07e737 = mGal

seg-498b1aea3770 = Diagrammet som motorn skriver för scenarios/combined-altpnt.toml, typ combined-altpnt

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-0df60ac6343f = <b>MODELLED</b> Matchning mot gravitationskarta, terrängreferensnavigering (TERCOM/SITAN), magnetisk anomali. Oberoende referens (InternalConsistency): IGRF-14-koefficienter; CRLB för matchat filter från första principer. Fältet i riktmärket för verkligt gravitationsfält är externt kontrollerat (raden 'Gravity-anomaly synthesis from a spherical-harmonic model'), men dess navigeringsutfall har ingen extern oberoende referens

seg-d776abd5691c = Alternativ / kompletterande PNT är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Familjesida: <a1>GPS-nekad alternativ PNT</a1>

seg-49efcd2ced81 = <s1>Föregående</s1>clock

seg-f2ccea3bb03e = <s1>Nästa</s1>conflict-resilience
