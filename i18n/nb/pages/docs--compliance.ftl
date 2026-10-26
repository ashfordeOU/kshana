# docs--compliance: translations (nb)

seg-f65b1f2b4182 = Modus

seg-e19db3d5273b = Kilde: <c1/>

seg-045b24defdbb = Kart over integritet etter DO-316 / DO-229E (compliance)

seg-9100800daa1c = Dette dokumentet knytter kravene til beskyttelsesnivå og integritetsovervåking i RTCA (tidligere Radio Technical Commission for Aeronautics) <b>DO-229E</b> (SBAS (satellittbasert augmenteringssystem) MOPS (minimum operational performance standards)) og <b>DO-316</b> (GPS/SBAS (GPS: Global Positioning System) luftbåret utstyr) til funksjonene i { -brand } som implementerer dem. Det er et <b>sporbarhetshjelpemiddel for ingeniører</b>, ikke en uttalelse om at noe krav er nådd — { -brand } implementerer de publiserte algoritmene; det er ikke godkjent avionikk.

seg-0e6ec5617eb5 = Den maskinlesbare formen er <a1><c1/></a1>; denne prosaen er følgesvennen (og speiler <a2><c2/></a2>).

seg-d5d7a2ec9c73 = Beskyttelsesnivåer med vektet minste kvadraters metode (DO-229E Appendix J)

seg-0dc19f403f5e = For hver satellitt <em>i</em> med elevasjon <c1/> og azimut <c2/> hos brukeren er observasjonsraden i lokalt nivå (ENU (øst-nord-opp) + klokke)

seg-6415f7f28e7e = med vekt <c1/>, <c2/> (budsjettet for UDRE (user differential range error) / GIVE (grid ionospheric vertical error) / luftbåret / troposfære). Posisjonskovariansen er <c3/>; ENU-blokken gir de horisontale og vertikale beskyttelsesnivåene (HPL, VPL):

seg-ea574448bda4 = { -brand } beregner <c1/> ved å invertere normalmatrisen på { "4" }×{ "4" } med den samme rutinen som RAIM-stakken (RAIM (receiver autonomous integrity monitoring)) bruker (<c2/>), og kontrollerer resultatet på to måter (kovariansveien <c3/> og projeksjonsveien <c4/> må stemme overens) og mot en uavhengig numpy-referansegeometri <c5/>.

seg-f63dd3d7aad4 = Kilde

seg-268ae5b25684 = En route → NPA (ikke-presisjonsinnflyging; bare horisontalt)

seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

seg-dbae96c75a06 = Presisjonsinnflyging

seg-1bfafdcf6ab0 = DO-229E MOPS

seg-1922c53b8340 = Merknad om ærlighet: MOPS bruker den avrundede horisontale konstanten <c1/>; den eksakte tosidige normalkvantilen <c2/> er <c3/>. { -brand } bruker den publiserte { "6.0" } i koden og utleder <c4/> fra den samme <c5/> som RAIM-stakken bruker, en ikke-sirkulær krysskontroll (verdien avrundes til MOPS-verdien { "5.33" }).

seg-ef191c1d3db1 = Ionosfærefri kombinasjon av to frekvenser L1/L5 (IS-GPS-705)

seg-b69825ef05d3 = Med <c1/>, <c2/>, <c3/>:

seg-ce81c6b71738 = Den første ordens ionosfæriske forsinkelsen (<c1/>) kanselleres nøyaktig — bekreftet mot motorens uavhengige <c2/>-fysikk for en rekke TEC-verdier (total electron content). Støyforsterkningen for innganger med lik varians er <c3/>.

seg-e111fb05a7c6 = <b>I repoet, automatisert</b> (ved hver commit): K-faktorene mot sine fordelingsdefinisjoner, <c1/> og de ionosfærefrie (IF) koeffisientene mot frekvensene i IS-GPS-705 (IS: Interface Specification), første ordens ionosfærekansellering mot den uavhengige forsinkelsesfysikken, og beskyttelsesnivåene med vektet minste kvadraters metode (WLS) mot en numpy-referansegeometri <c2/> (<c3/>).

seg-f30d84abe275 = <b>Ekstern uavhengig referanse, automatisert</b> (<c1/>): gitt hver satellitts elevasjon, azimut og totale 1-σ gjengir <c2/> HPL fra en uavhengig implementasjon, <c3/> i RTKLIB-gaffelen for SBAS-beskyttelsesnivå (RTKLIB er et åpen kildekode-bibliotek for sanntids kinematisk posisjonering) <c4/> (Siki & Takács { "2017" }), på seks epoker som verktøyet beregnet fra <b>virkelige EGNOS-kringkastingsmeldinger</b> (European Geostationary Navigation Overlay Service) (geostasjonær PRN (pseudo-random noise code number) { "120" }) og virkelige RINEX-observasjoner (Receiver Independent Exchange Format) fra stasjonen BUTE i Budapest (2017-02-19), til <b>< { "2e-3" } m</b>. Referansen runder K_V til { "5.33" }, så det vertikale sammenlignes uten K-faktor, som <c5/> mot sin VPL / { "5.33" }. ESA (European Space Agency) gLAB { "v6.0.0" } (<c6/>) bruker den samme formelen.

seg-389e8a57e3e8 = <b>Ikke gjort</b>: σ per satellitt er referansens egen; å modellere σ fra rå UDRE/GIVE-meldinger ligger utenfor omfanget, og ingen offisielt publisert beskyttelsesnivåprodukt for WAAS (Wide Area Augmentation System) eller EGNOS er gjengitt fra ende til ende. DO-229E/DO-316 er selv bak betalingsmur hos RTCA; den åpne utledningskilden er ESA Navipedias sider om ICAO/EGNOS (ICAO: International Civil Aviation Organization) SBAS.

seg-7686fb3d3e0c = <s1>Forrige</s1>ARAIM-referanse

seg-0457ef382fb0 = <s1>Neste</s1>Kryssreferanse for robusthet
