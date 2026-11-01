# docs--observatory-results: translations (fr)

# text
# c1: docs/observatory/RESULTS.md
seg-69304b8b186b = Source : <c1/>

# text
seg-df5b53307f50 = Résultats de l'observatoire : catalogue rétrospectif baltique de 30 jours et étude de sensibilité

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-072bdea11014 = Version <c1/> sur <c2/> (paramètres préenregistrés dans la méthode de base, inchangés). MODELLED : il n'y a aucune référence externe indépendante, aucune vérité terrain et aucune attribution de cause. Une cellule dégradée signifie qu'une part élevée des aéronefs échantillonnés à cet endroit a rapporté une faible précision de navigation ce jour-là ; cela ne dit pas pourquoi. Une cellule non observée, ou absente, n'a pas été évaluée, ce qui n'est pas la même chose que dégagée.

# text
seg-0d1eeedcab3a = Ce qui a été exécuté

# text
# c1: v<YYYY>.<MM>.<DD>-planes-readsb-prod-0
# c2: adsblol/globe_history_2026
# c3: scripts/fetch_adsblol_day.sh
# c4: back-catalogue/fetch/<tag>.parts.json
seg-df6ddf801a25 = <b>Source :</b> historique readsb d'adsb.lol (ODbL { "1.0" }), version GitHub <c1/> de <c2/>, récupérée par <c3/> une partie à la fois (environ { "3.4" } Go par jour, { "2" } parties). L'éditeur n'indique aucune somme de contrôle ; le SHA-256 de chaque partie est donc consigné dans <c4/>.

# text
# c1: scripts/observatory_backcatalogue.sh
seg-9fa2d2319ed3 = <b>Région et jours :</b> le cadre { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (sud, ouest, nord, est : la mer Baltique et ses côtes), { "30" } jours UTC du 2026-09-15 au 2026-10-14, cellules de { "0.5" } degré, par <c1/> (un jour à la fois, fichiers bruts supprimés après chaque jour).

# text
# c1: method.scope
seg-8b65d148bbd8 = <b>Règles de publication :</b> le jour le plus récent (2026-10-14) avait plus de { "24" } h de recul après sa fin lors de sa production ; la commande refuse sinon. Les exécutions régionales calculent la référence d'équipement et le bruit de fond du jour à partir des seuls rapports du cadre (<c1/>).

# text
# c1: back-catalogue/MANIFEST.json
seg-64581554e84a = <b>Fichiers :</b> les { "120" } fichiers de produit (GeoJSON, PNG, JSON d'incidents, manifeste par jour) <b>ne sont pas dans git</b>. L'empreinte de chaque fichier se trouve dans <c1/>, et un jour peut être reconstruit à partir de son archive et comparé.

# text
# c1: manifest.json
seg-c89b88dc3d3b = Exemple de ce que lit un jour : le 2026-09-15, l'archive contenait { "110,619,797" } lignes de position dans { "79,826" } fichiers de trace ; { "103.0" } millions étaient hors du cadre, { "5.6" } million n'étaient pas de l'ADS-B, { "1.2" } million étaient au sol ou sous { "5,000" } ft, { "0.6" } million ne portaient aucun champ de précision, et { "212,426" } ont été agrégées (compteurs d'entrée de <c1/>).

# text
seg-cc590aa74075 = Trois jours (2026-09-18, 2026-09-26, 2026-10-03) ont été récupérés de nouveau dans l'archive et exécutés une seconde fois : le GeoJSON, le PNG et le fichier d'incidents sont <b>identiques octet pour octet</b> à la première exécution (SHA-256 égal), de sorte que le produit est déterministe même si le sel de l'empreinte d'identifiant est aléatoire à chaque exécution.

# text
seg-3532be519183 = Résumé du catalogue rétrospectif

# text
seg-56aae646318e = Jour UTC

# text
seg-42784010b115 = cellules publiées

# text
seg-2672b7f55371 = dégradées

# text
seg-378ee89e4bd3 = non dégradées

# text
seg-14783d89f2fe = non observées (publiées)

# text
seg-711d143678ae = incidents

# text
# c1: not_observed
seg-0f1ffe21d381 = { "30" } jours : { "96" } cellules dégradées au total, { "28" } des { "30" } jours en comptant au moins une, { "70" } incidents (grappes de cellules dégradées contiguës), aucun jour avec un effet sur toute la journée. La part médiane des cellules d'aéronefs affectés (le bruit de fond du jour) est de { "0" } sur { "29" } jours et de { "0.006" } sur un, de sorte que le garde-fou de bruit de fond (une cellule doit dépasser le bruit de fond de { "0.15" }) n'a jamais changé un constat dans cette région. Le nombre de cellules dégradées par jour va de { "0" } à { "8" } (moyenne { "3.2" }). Environ un tiers des cellules publiées chaque jour sont <c1/> (trop peu d'aéronefs échantillonnés) : la couverture est la limite de ce produit, et non le ciel.

# text
seg-606aed861c95 = Ce que cela ne dit pas : les jours comptant plus de cellules dégradées ne sont pas « pires » en un sens physique, une zone affectée persistante serait sous-estimée (les aéronefs qui ne volent qu'à l'intérieur toute la journée n'ont pas de référence en dehors et ne sont pas comptés), et rien ici ne dit qui ou quoi a causé la faible précision.

# text
seg-ef37626a4c47 = Étude de sensibilité (trois jours)

# text
# c1: kshana interference-map sensitivity
# c2: sensitivity/<day>.json
seg-aacbb761ee19 = <c1/> rejoue les rapports enregistrés d'un jour sous des changements, un à la fois, des paramètres enregistrés (deux valeurs chacun, plus une grille de { "1.0" } degré). Jours : 2026-09-18 (le plus de cellules dégradées, { "8" }), 2026-09-26 ({ "1" } cellule dégradée) et 2026-10-03 ({ "0" }). Rapports complets : <c2/> ({ "23" } variantes chacun ; { "2.2" }, { "1.7" } et { "1.7" } millions de lignes rejouées). Cellules dégradées sous chaque variante (valeur enregistrée entre parenthèses ; le résultat enregistré est de { "8" }, { "1" } et { "0" } cellules dégradées) :

# text
seg-dfced7e594d2 = paramètre (enregistré)

# text
seg-2ac3e771679d = valeur

# text
seg-0953dbfd76db = grille { "0.5" } degré

# text
seg-bf5746d1a110 = { "2" } (cellules plus grossières)

# text
seg-e4016df2fcd3 = Lecture, sans désigner de gagnant :

# text
seg-81cfcbf0de89 = Les constats sont sensibles aux seuils des codes de précision et aux règles d'échantillonnage, et les petits nombres varient beaucoup.

# text
# c1: low_nic_max
# c2: degraded_share
# c3: min_reports_per_aircraft_in_cell
# c4: low_nic_max
# c5: degraded_share
seg-097ed1aa1504 = <c1/>, <c2/> et <c3/> changent chacun le nombre de cellules dégradées d'un facteur deux ou plus chaque jour ; assouplir <c4/> à { "6" } transforme { "1" } cellule dégradée en { "12" } le 09-26 (Jaccard avec l'ensemble enregistré { "0.08" }). Le 09-18, relever <c5/> à { "0.4" } en conserve { "1" } sur { "8" } (Jaccard { "0.125" }). Un constat de cellule proche des seuils parle autant des seuils que des données.

# text
# c1: min_aircraft_sampled
seg-0d0c96099d30 = <b><c1/> déplace surtout des cellules entre non dégradées et non observées</b> : le 09-18, il laisse le nombre de cellules dégradées à { "8" } tandis que { "21" } à { "56" } cellules changent d'état.

# text
# c1: background_margin
# c2: min_baseline_good_reports
# c3: day_confound_background
seg-04cc05318a5d = <b>Trois garde-fous sont inactifs ici</b> : <c1/>, <c2/> et <c3/> ne changent rien lors d'aucun des trois jours (la part de bruit de fond est { "0" }), de sorte que cette région et cette période ne disent rien de leur efficacité. Ils compteraient là où un effet régional relève le bruit de fond.

# text
seg-7ba403b84fbd = <b>Une grille plus grossière ({ "1.0" } degré) change le tableau</b> ({ "2" }, { "3" } et { "1" } cellules dégradées ; les cellules publiées tombent à environ un tiers, { "226" } contre { "694" } le 09-18, parce que chaque cellule est quatre fois plus grande) : la taille de cellule est un choix de méthode, et l'observatoire la fixe à { "0.5" } degré.

# text
# c1: low_nic_max
seg-4db2f5313410 = Un jour sans cellule dégradée enregistrée (10-03) a des cellules dégradées sous { "9" } des { "22" } variantes hors grille (jusqu'à { "8" } avec <c1/> { "6" }) : « aucune cellule dégradée » est aussi un énoncé dépendant des seuils.

# text
seg-a818be844f3a = Aucune variante n'est une alternative validée, et la règle enregistrée est inchangée par cette étude. L'étude ne dit pas quelles valeurs de paramètres sont les bonnes.

# text
seg-98c799bfbc25 = <s1>Précédent</s1>Observatoire des interférences : méthode

# text
seg-5d0c003e73dc = <s1>Suivant</s1>kshana-bench
