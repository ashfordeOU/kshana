# docs--kind-clock: translations (da)

seg-debc2f07db78 = true

seg-33555d61ddc6 = Kilde: <c1/>

seg-618393657d01 = <c1/> (scenarietype)

seg-c61e88721556 = Scenarietype i motoren v{ $version }, familie <a1>Ure, tidssynkronisering og holdover</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-78cba87823f7 = Ur-holdover mod specifikation; valgfrit Monte Carlo-ensemble (runs > { "1" }).

seg-dd2ad570a6c9 = Én kørsel af <c1/> opsummeres som: scenario 91d2b6d10d14 | { "200" } kørsler | kvante-holdover 6600s [6600-6600] p95 8.78e-4ns sikkerhed n/a (intet angreb) | klassisk holdover 844s [220-2130] p95 167.0ns sikkerhed n/a (intet angreb)

seg-51820163de28 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-80fe14eb5e79 = Valgfrie felter: <c1/>, <c2/>

seg-807e7c5a2565 = Eksemplet <c1/> angiver blandt andet:

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC-datablad sigma_y(1s)={ "3e-10" }; q_

seg-a8d92406e428 = Strontium-optisk gitterur, rumorienteret mål sigma_y

seg-0cd8dc81045c = { "4" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-cb0b7da83f5c = Diagrammet, som motoren skriver for scenarios/clock-ensemble.toml, type clock

seg-5b3dbe0aed82 = <b>MODELLED</b> Den valgfrie [integrity]-sektion i urtypen (clock_integrity::run): ud fra et angivet sted og konstellationsforudindstillinger (geometry::sky_geometry), ved hver integritetsepoke, mens GNSS-tidslinjen ikke er nægtet, snapshot-RAIM (raim::snapshot_ Tests: <a1>clock_integrity.rs</a1>.

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: ét parserlag, der omsætter en RINEX-urfil (AS/AR-poster for ét navngivet ur, versionerne { "2" } og { "3.00" } til { "3.04" }), en ASCII-fase- eller frekvenslog i TimeLab-stil eller en TAPR TICC-tidsstempel- eller intervallog til en ensartet pha Tests: <a1>clock_log_allantools.rs</a1>.

seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input med formaterne ptp4l, phc2sys, ts2phc, chrony-tracking og chrony-statistics: den loggede offset for en linuxptp-servolinje (ns, linjens eget tidsstempel i klammer, aflæsninger før servoen første gang rapporterer s2 udeladt a

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modificeret/Hadamard-afvigelse + identifikation af potenslovsstøj med χ²-konfidensintervaller. Uafhængig reference (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-referenceafvigelser på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Lukket form for vækst i fejl under frit løb + holdover til tærskel; kvanteurklasser. Uafhængig reference (ReferenceImpl): Flertrins clock_state-kovariansrekursion (krydskontrol i samme kodebase); selve kernen for frit-løb-varians og holdover-inversion er eksternt valideret mod scipy (se 'Clock-holdover coast-variance & threshold inversion'). Tallene for holdover pr. klasse ved rødstøjsgulvet forbliver MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilstands (fase/frekvens/drift) van Loan-Kalman-ur, Joseph-stabiliseret. Uafhængig reference (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm og Q via Van-Loan { "1978" }-blokmatrixen — en uafhængig referenceimplementering, der gengiver kshanas fulde filterforløb. Konsistens mellem implementeringer: urfysikken / Allan-kalibreringen er ikke eksternt valideret, så dette forbliver MODELLED. { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): på IGS final { "30" } s-ure fra { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Urstøttet χ², RAIM, AGC, SQM sammenlagt sikkerhedskvalitetsmål pr. epoke. Uafhængig reference (ExternalDataset): TEXBAT-scenarieparametre (Humphreys { "2012" }) — karakterisering, ikke fastlåste vektorer. { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): på JammerTest { "2024" } (Bleik; GPL-3.0-data) udløste monitorerne på observabelniveau (urstøttet chi-i-anden, RAIM, løsningsfejl) ingen alarm inden for { "10" } s af nogen af de { "8" } evaluerbare publicerede spoofing-starter (hvor vinduet før starten var rent, kom den første alarm { "10.2" } til { "39" } s efter pu

seg-e12f672ae71d = Ur-holdover i GNSS-nægtede miljøer er MODELLED, ikke valideret: kontrolleret mod en separat implementering i denne samme kodebase — uafhængig af den enhed, der afprøves, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Tilstandsestimering af ombordur er MODELLED, ikke valideret: kontrolleret mod en separat implementering i denne samme kodebase — uafhængig af den enhed, der afprøves, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detektion af spoofing er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Familieside: <a1>Ure, tidssynkronisering og holdover</a1>

seg-ee7dd15019d0 = Emneside: <a1>CAMPAIGNS.md</a1>

seg-46ed0b786244 = Emneside: <a1>RECEIVER-TRUST.md</a1>

seg-e06f9a5a0291 = <s1>Forrige</s1>cislunar-observability

seg-aba9395185fa = <s1>Næste</s1>combined-altpnt

seg-d1beb62cf742 = { "6" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-936e96edf423 = <b>MODELLED</b> Typen <c1/>: et dokument af faser, hver en af otte registrerede typer, kørt i rækkefølge, hvor 6x6-kovariansen, uret og referencesystemet gives videre efter en angiven regel (<c2/>; <c3/>, hvid accelerationsstøj over et angivet hul Tests: <a1>field_units_global.rs</a1>.

seg-3319b18ac61f = og { "1" } flere i matricen.
