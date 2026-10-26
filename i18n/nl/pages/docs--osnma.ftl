# docs--osnma: translations (nl)

seg-fcd0ebea49bc = Opdrachtregel

seg-6816f4e1a0a0 = Versie

seg-94058315dfe4 = Invoer

seg-23746ba370c2 = Bron: <c1/>

seg-1e9c104231db = Galileo OSNMA-verificatie aan de kant van de ontvanger

seg-17fd702f5997 = Een verificatieprogramma aan de ontvangerkant voor Galileo Open Service Navigation Message Authentication (OSNMA), in zuiver Rust. Het leest I/NAV-pagina's en rapporteert, per satelliet en per epoch, of de navigatiedata cryptografisch is geauthenticeerd, en waarom een controle faalde.

seg-ae081f55c4f1 = <b>Adviserend.</b> Dit is analyse- en monitoringuitvoer en geen typegoedgekeurde navigatieapparatuur. De hier gemelde authenticatiestatus is geen navigatie-integriteitsdienst en mag niet de enige basis zijn voor enige navigatie- of veiligheidsbeslissing.

seg-84d7260098b1 = KENNISGEVING: intellectueel eigendom in de Galileo OSNMA-interface

seg-6d78ccef53d5 = Kshana verleent geen rechten onder het intellectueel eigendom van de Europese Unie in het Galileo OSNMA Signal-in-Space Interface Control Document (de "ICD IPR's"). De ICD bevat een eigen toestemming (haar Annex E), die niet-exclusief en royaltyvrij is en eigen voorwaarden, reikwijdte en grenzen heeft. Wie software gebruikt, bouwt of verspreidt die op deze module is gebaseerd, vertrouwt rechtstreeks op die toestemming en moet de voorwaarden ervan zelf lezen en aanvaarden. De licentie van Kshana (AGPL-3.0-only, of de commerciële licentie) dekt alleen de eigen code van Kshana.

seg-c13ad334bf9a = Deze module implementeert de algoritmen die de onderstaande documenten beschrijven. De ICD-tekst wordt niet overgenomen; numerieke waarden (veldindelingen, opsommingen, de MAC-opzoektabel) zijn herschreven in de eigen notatie van Kshana, met de bron aangehaald in de code. De ICD en de Receiver Guidelines zijn © Europese Unie; de bron wordt hier erkend. Kshana is niet ontwikkeld door, niet gebruikt door, niet goedgekeurd door en niet onderschreven door de Europese Unie, de Europese Commissie, EUSPA of enige andere instantie.

seg-860096b04999 = Referentiedocumenten

seg-04c1e1a6278d = Gepubliceerd door het European GNSS Service Centre.

seg-278dd0f9df58 = Document

seg-3427e40d7bee = Datum

seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD ("SIS ICD")

seg-f63fbc1175cf = Issue { "1.1" }

seg-fa85e4db2c93 = oktober { "2023" }

seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

seg-907e4e46056c = Issue { "1.3" }

seg-a9b75bc7f063 = januari { "2024" }

seg-530ae6421157 = Sectie- en tabelnummers die in de code en hier worden aangehaald, verwijzen naar die versies.

seg-143726cc3d5f = Wat wordt geverifieerd

seg-029a9bb7608f = De vertrouwensketen, van de wortel tot aan de data:

seg-886f1b6556ce = <b>Publieke sleutel (ICD { "3.2.2" }, { "6.2" }).</b> Een DSM-PKR wordt uit zijn blokken opnieuw samengesteld en zijn Merkle-pad wordt doorlopen tot een vertrouwde Merkle-wortel (SHA-256).

seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Een DSM-KROOT wordt opnieuw samengesteld; zijn ECDSA-handtekening (P-256/SHA-256 of P-521/SHA-512) wordt gecontroleerd tegen de publieke sleutel die hij noemt, over de NMA-header en de ketenparameters.

seg-acc1f06cf63a = <b>TESLA-sleutels (ICD { "5.5" }, { "6.4" }).</b> Elke sleutel in een MACK-bericht wordt teruggelopen naar de KROOT of naar een eerder geverifieerde sleutel, met de hashfunctie van de keten.

seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> De flexibele Tag-Info-velden worden gecontroleerd tegen de MACSEQ met de sleutel die die MACK opent.
