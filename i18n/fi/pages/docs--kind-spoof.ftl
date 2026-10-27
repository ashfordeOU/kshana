# docs--kind-spoof: translations (fi)

seg-f42465f7d066 = ns

seg-debc2f07db78 = true

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-f4cf8b629797 = Aihesivu: <a1>INTEGRITY.md</a1>

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC -tietolehti sigma_y(1s)={ "3e-10" }; q_

seg-a8d92406e428 = Strontiumin optinen hilakello, avaruuteen suunnattu tavoite sigma_y

seg-b9174c70772f = <b>MODELLED</b> Kelloavusteinen χ², RAIM, AGC, SQM yhdistettynä epookkikohtaiseksi tietoturvan laatumittariksi. Oraakkeli (ExternalDataset): TEXBAT-skenaarioparametrit (Humphreys { "2012" }) — luonnehdinta, ei kiinnitettyjä vektoreita. { "0.30" } ulkoinen vertailu, havainto (jää tasolle MODELLED): aineistolla JammerTest { "2024" } (Bleik; GPL-3.0-data) havaintotason monitorit (kelloavusteinen khiin neliö, RAIM, ratkaisun epäonnistuminen) eivät antaneet hälytystä { "10" } s kuluessa yhdestäkään { "8" } arvioitavissa olevasta julkaistusta harhautuksen alkamisesta (kun alkamista edeltävä ikkuna oli puhdas, ensimmäinen hälytys tuli { "10.2" }–{ "39" } s julk

seg-e4b64d7277da = Harhautuksen (spoofing) havaitseminen on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-ee7dd15019d0 = Aihesivu: <a1>CAMPAIGNS.md</a1>

seg-5a70fcb097dc = Valinnaiset kentät: ei yhtään

seg-304496607bd7 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Häirintä (jamming), harhautus (spoofing) ja spektri</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-5d23d7f8f872 = Perhesivu: <a1>Häirintä (jamming), harhautus (spoofing) ja spektri</a1>

# text
seg-03d8dc3de7ca = <b>MODELLED</b> Kelloavusteinen χ², RAIM, AGC, SQM fuusioituna epookkikohtaiseksi turvallisuuden laatumittariksi Testit: <a1>spoof_texbat_validation.rs</a1>.

# text
# c1: docs/kinds/by-kind/spoof.md
seg-09125f609abe = Lähde: <c1/>

# text
# c1: spoof
seg-8bf73eca4115 = <c1/> (skenaariolaji)

# text
seg-cbd77f6ffd63 = Stokastinen ajanharhautuksen ilmaisin (Neyman–Pearson / χ²₁) Monte Carlo -P_fa/P_md:llä.

# text
# c1: scenarios/spoof-attack.toml
seg-2a1e4e7893ba = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: scenario 2b6bd22c3b80 | spoof LinearRamp { "{" } rate_ns_per_s: { "0.1" } { "}" } vs { "20.000" } ns spec (P_fa { "0.010" }) | quantum security { "1.000" } (P_md { "0.000" }, MC { "0.000" }) detected 70s | classical security { "0.558" } (P_md { "0.442" }, MC { "0.444" }) detected 430s

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-b577342dfe39 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/spoof-attack.toml
seg-adb7ff15a702 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# attr:alt
seg-6f6a8c975111 = Moottorin kirjoittama kaavio skenaariolle scenarios/spoof-attack.toml, laji spoof

# text
# c1: leo-pass
# c2: [spoofer]
seg-ecc2dc8489bb = <b>MODELLED</b> Lajin <c1/> osio <c2/>: harhautuslähetin väärentää johdonmukaisesti etäisyyden ja etäisyysnopeuden suhteen signaalit, jotka nähdään väitetyssä paikassa, joka hyppää ja/tai jota työnnetään todellisesta alkamishetken jälkeen (LEO-kaistaa kohden ja MEO Testit: <a1>leo_resilience_verticals.rs</a1>.

# text
# c1: [spoofer]
seg-8b3523b5fa2c = <b>MODELLED</b> Jokaiselle LEO-satelliitille ja etäisyysmittauskaistojen parille osio <c1/> muodostaa geometriasta vapaan pseudoetäisyysyhdistelmän, poistaa vastaanottimen ionosfäärimallin ja testaa sen epookista toiseen -askeleen kahden kaistan koodikohinaa ja st vastaan Testit: <a1>leo_resilience_verticals.rs</a1>.

# text
seg-e5bbd2fca4fb = <s1>Edellinen</s1>spoof-detect

# text
seg-8d3311751876 = <s1>Seuraava</s1>sweep-nd
