# docs--sgp4-validation: translations (nb)

seg-3c513ef2fd3b = Størrelse

seg-09da3685124b = Kilde: <c1/>

seg-dd68e234a5cd = Validering av SGP4/SDP4 mot fellesskapets referanse

seg-d7567fa218fe = Kshanas banepropagator er validert mot <b>fellesskapets kanoniske referanse</b> for SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): verifikasjonsvektorene publisert med Vallado et al., <em>«Revisiting Spacetrack Report #3»</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), distribuert som <c1/> (test-TLE-ene (two-line element sets)) og <c2/> (den forventede TEME-tilstanden (true equator, mean equinox) ved hvert tidspunkt). Dette er den samme referansen de offentlige implementasjonene i C++/Python/MATLAB valideres mot, så at tallene stemmer her, betyr at de stemmer med de facto-standarden.

seg-b99fb640886c = Sammenlignede referansetilstander

seg-b16a220a41b7 = (alle rader i <c1/>, festet i testen)

seg-e7d45e243571 = Verste posisjonsfeil

seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satellitt { "23333" }; < toleransen <c1/> km)

seg-01da72026e56 = Verste hastighetsfeil

seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satellitt { "23333" }; < toleransen <c1/> km/s)

seg-041cbc679ed7 = Tilfeller som dekkes

seg-283f3c571a7c = SGP4 nær jorden, SDP4 i dypt rom (måne-sol + resonans på { "12" } t/24 t), og de bevisste feilkodetilfellene

seg-75c2bd004348 = Tilfellene i dypt rom og med resonans betyr spesielt mye for dette prosjektet: GNSS-satellitter (globalt satellittnavigasjonssystem) går i baner på ~{ "12" } t som er i dypt rom og med resonans, noe en modell med to legemer + sekulær J2 ikke kan gjengi — SGP4/SDP4 kan.

seg-613697670501 = Metode

seg-d753e2f76b4a = Implementasjonen (<c1/>) er en avhengighetsfri Rust-port av den offentlig tilgjengelige Vallado-algoritmen; epokehåndteringen er dager siden 1950, modusen <c2/> (ikke <c3/>) brukes, og WGS-72-gravitasjonskonstanter (WGS: World Geodetic System) brukes slik referansen angir.

seg-ebc18c4cb8ad = Testen (<c1/>) leser de medfølgende fixturene <c2/> og <c3/> (<c4/>), propagerer hver testsatellitt til hvert referansetidspunkt og kontrollerer at TEME-posisjon og -hastighet stemmer innenfor toleransene ovenfor. Antallet sammenlignede rader er festet til nøyaktig <c5/> slik at en regresjon i fixtur eller i hoppeoppførsel ikke i det stille kan redusere dekningen.

seg-d0566d4db829 = Reproduser det

seg-ba3ed7f0aba7 = Testen skriver ut antall sammenlignede rader og de verste posisjons- og hastighetsfeilene. Fixturene er sjekket inn, så kontrollen er helt frakoblet og deterministisk.

seg-4f539e17926e = Uavhengig krysskontroll mot craten <c1/>

seg-0c2d2752179f = Å stemme med den publiserte referansen viser korrekthet mot en <em>tabell</em>. For også å vise korrekthet mot en <em>uavhengig implementasjon</em> kjører <c1/> et mye brukt, uavhengig SGP4-bibliotek i Rust, craten <a1><c2/></a1> (neuromorphicsystems/sgp4, versjon { "2.4" }), over de samme { "666" } AIAA-vektorene og sammenligner de to kodebasene direkte. Begge kjøres med gravitasjonsmodellen <b>WGS72</b> (World Geodetic System { "1972" }) som vektorene er definert i (craten bruker som standard WGS84 (World Geodetic System { "1984" }) i <c3/>, som avviker fra WGS72-referansen med ~km — et modellvalg, oppgitt ærlig, ikke en feil).

seg-da0e4e6c9e96 = Regime

seg-a6eefd68c27c = kshana ↔ referanse

seg-e725899898a3 = crate ↔ referanse

seg-427820fec0e7 = kshana ↔ crate

seg-6305527acfa4 = nær jorden (LEO/MEO (LEO: lav jordbane; MEO: middels jordbane))

seg-081e28a39101 = { "7.3e-9" } km

seg-e68c97a6528a = { "4.4e-10" } km

seg-4c34e8e2f4c4 = dypt rom (uten resonans)

seg-12e758e04df0 = { "4.1e-6" } km

seg-db82b835dec9 = { "2.1e-7" } km

seg-d7d4f47417bc = resonans i dypt rom (½ døgn)

seg-17007f8aada3 = { "8.1e-9" } km

seg-895ba7518ab3 = { "7.7e-9" } km

seg-be5a634658e5 = { "2.2e-9" } km

seg-6cf60f32cbcd = resonans i dypt rom (1 døgn)

seg-7698aecab6b4 = { "8.2e-9" } km

seg-60520079d492 = { "7.8e-9" } km

seg-c22876d62c29 = To uavhengige implementasjoner stemmer overens til <b>under en mikrometer</b> for baner nær jorden og baner med resonans, og til <b>{ "4.12" } mm i verste fall</b> på tvers av alle regimer — de samme { "4.12" } mm som er Kshanas eget avvik fra referansen, det vil si at uenigheten <em>er</em> det ene tilfellet i dypt rom, med craten plassert mellom Kshana og tabellen. Den fullstendige tabellen (med radantall per regime og de fire patologiske tilfellene craten avviser ved opprettelse) er sjekket inn på <a1><c1/></a1> og genereres på nytt med <c2/>.

seg-3aae516df868 = Status for «publisering» av dette resultatet

seg-2dd4b77c49d1 = Selve krysskontrollen er fullført og ligger i kodetreet. Å sende resultatet til eksterne fora (en fellesskapskatalog, et kort notat, en post arkivert med DOI (DOI: digital objektidentifikator)) er en vedlikeholderhandling som følges opp separat i veikartet; dette dokumentet er posten i depotet som slike innsendinger ville peke til.

seg-b36bbcc0a0c8 = <s1>Forrige</s1>EN { "16803" }

seg-4d5234d85d9f = <s1>Neste</s1>Validering av kraftmodeller

seg-6539dbb48bca = Uavhengig krysskontroll mot craten sgp4
