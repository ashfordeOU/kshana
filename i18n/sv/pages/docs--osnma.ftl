# docs--osnma: translations (sv)

seg-fcd0ebea49bc = Kommandorad

seg-6816f4e1a0a0 = Version

seg-23746ba370c2 = Källa: <c1/>

seg-1e9c104231db = Galileo OSNMA-verifierare på mottagarsidan

seg-17fd702f5997 = En verifierare på mottagarsidan för Galileo Open Service Navigation Message Authentication (OSNMA), i ren Rust. Den läser I/NAV-sidor och redovisar, per satellit och per epok, om navigeringsdata är kryptografiskt autentiserade, och varför en kontroll misslyckades.

seg-ae081f55c4f1 = <b>Rådgivande.</b> Detta är analys- och övervakningsutdata och inte typgodkänd navigationsutrustning. Autentiseringsstatusen som redovisas här är inte en tjänst för navigeringsintegritet och får inte vara den enda grunden för något navigerings- eller säkerhetsbeslut.

seg-84d7260098b1 = MEDDELANDE: immateriella rättigheter i Galileo OSNMA-gränssnittet

seg-6d78ccef53d5 = Kshana beviljar inga rättigheter under Europeiska unionens immateriella rättigheter i Galileo OSNMA Signal-in-Space Interface Control Document ("ICD IPRs"). ICD:n bär sitt eget tillstånd (dess bilaga E), som är icke-exklusivt och royaltyfritt och har egna villkor, omfattning och begränsningar. Den som använder, bygger eller distribuerar programvara baserad på den här modulen förlitar sig direkt på det tillståndet och måste själv läsa och godta dess villkor. Kshanas licens (endast AGPL-3.0, eller den kommersiella licensen) omfattar bara Kshanas egen kod.

seg-c13ad334bf9a = Den här modulen implementerar de algoritmer som dokumenten nedan beskriver. ICD-texten återges inte; numeriska värden (fältlayouter, uppräkningar, MAC-uppslagstabellen) uttrycks på nytt i Kshanas egen notation, med källan angiven i koden. ICD:n och Receiver Guidelines är © Europeiska unionen; källan erkänns här. Kshana är inte utvecklad av, använd av, godkänd av eller stödd av Europeiska unionen, Europeiska kommissionen, EUSPA eller något annat organ.

seg-860096b04999 = Referensdokument

seg-04c1e1a6278d = Utgivna av European GNSS Service Centre.

seg-278dd0f9df58 = Dokument

seg-3427e40d7bee = Datum

seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD ("SIS ICD")

seg-f63fbc1175cf = Utgåva { "1.1" }

seg-fa85e4db2c93 = oktober { "2023" }

seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

seg-907e4e46056c = Utgåva { "1.3" }

seg-a9b75bc7f063 = januari { "2024" }

seg-530ae6421157 = Avsnitts- och tabellnummer som anges i koden och här avser de versionerna.

seg-143726cc3d5f = Vad som verifieras

seg-029a9bb7608f = Förtroendekedjan, från roten ner till data:

seg-886f1b6556ce = <b>Publik nyckel (ICD { "3.2.2" }, { "6.2" }).</b> Ett DSM-PKR sätts ihop på nytt av sina block och dess Merkle-sökväg följs till en betrodd Merkle-rot (SHA-256).

seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Ett DSM-KROOT sätts ihop på nytt; dess ECDSA-signatur (P-256/SHA-256 eller P-521/SHA-512) kontrolleras mot den publika nyckel den namnger, över NMA-huvudet och kedjeparametrarna.

seg-acc1f06cf63a = <b>TESLA-nycklar (ICD { "5.5" }, { "6.4" }).</b> Varje nyckel i ett MACK-meddelande följs tillbaka till KROOT eller till en tidigare verifierad nyckel, med kedjans hashfunktion.

seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> De flexibla Tag-Info-fälten kontrolleras mot MACSEQ med den nyckel som öppnar det MACK:et.
