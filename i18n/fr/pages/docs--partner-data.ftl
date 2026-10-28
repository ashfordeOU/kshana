# docs--partner-data: translations (fr)

seg-2247a2344710 = Signification

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = Dans la branche du dépôt d'où viennent ces documents ; pas encore sur GitHub

seg-f942b36a11c4 = Pas encore sur GitHub

seg-7338b6210228 = Ligne

seg-c5ce76c91ff7 = Étiquette

seg-3a04afee76ec = Source : <c1/>

seg-e6d8549f24b9 = Données d'un partenaire : quelles données mesurées pourraient promouvoir une ligne MODELLED

seg-7b9ff34db2c4 = { -brand } étiquette chaque capacité dans un registre vérifié par machine (<a1>matrice de vérification</a1>). La plupart des lignes de synchronisation temporelle et de capteurs sont <b>MODELLED</b> : elles reposent sur des modèles déclarés, des fiches techniques publiées et des vérifications internes, et aucun enregistrement mesuré de cette classe d'appareil ne leur a été comparé. Le détenteur d'un tel enregistrement peut changer cela. Cette page dit quelles lignes, quoi envoyer, comment une soumission est vérifiée, comment elle est notée et comment elle est créditée. Elle est écrite pour un laboratoire, un fabricant ou un groupe universitaire ; ce n'est pas une offre de travail et elle ne revendique la caution de personne. À titre consultatif seulement : { -brand } est un instrument d'étude, et non un équipement de navigation ou de synchronisation temporelle homologué.

seg-1cf5536037d4 = Ce que signifient les étiquettes

seg-5f43f341fa27 = une référence externe indépendante concorde avec la capacité selon un seuil fixé avant la comparaison. Un enregistrement mesuré d'un partenaire peut être cette référence pour la sous-affirmation qu'il couvre ; les invariants de la matrice interdisent l'étiquette sans elle

seg-0d182b8c7430 = cohérent en interne et dit à voix haute ; aucune référence externe ne couvre l'affirmation. Une ligne MODELLED comparée à des données mesurées et qui n'atteint pas le seuil reste MODELLED, et l'échec est publié

seg-8a45367544a0 = une discipline dont l'exécution dépend, qu'un partenaire matériel détient et que { -brand } ne fournit pas, par exemple les chiffres qui décrivent l'horloge ou l'interféromètre d'un partenaire. { -brand } modélise ce qu'un tel appareil ferait à une chaîne de navigation ou de synchronisation temporelle ; il ne se porte pas garant de l'appareil

seg-553a1db0e11d = Une soumission peut faire passer une ligne à VALIDATED seulement pour l'affirmation que les données testent réellement, et seulement si la comparaison atteint son seuil. Elle ne peut pas faire des chiffres propres d'un appareil des chiffres dont { -brand } se porte garant : ils restent ceux du partenaire (PARTNER). Le changement ou non de l'étiquette d'une ligne est la décision du propriétaire, consignée dans le commit qui la change, avec le texte de la référence indépendante disant exactement ce qui a été comparé à quoi.

seg-bac61cc47097 = Lignes que les données d'un partenaire pourraient promouvoir

seg-bd4f5d3f9399 = Chaque ligne ci-dessous est le texte exact de <c1/> d'une ligne MODELLED de la matrice (un test garde cette page et la matrice synchronisées). « Pourrait changer » dit ce qu'une comparaison préenregistrée avec des données mesurées permettrait d'affirmer si le seuil est atteint ; ce n'est jamais une promesse.

seg-fb5ceb1d62f0 = Données qui la testeraient

seg-812eae6bbea9 = Pourrait changer

seg-f46d009d9380 = un enregistrement de plusieurs jours d'une horloge d'une classe nommée, en marche libre après son dernier asservissement, comparé à une meilleure référence, à un intervalle d'échantillonnage d'une minute ou moins

seg-2a73fc59a03d = les planchers de bruit rouge par classe qui bornent les chiffres de holdover restent MODELLED aujourd'hui ; une stabilité mesurée aux longs temps de moyennage pourrait être comparée au plancher de cette classe, pour cette classe seulement

seg-abe6b657ce1b = la déviation d'Allan mesurée, sous forme de table ou d'enregistrement de phase, de l'horloge ou de l'interféromètre atomique d'un partenaire

seg-6ba2b7faa909 = les chiffres de compromis quantifient (sans jamais valider) l'appareil du partenaire, ils seraient donc étiquetés comme les chiffres du partenaire (PARTNER) ; l'ingestion de données d'Allan mesurées dans un modèle de bruit est déjà confrontée à un solveur indépendant

seg-ad537759d084 = un enregistrement de phase d'un oscillateur de l'un des quatre modèles prédéfinis, sur au moins un jour

seg-44a55f6ebef6 = si le modèle de bruit tiré de la fiche technique du modèle prédéfini reproduit la stabilité d'un exemplaire mesuré aux temps de moyennage propres de la fiche technique

seg-3da5a93abde6 = un enregistrement de phase d'une classe d'horloge pas encore dotée d'une fiche (un OCXO, un rubidium, un césium, un maser, une horloge optique)

seg-72f248aa4438 = une fiche ajustée sur le premier tiers et prédisant la déviation d'Allan du reste à l'intérieur du facteur préenregistré, comme déjà fait pour les horloges de satellites GNSS et un récepteur

seg-54971e473811 = un journal d'une installation réelle (n'importe quelle version du démon) avec les propres lignes de synthèse du démon

seg-bccf188b7636 = les lecteurs ont été construits à partir de dispositions de lignes publiques et de fixtures ; un journal réel comparé à un lecteur indépendant serait la première vérification externe

seg-e83b73ab2d5d = une exportation réelle d'un compteur ou d'un logiciel d'analyse

seg-80b69f559ea5 = la même chose, pour ces formats

seg-0c279732d132 = un vrai test de holdover : l'enregistrement, les instants où l'opérateur a retiré et rétabli la référence, et les propres verdicts MTIE, TDEV et de masque du laboratoire issus de son logiciel d'analyse

seg-cfad71161af0 = un calcul indépendant des mêmes grandeurs à comparer à celui du moteur

seg-97c65b646eae = un journal stationnaire d'une unité inertielle dont les paramètres de bruit sont publiés ou mesurés par quelqu'un d'autre

seg-77f9d22ec624 = l'ajustement retrouvé à l'intérieur d'un facteur déclaré des paramètres indépendants

seg-c9544eadc55d = un journal statique ou les paramètres de bruit du capteur inertiel à atomes froids d'un partenaire

seg-062dd193ab20 = les chiffres de l'appareil sont ceux du partenaire (PARTNER) ; le budget d'erreur de position qui les compose reste le modèle de { -brand }

seg-078be7f5769f = Commencez par les deux premières : elles décident si les planchers de holdover par classe et le compromis quantique contre classique reposent sur la moindre donnée mesurée qui leur soit propre.

seg-c325655738e0 = Quoi envoyer

seg-ca24fa511ffe = Une soumission se compose de deux fichiers dans un même dossier : les données et une petite description, un fichier TOML (<c1/> ; un exemple travaillé et fictif est <c2/>).

seg-a3e30cf27adb = <b>Données d'horloge.</b> L'un des formats que { -brand } lit (voir <a1>formats des journaux d'horloge</a1>) : journaux TICC de TAPR, phase ou fréquence ASCII de type TimeLab, RINEX clock, journaux linuxptp <c1/>, <c2/> et <c3/>, journaux de suivi et de statistiques de chrony. La phase est préférée à la fréquence ; indiquez les unités et l'intervalle d'échantillonnage. Donnez l'enregistrement ininterrompu le plus long dont vous disposez : la stabilité aux longs temps de moyennage exige des jours, et un enregistrement de moins d'un jour est accepté mais signalé par un avertissement.

seg-a14b0c961637 = <b>Données inertielles.</b> Un CSV à colonnes nommées (<c1/>, rad/s et m/s^{ "2" }) ou la disposition EuRoC, issu d'un appareil stationnaire, assez long pour l'ajustement (au moins { "2000" } échantillons ; des heures valent mieux).

seg-a1f2cd79bcc0 = <b>La description</b> indique, et le vérificateur contrôle là où il le peut :

seg-cfeee5da56d7 = le type d'organisation (un type tel que « un laboratoire national de synchronisation temporelle », et non un nom ; un nom est facultatif et seulement pour le crédit) ;

seg-4bd30d68101c = l'appareil (genre, classe, et un modèle pour la classe <c1/>) ;

seg-e8222178a0ee = comment les données ont été prises : par rapport à quoi elles ont été comparées, l'heure de début (UTC), l'environnement, et si elles sont brutes ou traitées (et ce qui leur a été fait) ;

seg-7ac28bd566f2 = le SHA-256 du fichier de données, de sorte que le fichier noté soit le fichier décrit ;

seg-0eba30c3a5b8 = les lignes MODELLED pour lesquelles il est proposé, par le texte exact de l'exigence ci-dessus ;

seg-dd694deec626 = la licence (un identifiant SPDX ou des mots) et la manière dont les données peuvent être utilisées dans le dépôt : <c1/> (versionnées, avec attribution), <c2/> (seuls son hachage et les notes sont publiés) ou <c3/> (la note est partagée avec le seul auteur de la soumission) ;

seg-7cea4b7c1df8 = trois déclarations : c'est une mesure et non une simulation, l'auteur de la soumission peut la placer sous licence pour cet usage, et les fichiers ne contiennent aucune donnée personnelle.

seg-caa6696f3f5f = <b>À ne pas envoyer.</b> Tout ce qui est personnel ou comporte des coordonnées (le vérificateur refuse une adresse électronique ou un numéro de téléphone dans la description), tout ce qui est soumis à un contrôle des exportations ou restreint par accord, et toute donnée simulée présentée comme mesurée.

seg-a2f0067b6da5 = Comment une soumission est vérifiée

seg-f1d4c097691e = Format et métadonnées, par vous ou par nous, avant que quoi que ce soit s'exécute.

seg-c3cd90222eaa = Il confirme le schéma, les champs obligatoires, le hachage, les règles de licence et d'attribution, que les lignes visées existent et sont MODELLED, que les données se lisent avec le lecteur propre du moteur, et il rapporte ce qu'il a lu (échantillons, intervalle, durée, lacunes) et avertit des enregistrements courts. Le code de sortie { "0" } signifie complet et lisible ; { "1" } énumère ce qu'il faut corriger. <b>Il ne note pas les données, ne valide aucune ligne et ne promet pas qu'elles seront utilisées.</b>

seg-7dd95552a6fb = <b>Un préenregistrement, avant toute exécution notée.</b> Pour chaque ligne, un document dans <c1/> fixe, et est versionné avant que les données soient exécutées : la ligne, le SHA-256 du fichier de données, quelle partie des données est mise de côté (rien d'ajusté ne doit la voir), la métrique et le seuil. Pour les fiches d'horloge, le modèle existant est la prédiction sur données mises de côté utilisée pour les enregistrements IGS et de récepteur : ajuster sur le premier tiers de l'enregistrement, prédire la déviation d'Allan du reste, et exiger que le rapport prédit sur mesuré soit à l'intérieur d'un facteur déclaré à chaque temps de moyennage ajusté. Un seuil n'est jamais assoupli après une exécution.

seg-10dc9f8cf394 = <b>Une seule exécution notée.</b> Le résultat, chaque nombre et chaque échec compris, est publié avec la commande et le commit, et un test l'épingle. Un échec est un constat, et non un échec à cacher : la ligne reste MODELLED et la page le dit.

seg-e5704c43a6b8 = <b>La décision sur le registre est celle du propriétaire</b>, par écrit, dans le commit qui change la ligne. Le texte de la référence indépendante d'une ligne promue nomme le jeu de données, sa licence et son crédit, ce qui a été comparé et ce qui ne l'a pas été.

seg-6d467ffb4199 = Crédits et droits

seg-e82f31e7d9cc = Les données restent les vôtres selon la licence que vous indiquez. <c1/> et <c2/> gardent le fichier hors du dépôt.

seg-156499ebc142 = Une soumission <c1/> est créditée par la ligne d'attribution que vous donnez, dans le texte de la référence indépendante de la ligne et dans le fichier de résultat.

seg-a5c01115d23a = Rien n'est publié sous votre nom sans votre consentement écrit ; une organisation nommée comme source est citée comme source, jamais comme garante. Aucune affirmation d'approbation ou de caution n'est faite par ou à propos d'un partenaire.

seg-6c9ed423e51d = Vous pouvez retirer une soumission avant la publication de son résultat. Après cela, le résultat reste tel que consigné ; si vous retirez la licence des données, le fichier est supprimé du dépôt et le hachage et les notes demeurent.

seg-2cc3c091ba0f = { -brand } n'émet rien et ne pilote aucun matériel. Une soumission, c'est des fichiers en entrée et un rapport en sortie.

seg-01b0ee9973dc = Prospection

seg-b5cb4dc0493f = Une note d'une page pour un laboratoire est rédigée à l'intention du propriétaire dans <s1><c1/></s1>. C'est un brouillon : rien n'est envoyé, et personne n'est contacté, tant que le propriétaire n'a pas décidé.

seg-83b30e1ca261 = <s1>Précédent</s1>Paquets de preuves

seg-09c0b5fa6e52 = <s1>Suivant</s1>Liaisons optiques à travers l'atmosphère
