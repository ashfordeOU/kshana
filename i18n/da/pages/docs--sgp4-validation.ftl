# docs--sgp4-validation: translations (da)

seg-3c513ef2fd3b = Størrelse

seg-09da3685124b = Kilde: <c1/>

seg-dd68e234a5cd = Validering af SGP4/SDP4 mod fællesskabets reference

seg-d7567fa218fe = Kshanas banepropagator er valideret mod fællesskabets <b>kanoniske reference</b> for SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): de verifikationsvektorer, der er offentliggjort sammen med Vallado et al., <em>"Revisiting Spacetrack Report #3"</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), distribueret som <c1/> (test-TLE'erne (two-line element sets)) og <c2/> (den forventede TEME (true equator, mean equinox)-tilstand ved hvert tidspunkt). Det er den samme reference, som de offentlige C++/Python/MATLAB-implementeringer valideres mod, så når resultaterne stemmer her, stemmer de med de facto-standarden.

seg-b99fb640886c = Sammenlignede referencetilstande

seg-b16a220a41b7 = (alle rækker i <c1/>, fastlåst i testen)

seg-e7d45e243571 = Største positionsfejl

seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satellit { "23333" }; < tolerance på <c1/> km)

seg-01da72026e56 = Største hastighedsfejl

seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satellit { "23333" }; < tolerance på <c1/> km/s)

seg-041cbc679ed7 = Dækkede tilfælde

seg-283f3c571a7c = SGP4 for nær Jorden, SDP4 for dybt rum (lunisolar + { "12" } t/24 t resonans) og de bevidste fejlkodetilfælde

seg-75c2bd004348 = Tilfældene for dybt rum og resonans betyder noget specifikt for dette projekt: GNSS (globalt navigationssatellitsystem)-satellitter befinder sig i baner på ~{ "12" } t, der er dybt rum og resonante, og som en to-legemers + J2-sekulær model ikke kan gengive — SGP4/SDP4 kan.

seg-613697670501 = Metode

seg-d753e2f76b4a = Implementeringen (<c1/>) er en afhængighedsfri Rust-portering af Vallados algoritme i offentlig eje; epokehåndteringen er dage siden 1950, tilstanden <c2/> (ikke <c3/>) bruges, og WGS-72 (WGS: World Geodetic System)-tyngdekonstanter anvendes, som referencen foreskriver.

seg-ebc18c4cb8ad = Testen (<c1/>) parser de medleverede fixtures <c2/> og <c3/> (<c4/>), propagerer hver testsatellit til hvert referencetidspunkt og kontrollerer, at TEME-position og -hastighed stemmer inden for tolerancerne ovenfor. Antallet af sammenlignede rækker er fastlåst til præcis <c5/>, så en regression i en fixture eller i håndteringen af springover ikke stille kan mindske dækningen.

seg-d0566d4db829 = Reproducér det

seg-ba3ed7f0aba7 = Testen udskriver antallet af sammenlignede rækker og de værste fejl i position og hastighed. Fixtures er committet, så kontrollen er fuldt offline og deterministisk.

seg-4f539e17926e = Uafhængig krydskontrol mod cratet <c1/>

seg-0c2d2752179f = At stemme med den offentliggjorte reference beviser korrekthed mod en <em>tabel</em>. For også at bevise korrekthed mod en <em>uafhængig implementering</em> kører <c1/> et udbredt, uafhængigt Rust-bibliotek til SGP4, cratet <a1><c2/></a1> (neuromorphicsystems/sgp4, version { "2.4" }), over de samme { "666" } AIAA-vektorer og sammenligner de to kodebaser direkte. Begge køres med tyngdemodellen <b>WGS72</b> (World Geodetic System { "1972" }), som vektorerne er defineret i (cratets standard <c3/> bruger WGS84 (World Geodetic System { "1984" }), som afviger fra WGS72-referencen med ~km — et modelvalg, åbent anført, ikke en fejl).

seg-da0e4e6c9e96 = Område

seg-a6eefd68c27c = kshana ↔ reference

seg-e725899898a3 = crate ↔ reference

seg-427820fec0e7 = kshana ↔ crate

seg-6305527acfa4 = nær Jorden (LEO/MEO (LEO: lav jordbane; MEO: mellemhøj jordbane))

seg-081e28a39101 = { "7.3e-9" } km

seg-e68c97a6528a = { "4.4e-10" } km

seg-4c34e8e2f4c4 = dybt rum (ikke-resonant)

seg-12e758e04df0 = { "4.1e-6" } km

seg-db82b835dec9 = { "2.1e-7" } km

seg-d7d4f47417bc = resonans i dybt rum (½-døgn)

seg-17007f8aada3 = { "8.1e-9" } km

seg-895ba7518ab3 = { "7.7e-9" } km

seg-be5a634658e5 = { "2.2e-9" } km

seg-6cf60f32cbcd = resonans i dybt rum (1-døgn)

seg-7698aecab6b4 = { "8.2e-9" } km

seg-60520079d492 = { "7.8e-9" } km

seg-c22876d62c29 = To uafhængige implementeringer stemmer til <b>under en mikrometer</b> for baner nær Jorden og resonante baner og til <b>{ "4.12" } mm i værste fald</b> på tværs af alle områder — de samme { "4.12" } mm, som er Kshanas egen afvigelse fra referencen, altså er uenigheden <em>netop</em> det ene tilfælde i dybt rum, hvor cratet ligger mellem Kshana og tabellen. Den fulde tabel (med antal rækker for hvert område og de fire patologiske tilfælde, som cratet afviser ved konstruktion) er committet i <a1><c1/></a1> og regenereres via <c2/>.

seg-3aae516df868 = Status for "udgivelse" af dette resultat

seg-2dd4b77c49d1 = Selve krydsvalideringen er færdig og ligger i træet. At indsende resultatet til eksterne fora (et fællesskabskatalog, en kort note, en post arkiveret med DOI (DOI: digital object identifier)) er en handling for vedligeholderne, som følges separat i køreplanen; dette dokument er den optegnelse i repositoryet, som disse indsendelser ville pege på.

seg-b36bbcc0a0c8 = <s1>Forrige</s1>EN { "16803" }

seg-4d5234d85d9f = <s1>Næste</s1>Validering af kraftmodeller

seg-6539dbb48bca = Uafhængig krydskontrol mod crate'et sgp4
