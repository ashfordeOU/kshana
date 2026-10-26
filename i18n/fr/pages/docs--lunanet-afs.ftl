# docs--lunanet-afs: translations (fr)

# text
seg-33f4c7af9c53 = Porteuse

# text
seg-53a7343c076e = Affirmation

# text
# c1: docs/LUNANET-AFS.md
seg-da9970bcbab7 = Source : <c1/>

# text
# c1: lunanet-afs-check
seg-4013a17a3517 = LunaNet Augmented Forward Signal : codes, format de message et <c1/>

# text
seg-c1a27b995345 = Kshana implémente les codes d'étalement et la couche de message du <b>Augmented Forward Signal (AFS)</b> de LunaNet tels que les définit une édition de la spécification, et se vérifie lui-même par rapport aux tableaux imprimés de cette édition.

# text
# c1: 986e0795…e61b6
seg-e9bd99bbddb5 = <b>Version figée.</b> LunaNet Interoperability Specification (LNIS) <b>version { "5" }</b>, document applicable { "1" } volume A : <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>version { "1.0" }, { "29" } janvier { "2025" }</b> (NASA). Récupéré le 2026-10-18 ; SHA-256 du PDF <c1/> (<a1>provenance</a1>). Une édition ultérieure est une autre version figée et peut modifier les codes : le document marque ses tableaux de codes { "{" }LSIS-TBC{ "}" } et dit qu'ils sont « inclus uniquement pour faciliter les efforts d'essai et d'intégration ». Chaque rapport nomme cette édition.

# text
seg-6845e671bf24 = À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sécurité de la vie humaine.

# attr:alt
seg-69a98d01f489 = Le générateur de codes AFS de LunaNet vérifié par rapport aux colonnes imprimées de la spécification, à partir d'une exécution réelle du moteur v{ $version } (`kshana lunanet-afs-check spec`, figé sur LNIS V5, AD1 volume A (LSIS-AFS) V1.0, { "29" } janvier { "2025" } ; le document marque ses tableaux de codes { "{" }LSIS-TBC{ "}" }). { "9" } contrôles sur { "10" } sont satisfaits ; B4 est NOT MET ({ "420" } sur { "421" } concordent). Il vérifie un flux de symboles par rapport à une édition d'une spécification publiée et ne dit rien d'aucun nœud ni service LunaNet. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sécurité de la vie humaine. Il vérifie un flux de symboles par rapport à une édition d'une spécification publiée et ne dit rien d'aucun nœud ni service LunaNet.

# text
seg-4c3f77d97294 = Ce qui est implémenté

# text
seg-a0b684e44fb0 = Couche

# text
seg-5d987fca539c = Quoi

# text
seg-df52127d74b6 = Où

# text
seg-637035a0b1c1 = AFS-I (données)

# text
seg-dbee58df4c92 = Code de Gold { "2047" } raccourci cycliquement à { "2046" } chips, G2 retardé d'un nombre de chips propre à chaque PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } symboles/s, PRN de { "1" } à { "210" }

# text
# c1: iq::signals::lunanet::afs_i
# c2: lunanet-afs-i
seg-d4480ead20d1 = <c1/>, nom de signal <c2/>

# text
seg-6d84dce7f6d0 = AFS-Q (pilote)

# text
# c1: afs_q
# c2: lunanet-afs-q
# c3: afs_q_tiered
seg-2ebf619c9cb6 = Code de Weil { "10230" } (la construction de GPS L1C) à étages avec un code secondaire de 4 chips (S0 à S3) et un code de Weil tertiaire de 1500 chips ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), sans données. <c1/> et le nom de signal <c2/> sont la réplique du récepteur, primaire x secondaire ({ "8" } ms) : la surcouche tertiaire de synchronisation de trame de { "12" } s en est laissée de côté, parce que l'acquisition et le suivi ne corrèlent pas avec une réplique de { "12" } s. <c3/> est le code complet de { "12" } s

# text
seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

# text
seg-906440b861cd = Trame

# text
seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } symboles entrelacés = { "6000" } symboles = { "12" } s à { "500" } symboles/s

# text
seg-a242d95d701f = { "9" } bits (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), générateur { "763" } octal, avec le décodeur par corrélation à 256 hypothèses du document

# text
seg-df8894e1304f = CRC

# text
seg-a04ccd611398 = CRC-24Q, générateur ({ "1" }+X)P(X) (annexe H)

# text
seg-e225f10d7848 = Entrelaceur

# text
seg-cb075da6f8cf = { "60" } lignes x { "98" } colonnes, écrites par ligne et lues par colonne

# text
# c1: kshana iq scene
# c2: acquire
# c3: track
# c4: sweep
# c5: kshana iq acquire --signal lunanet-afs-i
seg-d544025254af = Les deux composantes sont acceptées par <c1/>, <c2/>, <c3/> et <c4/> comme n'importe quel autre signal, de sorte qu'on peut rechercher AFS-I ou AFS-Q dans un enregistrement (<c5/>) et créer une scène synthétique pour des essais de récepteur logiciel. Une scène synthétique, comme pour tout autre signal, est un fichier destiné à un récepteur logiciel ; rien ici ne pilote de matériel radio.

# text
seg-6d7a9d17946d = Ce qui n'est <b>pas</b> implémenté

# text
# c1: lunanet-afs-check symbols
seg-95731dbf3333 = <b>Le codage LDPC de rendement 1/2 des sous-trames { "2" } à { "4" }.</b> Ses matrices de contrôle se trouvent dans l'annexe { "1" }, un fichier distinct qui n'est pas dans le PDF et n'est pas intégré. Les sous-trames { "2" } à { "4" } sont transportées et vérifiées comme des blocs de symboles opaques de la longueur spécifiée, et les mots CRC-24Q qu'ils contiennent ne sont pas vérifiés. Un flux qui passe <c1/> n'est pas démontré comme contenant des mots de code valides.

# text
seg-67bb5d1038c7 = <b>Contenu du message</b> (MSG-G1, MSG-G2, MSG-G4, ...) : le document laisse plusieurs définitions à rédiger (TBW).

# text
# c1: afs_q(prn)
# c2: afs_q_with
# c3: afs_q_tiered
seg-bff5304c6187 = <b>Attribution des codes par nœud LunaNet</b> (le tableau F-1 est à définir, TBD). Les PRN { "1" } à { "12" } ont des attributions d'essai provisoires (tableau { "11" }). <c1/> utilise le code primaire du PRN <em>n</em> avec le secondaire S((n-1) mod { "4" }) ; au-delà du PRN { "12" }, c'est le schéma de cette implémentation, non celui du document. <c2/> et <c3/> acceptent n'importe quelle combinaison, avec le code tertiaire de n'importe quel PRN.

# text
seg-6588307842fe = Bilan de liaison, erreur du signal dans l'espace, exigences de puissance et de cohérence (LSIS-100 et suivants).

# text
# c1: spec
# c2: --strict
seg-e0f2ddce6dff = <c1/> exécute l'implémentation par rapport aux tableaux imprimés et aux exemples détaillés du document (seuils B1 à B10 du <a1>préenregistrement</a1>) et affiche chacun avec son décompte et son statut. <c2/> sort avec le code { "1" } à moins que chaque seuil ne soit atteint.

# text
# c1: symbols
# c2: 0
# c3: 1
seg-dafa47406a38 = <c1/> lit un flux de symboles à décision dure (texte de <c2/> et <c3/> ; espaces ignorés) et vérifie le motif de synchronisation, le décodage de SB1, le FID (seul { "0" } est défini), la continuité du TOI (avançant de un modulo { "100" }) et l'espacement des trames ({ "6000" } symboles). Il sort avec le code { "1" } au moindre problème.

# text
# c1: generate
seg-f12425044025 = <c1/> écrit un flux d'essai : le motif de synchronisation du document, les longueurs de SB1 et de trame, avec des sous-trames { "2" } à { "4" } <b>de remplacement</b> (le remplissage alterné de LSIS-300, non codé LDPC, sans message). Ce sont des symboles destinés à tester un vérificateur ou un décodeur, non une forme d'onde ; Kshana n'écrit aucun signal.

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: lunanet_afs_check
# c5: mode
# c6: /kshana-lunanet-afs-check
seg-3b3548bd0b61 = Python : <c1/>, <c2/>, <c3/>. WebAssembly : les mêmes noms. MCP : <c4/> (<c5/> spec, symbols ou generate). Module d'extension : <c6/>. Studio et JetBrains : sans objet (<a1>SURFACES.md</a1>).

# text
# c1: xval/lunanet-afs/PREREGISTRATION.md
# c2: tests/lunanet_afs_codes.rs
seg-2133870991ca = Seuils énoncés dans <c1/> avant l'existence du générateur ; tests dans <c2/>.

# text
seg-b74d5800a039 = Seuil

# text
seg-e75915599d5e = AFS-I : { "24" } premiers et derniers chips, { "210" } PRN

# text
seg-f654db18922f = <b>MET</b>, { "420" } sur { "420" }

# text
seg-55d0d7168ceb = l'état initial imprimé de G2 est l'état après le retard imprimé

# text
seg-41590da4d1ac = <b>NOT MET</b>, { "0" } sur { "210" } : l'affirmation avait le sens inversé. A posteriori (B1c, non préenregistré) : l'état imprimé est l'état après { "2047" } moins le retard, { "210" } sur { "210" }

# text
seg-b94947c99f9a = Legendre({ "10223" }) égale le tableau D-1

# text
seg-75c8da01c0f1 = MET

# text
seg-e3402e2420bd = AFS-Q : { "24" } premiers et derniers chips du primaire, { "210" } PRN

# text
seg-678604d6e463 = Legendre({ "1499" }) égale le tableau E-1 et { "24" } premiers et derniers chips du tertiaire, { "210" } PRN

# text
# c1: A14850
seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } sur { "421" } : la suite de Legendre concorde et { "419" } colonnes de code sur { "420" } concordent. Les { "24" } derniers chips imprimés pour le PRN { "147" } (<c1/>) sont la même valeur que celle imprimée pour le PRN { "151" }, dont le générateur reproduit le code ; deux indices de Weil différents ({ "607" } et { "612" }) ne donnent pas les mêmes { "24" } derniers chips, de sorte que l'entrée du PRN { "147" } est très probablement une coquille du document. Elle ne peut pas être tranchée sans le fichier de code distinct de l'annexe { "3" }. Figé par un test

# text
seg-aea9620e7bf1 = les codes secondaires S0 à S3 égalent le tableau { "10" }

# text
seg-2996e986d247 = <b>MET</b> (les constantes propres au document)

# text
seg-23c9277f62e6 = exemple détaillé de SB1 de la figure { "8" }

# text
seg-fb70493dcdcf = <b>MET</b> : 0x045 s'encode en 0x229F61DBB84A0 et se décode en FID { "0" }, TOI { "69" } (un exemple)

# text
# c1: 123456789
seg-acce07c33dec = valeur de contrôle CRC-24Q pour <c1/>

# text
seg-71c490aca8d7 = <b>MET</b> : 0xCDE703 (la valeur du catalogue, hors de la spécification)

# text
seg-789b31d53873 = arithmétique de trame

# text
seg-5b5da00ad1c8 = entrelacer puis désentrelacer

# text
seg-80f9cd313ec4 = <b>MET</b> (une propriété, MODELLED)

# text
seg-92a7addfdb8c = motif de synchronisation

# text
seg-215913f74706 = <b>MET</b> ({ "68" } symboles ; un contrôle de transcription)

# text
# c1: tests/iq_signal_matrix.rs
seg-3b51bd143c19 = B1 à B4 sont VALIDATED par rapport aux tableaux imprimés de l'édition citée, que le document marque { "{" }LSIS-TBC{ "}" }. Un aller-retour scène, acquisition, suivi des deux composantes passe les mêmes seuils que les autres signaux (<c1/>).

# text
seg-9edb6e5771ca = <s1>Précédent</s1>Vérification de Galileo OSNMA

# text
seg-d0043d0f578a = <s1>Suivant</s1>Jammertest comme arbitre

# text
seg-52946c9ff62a = Ce qui n'est pas implémenté

# text
seg-339c9eeb510b = kshana lunanet-afs-check
