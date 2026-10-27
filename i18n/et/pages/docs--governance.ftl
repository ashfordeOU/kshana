# docs--governance: translations (et)

# text
# c1: GOVERNANCE.md
seg-26440a254ba8 = Allikas: <c1/>

# text
seg-5f8e9a4a15be = Kshana juhtimine

# text
seg-b20b74b77755 = Käesolev dokument kirjeldab, kuidas Kshanat juhitakse: kes teeb otsuseid, kuidas ja mida projekt omaks võtab ning mida mitte. See on tahtlikult <b>kerge</b> — vastavuses projekti praeguse suurusega — ning ausalt märgib praegust ühe hoidja olukorda ja teed laiema juhtimiseni kogukonna kasvades.

# text
seg-1e0c276811e2 = Missioon ja ulatus

# text
# c1: docs/CAPABILITY.md
# c2: docs/VALIDATION.md
seg-5dcc38148cf4 = Kshana on <b>neutraalne, reprodutseeritav ja ausalt valideeritud etalon hübriidse kvant-/klassikalise PNT toimivuse ja vastupidavuse jaoks</b>. Missioon seab läve igale otsusele: õigsus, viited ja reprodutseeritavus laiuse ees. Aus ulatus on dokumenteeritud failis <a1><c1/></a1> ja valideerimise seis failis <a2><c2/></a2>; ettepanekuid kaalutakse selle ulatuse, mitte funktsioonide arvu alusel.

# text
seg-d331a1cfc60b = Rollid

# text
# c1: contact@ashforde.org
seg-88bb2a831125 = <b>Hoidja.</b> Kshanat hoiab praegu selle asutaja Ashforde OÜ (kontakt: <c1/>). Hoidja teeb lõpliku otsuse ulatuse, disaini, väljalasete ja ühendatava sisu üle. See on heatahtliku hoidja mudel, mida öeldakse välja selgelt, mitte ei maskeerita komiteeks, mida ei ole.

# text
# c1: CONTRIBUTING.md
seg-8e1da46f9b0b = <b>Kaastöötajad.</b> Igaüks, kes avab probleemi (issue) või tõmbepäringu. Kaastöödele kehtib lävi failis <a1><c1/></a1> — iga arvulise parameetri päritolu, valideerimine avaldatud seose vastu ja ausus küpsuse osas.

# text
seg-d212e17ac218 = <b>Tulevased kommitijad.</b> Kui järjekindel ja kvaliteetne kaastöö seda õigustab, laiendatakse usaldusväärsetele kaastöötajatele muutmisõigust ning käesolev dokument ajakohastatakse mitme hoidjaga mudeliks (otsused laisa konsensusega, vaidlused lahendab hoidjate rühm). Seni on tee järgmine: teha kaastööd, kujundada usaldusväärne tegevusajalugu ja saada kutse.

# text
seg-91e3f1919016 = Kuidas otsuseid tehakse

# text
seg-0d45899c92f4 = <b>Avatud arutelu.</b> Sisulised muudatused algavad GitHubi probleemina (issue), et põhjendus, alternatiivid ja kompromissid oleksid kirjas.

# text
seg-88916dd2357b = <b>Lazy consensus (lai konsensus vaikimisi nõusolekuga).</b> Ettepanek, millele mõistliku aja jooksul püsivat vastuväidet ei ole ja mis ületab allpool toodud tehnilise läve, liigub edasi.

# text
seg-788566515dad = <b>Hoidja otsustab lahkarvamuse korral.</b> Kui konsensust ei saavutata, otsustab hoidja ja kirjutab põhjuse üles. Lahkarvamus lahendatakse missiooni ja tehnilise läve alusel, mitte staaži ega mahu põhjal.

# text
seg-e45e1b565e62 = Tehniline lävi (läbirääkimatu)

# text
seg-2c397872e2f5 = Need on ranged invariandid, mida jõustavad CI ja ülevaatus ning mida ükski otsus ei tühista:

# text
# c1: (scenario, seed, engine_version)
seg-70cb5a174c2f = <c1/> peab käivituse bitthaaval taasesitama. Muudatus, mis teeb selle mittedeterministlikuks, on viga, mitte funktsioon.

# text
seg-b8733ea97546 = <b>Päritolu.</b> Anonüümseid arvulisi konstante ei ole — iga parameeter viitab allikale.

# text
# c1: validated
# c2: modelled
# c3: not modeled
# c4: src/verification.rs
seg-55a09b775418 = <b>Valideerimise ausus.</b> Iga võimekus on märgitud kui <c1/> (välise sõltumatu etaloni vastu) või <c2/> / <c3/>. Midagi ei väideta tõenditest kaugemale. Vt masinkontrollitud maatriksit failis <c4/>.

# text
# c1: scripts/check-no-attribution.sh
seg-dd339a396698 = <b>Hügieen.</b> Automatiseeritud tööriista omistust ei ole kusagil kommitides, sisus ega ajaloos (jõustab <c1/>).

# text
seg-45733fea1709 = Muudatus, mis ei suuda läve täita, lükatakse tagasi, olgu see kui tahes kasulik.

# text
seg-3eb0831d99a2 = Avatud ja suletud piir

# text
# c1: LICENSING.md
seg-ca7730a3d518 = Kshana on <b>open-core</b>. See hoidla on ja jääb täielikuks avatud AGPL-3.0 mootoriks — neutraalseks etaloniks, mida Ashforde OÜ pakub ka kommertslitsentsiga (vt <a1><c1/></a1>). Projekt <b>ei</b> võta avatud hoidlasse vastu järgmist:

# text
# c1: CONTRIBUTING.md
seg-8c2a89a3a4e2 = <b>Ekspordikontrolli alla kuuluv või kahesuguse kasutusega sügavus</b> — päris ohuteegid, vastase lainekujud või segamis- ja spuufimisvastased toimivusparameetrid. Avalik hoidla piirdub üldiste, avaldatud mudelite ja meetoditega (vt <c1/> → Export control). Kahtluse korral tuleks küsida <em>enne</em> kaastöö tegemist.

# text
seg-6df31d37cfe4 = Kliendi või partneri konfidentsiaalsed andmed või kalibreerimine.

# text
# c1: deny.toml
seg-b3b4a5384199 = <b>Copyleft-põhimõttega (GPL/AGPL/LGPL/MPL) <em>sõltuvused</em></b> — mitte sellepärast, et need läheksid vastuollu mootori enda AGPL-litsentsiga (ei lähe), vaid sellepärast, et neid ei saa <b>kommertsväljaandesse</b> ümber litsentsida: kommertslitsentsi saame müüa ainult koodile, mis on meie oma või lubav (permissive). Copyleft-sõltuvus rikuks kommertsväljaande ja kahe litsentsi mudeli. Sõltuvused jäävad seetõttu lubavaks (Apache/MIT/BSD/ISC), mida jõustab <a1><c1/></a1>.

# text
seg-ce264f3e43fe = Vastupidi, projekt <b>ei</b> tühjenda avatud tuuma, et suruda tulu suletud osale: valideeritud mootor, avalikud valideerimisankrud, ausaduse register (ledger), vahetus- ja standardvorming ning levikanalid jäävad avatuks. Avatud tuuma näljutamine on open-core mudeli ainus saatuslik viga ja see on välistatud.

# text
seg-947b3e9b1b2d = Väljalasked

# text
# c1: src/interchange.rs::SCHEMA_VERSION
seg-73e2bca0310d = <b>Semantiline versioonihaldus.</b> Enne versiooni 1.0 võib stsenaariumi- ja tulemuseskeem muutuda; tagasiühildumatud muudatused tuuakse välja ning vahetusskeemi versioon (<c1/>) on artefaktide ühilduvuse ainus tõeallikas.

# text
# c1: cargo publish
# c2: CONTRIBUTING.md
seg-71cace8b6144 = <b>Väljalaskevolitus.</b> Avaldamine (nt <c1/>) on hoidja käsitsi tehtav samm, mis nõuab registritõendit (token). CI ja sildiga käivitatav väljalasketöövoog <b>ei</b> avalda kunagi automaatselt väliseid registreid — need käivitavad ainult kõik kontrollid uuesti ja lisavad ehitusartefakti. Vt <c2/> → Commits and versioning.

# text
seg-59c37ffa54f0 = Käitumisjuhend ja turvalisus

# text
# c1: CODE_OF_CONDUCT.md
seg-2dc8c12568bc = Käitumist reguleerib <a1><c1/></a1>.

# text
# c1: SECURITY.md
seg-8574b73edbbc = Turvaprobleemide puhul järgitakse privaatse teatamise protsessi failis <a1><c1/></a1> — haavatavuse kohta ei tohi avada avalikku probleemi (issue).

# text
seg-d86d4e609713 = Kaubamärk

# text
seg-cb1314b67b2f = Kshana nimi ja logo on Ashforde OÜ kaubamärgid. Litsents (AGPL-3.0 või kommertslitsents) katab <b>koodi</b>, mitte kaubamärke: hargnenud versioon (fork) võib koodi litsentsi alusel kasutada, kuid mitte Kshana nime ega kanoonilist levitamisidentiteeti. See hoiab Ashforde'i viidatud tõeallikana ja on osa sellest, kuidas avatud tuum jääb neutraalseks etaloniks.

# text
seg-a678f6ed1af8 = Selle dokumendi muutmine

# text
seg-db90122245fa = Juhtimise muudatusi tehakse endiselt tõmbepäringuna ja otsustatakse ülalkirjeldatud protsessiga. Projekti mastaapide muutudes võib oodata, et dokumenti täiendatakse mitme hoidja otsustusmudeliga; tehnilist lävi see ei vähenda.

# text
seg-0a0712cca2e7 = Kerge juba kavandi poolest. Aus tänase suhtes, tulevikuks sõnastatud teega.

# text
seg-4bfa7cf23a41 = <s1>Eelmine</s1>Kaastöö tegemine

# text
seg-f67113e34738 = <s1>Järgmine</s1>Käitumisjuhend
