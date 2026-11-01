> Ceci est une traduction automatique de README.md à la version v0.40.0, qu'aucun locuteur natif n'a encore relue ; le README anglais fait foi. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana : l'emblème, un réticule de boussole marquant l'instant précis, à côté du logotype kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>l'instant précis</em></strong><br>
  Un simulateur open source pour la résilience PNT (positionnement, navigation et temps).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="État de l'intégration continue sur main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Couverture de lignes proche de 95 % de src/, mesurée dans docs/COVERAGE.md et bloquante à 85 % en intégration continue"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 capacités sur 401 VALIDATED par rapport à une référence externe indépendante, d'après la matrice de vérification"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="État du contrôle qualité SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Version v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Anglais et 17 autres langues, en traduction automatique"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Licence : AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, l'enregistrement conceptuel Zenodo de chaque version"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Une licence commerciale est disponible auprès d'Ashforde® OÜ, voir Éditions"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana sur crates.io, la version publiée actuelle"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana sur PyPI, la version publiée actuelle"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana sur npm, la version publiée actuelle"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Ouvrir Kshana Studio</a> ·
  <a href="#install">Installation</a> ·
  <a href="#capabilities">Capacités</a> ·
  <a href="#evidence">Preuves</a> ·
  <a href="#research">Recherche</a> ·
  <a href="docs/CONCEPTS.md">Documentation</a> ·
  <a href="#cite">Citer</a>
</p>

<p align="center">
  <strong>Langues :</strong> <a href="README.md">English</a> ·
  <a href="README.nl.md"><span lang="nl">Nederlands</span></a> ·
  <a href="README.pl.md"><span lang="pl">Polski</span></a> ·
  <a href="README.pt-BR.md"><span lang="pt-BR">Português (Brasil)</span></a> ·
  <a href="README.pt-PT.md"><span lang="pt-PT">Português (Portugal)</span></a> ·
  <a href="README.fi.md"><span lang="fi">Suomi</span></a> ·
  <a href="README.sv.md"><span lang="sv">Svenska</span></a> ·
  <a href="README.da.md"><span lang="da">Dansk</span></a> ·
  <a href="README.nb.md"><span lang="nb">Norsk bokmål</span></a> ·
  <a href="README.cs.md"><span lang="cs">Čeština</span></a> ·
  <a href="README.uk.md"><span lang="uk">Українська</span></a> ·
  <a href="README.ru.md"><span lang="ru">Русский</span></a> ·
  <a href="README.de.md"><span lang="de">Deutsch</span></a> ·
  <a href="README.fr.md"><span lang="fr">Français</span></a> ·
  <a href="README.es.md"><span lang="es">Español</span></a> ·
  <a href="README.et.md"><span lang="et">Eesti</span></a> ·
  <a href="README.ja.md"><span lang="ja">日本語</span></a> ·
  <a href="README.zh-Hans.md"><span lang="zh-Hans">简体中文</span></a><br>
  <sub>La ligne de commande, les résumés d'exécution, les graphiques et les rapports parlent chaque langue avec <code>--lang &lt;tag&gt;</code>
  (par exemple <code>kshana scenarios/holdover-test-example.toml --lang de</code>), de même que les interfaces Python, WebAssembly et MCP.
  Ce sont des traductions automatiques qu'aucun locuteur natif n'a encore relues ; l'anglais fait foi.
  Voir <a href="docs/i18n.md">Localisation</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Répétez la minute où le GNSS s'éteint. La console de mission de Kshana, tirée d'une exécution réelle du moteur v0.40.0 : la campagne enchaînée campaign-jam-spoof-holdover-integrity (graine 20260928, 6 phases, 18 exécutions membres sur T+01:16:10) et les 102 satellites GPS, Galileo, BeiDou et GLONASS de constellation-multi-gnss-coverage, chacun tracé sur l'orbite circulaire à deux corps reconstituée à partir de la trace au sol du moteur, rayons comprimés pour l'affichage. L'erreur de temps de l'horloge culmine à 62.7 ns face à une garde de 50 ns, la densité porteuse sur bruit tombe à -12.2 dB-Hz face à un plancher de 25 dB-Hz, et le niveau de protection vertical atteint 135.4 m face à une limite d'alerte de 50 m." width="100%">
</picture>

<details>
<summary><strong>Sommaire</strong></summary>

- [Répétez la minute où le GNSS s'éteint](#rehearse-the-minute-gnss-goes-dark)
- [Nouveautés de la 0.40](#whats-new-in-040), [Nouveautés de la 0.39](#whats-new-in-039), [Nouveautés de la 0.38](#whats-new-in-038) et [La 0.38 en détail](#038-in-depth) : notation Jammertest, les propres indicateurs du récepteur, entrées machine, temps et holdover, paquets de normes, LunaNet AFS, l'aller-retour avec le laboratoire, kshana-bench, l'observatoire, les exportateurs, l'optique, la [navigation des utilisateurs spatiaux](#space-user-navigation-gnss-ssv) et l'[infrastructure lunaire](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) et chaque page du Studio
- [Capacités](#capabilities) : le tableau des domaines, [chaque type de scénario par famille](#every-scenario-kind-by-family), [chaque commande](#every-command), [chaque interface](#every-surface)
- [Déroulement d'une exécution](#how-a-run-works), [Missions](#missions)
- [Preuves](#evidence) : le registre, les [domaines de capacités](#capability-domains)
- [Installation](#install), [Architecture](#architecture) (et les [diagrammes](#diagrams)), [Assistant IA](#ai-assistant)
- [Éditions](#editions), [Recherche](#research), [Citer](#cite), [Licence](#licence)
- [Référence](#reference) : utilisation, format des scénarios, sorties, organisation du dépôt, FAQ, dépannage, gestion des versions, feuille de route, contribution, documentation

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Répétez la minute où le GNSS s'éteint

Kshana rejoue le brouillage, le leurrage et le holdover d'horloge lorsque les signaux GNSS (Global Navigation Satellite
System, système mondial de navigation par satellite) font défaut, et vous dit combien de temps un système maintient le temps et la position dans son
budget, et quelle horloge ou quel capteur apporte le plus de marge. C'est un seul moteur Rust. Il fonctionne dans un
terminal, un notebook, un IDE (environnement de développement intégré), un assistant d'IA (intelligence
artificielle), ou dans votre navigateur.

Chaque exécution est reproductible bit à bit à partir du scénario, de la graine et de la version du moteur.
Chaque capacité porte l'une de trois étiquettes dans un registre vérifié par machine : **VALIDATED** (une
référence externe indépendante concorde), **MODELLED** (cohérent en interne, et dit ouvertement)
ou **PARTNER** (un partenaire matériel en est responsable).

> **État : v0.40.0.** Un substrat de simulation validé et reproductible pour la résilience PNT.
> Le temps et le holdover passent en premier, parce que c'est le domaine le mieux validé. Kshana est un
> instrument d'étude et d'arbitrage : ce n'est pas un générateur de signaux radiofréquence (RF) matériel (il
> ne pilote aucune radio et n'émet rien ; sa sortie au niveau du signal consiste en fichiers d'échantillons IQ en bande de base
> pour récepteurs logiciels), ni un récepteur GNSS matériel ou certifié (son récepteur logiciel
> est un outil d'analyse), ni un produit de vol. Nouveau dans le domaine ? Commencez par
> l'[introduction en langage clair](docs/CONCEPTS.md) et le [glossaire](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Nouveautés de la 0.40

La 0.40 ajoute un budget d'erreur au niveau de la mission, étiquette chaque figure et chaque tableau avec son niveau de preuve, lit les journaux d'horloge mesurés,
vérifie les soumissions des partenaires de données, estime où un émetteur d'interférence peut se trouver, et parle dix-sept langues en plus de l'anglais.
Le registre compte désormais 401 lignes : 176 VALIDATED, 221 MODELLED, 4 PARTNER. Aucune ligne n'a été promue VALIDATED, et chaque échec ci-dessous est
figé par un test.

- **Fil de mission.** Le type `mission-thread` enchaîne des phases du lancement à la rentrée (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` et quatre types lunaires) avec des règles de transfert énoncées, une marge face aux exigences énoncées et le maillon
  le plus faible ; un exemple de bout en bout de classe Artemis sur 11 phases (segments terrestre et lunaire), 92 types de scénarios au total. Chaque nombre est MODELLED. La propagation cislunaire face à la trajectoire publique d'Artemis I
  **manque** son seuil préenregistré (45.3 km et 0.25 m/s face à 5 km et 0.05 m/s ; la cause est de petites manœuvres que le modèle n'inclut pas), et le propagateur lunaire face à l'orbite
  de CAPSTONE **manque** (136.8 km face à 25 km à la fin d'une révolution) ; la comparaison LRO est atteinte. Les lignes restent MODELLED
  ([Fil de mission](docs/MISSION-THREAD.md), [segment lunaire](docs/MISSION-THREAD-LUNAR.md)). Dans le Studio, le fil se lit à `/studio/mission-thread/`.
- **Étiquettes de preuve.** Chaque figure et chaque tableau qu'une exécution écrit porte le niveau et les identifiants de lignes du registre sur lesquels il repose, lus dans la matrice.
- **Horloges mesurées.** Huit formats de journaux d'horloge sont lus ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)) et une série
  ajustée peut piloter le holdover. Face aux seuils préenregistrés, l'ajustement **manque** F1(a) sur cinq enregistrements sur six et F2 sur un ; les deux
  restent MODELLED ([Journal des modifications](CHANGELOG.md#0400---2026-10-29)).
- **Partenaires de données.** `kshana partner check` vérifie le format d'une soumission et ne note rien ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Région de l'émetteur.** `kshana interference-map locate` donne une région et une ellipse, jamais un simple point, à partir de rapports ADS-B ou AIS.
  Comparé une fois aux sites d'émetteurs de Jammertest 2025, le résultat est **NOT ASSESSABLE** pour les deux sources (trop peu
  de sessions planifiées dans les données ouvertes), donc la ligne reste MODELLED ([Carte des interférences](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Banc d'essai.** La nouvelle campagne 0.40 atteint A3, D3 (tous deux EXPLORATORY), R3 et R4 ; A2, D1 et R1 restent NOT MET ([Bench](docs/BENCH.md)).
- **Langues.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja et zh-Hans, sous forme de **traductions automatiques qu'aucun locuteur
  natif n'a relues** ; l'anglais fait foi, et les exécutions dans une autre langue que l'anglais prennent environ deux fois plus de temps
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Nouveautés de la 0.39

La 0.39 n'ajoute aucune fonctionnalité et ne change aucun résultat ; la sortie du moteur est celle de la 0.38. Elle corrige une chose
dans la ligne de commande, met à jour des dépendances de l'outillage de validation croisée, et énonce les verdicts du banc d'essai
en entier.

- **Ligne de commande.** `kshana kinds | head` (toute sortie standard fermée) ne panique plus : le programme se termine
  silencieusement avec le code 141, comme le font d'autres outils pour un tube fermé. Les autres erreurs d'écriture se signalent toujours.
- **Dépendances.** `memmap2` 0.9.11 dans les deux verrous de contre-vérification ANISE, et `pillow` 13.0.0 et
  `certifi` 2026.10.19 dans les versions figées de l'environnement de référence, le tout sous `xval/` : rien de ce qui est livré n'a changé.
- **kshana-bench, tous les verdicts.** Face aux seuils préenregistrés, trois sont NOT MET, chacun figé par un test :
  A2 (`agc_k_sigma` AUC 0.766 face à au moins 0.80), D1 (plus grand écart 0.0301) et la tâche (b) R1 (reportée,
  non réexécutée). Aucun seuil n'a été assoupli ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Nouveautés de la 0.38

La 0.38 rend l'arbitre neutre mesurable : elle note les journaux de récepteur face à un calendrier d'essais
publié, lit davantage de récepteurs et de capteurs, teste les systèmes de temps, et livre un banc d'essai et un
observatoire des interférences. Elle reste à titre consultatif : rien ici n'est certifié, aucun résultat n'est une homologation,
et rien n'émet. Chaque ligne indique ce que le registre contient pour elle ([comment une étiquette s'obtient](#evidence)) ;
un état ne nomme que ce qui a été vérifié, et la ligne du registre et la page liée disent ce qui ne l'a pas été.

| Nouveau en 0.38 | Ce que cela fait, et pourquoi | État dans le registre | Lire |
|---|---|---|---|
| **Notation Jammertest** | `kshana jammertest import` lit le catalogue d'essais et le plan d'émission publiés par la NPRA comme vérité planifiée ; `jammertest score` note un journal de récepteur par essai (latence de détection, alarmes manquées, fausses alarmes, temps de rétablissement), sous forme de paquet de preuves signé si vous fournissez une clé | **MODELLED** : une ligne du registre. Les seuils ont été préenregistrés avant toute exécution notée ; sur les données JammerTest 2024, la règle de données minimales a échoué dans les deux exécutions (4 et 7 fenêtres notables face aux 10 requises), donc **aucun seuil n'est évaluable** et rien n'est revendiqué | [Jammertest](docs/JAMMERTEST.md) |
| **Les propres indicateurs du récepteur** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG et NovAtel RXSTATUS lus dans un `self_report` par époque et comparés aux alarmes de Kshana (les deux, récepteur seul, Kshana seul, aucun) ; un lecteur Septentrio SBF et une entrée `--serial` en lecture seule | **MODELLED** ; l'accord entre le détecteur d'un récepteur et celui de Kshana n'est pas une validation | [Confiance du récepteur](docs/RECEIVER-TRUST.md) |
| **Davantage de récepteurs et de capteurs** | RTKLIB `.pos`, NovAtel OEM7, C/N0 RTCM 3 MSM4/MSM7 (à partir des tables pyrtcm sous licence BSD, pas du texte RTCM), flux de surveillance GNSS-SDR, un journal d'IMU comme second capteur, un paquet ROS 2, un pont `gnss_lib_py`, et `imu-fit` pour les paramètres de capteurs hybrides | **MODELLED** : six lignes du registre ; uniquement des jeux de test écrits par nous, aucune capture d'un vrai récepteur, d'une IMU, d'une exécution GNSS-SDR ou d'un graphe ROS n'a été lue | [Entrées machine](docs/MACHINE-INPUTS.md) |
| **Essais de temps et de holdover** | le type `holdover-test` note un essai de holdover (GNSS retiré par l'opérateur, holdover, rétablissement) à partir d'un enregistrement mesuré de l'erreur de temps face aux gabarits ITU-T, « mesuré face au gabarit » ; lecteurs de journaux linuxptp et chrony ; les étapes matérielles et le champ `lab-attestation` | **MODELLED** : deux lignes du registre ; les instants sont la déclaration de l'opérateur, non vérifiée | [Timing HIL](docs/TIMING-HIL.md), [Sécurité matérielle](docs/HARDWARE-SAFETY.md) |
| **Paquets de normes, LunaNet AFS, aller-retour avec le laboratoire** | paquets notés pour DHS RPCF, IMO MSC.1/Circ.1575 et ICAO Doc 9849 Appendix F face à des seuils énoncés avant l'exécution, « étaye les preuves pour » ; une table de correspondance NIST IR 8323r1 ; un générateur et vérificateur de codes LunaNet AFS ; un paquet signé qui relie le scénario d'une exécution en laboratoire, les conditions d'essai, le journal du récepteur et la note | **MODELLED** pour les paquets et l'aller-retour ; la vérification des codes AFS est **VALIDATED** face à ses colonnes de contrôle imprimées (voir les lignes du registre) | [Normes](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench et l'observatoire** | tâches, partitions et métriques fixes pour la détection d'interférences, la détection IQ, la prédiction de holdover et l'écart d'optimisme, avec un jeu réservé scellé et un classement statique ; un produit quotidien reproductible sur les interférences avec un délai de 24 h, des cellules grossières et aucune attribution | aucune ligne du registre en propre : il note des soumissions, et ses références de base sont étiquetées MODELLED dans les fichiers de résultats ; face aux seuils préenregistrés, le correcteur, C1 à C3 et D2 sont atteints et trois seuils sont **NOT MET** (figés par des tests) : A2 (`agc_k_sigma` AUC 0.766 face à au moins 0.80 sur la partition de test), D1 (plus grand écart 0.0301) et la tâche (b) R1 (reportée, non réexécutée) ; voir `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatoire](docs/observatory/METHOD.md) |
| **Exportateurs** | télémétrie de confiance sous forme de messages de découverte et d'état MQTT pour Home Assistant (publication seule, aucun identifiant) à côté de Prometheus, CEF, LEEF et OTLP | **MODELLED** : une ligne du registre | [Télémétrie de confiance](docs/TRUST-TELEMETRY.md) |
| **Marge de liaison optique en fonction du temps** | le type `optical-atmosphere` peut écrire une réalisation, issue d'une graine, de la météo d'un site sous forme de série de marges de liaison | **MODELLED** : une ligne du registre ; un tirage du modèle, pas le climat | [Atmosphère optique](docs/OPTICAL-ATMOSPHERE.md) |

Points forts de la 0.37 : [journal des modifications](CHANGELOG.md#0370---2026-10-17). La liste complète de la 0.38 se trouve dans le
[journal des modifications](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## La 0.38 en détail

Chaque capacité du tableau ci-dessus, en quelques lignes : ce qu'elle fait, une commande pour l'exécuter, une
image tirée d'une exécution réelle du moteur, et ce que le registre contient pour elle. Les images
sont écrites par [`tools/gen_figures_038.py`](tools/gen_figures_038.py) dans
[`docs/figures/0.38/`](docs/figures/0.38/) (jamais dessinées à la main) : `python3 tools/gen_figures_038.py`
les réécrit à partir d'un moteur compilé, et `--check` échoue si l'une est périmée ou si sa légende ici diffère.
Lorsqu'une entrée est un journal, c'est un journal fictif que le script écrit, parce que les vrais journaux de tiers
ne sont jamais intégrés au dépôt, et la légende le dit. Tout ce qui suit est à titre consultatif : non certifié, pas une
homologation, et rien n'émet. Un état nomme ce qui a été vérifié et rien de plus ;
[comment une étiquette s'obtient](#evidence).

### Notation Jammertest

`kshana jammertest import` transforme le catalogue d'essais et le plan d'émission publiés par la NPRA en
vérité planifiée, et `kshana jammertest score` note un journal de récepteur face à celle-ci : pour chaque
essai planifié, s'il a été détecté, avec quel retard, et combien de temps le récepteur a mis à se rétablir, plus
les fausses alarmes en dehors de tout créneau. Le catalogue est téléchargé, jamais intégré au dépôt.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Notation d'un journal de récepteur synthétique face à un calendrier de trois essais, tirée d'une exécution réelle du moteur v0.40.0 (`kshana jammertest score`). Le journal est fictif : 1800 s de NMEA avec une chute de C/N0 de 20 dB sur deux intervalles. Le calendrier liste trois créneaux ; le créneau du milieu n'a pas de brouilleur dans le journal. La note marque 2 essais sur 3 détectés (latence médiane 0 s) et 1 manqué, avec 0 série de fausses alarmes sur 0.25 h de temps propre. Rien ici ne dit quoi que ce soit d'un vrai récepteur. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC 61108, IEC 61162) : l'opérateur reste responsable de la navigation du navire.">
</picture>

**État dans le registre : MODELLED.** Les seuils ont été fixés avant toute exécution notée ; sur les données JammerTest 2024,
la règle de données minimales a échoué dans les deux exécutions, donc aucun seuil n'est évaluable et rien n'est revendiqué.
[Jammertest](docs/JAMMERTEST.md).

### Les propres indicateurs du récepteur

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG et NovAtel RXSTATUS sont lus dans un `self_report` par époque
et placés à côté des alarmes de Kshana : les deux, récepteur seul, Kshana seul, ou aucun. Un
lecteur Septentrio SBF et une entrée `--serial` en lecture seule alimentent la même comparaison. Aucun des deux côtés n'est
la vérité terrain.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Le propre indicateur de leurrage du récepteur placé face aux alarmes de Kshana, tiré d'une exécution réelle du moteur v0.40.0 sur un journal UBX fictif (200 époques à 1 Hz). Le C/N0 chute de 20 dB de 80 à 90 s et de 120 à 130 s ; le récepteur signale 120 à 130 s et 160 à 165 s. Sur 140 époques comparées après calibration, 11 ont un signalement des deux côtés, 6 du récepteur seul, 11 de Kshana seul et 112 d'aucun. Aucun des deux côtés n'est la vérité terrain et l'accord n'est pas une validation. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

**État dans le registre : MODELLED.** L'accord entre le détecteur d'un récepteur et celui de Kshana n'est pas
une validation. [Confiance du récepteur](docs/RECEIVER-TRUST.md).

### Davantage de récepteurs et de capteurs

RTKLIB `.pos`, NovAtel OEM7, C/N0 RTCM 3 MSM4/MSM7, les flux de surveillance GNSS-SDR, un journal d'IMU comme second
capteur, un paquet ROS 2 et un pont `gnss_lib_py` aboutissent tous à la même chronologie de confiance du récepteur.
`imu-fit` lit les paramètres de capteur dont les scénarios hybrides et de fusion ont besoin à partir d'un journal d'IMU
immobile, de sorte qu'un scénario peut être exécuté avec le capteur dont vous disposez réellement.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Ce que `kshana imu-fit` lit dans un journal d'IMU immobile, tiré d'une exécution réelle du moteur v0.40.0 sur un journal fictif (20,000 échantillons à 100 Hz, 200 s) : la marche aléatoire en vitesse de l'accéléromètre q_va = 4.02e-06, la marche aléatoire en angle du gyromètre q_arw = 9e-08, l'instabilité de biais 0.00296 et les premières pentes d'Allan (-0.51 et -0.49 ; environ -0.5 là où le bruit blanc domine). Le tableau à côté est le TOML que la commande imprime. L'estimateur n'est vérifié que sur des journaux synthétiques. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

**État dans le registre : MODELLED.** Uniquement des jeux de test écrits par nous ; aucune capture d'un vrai récepteur, d'une IMU,
d'une exécution GNSS-SDR ou d'un graphe ROS n'a été lue. [Entrées machine](docs/MACHINE-INPUTS.md).

### Essais de temps et de holdover

Le type `holdover-test` note un essai de holdover (GNSS retiré par l'opérateur, holdover, rétablissement)
à partir d'un enregistrement mesuré de l'erreur de temps face aux gabarits ITU-T, et le dit en ces termes : mesuré
face au gabarit. Des lecteurs de journaux linuxptp et chrony l'alimentent ; les étapes matérielles et le
champ `lab-attestation` disent qui a déclaré quoi.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Un essai de holdover noté à partir d'un enregistrement de l'erreur de temps, tiré d'une exécution réelle du moteur v0.40.0 sur scenarios/holdover-test-example.toml (601 échantillons toutes les 5 s). Le GNSS est retiré par l'opérateur à 600 s et rétabli à 2400 s ; l'erreur de temps dérive jusqu'à 299 ns à la fin du holdover, dépasse le budget de 100 ns après 675 s, et revient dans la bande de 100 ns 70 s après le rétablissement. Verdicts : gabarits de référence PASS, gabarits de holdover FAIL, enveloppe de holdover FAIL, rétablissement RECOVERED. Mesuré face au gabarit, pas une approbation. Les instants sont la déclaration de l'opérateur, non vérifiée par Kshana. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

**État dans le registre : MODELLED.** Les instants où le GNSS a été retiré et rétabli sont la déclaration de l'opérateur,
non vérifiée. [Timing HIL](docs/TIMING-HIL.md), [Sécurité matérielle](docs/HARDWARE-SAFETY.md).

### Paquets de normes

Paquets notés pour les profils d'essai DHS Resilient PNT, IMO MSC.1/Circ.1575 et ICAO Doc 9849
Appendix F, plus une table de correspondance NIST IR 8323r1 dans `compliance-report`. Chaque essai exécute un
scénario fourni et compare un champ de résultat à un seuil énoncé avant l'exécution ; un essai qui nécessite un journal
de récepteur est listé comme nécessitant une entrée, non noté. La formulation est « étaye les preuves pour ».

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Chaque essai des trois paquets de normes notés, tiré d'exécutions réelles du moteur v0.40.0 (`kshana standards-pack run`) : dhs-rpcf : 6 atteints, 1 non atteint, 2 nécessitent une entrée ; imo-circ-1575 : 1 atteint, 4 non atteints, 2 nécessitent une entrée ; icao-doc9849-appf : 6 atteints, 0 non atteint, 2 nécessitent une entrée. Au total, 13 atteints, 5 non atteints et 6 nécessitent une entrée dont le moteur ne dispose pas (un journal de récepteur ou une documentation d'équipement). Chaque seuil a été énoncé avant l'exécution ; un échec reste un échec. Un seuil atteint dit qu'un scénario modélisé a atteint un seuil énoncé, rien sur un produit. Les paquets étayent les preuves pour les lignes qu'ils citent ; ce ne sont pas une évaluation. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine ; elle ne doit pas être la seule base d'une décision de navigation ou de sécurité.">
</picture>

**État dans le registre : MODELLED.** Un seuil atteint dit qu'un scénario modélisé a atteint un seuil énoncé, rien sur un
produit ; chaque échec est conservé et figé par un test. [Normes](docs/STANDARDS.md).

### LunaNet AFS

Le générateur de codes LunaNet Augmented Forward Signal (codes de Gold, de Weil et tertiaires, la trame
de message et son codage d'erreur) et un vérificateur pour un flux de symboles enregistré ou généré, rattachés à une
édition de la spécification.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="Le générateur de codes LunaNet AFS vérifié face aux colonnes imprimées de la spécification, tiré d'une exécution réelle du moteur v0.40.0 (`kshana lunanet-afs-check spec`, rattaché à LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 janvier 2025 ; le document marque ses tables de codes {LSIS-TBC}). 9 vérifications sur 10 sont atteintes ; B4 est NOT MET (420 sur 421 concordants). Il vérifie un flux de symboles face à une édition d'une spécification publiée et ne dit rien d'un quelconque nœud ou service LunaNet. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Il vérifie un flux de symboles face à une édition d'une spécification publiée et ne dit rien d'un quelconque nœud ou service LunaNet.">
</picture>

**État dans le registre : VALIDATED** pour les vérifications de codes et de synchronisation, face aux valeurs que la
spécification imprime (qu'elle marque TBC) ; une vérification est NOT MET, conservée et figée (une colonne imprimée
de code tertiaire diffère : le document imprime la même valeur pour deux PRN). Les mots LDPC et CRC
des sous-trames 2 à 4 ne sont pas vérifiés. Les lignes du registre disent exactement lesquels. [LunaNet AFS](docs/LUNANET-AFS.md).

### Aller-retour avec le laboratoire

`kshana.test-conditions/1` est une description publiée de ce qu'un laboratoire a fait (événements, instants,
puissances). `kshana evidence round-trip` relie l'empreinte du scénario, l'empreinte des conditions, l'empreinte du journal
du récepteur et la note dans un seul paquet signé, et refuse un paquet dont les conditions et le scénario de notation
sont en désaccord sur les événements. Kshana ne produit ni ne rejoue jamais un signal : la manière dont un scénario a atteint un
récepteur relève de la responsabilité de l'opérateur.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="La structure d'un paquet de preuves. Un journal de récepteur (NMEA, u-blox UBX, RINEX 3 ou un journal Android) et une fenêtre de temps entrent dans kshana receiver-trust evidence, qui écrit sept fichiers : log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig et un timestamp.tsr facultatif. Le manifeste enregistre le SHA-256 du journal entier et de chaque fichier ainsi qu'une chaîne d'empreintes sur les fichiers ; la signature couvre le manifeste. kshana evidence verify vérifie la signature, l'empreinte de chaque fichier, la chaîne et l'absence de tout fichier non listé, et se termine avec 0 si la vérification réussit, 1 si quelque chose a échoué et 3 si le signataire n'était pas épinglé. Un paquet est un enregistrement technique, pas un avis juridique.">
</picture>

L'image montre l'organisation d'un paquet. **État dans le registre : MODELLED.**
[Conditions d'essai](docs/spec/TEST-CONDITIONS.md), [Banc d'essai](docs/TEST-BENCH.md).

### kshana-bench

Tâches, partitions et métriques fixes pour la détection d'interférences, la détection IQ, la prédiction de holdover et
l'écart d'optimisme, avec un jeu réservé scellé et un classement statique. Il note des soumissions ; ce n'est pas
un classement de récepteurs.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="Les références de base intégrées de la tâche D de kshana-bench (l'écart d'optimisme) sur la partition de test, tirées d'une exécution réelle du moteur v0.40.0 (`kshana bench baseline`). Chaque paire de barres est l'aire sous la courbe ROC sur les cas dans la distribution et sur les cas décalés ; l'écart entre elles est l'écart d'optimisme, face à une tolérance de 0.05. fused-max-z : 0.998 et 0.983 (écart 0.015) ; sqm-imbalance : 0.882 et 0.882 (écart 0.001) ; agc-excess : 0.848 et 0.819 (écart 0.030) ; raim-parity : 0.682 et 0.672 (écart 0.010) ; energy-cn0-drop : 0.595 et 0.565 (écart 0.030). Les étiquettes sont celles d'un modèle génératif sur un corpus synthétique, jamais des données de terrain : MODELLED. À titre consultatif : modélisé ou mesuré face à des références énoncées, pas une approbation, une certification ou une déclaration de conformité. Une note décrit un journal ou un corpus, jamais un produit.">
</picture>

**État dans le registre :** aucune ligne du registre en propre ; les références de base sont étiquetées MODELLED dans les fichiers de résultats.
Face aux seuils préenregistrés, le correcteur, C1 à C3 et D2 sont atteints et trois seuils sont NOT MET, chacun
figé par un test : A2 (`agc_k_sigma` AUC 0.766 face à au moins 0.80 sur la partition de test), D1 (plus grand écart
0.0301) et la tâche (b) R1 (reportée de la campagne précédente, non réexécutée). Les chiffres sont dans
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Observatoire des interférences

Un produit par jour UTC et par région, à partir d'une archive ouverte de positions d'aéronefs, sur une grille grossière fixe :
chaque cellule est dégradée, non dégradée, ou non observée (ce qui ne veut pas dire « dégagée »). Publié au plus tôt
24 h après la fin de la journée, avec les petites cellules supprimées et sans attribution de cause.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Deux journées synthétiques de carte des interférences tirées des échantillons versionnés dans examples/interference-map/output, chacune avec sa propre route synthétique et les parts d'exposition de la route que le moteur indique. À gauche, une journée ADS-B : 1 cellule dégradée, 6 non dégradées, 4 non évaluées (hachurées) et des cellules sans entrée, dessinées vides, qui n'ont pas été observées. La route fait 525 km : 11.5% de sa longueur dans des cellules dégradées, 38.3% non dégradées, 9.1% non évaluées et 41.1% non observées. À droite, une journée AIS : cellules signalées par les détecteurs de cercle et de position à terre, cellules non anormales et cellules vides ; la route fait 454 km avec 10.5% dans des cellules anormales, 21.2% non anormales, 0.0% non évaluées et 68.3% non observées. ADS-B et AIS sont des couches séparées, jamais combinées. Une cellule signalée n'est pas un constat d'interférence, et une cellule sans couleur n'a pas été observée, ce qui n'est pas la même chose que dégagée. Toutes les données sont fictives, en plein milieu de l'Atlantique, et ne sont pas une mesure.">
</picture>

L'image montre les journées d'échantillon versionnées, pas un produit de l'observatoire. **État dans le registre : MODELLED** :
aucune référence externe, aucune vérité terrain et aucune attribution de cause ; une cellule non observée n'a pas été
évaluée, ce qui n'est pas la même chose que dégagée. [Méthode de l'observatoire](docs/observatory/METHOD.md).

### Exportateurs

Télémétrie de confiance sous forme de texte Prometheus, CEF, LEEF, OTLP et de messages de découverte et d'état MQTT pour Home Assistant.
La commande ne publie que vers une destination que vous lui donnez et ne détient aucun identifiant.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Un résultat de confiance dans trois formats d'export, tiré d'exécutions réelles du moteur v0.40.0 (`kshana trust-telemetry`) sur examples/maritime-trust : exposition texte Prometheus (le dernier score de confiance est 5.9 et la bande non fiable est celle qui est active), et les derniers messages CEF et LEEF. La commande ne publie rien sans destination, ne détient aucun identifiant et n'émet aucun signal radio. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC 61108, IEC 61162) : l'opérateur reste responsable de la navigation du navire.">
</picture>

**État dans le registre : MODELLED.** [Télémétrie de confiance](docs/TRUST-TELEMETRY.md).

### Marge de liaison optique en fonction du temps

Le type `optical-atmosphere` peut écrire une réalisation, issue d'une graine, de la météo d'un site sous forme de série
de marges de liaison : épisodes nuageux, une colonne d'eau liquide pour chacun, un échantillon de scintillation par pas. La
page Optical PNT du Studio ouvre les scénarios optical-atmosphere.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Une réalisation, issue d'une graine, de la marge de liaison du site 'northern' sur 336 h, tirée d'une exécution réelle du moteur v0.40.0 sur scenarios/optical-atmosphere-network.toml (graine 37, pas de 600 s). La marge passe sous zéro pendant les épisodes nuageux ; dans ce tirage, la liaison est disponible 40.5 % du temps, avec 27 coupures et une coupure la plus longue de 30.7 h. Les entrées sont illustratives, la série est un tirage du modèle et non le climat, et elle diffère de la disponibilité statistique (37.8 %) de l'erreur d'échantillonnage du tirage. Analyse à titre consultatif seulement : ni un produit certifié de disponibilité, d'intégrité ou de navigation, ni une prédiction pour un site réel à moins que ses entrées climatiques ne proviennent d'un jeu de données énoncé.">
</picture>

**État dans le registre : MODELLED.** Un tirage du modèle, pas le climat. [Atmosphère optique](docs/OPTICAL-ATMOSPHERE.md).

### Nouvelles vues du Studio

[kshana.dev/studio](https://kshana.dev/studio/) gagne une relecture Bridge (deux exécutions côte à côte sur une même
horloge de mission, à [`/studio/replay/`](https://kshana.dev/studio/replay/)), une page Optical PNT
(`/studio/optical/`), une page Holdover test (`/studio/holdover/`) et une visionneuse de l'observatoire
(`/studio/observatory/`). Elles exécutent le même moteur dans le navigateur, rien n'est téléversé, et elles portent
la même déclaration à titre consultatif. Les images ci-dessus sont tirées de la sortie propre du moteur par un script ;
ce ne sont pas des captures d'écran de ces pages.

<a id="space-user-navigation-gnss-ssv"></a>
### Navigation des utilisateurs spatiaux (`gnss-ssv`)

Pour un engin spatial au-dessus, autour ou bien au-delà des orbites GNSS : combien de signaux GNSS il peut utiliser, quelle
est leur puissance, quelle est la qualité de la géométrie, et ce qu'un filtre embarqué peut en faire. Un seul type,
quatre modes, choisis par les tables du scénario : une **coquille** d'utilisateurs (la part du temps avec un et quatre
signaux, par constellation), une **trajectoire** (signaux, C/N0, dilution de précision et le
milieu traversé par les rayons rasant le limbe le long d'une orbite), une exécution de **navigation** (un filtre à neuf états sur les pseudo-distances, jusqu'à la
Lune) et une **formation** (navigation relative d'adjoints autour d'un chef). La source publique pour la
comparaison de disponibilité est le livret interopérable GNSS Space Service Volume (UN OOSA
ST/SPACE/75, du Comité international sur les GNSS), qui est lui-même une simulation ; il est téléchargé, jamais
intégré au dépôt. Page complète : [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Disponibilité des signaux pour un utilisateur sur une sphère à 36000 km d'altitude avec une antenne hémisphérique, tirée d'une exécution réelle du moteur v0.40.0 sur scenarios/gnss-ssv-shell.toml (une exécution réduite : 162 utilisateurs, 3 jours, pas de 10 min), à un seuil de 20 dB-Hz. Pour chaque constellation et bande, deux barres : la part des paires (utilisateur, époque) avec au moins un signal et avec au moins quatre. Combiné, L1 : 99.4 % au moins un, 73.2 % au moins quatre, plus longue coupure sous quatre signaux 160 min. Combiné, L5 : 100.0 % au moins un, 99.9 % au moins quatre, plus longue coupure sous quatre signaux 20 min. MODELLED : une étude modélisée à partir d'entrées énoncées, pas une mesure et pas une revendication de volume de service pour un quelconque système. La taille réduite n'est pas la comparaison avec le livret. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signaux le long d'une orbite terrestre haute (périgée 497 km, apogée 58622 km, période 18.8 h), tirés d'une exécution réelle du moteur v0.40.0 sur scenarios/gnss-ssv-heo.toml, bande L1. En haut : la meilleure densité porteuse sur bruit parmi les signaux en vue, face au seuil de 20 dB-Hz. Au milieu : le nombre de signaux en vue de toutes les constellations, de 4 à 55 le long des points échantillonnés. Parmi les liaisons reçues, 2252 sont passées par un lobe principal et 696 par des lobes secondaires, avec un diagramme paramétrique de substitution étiqueté, et non le diagramme mesuré d'un quelconque système. PDOP médian 67, 95e centile 358. MODELLED : une étude modélisée à partir d'entrées énoncées, pas une mesure et pas une revendication de volume de service pour un quelconque système. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Un filtre embarqué à neuf états sur un transfert depuis une orbite basse vers la Lune, tiré d'une exécution réelle du moteur v0.40.0 sur scenarios/gnss-ssv-nav-lunar.toml (289 époques, 13 points tracés). Sur un axe logarithmique, l'erreur de position vraie et la borne à un sigma propre au filtre en fonction du temps depuis le départ. À l'intérieur des orbites GNSS, la RMS de position est de 1.4 m ; au-dessus, elle est de 90 m, avec une erreur finale de 184 m à 193,330 km d'altitude avec 1 mesure. L'erreur d'estimation normalisée au carré moyenne sur toute l'exécution est de 4.4 (environ 3 pour un bloc de position cohérent). La vérité et le filtre partagent leurs substituts du Soleil et de la Lune. MODELLED : une étude modélisée à partir d'entrées énoncées, pas une mesure et pas une revendication de volume de service pour un quelconque système. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Navigation relative de 2 adjoints autour d'un chef sur une orbite haute, tirée d'une exécution réelle du moteur v0.40.0 sur scenarios/gnss-ssv-formation-heo.toml (401 époques). Pour chaque adjoint, deux barres : la RMS de position relative obtenue en soustrayant les deux estimations absolues indépendantes, et celle du filtre relatif sur les pseudo-distances en simple différence. Ligne de base 0.8 km : 5.1 m et 1.2 m. Ligne de base 2.0 km : 4.1 m et 2.1 m. Le filtre absolu n'est pas cohérent ici : erreur d'estimation normalisée au carré moyenne de 187 face à environ 3 pour un filtre cohérent, donc son incertitude annoncée est bien trop petite. MODELLED : une étude modélisée à partir d'entrées énoncées, pas une mesure et pas une revendication de volume de service pour un quelconque système. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

**État dans le registre : MODELLED, et la comparaison avec le livret échoue pour l'essentiel.** Les seuils ont été fixés avant
l'exécution. Sur huit, seuls S0 (le bilan de liaison inverse, 13 valeurs sur 13) et S6 (la mission lunaire) sont
atteints. **S1 à S5 et S7 sont NOT MET** : la géométrie des volumes de service supérieur et inférieur (43 cellules sur 52 et 48 sur 52),
le volume de service supérieur à 15/20/25 dB-Hz, les six missions GEO, la mission HEO, et le
diagramme paramétrique des lobes secondaires face aux diagrammes mesurés des panneaux GPS. Presque chaque échec de S1 à S5 implique
GLONASS, et le livret imprime deux angles de référence différents pour celui-ci ; une variante de diagnostic qui utilise
l'autre paire amène S1, S2 et S4 à toutes les cellules, mais elle ne remplace pas l'exécution de référence et aucune ligne n'est
VALIDATED. Le filtre absolu de l'exécution en formation est également trop confiant (erreur normalisée au carré moyenne
bien au-dessus de la valeur d'environ 3 que donne un filtre cohérent).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="La comparaison enregistrée du modèle de disponibilité pour les utilisateurs spatiaux avec le livret public Space Service Volume, à partir des résultats versionnés de l'exécution préenregistrée (xval/gnss-ssv/results-run1.json, écrits par l'exemple ssv_booklet_check du moteur v0.40.0). Barre par barre, les cellules dans la tolérance : S0 13 sur 13 (MET) ; S1 43 sur 52 (NOT MET) ; S2 48 sur 52 (NOT MET) ; S3 122 sur 155 (NOT MET) ; S4 132 sur 156 (NOT MET) ; S5 18 sur 26 (NOT MET) ; S6 26 sur 26 (MET) ; S7 0 diagramme de panneau sur 20 (NOT MET). Seuls S0 et S6 sont atteints selon la lecture préenregistrée. Une variante de diagnostic qui utilise les autres angles GLONASS du livret amène S1, S2 et S4 à toutes les cellules, mais ne remplace pas l'exécution de référence. Aucune ligne du registre n'est VALIDATED. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

[Navigation des utilisateurs spatiaux](docs/SSV.md), [ce que montre la comparaison](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Infrastructure lunaire (`lunar-infrastructure`)

L'orbite et la surface de la Lune comme infrastructure de navigation et de géodésie, en cinq études choisies par
`study` : **od-consistency** (une détermination d'orbite embarquée par GNSS terrestre sur une orbite de halo face à une
détermination au sol indépendante), **carrier-phase** (résolution des ambiguïtés entières entre des stations de surface et un
orbiteur), **frame-coestimation** (le datum lunaire à partir de la télémétrie des stations terrestres avec et sans liaisons
de l'orbiteur), **space-tie** (décalages laser, VLBI et GNSS sur un même engin spatial face à l'erreur de rattachement local) et
**geodesy-sensitivity** (quelle famille d'observables voit les nombres de Love h2, k2 et l2). Le modèle est un
modèle restreint à trois corps avec des simplifications énoncées et des entrées illustratives. Page complète :
[docs/LUNAR-INFRASTRUCTURE.md](docs/LUNAR-INFRASTRUCTURE.md).

```sh
kshana scenarios/lunar-infrastructure-od-consistency.toml
kshana scenarios/lunar-infrastructure-carrier-phase.toml            # quick; the scored run takes about eight minutes
kshana scenarios/lunar-infrastructure-frame-coestimation.toml
kshana scenarios/lunar-infrastructure-space-tie.toml
kshana scenarios/lunar-infrastructure-geodesy-sensitivity.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-od-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-od-light.svg">
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Cohérence d'une détermination d'orbite embarquée par GNSS terrestre sur une orbite de halo quasi rectiligne avec une détermination d'orbite au sol indépendante, tirée d'exécutions réelles du moteur v0.40.0 sur scenarios/lunar-infrastructure-od-consistency.toml et la variante avec erreur de modèle (400 essais chacune). La différence normalisée moyenne q est de 5.81 sans erreur de modèle et de 5.95 avec une erreur d'accélération injectée de 3e-10 m/s2, face à 6 attendu : les deux solutions d'orbite sont cohérentes (seuil C1 MET). La part des essais au-dessus du point à 95 % est de 0.040 et 0.052 ; le seuil pour détecter l'erreur injectée était d'au moins 0.5, il est donc NOT MET (C3) : la solution embarquée est connue à environ 352 m contre 23 m pour celle au sol, donc un déplacement de dix mètres se cache dans sa covariance. MODELLED : un modèle restreint à trois corps avec des simplifications énoncées et des entrées illustratives, pas une mesure d'une quelconque grandeur lunaire. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Résolution des ambiguïtés entières de phase de la porteuse entre des stations à la surface lunaire et un orbiteur, à partir du résultat versionné de l'exécution notée du moteur v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json : 3 longueurs d'arc, un Monte-Carlo de 401 tirages chacune, écrit par scenarios/carrier-phase-scored.toml). 1 jour : succès 1.0 % (erreur type 0.5 %), 134 ambiguïtés, sigma de position de l'orbiteur 45.6 m en flottant et 18.5 m en fixé ; 2 jours : succès 0.5 % (erreur type 0.4 %), 259 ambiguïtés, sigma de position de l'orbiteur 21.5 m en flottant et 8.7 m en fixé ; 3 jours : succès 2.8 % (erreur type 0.8 %), 375 ambiguïtés, sigma de position de l'orbiteur 6.3 m en flottant et 2.1 m en fixé. La résolution entière n'est pas obtenue : le succès reste entre 1 % et 3 % à 25 dBi, et aux 12 dBi enregistrés le problème ne peut pas être formé. MODELLED : un modèle restreint à trois corps avec des simplifications énoncées et des entrées illustratives, pas une mesure d'une quelconque grandeur lunaire. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Précision du datum lunaire à sept paramètres (trois translations, une échelle et trois rotations) à partir de la télémétrie des stations terrestres, avec et sans télémétrie entre l'orbiteur et les stations de surface, tirée d'une exécution réelle du moteur v0.40.0 sur scenarios/lunar-infrastructure-frame-coestimation.toml. Le sigma de Cramer-Rao des translations et des rotations diminue avec les liaisons de l'orbiteur (par exemple t_z de 0.98 m à 0.046 m) ; la plus petite valeur propre d'information est multipliée par 111 et la trace de la CRLB tombe à 1.0 % (seuil F3 MET). Cela suppose que l'orbite est connue dans les axes lunaires, son erreur étant portée par le sigma de distance de l'orbiteur de 1 m. MODELLED : un modèle restreint à trois corps avec des simplifications énoncées et des entrées illustratives, pas une mesure d'une quelconque grandeur lunaire. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Précision des décalages entre les positions par télémétrie laser, VLBI et GNSS d'un même engin spatial, face à l'erreur du rattachement local au sol, tirée d'une exécution réelle du moteur v0.40.0 sur scenarios/lunar-infrastructure-space-tie.toml (un arc de 6.56 jours, sigmas des techniques GNSS 10 m, VLBI 1 m, laser 0.1 m). Avec un rattachement local de 1 mm à 1 m, le sigma de la translation laser moins GNSS reste proche de 1.04 m jusqu'à ce que le rattachement atteigne 1 m : il est limité par le bruit de mesure des techniques, et non par le rattachement local. Le plancher fixé par le seul rattachement est la racine carrée de deux fois son sigma. MODELLED : un modèle restreint à trois corps avec des simplifications énoncées et des entrées illustratives, pas une mesure d'une quelconque grandeur lunaire. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Quelle famille d'observables est sensible aux nombres de Love lunaires h2, k2 et l2, tiré d'une exécution réelle du moteur v0.40.0 sur scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Chaque cellule est la dérivée partielle RMS des observations d'une famille par rapport à un paramètre, dans les unités propres à cette famille (les cellules se comparent donc le long d'une ligne, pas le long d'une colonne) ; un tiret signifie que la famille n'a aucune sensibilité. télémétrie laser : h2 7.6, k2 aucune, l2 9.8. poursuite de l'orbiteur : h2 aucune, k2 0.00086, l2 aucune. gravimètre de surface : h2 2.9e+03, k2 4.3e+03, l2 aucune. horloge de surface : h2 2.8e-17, k2 2.8e-17, l2 aucune. Avec les quatre familles, le sigma de Cramer-Rao est de 0.36 % de h2 nominal, 0.52 % de k2 et 1.16 % de l2. L'ajout d'une famille n'a jamais abaissé la plus petite valeur propre (28 ajouts sur 28), mais la trace de la pseudo-inverse n'a été non plus grande que dans 16 cas sur 28 : cette moitié du seuil G3 est NOT MET. La famille de l'orbiteur voit l'intégrale le long de la ligne de visée de l'accélération k2, une valeur haute. MODELLED : un modèle restreint à trois corps avec des simplifications énoncées et des entrées illustratives, pas une mesure d'une quelconque grandeur lunaire. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, ni un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.">
</picture>

**État dans le registre : MODELLED, et trois seuils sont NOT MET.** Les calculs numériques sont vérifiés face à des programmes
numpy et scipy indépendants ; rien n'est comparé à une mesure d'une grandeur lunaire, et rien n'est
VALIDATED. Atteints : les deux solutions d'orbite sont cohérentes (q moyen 5.81 face à 6 attendu), et les liaisons de l'orbiteur
multiplient la plus petite valeur propre du datum par environ 111, en supposant une orbite connue. **Non atteints** : l'erreur
de modèle injectée de 3e-10 m/s2 **n'est pas détectée** (C3 : la solution embarquée est connue à environ 350 m, donc
une dizaine de mètres se cache dans sa covariance) ; **la résolution entière n'est pas obtenue** (1 à 3 % de succès à
25 dBi, et aux 12 dBi enregistrés le problème ne peut pas être formé) ; et la moitié « trace » de G3 pour l'ajout d'une
famille d'observables (la trace a augmenté dans 12 ajouts sur 28, chaque fois parce que la famille augmentait le rang).
Chaque échec est figé par un test. [Infrastructure lunaire](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Ouvrez [kshana.dev/studio](https://kshana.dev/studio/) et le moteur entier s'exécute dans votre
navigateur, compilé en WebAssembly. Rien à installer, et rien n'est téléversé. Le Studio offre
deux vues du même moteur, et un commutateur dans l'en-tête passe de l'une à l'autre, en conservant le
scénario, la vue et tous les réglages que vous avez modifiés.

**La vue Simple** est celle sur laquelle le Studio s'ouvre. Elle part de questions (combien de satellites
puis-je voir, puis-je me fier à mon point de position, combien de temps une horloge peut-elle garder l'heure, que fait un brouilleur
à mon récepteur) et d'une carte de tout ce que le moteur sait faire, chaque domaine avec sa part de
méthodes validées. Ouvrez un scénario et la réponse vient en premier : une phrase simple, écrite pour
ce que mesure ce scénario, puis ses chiffres clés et un graphique. Au plus cinq réglages sont
affichés, ceux qui changent le plus la réponse ; les autres attendent sous **Réglages avancés**.
**Comment c'est calculé** explique la méthode, et **Pour les chercheurs** donne les chiffres propres du moteur,
le fichier de scénario, le code pour l'exécuter depuis Python et la citation.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, vue Simple, sur le scénario fourni integrity-raim, moteur v0.40.0 exécuté localement. La question : la géométrie respecte-t-elle les limites d'alerte (niveau de protection horizontal et vertical) ? La réponse d'abord, marquée Résultat en direct : Oui, la plupart du temps : pendant 95.3 % des 12 h. La borne d'erreur du récepteur est restée sous les limites d'alerte (40 m horizontal et 50 m vertical) lors de 344 vérifications sur 361, et aucun point n'a été trompeur. Chiffres clés : temps pendant lequel le point est fiable 95.3 %, plus longue interruption 10 min, borne d'erreur typique 6.5 / 13 m, points trompeurs 0. À côté, Essayer d'autres réglages avec cinq d'entre eux (l'erreur de distance, les deux limites d'alerte, la durée et le masque d'élévation) et Relancer, puis les sections repliées Réglages avancés (13 de plus), Comment c'est calculé (8 validés, 6 modélisés) et Pour les chercheurs. En dessous, les vues de ce résultat et les niveaux de protection tracés face à la limite d'alerte." width="100%">
</picture>

**La vue Avancée** est le tableau de bord complet : la bibliothèque de scénarios, cinq étapes numérotées
(Choisir, Régler, Exécuter, Lire les résultats, Partager ou exporter), les chiffres clés avec des pastilles PASS et FAIL
là où l'exécution énonce un seuil, et chaque panneau : vue d'ensemble, graphiques, cartes, relecture, le
rapport du moteur et les exports. Une seule zone de recherche atteint les scénarios, les domaines et les champs qu'ils
contiennent, et vous pouvez épingler jusqu'à quatre exécutions et les comparer côte à côte.

<details>
<summary>L'écran d'accueil de la vue Simple, et la vue Avancée après une exécution</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, vue Simple, écran d'accueil, intitulé Que voulez-vous découvrir ?, avec le moteur v0.40.0 en direct et, dans la barre supérieure, trois liens : Débriefing de formation, Carte des interférences et Confiance du récepteur. Quatre questions : combien de satellites puis-je voir n'importe où sur Terre, puis-je me fier à mon point de position, combien de temps une horloge peut-elle garder l'heure sans satellites, et que fait un brouilleur à mon récepteur. Sous la première, son résultat enregistré : au moins 22 satellites en vue en tout lieu et 31 en moyenne avec GPS, Galileo, BeiDou et GLONASS ensemble, un point possible dans 100 % des lieux et des instants, sur une carte du monde des satellites en vue, avec un bouton Ouvrir ce résultat. À côté, Tout ce que Kshana sait faire : 16 domaines et 139 scénarios prêts à exécuter, chaque tuile avec un petit graphique tiré d'une exécution enregistrée et sa part de méthodes validées, et les 173 capacités validées sur 350 du registre." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, vue Avancée, après une exécution du scénario fourni constellation-multi-gnss-coverage (Quatre constellations GNSS, une carte), moteur v0.40.0 exécuté localement. À gauche, la bibliothèque de scénarios, 139 scénarios dans 16 domaines. Les cinq étapes Choisir, Régler, Exécuter, Lire les résultats et Partager ou exporter, l'étape 4 étant en cours. Chiffres clés : 102 satellites, disponibilité 100 % (PASS), dilution de précision de position (PDOP) médiane 0.95 (PASS), PDOP au 95e centile 1.105 (PASS), 31.03 satellites en vue en moyenne et 22 au minimum. En dessous, la rangée de panneaux avec Couverture sélectionnée, la barre de relecture, une carte du monde du PDOP moyen de 0.831 à 1.0853 avec chaque satellite tracé, et les chiffres de couverture mondiale." width="100%">
</picture>

</details>

Le code source du Studio et ses notes de compilation se trouvent dans [`web/README.md`](web/README.md).

### Le site

Le reste de [kshana.dev](https://kshana.dev) est construit à partir des propres fichiers de ce dépôt et
d'exécutions du moteur : missions, capacités, le registre des preuves, la recherche publiée et les
éditions.
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Trois pages de kshana.dev côte à côte. L'en-tête de l'accueil : la ligne de nom Kshana · क्षण · l'instant précis au-dessus du titre Répétez la minute où le GNSS s'éteint, avec la console de mission d'une exécution réelle du moteur v0.40.0 (un globe et trois graphiques en direct : erreur de temps de l'horloge, densité porteuse sur bruit et niveau de protection). Preuves, Recherche publiée : les six articles arXiv bâtis sur le moteur ouvert, le plus récent avec une figure du moteur. Éditions, Kshana Pro, le même moteur, amplifié : Free exécute un scénario, Pro répond à la question du programme." width="100%">
</picture>

<a id="capabilities"></a>
## Capacités

Un seul moteur couvre toute la chaîne de défaillance, du premier satellite brouillé à la dernière
nanoseconde de holdover d'horloge. Le moteur compte 92 types de scénarios ; `kshana kinds` les
liste et [`docs/SCENARIOS.md`](docs/SCENARIOS.md) documente chaque champ.

| Capacité | À quoi elle répond |
|---|---|
| [Spectre](docs/SPECTRUM.md) | comment un brouilleur s'empare de la bande L GNSS, bande par bande, seconde par seconde |
| [Horloges et temps](docs/TELECOM-TIMING.md) | combien de temps chaque horloge maintient l'heure après la perte du GNSS |
| [Constellations autour de n'importe quel corps](docs/CONSTELLATION-DESIGN.md) | couverture, dilution de précision et disponibilité autour de la Terre, de la Lune ou de Mars |
| [Système solaire](docs/SOLAR-SYSTEM.md) | où se trouve chaque planète, et le temps de lumière de n'importe quelle liaison |
| [Navigation en orbite terrestre basse](docs/LEO-PNT.md) | un passage, une liaison, un message de navigation et un point fusionné, étape par étape |
| [Campagnes](docs/CAMPAIGNS.md) | une mission enchaînée, un balayage ou un ensemble Monte-Carlo dans un seul scénario |
| [Animation](docs/ANIMATION.md) | les séries temporelles d'une exécution sous forme de dessin animé, de lecteur ou d'images |
| [Rapports](docs/REPORTS.md) | chaque chiffre avec son unité et son étiquette, en HTML (HyperText Markup Language) et en JSON (JavaScript Object Notation) |
| [Exports d'interopérabilité](docs/INTEROP.md) | orbites et géométrie pour d'autres outils : SP3, CCSDS OMM et OEM, CZML, KML, GeoJSON, STK et SigMF |
| [Confiance maritime](docs/MARITIME-TRUST.md) | la passerelle peut-elle se fier à ce point : un score de 0 à 100 et ses raisons pour le NMEA d'un navire, en direct ou à partir d'un journal (à titre consultatif, pas un équipement de navigation homologué) |
| [Flux d'entraînement NMEA](docs/NMEA-TRAINING.md) | NMEA de passerelle synthétique avec brouillage et leurrage scénarisés et un journal d'instructeur, pour la formation des équipages (texte seulement ; jamais pour les systèmes de navigation en service d'un navire ; à titre consultatif, pas un équipement de navigation homologué) |
| [Carte des interférences](docs/INTERFERENCE-MAP.md) | où des aéronefs et des navires ont signalé des données de navigation dégradées, et quelle part d'une route cela touche |
| [Région de l'émetteur](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | où, sous des hypothèses énoncées, peut se trouver une source de rapports de position dégradés : des régions à une confiance énoncée, un centroïde avec son ellipse, jamais un point (MODELLED ; `kshana interference-map locate`) |
| [Paquets de preuves](docs/EVIDENCE-PACKS.md) | un enregistrement technique signé, vérifiable hors ligne, d'une fenêtre du journal d'un navire et de ce que le moteur en a calculé, pour un rapport d'incident (à titre consultatif, pas un équipement de navigation homologué) |
| [Télémétrie de confiance](docs/TRUST-TELEMETRY.md) | le flux de confiance sous forme de métriques Prometheus, d'événements SIEM et, en option, d'OpenTelemetry, avec un exemple de tableau de bord Grafana (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K et OpenCPN](docs/MARINE-INTEGRATIONS.md) | le score de confiance sur le serveur Signal K d'un bateau et dans OpenCPN, avec une configuration de référence pour un petit ordinateur à côté du récepteur (à titre consultatif, pas un équipement de navigation homologué) |
| [Export pour banc d'essai](docs/TEST-BENCH.md) | `kshana bench-export` : le mouvement du véhicule et les événements d'un scénario pour un simulateur GNSS de laboratoire (aucun signal n'est écrit), et comment noter ensuite le journal du récepteur |
| [Correspondance et rapport de conformité](docs/compliance/README.md) | `kshana compliance-report` : pour quelles lignes de cadres publics de résilience un ensemble d'exécutions étaye des preuves, et l'écart qui reste |
| [Notebooks](notebooks/README.md) | tutoriels exécutables : confiance d'un navire et flux d'entraînement, exposition d'une route sur la carte des interférences, correspondance de conformité et banc d'essai, GDOP quantique face au classique |
| [Vérificateur Galileo OSNMA](docs/OSNMA.md) | les données de navigation de quels satellites un récepteur peut authentifier cryptographiquement, et pourquoi une vérification échoue ; Kshana n'accorde aucun droit au titre des droits de propriété intellectuelle de l'ICD OSNMA de l'UE (voir le NOTICE dans la page) |

Les formats d'export en toutes lettres : SP3 est le Standard Product 3 ; CCSDS OMM et OEM sont les Orbit
Mean-elements et Orbit Ephemeris Messages du Comité consultatif pour les systèmes de données spatiales
(CCSDS) ; CZML et KML sont les langages de balisage Cesium et Keyhole ; STK est Systems Tool Kit ;
SigMF est le Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="La campagne enchaînée campaign-jam-spoof-holdover-integrity, une exécution réelle du moteur (graine 20260928) : 6 phases (Nominal → Brouillage → Leurrage → Holdover → Alarme d'intégrité → Rétablissement) et 18 exécutions membres sur une grille de 10 s sur T+01:16:10. Trois pistes : erreur de temps de l'horloge face à une garde de 50 ns (pic 62.7 ns), densité porteuse sur bruit effective face à un plancher de 25 dB-Hz (minimum -12.2 dB-Hz), et niveau de protection vertical face à une limite d'alerte de 50 m (pic 135.4 m), avec les événements d'alarme de l'exécution : T+00:20:00 alarmes du détecteur de leurrage RF (surveillances fusionnées de cohérence, de puissance et de qualité du signal) ; T+00:26:10 alarmes de la surveillance de leurrage assistée par l'horloge." width="100%">
</picture>

<details>
<summary>Chaque capacité, tirée d'une exécution réelle : la cascade de la bande L, la carte de couverture, le système solaire et un passage en orbite terrestre basse</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="La bande L GNSS sous forme d'une densité spectrale de puissance sur 60 s, tirée d'une exécution réelle du type spectrum (l-band-waterfall-jamming.toml, graine 7, moteur v0.40.0) : fréquence en abscisse, temps vers le bas, couleur pour la puissance au-dessus du plancher de bruit de -202.0 dBW/Hz. Brouilleurs : dispositif de confidentialité à chirp (chirp, actif à 10 s, inactif à 40 s) ; tonalité CW sur L1 (cw, active à 30 s) ; bruit à bande étroite sur L2 (narrowband, actif à 45 s). Pire bande GPS L1 C/A : C/N0 effectif minimum de 3.2 dB-Hz à 31 s face à un plancher de poursuite de 25 dB-Hz. GPS L1 C/A minimum 3.2 dB-Hz ; Galileo E1 minimum 4.7 dB-Hz ; GPS L2C minimum 36.9 dB-Hz ; GPS L5 minimum 44.1 dB-Hz ; Galileo E5a minimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Satellites en vue sur toute la Terre pendant une journée, tiré d'une exécution réelle de constellation-design (constellation-multi-gnss-coverage.toml, moteur exécuté par ce générateur) : 102 satellites (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Chaque cellule de 10 degrés est ombrée selon le nombre moyen de satellites au-dessus du masque de 10 degrés (27.2 à 36.5) ; les points sont les échantillons de trace au sol du moteur, un par heure et par satellite. Disponibilité mondiale de 100.00 % à PDOP inférieur ou égal à 6, PDOP médian 0.95, en moyenne 31.0 et au minimum 22 satellites en vue." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Le système solaire à l'époque du scénario 2026-09-28T00:00:00, tiré d'une exécution réelle du type solar-system (solar-system-tour.toml) : le Soleil, 9 planètes et la planète naine Pluton vus depuis le dessus de l'écliptique, distances comprimées logarithmiquement pour l'affichage, avec le temps de lumière aller de chaque corps depuis la Terre. Mercure 0.47 au, 10.1 minutes-lumière, VALIDATED ; Vénus 0.73 au, 3.0 minutes-lumière, VALIDATED ; Mars 1.55 au, 14.0 minutes-lumière, VALIDATED ; Jupiter 5.30 au, 49.5 minutes-lumière, VALIDATED ; Saturne 9.44 au, 70.2 minutes-lumière, VALIDATED ; Uranus 19.44 au, 157.4 minutes-lumière, MODELLED ; Neptune 29.88 au, 240.2 minutes-lumière, MODELLED ; Pluton 35.61 au, 292.2 minutes-lumière, MODELLED. Liaisons : Mars vers Jupiter aller 2193.5 s ; Saturne vers la Terre aller 4212.2 s ; Europe vers Jupiter aller 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Un passage en orbite terrestre basse (LEO), tiré d'une exécution réelle du type leo-pass (leo-pass-iridium.toml, moteur exécuté par ce générateur) : Iridium-pass à 781 km, bande STL à 1621 MHz, vu par un utilisateur aérien à 50° N 30° W. Au-dessus du masque de 5° pendant 750 s, élévation maximale de 65.0° à 444 s. La densité porteuse sur bruit culmine à 80.5 dB-Hz (médiane 71.3), 34.3 dB au-dessus de la médiane GNSS de 46.2 dB-Hz de 8 satellites GPS en vue (38.2 à 51.1 dB-Hz) ; le Doppler atteint 35.4 kHz." width="100%">
</picture>

Exécutez n'importe lequel avec `kshana example <scenario> > s.toml && kshana s.toml` : les scénarios
sont `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
et `leo-pass-iridium`.

</details>

<details>
<summary>Les capacités maritimes et d'interférence, tirées d'entrées synthétiques versionnées : un score de confiance, une carte des interférences avec exposition d'une route, un flux d'entraînement et un paquet de preuves</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Score de confiance sur une traversée synthétique, tiré d'une exécution réelle du moteur v0.40.0 sur examples/maritime-trust (un journal NMEA fictif d'un ferry sur une route Tallinn–Helsinki, 3001 époques à 1 Hz). Trois pistes partagent un même axe de temps. En haut : la distance entre la position que le récepteur indique et la position réelle du navire, qui reste de quelques mètres jusqu'à environ 1576 s, lorsque l'entraînement de position scénarisé du journal l'en éloigne, tandis que le récepteur continue d'indiquer un point valide. Au milieu : le score de confiance de 0 à 100, non calculé pendant les 300 premières secondes de calibration, dans la bande nominale (au moins 90) jusqu'à l'entraînement, puis chutant à travers la bande dégradée (au moins 55) jusqu'à la bande non fiable. En bas : la bande de chaque époque sous forme de ruban coloré avec son nom. Le score est indicatif. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC 61108, IEC 61162) : l'opérateur reste responsable de la navigation du navire. Le journal est inventé pour montrer le format et les surveillances ; ce n'est pas une mesure et il ne dit rien de la façon dont un récepteur se comporterait." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Deux journées synthétiques de carte des interférences tirées des échantillons versionnés dans examples/interference-map/output, chacune avec sa propre route synthétique et les parts d'exposition de la route que le moteur indique. À gauche, une journée ADS-B : 1 cellule dégradée, 6 non dégradées, 4 non évaluées (hachurées) et des cellules sans entrée, dessinées vides, qui n'ont pas été observées. La route fait 525 km : 11.5% de sa longueur dans des cellules dégradées, 38.3% non dégradées, 9.1% non évaluées et 41.1% non observées. À droite, une journée AIS : cellules signalées par les détecteurs de cercle et de position à terre, cellules non anormales et cellules vides ; la route fait 454 km avec 10.5% dans des cellules anormales, 21.2% non anormales, 0.0% non évaluées et 68.3% non observées. ADS-B et AIS sont des couches séparées, jamais combinées. Une cellule signalée n'est pas un constat d'interférence, et une cellule sans couleur n'a pas été observée, ce qui n'est pas la même chose que dégagée. Toutes les données sont fictives, en plein milieu de l'Atlantique, et ne sont pas une mesure." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Flux d'entraînement du scénario coastal-drag-off (moteur v0.40.0, graine 22, 25 minutes à un point toutes les 10 s du journal d'instructeur). Une carte montre la trace vraie du navire et la trace que le récepteur indique : elles concordent jusqu'au début d'un entraînement de position scénarisé à 421 s, la trace indiquée s'éloigne alors de la vraie tandis que le récepteur conserve un point valide, et elle revient lorsque l'événement se termine à 1140 s. À côté, la distance entre les deux traces au fil du temps, et la densité porteuse sur bruit moyenne indiquée par le récepteur, qui monte à un niveau élevé pendant la durée de l'événement. Données d'entraînement synthétiques générées par Kshana. Pour la formation et les essais seulement : n'injectez jamais ce flux dans les systèmes de navigation en service d'un navire. À titre consultatif, pas un équipement de navigation homologué. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC 61108, IEC 61162) : l'opérateur reste responsable de la navigation du navire. Les positions, dates et traces sont inventées." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="La structure d'un paquet de preuves. Un journal de récepteur (NMEA, u-blox UBX, RINEX 3 ou un journal Android) et une fenêtre de temps entrent dans kshana receiver-trust evidence, qui écrit sept fichiers : log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig et un timestamp.tsr facultatif. Le manifeste enregistre le SHA-256 du journal entier et de chaque fichier ainsi qu'une chaîne d'empreintes sur les fichiers ; la signature couvre le manifeste. kshana evidence verify vérifie la signature, l'empreinte de chaque fichier, la chaîne et l'absence de tout fichier non listé, et se termine avec 0 si la vérification réussit, 1 si quelque chose a échoué et 3 si le signataire n'était pas épinglé. Un paquet est un enregistrement technique, pas un avis juridique." width="100%">
</picture>

Les quatre sont des données inventées et à titre consultatif : elles montrent le format et le comportement du logiciel, pas la façon dont un récepteur ou un système se comporte face aux interférences. Exécutez la première avec `kshana receiver-trust examples/maritime-trust/session.toml`, la deuxième avec `kshana route-exposure` sur les échantillons de `examples/interference-map/`, la troisième avec `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (usage de formation seulement : ne l'injectez jamais dans un équipement de navigation en service), et la quatrième comme dans [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Le tableau complet des capacités, domaine par domaine</summary>

Le détail complet domaine par domaine suit ; pour un registre de maturité par capacité, voir
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) et [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Domaine | Capacité |
|--------|------------|
| **Orbite et géométrie** | Propagation SGP4/SDP4 (validée à 4.12 mm face aux 666 vecteurs AIAA 2006-6753) ; éléments à deux lignes réels (un instantané Celestrak `gps-ops` versionné et daté) ou constellations Walker-delta synthétiques dont les éléments moyens réalisent la formule `i:T/P/F` à moins de 1 km sur une propagation de 24 h ; visibilité multi-constellation, **dilution de précision — géométrique, de position, horizontale, verticale et temporelle (GDOP/PDOP/HDOP/VDOP/TDOP), validée à 1e-6 face à gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), et disponibilité GNSS ; un optimiseur de conception de constellation sans gradient, un dimensionnement du nombre minimal de satellites par la méthode des « streets of coverage », un outil de comparaison multi-constellation, et un **balayage de conception** Walker qui tabule couverture / PDOP / temps de revisite sur une grille plans × satellites et indique les conceptions Pareto-optimales. |
| **Propagateur numérique** | Un propagateur numérique de **Cowell** (`src/propagator.rs`) qui complète la voie analytique SGP4/SDP4, avec un modèle de forces hiérarchique à **sept perturbations** (`src/forces.rs`) : deux corps + le champ **zonal J2–J6** complet (les coefficients d'harmoniques zonales d'aplatissement terrestre J2 à J6 ; le gradient analytique exact de son potentiel perturbateur), un **géopotentiel en harmoniques sphériques tessérales EGM2008 jusqu'au degré/ordre 70** en option (Earth Gravitational Model 2008 ; `src/gravity_sh.rs` ; coefficients réels de la NGA — National Geospatial-Intelligence Agency des US (États-Unis) —, récurrence de Legendre normalisée de Holmes–Featherstone, contre-vérifiée face aux fonctions de Legendre sous forme fermée et à l'identité analytique ∇V), gravité de troisième corps du **Soleil et de la Lune pilotée par l'époque** (une éphéméride intégrée de faible précision, sans noyau DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel —), **pression de radiation solaire** (modèle boulet de canon avec ombre conique ombre+pénombre), **traînée atmosphérique** (densité exponentielle par morceaux de Vallado, atmosphère co-rotative), la **correction relativiste post-newtonienne de Schwarzschild**, et le terme d'**entraînement des référentiels de Lense–Thirring** (Conventions IERS — International Earth Rotation and Reference Systems Service — 2010 §10, linéaire en moment cinétique de la Terre, ~1–2 ordres de grandeur sous Schwarzschild) — pilotés par un choix de deux intégrateurs adaptatifs (RK4 — Runge–Kutta d'ordre quatre — à doublement de pas ou la paire emboîtée **Dormand–Prince RK5(4)**). **Validé face à Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 époques en LEO (orbite terrestre basse) + GTO (orbite de transfert géostationnaire), les niveaux de forces conservatives concordant au pire à **\|Δr\| 0.08 m sur 24 h** (`tests/numerical_cowell_propagator_reference.rs`) ; le niveau de traînée atmosphérique est caractérisé séparément (≈ 333 m / 24 h) et les entrées absolues d'éphéméride Soleil/Lune et de densité restent honnêtement **Modelled**. Preuves internes supplémentaires (pas une validation externe) : l'orbite non perturbée est vérifiée face à la solution exacte de Kepler en variable universelle à **moins d'un mètre sur 24 h**, l'énergie et le moment cinétique se conservent à ~1e-9, et chaque perturbation correspond à une signature sous forme fermée dérivée à la main. |
| **Manœuvres et conception de trajectoire** | Nœuds de ΔV impulsionnels avec propagation de covariance 6×6 (repères d'erreur d'exécution ECI — inertiel centré sur la Terre — / LVLH — vertical local, horizontal local —), intégration de poussée finie vérifiée face à l'équation de la fusée de **Tsiolkovski** sous forme fermée à < 0.01 %, un solveur de **Lambert** à une révolution **Izzo-2015**, un propagateur de **Kepler** exact en variable universelle, et un balayage **porkchop** (lancement × arrivée) C3 (énergie de lancement) / V∞ d'arrivée émis sous forme de grille de contours JSON — la couche de simulation de performances au-dessus de GMAT/Orekit, chaque sortie de Lambert étant vérifiée en aller-retour face à la vérité à deux corps et le minimum du porkchop vérifié face au plancher analytique de Hohmann. |
| **Systèmes de temps et référentiels** | Échelles **UTC / TAI / TT / UT1** avec secondes intercalaires IERS (temps universel coordonné, temps atomique international, temps terrestre, et le temps de rotation de la Terre Universal Time 1), une API (interface de programmation d'application) de date julienne, l'**angle de rotation de la Terre** (ERA) IAU-2000 (Union astronomique internationale), **TEME ↔ ECEF** (équateur vrai, équinoxe moyen ↔ centré sur la Terre, fixe par rapport à la Terre) fondé sur le GMST (temps sidéral moyen de Greenwich) avec les repères géodésiques WGS-84 (World Geodetic System 1984), la précession IAU 2006 (Fukushima–Williams), la **nutation IAU 2000A/2000B** complète, le **mouvement du pôle** IERS, et la réduction **GCRS↔ITRS IAU 2006/2000A fondée sur le CIO** sans équinoxe (CIO = Celestial Intermediate Origin) — le tout validé **bit à bit** face aux vecteurs SOFA/ERFA, et **contre-vérifié de manière indépendante face à ANISE** (la réimplémentation en Rust pur de NAIF/SPICE ; NAIF = la Navigation and Ancillary Information Facility de la NASA, l'agence spatiale des États-Unis) : le GCRS→ITRS de kshana et l'ITRF93 (International Terrestrial Reference Frame 1993) d'ANISE issu du `earth_latest_high_prec.bpc` du JPL, avec les mêmes paramètres d'orientation de la Terre IERS fournis aux deux, concordent à **≤ 0.86 m au sol / ≤ 3.6 m à l'orbite GNSS** (max 0.028″) sur huit époques 2020–2023. |
| **Inertiel** | INS à composants liés trois axes — attitude par quaternion, mécanisation WGS-84 NED (nord-est-bas), compensation de coning/sculling, et un modèle d'erreur d'IMU déterministe (facteur d'échelle, désalignement, sensibilité à g, quantification, dérive) ; un **accéléromètre à interféromètre à atomes froids issu des premiers principes** (phase de Mach–Zehnder, bruit de projection quantique, décroissance du contraste, couplage aux vibrations) qui *dérive* le coefficient de marche aléatoire en vitesse ; et un **filtre particulaire** à rééchantillonnage d'importance séquentiel pour la navigation sans GPS assistée par carte (référencée au terrain / à la gravité). |
| **Alt-PNT (sans GPS)** | Un **modèle de mesure de gravimètre** à atomes froids dont le plancher de bruit blanc (`σ = ASD/√τ`, ASD = densité spectrale d'amplitude) est dérivé de la physique de l'accéléromètre CAI ; un **champ d'anomalies de gravité en harmoniques sphériques** de faible degré entièrement normalisé (vérifié face aux fonctions de Legendre sous forme fermée et à une anomalie à un seul terme dérivée à la main) plus des mascons synthétiques ; le **noyau de synthèse des fonctionnelles de gravité** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — le « lecteur de carte » face auquel un navigateur assisté par gravité fait sa correspondance — est validé face au **standard de pesanteur normale GRS80** (Geodetic Reference System 1980), reproduisant la pesanteur normale de Somigliana sous forme fermée et les γ_e / γ_p publiés à **3.5e-12** et produisant une carte de perturbations physiquement bornée à partir du champ réel **EGM2008** de l'ICGEM (International Centre for Global Earth Models) (RMS — moyenne quadratique — ≈ 26 mGal, max ≈ 89 mGal à d/o 70 ; `tests/icgem_gravity_reference.rs`) ; et un **filtre particulaire de correspondance de carte de gravité** qui retrouve une trace sans GPS à partir de la séquence d'anomalies qu'elle traverse. Il s'étend à la **navigation référencée au terrain** (TERCOM/SITAN — terrain contour matching / Sandia Inertial Terrain-Aided Navigation — face à un MNT (modèle numérique de terrain) SRTM (Shuttle Radar Topography Mission) `.hgt`, `src/altpnt/terrain.rs`), à un **champ géomagnétique principal IGRF-14** (International Geomagnetic Reference Field de 14e génération) jusqu'au degré/ordre 13 (`src/igrf.rs`, vérifié face à la forme fermée du dipôle incliné et aux différences finies de ∇V), et à un navigateur **combiné gravité + magnétisme + terrain** qui fusionne les trois canaux scalaires dans un seul filtre particulaire (l'information est additive — aucun canal n'empire le point). Un **banc d'essai sans GPS de 60 minutes** (une coupure d'environ 700 km / une heure pendant laquelle la solution inertielle dérive jusqu'à ~70 km) est rattrapé à **~145 m (< 500 m)** par un apparieur hiérarchique du grossier au fin — la cible *Quantum Wayfarer* de l'ESA NAVISP (Navigation Innovation and Support Programme). |
| **Fusion** | EKF (filtre de Kalman étendu) à état d'erreur GNSS/INS faiblement couplé à 15 états avec rétroaction en boucle fermée (le paquet `gnss-ins`) ; une mise à jour sur pseudo-distances **étroitement couplée** qui continue de corriger avec moins de quatre satellites ; un filtre couplé **horloge + position** ; un estimateur de **Kalman unscented (à points sigma)** général pour les mesures fortement non linéaires ; un **navigateur UKF** GNSS/INS étroitement couplé (pseudo-distance + Doppler) dont la navigation orbitale à l'estime par modèle de forces est vérifiée en auto-cohérence à **0.77 m RMS** sur un passage LEO incurvé de 30 minutes comprenant une coupure GNSS de 120 secondes (un chiffre de cohérence du filtre, pas une validation par référence externe — ce navigateur reste MODELLED) ; et un **UKF GNSS/INS étroitement couplé à 17 états** complet (position, vitesse, erreur d'attitude, biais d'accéléromètre et de gyromètre, biais et dérive d'horloge) dont l'**estime par CAI quantique** traverse une coupure de 120 secondes sur la marche aléatoire en vitesse dérivée de l'accéléromètre à atomes froids. |
| **Détermination d'orbite** | Restitution d'un état orbital `[r, v]` à partir de mesures de distance de stations sol, composant le modèle de forces deux corps + J2 et l'intégrateur RK4 avec un correcteur **par lots de Gauss–Newton** (`determine_orbit_batch`, moins d'un mètre / mm·s⁻¹ à partir de distances sans bruit, ~2 m pour un plancher de bruit de 5 m) et une variante **séquentielle** à filtre unscented (`determine_orbit_sequential`). |
| **Observabilité et théorie de l'estimation** | Une couche générale et réutilisable **information de Fisher / Cramér–Rao** (`src/fim.rs`) : la matrice d'information M = HᵀWH, la **borne inférieure de Cramér–Rao**, le **rang d'observabilité et l'espace nul du défaut de datum** (pseudo-inverse de Moore–Penrose), et les scalaires de plan d'expérience **D/A/E/T-optimaux** à partir d'un solveur de valeurs propres de Jacobi symétrique. **Validé** — valeurs propres face à `numpy.linalg.eigh`, covariance CRLB face à σ²(XᵀX)⁻¹ via `numpy.linalg.inv`, et DOP GNSS à partir de la matrice d'information, le tout concordant à **1e-9** (`tests/fim_observability_reference.rs`), et en outre contre-vérifié face aux bornes sous forme fermée de **Kay (1993)** avec atteinte de la CRLB par Monte-Carlo. Il sous-tend le moteur de DOP, la CRLB de géolocalisation passive, et le **théorème d'observabilité** des stations lunaires absolues (ci-dessous). |
| **Lunaire et cislunaire** | Un propagateur Terre–Lune du **problème restreint circulaire à trois corps (CR3BP)** dans le repère tournant — constante de Jacobi conservée et les cinq points de Lagrange (`src/cr3bp.rs`) — désormais avec une **matrice de transition d'état (STM) 6×6 et un correcteur différentiel à tir simple** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`) qui produit des orbites **halo / NRHO** (orbite de halo quasi rectiligne) réellement périodiques : la STM est validée face aux différences finies, les orbites corrigées se referment à la précision machine, et l'initialisation avec l'état publié à l'apolune reproduit la **NRHO 9:2 sud de L2** (L2 = le deuxième point de Lagrange Terre–Lune ; l'orbite du Gateway) avec une période ≈ 6.57 j / périlune ≈ 3,250 km, cohérente avec les ≈ 6.56 j / ≈ 3,370 km publiés (une solution CR3BP — circulaire, sans Soleil —, **non** validée face à une véritable éphéméride LANS (Lunar Augmented Navigation Service)/Gateway ; la transformation sélénocentrique MCI/MCMF (inertiel centré sur la Lune / centré sur la Lune, fixe par rapport à la Lune) de l'orbite corrigée est une suite prévue) ; plus la géométrie PNT cislunaire **LunaNet / LNIS** (LunaNet Interoperability Specification) (réduction MCI↔MCMF, coordonnées sélénographiques) avec un passage **ARAIM au pôle sud lunaire** qui fait honnêtement apparaître l'écart d'intégrité : un σ_URE (erreur de distance utilisateur) de ~30 m porte le niveau de protection bien au-dessus d'une limite d'alerte de 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`) ; et une **augmentation de DOP par balises de surface** (`src/lunar_beacon.rs`) qui montre comment quelques balises de télémétrie de surface levées fournissent les lignes de visée à faible élévation et large azimut qui manquent à un ensemble uniquement orbital situé au zénith — effondrant le GDOP mal conditionné du pôle sud et, via un budget d'erreur en racine de la somme des carrés, la précision de position réalisée en mètres (réutilisant le noyau de DOP validé par gnss_lib_py et la forme fermée de visibilité à horizon sans atmosphère ; l'analyse de la dilution de précision est publiée dans [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Suite PNT lunaire** | Une suite de navigation lunaire/cislunaire bâtie sur le cœur CR3BP, chaque élément étant un `kind` exécutable : **temps coordonné lunaire** (`lunar-time-offset`, `src/lunar_time.rs` — le taux séculaire LTC/TCL − TT (LTC = Lunar Coordinate Time ; TCL = sa forme française, Temps-Coordonnée Lunaire) à partir de la différence d'auto-potentiel + terme cinétique, indiqué avec la bande publiée de 56–59 µs/jour) ; une observable de retard **VLBI lunaire** (interférométrie à très longue base) géodésique (`lunar-vlbi`, `src/lunar_vlbi.rs` — un retard + taux en champ proche par différence de deux distances sur une base terrestre, contre-vérifié face au Δ-DOR (delta differential one-way ranging) en onde plane du même code dans la limite du champ lointain, dérivées partielles vérifiées par différences finies) ; un estimateur par lots **conjoint DO multi-technique + horloge** (`lunar-joint-od-clock`, `src/lunar_combination.rs` — un ajustement de Gauss–Newton fusionnant VLBI + distances locales lunaires + distances inter-satellites) portant un résultat d'**observabilité par information de Fisher** : la télémétrie interne seule laisse un **défaut de datum** de corps rigide à six degrés de liberté, de sorte que la position *absolue* d'une station de surface est inobservable tant qu'un rattachement au repère terrestre n'est pas ajouté — un retard **VLBI** sur base terrestre *rétablit* l'observabilité pour une constellation clairsemée et *resserre* la borne de Cramér–Rao pour une constellation riche, le datum absolu se fermant à **trois** stations terrestres non colinéaires (le résultat d'observabilité est publié dans [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)) ; la **réalisation du référentiel** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — un ajustement de datum de Helmert à 7 paramètres + rattachement d'orientation IAU 2015 WGCCRE — WGCCRE = le groupe de travail de l'IAU sur les coordonnées cartographiques et les éléments de rotation) ; une analyse de **volume de service de classe Moonlight/LCNS** (LCNS = Lunar Communications and Navigation Services ; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / couverture / disponibilité + une enveloppe ARAIM lunaire généralisée HPL/VPL (niveau de protection horizontal/vertical), réutilisant le noyau de DOP validé par gnss_lib_py et la mécanique LunaNet σ_URE≈30 m) ; le **PNT différentiel lunaire** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — un analogue lunaire du GNSS différentiel / du système d'augmentation satellitaire (SBAS) : annulation exacte de l'horloge en mode commun + décorrélation spatiale du premier ordre selon la ligne de base, réutilisant le niveau de protection SBAS DO-229E — DO-229E étant la norme de performances opérationnelles minimales de la RTCA (anciennement Radio Technical Commission for Aeronautics) pour les récepteurs SBAS) ; et un **export d'interopérabilité aligné sur LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group ; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + aller-retour d'échelle de temps lunaire dans le repère corporel lunaire IAU 2015, enveloppé dans l'enveloppe KIF). Les niveaux de preuve de chaque élément figurent dans la [matrice de vérification](docs/VERIFICATION-MATRIX.md) : le temps coordonné lunaire, l'estimateur conjoint DO + horloge, la réalisation du référentiel et la géométrie du volume de service sont **VALIDATED** (chacun face à la référence indépendante que nomme sa ligne, de même que la voie noyau du retard VLBI) ; l'observable VLBI, le résultat d'observabilité du défaut de datum, le PNT différentiel et l'export d'interopérabilité sont **MODELLED**. Les paramètres sont des valeurs **illustratives de sources publiques** — **non** validées face à une véritable poursuite VLBI/Gateway, **sans** affiliation à ni approbation d'une quelconque agence, sans revendication de TRL (niveau de maturité technologique) / d'héritage. |
| **PNT spatial lointain et martien** | Un **moteur de navigation radiométrique** ouvert : temps de lumière itératif + retard relativiste de **Shapiro**, **Doppler et distance** bidirectionnels / unidirectionnels / tridirectionnels (Moyer à deux branches), rapports de retournement de transpondeur cohérent, télémétrie régénérative/PN (pseudo-bruit) (CCSDS 414, la norme de télémétrie par pseudo-bruit), et **Δ-DOR** dans le plan du ciel (CCSDS 506, la norme Delta-DOR), avec les milieux plasma solaire / troposphère / ionosphère ; analyse + émission de messages de données de poursuite **CCSDS-TDM (503)** ; un **filtre d'information à racine carrée à dynamique réduite** (accélérations empiriques RTN — radiale, transverse, normale — + une horloge embarquée à 3 états + traînée atmosphérique martienne) qui réalise la **détermination d'orbite Mars-LMO à ≈ 0.2 m** en boucle fermée synthétique ; un estimateur conjoint de **fusion unidirectionnelle + bidirectionnelle** ; un cœur de dynamique multi-corps (`Body{μ, re, zonals, gravity, IAU-pole}`, gravité martienne GMM-3 (Goddard Mars Model 3), un repère martien fixe IAU, une interface `EphemerisProvider` enfichable, dates juliennes en deux parties + TT↔TDB (temps dynamique barycentrique)) ; et le scénario de PNT par relais **`mars-pnt`** (une constellation de relais aréostationnaires MARCONI) avec un **simulateur de performances GSE** de bout en bout (GSE = équipement de soutien au sol) (géométrie → bilan de liaison → observables → SRIF → covariance). **Validé par simulation** (facteurs de mérite de covariance / boucle fermée) ; la dynamique martienne héliocentrique est contre-vérifiée face au **DE440** du JPL (137 m sur un arc d'un jour, `xval/anise-mars-od`). La validation sur de vraies données de poursuite DSN/ESTRACK figure dans la feuille de route. |
| **Système solaire et PNT autour de n'importe quel corps** | Une **éphéméride du système solaire entier** sans noyau (`src/ephem.rs`, `src/ephem_provider.rs`) : chaque planète à partir des **éléments képlériens de Standish** du JPL (Table 1, 1800–2050 ap. J.-C. ; Tables 2a/2b, 3000 av. J.-C.–3000 ap. J.-C.) avec l'erreur nominale publiée de chaque planète, la Terre et la Lune séparées par la série lunaire, et Phobos, Deimos, Io, Europe, Ganymède, Callisto et Titan à partir des éléments moyens du JPL et du modèle de rotation de l'IAU (Union astronomique internationale) ; **n'importe quel corps par rapport à n'importe quel autre** dans l'ICRF (International Celestial Reference Frame). `Body` porte désormais **GM (paramètre gravitationnel), rayons, J2 (le deuxième harmonique zonal) lorsqu'il est publié et le pôle et le méridien origine IAU pour dix-huit corps**. Le type **`solar-system`** indique positions, vitesses, constantes, **temps de lumière et distance aller / aller-retour** entre deux corps quelconques (le solveur radiométrique de temps de lumière existant, avec le retard de Shapiro solaire) et une trace d'orbite par corps — de quoi dessiner un système solaire interactif ; le type **`body-pnt`** positionne un orbiteur ou un atterrisseur **autour de n'importe quel corps** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) avec une constellation Walker locale, la mécanique de dilution de précision et de Gauss–Newton, et une distance spatiale lointaine depuis la Terre. **Validé** face à JPL Horizons (DE441, JPL Development Ephemeris 441) : Mercure–Saturne et la Terre à partir de la Table 1 à moins de deux fois l'erreur nominale (pire 1.87×), les huit planètes à partir des Tables 2a/2b (pire 1.71×), et le temps de lumière Terre–Mars/Jupiter. **Modelled** : Uranus et Neptune à partir de la Table 1 (2.0× et 5.2× l'erreur énoncée face à DE441), Pluton, les lunes, et les résultats de navigation de `body-pnt`. |
| **PNT fusionné MEO + LEO** | `src/leo_fusion/` : positionnement, navigation et temps LEO indépendants du système sur n'importe quelle constellation (coquilles Walker, jeux d'éléments, préréglages GNSS) et n'importe quel signal (porteuse, débit de chips, enveloppe de C/N0, erreur de distance du signal dans l'espace), avec des préréglages facultatifs en un fichier qui portent leurs sources (Xona Pulsar X1/X5, Iridium STL, signaux d'opportunité Starlink, CentiSpace, un système représentatif en bande C, le modèle d'éphéméride sans horloge ATOMIC). **`leo-pvt`** : **positionnement Doppler** par lots à partir de la vitesse radiale (mono- et multi-satellite, états de dérive d'horloge et de vitesse, géométrie le long de la trace / transverse d'un seul passage et la solution miroir), **moindres carrés pondérés conjoints GNSS + LEO** avec biais inter-systèmes par système et sigmas par signal fournis par l'appelant, la DOP en fonction du nombre de satellites LEO, couverture **polaire et arctique**, et **transfert de temps LEO vers l'UTC** en fonction du C/N0 et de l'oscillateur. **`leo-ppp`** : un EKF (filtre de Kalman étendu) PPP (positionnement ponctuel précis) flottant avec GNSS seul et avec LEO, son temps de convergence et un test de cohérence NEES du chi carré. **`ntn-positioning`** : positionnement par réseau non terrestre 5G à partir de la borne de Cramér-Rao de la largeur de bande. **Validé** : l'enveloppe Doppler LEO face aux chiffres publiés d'Iridium et de Xona. **Modelled** : le reste, la tendance PPP étant comparée à Li et al. (2019) — voir [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Intégrité** | RAIM — surveillance autonome de l'intégrité par le récepteur — instantané et par séparation de solutions (de style ARAIM) avec niveaux de protection horizontal/vertical (HPL/VPL), détection et exclusion de défauts, et diagrammes d'intégrité de Stanford ; un niveau de protection explicite à budget de risque d'intégrité par **séparation de solutions à hypothèses multiples (MHSS)**, y compris le **mode de défaillance à l'échelle d'une constellation en bi-/multi-constellation** (ARAIM UE (Union européenne) / DO-316, la norme de performances RTCA pour les équipements GPS embarqués avec augmentation à bord de l'aéronef), exercé sur un instantané réel GPS + Galileo (`scenarios/araim-gps-galileo.toml`). Le niveau de protection applique la projection unilatérale de **biais nominal** `b_k = Σ_i|s_i|·b_nom` par mode de défaillance et le sigma d'**intégrité** σ_URA (précision de distance utilisateur ; distinct du σ_URE de précision, erreur de distance utilisateur) issu de l'Integrity Support Message — voir [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Le noyau de détection (les seuils χ²/χ² non central/normaux et les multiplicateurs K) est **validé de manière externe face à SciPy** sur 171 cas (`tests/raim_reference.rs`) ; la géométrie réutilise le noyau de DOP validé par gnss_lib_py. L'*allocation du budget* de risque d'intégrité ARAIM MHSS elle-même n'a pas de référence numérique publiée et reste honnêtement Modelled. |
| **Augmentation (SBAS)** | **Niveaux de protection SBAS / WAAS** (WAAS = le Wide Area Augmentation System) sous la forme de moindres carrés pondérés DO-229E (facteurs K d'approche de précision et en route) et la combinaison **sans ionosphère bifréquence L1/L5** (L1 et L5 étant deux bandes de signaux civils GPS ; IS-GPS-705, la spécification d'interface GPS pour le signal L5, γ₁₅ ≈ 1.793) qui sous-tend DO-316 — `src/sbas.rs`. L'algorithme de niveau de protection est **validé de manière externe face au fork RTKLIB SBAS-PL** (RTKLIB = la bibliothèque ouverte de positionnement cinématique temps réel ; PL = niveau de protection) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — la révision précédente de DO-229 — App. J) exécuté sur des **données EGNOS réelles** (European Geostationary Navigation Overlay Service), reproduisant son HPL à < 2e-3 m (`tests/sbas_reference.rs`) ; gLAB (la suite d'outils GNSS Laboratory) v6.0.0 a confirmé la convention identique. |
| **Horloge et temps** | Holdover de Kalman à deux états (covariance sous forme de Joseph, santé de cohérence NIS/NEES — innovation normalisée au carré / erreur d'estimation normalisée au carré) ; stabilité de la famille d'Allan (ADEV / MDEV / TDEV / HDEV / MTIE — écart d'Allan, d'Allan modifié, de temps et de Hadamard, et erreur maximale d'intervalle de temps) avec intervalles de confiance propres au type de bruit et un **ajustement complet en loi de puissance à cinq coefficients IEEE-1139** (IEEE Std 1139, les définitions de métrologie fréquence-temps de l'Institute of Electrical and Electronics Engineers) — les estimateurs sont validés sur du matériel réel face à **Stable32** : un **véritable étalon primaire à césium 5071A face à un maser à hydrogène** (556,990 échantillons de phase, 16 facteurs de moyennage, OADEV/OHDEV — écart d'Allan/de Hadamard avec recouvrement — à 1e-3 ; `tests/cs5071a_reference.rs`) et la série de régression **canonique Stable32 PHASE.DAT** (139 facteurs de moyennage, OADEV/MDEV/TDEV à 1e-3 ; `tests/phasedat_reference.rs`) ; les estimateurs ADEV/MDEV/TDEV et la métrique de wander télécom **MTIE** sont en outre contre-vérifiés face à la **bibliothèque indépendante allantools 2024.06** à **< 1e-9** sur la série NIST SP 1065 (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) ; corrections géométriques (Sagnac, vue commune GNSS) ; et les méthodes de transfert opérationnelles — **TWSTFT** (transfert de temps et de fréquence bidirectionnel par satellite) avec la forme fermée de Sagnac du BIPM (Bureau international des poids et mesures), **vue commune GNSS**, transfert de temps **PPP** (positionnement ponctuel précis) sans ionosphère, une liaison **optique** en espace libre avec scintillation due à la turbulence, et une **échelle de temps d'ensemble d'horloges (papier)** à variance inverse inférieure à la meilleure horloge contributrice. Un **calculateur de holdover d'horloge sans GNSS** (`src/holdover.rs`) expose la croissance sous forme fermée de van Loan de l'erreur en roue libre comme une inversion *holdover jusqu'au seuil* — combien de temps une horloge fonctionne en roue libre avant que son erreur de temps ne dépasse le budget — pour des classes représentatives d'horloges classiques et quantiques ; **modelled** (contre-vérifié face à la récursion de covariance multi-pas `clock_state`), et honnête sur le fait que, pour une horloge très stable, le holdover jusqu'à un seuil serré est fixé par le plancher de bruit à long tau *supposé*, et non par l'ADEV citée. Un **niveau de protection temporelle conditionnel** (`src/tpl.rs`) étend le holdover au leurrage : une borne sur l'erreur de temps *non détectée*, étant donné une contre-vérification indépendante, qui compose un plancher de surveillance à k sigma, la variance en roue libre de van Loan sur la latence de détection, et un temps jusqu'à l'alarme CUSUM (somme cumulée). Calibré sur un leurrage réel enregistré (JammerTest 2024) et reproductible via `cargo run --example tpl_jammertest` ; composition **MODELLED** (sans budget de risque d'intégrité par heure), conditionnelle à la détection — il n'existe aucune borne *inconditionnelle* finie. |
| **Domaine des mesures GNSS** | Synthèse directe de pseudo-distances / Doppler avec ionosphère **Klobuchar** (diffusée) et **IONEX / grille TEC** (IONosphere map EXchange format / contenu électronique total ; mesurée) — y compris un analyseur de fichiers IONEX, l'interpolation temporelle entre cartes et le passage oblique en couche mince —, troposphère **Saastamoinen + Niell**, et RAIM instantané (HPL/VPL). |
| **Résilience** | **Brouillage** par bilan de liaison (J/S → C/N₀ effectif → perte de verrouillage — rapport brouilleur sur signal, rapport porteuse sur densité de bruit — avec le facteur de séparation spectrale anti-brouillage `Q` désormais **dérivé des spectres de puissance réels du signal et du brouilleur** via `src/navsignal.rs` — `Q = 1/(R_c·κ)`, contre-vérifié en CI face à la constante représentative précédente) ; un **détecteur de leurrage temporel** stochastique (test d'énergie de Neyman–Pearson / χ²₁ avec P_fa/P_md sous forme fermée et par Monte-Carlo et un facteur de mérite (FoM) de sécurité de 1 − P_md) ; et un **détecteur de leurrage multicouche** fusionnant un test de parité de cohérence RAIM (avec l'angle mort en mode commun modélisé honnêtement), une surveillance RF de puissance AGC (contrôle automatique de gain), et une surveillance de qualité du signal (SQM — surveillance de la qualité du signal, avance moins retard) ; et un **budget d'erreur d'estime inertielle quantique** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`) composant la marche aléatoire en vitesse en bruit blanc de l'interféromètre à atomes froids avec le biais résiduel (contre-vérifié face à l'intégrateur indépendant `AccelModel`) et l'erreur de facteur d'échelle en un chiffre de dérive de position sur le holdover — le jumeau inertiel du holdover d'horloge. Un **moteur de notation de la résilience aligné sur un cadre** (`src/resilience/`) associe le comportement simulé d'une architecture à des sous-scores par dimension sur les sept catégories de résilience propres à Kshana (pas des termes du DHS), alignées sur le Resilient PNT Conformance Framework du Department of Homeland Security des États-Unis, puis étudie la **stabilité de décision** de tout score composite unique ou niveau de maturité sous un simplexe de pondération de Dirichlet et un ensemble de cinq menaces — instabilité de rang de Kendall-τ, taux de changement du premier classé, et **effondrement de la diversité** en mode commun (Hill-N2), avec un rapport d'assurance protégé par empreinte d'intégrité (35 tests de référence dérivés à la main). Reproductible via `cargo run --example resilience_report` ; architectures synthétiques **MODELLED**, une auto-évaluation alignée sur RPCF v2.0, **pas** une certification. Voir [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Géolocalisation RF passive** | **Géolocalisation d'émetteurs TDOA/FDOA** (différence de temps / de fréquence d'arrivée ; `src/geolocation.rs`) — localiser un brouilleur ou un leurreur (ou une source d'opportunité pour le PNT inverse) à partir d'hyperboloïdes de **différence de temps d'arrivée** sur un réseau de récepteurs, résolus par moindres carrés de Gauss–Newton ; l'ajout de la **différence de fréquence d'arrivée** avec des récepteurs mobiles restitue conjointement la position *et* la vitesse de l'émetteur, avec la borne de **Cramér–Rao** sur la covariance de position dérivée de la géométrie du réseau. **MODELLED** (références de cohérence interne : allers-retours direct→inverse, l'identité J·CRLB = I, la monotonie du GDOP, et l'estimateur atteignant sa propre CRLB par Monte-Carlo) — un modèle de source ponctuelle en visibilité directe, sans termes de trajets multiples / NLOS (hors visibilité directe), de biais d'horloge du récepteur ou de réfraction. |
| **Signal de navigation et poursuite de code** | Le **niveau du signal** entre le bilan de liaison et le domaine des mesures (`src/navsignal.rs`) : **densités spectrales de puissance** (DSP) d'aire unitaire pour **BPSK-R(n)** (modulation par déplacement de phase binaire à chips rectangulaires) et **sine-BOC(m,n)** (porteuse à décalage binaire) ; le **coefficient de séparation spectrale** (SSC) κ = ∫ G_s·G_i df, qui **dérive le `Q` anti-brouillage** utilisé par le modèle de brouillage (`Q = 1/(R_c·κ)`) à partir des spectres réels du signal et du brouilleur au lieu d'une constante représentative ; la **largeur de bande RMS (de Gabor)** (BOC > BPSK — la mesure d'information de distance / de Cramér–Rao) ; la **gigue due au bruit thermique de la poursuite de code DLL cohérente avance–retard** (DLL = boucle à verrouillage de retard ; Kaplan & Hegarty ; ~moins d'un mètre pour C/A — le code GPS coarse/acquisition — à 45 dB-Hz) ; et l'**enveloppe d'erreur de trajets multiples** (EML cohérent, avance moins retard — suppression par corrélateur étroit). Validé face à des ancrages sous forme fermée (auto-SSC BPSK = 2/(3·R_c), DSP d'aire unitaire, gigue C/A inférieure au mètre). Il s'agit d'une analyse des **performances** du signal, **pas** d'une conception de matériel d'antenne / de charge utile RF (le rôle d'un partenaire charge utile). |
| **Interopérabilité** | Ingestion d'éphémérides diffusées multi-GNSS **RINEX-3** (GPS, Galileo, QZSS — le Quasi-Zenith Satellite System du Japon —, BeiDou MEO/IGSO — orbite terrestre moyenne / orbite géosynchrone inclinée — via IS-GPS-200, la spécification d'interface GPS ; GLONASS, le Global Navigation Satellite System de la Russie, via PZ-90 — le datum russe Parametry Zemli 1990 — vecteur d'état RK4) utilisable comme source de constellation (RINEX en entrée, géométrie PNT en sortie) ; un analyseur d'observations **RINEX-3** (pseudo-distance, phase de la porteuse, Doppler, puissance du signal ; la disposition d'observation 4.00 devrait être analysée mais n'est pas testée, et les fichiers de navigation RINEX 4 sont refusés nommément plutôt que mal décodés) qui **alimente désormais un solveur de positionnement ponctuel simple (SPP)** (`pvt`) — de vraies observations de code en entrée, une vraie **position du récepteur** en sortie, validé sur des données IGS ; un lecteur/écrivain d'éphémérides précises **SP3-c/d** avec interpolation de Lagrange d'ordre 9 ; et un export **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) pour les outils de dynamique du vol (GMAT, Orekit, STK — Systems Tool Kit) ; et l'analyse + émission de messages de données de poursuite **CCSDS-TDM (503)** pour la poursuite radiométrique spatiale lointaine. |
| **Analyse de mission (ingénierie des systèmes)** | Budgets de conception de mission du premier ordre, chacun étant un type exécutable : **géométrie de lancement et d'ascension** à deux corps (`launch-window` — azimut de lancement `sin Az = cos i/cos lat`, inclinaison minimale, bonus de rotation terrestre, Δv de changement de plan en dogleg, opportunités quotidiennes ; `src/launch.rs`) ; un **corridor de rentrée balistique d'Allen–Eggers** (`reentry` — décélération maximale, vitesse/altitude au pic de g, vitesse au pic d'échauffement ; `src/reentry.rs`) ; **géométrie de couverture d'observation de la Terre** (`eo-coverage` — fauchée / GSD (distance d'échantillonnage au sol) au nadir / accès hors nadir / revisite via le triangle spatial du SMAD (*Space Mission Analysis and Design*) ; `src/eo_payload.rs`) ; un **budget d'erreur d'attitude et de pointage 3-DOF** (trois degrés de liberté ; `attitude-budget` — couple de gradient de gravité au pire cas + budget de pointage RSS (racine de la somme des carrés) ; `src/attitude_budget.rs`) ; **prédiction de passages au-dessus des stations sol** (`passes` — AOS/TCA/LOS, acquisition du signal / instant d'approche la plus proche / perte du signal, élévation maximale, temps d'accès ; `src/passes.rs`) ; et un **bilan de liaison unidirectionnel** selon l'équation de liaison CCSDS 401 / DSN 810-005 (la norme radiofréquence et de modulation du CCSDS / le manuel de conception de liaisons du Deep Space Network ; `link-budget` — FSPL (affaiblissement en espace libre), C/N₀, Eb/N₀ (rapport énergie par bit sur densité de bruit), marge, bouclage ; `src/linkbudget.rs`). Budgets analytiques du premier ordre **MODELLED** — la couche pré-matériel en dessous de STK/GMAT/Basilisk, pas un remplacement 6-DoF ou radiométrique. |
| **Analyse de décision et arbitrage (MCDA)** | Une suite complète d'**analyse de décision multicritère** (MCDA) (`src/mcda/`) couvrant les quatre familles de méthodes — agrégation de valeurs (**WSM**, **WPM**, **WASPAS** — modèle de somme pondérée, modèle de produit pondéré, évaluation par somme et produit agrégés pondérés), distance à l'idéal (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), programmation de compromis (**VIKOR**, du serbe pour optimisation multicritère et solution de compromis), et surclassement (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations ; **ELECTRE I**, du français ÉLimination Et Choix Traduisant la REalité), plus le système de ratios **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) et la méthode proportionnelle **COPRAS** (Complex Proportional Assessment) — avec pondération des priorités par comparaison par paires **AHP** (Analytic Hierarchy Process) (ratio de cohérence), un front non dominé de **Pareto**, une analyse de **sensibilité** des poids, et une notation par **utilité** multi-attribut. Les neuf agrégateurs reproduisent les bibliothèques tierces indépendantes **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) et **pyDecision** (ELECTRE I, COPRAS) à **< 1e-9**, et le vecteur de priorités AHP + le ratio de cohérence concordent avec la table d'indices aléatoires de Saaty et le solveur de valeur propre principale SciPy/LAPACK à < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — la couche de décision sous le moteur d'études d'arbitrage. |
| **Environnement spatial** | Un **modèle d'environnement de météorologie spatiale** (`space-weather`, `src/space_weather.rs`) : indices d'activité solaire (F10.7 / F10.7a centré sur 81 jours — le flux radio solaire à 10.7 cm) et géomagnétique (Kp, l'indice K planétaire, avec la table de définition Kp↔ap — ap étant son amplitude planétaire linéaire), la température exosphérique de **Jacchia-1971** qu'ils pilotent (validée face aux minimum/moyenne/maximum solaires publiés), et la densité neutre thermosphérique corrigée de l'activité face à la densité statique en altitude — la dépendance de la densité au cycle solaire que l'atmosphère statique USSA76 (US Standard Atmosphere 1976) omet. **MODELLED** : un couplage d'échelle de hauteur du premier ordre calibré, **pas** une atmosphère validée par les données (NRLMSISE — le modèle Mass Spectrometer and Incoherent Scatter Radar Exosphere du US Naval Research Laboratory). |
| **Évaluation et arbitrage IA/ML** | Un **banc d'évaluation de la détection des dégradations RF** (`impairment-eval`, `src/impairment_eval.rs`) : un corpus **synthétique** étiqueté et fondé sur des paramètres (nominal / brouillage / leurrage temporel / leurrage de position / trajets multiples), un harnais **ROC/AUC** (caractéristique de fonctionnement du récepteur / aire sous la courbe) indépendant du détecteur notant n'importe quel détecteur (energy \| agc \| sqm \| parity \| fused) avec Pd (probabilité de détection) par classe à une Pfa (probabilité de fausse alarme) cible, et l'**écart d'optimisme** dans la distribution face à hors distribution (mode de décalage de distribution). Plus un **arbitrage PNT quantique face au classique** (`quantum-trade`, `src/quantum_trade.rs`) quantifiant le bénéfice de holdover temporel/inertiel d'une horloge candidate à partir d'une courbe d'**ADEV mesurée** face à une référence de base classique, avec la réserve sur le plancher à long τ portée par l'artefact et une enveloppe de résilience sans GNSS en fonction du temps. Les **métriques** d'évaluation (AUC / confusion / Pd-Pmd, Pmd étant la probabilité de détection manquée) sont **validées à l'identique face à scikit-learn 1.9.0** — y compris sur de la **véritable télémétrie ESA OPS-SAT** (le jeu de données de détection d'anomalies OPSSAT-AD, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), où l'AUC ROC de Mann–Whitney de Kshana reproduit le `roc_auc_score` de scikit-learn à < 1e-9 sur la partition de test réservée et un détecteur transparent par comptage de pics sépare les anomalies étiquetées avec une AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`) — et les **noyaux** numériques du moteur d'arbitrage (ajustement ADEV NNLS — moindres carrés non négatifs —, bandes de cohérence χ², Q d'horloge de van Loan) **face à scipy 1.17.1** ; les chiffres de bénéfice des dispositifs bâtis par-dessus restent des caractéristiques de fonctionnement **MODELLED** — jamais des données de terrain / IQ (échantillons en phase / quadrature), aucun verdict bon/mauvais. Sur la base de ce banc, une **étude plus approfondie de l'écart d'optimisme** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) note un panel de **13 détecteurs** (energy/AGC/SQM/parity plus des détecteurs à régression logistique et à MLP — perceptron multicouche — à une couche cachée, issus d'une graine), ajuste des **lois d'échelle** dans la distribution et hors distribution avec une hypothèse nulle par permutation, et apprend un **prédicteur leave-one-out** de la dégradation hors distribution à partir de statistiques dans la distribution (`cargo run --example optimism_study`). Un **frontal de récepteur logiciel** (`src/sdr.rs` — IQ/FI (fréquence intermédiaire) brut → prises de corrélateur avance/ponctuel/retard → SQM) et des **adaptateurs d'ingestion de données réelles** (`src/realdata/` — RINEX, u-blox UBX (le protocole binaire u-blox), GnssLogger, JammerTest, Yunnan, SatGrid) permettent aux mêmes détecteurs de s'exécuter sur des enregistrements fournis localement (aucun jeu de données n'est versionné). La **carte de croisement de résilience quantique face au classique** sous incertitude des paramètres (`src/crossover.rs` ; `cargo run --bin crossover_study`) régénère les études de croisement inertiel et d'horloge derrière les figures des Résultats. |
| **Démonstrateur de PNT quantique** | Trois domaines d'application exécutables et **MODELLED** derrière le moteur ouvert, chacun émettant un `TradeEvidence` honnête + un enregistrement de représentativité / d'écarts jusqu'au vol (`src/representativeness.rs`) : **transfert de temps quantique de confiance** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — un budget de bout en bout horloge à réseau optique + liaison photonique face à CSAC (horloge atomique à l'échelle d'une puce) + RF bidirectionnel, avec un niveau de protection temporelle réutilisé, un FoM de sécurité face aux attaques par retard/rejeu (1 − P_md), et une détection d'anomalies d'horloge + latence CUSUM) ; **navigation quantique sans GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — une navigation inertielle en roue libre par interféromètre à atomes froids face à une INS de classe navigation pendant une coupure GNSS, honnête sur le fait que sans point externe le biais de l'accéléromètre est inobservable et que l'erreur croît donc toujours) ; et **détection de défauts/anomalies** de systèmes quantiques (`quantum-anomaly-detect`, `src/quantum_faults.rs` — un catalogue de défauts étiqueté avec une AUC ROC à IC (intervalle de confiance) par bootstrap tirée du `eval_stats` validé de manière externe et un défaut minimal détectable à un taux de fausses alarmes fixé). Une **bibliothèque partagée de modèles d'erreur de dispositifs quantiques** (`src/quantum_devices.rs`) et un **harnais unifié d'arbitrage quantique face au classique** (`src/qtrade.rs`) les sous-tendent. Les noyaux validés sur lesquels ils reposent (métriques d'évaluation face à scikit-learn, noyaux d'arbitrage face à scipy) sont réutilisés ; les chiffres de bénéfice des dispositifs bâtis par-dessus restent **MODELLED** — paramètres de dispositifs/liaisons **illustratifs de sources publiques**, modélisent la *classe*, sans TRL / héritage de vol / certification, sans approbation d'agence. |
| **Ingénierie frugale et impact sur l'intégrité** | Une grille de lecture **ROI (retour sur investissement) coût par couverture** (`src/frugal.rs`) — coût par unité de couverture fournie pour un arbitrage d'architecture — et une correspondance **détection manquée → impact sur l'intégrité** (`src/integrity_impact.rs`) qui transforme le taux de détections manquées d'une surveillance en sa contribution au risque d'intégrité. Budgets d'aide à la décision **MODELLED**, additifs. |
| **Échange d'artefacts** | Le **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — une enveloppe versionnée et autodescriptive qui encapsule un résultat de scénario avec son type, sa version de schéma et ses étiquettes MODELLED/VALIDATED, de sorte qu'un artefact stocké reste autodocumenté et que les anciennes enveloppes restent lisibles de façon compatible vers l'avant. |

Chaque capacité est accessible comme API Rust, comme `kind` de scénario exécutable, ou les deux.
La maturité par capacité — *validated*, *runnable* ou *library* — est suivie dans
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). Une **matrice de vérification vérifiée par machine**
(`src/verification.rs`) produit la table de correspondance exigence → module → test → référence → état,
avec des invariants d'honnêteté testés unitairement qui n'autorisent une étiquette *validated*
que lorsqu'une référence **externe** indépendante l'étaye — et qui enregistrent les
capacités matérielles/PA (assurance produit) que Kshana ne fournit délibérément **pas**.

</details>

<details>
<summary>Les quatre paquets de capteurs, tels que publiés initialement (résultats)</summary>

### Résultats

Chaque scénario compare un capteur quantique à son homologue classique au cours d'une
coupure GNSS d'environ 1.8 h. Les chiffres sont reproductibles (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Ce qu'apportent les capteurs quantiques quand le GNSS disparaît, scénario de holdover d'horloge : le quantique tient 6600 s d'autonomie contre 2610 s pour le classique, une erreur de temps bien plus faible, et une disponibilité de 100% contre 95.6%" width="88%">
  <br><sub>Ce qu'apportent les capteurs quantiques quand le GNSS disparaît — <code>clock-holdover</code> · graine 42 · tracé avec le moteur 0.40.0, et chaque chiffre ci-dessus revérifié face au moteur actuel à chaque compilation par <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

L'avantage **dépend de la coupure et des vibrations**, avec un seuil de rentabilité explicite là où le classique l'emporte — montré honnêtement sur l'échelle de maturité technologique (les chiffres d'horloge optique sont des cibles de démonstrateurs au sol ; aucune horloge optique au strontium n'a volé) :

<p align="center">
  <img src="paper/crossover/clock.png" alt="Croisement du holdover d'horloge quantique face au classique sur l'échelle de maturité technologique, avec bandes de confiance" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Carte thermique de l'avantage inertiel quantique face au classique selon la durée de coupure et les vibrations, avec un contour de rentabilité là où le classique l'emporte" width="96%">
  <br><sub>Croisement de résilience quantique face au classique — échelle TRL du holdover d'horloge (en haut) · carte de l'avantage inertiel avec contour de rentabilité (en bas). Régénérable via <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Navigation inertielle à l'estime : erreur de position pendant une coupure GNSS — le capteur quantique (atomes froids) reste près de la ligne de spécification tandis que le capteur de classe navigation diverge jusqu'à des dizaines de kilomètres" width="80%">
  <br><em>Erreur de position à l'estime pendant une coupure GNSS : le capteur quantique (bleu)
  reste plat près de la spécification ; le capteur classique (rouge) diverge jusqu'à des dizaines de kilomètres.
  Généré par Kshana à partir de <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Paquet | Scénario | Quantique | Classique |
|------|----------|---------|-----------|
| **1 — Holdover d'horloge** | `clock-holdover.toml` (spécification 20 ns) | l'horloge optique tient toute la coupure | la CSAC dépasse la spécification au milieu de la coupure |
| **2 — Navigation inertielle à l'estime** | `imu-deadreckoning.toml` (spécification 100 m) | atomes froids : **~41 m**, tient toute la coupure | classe navigation : dépassement en **~350 s** → dizaines de km |
| **3 — Transfert de temps** (liaison optique inter-satellites) | `timetransfer.toml` | optique : télémétrie à **~0.3 mm** | RF (TWSTFT) : télémétrie à **~150 mm** |
| **4 — Fusion hybride** (synthèse) | `hybrid-pnt.toml` | position + temps complets pendant toute la coupure | **limité en position à ~350 s** |

La synthèse illustre la thèse de la fusion : le transfert de temps optique inter-satellites maintient
verrouillée même une *horloge* classique, isolant le capteur *inertiel* comme maillon faible
de la suite classique — c'est-à-dire inertiel quantique + temps optique ensemble.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Holdover d'horloge : erreur de phase pendant une coupure GNSS — l'horloge optique reste dans la spécification de 20 ns pendant toute la coupure tandis que l'horloge à l'échelle d'une puce la dépasse au milieu de la coupure" width="80%">
  <br><em>Holdover d'horloge pendant une coupure GNSS : l'horloge optique (bleu) reste dans la
  spécification de 20 ns pendant toute la roue libre ; l'horloge à l'échelle d'une puce (rouge) la dépasse en cours de route.
  Généré par Kshana à partir de <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Un scénario supplémentaire, `orbit-gnss-challenged.toml`, dérive la disponibilité GNSS de la
**géométrie orbitale** plutôt que de fenêtres écrites à la main : un engin spatial à l'intérieur de la coquille
GNSS est propagé face à une constellation Walker de type GPS, et le nombre de satellites visibles
(visibilité directe, occultation par la Terre, masque d'élévation) fixe l'état du point à chaque
pas. Sur une journée, l'utilisateur dispose d'un point seulement ~59% du temps ; l'horloge quantique tient une
solution de temps à 5 ns à travers chaque interruption (disponibilité **1.0**), l'horloge à l'échelle d'une puce
seulement **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Orbite à GNSS contraint : erreur de temps de l'horloge sur une journée pour un engin spatial à l'intérieur de la coquille GNSS, où les interruptions de couverture sont dérivées de la géométrie orbitale — l'horloge optique reste dans la spécification de 5 ns à travers les interruptions tandis que l'horloge à l'échelle d'une puce la dépasse" width="80%">
  <br><em>Erreur de temps sur une journée avec une disponibilité GNSS dérivée de la géométrie orbitale : le
  nombre de satellites visibles (visibilité directe, occultation par la Terre, masque d'élévation) fixe l'état
  du point à chaque pas, de sorte que l'horloge doit passer chaque interruption en roue libre — l'horloge optique tient la spécification
  de 5 ns tandis que l'horloge à l'échelle d'une puce la dépasse. Généré par Kshana à partir de
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

La constellation peut aussi être fournie sous forme de jeux d'éléments à deux lignes (TLE) réels. Un TLE *complet*
(ligne 1 + ligne 2) est propagé avec le modèle **SGP4/SDP4** complet — y compris
la traînée atmosphérique et les termes luni-solaires de l'espace lointain et de résonance 12 h / 24 h qui
comptent pour les orbites GNSS d'environ 12 h — validé face aux vecteurs officiels AIAA 2006-6753
à ≈ 4 mm au pire. `scenarios/orbit-sgp4-gps.toml` livre un **véritable instantané Celestrak
`gps-ops`** de la constellation GPS opérationnelle (2021-07-28, 30 satellites)
et exige des sommes de contrôle TLE valides — les jeux d'éléments à deux lignes sont des données ouvertes du catalogue de la US
Space Force / 18th Space Defense Squadron, redistribuées par Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)) ; actualisez avec
`scripts/fetch_tles.sh`. Un bloc ne contenant que la ligne 2 conserve
la propagation analytique à deux corps (`scenarios/orbit-real-tle.toml`) ; les deux formes peuvent
être mélangées dans une même constellation. Une constellation peut tout aussi bien être construite à partir d'un bloc
d'enregistrements d'**éphémérides diffusées GPS RINEX-3** — le format qu'un récepteur décode —
propagés par l'algorithme utilisateur IS-GPS-200 et passés dans la même géométrie
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Ce que c'est / ce que ce n'est pas, en entier</summary>

<a id="what-it-is--is-not"></a>
### Ce que c'est / ce que ce n'est pas

**C'est :** un moteur déterministe, léger en dépendances, couvrant la pile PNT — géométrie
orbitale, navigation inertielle, fusion GNSS/INS, intégrité, horloges et temps. Il
exécute un scénario (souvent une coupure GNSS), fait évoluer des modèles d'erreur de capteurs calibrés
à travers l'estimateur approprié, et note le résultat face aux facteurs de mérite
opérationnels — en émettant un résultat JSON (JavaScript Object Notation) reproductible et un graphique SVG, depuis une
bibliothèque Rust, une interface en ligne de commande (CLI), une extension Python, un module WebAssembly dans le navigateur, un
**serveur Model Context Protocol (MCP)** pour agents d'IA, ou un **plugin pour IDE JetBrains (environnement
de développement intégré)**.

**Ce n'est pas :** du matériel de vol, une conception de charge utile quantique, un récepteur de signaux GNSS
complet, un simulateur de signaux radiofréquence (RF) ou un banc matériel dans la boucle, ni un
produit avionique certifié — et il ne remplace pas MATLAB/Simulink, STK (Systems Tool
Kit) ou Orekit ; il se place à côté d'eux et échange des fichiers avec eux. La fidélité du matériel quantique provient
de modèles d'erreur publiés, pas de cet outil. La maturité détaillée de chaque
capacité est documentée dans [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Ce n'est pas (encore) :** un moteur physique d'interférométrie atomique *complet* (la plupart des capteurs quantiques
consomment des coefficients d'Allan / de budget de bruit publiés ; l'accéléromètre CAI (interféromètre à atomes froids) a une
couche issue des premiers principes — phase de Mach–Zehnder, bruit de projection, décroissance du contraste, et
couplage aux vibrations, plus les erreurs systématiques de Coriolis et de déplacement lumineux — mais les erreurs systématiques de front d'onde et
la résolution de l'ambiguïté de frange restent une couche **P2** (phase 2 de la feuille de route, la couche de physique quantique)
de la feuille de route, voir [`ROADMAP.md`](ROADMAP.md) et [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md)) ;
un récepteur GNSS certifié ou matériel (il résout un point de position **PVT** (position, vitesse et temps) ponctuel simple
à partir de véritables observations de code RINEX (Receiver Independent Exchange Format) — validé
sur de véritables données IGS (International GNSS Service) — et sa couche IQ (`kshana iq`, depuis la 0.31.0)
acquiert et poursuit en logiciel des échantillons en bande de base enregistrés ou générés, en tant que récepteur
d'analyse : il ne pilote pas de matériel radio et n'émet pas, n'est pas un récepteur certifié, et ne fait
aucun positionnement par phase de la porteuse (RTK ou PPP)) ; ni une suite complète de conception de mission (il possède des briques Lambert / porkchop /
manœuvre / détermination d'orbite, mais c'est la couche de simulation de performances
*au-dessus* de GMAT (General Mission Analysis Tool)/Orekit, pas un remplacement). Assumer ce périmètre est délibéré. Si vous avez besoin de budgets d'erreur
d'interféromètre à atomes froids issus des premiers principes (par ex. de niveau CARIOQA-PMP — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — ou une validation de type X-37B), voir
la feuille de route P2 et [prenez contact](#support--professional-services) pour collaborer.

</details>

### Navigation en orbite terrestre basse

Les satellites en orbite terrestre basse (LEO) passent vite et fort. Le type `leo-pnt-chain` suit un
système à travers chaque étape : le signal, le passage et sa liaison, le message de navigation, et
le point fusionné de position, vitesse et temps (PVT) et le positionnement ponctuel précis (PPP). Chaque
étape transmet ses chiffres à la suivante. Voir [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="La chaîne PNT LEO tirée d'une exécution réelle de leo-pnt-chain (leo-pnt-end-to-end.toml) : l'étape signal (generic-l à 1191.795 MHz, pilote poursuivi à 10.23 Mchip/s) transmet à l'étape passage (1080 km, pic de C/N0 poursuivi 58.2 dB-Hz), qui transmet au message de navigation (kepler-rac, ajustement de 300 s, SISRE de représentation 0.91 mm RMS, 0.250 m avec détermination d'orbite), qui alimente le point fusionné (GNSS seul 1.60 m RMS 3D, GNSS plus LEO 0.43 m) et le positionnement ponctuel précis (convergence 11.5 min GNSS seul, 7.5 min avec 240 satellites LEO). 11 valeurs sont transmises entre les étapes." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Chaque type de scénario par famille

Les types de scénarios du moteur, classés par familles. Chaque famille a une page avec une entrée par type (la
description et les champs du moteur, un exemple de commande, les chiffres principaux d'une exécution, les lignes de la
[matrice de vérification](docs/VERIFICATION-MATRIX.md) qui le nomment, et le graphique que le moteur écrit lui-même) et une
planche contact de ces graphiques ; [`docs/KINDS.md`](docs/KINDS.md) les indexe tous. Le tableau est écrit par
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) et les pages par
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), et les deux échouent si le moteur gagne un type qu'aucune famille ne nomme.

<!-- generated:kind-families -->
| Famille | À quoi elle répond | Types | En exécuter un |
|---|---|---|---|
| **[Horloges, temps et holdover](docs/kinds/clocks-timing-and-holdover.md)** | combien de temps une horloge garde l'heure sans GNSS, et comment un système de temps tient face à ses gabarits | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Capteurs inertiels, fusion et capteurs quantiques](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | navigation à l'estime et fusion de capteurs pendant une coupure GNSS, avec des capteurs classiques et quantiques | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[PNT alternatif sans GPS](docs/kinds/gps-denied-alternative-pnt.md)** | naviguer grâce à la gravité, au terrain et à d'autres champs quand le GNSS a disparu | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Constellations, couverture et géométrie](docs/kinds/constellations-coverage-and-geometry.md)** | où sont les satellites, qui les voit et quelle est la qualité de la géométrie, autour de la Terre, de la Lune ou de Mars | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[Mesures GNSS, positionnement et intégrité](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudo-distances, points de position, niveaux de protection et environnement spatial | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Brouillage, leurrage et spectre](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | comment l'interférence atteint un récepteur et si elle est détectée | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navigation en orbite terrestre basse](docs/kinds/low-earth-orbit-navigation.md)** | un passage, une liaison, un message de navigation et un point fusionné, étape par étape | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Lunaire et cislunaire](docs/kinds/lunar-and-cislunar.md)** | navigation, temps, référentiels et géodésie à la Lune | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navigation des utilisateurs spatiaux](docs/kinds/space-user-navigation.md)** | signaux GNSS pour les engins spatiaux au-dessus, autour et au-delà des orbites GNSS | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[PNT optique](docs/kinds/optical-pnt.md)** | liaisons optiques à travers l'atmosphère et facteurs de mérite optique plus RF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Analyse de mission, liaisons et opérations spatiales](docs/kinds/mission-analysis-links-and-space-operations.md)** | lancement, ascension, rentrée, attitude, liaisons, planification des contacts et formats de fichiers | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Fils de mission](docs/kinds/mission-threads.md)** | le budget d'erreur de navigation et de temps d'une chaîne de phases du lancement à la rentrée | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Campagnes](docs/kinds/campaigns.md)** | missions enchaînées, balayages et ensembles construits à partir des autres types | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Chaque commande

`kshana <scenario.toml>` exécute un scénario ; toutes les autres commandes sont des sous-commandes, et `kshana --help` imprime l'utilisation
de toutes. Les commandes sont `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (avec `live` et
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` et `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) donne l'objet de chacune, un exemple vérifié et sa page de documentation.

<a id="every-surface"></a>
### Chaque interface

Un seul moteur, les mêmes résultats partout : la ligne de commande, la bibliothèque Rust, Python, JavaScript et WebAssembly,
le serveur MCP avec ses commandes de plugin et ses skills, Kshana Studio (chaque page s'exécute dans le navigateur, sans installation, rien n'est téléversé), les
intégrations ROS 2, Signal K, OpenCPN, GNSS-SDR et `gnss_lib_py`, les kits de déploiement systemd, Docker et Grafana, et le
plugin JetBrains. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) les liste avec la façon d'obtenir chacune et les noms de toutes
les commandes de plugin, skills et pages du Studio ; [`docs/SURFACES.md`](docs/SURFACES.md) indique, pour chaque commande et chaque type,
quelle interface le prend en charge et lesquelles ne le font pas, avec la raison.

<a id="how-a-run-works"></a>
## Déroulement d'une exécution

Un scénario est un fichier TOML (Tom's Obvious, Minimal Language) : un type, une graine et les
paramètres. Le moteur l'exécute et écrit le résultat, un graphique et un rapport à côté, ainsi que
les exports que vous demandez.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Le déroulement d'une exécution. Un fichier de scénario TOML (un type, une graine et ses paramètres) entre dans le moteur, kshana 0.40.0, via le répartiteur api::run_toml sur 92 types de scénarios, déterministe à partir du scénario, de la graine et de la version du moteur. Le moteur écrit result.json, chart.svg, report.html et report.json, un table.csv pour les types qui en définissent un, et sur demande des exports SP3, CCSDS OMM et OEM, CZML, KML, GeoJSON, STK et SigMF ; une suite écrit study.json et study.html. Ces fichiers alimentent Kshana Studio dans le navigateur, un assistant d'IA via le serveur kshana-mcp, et l'intégration continue." width="100%">
</picture>

Ce scénario fourni dure 2 h : 10 min de GNSS, puis environ 1.8 h avec le GNSS indisponible. Il demande
combien de temps une horloge optique à réseau de strontium et une horloge atomique à l'échelle d'une puce (CSAC) maintiennent chacune
l'heure à 20 ns près.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

L'horloge optique tient le budget de 20 ns pendant toute la coupure de 6600 s ; la CSAC le tient pendant
2610 s, et se trouve dans le budget pendant 95.6% de l'exécution contre 100% pour l'horloge optique.
`kshana example` liste chaque scénario fourni.

<a id="missions"></a>
## Missions

Dix secteurs posent dix questions différentes au même moteur. Chacun dispose de scénarios fournis pour
commencer.

| Secteur | Commencer par |
|---|---|
| Défense et sécurité | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Espace, orbite terrestre | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Lune, Mars et espace lointain | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Aviation et drones | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Maritime | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Route | `automotive-urban-canyon` |
| Rail | `rail-tunnel-coast` |
| Infrastructures critiques et temps | `clock-holdover`, `clock-ensemble` |
| Télécoms et 5G (la cinquième génération de réseaux mobiles) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Science et recherche | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>La question que pose chaque secteur</summary>

<br>

| Secteur | La question qu'il pose | Commencer par |
|---|---|---|
| **Défense et sécurité** | Combien de temps notre navigation et notre temps restent-ils fiables sous brouillage et leurrage, et quelles couches nous maintiennent dans la spécification ? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Espace : orbite terrestre** | Mon engin spatial voit-il assez de satellites de navigation, combien de temps son horloge garde-t-elle l'heure entre deux points, et qu'apporterait une couche de navigation en orbite basse ? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Lunaire et espace lointain** | Un atterrisseur, un rover ou un orbiteur à la Lune, sur Mars ou plus loin obtiendra-t-il une position et un temps fiables ? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Aviation et drones** | Après qu'un brouilleur a supprimé le GNSS, combien de temps mon système d'aéronef sans équipage (UAS) reste-t-il dans son budget de position, et l'intégrité est-elle disponible sur ma route ? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Maritime** | Jusqu'où sur l'eau porte un brouilleur, une poussée de position serait-elle détectée, et combien de temps un navire peut-il naviguer à l'estime jusqu'au port ? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Route et automobile** | Jusqu'où une voiture dérive-t-elle sous un pont ou en passant devant un brouilleur en bord de route ? | `automotive-urban-canyon` |
| **Rail** | Combien de secondes après l'entrée dans un tunnel un train peut-il encore dire sur quelle voie il se trouve ? | `rail-tunnel-coast` |
| **Infrastructures critiques et temps** | Si le temps GNSS est perdu ou leurré, combien de temps un réseau électrique, une plateforme de négociation ou un centre de données gardent-ils un temps traçable ? | `clock-holdover`, `clock-ensemble` |
| **Télécoms et 5G** | Si la référence de temps GNSS est perdue, l'horloge de mon réseau reste-t-elle dans les gabarits ITU-T, et pendant combien de temps ? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Science et recherche** | Puis-je reproduire, étendre et citer un résultat PNT, jusqu'à la graine ? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Preuves

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 vérifié face aux 666 vecteurs de référence AIAA 2006-6753, pire erreur de position 4.12 mm"></a></p>

<strong>176 sur 401</strong> capacités validées face à des références externes indépendantes ; 221 honnêtement étiquetées Modelled.
Chaque ligne de la matrice de vérification nomme une capacité, la référence face à laquelle elle est vérifiée,
le test qui exécute la vérification, et l'étiquette qui en découle. L'intégration continue (CI) rend
impossible de qualifier une capacité de VALIDATED sans référence externe indépendante.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Comment une capacité obtient son étiquette. Chaque ligne de la matrice de vérification nomme une capacité, la référence face à laquelle elle est vérifiée, le test qui exécute la vérification en intégration continue, et l'étiquette qui en découle. Une ligne ne peut être VALIDATED qu'avec une référence externe indépendante ; sinon elle est MODELLED, ou PARTNER lorsqu'un partenaire matériel en est responsable. Exemple : SGP4/SDP4, Cowell 6-DOF + perturbations, DO par lots/séquentielle, référence vecteurs de vérification SGP4 AIAA 2006-6753, test tests/sgp4_verification.rs, étiquette VALIDATED. Décomptes en direct : 176 VALIDATED, 221 MODELLED, 4 PARTNER sur 401 lignes. Au total, 176 capacités validées face à des références externes indépendantes ; 221 autres sont honnêtement étiquetées MODELLED et 4 relèvent de PARTNER." width="100%">
</picture>

| Étiquette | Lignes | Signification |
|---|---|---|
| VALIDATED | 176 | une référence externe indépendante concorde : données réelles, une implémentation indépendante ou des vecteurs de référence publiés |
| MODELLED | 221 | vérifié face à une vérité analytique ou à l'auto-cohérence de la simulation, et dit ouvertement |
| PARTNER | 4 | relève d'un partenaire matériel ; Kshana ne détient aucune référence pour cela |

Quelques-unes des vérifications : les 666 vecteurs SGP4 (Simplified General Perturbations 4) AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 à 4.12 mm ; le modèle de forces de Cowell
à 0.08 m face à Orekit 12.2 ; Galileo à 0.61 m et Swarm-A à 0.10 m face à de véritables
éphémérides précises de l'Agence spatiale européenne (ESA). Les tests maintiennent une couverture de lignes proche de 95 % de
`src/`, bloquante à 85 % en CI. Le registre est
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), généré à partir de
`src/verification.rs` : la [matrice complète de 401 lignes](docs/VERIFICATION-MATRIX.md), et la raison pour laquelle chaque
ligne Modelled n'a pas de référence externe dans [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Comment fonctionne la validation, le tableau de points forts sélectionnés et les figures de preuve</summary>

### Validation, reproductibilité et honnêteté

- Chaque terme de bruit est calibré sur un chiffre **publié et cité** et validé
  face à la relation standard (écart d'Allan pour les horloges ; croissance de l'erreur à l'estime de Groves
  pour l'inertiel ; la conversion temps→distance pour le transfert de temps). L'état
  de chaque terme est suivi dans [`docs/VALIDATION.md`](docs/VALIDATION.md) comme `validated` ou
  `not modeled` — rien n'est présenté comme validé qui ne le soit pas.
- **Reproductible par construction :** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` l'impose ; les exécutions quantiques et classiques utilisent
  des graines indépendantes afin que leur bruit soit non corrélé.
- La maturité est énoncée honnêtement : les chiffres d'horloge optique et de liaison optique sont des résultats *cibles /
  de démonstrateurs au sol*, non issus du vol.

### L'étiquette de preuve sur chaque figure

Chaque figure et chaque tableau qu'une exécution écrit dit jusqu'à quel point s'y fier, et sur quelles lignes du registre cela repose. Le JSON de résultat a une
clé `evidence`, le SVG du graphique une ligne sous le tracé (et un élément `<metadata id="kshana-evidence">`), et le tableau CSV
des lignes de commentaire `# evidence:` en tête (à lire avec `comment='#'`). Elle nomme un niveau, `VALIDATED`, `MODELLED` ou `PARTNER`, et
les identifiants (`VM-` et huit chiffres hexadécimaux) des lignes de la matrice de vérification que l'exécution a sollicitées. Le niveau est le plus faible de ces
lignes, de sorte qu'une exécution qui s'appuie sur une ligne modélisée est étiquetée MODELLED quel que soit le nombre de lignes validées à côté ; l'étiquette
ne peut jamais revendiquer plus que le registre. Les lignes, états et identifiants sont lus dans la matrice, pas saisis à la main
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), et
`tests/evidence_labels_doc_sync.rs` échoue si une figure n'a pas d'étiquette ou si une étiquette est en désaccord avec la matrice.

### La validation en un coup d'œil

Chaque ligne est imposée par un test nommé en CI. Ce tableau est une **sélection de points forts** ;
la matrice complète vérifiée par machine compte **401 lignes — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), avec les preuves complètes (et ce qui n'est honnêtement *pas* encore
validé) dans [`docs/VALIDATION.md`](docs/VALIDATION.md) et l'artefact
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
de chaque version (généré par `cargo run --bin validation_report`, attesté SLSA — Supply-chain
Levels for Software Artifacts).

La colonne **État** indique la *nature* de la preuve, conformément à l'échelle de validation ci-dessus : **VALIDATED** = vérifié face à une référence externe indépendante (données réelles, une bibliothèque indépendante ou des vecteurs de référence publiés) ; **MODELLED** = vérifié face à une vérité analytique ou à l'auto-cohérence de la simulation (aucun jeu de données externe indépendant). VALIDATED décrit la *méthode* de vérification, pas une réussite/un échec — un échec honnête face à une véritable référence externe reste VALIDATED, tandis qu'une comparaison qu'aucune ligne de la matrice ne nomme comme référence (l'ajustement LRO — Lunar Reconnaissance Orbiter — ci-dessus) est présentée comme MODELLED. Les lignes `CI` sont des garde-fous de processus, pas des facteurs de mérite. Quelques îlots de données réelles (l'horloge à césium mesurée, Stable32 PHASE.DAT, et les vérifications OPS-SAT/ICGEM dont les entrées brutes ne portent aucune licence de redistribution) sont **conditionnés aux données** : le test imprime un avis d'omission et reste vert lorsque l'entrée est absente, et les chiffres de référence publics sont versionnés sous `tests/fixtures/`. Reproduisez les entrées brutes avec le `scripts/fetch_*.sh` correspondant.

| État | Capacité | Concordance | Référence |
|--------|------------|-----------|--------------------|
| **VALIDATED** | Propagation SGP4/SDP4 | 666/666 vecteurs, pire **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + comparaison directe avec la crate indépendante `sgp4` |
| **VALIDATED** | Référentiels — nutation IAU 2000A/B, chaîne CIO IAU 2006/2000A, ERA | **bit à bit** (X,Y à 1e-14, s à 1e-18, ERA à 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS face à un moteur SPICE indépendant | max **0.028″** → ≤ 0.86 m au sol, ≤ 3.6 m à l'orbite GNSS | ANISE (NAIF/SPICE en Rust pur), mêmes EOP IERS `finals2000A`, 8 époques 2020–2023 (comparé à cette référence ; aucune ligne de la matrice de vérification ne la nomme comme référence externe, donc ce n'est pas étiqueté VALIDATED) |
| **MODELLED** | Géopotentiel EGM2008 (degré/ordre 70) | accélération = ∇V à **< 1e-6** ; réduction zonale vers le J2 validé | coefficients NGA EGM2008 + identité analytique ∇V |
| **VALIDATED** | Synthèse des fonctionnelles de gravité (carte de navigation assistée par gravité / sans GNSS) | Somigliana GRS80 + γ_e/γ_p à **3.5e-12** ; carte de perturbations EGM2008 réelle physique (RMS ≈ 26 mGal, d/o 70) | Pesanteur normale de Somigliana GRS80 (Moritz 1980, IAG — Association internationale de géodésie) + ICGEM EGM2008 réel (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Estimateurs d'Allan (ADEV/MDEV/TDEV/HDEV) + bandes de confiance | reproduisent les écarts de référence ; les bandes χ² concordent | NIST SP 1065 (Riley), Table 31/32 à 1000 points |
| **VALIDATED** | Estimateurs d'Allan sur une **véritable horloge à césium mesurée** | OADEV/OHDEV à **1e-3** (observé ≤ 3e-5), 16 facteurs de moyennage | Stable32 sur un véritable Cs 5071A face à un maser H, 556,990 points (`tests/cs5071a_reference.rs`, conditionné aux données) |
| **VALIDATED** | Estimateurs d'Allan sur le **Stable32 PHASE.DAT canonique** | OADEV/MDEV/TDEV à **1e-3** (observé ≤ 5e-5), 139 facteurs de moyennage | écarts de référence Stable32 pour PHASE.DAT (`tests/phasedat_reference.rs`, conditionné aux données) |
| **MODELLED** | Modèle d'erreur d'IMU — ARW / VRW / instabilité de biais | restitués à **< 5 %** (instabilité de biais < 15 %) | fiche technique Analog Devices ADIS16465 ; profil de référence NaveGo |
| **VALIDATED** | Propagateur numérique de Cowell + modèle de forces (niveaux conservatifs) | pire erreur de position **0.08 m** sur 24 h, 278 époques (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Niveau de traînée de Cowell + entrées absolues d'éphéméride Soleil/Lune et de densité | niveau de traînée caractérisé ≈ 333 m / 24 h ; le cas non perturbé concorde avec Kepler en variable universelle à moins d'un mètre, énergie/moment ~1e-9 | éphéméride intégrée de faible précision + Kepler analytique |
| **MODELLED** | Lambert · Tsiolkovski · porkchop | aller-retour vers la vérité à deux corps ; ΔV **< 0.01 %** | Izzo 2015 · équation de la fusée · plancher analytique de Hohmann |
| **MODELLED** | Détermination d'orbite (lots de Gauss–Newton) | moins d'un mètre / mm·s⁻¹ sans bruit ; ~2 m pour un plancher de bruit de 5 m | deux corps + J2 sur un arc RK4 |
| **MODELLED** | Ajustement du modèle de forces face à l'éphéméride précise de Galileo (arc complet) | **0.61 m** RMS 3D, 24 h, d/o 70, forces seules | orbite finale ESA/ESOC `ESA0MGNFIN` (E11), EOP `finals2000A` réels (comparé à cette référence ; aucune ligne de la matrice de vérification ne la nomme comme référence externe, donc ce n'est pas étiqueté VALIDATED) |
| **MODELLED** | Ajustement du modèle de forces face à l'éphéméride précise de Swarm-A (dynamique réduite) | **0.10 m** RMS 3D (borne du niveau empirique, pas une mesure) | orbite précise ESA `SW_OPER_SP3ACOM_2_` (comparé à cette référence ; aucune ligne de la matrice de vérification ne la nomme comme référence externe, donc ce n'est pas étiqueté VALIDATED) |
| **MODELLED** | Ajustement du modèle de forces face à LRO lunaire (échec honnête) | **6.67 m** en dynamique réduite, *au-dessus* de la cible de 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (comparé à cette référence ; aucune ligne de la matrice de vérification ne la nomme comme référence externe, donc ce n'est pas étiqueté VALIDATED) |
| **MODELLED** | DO martienne en espace lointain (SRIF à dynamique réduite) | **≈ 0.2 m** Mars-LMO (FoM de simulation, *pas* une mission réelle) | DO synthétique en boucle fermée — validation de la mécanique de l'estimateur |
| **MODELLED** | Dynamique martienne héliocentrique face à JPL DE440 | **137 m sur un arc d'un jour** (croît avec l'arc = n corps non modélisés) | JPL DE440 via ANISE (`xval/anise-mars-od`, conditionné au noyau) (comparé à cette référence ; aucune ligne de la matrice de vérification ne la nomme comme référence externe, donc ce n'est pas étiqueté VALIDATED) |
| **VALIDATED** | Positionnement ponctuel simple face à une coordonnée IGS levée (observations réelles) | **5.7 m** RMS 3D / **1.1 m** horizontal, SPP code bifréquence sans ionosphère | levé de la station IGS ABMF + éphéméride diffusée GPS, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | UKF GNSS/INS étroitement couplé | **0.77 m RMS** sur un passage LEO de 30 min incluant une coupure de 120 s | roue libre par modèle de forces, dérivé à la main |
| **MODELLED** | Navigation sans GPS par carte de gravité | dérive INS ~70 km → **~145 m** rattrapés | cible *Quantum Wayfarer* de l'ESA NAVISP |
| **MODELLED** | Navigation référencée au terrain (TERCOM/SITAN) | dérive de 70 km → **< 500 m** (plancher de résolution de grille ~140 m) | MNT SRTM `.hgt` ; dérive injectée à la main (vérification non circulaire) |
| **MODELLED** | Champ principal IGRF-14 (degré/ordre 13) | pôle ~80.7°N, dipôle ~29.7 µT, bande physique 22–67 µT | IAGA (Association internationale de géomagnétisme et d'aéronomie) `igrf14coeffs.txt` (semi-normalisé de Schmidt) |
| **MODELLED** | Modulation du signal de navigation et poursuite de code | auto-SSC BPSK = **2/(3·R_c)** ; DSP d'aire unitaire ; gigue DLL C/A **inférieure au mètre** à 45 dB-Hz | ancrages SSC/DSP sous forme fermée + formule de bruit thermique DLL de Kaplan & Hegarty |
| **MODELLED** | Correcteur différentiel halo/NRHO CR3BP | STM = différences finies ; l'orbite se referme à la **précision machine** ; NRHO 9:2 de L2 **≈ 6.57 j / périlune ≈ 3,250 km** | vérification de la STM par différences finies + NRHO 9:2 sud de L2 publiée (≈ 6.56 j / ≈ 3,370 km) — CR3BP, pas une véritable éphéméride du Gateway |
| **MODELLED** | Intégrité ARAIM bi-constellation | mode de défaillance à l'échelle d'une constellation sur GPS + Galileo réels | EU ARAIM TR (rapport technique) / DO-316 ; Celestrak `gps-ops` 2021-07-28 (comparé à cette référence ; aucune ligne de la matrice de vérification ne la nomme comme référence externe, donc ce n'est pas étiqueté VALIDATED) |
| **VALIDATED** | Géométrie GNSS / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | concordance à **1e-6 en relatif** sur 8 géométries (bien conditionnées → quasi singulières) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — bibliothèque indépendante (`tests/dop_reference.rs`) |
| **VALIDATED** | Métriques d'évaluation de détecteurs ML (AUC/ROC/confusion/Pd-Pmd/précision/F1) | **décomptes exacts + < 1e-9** sur 5 jeux de données × 24 seuils | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — bibliothèque indépendante (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | AUC ROC de détection d'anomalies sur de la **véritable télémétrie ESA OPS-SAT** | l'AUC reproduit scikit-learn à **< 1e-9** ; AUC du détecteur par comptage de pics **≈ 0.85** sur la partition de test étiquetée | `roc_auc_score` de scikit-learn sur la partition de test OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0) — véritable télémétrie OPS-SAT (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Noyaux numériques de l'arbitrage quantique (ajustement ADEV NNLS · bandes de cohérence χ² · Q d'horloge de van Loan) | NNLS + Q **exacts** ; χ² **< 5e-4** aux ddl de fonctionnement ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Métriques de wander télécom MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811 — les recommandations du Secteur de la normalisation des télécommunications de l'Union internationale des télécommunications) | MTIE (9 facteurs de moyennage, exact au bit près) et MDEV + TDEV (8 facteurs, **< 1e-9** en relatif) sur la série LCG (générateur congruentiel linéaire) NIST SP 1065 | allantools 2024.06 `mtie` / `mdev` / `tdev` — bibliothèque indépendante (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | Méthodes d'étude d'arbitrage MCDA — les quatre familles de décision, neuf agrégateurs validés de manière externe (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) plus la pondération des priorités par comparaison par paires **AHP** | scores / classements / matrices de concordance reproduits à **< 1e-9** | pymcdm + pyDecision (bibliothèques MCDA tierces indépendantes) + RI (indice aléatoire) de Saaty / eig SciPy-LAPACK (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | Enveloppe Doppler LEO à partir de l'orbite et de la porteuse | maximum Iridium à moins de **5 %** des ±36 kHz publiés ; Xona Pulsar X1 dans les **32–34 kHz** publiés | résultats d'essais LEO PNT de la RNTF ; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | Convergence PPP avec augmentation LEO | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min avec 60 / 96 / 192 / 288 satellites LEO, monotone ; NEES du filtre dans la bande χ² | tendance comparée à Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min) ; constellations et bruit non reproduits |
| **MODELLED** | Niveau de protection temporelle conditionnel (erreur de temps non détectée limitée par le holdover sous leurrage) | la composition reproduit la récursion de covariance multi-pas `clock_state` ; calibré sur un leurrage réel enregistré | scalaires JammerTest 2024 (Zenodo 15911589) + formes fermées van Loan / CUSUM (`examples/tpl_jammertest`) |
| **MODELLED** | Notation de la résilience PNT + instabilité de décision | 35 tests de référence dérivés à la main ; artefact d'étude déterministe à l'octet près (graine fixe) | correspondance DHS RPCF v2.0 + formes fermées Dirichlet / Kendall-τ / Hill-N2 — architectures synthétiques, pas une certification |
| **MODELLED** | Étude de l'écart d'optimisme des dégradations RF (lois d'échelle + prédicteur leave-one-out) | significativité par hypothèse nulle de permutation ; artefact déterministe à l'octet près (5 graines) | corpus synthétique fondé sur des paramètres — les *métriques* d'évaluation sont VALIDATED face à scikit-learn (ci-dessus) ; l'étude est MODELLED |
| CI | Reproductibilité multiplateforme | entrée identique au bit près + références de forme sur 3 OS (systèmes d'exploitation) | matrice CI Linux / macOS / Windows, références SHA-256 |
| CI | Couverture de tests | **~95 % de lignes** sur `src/` hors `src/*_data.rs` et `src/main.rs`, bloquante à ≥ 85 % | cargo-tarpaulin (moteur LLVM) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Comment une capacité obtient son étiquette : une exigence correspond à un module dans src, à un test dans tests, à une référence externe (jeu de données réel, implémentation de référence indépendante ou vecteurs publiés), à un état — avec un garde-fou imposé par la CI selon lequel aucune capacité ne peut être Validated sans référence externe. Décomptes en direct : 176 Validated, 221 Modelled, 4 Partner, 401 au total" width="900">
  <br><sub>Comment une capacité obtient son étiquette — l'invariant imposé par la CI : pas de référence externe ⇒ ne peut pas être Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Comment chaque affirmation est étayée : la colonne Validated compte 176 ExternalDataset sur 176 par construction (imposé par la CI) ; les lignes Modelled sont honnêtement marquées InternalConsistency, ReferenceImpl ou ExternalDataset ; les lignes Partner n'ont pas de référence Kshana" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Pire erreur de position SGP4/SDP4 face à la référence AIAA 2006-6753 par régime, échelle logarithmique : chaque régime est très en dessous de la tolérance AIAA, pire cas 4.12 mm dans le régime non résonant de l'espace lointain" width="96%">
  <br><sub>En haut : chaque ligne Validated est étayée par un jeu de données externe, par construction. En bas : SGP4 concorde avec la référence officielle dans chaque régime (pire 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="État de vérification sur l'ensemble des 401 capacités : 176 Validated (vérifiées face à une référence externe), 221 Modelled, 4 relevant d'un partenaire" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Domaines de capacités

Chaque capacité de la carte publique, par domaine, avec son étiquette du registre. Le tableau des domaines est écrit par
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) à partir de `web/capabilities.json`, le même fichier que lit
la carte de tout ce que propose le Studio.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Capacités de Kshana par domaine et par maturité : capacités publiques validées et modélisées par domaine, tirées de web/capabilities.json par tools/gen_validation_figures.py" width="900">
</picture>

Le tableau complet, domaine par domaine avec chaque capacité et son étiquette, se trouve dans [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Installation

Une ligne suffit pour obtenir l'outil en ligne de commande : **`cargo install kshana`**. Chaque canal livre
la v0.40.0 à partir du même commit étiqueté.

<!-- channels:begin -->
| Canal | Installation | Guide |
|---|---|---|
| Essayer dans le navigateur | ouvrir https://kshana.dev | [Guide du Studio](https://kshana.dev/docs/studio.html) |
| Ligne de commande (Rust) | `cargo install kshana` | [Utilisation en ligne de commande](https://kshana.dev/docs/rust.html#usage--cli) |
| Bibliothèque Rust | `cargo add kshana` | [Référence de l'API sur docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Guide de l'API Python](https://kshana.dev/docs/python-api.html) |
| JavaScript et WebAssembly | `npm install kshana` | [Guide npm et WebAssembly](https://kshana.dev/docs/npm.html) |
| Assistant IA (serveur MCP, cargo) | `cargo install kshana-mcp` | [Guide du serveur MCP](https://kshana.dev/docs/mcp.html) |
| Image Docker | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Guide du serveur MCP : Docker](https://kshana.dev/docs/mcp.html#install) |
| Extension Claude Desktop | double-cliquez sur le `.mcpb` de votre système : [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (un clic) | [Ajouter à Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Ajouter à Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (un clic) | [Installer dans VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Installer dans VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Binaire précompilé | téléchargez kshana-mcp-<target> depuis la version et vérifiez-le face à SHA256SUMS | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Registre MCP officiel | recherchez io.github.ashfordeOU/kshana-mcp | [Tous les extraits d'installation MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Distant (HTTP en streaming), auto-hébergé | `kshana-mcp --http 127.0.0.1:8080` | [Guide d'auto-hébergement](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Marketplace de plugins Claude Code | `/plugin marketplace add ashfordeOU/kshana` | [Utiliser Kshana depuis un agent](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| Plugin pour IDE JetBrains | Settings → Plugins → Marketplace → rechercher « Kshana » (ID du plugin dev.kshana.ide) | [Guide du plugin](https://kshana.dev/docs/jetbrains.html) |
| Plugin Signal K | `npm install signalk-kshana-trust` | [Guide du plugin Signal K](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| Plugin OpenCPN | téléchargez l'archive du plugin depuis la version | [Soumission au catalogue OpenCPN](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Tableau de bord Grafana | importez kshana-grafana-*.json depuis la version | [Source du tableau de bord](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Image de configuration de référence | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Intégrations marines](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana sur le JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Se compile avec Rust 1.88 ou plus récent, la rust-version de Cargo.toml"></a></p>

MCP est le Model Context Protocol. Figez une version avec `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` ou `npm install kshana@0.40.0`. Pour compiler depuis les sources, voir
[Installation et compilation](#install--build) sous Référence.

<details>
<summary>Exécuter un scénario depuis Python et depuis WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Au-delà de `run`, le module expose `run_full` (JSON, SVG et le résumé en une ligne à la fois),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` et `error_kind` ; voir
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

Le paquet npm est le moteur entier compilé en WebAssembly. Dans Node.js, passez le binaire à
`initSync` ; dans un navigateur, `await init()` le récupère (voir [`README.npm.md`](README.npm.md)).

```js
import { readFileSync } from "node:fs";
import { createRequire } from "node:module";
import { initSync, run, summary, version } from "kshana";

const wasm = createRequire(import.meta.url).resolve("kshana/kshana_bg.wasm");
initSync({ module: readFileSync(wasm) });

const toml = readFileSync("clock-holdover.toml", "utf8");
const result = JSON.parse(run(toml));
console.log(version(), result.quantum.fom.holdover_s, result.classical.fom.holdover_s);
// 0.40.0 6600 2610
console.log(summary(toml));
```

</details>

<a id="architecture"></a>
## Architecture

Un seul moteur ouvert se trouve au centre, et chaque interface l'exécute : la ligne de commande, la bibliothèque
Rust, Python, WebAssembly et Kshana Studio, le serveur MCP, l'image Docker et le
plugin JetBrains. Le même fichier de scénario donne les mêmes octets sur chacune. Kshana Pro se place
au-dessus comme une surcouche séparée qui dépend du moteur et n'en crée jamais de fork.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="L'architecture de Kshana : un seul moteur ouvert au centre, kshana 0.40.0 sous AGPL-3.0, avec api::run_toml, un répartiteur typé sur chaque type, et le registre de vérification de 401 capacités (176 VALIDATED, 221 MODELLED, 4 PARTNER). Autour, chaque interface exécute le même moteur : ligne de commande (cargo install kshana) ; bibliothèque Rust (cargo add kshana) ; Python (pip install kshana) ; WebAssembly + Kshana Studio (npm install kshana) ; serveur MCP (cargo install kshana-mcp) ; image Docker (ghcr.io/ashfordeou/kshana-mcp) ; plugin JetBrains (Marketplace : &quot;Kshana&quot;). En dessous, Kshana Pro, une surcouche propriétaire qui dépend du moteur ouvert en tant que bibliothèque, n'en crée jamais de fork, et n'ajoute aucun modèle physique." width="100%">
</picture>

<details>
<summary>À l'intérieur du moteur : les couches de domaine et le registre de vérification</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="L'architecture de Kshana en couches. Cinq portes d'entrée (ligne de commande, Python, JavaScript et WebAssembly, le serveur MCP et le plugin JetBrains) atteignent un seul api::run_toml, un répartiteur typé sur 92 types. En dessous se trouvent huit couches de domaine : temps et référentiels, horloges et temps, inertiel et fusion, GNSS et intégrité, astrodynamique, PNT LEO, Lune, Mars et espace lointain, et missions et études, sur un cœur commun, toutes référencées par le module de vérification, la matrice vérifiée par machine de 401 capacités qui est la source unique de vérité pour chaque étiquette." width="100%">
</picture>

**Un seul moteur, de nombreuses portes d'entrée.** Un unique cœur Rust (`kshana`) exécute chaque scénario,
atteint via une CLI, une extension Python, un module WebAssembly dans le navigateur, un **serveur
MCP** pour agents d'IA, et un **plugin pour IDE JetBrains** — tous convergeant vers un seul
répartiteur `api::run_toml`. À l'intérieur, les paquets de capteurs se branchent sur une interface commune
de modèle d'erreur ; à côté d'eux se trouvent une **couche de référentiels** (précession–nutation IAU 2006/2000A
et la réduction GCRS↔ITRS fondée sur le CIO), une **couche astrodynamique/numérique**
(SGP4/SDP4 analytique **et** un propagateur numérique de Cowell avec son
modèle de forces EGM2008/perturbations, la conception de manœuvres et la détermination d'orbite), une
**couche intégrité/GNSS** (RAIM/ARAIM, SBAS, le domaine des mesures, le brouillage, le cislunaire),
une **couche fusion / alt-PNT** (les estimateurs GNSS/INS et les apparieurs de cartes
gravité/terrain/magnétisme), une **couche espace lointain et lunaire** (Mars-PNT radiométrique et la
suite PNT lunaire, avec son niveau de preuve par élément dans la matrice — temps LTC, VLBI, DO + horloge conjointes, réalisation du référentiel, volume de service,
PNT différentiel, interopérabilité), une **couche d'analyse de mission** (budgets de lancement / rentrée / couverture /
pointage / passage / liaison et l'environnement de météorologie spatiale), et la
**couche d'études de résilience et d'IA/ML** ouverte (notation de la résilience RPCF, l'écart d'optimisme
des dégradations RF, et le démonstrateur de PNT quantique) dont les artefacts reproductibles reposent sur les
noyaux validés.

Deux crates autonomes, **exclues de l'espace de travail**, se trouvent à côté du cœur — `mcp/kshana-mcp`
(le serveur MCP, bâti sur le SDK `rmcp` en édition 2024) et `xval/anise-frames` (la
contre-vérification des référentiels ANISE/SPICE, qui tire des dépendances MPL-2.0 (Mozilla Public License 2.0)) — tenues à l'écart du graphe de dépendances
de la crate publiée, du `Cargo.lock`, du contrôle de licences et de la compilation MSRV (version minimale de Rust prise en charge) par la liste `exclude`
du `Cargo.toml` racine. Le plugin JetBrains (`ide/jetbrains`) est un projet Kotlin
séparé. Voir [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) pour l'ensemble complet des diagrammes.

Les diagrammes rendus (flux du moteur, carte des modules, distribution) se trouvent dans [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagrammes

Les diagrammes sont des sources Mermaid dans [`docs/diagrams/`](docs/diagrams/), rendues en SVG et PNG dans
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` sous Linux, les deux autres
scripts `render-diagram` ailleurs), et un enregistrement lie chaque PNG au SVG exact dont il provient. Des tests figent les
décomptes qu'ils énoncent. Les graphiques des sections ci-dessus sont dessinés par des outils à partir d'exécutions du moteur ; ceux-ci montrent comment les
parties s'assemblent.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Le système : six portes d'entrée (ligne de commande, Python, WebAssembly et npm avec Kshana Studio, serveur MCP avec plugins et skills, plugin JetBrains, intégrations) appellent toutes un seul répartiteur sur chaque type de scénario, qui exécute un seul moteur composé d'un cœur commun, de paquets de capteurs et de référentiels, et de modèles de domaine, et écrit un résultat et un graphique reproductibles" width="900"><br>
  <sub>Un répartiteur, un moteur, une sortie reproductible · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · source <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Les interfaces : un seul moteur déterministe hors ligne alimente la ligne de commande, la bibliothèque Rust, Python, WebAssembly et npm, et le serveur MCP ; le Studio s'exécute sur la compilation WebAssembly, les commandes de plugin et les skills sur le serveur MCP, les intégrations et kits de déploiement sur la ligne de commande, et le plugin JetBrains sur la bibliothèque" width="900"><br>
  <sub>Chaque interface, à partir du même moteur · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · source <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="À l'intérieur d'une exécution : un fichier de scénario avec sa graine et sa chronologie GNSS alimente le moteur qui, à chaque pas de temps, fait évoluer le modèle d'erreur, exécute l'estimateur et note les facteurs de mérite, puis écrit un résultat et un graphique reproductibles" width="900"><br>
  <sub>La boucle interne d'une exécution · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · source <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Confiance du récepteur : un journal ou un flux de récepteur est ingéré en observables par époque et en indicateurs propres du récepteur, passe les surveillances, et devient un score de confiance indicatif avec une bande et des raisons, qui alimente le Studio, la télémétrie, un paquet de preuves signé, la notation Jammertest et bench, et le rapport de conformité" width="900"><br>
  <sub>D'un journal de récepteur à un score de confiance et ce qui l'utilise · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · source <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="L'aller-retour avec le laboratoire : un scénario est exporté avec ses événements et ses conditions d'essai, un opérateur extérieur à Kshana rejoue un fichier à travers un simulateur de laboratoire, le journal du récepteur est noté face aux événements énoncés, et l'aller-retour de preuves relie les empreintes du scénario, des conditions et du journal ainsi que la note dans un paquet signé" width="420"><br>
  <sub>Du scénario au paquet signé ; Kshana ne produit ni ne rejoue jamais un signal · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · source <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio : le navigateur exécute localement le moteur compilé en WebAssembly sans rien téléverser, prend des scénarios fournis ou un scénario ou un journal que vous ouvrez, et affiche le résultat dans la vue Simple, la vue Avancée et les pages de tâches, les exports étant enregistrés par l'utilisateur" width="900"><br>
  <sub>Comment le Studio s'exécute, localement · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · source <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Le flux de test et de publication : les contrôles locaux (formatage, clippy, la vérification d'absence d'attribution, le cliquet de couverture de la documentation, et scripts/gate.sh, qui exécute la suite complète et des exécutions répétées et écrit le reçu que vérifie le hook pre-push) mènent à une pull request uniquement CI et à une CI complète au vert ; le propriétaire avance main en fast-forward jusqu'au commit vert et une étiquette annotée y est posée après la vérification de synchronisation des versions ; le workflow de publication vérifie la suite complète sur le commit étiqueté avant toute publication, compile les binaires avec un SBOM, des sommes de contrôle et la provenance de compilation, publie sur crates.io, PyPI, npm, le registre de conteneurs, le registre MCP et le JetBrains Marketplace, interroge chaque registre jusqu'à ce qu'il serve la nouvelle version, et déclenche la compilation du site à partir de l'étiquette ; une voie séparée réservée au site déclenche le workflow pages avec l'étiquette main et est refusée sauf si rien en dehors de web/ et .github/ n'a changé depuis la dernière version" width="900"><br>
  <sub>Flux de test et de publication, des contrôles locaux à une version vérifiée et la voie réservée au site · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · source <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="La carte des modules : la ligne de commande, Python, WebAssembly, le serveur MCP et le plugin JetBrains appellent le répartiteur typé sur chaque type, qui atteint le cœur commun, le temps et les référentiels, les paquets de capteurs, l'astrodynamique, l'intégrité, la détection de leurrage, la fusion, l'espace lointain et lunaire, la résilience, et les modules d'arbitre et de banc d'essai, le tout garanti par la matrice de vérification" width="1000"><br>
  <sub>Où se trouve le code · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · source <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Distribution : un seul dépôt livre la crate principale, le serveur MCP, le plugin d'IDE et les crates de contre-vérification vers crates.io, PyPI, npm, GitHub Releases, le bac à sable Pages, le registre de conteneurs, le registre MCP et le JetBrains Marketplace, avec une archive Zenodo" width="900"><br>
  <sub>Ce qui est livré où, et ce qui le vérifie · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · source <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## Assistant IA

[`kshana-mcp`](mcp/kshana-mcp/) est un serveur MCP : votre assistant exécute le véritable moteur et
relit son JSON, au lieu de deviner les calculs. Chacun de ses 49 outils est une fine enveloppe
autour d'une fonction publique de la bibliothèque `kshana`, de sorte qu'aucune logique de simulation ne réside dans le serveur.

### Installer le serveur MCP

> Logiciel à titre consultatif, et non un équipement de navigation homologué : l'opérateur reste responsable de la navigation.
> Le serveur s'exécute sur votre ordinateur ; rien n'est envoyé à Ashforde OÜ.

Choisissez n'importe quel canal. Chaque lien et chaque extrait est généré par un seul script
(`scripts/gen_mcp_install.py`) et vérifié en intégration continue ; les extraits pour Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI et Continue se trouvent dans
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Canal | Commande ou bouton | Prérequis | Forme figée |
|---|---|---|---|
| Extension Claude Desktop | double-cliquez sur le `.mcpb` de votre système : [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | aucun | `kshana-mcp-<target>.mcpb` de la v0.40.0 |
| Cursor (un clic) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node, ou Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (un clic) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node, ou Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · plugin : `/plugin marketplace add ashfordeOU/kshana` puis `/plugin install kshana@ashforde` | Node (ou Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ avec uv ou pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | formule pour la v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` puis `scoop install kshana-mcp` | Scoop (Windows) | manifeste pour la v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Binaire précompilé | [la page de la version](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0) : `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, vérifiés par `SHA256SUMS` et `gh attestation verify` | aucun | v0.40.0 |
| Registre MCP | `io.github.ashfordeOU/kshana-mcp` (trouvé par les clients compatibles avec le registre) | un client compatible avec le registre | `0.40.0` |
| Distant (HTTP en streaming) | `kshana-mcp --http 127.0.0.1:8080`, auto-hébergé : voir [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | votre propre hôte | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp sur Glama, le score de qualité de son serveur MCP"></a></p>

Dans Claude Code, le même serveur arrive sous forme de plugin : `/plugin marketplace add ashfordeOU/kshana`, puis
`/plugin install kshana@ashforde`. Le plugin ajoute des commandes slash par-dessus les outils : `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` et `/kshana-jammertest`. Les outils de confiance des navires alimentent les intégrations Signal K et
OpenCPN : [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

La configuration par client se trouve dans [`docs/integrations.md`](docs/integrations.md). Le serveur est répertorié
dans le registre MCP officiel sous le nom `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>Les 49 outils</summary>

<br>

**Scénarios et rapports**

| Outil | Ce qu'il fait |
|---|---|
| `run_scenario` | Exécuter un scénario à partir d'une définition TOML (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | Les 92 types de scénarios intégrés avec leurs descriptions + champs obligatoires/facultatifs — pour que l'agent puisse construire un scénario valide |
| `validate_scenario` | Vérification préalable : analyser le TOML et détecter son type, sans l'exécuter |
| `list_example_scenarios` | Les scénarios de référence fournis, en JSON |
| `get_example_scenario` | Le texte TOML d'un scénario de référence fourni, identique octet pour octet au fichier sous `scenarios/` |
| `report_scenario` | Exécuter un scénario et renvoyer son rapport |
| `animate_scenario` | Exécuter un scénario et renvoyer ses séries temporelles sous forme d'animation |
| `sky_geometry` | Géométrie du ciel sous une ligne d'horizon dépendant de l'azimut : les satellites visibles et masqués, la DOP, la covariance est-nord-haut et l'ellipse d'erreur horizontale ; ou un préréglage de ligne d'horizon avec sa provenance |

**Export et interopérabilité**

| Outil | Ce qu'il fait |
|---|---|
| `list_export_formats` | Quels formats d'interopérabilité s'appliquent à un scénario (`czml`, `kml`, `geojson`, `stk`, `sigmf`), la raison lorsque l'un ne s'applique pas, et la spécification que suit chaque écrivain |
| `export_interop` | Exporter un scénario en CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, éphéméride STK (Systems Tool Kit) `.e`, ou SigMF (Signal Metadata  |
| `import_route` | Écrire une route GeoJSON `LineString` dans un scénario qui suit une trace de points de cheminement (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`) et renvoyer le nouveau TOML |
| `export_sp3` | Exporter la constellation d'un scénario `orbit` sous forme d'éphéméride précise SP3-c (Standard Product 3, révision c) |
| `export_omm` | Exporter les éléments d'un scénario `orbit` sous forme de catalogue OMM (Orbit Mean-elements Message) CCSDS (Comité consultatif pour les systèmes de données spatiales) 502.0-B-2 |
| `export_oem` | Exporter la série d'états d'un scénario `orbit` sous forme d'éphéméride CCSDS OEM (Orbit Ephemeris Message) 2.0 — la position TEME (équateur vrai, équinoxe moyen) *et*  |
| `export_table_csv` | Exécuter un scénario et renvoyer sa table de reproductibilité en CSV (valeurs séparées par des virgules) — la table stable à l'octet près que la CLI (interface en ligne de commande) écrit sous `<scenario>.table.csv` |
| `export_test_bench` | Le mouvement du véhicule et les événements d'un scénario pour un simulateur GNSS de laboratoire (`kshana bench-export`) |

**Confiance du récepteur et du navire**

| Outil | Ce qu'il fait |
|---|---|
| `assess_receiver_log` | Évaluer la confiance d'un véritable journal de récepteur GNSS (système mondial de navigation par satellite) |
| `assess_vessel_stream` | Noter un extrait NMEA 0183 borné (au plus 2 MiB et 20,000 époques |
| `assess_vessel_log` | Le journal NMEA 0183 d'un navire (au plus 4 MiB) en exécution par lots, le TOML de session énonçant les limites du navire |
| `create_evidence_pack` | Un paquet de preuves signé pour une fenêtre du journal d'un navire (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Lier un jeton d'horodatage RFC 3161 (base64 des octets `.tsr`) à un paquet, en mémoire (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Vérifier un paquet (`kshana evidence verify`) |
| `generate_training_nmea` | NMEA 0183 de passerelle synthétique pour la formation des équipages à partir d'un TOML `nmea-scenario` (brouillage, entraînement de position, leurrage temporel, retard de rejeu) avec le journal d'instructeur (`kshana-nmea-training/1`) |
| `build_interference_map` | Une carte des interférences GNSS à partir de rapports de position ADS-B ou AIS sous forme de texte CSV (au plus 4 MiB) |
| `route_exposure` | La part de la longueur d'une route dans les cellules dégradées, non dégradées, non évaluées et non observées d'une ou plusieurs cartes des interférences, éventuellement dans une plage de dates |
| `trust_telemetry` | Un flux de confiance (lignes JSON) ou un résultat `receiver-trust` rendu sous forme de texte Prometheus, de lignes syslog CEF ou LEEF ou d'une charge utile JSON OTLP, avec les encodeurs de `kshana trust-telemetry` |
| `jammertest_import` | Lire le catalogue d'essais et le plan d'émission publiés de Jammertest (NPRA/jammertest-plan, MIT) comme vérité planifiée (`kshana jammertest import`) : les créneaux d'une zone d'essai deviennent des événements receiver-trust avec l'identifiant du catalogue et l'année dans chaque étiquette. Des créneaux planifiés, pas des heures d'émission enregistrées ; aucun champ de contact du plan n'est lu. MODELLED. Voir [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Noter un journal de récepteur face à ce calendrier (`kshana jammertest score`) : par essai, la latence de détection, les alarmes manquées et le temps de rétablissement, et les fausses alarmes en dehors de tout créneau. Journaux texte en `log`, binaires (`ubx`, `sbf`) en `log_base64`. Un paquet signé nécessite une clé : ligne de commande. À titre consultatif seulement ; MODELLED. |
| `fit_imu_log` | Paramètres d'accéléromètre et de gyromètre des scénarios `hybrid` et `fusion` ajustés à partir d'un journal d'IMU immobile (CSV ou EuRoC) par écart d'Allan, avec une table `[accel_classical]` prête à coller et le SHA-256 du journal (`kshana imu-fit`). Texte en entrée, JSON en sortie ; MODELLED. |

**IQ GNSS (fichiers du répertoire de travail ; désactivé en mode HTTP)**

| Outil | Ce qu'il fait |
|---|---|
| `iq_signals` | La configuration de la couche IQ GNSS |
| `iq_info` | Décrire un enregistrement IQ (en phase et en quadrature) du répertoire de travail sans le traiter |
| `iq_scene` | Générer une scène IQ GNSS multi-satellite dans le répertoire de travail (`kshana iq scene`) |
| `iq_acquire` | Acquisition par FFT (transformée de Fourier rapide) d'un ou plusieurs PRN (codes de bruit pseudo-aléatoire) sur un enregistrement (`kshana iq acquire`), éventuellement derrière des étages frontaux |
| `iq_track` | Acquérir, puis poursuivre avec le banc DLL/PLL/FLL (boucles à verrouillage de retard, de phase et de fréquence) (`kshana iq track`), avec les boucles issues d'un `kshana.loop-desig |
| `iq_frontend` | Appliquer le traitement DSP (traitement numérique du signal) du frontal du récepteur et d'atténuation des interférences |
| `iq_sweep` | Rejouer un enregistrement IQ du répertoire de travail à travers plusieurs conceptions de boucles de poursuite (`kshana iq sweep`) |
| `iq_monitor` | Exécuter les surveillances de détection d'interférences et de leurrage sur un enregistrement IQ du répertoire de travail (`kshana iq monitor`) |
| `iq_labfit` | Ajuster le modèle de perte de verrouillage des boucles de poursuite à des exécutions en laboratoire (`kshana iq labfit`) à partir d'un scénario `iq-labfit` dont les journaux sont en ligne (`text` ou `base64` |
| `iq_test_conditions` | Valider un fichier `kshana.test-conditions/1` fourni sous forme de texte et renvoyer les conditions résolues avec leur empreinte |
| `iq_campaign` | Exécuter une campagne de rejeu en laboratoire (`kshana iq campaign`) |
| `iq_campaign_status` | L'avancement d'un dossier de sortie de campagne |

**Correspondance de conformité**

| Outil | Ce qu'il fait |
|---|---|
| `compliance_report` | La correspondance avec les cadres publics remplie à partir de documents de résultats fournis sous forme de texte (`kshana compliance-report`) |
| `compliance_mapping` | Les tables de correspondance statiques (ou, avec `sources`, les documents sources qu'elles citent avec versions et URL) en Markdown, précédées de la même déclaration |
| `list_standards_packs` | Les paquets de normes (`kshana standards-pack list`) : ensembles de scénarios notés pour les profils d'essai du cadre DHS Resilient PNT, IMO MSC.1/Circ.1575 et ICAO Doc 9849 Appendix F |
| `run_standards_pack` | L'exécution d'un paquet face à des seuils énoncés avant l'exécution : chaque essai `MET`, `NOT MET` ou `NEEDS INPUT` ; MODELLED, n'évalue aucun produit |
| `lunanet_afs_check` | Le LunaNet Augmented Forward Signal vérifié face à LNIS V5 AD1 Volume A (LSIS-AFS V1.0) : les codes face aux tables imprimées, ou un flux de symboles face au format de trame ; les LDPC et CRC-24Q des sous-trames 2 à 4 ne sont pas vérifiés |
| `create_round_trip_pack` | Le paquet signé d'aller-retour avec le laboratoire : scénario, document `kshana.test-conditions/1`, journal du récepteur et note liés par empreinte |

**Banc d'essai**

| Outil | Ce qu'il fait |
|---|---|
| `score_benchmark` | Une soumission kshana-bench notée face à un fichier de vérité, tous deux en texte JSON (`kshana bench score`, `bench/SPEC.md`) : le fichier de résultat avec la version de la spécification, la partition, les empreintes des entrées et les métriques de la tâche. MODELLED ; décrit un journal ou un corpus, jamais un produit. |
| `render_leaderboard` | Des fichiers de résultats kshana-bench rendus sous forme de page de classement statique (texte HTML), chacun étant d'abord validé. |

</details>

<a id="editions"></a>
## Éditions

Le moteur entier est gratuit. Kshana Pro et les études sur mesure s'adressent aux programmes qui ont besoin de davantage,
et chaque voie payante commence par un message : il n'y a pas de prix ici.

| | Free | Kshana Pro | Étude sur mesure |
|---|---|---|---|
| Ce que c'est | le moteur ouvert entier, les 92 types de scénarios, aucune fonctionnalité verrouillée | une surcouche propriétaire sur le même moteur, sous contrat | une étude MODELLED de résilience PNT de votre système, réalisée pour vous |
| Licence | AGPL-3.0 (GNU Affero General Public License, version 3), ou une licence commerciale | propriétaire | contrat |
| Pour commencer | [installer](#install) ou ouvrir [kshana.dev](https://kshana.dev) | [demander une évaluation de Pro](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [demander une étude](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Ce qu'est Pro, selon les termes de [`docs/PRO.md`](docs/PRO.md) :

> **Un sur-ensemble strict de Kshana ouvert.** Pro dépend du moteur ouvert en tant que bibliothèque et
> n'en crée jamais de fork. Chaque type de scénario ouvert s'exécute dans Pro sans modification, et un scénario ouvert s'exécute
> dans Pro sans aucune licence.
>
> **Aucune physique nouvelle.** Pro n'ajoute aucun modèle physique et n'en modifie aucun. Chaque nombre de Pro provient
> d'exécutions du moteur ouvert, de sorte qu'un chiffre de Pro est aussi fiable que le type de scénario ouvert
> dont il provient, et jamais davantage.

Pro répond aux questions suivantes d'un programme : quelle conception faire voler (un optimiseur de conception et son
front de Pareto), à quel point la réponse est sûre (incertitude et sensibilité), et si la mission
satisfait ses exigences (un dossier de mission, la traçabilité des exigences, des études d'arbitrage, une
vérification de régression des scénarios, des jumeaux numériques d'horloges, un dossier d'étude et un service
sur site). Il surveille aussi une campagne de chiffres et fait échouer un pipeline lorsque l'un se dégrade,
teste des plans de signaux candidats face aux signaux ouverts de navigation par satellite dans les deux
sens (coexistence spectrale), et met des études en file d'attente dans un service de tâches sur site avec un
registre de livraison chaîné par empreintes. Chacun est décrit, avec ce qu'il produit et ce qu'il ne fait pas, dans
[`docs/PRO.md`](docs/PRO.md). Rien de ce que produit Pro n'est une certification, et une étude sur mesure n'est
pas non plus une certification.

<details>
<summary>Ce que Kshana Pro lit dans le moteur ouvert, et le support d'Ashforde® OÜ</summary>

<br>

**Ce sur quoi Kshana Pro s'appuie.** Chaque partie de Pro fonctionne à partir du moteur ouvert et le laisse
inchangé :

- **L'optimiseur de conception, l'étude d'incertitude et le dossier de mission** exécutent des scénarios du moteur ouvert
  via l'interface publique du moteur et calculent chaque nombre à partir des résultats
  des exécutions. Chaque sortie conserve le niveau VALIDATED, MODELLED ou PARTNER que le moteur ouvert a donné à
  chaque chiffre, jamais un niveau supérieur.
- **Les jumeaux numériques d'horloges** utilisent le modèle d'horloge du moteur ouvert et son estimateur d'écart
  d'Allan : un jumeau est calibré sur le budget d'Allan publié du dispositif, puis vérifié en
  estimant l'écart d'Allan du jumeau avec l'estimateur ouvert.
- **Les études d'arbitrage** exécutent chaque option d'architecture comme un scénario du moteur ouvert, sans modification,
  et classent les options selon un facteur de mérite lu dans le résultat de chaque exécution.
- **La surveillance de campagne** lit ses chiffres dans les résultats d'exécutions du moteur ouvert des
  scénarios d'un paquet, et les compare à la précédente exécution réussie.
- **La coexistence spectrale** lit chaque nombre physique dans des exécutions du moteur ouvert des types
  `leo-signal` et `constellation-design`, et n'ajoute que la somme sur les satellites
  en vue et le classement des plans.
- **Le service de tâches sur site** exécute des scénarios ouverts et Pro via le même moteur et
  stocke chaque résultat tel que l'exécution l'a renvoyé.
- **Les paquets de preuves** enregistrent, pour chaque exécution, l'empreinte du scénario que le moteur ouvert appose sur
  son résultat, de sorte qu'un chiffre d'un paquet peut être reproduit en réexécutant son scénario.
- **Outillage d'ingénierie des systèmes et de programme.** L'outillage d'ingénierie des systèmes
  basée sur les modèles (MBSE) et de programme de Kshana Pro vérifie les exigences d'un programme
  face à des exécutions du moteur ouvert : il importe les exigences en valeurs séparées par des virgules
  (CSV), ou sous forme d'un sous-ensemble documenté du Requirements Interchange Format (ReqIF) ou du
  texte Systems Modeling Language version 2 (SysML v2), évalue chaque critère
  d'acceptation, avec son unité, face aux valeurs qu'une exécution a écrites, et produit une matrice de
  vérification croisée (VCRM), un modèle SysML v2, un rapport d'impact des modifications et un paquet de preuves
  hors ligne. Il ne réexécute ni ne recalcule rien, et ne lit que ce que le moteur ouvert
  publie : le `result.json` de chaque exécution (les champs que nomme un critère, leurs unités, le
  tampon de reproductibilité composé de l'empreinte du scénario, de la graine, de la version du moteur et de la version du schéma, et
  l'étiquette et les niveaux de chiffres de l'exécution), son `report.json` (type, enregistrement de reproductibilité et
  étiquettes de capacités), le fichier de scénario (son empreinte, son type, sa graine et ses paramètres), le
  schéma des unités de champs (l'unité, la provenance et le niveau de preuve de chaque champ) et la
  matrice de vérification (l'étiquette VALIDATED, MODELLED ou PARTNER de chaque capacité).

<a id="support--professional-services"></a>
### Support et services professionnels

Kshana est libre et open source sous AGPL-3.0 et **développé et maintenu de manière professionnelle
par Ashforde® OÜ** (Estonie). Le moteur ouvert est complet et utilisable en
soi. Pour les organisations qui ont besoin de davantage, Ashforde® OÜ propose :

- **Support commercial et intégration** — intégration de Kshana dans votre chaîne d'outils, scénarios
  sur mesure et corrections prioritaires.
- **Modèles de capteurs sur mesure** — calibrés sur votre matériel, y compris des modèles de résilience
  sensibles à l'export maintenus dans une surcouche privée.
- **Kshana Pro** — outillage propriétaire d'ingénierie des systèmes basée sur les modèles (MBSE) et de programme
  qui vérifie les exigences d'un programme face à des exécutions du moteur ouvert et
  produit une matrice de vérification croisée (VCRM), un modèle Systems Modeling Language
  version 2 (SysML v2), un rapport d'impact des modifications et un paquet de preuves hors ligne. Il
  ne réexécute rien et ne lit que les sorties publiées du moteur : le `result.json`
  et le `report.json` de chaque exécution, le fichier de scénario, le schéma des unités de champs et les étiquettes de la
  matrice de vérification (la liste complète figure sous [Éditions](#editions)).
- **Outillage de conception, d'incertitude et de mission de Kshana Pro** — le front de Pareto d'un espace
  de conception, l'incertitude et la sensibilité sur des milliers d'exécutions, et un dossier de mission
  en une commande avec une matrice de vérification et un PDF ; voir [`docs/PRO.md`](docs/PRO.md).
- **Surveillance de campagne, coexistence spectrale et service de tâches de Kshana Pro** — un pipeline qui
  échoue lorsqu'un chiffre surveillé se dégrade, des plans de signaux testés face aux signaux ouverts
  de navigation par satellite dans les deux sens, et une file de tâches sur site avec un
  registre de livraison chaîné par empreintes ; voir [`docs/PRO.md`](docs/PRO.md).
- **Formation et conseil** en analyse de performances PNT quantique/classique.

C'est le modèle open core : le moteur est, et reste, sous licence ouverte ; l'activité
qui le soutient repose sur l'expertise, le support et les extensions propriétaires — pas sur des frais de licence.
Contact **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Recherche

Les études bâties sur le moteur ouvert sont publiées sur arXiv. Chacune nomme la commande du moteur
qui la sous-tend, de sorte que ses chiffres peuvent être régénérés à partir d'un scénario ou d'un exemple d'étude versionné.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Recherche bâtie sur le moteur ouvert : six articles sur arXiv, chaque carte nommant l'article, sa date et sa catégorie, et la commande du moteur qui régénère ses chiffres. Les mêmes six articles, avec liens et commandes, figurent dans le tableau ci-dessous." width="100%">
</picture>

| Article | Ce qu'il montre | Commande du moteur |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | La baisse du score d'un détecteur d'interférences GNSS lorsque les conditions changent peut être prédite à partir des seules statistiques dans la distribution, sur un banc d'essai synthétique ouvert puis sur des enregistrements de terrain ouverts. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Un récepteur de temps GNSS sous leurrage n'a aucune borne inconditionnelle finie sur l'erreur de temps non détectée ; l'article en donne donc une conditionnelle, calibrée sur un leurrage enregistré en émission réelle lors de la campagne publique JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Un score de résilience composite unique n'est une base stable de décision que là où une conception domine ; là où les conceptions sont en concurrence, une simple repondération peut changer le gagnant. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | La télémétrie à l'intérieur d'une constellation lunaire laisse la position absolue d'une station de surface inobservable ; un retard d'interférométrie à très longue base (VLBI) depuis la Terre la rétablit lorsque la constellation est clairsemée, et l'affine lorsqu'elle est riche. | le type `lunar-joint-od-clock` : `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Les constellations prévues de quatre à six satellites donnent une géométrie médiocre au pôle sud lunaire, et quelques balises de télémétrie de surface y remédient à bien moindre coût que davantage de satellites. | le type `lunar-beacon` : `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | La dilution de précision est indéfinie pour la poursuite cislunaire en distance seule, parce que la vitesse est inobservable sur un instantané ; l'article utilise donc le grammien d'observabilité sur quatre orbites rétrogrades distantes planes : la distance seule est de rang 2 sur 4 sur un instantané et nécessite un arc d'environ 2.09 h pour devenir entièrement observable, le conditionnement s'améliorant à mesure que l'arc s'allonge ; la vitesse radiale (Doppler) donne le rang 4 instantanément ; et la co-estimation d'une station avec les états et horloges des satellites reste déficiente d'un rang à moins qu'une observable interférométrique externe ne soit ajoutée. Les exigences relèvent de budgets de longueur d'arc, de conditionnement et de type de mesure, pas de la DOP. | le type `cislunar-observability` : `kshana scenarios/cislunar-observability.toml` (son voisin `cislunar-arc-recovery` teste le seuil avec un estimateur indépendant par différences finies) |

Les trois exemples d'études écrivent des artefacts déterministes à l'octet près (graines fixes) qui enregistrent leur
version du moteur, leurs graines et une empreinte de configuration. Les trois articles lunaires et cislunaires sont bâtis sur la
suite lunaire (le niveau de preuve de chaque élément figure dans la matrice de vérification) ; leurs affirmations sur la géométrie et la dilution de précision sont aussi contre-vérifiées
face à des références séparées dans `tests/validate_p*.rs`. Davantage dans
[Artefacts d'étude reproductibles](#reproducible-study-artifacts) sous Référence.

<a id="cite"></a>
## Citer

Si vous utilisez Kshana dans un travail académique ou technique, veuillez citer la version utilisée, avec le
scénario et la graine. [`CITATION.cff`](CITATION.cff) contient les métadonnées lisibles par machine, et
GitHub affiche à partir de celles-ci un bouton « Cite this repository ». Chaque version est archivée sur Zenodo ;
le DOI (Digital Object Identifier) conceptuel
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) renvoie toujours à la
dernière version.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Les articles ci-dessus :

> Baweja, C. (2026). *Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*. arXiv:2606.22054. https://doi.org/10.48550/arXiv.2606.22054
>
> Baweja, C. (2026). *A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*. arXiv:2606.24210. https://doi.org/10.48550/arXiv.2606.24210
>
> Baweja, C. (2026). *How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*. arXiv:2607.05415. https://doi.org/10.48550/arXiv.2607.05415
>
> Baweja, C. (2026). *Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*. arXiv:2607.02566. https://doi.org/10.48550/arXiv.2607.02566
>
> Baweja, C. (2026). *The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*. arXiv:2607.06212. https://doi.org/10.48550/arXiv.2607.06212
>
> Baweja, C. (2026). *Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*. arXiv:2610.23871. https://doi.org/10.48550/arXiv.2610.23871

<a id="licence"></a>
## Licence

Kshana est sous double licence : la GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)), ou une
**licence commerciale** d'Ashforde® OÜ pour une intégration fermée à laquelle l'AGPL ne convient pas.
[`LICENSING.md`](LICENSING.md) explique laquelle s'applique. Les contributions sont reçues sous licence
AGPL et accordent également à Ashforde® OÜ le droit de les inclure dans l'édition
commerciale ; signez chaque commit avec `git commit -s` (voir [`CONTRIBUTING.md`](CONTRIBUTING.md)).
« Kshana » et ses marques sont des marques commerciales d'Ashforde® OÜ : la licence couvre le code, pas le
nom ; veuillez donc renommer les forks.

<a id="reference"></a>
## Référence

Le matériel détaillé, replié. Chaque document est listé dans [Documentation](#documentation).

<details>
<summary>Installation et compilation depuis les sources</summary>

<a id="install--build"></a>
### Installation et compilation

Nécessite une chaîne d'outils Rust (≥ 1.88, la `rust-version` de Cargo.toml ; développé avec 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Utilisation : la ligne de commande en entier</summary>

### Utilisation

Exécutez n'importe quel scénario ; la CLI répartit selon le champ `kind` du scénario et écrit
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` et
`<scenario>.report.json` à côté — plus `<scenario>.table.csv` pour les types qui
publient une table. Le rapport (une page HyperText Markup Language (HTML) et un document JSON
au même contenu) contient un résumé exécutif, chaque entrée avec son unité, les
résultats et graphiques, le balayage, les tables Monte-Carlo ou de chaîne d'une campagne, une chronologie des événements,
l'étiquette VALIDATED / MODELLED / PARTNER et la source de chaque capacité utilisée par l'exécution,
ce qui n'est pas modélisé, et un enregistrement de reproductibilité (version du moteur, empreintes Secure Hash
Algorithm 256-bit (SHA-256), graine, plateforme et commande exacte). Il s'imprime en
un fichier PDF (Portable Document Format) propre depuis le navigateur sur papier A4 ou Letter ; le
moteur n'écrit lui-même aucun PDF. Voir [`docs/REPORTS.md`](docs/REPORTS.md).

```bash
cargo run -- scenarios/clock-holdover.toml
cargo run -- scenarios/imu-deadreckoning.toml
cargo run -- scenarios/timetransfer.toml
cargo run -- scenarios/hybrid-pnt.toml
cargo run -- scenarios/orbit-gnss-challenged.toml
cargo run -- scenarios/orbit-sgp4-gps.toml
cargo run -- scenarios/orbit-rinex.toml
cargo run -- scenarios/integrity-raim.toml

# Export a propagated constellation to an SP3-c precise-ephemeris file:
cargo run -- scenarios/orbit-sgp4-gps.toml --export-sp3 gps.sp3

# Export the constellation's mean elements to a CCSDS OMM catalogue (one OMM
# message per TLE-defined satellite, with its real NORAD id / COSPAR designator):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-omm gps.omm

# Export the velocity-carrying state to a CCSDS OEM 2.0 ephemeris (GMAT/Orekit/STK):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-oem gps.oem

# Export the geometry for a globe, a map or a mission-analysis tool: CZML, KML,
# GeoJSON, STK .e, or SigMF for the spectrum kind (every format that applies):
cargo run -- scenarios/jamming-demo.toml --export all
```

`--export <czml|kml|geojson|stk|sigmf|all|list>` écrit du CZML (le Cesium Language), du KML
(Keyhole Markup Language), du GeoJSON (Request for Comments 7946), des éphémérides Ansys STK (Systems Tool Kit) `.e`
et des enregistrements SigMF (Signal Metadata Format) à côté du scénario, et
`--import-route <route.geojson>` injecte une ligne GeoJSON dans les types qui suivent une trace. Chaque
format est validé face à sa spécification publiée, et un scénario auquel un format ne
s'applique pas dit pourquoi : voir [docs/INTEROP.md](docs/INTEROP.md).

**Autres modes de la CLI** — vérifier un scénario, fournir de véritables données d'orientation de la Terre, ou exécuter une suite entière :

```bash
# Lint a scenario without running it (checks the kind + required fields):
cargo run -- --validate scenarios/integrity-raim.toml

# Feed a real IERS Earth-orientation file (finals2000A) for frame precision:
cargo run -- scenarios/orbit-sgp4-gps.toml --eop tests/fixtures/agency/eop/finals2000A_2022001.txt

# Run a SUITE of scenarios into one aggregated, stamped study artifact
# (writes <suite>.study.json + <suite>.study.html next to the manifest):
cargo run -- --study scenarios/quantum-pnt-demonstrator.suite.toml

# Animate a run's time series: an animated SVG, a self-contained HTML player, and a
# numbered SVG frame sequence with manifest.json (see docs/ANIMATION.md):
cargo run -- scenarios/campaign-jam-spoof-holdover-integrity.toml --animate all
```

**Export d'animation.** `--animate svg|html|frames|all` écrit `<scenario>.animation.svg`
(images clés Cascading Style Sheets (CSS), sans script), `<scenario>.animation.html` (lecture, pause, défilement, vitesse et
panneaux synchronisés, sans ressource externe) et `<scenario>.frames/` (`frame_0000.svg`, … plus
`manifest.json` avec le nombre d'images par seconde et la durée). Une campagne joue ses phases et
ses alarmes, une exécution spectrum sa cascade ; le thème suit `prefers-color-scheme` et
`prefers-reduced-motion` affiche l'image finale. Elle restitue les propres échantillons de l'exécution,
identiques à l'octet près lors d'une réexécution, et n'ajoute aucune preuve. Voir [docs/ANIMATION.md](docs/ANIMATION.md).

Un manifeste de **suite** est un petit fichier TOML (Tom's Obvious, Minimal Language) — un `title` et un tableau `scenarios = [ … ]` de
chemins de scénarios — que le moteur exécute tour à tour, en intégrant chaque résultat (avec ses
étiquettes MODELLED / VALIDATED) dans un seul artefact d'étude autodescriptif. Voir
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Rôle d'interopérabilité.** Kshana est la couche de *simulation de performances* qui se place
à côté de la chaîne d'outils de post-traitement, pas un remplacement de celle-ci : injectez sa sortie **RINEX**
dans RTKLIB ou gLAB pour une solution de position, et utilisez sa sortie **SP3** comme
produit d'orbite précise pour des outils comme Ginan — Kshana répond à *quelle résilience apporte une
architecture PNT donnée* avant que vous ne disposiez de signaux réels, dans des formats que ces outils
ingèrent déjà (`--export-sp3`, ou `export_sp3 = true` dans un scénario `orbit`, écrit
`<scenario>.sp3`). La même orbite peut être publiée sous forme d'éléments moyens **CCSDS OMM**
du circuit de normalisation (`--export-omm`, ou `export_omm = true`, écrit `<scenario>.omm`) —
un message OMM 502.0 KVN (notation mot-clé = valeur) par satellite défini par TLE, portant le véritable
numéro de catalogue NORAD (North American Aerospace Defense Command), l'indicatif international COSPAR (Committee
on Space Research) et l'époque de chaque objet, pour tout
consommateur compatible OMM au lieu d'un jeu d'éléments à deux lignes ad hoc.

Exemple de sortie (holdover d'horloge — notez la façon dont les facteurs de mérite Intégrité et Sécurité sont indiqués) :

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

L'erreur de temps au 95e centile (p95) de l'horloge optique est de 1.20e-4 ns : le résumé
imprime les petites valeurs avec leurs chiffres significatifs plutôt que de les arrondir à `0.0`.
`security` indique `n/a (no attack)` parce que ce scénario ne configure aucune attaque, il n'y a donc
rien à détecter. Le résultat JSON porte tout de même la borne analytique de détectabilité du leurrage
de chaque horloge dans `fom.security` (0.997 pour l'horloge optique, 0.000 pour
l'horloge atomique à l'échelle d'une puce, dont le propre bruit sur la fenêtre de surveillance dépasse la
spécification de 20 ns), et son bloc `figure_tiers` marque ce chiffre `applicable: false`. Le type de scénario `spoof`
note la détection face à une attaque injectée. `figure_tiers` donne aussi
à chaque chiffre indiqué son niveau de vérification — VALIDATED (vérifié face à une référence externe)
ou MODELLED — et la ligne de la matrice de vérification d'où le niveau est lu. Le scénario d'orbite
indique en outre un bloc de géométrie — fraction des échantillons avec un point, et
meilleure/médiane dilution de précision de position (PDOP) et précision de position — à côté du
résultat d'horloge.

> **Lisez ces deux nombres avec attention.** `security` est une *borne analytique de détectabilité
> du leurrage* dérivée de la stabilité de chaque horloge — elle n'a de sens que face à un
> scénario de leurrage configuré et n'est **pas** un détecteur RAIM multi-satellite. `integrity`
> est ici l'*auto-cohérence* du filtre (fraction des échantillons de coupure à l'intérieur de sa propre borne
> à k sigma), **pas** un chiffre d'intégrité HPL/VPL aéronautique. Voir
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Pour une véritable intégrité autonome du récepteur, le **type de scénario `integrity`**
> (`scenarios/integrity-raim.toml`) exécute un véritable RAIM instantané et par séparation de solutions
> (de style ARAIM) sur la géométrie de la constellation propagée : il calcule les
> **niveaux de protection** horizontal/vertical **(HPL/VPL)** à chaque époque et indique la
> fraction des époques qui respectent les limites d'alerte configurées, avec un diagramme d'intégrité
> de Stanford pour la classification erreur face au PL (niveau de protection).

<a id="reproducible-study-artifacts"></a>
#### Artefacts d'étude reproductibles

Quatre études ouvertes régénèrent chacune un artefact déterministe à l'octet près (graine fixe) à partir d'une
seule commande — les chiffres derrière les études du croisement quantique face au classique, de l'écart d'optimisme
des dégradations RF, de la notation de la résilience PNT et du niveau de protection temporelle :

```bash
# Quantum-vs-classical resilience crossover map (writes paper/crossover/*.json):
cargo run --release --bin crossover_study -- paper/crossover

# RF-impairment optimism-gap study (13-detector panel, scaling laws, LOO predictor):
cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json

# Framework-aligned PNT-resilience scoring + decision-instability study:
cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json

# Conditional Timing Protection Level, calibrated on a real recorded spoof:
cargo run --release --example tpl_jammertest
```

Chaque artefact enregistre sa version du moteur, ses graines et une empreinte de configuration, et porte une étiquette
MODELLED/VALIDATED honnête. Les sondes sur données réelles (`*_probe`) exécutent le même pipeline sur
des enregistrements que vous fournissez localement ; aucun jeu de données n'est livré dans le dépôt. L'étude de l'écart d'optimisme
des dégradations RF est publiée dans la prépublication
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), et le niveau de protection temporelle
conditionnel (`tpl_jammertest` ci-dessus) dans la prépublication
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (voir [Citer](#cite)).

Les études de PNT lunaire publiées ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP avec balises de surface, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) observabilité
VLBI et [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) observabilité cislunaire selon la longueur
d'arc) voient leurs affirmations sur la géométrie, la dilution de précision, la prédiction en temps réel des référentiels /
paramètres d'orientation de la Terre (EOP), les orbites rétrogrades distantes et la télémétrie RF
contre-vérifiées de manière indépendante dans
`tests/validate_p*.rs` face à des références séparées (`scipy.special.j1`, une résolution DOP NumPy indépendante
`(HᵀH)⁻¹`, une réanalyse NumPy des mêmes lignes IERS `finals2000A`, et la
NASA/JPL Three-Body Periodic Orbit Database). Ce sont des vérifications de régression supplémentaires sur
la suite lunaire **modélisée** ; elles ne changent pas le décompte de la matrice vérifiée par machine.

</details>

<details>
<summary>Format des scénarios</summary>

<a id="scenario-format"></a>
### Format des scénarios

Les scénarios sont en TOML déclaratif. Un `kind` de niveau supérieur sélectionne le paquet — **cinquante** au
total (`clock` est la valeur par défaut s'il est omis) : `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (banc d'évaluation de la détection
des dégradations RF par IA/ML — corpus synthétique étiqueté + harnais ROC/AUC indépendant du détecteur +
écart d'optimisme dans/hors distribution), `quantum-trade` (arbitrage PNT quantique face
au classique avec ingestion d'ADEV mesurée + enveloppe de résilience sans GNSS ; MODELLED),
`space-weather` (indices solaires/géomagnétiques + température exosphérique de Jacchia-71 +
densité thermosphérique pilotée par l'activité par rapport à l'atmosphère statique ; MODELLED),
`oem-interop` (pont d'import/aller-retour CCSDS OEM pour les éphémérides GMAT/Orekit/STK ;
MODELLED), le trio d'analyse de mission `launch-window` (azimut de lancement à deux corps /
changement de plan / opportunités), `reentry` (corridor de rentrée balistique d'Allen-Eggers),
`eo-coverage` (géométrie de fauchée / GSD / accès / revisite d'observation de la Terre), `space-packet` (mise en trame
Space Packet CCSDS 133.0 TM/TC — télémesure/télécommande — disposition exacte des bits, vérifiée en aller-retour), et
`attitude-budget` (couple de gradient de gravité 3-DOF + budget d'erreur de pointage RSS),
`passes` (prédiction des passages lever/coucher au-dessus des stations sol — AOS/TCA/LOS, élévation maximale,
accès), et `link-budget` (équation de liaison CCSDS/DSN unidirectionnelle — FSPL / Eb·N₀ /
marge / bouclage) ; `telecom-timing` (erreur de temps en holdover, MTIE et TDEV vérifiés
face aux gabarits ITU-T) ; `spectrum` (toute la bande L GNSS sous forme d'une densité spectrale de puissance :
une cascade fréquence-temps sous une chronologie scénarisée de brouilleurs à onde continue, à bande étroite, à chirp ou
à bruit adapté, le rapport brouilleur sur signal par bande et la densité porteuse sur bruit
effective à partir du coefficient de séparation spectrale, et l'entrée et la sortie d'enregistrements Signal Metadata
Format (SigMF) avec des estimations spectrales de Welch ; les spectres
des signaux VALIDATED face aux valeurs des manuels, le scénario de brouillage MODELLED ; voir
[`docs/SPECTRUM.md`](docs/SPECTRUM.md) ; le même type dessine des panneaux de bandes UHF, S et C avec
des signaux conçus pour l'orbite terrestre basse) ; `leo-signal` (conceptions de signaux de positionnement, navigation et
temps en orbite terrestre basse pour n'importe quel système : spectres à bande limitée, gigue de poursuite de code et précision
de télémétrie, recherche et temps d'acquisition, séparation spectrale face à GPS et Galileo, tolérance
aux brouilleurs et arbitrage de la bande UHF à la bande C, à partir de préréglages publics tels que Xona Pulsar, Iridium,
Starlink et CentiSpace ou de conceptions en ligne ; les formes fermées et le Doppler LEO VALIDATED, les
conceptions MODELLED ; voir [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)) ; `solar-system` (le Soleil, les planètes, Pluton, la Lune et sept lunes
majeures à une époque — positions, constantes, temps de lumière et traces d'orbite ; positions des planètes
VALIDATED face à JPL Horizons) et `body-pnt` (positionnement autour de n'importe lequel de ces corps avec une
constellation de navigation locale et une liaison spatiale lointaine depuis la Terre ; MODELLED) ; `campaign` (des types existants composés en une chronologie de mission enchaînée
avec un état transmis entre les phases, un balayage de paramètres, un ensemble Monte-Carlo issu d'une graine, ou
plusieurs scénarios sous une même condition partagée ; MODELLED, voir
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)) ; `constellation-design` (motifs Walker delta et star,
listes d'éléments et conceptions multi-coquilles avec préréglages GPS, Galileo, BeiDou et GLONASS,
et couverture et dilution de précision sur une grille latitude/longitude ; le
générateur et la DOP mondiale GPS VALIDATED face aux documents de service publiés, voir
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)) ; `leo-pass` (un passage de satellite de positionnement, navigation
et temps (PNT) en orbite terrestre basse (LEO) et son bilan de liaison bande par
bande, à partir de n'importe quelle constellation et de n'importe quelle conception de signal : angles de visée, Doppler et taux de Doppler,
pluie, gaz, scintillation et perte de pénétration dans les bâtiments ITU-R, densité porteuse sur bruit face aux
satellites GNSS MEO en vue, l'ionosphère du premier ordre et les paires sans ionosphère, et un
budget de point à faible énergie, le sondage ionosphérique à partir de chaque paire de bandes, et des surveillances de leurrage par
cohérence du Doppler et de la géométrie du passage et par cohérence entre bandes ; les termes ITU-R et
l'enveloppe Doppler pour un utilisateur statique VALIDATED, le passage MODELLED, voir
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)) ; `leo-navmsg` (le message diffusé
d'éphéméride et d'horloge d'un satellite PNT en orbite terrestre basse (LEO), pour n'importe quelle orbite et
porteuse : un ajusteur d'une orbite de vérité intégrée vers le jeu képlérien Galileo, ce jeu
avec des polynômes de correction le long de la trace, transverses et radiaux, le modèle à 22 paramètres de Liu et al. 2025
ou le polynôme ECEF sans horloge ATOMIC ; erreur de distance du signal dans l'espace
(SISRE) en fonction de l'intervalle d'ajustement et de la période de mise à jour, une vérification de continuité de mise à jour en milieu de passage,
la trame binaire documentée propre à Kshana avec un contrôle de redondance cyclique CRC-24Q et un budget de quantification, et un
bloc de style RINEX-4 étiqueté comme extension Kshana ; les poids SISRE, l'algorithme utilisateur
Galileo et le CRC-24Q VALIDATED, les ajustements MODELLED ; préréglages facultatifs pour Xona Pulsar,
Iridium, Starlink, CentiSpace, un système représentatif en bande C, ATOMIC et Celeste IOD ; voir
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)) ; le trio **PNT fusionné MEO + LEO**
`leo-pvt` (positionnement Doppler à partir de la vitesse radiale en orbite terrestre basse (LEO), points conjoints
de pseudo-distances GNSS + LEO avec biais inter-systèmes et la DOP en fonction du nombre de satellites
LEO, couverture polaire et arctique, et transfert de temps LEO vers l'UTC — sur n'importe quelle constellation,
avec des préréglages facultatifs tels que les signaux d'opportunité Xona Pulsar, Iridium et Starlink ; l'enveloppe
Doppler LEO VALIDATED face aux chiffres publiés d'Iridium et de Xona), `leo-ppp`
(convergence du positionnement ponctuel précis avec GNSS seul et avec augmentation LEO, comparée
à Li et al. 2019) et `ntn-positioning` (positionnement par réseau non terrestre 5G à partir de la
borne de Cramér-Rao de la largeur de bande du signal), MODELLED à part cette enveloppe, voir
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md) ; `leo-pnt-chain` (un système LEO-PNT de bout
en bout : une conception `leo-signal` portée par une bande `leo-pass`, le C/N0 du passage et l'erreur de distance du signal dans l'espace
du message de navigation transmis à un point fusionné `leo-pvt` et à la convergence `leo-ppp`,
chaque transmission étant listée ; MODELLED, voir
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), qui est aussi la vue d'ensemble de
chaque type et scénario LEO-PNT, y compris les campagnes de résilience, un scénario par
domaine d'expérimentation et un par secteur d'utilisateurs finaux) ; la **suite PNT lunaire** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export` ; le **démonstrateur de PNT quantique**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect` ; et les
types de recherche **sécurité du signal, cislunaire et résilience en couches** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — le trio d'analyse de mission et ces types plus récents étant tous MODELLED
(chacun avec un cœur sous forme fermée validé ; voir la matrice).
Champs communs : `seed`, une grille `[time]`, une chronologie de disponibilité `[gnss]` (le moteur
de la coupure), et des blocs par capteur avec des chaînes `provenance` citant la source de chaque
chiffre. Exemple (horloge) :

```toml
seed = 42
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 7200.0
[gnss]
windows = [
  { t0 = 0.0,   t1 = 600.0,  state = "nominal" },  # 10 min GNSS sync
  { t0 = 600.0, t1 = 7200.0, state = "denied"  },  # ~1.8 h outage
]
[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15 (arXiv:1503.08457)"
y0 = 5.0e-17
q_wf = 1.0e-30   # white FM:  q_wf = sigma_y(1s)^2
q_rw = 0.0       # random-walk FM
drift = 0.0      # linear aging (per second)
[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)=3e-10"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
drift = 0.0
```

Champs facultatifs (désactivés en leur absence) : une horloge peut ajouter `flicker_floor` (plancher d'Allan en FM — modulation
de fréquence — 1/f) ; un capteur inertiel peut ajouter `gyro_bias` et `q_arw` (biais du gyromètre et marche
aléatoire angulaire), et `bias_instability` et `q_aa` (le plancher d'instabilité de biais d'Allan et la
marche aléatoire en accélération) — formant ensemble un **budget d'erreur d'accéléromètre
mono-axe (1-DOF)** (VRW/ARW — marche aléatoire en vitesse/angulaire — et instabilité de biais). C'est le budget d'erreur qu'exécute le
*paquet* de scénarios `inertial` livré. Séparément, la bibliothèque contient désormais un
**navigateur à composants liés 3 axes** vérifié (`src/inertial/{attitude,mechanization,imu_errors}.rs`) :
attitude par quaternion avec compensation de coning/sculling, une mécanisation NED complète
(termes de rotation terrestre et de transport, pesanteur de Somigliana WGS-84), et un
modèle d'erreur d'IMU déterministe dans lequel **le facteur d'échelle, le désalignement,
la sensibilité à g, la quantification et la rampe de vitesse sont modélisés** (IEEE Std 952-1997, la norme IEEE
de spécification et de procédures d'essai des gyromètres, §A.2 ; Groves 2013 §4.3). Cette voie 3 axes est désormais **raccordée à un paquet
GNSS/INS faiblement couplé exécutable** (`kind = "gnss-ins"`) : un EKF à état d'erreur à 15 états
discipline la solution à composants liés face à des points bruités tant que le GNSS est disponible, puis
traverse la coupure en roue libre, en indiquant l'erreur horizontale fusionnée face à la
roue libre de l'INS seule en boucle ouverte. Une mise à jour **sur pseudo-distances étroitement couplée** est aussi
disponible (elle forme l'innovation dans le domaine des distances, de sorte qu'elle continue de corriger
avec moins de quatre satellites). Un
scénario de holdover d'horloge peut ajouter `runs` (> 1) pour exécuter un **ensemble Monte-Carlo** — chaque
facteur de mérite est alors indiqué comme une moyenne avec une dispersion du 5e au 95e centile et le
graphique ombre la bande de confiance de l'erreur (voir `scenarios/clock-ensemble.toml`).

Un scénario `fusion` (mêmes blocs que `hybrid`) exécute **deux estimateurs de Kalman indépendants**
— l'un pour l'état d'horloge, l'autre pour l'état de position — disciplinés par le GNSS et assistés par
transfert de temps optique, et indique un FoM de holdover combiné. Les deux blocs ne partagent aucune
covariance croisée : il s'agit d'une paire empilée de budgets d'erreur, **pas** d'un véritable filtre conjoint
couplé horloge+position (la covariance croisée entre blocs figure dans la feuille de route). Voir
`scenarios/fusion-pnt.toml`.

Un scénario `spoof` injecte un leurrage temporel — l'un des quatre types `[attack.shape]`
(`linear_ramp`, `step_jump`, `meaconing`, `replay` ; un simple `rate_ns_per_s` est toujours
accepté comme rampe linéaire) — et exécute le détecteur de leurrage de chaque horloge. Le détecteur est un
**test d'énergie χ²₁ / de Neyman–Pearson** bilatéral sur la statistique de surveillance assistée par l'horloge :
le seuil est fixé à partir d'un budget de fausses alarmes cible `target_pfa`, et la
**probabilité de détection manquée `P_md`** est indiquée à la fois sous forme fermée et par
Monte-Carlo (`mc_runs` essais par hypothèse — les deux concordent à quelques ×1/√N près). Le
**facteur de mérite de sécurité est `1 − P_md`** à l'amplitude opérationnellement nuisible (spécification),
de sorte qu'une horloge peu bruitée qui détecte un leurrage de l'ampleur de la spécification obtient ≈ 1 et une horloge bruitée
qui le manque souvent obtient moins (voir `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Un scénario `gnss-sim` est une simulation dans le **domaine des mesures** : pour chaque satellite
visible, il synthétise la pseudo-distance `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` et le Doppler L1, avec l'ionosphère monofréquence de **Klobuchar**
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) et la troposphère zénithale de **Saastamoinen**
projetée par la fonction de projection de **Niell (1996)** (`[tropo]`). Les
résidus alimentent un **RAIM instantané** pour les HPL/VPL par époque, et la
pseudo-distance, le Doppler, le C/N₀ et les corrections iono/tropo de chaque satellite sont émis dans le tableau JSON
`gnss_measurements`. C'est un simulateur direct (il génère des mesures à partir
d'une vérité connue), pas un récepteur/solveur — une exécution sans bruit reproduit la géométrie plus les
corrections à moins d'un millimètre (voir `scenarios/gnss-sim-raim.toml`).

Un scénario `jamming` modélise l'interférence RF comme un **bilan de liaison** : un `[jammer]`
(position ECEF, `power_dbw` d'émission, type) élève le rapport brouilleur sur signal au niveau d'un
`[receiver]` qui observe une `[constellation]` Walker. À partir de la géométrie (affaiblissement en espace
libre et gain de l'antenne de réception par direction), il calcule le
`J/S` de chaque satellite, le **C/N₀ effectif** via l'équation anti-brouillage standard (gain de traitement
du désétalement × le facteur de séparation spectrale `Q` ; Kaplan & Hegarty §9.4), et
signale la perte de verrouillage sous un seuil de poursuite configurable — en indiquant un facteur de mérite
`availability_under_jamming`. Un brouilleur large bande de 10 W à 1 km
prive entièrement le récepteur (J/S ≈ 72 dB) ; le même brouilleur à 100 km ne fait que
dégrader les liaisons (voir `scenarios/jamming-demo.toml`).

Un scénario `sweep` exécute une **étude d'arbitrage** : il fait varier un `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` ou `classical_q_wf`) de `start` à `stop` sur `steps`
points selon une `scale` `lin` ou `log`, enregistre une `metric` (par ex. `holdover_s`) pour les deux
horloges, et trace les deux courbes. Le scénario de base se place sous `[base]` (voir
`scenarios/sweep-clock-stability.toml`).

Un scénario `sweep-nd` généralise cela à **n'importe quel paquet et n'importe quel nombre d'axes** : il
fait varier des clés TOML pointées d'un scénario `[base]` (de n'importe quel `kind`) sur le produit
cartésien des `[[axes]]`, réexécute chaque nœud de la grille, et enregistre des `metrics` données sous forme de
chemins JSON pointés dans le résultat (par ex. `classical.fom.holdover_s`). Il fonctionne pour
chaque paquet parce qu'il opère à la frontière TOML/résultat ; les exécutions natives évaluent
la grille en parallèle (sans dépendance supplémentaire, wasm se rabat sur le séquentiel) et la
sortie est déterministe et ordonnée par lignes (voir `scenarios/sweep-nd-inertial.toml`).

Un scénario `orbit` dérive la chronologie `[gnss]` de la géométrie au lieu de l'écrire
à la main — fournissez une orbite `[user]`, une `[constellation]`, un `mask_deg` d'élévation, et les deux
blocs d'horloge. Il indique aussi la précision de position à partir de la géométrie des satellites ; le
`sigma_uere_m` facultatif (erreur de distance équivalente utilisateur à 1 sigma, 1 m par défaut) met à l'échelle la
dilution de précision de position en un sigma de position. L'orbite de l'utilisateur peut être rendue
**excentrique** avec `eccentricity` et `argp_deg`, et `j2 = true` ajoute la dérive séculaire due à l'aplatissement
terrestre (voir `scenarios/orbit-molniya.toml`). La constellation peut aussi être une
**constellation réelle** : donnez à `[constellation]` un bloc `tle` de jeux d'éléments à deux lignes et les
satellites en sont extraits (voir `scenarios/orbit-real-tle.toml`). Ajoutez un ou plusieurs
blocs `[[constellations]]` pour le **multi-GNSS** (par ex. GPS + Galileo ; voir
`scenarios/orbit-multignss.toml`) :

```toml
kind = "orbit"
seed = 7
threshold_ns = 5.0
mask_deg = 10.0
sigma_uere_m = 1.0           # optional; position sigma = position-DOP * this
[time]
step_s = 60.0
duration_s = 86400.0
[user]                       # spacecraft (altitude in km, angles in deg)
altitude_km = 8000.0
inclination_deg = 0.0
[constellation]              # Walker-delta GNSS (GPS-like)
altitude_km = 20180.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 1.0
[clock_quantum]  # ... as above
[clock_classical]  # ... as above
```

Les types **alt-PNT sans GPS** naviguent sans aucun GNSS, en faisant correspondre une séquence de champ
mesurée avec une carte au moyen d'un filtre particulaire. Un scénario `gravity-map` suit une trace
à travers un champ d'anomalies de gravité en harmoniques sphériques et la retrouve à partir de la lecture d'un
gravimètre à atomes froids (`scenarios/gps-denied-gravity-nav.toml`) ; un scénario `terrain-nav`
fait de même face à un MNT d'altitude SRTM (TERCOM/SITAN, `scenarios/terrain-nav.toml`) ;
et un scénario `combined-altpnt` fusionne **gravité + magnétisme IGRF + terrain** dans un seul filtre
(`scenarios/combined-altpnt.toml`).

Un scénario `lunar-integrity` évalue le PNT **cislunaire** : il exécute un passage de niveau de protection ARAIM
au pôle sud lunaire face à un ensemble de relais LunaNet/LNIS et indique honnêtement
l'écart d'intégrité — un σ_URE lunaire de ~30 m porte le niveau de protection bien au-dessus d'une limite
d'alerte de 50 m, de sorte que le service est *indisponible* selon des règles d'intégrité de type aéronautique
(`scenarios/lunanet-araim.toml`).

Un scénario `lunar-time-offset` indique le **taux relativiste d'horloge Terre–Lune** — la
base d'une échelle de temps coordonné lunaire (LTC/TCL). Une identité post-newtonienne
issue des premiers principes additionne la différence d'auto-potentiel (potentiel du géoïde IAU `L_G` moins
l'auto-potentiel à la surface de la Lune) et le terme cinétique de la Lune (Doppler du second ordre) pour obtenir un taux
séculaire d'environ 57 µs/jour, indiqué avec la bande publiée de 56–59 µs/jour ; il donne aussi
le décalage LTC−TT accumulé sur un horizon et un ensemble à variance inverse (une horloge
papier lunaire). **MODELLED** — le chiffre principal *dépend de la référence* (géoïde terrestre
face au sélénoïde lunaire, fenêtre de moyennage), c'est pourquoi une bande, et non un nombre unique certifié,
est indiquée (`scenarios/lunar-time-offset.toml`).

Voir `scenarios/` pour au moins un exemple complet de chaque type (92 types, 193 fichiers de scénarios
`.toml` + 1 manifeste de suite — plusieurs types livrent plus d'un exemple). Tous les
types n'ont pas un fichier portant leur nom : `lunar-integrity` → `scenarios/lunanet-araim.toml` et
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` en sont deux parmi plusieurs.
Listez à tout moment les types pris en charge par le répartiteur avec les erreurs de `cargo run -- --validate <file>`,
le `list_kinds()` de Python ou l'outil MCP `list_scenario_kinds`.

</details>

<details>
<summary>Sorties</summary>

### Sorties

L'artefact de résultat est un JSON versionné et autodescriptif : séries temporelles par pas, les
facteurs de mérite notés, les spécifications des modèles actifs (avec leur provenance), la graine, une
**empreinte du scénario** — de sorte que tout graphique peut être reproduit à partir du fichier — et, pour chaque horloge,
une `adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`) : l'écart d'Allan
avec recouvrement sur des temps de moyennage espacés par octaves — la façon standard de lire la stabilité
d'une horloge — désormais avec une **bande de confiance à 95% propre au type de bruit** par point (le type
de loi de puissance de l'enregistrement est identifié à partir de sa pente d'Allan modifiée, et l'intervalle χ² utilise les
degrés de liberté effectifs NIST SP 1065 correspondants). Le bac à sable du navigateur le rend sous forme d'un
graphique log-log « Clock stability (ADEV) ». (MDEV, TDEV et HDEV sont disponibles comme estimateurs
de la bibliothèque ; la courbe de résultat exportée est l'ADEV avec recouvrement.) Chaque champ, avec ses unités et un
pointeur vers sa source, est documenté dans [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Chaque graphique est autodescriptif.** Le bac à sable du navigateur, l'export `*.chart.svg` de la CLI
et la fiche de résultats HTML (HyperText Markup Language) apposent tous sur chaque image de graphique un pied de page indiquant
`Kshana v<version> · scenario <hash> · kshana.dev`. Le `scenario <hash>` est constitué des 12 premiers
caractères hexadécimaux de l'**empreinte du scénario** de l'exécution — un condensé SHA-256 (le Secure Hash Algorithm à 256 bits) de la définition
canonique du scénario (graine, seuils, paramètres des modèles, fenêtres GNSS, …) ; les rapports d'intégrité et lunaires,
qui ne portent pas d'empreinte propre, se rabattent sur un SHA-256 de la source du scénario.
C'est la **même empreinte** que celle affichée dans le résumé en une ligne et dans le JSON de résultat, de sorte qu'un
graphique enregistré ou collé porte toujours sa version, le scénario exact qui l'a produit (pour une
reproduction bit à bit), et la source — modifiez n'importe quelle entrée et l'empreinte change.

Les facteurs de mérite suivent les facteurs de mérite opérationnels PNT standard :

| Facteur de mérite | Comment Kshana le calcule |
|-----------------|------------------------|
| Performance temporelle (paquets horloge/orbite) | RMS + 95e centile de l'erreur de phase de l'horloge sur la coupure, en **nanosecondes** (`timing_rms_ns`) — une métrique de temps, pas de position |
| Performance de positionnement (paquets inertiel/hybride) | RMS + 95e centile de l'erreur de position 1-DOF sur la coupure, en **mètres** (`pos_rms_m`) ; mono-axe. Une exécution unique est marquée `monte_carlo: false` ; définissez `runs = N` pour un ensemble Monte-Carlo qui indique la moyenne, la dispersion et l'IC (intervalle de confiance) bootstrap à 95% de chaque métrique. Toujours **pas** un CEP/2DRMS 2D (erreur circulaire probable / deux fois la distance en moyenne quadratique) ni une précision pondérée par la DOP (ceux-ci nécessitent le modèle 3 axes — feuille de route) |
| Autonomie | durée de holdover — temps dans la spécification après la perte du GNSS (quantifié par la grille : une borne inférieure) |
| Résilience | pente de croissance de l'erreur pendant la coupure |
| Disponibilité | fraction de l'exécution avec une solution dans la spécification |
| Intégrité | **auto-cohérence** du filtre — fraction des échantillons de coupure dont l'erreur reste à l'intérieur de la propre borne à k sigma du filtre de Kalman. **Pas** un chiffre d'intégrité HPL/VPL/RAIM aéronautique (voir [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Sécurité | **borne analytique de *détectabilité* du leurrage** à partir de la stabilité de l'horloge — à quel point un leurrage temporel peut être petit/lent tout en étant signalé par une surveillance de cohérence à horloge unique. N'a de sens qu'avec une attaque configurée ; **pas** un détecteur RAIM multi-satellite |

Nouveau dans ces termes ? Chacun est défini en langage clair dans le [glossaire](docs/GLOSSARY.md).

</details>

<details>
<summary>Organisation du dépôt</summary>

### Organisation du dépôt

```
kshana/
├── src/                                       # the kshana core crate (library + CLI)
│   ├── api.rs · main.rs · lib.rs              # typed dispatch (92 kinds) + CLI + crate root
│   ├── python.rs · wasm.rs                    # optional PyO3 / wasm-bindgen bindings
│   ├── types.rs · scenario.rs · allan.rs      # shared core (time grid, GNSS timeline, Allan)
│   │
│   ├── models.rs · estimator.rs · kalman.rs   # Pack 1 — clock holdover + integrity
│   ├── security.rs · detection.rs · spoof.rs · spoof_monitors.rs  # spoof detection
│   ├── filter_health.rs · fom.rs · fom_label.rs · report.rs · chart.rs · run.rs  # health · FoM scoring + labelling · output
│   ├── suite.rs · study.rs                     # scenario suites + aggregated multi-scenario study artifacts (`--study`)
│   ├── inertial/                              # Pack 2 — strapdown INS (attitude · mechanization · imu_errors · quantum_imu)
│   ├── timetransfer.rs · timetransfer_adv.rs · timegeo.rs  # Pack 3 — TWSTFT/CV/PPP/optical, Sagnac
│   ├── hybrid.rs · ensemble.rs · sweep.rs     # Pack 4 — fused PNT, Monte-Carlo, trade sweeps
│   │
│   ├── timescales.rs · jd2.rs · ephem.rs      # time systems, two-part JD, Sun/Moon ephemeris
│   ├── precession.rs · nutation.rs · cio.rs   # IAU 2006/2000A precession-nutation + CIO GCRS↔ITRS
│   ├── frames.rs · *_data.rs                  # TEME↔ECEF + generated nutation/CIO/EGM2008/IGRF tables
│   │
│   ├── orbit.rs · sgp4.rs · tle.rs · walker.rs   # geometry, SGP4/SDP4, TLE, Walker design
│   ├── propagator.rs · forces.rs · gravity_sh.rs · integrator.rs  # Cowell + perturbations (EGM2008 d/o70, GR) + RK4/DOPRI
│   ├── maneuver.rs · batch_ls.rs · orbit_determination.rs  # burns/Lambert/porkchop, Gauss-Newton, OD
│   ├── cr3bp.rs · lunar.rs · lunar_frame.rs · lunar_od.rs  # Earth–Moon CR3BP + halo/NRHO STM corrector, cislunar/LunaNet ARAIM, MCI↔MCMF, lunar OD
│   ├── lunar_time.rs · lunar_vlbi.rs · lunar_combination.rs · lunar_frame_realise.rs · lunar_service.rs · lunar_dpnt.rs · lunar_interop.rs  # tiers per piece in the matrix lunar PNT suite — LTC time · geodetic VLBI · joint OD+clock · frame realisation · Moonlight service-volume · differential PNT · LunaNet/IOAG interop export
│   ├── body.rs · mars_frame.rs · ephem_provider.rs · radiometric.rs · ccsds_tdm.rs  # deep-space: multi-body · Mars frame · ephemeris seam · radiometric obs + CCSDS-TDM
│   ├── deepspace_od.rs · clock_state.rs · mars_atmos.rs · mars_pnt.rs · linkbudget.rs · gse_sim.rs  # SRIF OD · onboard clock · Mars drag · relay-PNT · link budget · GSE sim
│   │
│   ├── fusion/                                # GNSS/INS — EKF · UKF · tightly_coupled(17) · coupled · closed_loop
│   ├── raim.rs · sbas.rs                      # RAIM/ARAIM HPL/VPL, SBAS DO-229E PLs + L1/L5 iono-free
│   ├── gnss_sim.rs · ionex.rs · pvt.rs · jamming.rs  # measurement domain · ionosphere maps · single-point positioning · jamming
│   ├── navsignal.rs                            # nav-signal PSD (BPSK-R/BOC) · spectral-separation → anti-jam Q · DLL code-tracking jitter · multipath envelope
│   ├── gravimeter.rs · igrf.rs · mapmatch.rs · particle_filter.rs · altpnt/  # gravity/magnetic/terrain alt-PNT
│   ├── rinex.rs · rinex_obs.rs · glonass.rs · sp3.rs · oem.rs · omm.rs · permalink.rs  # interop formats
│   ├── launch.rs · reentry.rs · eo_payload.rs · attitude_budget.rs · passes.rs · space_packet.rs  # mission-analysis budgets + CCSDS Space Packet
│   ├── space_weather.rs · holdover.rs · tpl.rs   # space-weather environment · GNSS-denied clock-holdover calculator · conditional Timing Protection Level (under spoofing)
│   ├── resilience/                              # framework-aligned PNT-resilience scoring + decision-instability study (RPCF · Dirichlet · Kendall-τ · diversity collapse · assurance report)
│   ├── impairment_eval.rs · impairment_study.rs · impairment_ml.rs · eval_stats.rs  # AI/ML RF-impairment eval testbed · optimism-gap study · LR/MLP detectors · bootstrap/DeLong/Spearman stats
│   ├── sdr.rs · realdata/                       # software-defined-receiver front end (IQ/IF → E/P/L taps → SQM) + real-data ingest adapters (RINEX · UBX · GnssLogger · JammerTest · Yunnan · SatGrid)
│   ├── crossover.rs · quantum_trade.rs · frugal.rs · integrity_impact.rs  # quantum-vs-classical crossover map · PNT trade · cost-per-coverage ROI · integrity impact
│   ├── quantum_devices.rs · quantum_faults.rs · quantum_nav_od.rs · qtrade.rs · timetransfer_chain.rs · representativeness.rs  # Quantum-Enabled PNT demonstrator — device error models · fault catalogue · GNSS-free quantum OD · unified trade harness · quantum time-transfer chain · representativeness / gaps-to-flight ledger
│   ├── interchange.rs · verification.rs          # KIF artifact envelope · machine-checked verification matrix
│   └── bin/crossover_study.rs · bin/validation_report.rs  # crossover-study artifact generator · release validation-summary HTML
│
├── mcp/kshana-mcp/        # standalone, workspace-EXCLUDED crate — the MCP server (+ Dockerfile, server.json)
├── ide/jetbrains/         # standalone Kotlin/Gradle IntelliJ-Platform plugin
├── xval/                  # standalone, workspace-EXCLUDED external cross-checks: anise-{frames,lunar-od,mars-od,service-geometry} (Rust ANISE/SPICE DE440) + orekit-passes (Java Orekit)
│
├── examples/            # reproducible study generators: tpl_jammertest · resilience_report · optimism_study + real-data probes (jammertest_probe · yunnan_probe · satgrid_probe · texbat_probe · ingest_realdata)
├── paper-artifacts/     # byte-deterministic study artifacts, regenerable from examples/ (optimism-study.json · resilience-study.json); raw datasets stay out
├── scenarios/            # one cited .toml per kind + geometry-driven + GPS-denied
├── scripts/              # reproducibility + repo-hygiene + SBOM guards
├── docs/                 # CONCEPTS, ARCHITECTURE, CAPABILITY, VALIDATION, PROVENANCE, GLOSSARY, …
├── web/                  # the WebAssembly playground + kshana.dev site
├── tools/                # table generators (EGM2008 · IGRF · nutation · CIO) + fetch_tles.sh
├── .github/workflows/    # ci · release · publish · wheels · pages · mcp-publish · jetbrains-plugin · frame-xval
├── pyproject.toml        # Python packaging (maturin)
├── CHANGELOG.md          # Keep a Changelog + SemVer
└── CITATION.cff · ROADMAP.md · CONTRIBUTING.md · SECURITY.md
```

</details>

<details>
<summary>FAQ (questions fréquentes)</summary>

### FAQ

**Dois-je comprendre la physique quantique pour utiliser ceci ?**
Non. Si vous savez exécuter une ligne de commande, vous savez exécuter Kshana. Commencez par
l'[introduction en langage clair](docs/CONCEPTS.md) ; cherchez les termes dans le [glossaire](docs/GLOSSARY.md).

**S'agit-il d'une conception de matériel quantique ou d'un logiciel de vol ?**
Non. C'est un *simulateur* de performances. La fidélité du matériel quantique provient de modèles
d'erreur publiés, pas de cet outil. Voir [Ce que c'est / ce que ce n'est pas](#what-it-is--is-not).

**Les résultats quantiques sont-ils réalistes, ou du marketing ?**
Chaque paramètre est cité d'après une fiche technique ou un article, chaque modèle est validé face à une
relation de manuel, et la maturité est étiquetée honnêtement dans
[VALIDATION.md](docs/VALIDATION.md) — y compris le fait qu'aucune horloge optique au strontium n'a
volé. Le moteur est neutre : quantique et classique sont le même code avec des chiffres
publiés différents.

**Puis-je compter sur l'accord de deux exécutions ?**
Oui — les exécutions sont déterministes : `scenario + seed + engine version → bit-identical output`,
imposé par `scripts/check-reproducible.sh`.

**Puis-je l'utiliser depuis Python ou dans un navigateur ?**
Oui — voir [Installation](#install) : les exemples Python et WebAssembly s'y trouvent. Tous deux appellent le même moteur.

**Comment modéliser mon propre capteur ?**
Écrivez un scénario `.toml` avec les chiffres publiés de votre capteur dans les champs
`provenance`. Voir [Format des scénarios](#scenario-format) et les exemples dans `scenarios/`.

**Est-il gratuit pour un usage commercial ?**
Oui — sous AGPL-3.0, y compris dans un cadre commercial, tant que vous respectez le
copyleft de l'AGPL (notamment : si vous modifiez Kshana et le proposez via un réseau, vous devez
proposer à ces utilisateurs votre source modifiée). Si cela ne vous convient pas — par ex. si vous devez
intégrer Kshana dans un produit propriétaire ou exploiter un service réseau fermé — une licence
commerciale est disponible auprès d'Ashforde® OÜ ; voir [`LICENSING.md`](LICENSING.md) et
[Support](#support--professional-services).

</details>

<details>
<summary>Dépannage</summary>

### Dépannage

**`cargo build` échoue avec une ancienne chaîne d'outils.** Kshana nécessite Rust ≥ 1.88. Mettez à jour avec
`rustup update`.

**La compilation de l'extension Python échoue à l'édition de liens sous macOS** (`Undefined symbols … _Py…`).
Une extension Python résout ses symboles au chargement. `maturin` définit automatiquement la bonne option
de l'éditeur de liens — utilisez `maturin develop --features python` plutôt qu'un simple
`cargo build`.

**La compilation Python se plaint que l'interpréteur est plus récent que ce que PyO3 connaît.** Définissez
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (les wheels abi3 sont compatibles vers l'avant entre
versions de CPython).

**La compilation WebAssembly ne trouve pas la cible.** Installez-la une fois avec
`rustup target add wasm32-unknown-unknown`, puis `wasm-pack build --target web -- --features wasm`.

**Où est passée ma sortie ?** Chaque exécution écrit `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` et `<scenario>.report.json` à côté
du `.toml` d'entrée, ainsi que
`<scenario>.table.csv` pour les types qui publient une table. Tous sont
ignorés par git à dessein.

</details>

<details>
<summary>Gestion des versions et publications</summary>

### Gestion des versions et publications

Kshana suit le [Semantic Versioning](https://semver.org). Avant la 1.0, le schéma public
de scénario/résultat peut encore changer ; les changements incompatibles sont signalés explicitement dans
le [`CHANGELOG.md`](CHANGELOG.md). Chaque résultat est reproductible à partir de
`scenario + seed + engine version`.

**Chaque étiquette `vX.Y.Z` publie automatiquement tous les canaux, dans un ordre unique** — la suite de tests
complète s'exécute d'abord sur le commit étiqueté, rien n'est publié avant qu'elle ne réussisse, et
ensuite le pipeline vérifie que chaque registre sert réellement la nouvelle version
([`docs/RELEASING.md`](docs/RELEASING.md)). Les canaux :

| Canal | Installer / obtenir | Contenu |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | bibliothèque Rust + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | le serveur MCP |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | wheels abi3 (Linux/macOS/Windows) + sdist (distribution des sources) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | module WebAssembly + enveloppe JS |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | image OCI (Open Container Initiative) multi-architecture — aucune chaîne d'outils nécessaire |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | lanceur : télécharge le binaire de la version, vérifie `SHA256SUMS`, l'exécute |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | le même lanceur pour Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | le binaire `kshana-mcp`, généré à partir du `SHA256SUMS` de chaque version |
| Claude Desktop | double-cliquez sur `kshana-mcp-<target>.mcpb` issu de la version | l'extension, avec le binaire à l'intérieur |
| registre MCP officiel | découvert automatiquement par les clients MCP | `io.github.ashfordeOU/kshana-mcp` (image OCI, paquets npm et PyPI) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → rechercher « Kshana » | le plugin d'IDE **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | téléchargement | le binaire en ligne de commande `kshana` pour Linux x86-64, macOS (Apple silicon et Intel) et Windows x86-64, le binaire `kshana-mcp` pour chacun de ces systèmes et pour Linux Arm, une extension Claude Desktop `.mcpb` par système, un **SBOM** CycloneDX, la provenance de compilation **SLSA**, un résumé de validation HTML et un fichier de sommes de contrôle `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | une archive citable de chaque version |
| [kshana.dev](https://kshana.dev) | ouvrir dans un navigateur | Kshana Studio, l'application WebAssembly dans le navigateur, recompilée à partir de chaque étiquette de version (de sorte que la version qu'elle affiche est celle qu'elle exécute) |

La version de la crate / de l'image / du registre du serveur MCP suit celle du moteur (il embarque la
bibliothèque) ; le plugin JetBrains a ses propres versions (il appelle le binaire
`kshana` que vous avez installé).

</details>

<details>
<summary>Feuille de route</summary>

### Feuille de route

Voir [`ROADMAP.md`](ROADMAP.md) pour la feuille de route par phases, [`CHANGELOG.md`](CHANGELOG.md)
pour l'historique des versions publiées, et [`docs/CAPABILITY.md`](docs/CAPABILITY.md) pour la
feuille de route par capacité. L'ordre de priorité est : **d'abord les preuves de temps et de holdover pour
les infrastructures critiques** (gabarits télécoms, holdover plus long avec vieillissement et bruit de
scintillation, ingestion de données d'horloge mesurées) ; **ensuite la méthode neutre d'arbitrage quantique face au classique**
(résultats étiquetés MODELLED jusqu'à ce que les données mesurées d'un partenaire les promeuvent) ; et
**la navigation lunaire / cislunaire et en espace lointain maintenue**, sans être étendue en priorité. La **réduction de référentiel précise à l'ITRF** est désormais livrée — la
chaîne complète GCRS↔ITRS IAU 2006/2000A fondée sur le CIO (mouvement du pôle + nutation inférieure à la seconde d'arc),
validée bit à bit face à SOFA/ERFA et contre-vérifiée de manière indépendante face à ANISE
(SPICE en Rust pur) à ≤ 3.6 m à l'orbite GNSS. Les éléments à court terme comprennent la fusion étroitement couplée par phase de la porteuse et l'extension
du navigateur GNSS/INS faiblement/étroitement couplé à davantage de paquets ; le moteur de **navigation radiométrique
en espace lointain / martienne** est arrivé dans la v0.17.0 (validé par simulation). La
**couche de physique quantique** est un élément **P2** : l'accéléromètre CAI est désormais simulé à partir des
premiers principes (phase de Mach–Zehnder, bruit de projection, décroissance du contraste, couplage
aux vibrations), tandis que les capteurs d'horloge/de transfert de temps sont toujours pilotés par des
coefficients d'Allan / de budget de bruit publiés. TEME&harr;ECEF fondé sur le GMST, les systèmes de temps IERS
avec secondes intercalaires (UTC/TAI/TT/UT1), la propagation d'orbite SGP4/SDP4 (v0.7.0,
validée face aux vecteurs AIAA 2006-6753) et le paquet de fusion exécutable `gnss-ins`
ont tous été **livrés**, et la vitesse inertielle est exposée en aval. Un détecteur actif
stochastique de leurrage temporel (test d'énergie de Neyman–Pearson / χ²₁ avec P_fa/P_md
par Monte-Carlo et un FoM de sécurité de 1−P_md), un modèle de brouillage par bilan de liaison (J/S → C/N₀
effectif → perte de verrouillage), la disponibilité multi-constellation, un budget d'erreur d'IMU
mono-axe (1-DOF), deux estimateurs de Kalman indépendants (horloge + position) indiqués comme un
FoM combiné, la géométrie réelle des constellations à partir des TLE, un rapport sous forme de fiche de résultats HTML,
la disponibilité GNSS dérivée de la géométrie
*et* la dilution de précision à partir d'orbites képlériennes avec excentricité et dérive J2,
les bandes de confiance Monte-Carlo, les balayages de paramètres d'études d'arbitrage, un bac à sable WebAssembly
dans le navigateur, et des liaisons facultatives Python (PyO3) et WebAssembly (wasm-bindgen) ont
été intégrés à `main`.

</details>

<details>
<summary>Contribuer</summary>

### Contribuer

Voir [`CONTRIBUTING.md`](CONTRIBUTING.md). En bref : les tests passent (`cargo test`), les
deux scripts de garde passent, Conventional Commits, et une entrée `CHANGELOG.md` `[Unreleased]`
pour chaque changement visible par l'utilisateur. La participation est régie par notre
[Code de conduite](CODE_OF_CONDUCT.md). Pour signaler un problème de sécurité, voir la
[Politique de sécurité](SECURITY.md) — veuillez ne pas ouvrir de ticket public pour les vulnérabilités.

</details>

<details>
<summary>Documentation : chaque document, et à qui il s'adresse</summary>

<a id="documentation"></a>
### Documentation

| Document | Pour qui | Ce qu'il contient |
|----------|----------|--------------|
| [Introduction aux concepts](docs/CONCEPTS.md) | tout le monde, commencez ici | ce que fait Kshana et pourquoi, de zéro jusqu'à la physique |
| [Kshana Studio](web/README.md) | tout le monde | exécuter le moteur dans votre navigateur (WebAssembly) ; notes de compilation et de déploiement |
| [Glossaire](docs/GLOSSARY.md) | tout le monde | définitions en langage clair de chaque terme |
| [Types de scénarios](docs/KINDS.md) | tout le monde | chaque type que le moteur prend en charge : ce qu'il fait, ses champs, un exemple de commande, ses lignes du registre et le graphique que le moteur écrit pour lui |
| [Données des partenaires](docs/PARTNER-DATA.md) | laboratoires et fabricants détenant des données mesurées | quelles lignes MODELLED un enregistrement mesuré d'horloge ou d'IMU pourrait promouvoir, les formats, comment une soumission est vérifiée (`kshana partner check`), notée et créditée |
| [Architecture](docs/ARCHITECTURE.md) | développeurs / relecteurs | carte des modules, pipeline du moteur, répartition et diagrammes |
| [État de la validation](docs/VALIDATION.md) | relecteurs / personnes qui citent | ce qui est `validated` face à `not modeled`, avec les preuves |
| [Matrice de vérification](docs/VERIFICATION-MATRIX.md) | relecteurs / personnes qui citent | le registre de preuves vérifié par machine — chaque ligne de capacité avec son état, son module, son test et sa référence externe, généré à partir de `src/verification.rs` |
| [Justification des lignes Modelled](docs/MODELLED-RATIONALE.md) | relecteurs | pourquoi chaque ligne **Modelled** n'a pas de référence externe, énoncé ligne par ligne |
| [Provenance](docs/PROVENANCE.md) | relecteurs / personnes qui citent | chaque paramètre de capteur, modèle et jeu de données rattaché à sa source publiée, dans un tableau citable |
| [Reproductibilité et provenance](docs/REPRODUCIBILITY.md) | relecteurs / empaqueteurs | garanties de déterminisme, figement des références, SBOM (nomenclature logicielle), provenance de compilation |
| [Étiquettes de plateforme des wheels](docs/WHEEL_TAGS.md) | empaqueteurs | la matrice des wheels Python abi3 — quelle étiquette de plateforme `pip install kshana` résout |
| [Positionnement](docs/POSITIONING.md) | évaluateurs | où se situe Kshana par rapport à RTKLIB/gLAB (complémentaire), et le niveau navigateur sans installation |
| [Kshana Pro](docs/PRO.md) | évaluateurs / responsables de programme | ce qu'ajoute la surcouche propriétaire Pro au même moteur : optimiseur de conception, incertitude et sensibilité, dossier de mission, surveillance de campagne, coexistence spectrale, service de tâches sur site, traçabilité des exigences ; ce que chacun produit et ce qu'il ne fait pas |
| [Rapport technique](paper/kshana-technical-report.md) · [Article JOSS](paper/paper.md) | relecteurs / personnes qui citent / évaluateurs | l'article de recherche étendu complet — architecture, modèles par domaine, validation, études de cas et limites — plus la soumission concise au JOSS (Journal of Open Source Software) |
| [Validation SGP4](docs/SGP4-VALIDATION.md) | relecteurs / personnes qui citent | concordance avec la référence AIAA 2006-6753 (666 états, ~4 mm) **et** une comparaison directe avec la crate indépendante `sgp4` (concordance inférieure au micron / 4.12 mm) |
| [Validation du modèle de forces](docs/AGENCY-ORBIT-VALIDATION.md) | relecteurs / personnes qui citent | le moteur à forces complètes (`src/precise_od.rs`) ajusté aux éphémérides des agences — méthodologie et résidus validés |
| [Guide des TLE réels](docs/REAL_TLE_GUIDE.md) | utilisateurs | piloter des scénarios à partir de TLE de constellations réelles Celestrak / Space-Track (par rapport à l'ensemble Walker synthétique fourni) |
| [FoM d'intégrité](docs/INTEGRITY.md) | évaluateurs | ce que signifient les chiffres `integrity` / `security` — et ce qu'ils ne sont **pas** par rapport aux HPL/VPL aéronautiques |
| [Référence ARAIM](docs/ARAIM_REFERENCE.md) | relecteurs / intégrateurs | l'implémentation ouverte du niveau de protection ARAIM MHSS — la projection de biais nominal `b_k`, σ_URA face à σ_URE, et les probabilités a priori des modes de défaillance |
| [Modèles quantiques](docs/QUANTUM.md) · [détails](docs/QUANTUM-MODELS.md) | relecteurs | la couche physique de l'interféromètre à atomes froids, et les endroits où les coefficients sont encore tirés de tables |
| [Conformité](docs/COMPLIANCE.md) | évaluateurs | périmètre des algorithmes DO-229E / DO-316, et ce qui n'est **pas** une revendication de conformité |
| [Confiance maritime](docs/MARITIME-TRUST.md) | navigateurs / intégrateurs | le score de confiance GNSS de 0 à 100 pour le NMEA d'un navire, ses surveillances et ses limites (à titre consultatif, pas un équipement de navigation homologué) |
| [Flux d'entraînement NMEA](docs/NMEA-TRAINING.md) | formateurs maritimes | NMEA de passerelle synthétique avec brouillage et leurrage scénarisés et un journal d'instructeur ; texte seulement, jamais pour la navigation en service |
| [Carte des interférences](docs/INTERFERENCE-MAP.md) | analystes / navigateurs | où des aéronefs et des navires ont signalé des données de navigation dégradées, et quelle part d'une route cela touche |
| [Paquets de preuves](docs/EVIDENCE-PACKS.md) | opérateurs / assureurs | enregistrements techniques signés d'un événement de confiance et comment en vérifier un |
| [Télémétrie de confiance](docs/TRUST-TELEMETRY.md) | équipes d'exploitation / de sécurité | le flux de confiance sous forme de métriques Prometheus, d'événements SIEM et d'OpenTelemetry, avec un tableau de bord Grafana |
| [Intégrations marines](docs/MARINE-INTEGRATIONS.md) | propriétaires de bateaux / intégrateurs | le plugin Signal K, le mode passerelle OpenCPN et la configuration de référence |
| [Banc d'essai](docs/TEST-BENCH.md) | fabricants de récepteurs | rejouer un scénario exporté à travers un simulateur de laboratoire et noter le journal du récepteur |
| [Correspondance de conformité](docs/compliance/README.md) | évaluateurs | cadres publics de résilience mis en correspondance avec les sorties de Kshana, avec sources et écarts ; `kshana compliance-report` |
| [Notebooks](notebooks/README.md) | utilisateurs | tutoriels exécutables avec leur texte rendu |
| [Normes et interopérabilité](docs/STANDARDS.md) | intégrateurs | les formats d'échange GNSS / dynamique du vol / agences que Kshana lit et écrit (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [Fusion PNT LEO](docs/LEO-PNT-FUSION.md) | utilisateurs / évaluateurs | positionnement, navigation et temps fusionnés MEO + LEO : Doppler, pseudo-distance conjointe, convergence PPP, NTN 5G, couverture polaire et transfert de temps LEO sur n'importe quelle constellation ; les préréglages facultatifs et leurs sources publiques |
| [Campagnes](docs/CAMPAIGNS.md) | utilisateurs / évaluateurs | composer des scénarios : chronologies de mission enchaînées, balayages de paramètres, ensembles Monte-Carlo et exécutions à condition partagée, avec les identités de composition que figent les tests |
| [Catalogue des scénarios](docs/SCENARIOS.md) | utilisateurs / intégrateurs | chaque type pris en charge avec ses champs TOML obligatoires et facultatifs — généré à partir de `api::list_scenario_kinds()` |
| [Schéma des résultats](docs/SCHEMA.md) | intégrateurs | chaque champ du JSON de résultat, avec ses unités et un pointeur vers sa source |
| [API Python](docs/PYTHON_API.md) | utilisateurs de Python | l'interface de liaison PyO3 — appeler le moteur, les types de scénario/résultat, et des exemples |
| [Affirmations face à la réalité](docs/CLAIMS-VS-REALITY.md) | relecteurs | le registre de résorption des affirmations excessives + le garde-fou CI (`tests/no_overclaims.rs`) qui le maintient résolu |
| [Feuille de route](ROADMAP.md) | tout le monde | la feuille de route par phases — ce qui a été livré et ce qui vient ensuite |
| [Serveur MCP](mcp/kshana-mcp/README.md) · [Plugin JetBrains](ide/jetbrains/README.md) | agents / utilisateurs d'IDE | exécuter Kshana depuis un assistant d'IA ou un IDE JetBrains |
| [Guide des agents](docs/AGENTS.md) · [Interfaces](docs/SURFACES.md) | agents / intégrateurs | quel outil répond à quelle question, ce qu'il faut conserver avec chaque réponse ; où chaque capacité est accessible (CLI, Rust, Python, WASM, MCP, plugin, JetBrains, notebooks) et pourquoi une cellule est N/A |
| [Journal des modifications](CHANGELOG.md) | tout le monde | historique des versions publiées (Keep a Changelog + SemVer, Semantic Versioning) |
| [Contribuer](CONTRIBUTING.md) | contributeurs | compilation, gardes, discipline de tests/citations, DCO (Developer Certificate of Origin) |
| [Gouvernance](GOVERNANCE.md) | contributeurs / communauté | comment Kshana est gouverné — qui décide, comment, et la frontière ouvert/fermé |
| [Code de conduite](CODE_OF_CONDUCT.md) | communauté | conduite attendue (Contributor Covenant) |
| [Politique de sécurité](SECURITY.md) | personnes signalant un problème | comment signaler une vulnérabilité ; note sur le double usage |

</details>

<details>
<summary>Références clés</summary>

### Références clés

**Références de validation et normes** — les autorités externes auxquelles les vérifications de Kshana sont ancrées :

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753) ; [données de test](https://celestrak.org/publications/AIAA/2006-6753/)) : le jeu de vérification SGP4/SDP4 que Kshana reproduit à 4.12 mm, et les exemples de référentiels détaillés face auxquels la chaîne TEME→ITRF est vérifiée.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — les routines de référence de temps et de référentiels face auxquelles la nutation IAU 2000A et la réduction CIO GCRS↔ITRS sont validées bit à bit.
- Petit & Luzum (éds.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (normes d'orientation de la Terre, de mouvement du pôle et de référentiels).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (relations de l'écart d'Allan et la série de référence NBS14 ; NBS = l'ancien National Bureau of Standards des États-Unis).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html) : les implémentations de référence ROC/AUC, matrice de confusion et précision/rappel/F1 auxquelles le banc d'évaluation des dégradations RF correspond exactement (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2) : `optimize.nnls`, `stats.chi2` et `linalg.expm` — les routines de référence face auxquelles l'ajustement NNLS de l'ADEV mesurée de l'arbitrage quantique, les bandes de cohérence χ² et la covariance du bruit de processus d'horloge de van Loan sont validés (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811) : utilisé à la fois comme état de l'art ouvert (voir *Comparaison et état de l'art ouvert* ci-dessous) et comme **référence DOP indépendante** à laquelle le calcul GDOP/PDOP/HDOP/VDOP/TDOP correspond à 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)) : les modèles de forces derrière l'ajustement du modèle de forces aux éphémérides précises des agences.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403) ; Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (les familles halo/NRHO que reproduit le correcteur différentiel CR3BP).

**Physique des dispositifs et des méthodes** — les sources citées derrière les modèles de capteurs :

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (horloge optique à réseau de strontium, objectif orienté vers l'espace).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (horloge Sr de laboratoire, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (triade d'accéléromètres quantiques hybrides).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [tutoriel de l'IEEE AESS (Aerospace and Electronic Systems Society) (dépôt Discovery de l'University College London)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (croissance de l'erreur à l'estime).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902) ; Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (transfert temps-fréquence optique bidirectionnel ; la liaison optique inter-satellites modélise son budget de non-réciprocité d'après ceux-ci).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (la modulation BOC et la théorie de séparation spectrale derrière `src/navsignal.rs`).
- Kaplan & Hegarty (éds.) — *Understanding GPS/GNSS: Principles and Applications* (3e éd., Artech House, 2017) : l'équation anti-brouillage du C/N₀ effectif et la gigue due au bruit thermique de la poursuite de code DLL avance–retard qu'utilisent les modèles de signal de navigation et de brouillage.

**Comparaison et état de l'art ouvert** — les outils et revues par rapport auxquels Kshana se positionne :

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (la Texas Spoofing Test Battery ; ION — Institute of Navigation — GNSS 2012) : les paramètres de la batterie de tests de leurrage face auxquels le détecteur multicouche est caractérisé.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017) : les profils d'erreur de navigation inertielle ouverts et validés utilisés comme référence de base classique.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab) : simulateur ouvert de PNT lunaire.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811) : analyse ouverte de données GNSS.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454) : DO à dynamique réduite de GRAIL, le plancher d'accélération empirique que reproduit l'ajustement LRO.

</details>
