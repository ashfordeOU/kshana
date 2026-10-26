# docs--kinds-gps-denied-alternative-pnt: translations (nb)

seg-b03d56f501c3 = Type

seg-f496b7f4c63a = Kombinert navigator uten GPS med gravitasjon + magnetisme + terreng: tre skalare feltkanaler fusjonert per veipunkt for en skarpere posisjonsbestemmelse (lavere CRLB) av drift enn noe enkeltfelt.

seg-498b1aea3770 = Diagrammet motoren skriver for scenarios/combined-altpnt.toml, typen combined-altpnt

seg-c8f93431680a = MODELLED robusthet for lagdelt PNT i konflikt (P7): en bruker i et omstridt miljø har flere PNT-lag (åpen GNSS-tjeneste, bredbånds-GNSS, en autentisert konstellasjon, et augmentasjonsrelé), hver med en basistilgjengelighet, en 1σ-nøyaktighet og en sårbarhet for avvisning per vektor mot den felles jamming-/spoofing-trusselen. Et intensitetssveipet SEEDET Monte Carlo avviser hvert lag med sannsynlighet clamp(vulnerability·intensity·vector_weight,{ "0,1" }), fusjonerer de overlevende med den lukkede inversvariansregelen σ_fused=(Σ 1/σ_i²)^(−1/2), og rapporterer sannsynligheten for totaltap (alle lag avvist), median fusjonert feil og bruks-/avvisningsstatistikk per lag mot intensitet. Hovedforholdet for robusthet (sannsynlighet for totaltap med ett lag mot lagdelt) havner på ~7x under ANTAKELSEN OM UAVHENGIGHET; et énfaktors gaussisk copula-sveip med korrelert avvisning viser deretter at ~7x kollapser mot { "1" } når korrelasjonen i avvisning stiger (korrelasjon slår ut lagdeling). En blokk for forhåndssensitivitet lar hovedtallet variere over de KILDEBELAGTE sårbarhets-forhåndsfordelingene via mcda-tornado + en Dirichlet-omfordeling av trusselinnsats + persentil-konfidensintervaller. VALIDATED kjerne: Monte Carlo-totaltapet konvergerer mot det lukkede uavhengige produktet Π_i p_deny_i (innen MC-standardfeil ved fast seed og stort N); inversvarians-fusjonen er en lukket identitet; ved ρ={ "0" } reduseres copulaen til den uavhengige modellen og hver ρ bevarer hvert lags marginale avvisningsrate. MODELLED: størrelsene på sårbarhet/tilgjengelighet/nøyaktighet per lag er kildebelagte, men modellerte inndata (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), og den spesifikke størrelsen ~7x og formen på kurven for forhold mot korrelasjon følger av denne parametriseringen. En oppdeling av overlevelse per vektor i § { "4.2" } løser deretter den felles RF-trusselen opp i de fire navngitte vektorene (jamming/spoofing/kinetisk/cyber) og rapporterer hver vektors kurve for elegant degradering av brukbar PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: det seedede Monte Carlo per lag konvergerer mot den lukkede formen; jamming er den skarpeste vektoren for den korrelerte RF-grunnlinjen, og det RF-immune treghetslaget er den avgjørende overlevende. Ikke et sertifisert produkt for navigasjonstilgjengelighet.

seg-4dd2bcc206db = Diagrammet motoren skriver for scenarios/conflict-resilience.toml, typen conflict-resilience

seg-9a58a7b09423 = Navigasjon med gravitasjonskartsammenstilling uten GPS: et kaldatom-gravimeter gjenvinner en konstant INS-drift fra sekvensen av gravitasjonsanomalier den flyr gjennom.

seg-c42d90057e9f = Diagrammet motoren skriver for scenarios/gravity-map-nav.toml, typen gravity-map

seg-0d7bf5a4f07e = GPS-fri terrengreferert navigasjon (TERCOM/SITAN): en radar- eller barometrisk høydemåler sammenligner profilen for terrenghøyde mot en DEM i SRTM-stil for å gjenvinne INS-driften.

seg-c5e33c7122e2 = Diagrammet motoren skriver for scenarios/terrain-nav.toml, type terrain-nav

seg-6bdc150ab25b = GPS-fri sekvensiell (rekursiv) terrengreferert navigasjon: et partikkelfilter kjører målemodellen for terrengsammenligning epoke for epoke (SITAN som et løpende filter), slik at en tidsvarierende INS-drift følges langs sporet, der den grupperte terrain-nav kun gjenvinner en enkelt konstant forskyvning.

seg-4aca87f022dc = Diagrammet motoren skriver for scenarios/terrain-slam.toml, type terrain-slam

seg-4e31c8daf798 = Register

seg-efd15cff3d32 = MODELLED (resultatetikett)

seg-9d9aeff4f2ee = Kilde: <c1/>

seg-d9fdaf3208ca = Alternativ PNT uten GPS (scenariotypefamilie)

seg-9fde6af9e09f = { "5" } scenariotyper i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-0d3b170b9fbc = Temasider: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Kjør én: <c1/>. Alle familier: <a3>KINDS.md</a3>.

seg-6dfd2dc2721a = Kontaktark over diagrammene motoren skriver for typene i familien Alternativ PNT uten GPS

seg-cff60d8c17d2 = Sekvensiell (rekursiv) terrengreferert navigasjon uten GPS: et partikkelfilter kjører målemodellen for terrengtilpasning epoke for epoke (SITAN som et løpende filter) slik at en tidsvarierende INS-drift er tr

seg-9d8f69b51742 = MODELLED motstandsdyktighet i lagdelt PNT under konflikt (P7): en bruker i et omstridt miljø har flere PNT-lag (GNSS med åpen tjeneste, bredbånds-GNSS, en autentisert konstellasjon, et supplerende relé), hvert med

seg-28486745bb43 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Valgfrie: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

seg-c2187e8291f9 = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>gravity-map</a1>.

seg-b1ff6f0e1769 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Valgfrie: <c13/>, <c14/>, <c15/>.

seg-9bd19903f577 = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>terrain-nav</a1>.

seg-3ec7b38184b7 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valgfrie: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-7c777178ee8f = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>terrain-slam</a1>.

seg-c5124441822e = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Valgfrie: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

seg-d78bd011956c = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>combined-altpnt</a1>.

seg-2d95ddbf01c4 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-ab895b157152 = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>conflict-resilience</a1>.

seg-c0ef7d676ec1 = <s1>Forrige</s1>GNSS-målinger, posisjonsbestemmelse og integritet

seg-54b45b00a2f0 = <s1>Neste</s1>Treghets-, fusjons- og kvantesensorer
