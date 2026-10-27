# docs--deceived-time: translations (et)

# text
# c1: docs/DECEIVED-TIME.md
seg-d46702617926 = Allikas: <c1/>

# text
seg-f44d01df7b1c = Petetud ajal rakendatud allkirjastatud käsk suunab ikkagi valesti

# text
seg-6497012e401e = Tehniline märkus ajaindekseeritud võrkude käitajatele: konstellatsioonid, mis suunavad, ülesandestavad või annavad üle ajakava järgi, kus iga sõlm tegutseb, kui selle enda kell jõuab ajastatud hetkeni.

# text
seg-714bce435435 = Lühendid: GNSS, ülemaailmne satelliitnavigatsioonisüsteem; TPL, ajastuse kaitsetase; PNT, positsioneerimine, navigatsioon ja aeg.

# text
seg-a7208323de1c = Väide

# text
# c1: δ
# c2: T
# c3: T + δ
# c4: |δ|
seg-246715a1c559 = Juhtsõnumite autentimine, sh kvantjärgsete allkirjadega, tõestab, kes sõnumi saatis ja et seda ei muudetud. See ei tõesta, <b>millal vastuvõtja sellele reageerib</b>. Sõlm täidab ajaindekseeritud käsu oma kella vastu. Kui seda kella on tõmmatud võrra <c1/>, käivitub hetkeks <c2/> kehtiv käsk tõelisel ajal <c3/>, kõigi allkirjade terviklikuna. Kui <c4/> ületab pesakaitse, satub liiklus valesse pessa, link lülitub, samal ajal kui teine ots on veel mujale suunatud, või üleandmine toimub vara. Võrk suunab valesti ja iga terviklikkuse kontroll käsuteel teatab õnnestumisest.

# text
seg-8683f0749042 = Miks kell on pehme sihtmärk

# text
seg-1af5aea2ef5b = <b>GNSS-i aeg on tavaline etalon ja seda saab spuufida.</b> Sõlm, mis distsiplineerib oma kella GNSS-i külge, pärib mis tahes aja, mida vastuvõtja annab. Spuufija, mis hoiab vastuvõtja enda kvaliteedilipud rohelisena, võib seda aega aeglaselt tõmmata.

# text
# c1: T + w
seg-354a4c706264 = <b>Värskuse kontrollid kasutavad sama kella.</b> Kehtivusaken („aktsepteeri see käsk kuni <c1/>“) või ajaga seotud kordusloendur hinnatakse kohaliku kella vastu, nii et tõmmatud kell võib laiendada ka akent, milles püütud allkirjastatud käsk aktsepteeritakse.

# text
seg-a4b8a5db0975 = <b>Rünnak ei vaja võtit.</b> Allkirjastatud kanalis ei puututa midagi. Tugevam krüptograafia tõstab käsu võltsimise hinda ja jätab selle hinna muutmata.

# text
seg-e514b03fbae3 = See asub kvantjärgse töö kõrval, mitte selle vastu: need kaks sulgevad erinevaid auke. Allkirjad peatavad võltsitud käsu. Aja terviklikkus peatab ehtsa käsu täitmise vales hetkes.

# text
seg-09f493386dbc = Mis seda piirab

# text
# c1: slot-timing
# c2: SLOT-TIMING.md
seg-750bd90b0ee1 = Neli meedet, igaüks kvantifitseeritud stsenaariumi liigiga <c1/> (<a1><c2/></a1>):

# text
seg-77cf39b434b5 = <b>Kellaabistatud monitor.</b> Võrrelda GNSS-i aega sõlme enda kellaga, mis libiseb akna jooksul, ja anda alarm, kui erinevus on liiga suur, et olla kellamüra. Tingimuslik TPL piirab viga, mis võib enne alarmi märkamata jääda.

# text
seg-e58f7fb94ac5 = <b>Sõltumatud kontrollid, ajastatud.</b> Maajaama kahesuunaline aja edastamine või ristlingi võrdlus naabriga, kes on spuufija ulatusest väljas, piirab, kui kaua aeglane tõmme võib kesta. Nende uuesti külastamise intervall on turvaparameeter, mitte ainult tegevuslik.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-69590f56817c = <b>Geomeetria.</b> Maapealne spuufija ulatub madala Maa orbiidi satelliidini ainult siis, kui see on spuufija silmapiiri kohal, nii et tõmmet piirab spuufija tõusukiirus korrutatud selle aknaga. Aritmeetikana: { "10" } ns/s ramp, mida hoitakse { "600" } s, on { "6" } µs. Kaasasolev näide (<c1/>: { "550" } km orbiit, { "10" } ns/s maksimaalne ramp) annab { "732" } s spuufija kokkupuute ja rampiga piiratud tõmbe { "7 321" } ns.

# text
seg-e8e52ce05943 = <b>Piirist mõõdetud pesakaitse ja ohutu tegevus alarmi korral.</b> Pesakaitse peaks katma suurima märkamata vea, mida monitor ja kontrollid lubavad, mitte ainult kella vabalt jooksva müra. Alarmi korral peaks sõlm hoidma oma viimast head ajakava oma libisevas kellal, mitte järgima GNSS-i.

# text
seg-c11b66f214ac = Mida see märkus ei väida

# text
seg-8b0ed39ead25 = See ei väida, et spuufitud satelliit on täheldatud valesti suunamas; see ei hinda ühegi käitaja kokkupuudet; ja piirid, millele see viitab, on MODELLED, tingimuslikud tuvastamisest ja öeldud ohueeldustest. See väidab kompositsiooni: kehtiv allkiri ja õige täitmisaeg on eraldi omadused ning ajaindekseeritud võrk vajab mõlemat.

# text
seg-c1bf6467e3c9 = <s1>Eelmine</s1>Telekomi ajastus

# text
seg-d4e9bfd42982 = <s1>Järgmine</s1>Holdover-test ja ajastusriistvara ahelas
