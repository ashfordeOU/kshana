# docs--licensing: translations (nb)

seg-a1bee28d1dfd = Kilde: <c1/>

seg-b8dd205e82c4 = Kshana er <b>dobbeltlisensiert</b>. Du kan bruke den åpne motoren under <b>enten</b> den åpne lisensen (AGPL-3.0) <b>eller</b> en <b>kommersiell lisens</b> fra Ashforde OÜ. Velg den som passer til hvordan du har tenkt å bruke den.

seg-5faea0aba960 = Dette dokumentet forklarer modellen i klart språk. Det er en veiledning, ikke juridisk rådgivning, og det endrer ikke selve lisensene. De bindende vilkårene står i <a1><c1/></a1> (GNU AGPL-3.0) og i enhver kommersiell avtale du signerer med Ashforde OÜ. Hvis de to noen gang er i konflikt, gjelder disse dokumentene.

seg-89bd60937f0b = Alternativ A — åpen kildekode: GNU AGPL-3.0-only

seg-785200a5419a = Standarden. Hele teksten står i <a1><c1/></a1>. Kort sagt lar AGPL deg bruke, studere, endre og videredistribuere Kshana gratis, <b>forutsatt</b> at:

seg-5bc05999ee9d = hvis du <b>distribuerer</b> Kshana eller en avledet versjon, gjør du den <b>fullstendige tilhørende kildekoden</b> tilgjengelig under AGPL; og

seg-5c9136766fdf = hvis du lar brukere samhandle med en <b>endret</b> Kshana <b>over et nettverk</b> (AGPLs særegne klausul, §{ "13" }), må du tilby <b>disse brukerne</b> den tilhørende kildekoden til din endrede versjon under AGPL.

seg-234be920d38f = AGPL er en <a1>åpen kildekode-lisens godkjent av OSI</a1> og en sterk copyleft. Den er riktig valg for akademisk arbeid, åpen kildekode-prosjekter, intern evaluering og forskning, og for alle som gjerne holder sitt eget avledede verk åpent.

seg-16c9cc91e4eb = Alternativ B — kommersiell lisens (fra Ashforde OÜ)

seg-197bfc5a5166 = Hvis AGPL ikke passer for deg, lisensierer Ashforde OÜ den samme motoren på kommersielle vilkår. Dette er riktig valg når du vil:

seg-6de2b04016e5 = <b>bygge inn Kshana i et proprietært produkt med lukket kildekode</b> uten å frigi din egen kildekode;

seg-e31db28c1e09 = <b>tilby en nettverkstjeneste</b> bygget på en modifisert Kshana <b>uten</b> kravet om å utlevere kildekoden i §{ "13" };

seg-9d3578395a59 = integrere Kshana i et større system der de andre komponentene ikke kan være AGPL (for eksempel en hovedleverandørs proprietære verktøykjede); eller

seg-99d049c650a3 = få garanti, skadesløsholdelse eller støttevilkår som AGPL uttrykkelig frasier seg.

seg-f68b536b93c0 = En kommersiell lisens fjerner copyleft-forpliktelsene for din bruk, på avtalte vilkår. <b>Kontakt: <a1>contact@ashforde.org</a1>.</b>

seg-55f1a2f687d9 = Hvorfor vi tilbyr dobbel lisensiering på denne måten

seg-42c1ce05ca5c = Målet er å være <b>offentlig verifiserbar</b> (slik at enhver gjennomgang kan kjøre og revidere motoren) <b>uten</b> å la en ressurssterk konkurrent kopiere den validerte motoren, lukke den og levere en proprietær konkurrent som ikke gir noe tilbake. AGPLs nettverkscopyleft oppnår det: et lukket eller driftet avledet verk må komme tilbake til åpen kildekode, eller ta en kommersiell lisens fra oss. Offentlig troverdighet og en beskyttet kjerne, samtidig.

seg-32b1d38914fe = Hva som <b>ikke</b> dekkes av denne doble lisensieringen

seg-27636d757dba = <b>Den innebygde OpenCPN-pluginen</b> (<c1/>) er lisensiert under <b>GPL-3.0-or-later</b> (se filen <c2/> i den mappen), ikke AGPL-3.0, og tilbys <b>ikke</b> under den kommersielle lisensen. Den lastes inn i OpenCPN og bygges mot OpenCPNs plugin-API-header under GPL-2.0-or-later, som er det vanlige grunnlaget for OpenCPN-plugins. Resten av <c3/> (Signal K-pluginen og OpenCPN TCP-reléet) forblir AGPL-3.0-only.

seg-f90c983e0ee3 = <b>Kshana Pro</b> og andre proprietære tillegg er <b>separate produkter med lukket kildekode</b> under egne kommersielle vilkår. De er ikke en del av dette depotet og tilbys ikke under AGPL.

seg-e340445b7f17 = <b>Avhengigheter</b> beholder sine egne (tillatende) lisenser. Vi holder bevisst avhengighetstreet tillatende (Apache-2.0 / MIT / BSD / ISC / …) nettopp for at den kommersielle utgaven skal kunne tilbys rent: en copyleft-avhengighet ville smitte den. Se <a1><c1/></a1>.

seg-810191f19d4d = <b>Primære minnekoder for Galileo E1</b> (<c1/>, <c2/>; <b>ikke inkludert siden { "0.36" }</b>: hver bruker skaffer sin egen kopi, <c3/> eller <c4/> / <c5/>, lest av <c6/>). Dette er de primære E1-B- og E1-C-kodene fra vedlegg C.7 og C.8 i Galileo Open Service Signal-In-Space Interface Control Document (OS SIS ICD), utgave { "2.0" }, januar { "2021" }, © European Union { "2021" }, hentet uendret ut fra PDF-ens vedlegg (kilde-URL, SHA-256 og en kryssjekk mot utgave { "1.3" } står i <a1><c7/></a1>). De er <b>ikke</b> dekket av AGPL-3.0 eller den kommersielle lisensen, og ingen av lisensene gir noe som helst over dem. Hva selve ICD-en sier, sitert fra utgave { "2.0" }:

seg-daef032cbe43 = Bruksvilkår §{ "3" }: "Informasjonen i OS SIS ICD, inkludert vedleggene, er underlagt immaterielle rettigheter". "OS SIS ICD kan bare helt eller delvis gjengis og/eller overføres til tredjepart i samsvar med den tillatte bruken som er beskrevet her og på følgende vilkår: dette «Terms of Use and Disclaimers», samt vilkårene i vedlegg G, aksepteres, gjengis og overføres i sin helhet og uendret sammen med den gjengitte og/eller overførte informasjonen; opphavsrettsmerknaden «© European Union { "2021" }» fjernes ikke fra noen side." Og: "Bruk av informasjonen i OS SIS ICD, inkludert spredningskodene som er underlagt immaterielle rettigheter, er tillatt på vilkårene i vedlegg G."

seg-0fb25fafd9a2 = Vedlegg G (utgave { "2.0" }; vedlegg H i utgave { "2.1" }, med samme ordlyd) definerer "Technical Data of the OS SIS ICD" slik at det omfatter "E1 and E5 Memory Codes", og gir en forpliktelse til ikke å gjøre krav gjeldende som er "ikke-eksklusiv og vederlagsfri" og "ikke-overførbar og ikke kan underlisensieres". Listen i §G.3, som den selv kaller uttømmende, dekker: "a) bruk av Technical Data of the OS SIS ICD, inkludert integrering og innarbeiding i alle Products"; "b) lagring av Technical Data of the OS SIS ICD, forutsatt at kilden oppgis"; "c) gjengivelse av OS SIS ICD, helt eller delvis, distribusjon og publisering av den for ikke-kommersielle formål uten fortjeneste og i slik skala, uten å endre dokumentet eller legge til noe element"; og "d) å gi lenker til EU-nettstedet der dokumentet er publisert". "Products" betyr programvare, enheter og verdiøkende tjenester "som benytter OS Signal". Det står også: "Den autoriserte personen skal ikke oppgi eller antyde i noe reklamemateriell eller andre steder at Products er utviklet av, brukes av eller for, eller er godkjent eller støttet av EU".

seg-8531368368ba = <b>Beslutning ({ "0.36" }): ikke videredistribuert.</b> Ingen uttrykkelig åpen lisens er oppgitt. Bruk inne i et programvareprodukt (G.3 a) og lagring med kilden oppgitt (G.3 b) er dekket på ICD-ens egne vilkår, men videredistribusjon (G.3 c) bare for ikke-kommersielle formål uten fortjeneste og med vilkårene og vedlegg G gjengitt uendret ved siden av. Fordi Kshana også tilbys under en kommersiell lisens, ble filene fjernet fra depotet og pakkene; motoren leser brukerens egen kopi under kjøring, og uten den gir Galileo E1-signalene en feil som forklarer hvordan de skaffes. Hver bruker støtter seg direkte på EUs autorisasjon; Kshana kan ikke gi den videre. Kshana er ikke utviklet av, brukt av, godkjent av eller støttet av Den europeiske union.

seg-e18986aeab7f = <b>Varemerker.</b> "Kshana" og tilhørende merker er varemerker som tilhører Ashforde OÜ. Ingen av lisensene gir rettigheter til navnet eller merkene; forgreininger og avledede distribusjoner må bruke et annet navn. Se <a1><c1/></a1>.

seg-f6b7345c2c60 = Bidrag

seg-1709eb19c2c5 = Bidrag tas imot på prosjektets innkommende bidragsvilkår, som lisensierer bidraget ditt under AGPL <b>og</b> gir Ashforde OÜ rett til å ta det med i den kommersielt lisensierte utgaven (slik at den doble lisensieringen fortsetter å fungere). Se <a1><c1/></a1>.

seg-940c8cce5137 = Spørsmål

seg-e678f2ecc571 = Lisensspørsmål, kommersielle tilbud og «hvilket alternativ gjelder for oss?» → <b><a1>contact@ashforde.org</a1></b>.

seg-05d34a27a0ba = <s1>Forrige</s1>Endringslogg

seg-4f7f660eea0a = <s1>Neste</s1>Sikkerhet

seg-2d2b32369c30 = Hva som ikke dekkes av denne doble lisensieringen
