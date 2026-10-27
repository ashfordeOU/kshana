# docs--compliance: translations (da)

seg-f65b1f2b4182 = Tilstand

seg-e19db3d5273b = Kilde: <c1/>

seg-045b24defdbb = DO-316 / DO-229E: kort over integritet og compliance

seg-9100800daa1c = Dette dokument knytter RTCA's (tidligere Radio Technical Commission for Aeronautics) krav til beskyttelsesniveauer og integritetsovervågning i <b>DO-229E</b> (SBAS (satellitbaseret augmentationssystem) MOPS (minimale operationelle ydelsesstandarder)) og <b>DO-316</b> (GPS/SBAS (GPS: Global Positioning System), udstyr om bord på luftfartøjer) til de Kshana-funktioner, der implementerer dem. Det er et <b>teknisk sporbarhedsværktøj</b>, ikke en erklæring om, at noget krav er nået: Kshana implementerer de offentliggjorte algoritmer; det er ikke godkendt avionik.

seg-0e6ec5617eb5 = Den maskinlæsbare form er <a1><c1/></a1>; denne prosa er dens ledsager (og afspejler <a2><c2/></a2>).

seg-d5d7a2ec9c73 = Beskyttelsesniveauer med vægtet mindste kvadraters metode (DO-229E Appendix J)

seg-0dc19f403f5e = For hver satellit <em>i</em> med elevation <c1/> og azimut <c2/> hos brugeren er observationsrækken i det lokale plan (ENU (øst-nord-op) + ur)

seg-6415f7f28e7e = med vægt <c1/>, <c2/> (budgettet for UDRE (brugerens differentielle afstandsfejl) / GIVE (vertikal ionosfærefejl på gitteret) / airborne / troposfære). Positionskovariansen er <c3/>; dens ENU-blok giver de horisontale og vertikale beskyttelsesniveauer (HPL, VPL):

seg-ea574448bda4 = Kshana beregner <c1/> ved at invertere normalmatricen på { "4" }×{ "4" } med samme rutine, som RAIM-stakken (receiver autonomous integrity monitoring) bruger (<c2/>), og validerer resultatet på to måder (kovariansvejen <c3/> og projektionsvejen <c4/> skal stemme overens) samt mod en uafhængig numpy-referencegeometri <c5/>.

seg-f63dd3d7aad4 = Kilde

seg-268ae5b25684 = En route → NPA (ikke-præcisionsindflyvning; kun horisontal)

seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

seg-dbae96c75a06 = Præcisionsindflyvning

seg-1bfafdcf6ab0 = DO-229E MOPS

seg-1922c53b8340 = Bemærkning om ærlighed: MOPS bruger den afrundede horisontale konstant <c1/>; den præcise tosidede normalkvantil <c2/> er <c3/>. Kshana bruger den offentliggjorte { "6.0" } i koden og udleder <c4/> af samme <c5/>, som RAIM-stakken bruger, en ikke-cirkulær krydskontrol (værdien afrundes til MOPS' { "5.33" }).

seg-ef191c1d3db1 = Ionosfærefri L1/L5-tofrekvenskombination (IS-GPS-705)

seg-b69825ef05d3 = Med <c1/>, <c2/>, <c3/>:

seg-ce81c6b71738 = Den første ordens ionosfæreforsinkelse (<c1/>) udlignes præcist, verificeret mod motorens uafhængige <c2/>-fysik for en række TEC-værdier (totalt elektronindhold). Støjforstærkningen ved input med samme varians er <c3/>.

seg-e111fb05a7c6 = <b>I repositoriet, automatiseret</b> (ved hver commit): K-faktorerne mod deres fordelingsdefinitioner, <c1/> og de ionosfærefri (IF) koefficienter mod frekvenserne i IS-GPS-705 (IS: Interface Specification), førsteordens ionosfæreudligning mod den uafhængige forsinkelsesfysik og beskyttelsesniveauerne med vægtet mindste kvadraters metode (WLS) mod en numpy-referencegeometri <c2/> (<c3/>).

seg-f30d84abe275 = <b>Ekstern uafhængig reference, automatiseret</b> (<c1/>): givet hver satellits elevation, azimut og samlede 1-σ gengiver <c2/> HPL fra en uafhængig implementering, <c3/> i RTKLIB's (et open source-bibliotek til positionering i realtid med kinematik) fork med SBAS-beskyttelsesniveauer <c4/> (Siki & Takács { "2017" }), på seks epoker, som dette værktøj beregnede ud fra <b>rigtige EGNOS-udsendelser (European Geostationary Navigation Overlay Service)</b> (geostationær PRN (pseudotilfældig kodenummer) { "120" }) og rigtige RINEX-observationer (Receiver Independent Exchange Format) fra stationen BUTE i Budapest (2017-02-19), til <b>< { "2e-3" } m</b>. Referencen afrunder K_V til { "5.33" }, så den vertikale sammenlignes uden K-faktor, som <c5/> mod dens VPL / { "5.33" }. ESA's (Den Europæiske Rumorganisation) gLAB { "v6.0.0" } (<c6/>) bruger samme formel.

seg-389e8a57e3e8 = <b>Ikke gjort</b>: σ for hver satellit er referencens egen; modellering af σ ud fra rå UDRE/GIVE-meddelelser ligger udenfor omfanget, og intet officielt offentliggjort beskyttelsesniveauprodukt fra WAAS (Wide Area Augmentation System) eller EGNOS er gengivet fra ende til anden. DO-229E/DO-316 selv er bag RTCA's betalingsmur; den åbne kilde til udledningen er ESA Navipedias sider om ICAO/EGNOS SBAS (ICAO: International Civil Aviation Organization).

seg-7686fb3d3e0c = <s1>Forrige</s1>ARAIM-reference

seg-0457ef382fb0 = <s1>Næste</s1>Resilience cross-walk
