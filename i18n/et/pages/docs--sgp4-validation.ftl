# docs--sgp4-validation: translations (et)

# text
seg-3c513ef2fd3b = Suurus

# text
# c1: docs/SGP4-VALIDATION.md
seg-09da3685124b = Allikas: <c1/>

# text
seg-dd68e234a5cd = SGP4/SDP4 valideerimine kogukonna etaloni vastu

# text
# c1: SGP4-VER.TLE
# c2: tcppver.out
seg-d7567fa218fe = Kshana orbiidi levitaja on kontrollitud SGP4/SDP4 <b>kanoonilise kogukonna etaloni</b> vastu (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): Vallado et al. artikliga <em>„Revisiting Spacetrack Report #3“</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753) avaldatud kontrollvektorid, mida levitatakse failidena <c1/> (testi TLE-d (kaherealised elemendikomplektid)) ja <c2/> (oodatud TEME (tõeline ekvaator, keskmine pööripunkt) olek igal ajahetkel). See on sama etalon, mille vastu valideeritakse avalikke C++/Python/MATLAB realisatsioone, seega on kokkulangevus siin kokkulangevus de facto standardiga.

# text
seg-b99fb640886c = Võrreldud etalonolekud

# text
# c1: tcppver.out
seg-b16a220a41b7 = (kõik read failis <c1/>, testis kinnitatud)

# text
seg-e7d45e243571 = Halvim positsiooniviga

# text
# c1: 2e-5
seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satelliit { "23333" }; < <c1/> km tolerants)

# text
seg-01da72026e56 = Halvim kiiruse viga

# text
# c1: 1e-6
seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satelliit { "23333" }; < <c1/> km/s tolerants)

# text
seg-041cbc679ed7 = Kaetud juhud

# text
seg-283f3c571a7c = Maalähedane SGP4, kaugkosmose SDP4 (Kuu-Päikese + { "12" } h/24 h resonants) ja tahtlikud veakoodi juhud

# text
seg-75c2bd004348 = Kaugkosmose ja resonantsjuhud on selle projekti jaoks eriti olulised: GNSS (ülemaailmne satelliitnavigatsioonisüsteem) satelliidid asuvad ~{ "12" } h orbiitidel, mis on kaugkosmose- ja resonantsorbiidid, mida kahekeha + J2-sekulaarne mudel taasluua ei suuda — SGP4/SDP4 suudab.

# text
seg-613697670501 = Meetod

# text
# c1: src/sgp4.rs
# c2: improved
# c3: afspc
seg-d753e2f76b4a = Realisatsioon (<c1/>) on avaliku omandi Vallado algoritmi sõltuvusteta Rust-port; epohhi käsitlus on päevad alates 1950. aastast, kasutatakse režiimi <c2/> (mitte <c3/>) ning WGS-72 (WGS: World Geodetic System) gravitatsioonikonstante rakendatakse nii, nagu etalon ette näeb.

# text
# c1: tests/sgp4_verification.rs
# c2: SGP4-VER.TLE
# c3: tcppver.out
# c4: tests/fixtures/sgp4/
# c5: 666
seg-ebc18c4cb8ad = Test (<c1/>) parsib kaasatud <c2/> ja <c3/> fixture'id (<c4/>), levitab iga testsatelliiti igale etalonajale ning kinnitab, et TEME asukoht ja kiirus langevad kokku ülaltoodud tolerantsidega. Võrreldud ridade arv on kinnitatud täpselt väärtusele <c5/>, et fixture'i või vahelejätmiskäitumise regressioon ei saaks katet märkamatult vähendada.

# attr:aria-label, text
seg-d0566d4db829 = Reprodutseeri see

# text
seg-ba3ed7f0aba7 = Test trükib võrreldud ridade arvu ning halvima juhu positsiooni- ja kiiruseviga. Fixture'id on sisse kirjutatud, seega on kontroll täielikult võrguväline ja deterministlik.

# text
# c1: sgp4
seg-4f539e17926e = Sõltumatu ristkontroll crate'iga <c1/>

# text
# c1: tests/sgp4_crate_comparison.rs
# c2: sgp4
# c3: from_elements
seg-0c2d2752179f = Avaldatud etaloniga kokkulangemine tõestab õigsust <em>tabeli</em> suhtes. Et tõestada õigsust ka <em>sõltumatu realisatsiooni</em> suhtes, käivitab <c1/> laialt kasutatud sõltumatu Rusti SGP4 teegi, crate'i <a1><c2/></a1> (neuromorphicsystems/sgp4, versioon { "2.4" }), samade { "666" } AIAA vektorite peal ja võrdleb kahte koodibaasi vahetult. Mõlemat käitatakse <b>WGS72</b> (World Geodetic System { "1972" }) gravitatsioonimudeliga, milles vektorid on määratletud (crate'i vaikimisi <c3/> kasutab WGS84 (World Geodetic System { "1984" }), mis erineb WGS72 etalonist ~km võrra — modelleerimisvalik, mis on ausalt esile toodud, mitte viga).

# text
seg-da0e4e6c9e96 = Režiim

# text
seg-a6eefd68c27c = kshana ↔ etalon

# text
seg-e725899898a3 = crate ↔ etalon

# text
seg-427820fec0e7 = kshana ↔ crate

# text
seg-6305527acfa4 = maalähedane (LEO/MEO (LEO: madal Maa orbiit; MEO: keskmine Maa orbiit))

# text
seg-081e28a39101 = { "7.3e-9" } km

# text
seg-e68c97a6528a = { "4.4e-10" } km

# text
seg-4c34e8e2f4c4 = kaugkosmos (mitteresonantne)

# text
seg-12e758e04df0 = { "4.1e-6" } km

# text
seg-db82b835dec9 = { "2.1e-7" } km

# text
seg-d7d4f47417bc = kaugkosmose resonants (½ päeva)

# text
seg-17007f8aada3 = { "8.1e-9" } km

# text
seg-895ba7518ab3 = { "7.7e-9" } km

# text
seg-be5a634658e5 = { "2.2e-9" } km

# text
seg-6cf60f32cbcd = kaugkosmose resonants (1 päev)

# text
seg-7698aecab6b4 = { "8.2e-9" } km

# text
seg-60520079d492 = { "7.8e-9" } km

# text
# c1: tests/fixtures/sgp4_comparison.md
# c2: KSHANA_REGEN_FIXTURES=1 cargo test --test sgp4_crate_comparison
seg-c22876d62c29 = Kaks sõltumatut realisatsiooni langevad maalähedastel ja resonantsorbiitidel kokku <b>alammikroni</b> täpsusega ning kõigis režiimides <b>{ "4.12" } mm halvimal juhul</b> — sama { "4.12" } mm, mis on Kshana enda kõrvalekalle etalonist, st lahknevus <em>on</em> see üks kaugkosmose juhtum, kusjuures crate paikneb Kshana ja tabeli vahel. Täielik tabel (koos režiimipõhiste ridade arvudega ja nelja patoloogilise juhuga, mille crate konstrueerimisel tagasi lükkab) on kirjas failis <a1><c1/></a1> ja see genereeritakse uuesti käsuga <c2/>.

# text
seg-3aae516df868 = Selle tulemuse „avaldamise“ olek

# text
seg-2dd4b77c49d1 = Ristvalideerimine ise on lõpetatud ja hoidlas olemas. Tulemuse esitamine välistele väljaannetele (kogukonna kataloog, lühimärkus, DOI-arhiveeritud (DOI: digitaalne objektitunnus) kirje) on hooldaja tegevus, mida jälgitakse eraldi teekaardil; see dokument on hoidlasisene kirje, millele need esitused viitaksid.

# text
seg-b36bbcc0a0c8 = <s1>Eelmine</s1>EN { "16803" }

# text
seg-4d5234d85d9f = <s1>Järgmine</s1>Jõumudeli valideerimine

# text
seg-6539dbb48bca = Sõltumatu ristkontroll sgp4 crate'iga
