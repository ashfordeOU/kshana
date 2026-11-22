# docs--kind-lunar-interop-export: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/lunar-interop-export.md
seg-d36e6d7d8a10 = Allikas: <c1/>

# text
# c1: lunar-interop-export
seg-fdf560e675f4 = <c1/> (stsenaariumi liik)

# text
seg-5a4dcb93a643 = Modelleeritud Kuu koostalitlusvõime eksport: väljastab Kuu tugisüsteemi, Kuu ajaskaala ja Kuu efemeriidi LunaNet/IOAG-ga joondatud, CCSDS-põhistes vahetusvormingutes koos edasi-tagasi / väljade standardi järgimisega. KASUTAB UUESTI crate CCSDS OEM { "2.0" } väljastajat + parserit (crate::oem), mis on Kuu konteksti jaoks ümber märgitud — OEM REF_FRAME kannab IAU { "2015" } WGCCRE Kuu keha tugisüsteemi (MOON_ME / MOON_PA), TIME_SYSTEM Kuu ajaskaalat (LTC / TCL / UTC), CENTER_NAME = MOON — näidis-illustratiivse LCNS-klassi efemeriidi üle (asukohad failist crate::lunar_service, kiirus lõpliku erinevusega). Väljastab ka LunaNet/IOAG-ga joondatud Kuu aja kirjeldaja (skaala id, sekulaarne kiirus µs/päevas failist crate::lunar_time, avaldatud riba, etalonpind), mis teeb serde_json kaudu edasi-tagasi ringi, ja pakendab artefaktid olemasolevasse KIF ümbrisesse (crate::interchange) MODELLED ausameelsuse sildiga. Esitab väljastatud artefaktid, OEM ridade arvu, väljade standardi järgimise läbimise + olemasolevate/puuduvate väljade loendi, OEM edasi-tagasi ringi korras, aja metaandmete edasi-tagasi ringi korras ja KIF baidisuuruse. MODELLED — deterministlik edasi-tagasi ring + väljanimede standardi järgimine avaldatud CCSDS OEM + LunaNet/IOAG väljasemantika vastu on sõltumatu etalon; MITTE sertifitseeritud koostalitlusvõime standardi järgimise test; illustratiivne avaliku allikaga efemeriid, ESA-ga sidumata; ei ole TRL/pärandi/agentuuri heakskiitu.

# text
# c1: scenarios/lunar-interop-export.toml
seg-169f9446e90d = Näide <c1/> määrab muu hulgas:

# text
seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

# text
seg-2ac27c1e55c0 = oktett

# attr:alt
seg-0e86ff364c17 = Mootori joonistatud diagramm failile scenarios/lunar-interop-export.toml, liik lunar-interop-export

# text
# c1: oem
seg-98acb538942f = <b>MODELLED</b> LunaNet/IOAG-ga joondatud Kuu tugisüsteemi + aja + efemeriidi eksport (CCSDS OEM + KIF) edasi-tagasi ringi standardi järgimisega. Sõltumatu etalon (InternalConsistency): kshana Kuu OEM eksport, mis on uuesti parsitud sõltumatu kolmanda osapoole teegiga <c1/> (R. J. Anderson): tugisüsteemi/aja märgid ja epohhipõhine olek ühtivad kirjutustäpsusega ({ "1" } mm / { "1e-9" } km/s) ja eksport, millel on TIME_SYSTEM maha jäetud, lükatakse tagasi — struktuurne vahetuse edasi-tagasi ring; Kuu tugisüsteemi/aja füüsikalist semantikat valideeritakse nende endi ridadega, seega jääb see MODELLED. { "0.30" } väline võrdlus, leid (jääb MODELLED): üks se

# text
# c1: honesty
seg-c9a1d76625d6 = MODELLED (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-633bcd62ce93 = Väljastab ka LunaNet/IOAG-ga joondatud Kuu aja kirjeldaja (skaala id, sekulaarne kiirus µs/päevas failist crate::lunar_time, avaldatud riba, etalonpind), mis teeb serde_json kaudu edasi-tagasi ringi, ja pakendab artefaktid olemasolevasse KIF ümbrisesse (crate::interchange) MODELLED ausameelsuse sildiga. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-0e91697e3036 = MODELLED — deterministlik edasi-tagasi ring + väljanimede standardi järgimine avaldatud CCSDS OEM + LunaNet/IOAG väljasemantika vastu on sõltumatu etalon; MITTE sertifitseeritud koostalitlusvõime standardi järgimise test; illustratiivne avaliku allikaga efemeriid, ESA-ga sidumata; ei ole TRL/pärandi/agentuuri heakskiitu. (liikide kataloog (<c1/>))

# text
seg-254d48fe58a5 = Kuu koostalitlusvõime eksport on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-07d6cc44724f = <s1>Eelmine</s1>lunar-integrity

# text
seg-9669cd9b1d04 = <s1>Järgmine</s1>lunar-jamming
