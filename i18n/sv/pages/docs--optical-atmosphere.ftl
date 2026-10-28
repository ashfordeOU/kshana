# docs--optical-atmosphere: translations (sv)

seg-6cb7a787ac67 = Referenser

seg-1c6199627b90 = Data

seg-ad856ad710eb = Status

seg-53a7343c076e = Påstående

seg-508588352e96 = Källa: <c1/>

seg-333a1114746a = Optisk PNT genom atmosfären

seg-47118f54f060 = Scenariotypen <c1/> besvarar hur ofta en optisk länk till marken fungerar, varför den fallerar, vilken marginal eller teknik som skulle hjälpa, och vad en klocka gör medan den är nere.

seg-06db0ea8f428 = Kshana är bara analyssidan. Den kör inget experiment med optisk markstation och namnger ingen mätpartner. Typen är <b>MODELLED</b>: dess numerik kontrolleras mot ett oberoende program, men ingen uppmätt tillgänglighetsregistrering har jämförts, och varje väder-, teknik- och klockindata är ett antagande. Det är en rådgivande analys, inte en certifierad tillgänglighets-, integritets- eller navigeringsprodukt.

seg-83c16fd89005 = Båda medföljande scenarierna bär ILLUSTRATIVE molnklimat. De är indata, inte mätningar och inte värden från någon datamängd.

seg-e9dbbd9cfa32 = Ett frösatt utfall av länkmarginalen för platsen 'northern' över { "336" } h, från en riktig körning av motor v{ $version } på scenarios/optical-atmosphere-network.toml (frö { "37" }, steg på { "600" } s). Marginalen faller under noll under molnepisoder; i det här utfallet är länken uppe { "40.5" } % av tiden, med { "27" } avbrott och ett längsta avbrott på { "30.7" } h. Indata är illustrativa, serien är ett utfall ur modellen och inte klimatet, och den skiljer sig från den statistiska tillgängligheten ({ "37.8" } %) med utfallets samplingsfel. Endast rådgivande analys: inte en certifierad tillgänglighets-, integritets- eller navigeringsprodukt, och ingen förutsägelse för någon verklig plats om inte dess klimatindata kommer från en angiven datamängd.

seg-13a52dfbd8d1 = Vad som beräknas

seg-46fbaf0c6a12 = <b>Förlust i klar luft</b> vid våglängden och elevationen: aerosolextinktion enligt Kim, McArthur och Korevaars siktlag, exponentiell i höjd, plus Rayleigh-spridning och en angiven indata för gasabsorption. Detta ersätter den enda sammanslagna <c1/> i <c2/> när en atmosfär anges. Utan någon är länkbudgeten bitidentisk med { "0.36" } (förhandsregistrerad tröskel A5).

seg-929c80326b41 = <b>Turbulens.</b> En Hufnagel–Valley-profil för <c1/> (HV 5/7 som standard) integrerad längs den sneda vägen ger plan- eller sfärisk-vågs Rytov-varians, uppåt- eller nedåtlänk. Därur kommer Andrews–Phillips scintillationsindex, gamma-gamma-parametrarna, aperturmedelvärdesfaktorn för svag turbulens (Churnside) samt gamma-gamma-sannolikheten för fädning och fädningsmarginalen. Aperturmedelvärdesbildning tillämpas genom momentanpassning: scintillationsindexet skalas med medelvärdesfaktorn och båda logaritmiska varianserna skalas om så att det uppnås exakt.

seg-3fb7be7ef95d = <b>Moln.</b> En plats molnklimat har formen enligt ITU-R P.840: en sannolikhet för moln och, givet moln, en lognormal vätskevattenkolonn. P.840 anger mängden moln. Dämpningen är den geometriskt optiska optiska djupet <c1/>, eftersom P.840:s egen dämpningslag är en mikrovågslag och inte gäller vid { "0.85" } till { "1.55" } µm, där droppar är mycket större än våglängden.

seg-18311430b2a3 = <b>Tillgänglighet</b> för en plats: länken är uppe så länge moln- och turbulensfädningen tillsammans håller sig inom den marginal som finns kvar efter förlusten i klar luft. Moln och turbulens antas vara oberoende. Rapporten anger tillgängligheten, tillgängligheten vid klar himmel, det <b>tak</b> som ingen marginal kan lyfta (en optisk länk kan inte passera tjockt moln), och den extra marginal som behövs för varje måltillgänglighet, eller <c1/> om målet ligger över taket.

seg-885e06050a9a = <b>Avbrott.</b> Varaktigheterna är lognormala med ett angivet medelvärde och en angiven spridning. Rapporten anger avbrott per år, varaktigheten vid medianen, 90:e och 99:e percentilen, samt sannolikheten och andelen av avbrottstiden bortom { "1" }, { "6" }, { "24" } och { "72" } timmar.

seg-4b9b6fefad6b = <b>Platsdiversitet.</b> De bästa <c1/> platserna kombinerade med oberoende väder (<c2/>) och med avståndskorrelerat väder: parkorrelation <c3/>, kombinerad i en enfaktors gaussisk copula. Vid <c4/> är det den oberoende unionen, och vid full korrelation den bästa enskilda platsen.

seg-b85681b9fd93 = <b>Tekniker.</b> Varje <c1/> är ett vad-händer-om: en ny våglängd (budgeten för klar himmel, förlusten i klar luft och aperturmedelvärdesbildningen beräknas om), en ny mottagaraperture, en angiven bråkdelsminskning av scintillation (adaptiv optik) och extra marginal. Resultatet är tillgänglighetsvinsten jämfört med baslinjen på samma plats. Kshana modellerar ingen adaptiv optikslinga, så vinsterna är indata.

seg-a59d07280524 = <b>Tidssynkronisering och avståndsmätning genom ett avbrott.</b> Varje avbrotts varaktighet avbildas genom den slutna formen av klockans coast-varians i holdover-modellen, för de klockor som anges i <c1/>. Rapporten anger fel i tidssynkronisering och avståndsmätning vid angivna avbrottslängder, holdover fram till tidströskeln, andelen avbrott inom den, och tidstillgängligheten <c2/>. Klassernas potenslagsgolv är holdover-modulens syntetiserade, så en snäv tröskel styrs av det antagna golvet, som <c3/> anger.

seg-59774a9e8685 = Länkmarginal mot tid ({ "0.38" })

seg-fcfdd2e9e0ad = En <c1/>-tabell (<c2/> upp till { "8760" }, <c3/>, <c4/>) lägger till ett <b>frösatt utfall</b> av modellen ovan för varje plats: siktlinjen växlar mellan klara perioder (exponentiella, medelvärdet satt så att andelen tid i moln är det angivna <c5/>) och molnavbrott (lognormala, angivet medelvärde och angiven spridning); varje avbrott drar en vätskevattenkolonn ur det angivna klimatet och behåller den; varje steg drar ett gamma-gamma-scintillationsprov (oberoende från steg till steg, en angiven förenkling) och terminalen är riktad mot målet med den angivna pekningstillgängligheten. Stegets marginal är fädningsbudgeten minus moln- och scintillationsfädningen, och länken är uppe när marginalen inte är negativ och terminalen är riktad mot målet, det villkor som tillgänglighetsintegralen använder.

seg-ad2c4ff087a8 = Det är ett utfall, inte klimatet: dess tillgänglighet skiljer sig från den statistiska med utfallets samplingsfel, och den första episoden dras hel. Resultatet innehåller <c1/>, <c2/>, <c3/> och <c4/> per steg samt ett <c5/>-block (tillgänglighet, molnandel, antal avbrott, längsta avbrott). <b>MODELLED</b>; kontrollerna (<c6/>, trösklar fastställda i <c7/> före första körningen) är determinism och konsistens med de angivna siffrorna, inte en extern oberoende referens. Utan tabellen skrivs ingenting och resultatet är dokumentet { "0.37" }.

seg-4a9b065bdb28 = Scenariofält

seg-4ba70196355d = Alla fält på översta nivån är valfria. Ett bart <c1/> kör tre illustrativa platser. Se de två medföljande filerna för varje nyckel: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-b7619573e112 = Verifieringsstatus

seg-6598ced4218b = Rytov-varians, scintillationsindex, gamma-gamma-sannolikhet för fädning, aperturmedelvärdesfaktor, moln- och klarluftsoptiskt djup beräknas som de angivna formlerna säger

seg-2442f7529fbb = MODELLED-rad; numerik kontrollerad mot ett oberoende mpmath-program

seg-19854ea8437a = trösklarna A1 till A3, alla nådda (<c1/>)

seg-b91d83aea0e8 = Länkbudget och befintlig tillgänglighet oförändrade utan atmosfär

seg-2192262e26c1 = nådd

seg-a71527a271df = tröskel A5, bitidentisk över { "1,000" } parameteruppsättningar

seg-0db8cf4c2ee0 = Diversitetsgränser och monotonicitet; holdover-koppling bitexakt

seg-2a5c5967540c = nådd (identiteter)

seg-4b0e5e3ac558 = trösklarna A4, A6

seg-f842c688e29a = Tillgänglighet för en verklig plats, verklig scintillation, verklig molnstatistik

seg-9a0ead7b1670 = hävdas inte

seg-9cc220190772 = ingen extern oberoende referens jämfördes

seg-7c5050135e2b = Den oberoende referensen kontrollerar implementeringen av de angivna formlerna, inte atmosfären, så ingen rad är VALIDATED. Valideringsvärden från ITU-R används inte och hålls utanför arkivet.

seg-73dcf0f31fe9 = Ingen väderdatamängd medföljer. Molnklimatindata för en verklig plats skulle komma från en offentlig datamängd (Copernicus ERA5, NASA MODIS eller ISCCP); varje datamängds licens måste läsas och registreras före användning, och rådata hämtas vid testtillfället med en fastlåst SHA-256. Den enda klimatologi som redan finns i arkivet är Cavazzani m.fl:s tabell för klara nätter som används av <c1/>.

seg-44d197f3209c = Andrews och Phillips, <em>Laser Beam Propagation through Random Media</em>, 2:a uppl. (Rytov-varians, scintillationsindex, gamma-gamma-parametrar).

seg-9e9a33d44013 = Kim, McArthur och Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (siktlag).

seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (aperturmedelvärdesfaktor).

seg-309c70f2f4f8 = ITU-R P.840 (statistik för molnens vätskevatten), P.1814 och P.1817 (metoder för optik i fritt rum).

seg-83b30e1ca261 = <s1>Föregående</s1>Bevispaket

seg-1474b58fb35a = <s1>Nästa</s1>Tidsluckornas tidssynkronisering

seg-50f25bceca3c = <s1>Föregående</s1>Datapartner och rader som lyfts
