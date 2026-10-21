# Serrure électronique sur FPGA — Polytech Sorbonne

**Mini-projet d’électronique numérique | Spécialité Électronique et Informatique | Semestre 5 | 2025–2026**  
**Youssef EL KATTOUFI — Polytech Sorbonne, Sorbonne Université**

## Présentation du projet

Dans le cadre de ma formation d’ingénieur en Électronique et Informatique à Polytech Sorbonne, j’ai réalisé un mini-projet d’électronique numérique dont l’objectif était de concevoir et de simuler une serrure électronique en **VHDL**, destinée à fonctionner sur une carte **FPGA DE10-Lite**.

Le principe est de permettre à un utilisateur de saisir un code à quatre chiffres à l’aide des interrupteurs de la carte. Chaque chiffre est validé par un bouton poussoir, puis affiché sur l’un des quatre afficheurs à 7 segments. Les chiffres précédemment saisis sont décalés à chaque nouvelle validation, jusqu’à former un code de 16 bits.

Le code saisi est ensuite comparé à un code de référence, fixé ici à **1234**. Lorsque les quatre chiffres correspondent, la sortie `Ouverture` passe à `1`, ce qui permet de commander une LED représentant l’ouverture de la serrure.

L’intérêt de ce projet était surtout de mettre en pratique la conception de circuits combinatoires et séquentiels, en commençant par des composants simples avant de les assembler dans un système numérique complet.

## Matériel et logiciels utilisés

- **Carte FPGA :** Terasic DE10-Lite, basée sur un FPGA Intel MAX 10.
- **Langage :** VHDL.
- **ModelSim :** simulation des composants et du système complet à l’aide de bancs de test.
- **Intel Quartus Prime :** préparation du projet FPGA, compilation et affectation des broches.
- **Visual Studio Code :** édition et organisation des fichiers VHDL.
- **Git et GitHub :** suivi des modifications et conservation de l’historique du projet.

## Arborescence du dépôt

J’ai séparé les fichiers liés aux simulations de ceux utilisés avec Quartus Prime. Cela permet de modifier et tester les composants individuellement avant de les intégrer au projet destiné à la carte FPGA.

L’arborescence ci-dessous reprend les principaux dossiers et fichiers. Les fichiers intermédiaires générés par ModelSim et Quartus ne sont pas tous détaillés.

```text
Projet_S5_FPGA_polytech_sorbonne_2025_2026/
│
├── Driver_quartus_V24.1/          # Pilotes et ressources d'installation
│   ├── drivers/
│   ├── drivers.zip
│   └── Lien.txt
│
├── Tp_0/                         # TP de prise en main de la carte FPGA
│   ├── blink.vhd                 # Premier programme : clignotement d'une LED
│   ├── blink.qpf                 # Projet Quartus du TP0
│   ├── blink.qsf                 # Paramètres et affectations des broches
│   ├── blink.sdc                 # Contraintes temporelles
│   └── ...                       # Documentation et fichiers générés
│
├── Mini_projet/                  # Projet principal : serrure électronique
│   │
│   ├── Sujet/                    # Énoncé et documentation DE10-Lite
│   │
│   ├── Modelsim/                 # Développement et simulations VHDL
│   │   ├── Detecteur/            # Détection de l'appui sur KEY0
│   │   ├── Bascule_d/            # Bascule D avec enable et reset
│   │   ├── registre_parallele/   # Registre parallèle 4 bits
│   │   ├── Decodeur_7_seg/       # Conversion 4 bits vers 7 segments
│   │   ├── Comparateur_4_bis/    # Comparaison de deux valeurs sur 4 bits
│   │   ├── Comparateur_16_bits/  # Comparaison du code complet
│   │   └── Top_module/          # Assemblage et simulation de la serrure
│   │       ├── top_module.vhd
│   │       ├── top_module_tb.vhd
│   │       ├── simu.do
│   │       └── ...               # Autres modules VHDL nécessaires
│   │
│   ├── quartus/                  # Projet destiné à la carte FPGA
│   │   ├── top_module.qpf        # Projet Quartus
│   │   ├── top_module.qsf        # Configuration et broches de la carte
│   │   ├── top_module.sdc        # Contraintes temporelles
│   │   ├── top_module.vhd        # Module principal
│   │   ├── *.vhd                 # Composants utilisés par top_module
│   │   └── ...                   # Fichiers générés par Quartus
│   │
│   ├── CR_youssef/               # Rapport, schémas et fichiers de travail
│   │   ├── Rapport_FPGA.pdf
│   │   ├── Rapport_FPGA.docx
│   │   └── Dessin/               # Schémas réalisés avec draw.io
│   │
│   ├── CR_cecile/                # Travaux et documents complémentaires
│   ├── Rapport_FPGA.pdf         # Copie du rapport final
│   └── README.txt                # Remarques sur les fichiers de simulation
│
└── README.md                     # Présentation du dépôt (ce fichier)
```

### À quoi servent les principaux dossiers ?

**`Tp_0/`** correspond à la prise en main de Quartus Prime et de la carte DE10-Lite. Ce premier exercice, basé sur le clignotement d’une LED, m’a permis de me familiariser avec l’environnement de développement et la programmation d’un FPGA.

**`Mini_projet/Modelsim/`** regroupe les fichiers VHDL utilisés pour la conception et la simulation. Chaque composant dispose de son propre dossier avec son code, son banc de test (`*_tb.vhd`) et un script `simu.do`. Le dossier `Top_module/` rassemble les composants nécessaires à la serrure complète.

**`Mini_projet/quartus/`** contient la version du projet préparée pour le FPGA. On y retrouve les différents composants VHDL, le fichier de projet `top_module.qpf` et les affectations des broches dans `top_module.qsf`.

**`Mini_projet/CR_youssef/`** regroupe mon rapport et les schémas fonctionnels réalisés pendant le projet. Le rapport détaille notamment les choix de conception et les résultats observés en simulation.

## Conception et fonctionnement

### 1. Validation d'un chiffre

La valeur à saisir est positionnée sur les quatre interrupteurs `SW3` à `SW0`, correspondant à l’entrée VHDL `Busint(3 downto 0)`.

La validation se fait avec le bouton `KEY0`. Un détecteur de front transforme l’appui sur le bouton en une impulsion d’une période d’horloge, utilisée comme signal `enable` pour les registres. La logique de stockage reste ainsi synchronisée avec l’horloge du FPGA.

### 2. Mémorisation du code

Le stockage repose sur **quatre registres de 4 bits**, construits à partir de bascules D. Chaque registre possède un signal de remise à zéro asynchrone actif à l’état bas (`rst_n`) et un signal d’activation (`enable`).

À chaque validation :

1. Le nouveau chiffre est chargé dans le premier registre.
2. Les valeurs déjà mémorisées sont décalées vers les registres suivants.
3. Les quatre registres forment un bus interne `Buscode` de **16 bits**.

Le dernier chiffre saisi occupe les quatre bits de poids faible du bus ; le plus ancien des quatre chiffres occupe les quatre bits de poids fort.

### 3. Affichage sur les afficheurs 7 segments

Chaque registre est relié à un décodeur **4 bits → 7 segments**. Les quatre décodeurs commandent les afficheurs `HEX0` à `HEX3` de la carte.

Le décodeur prend en charge les valeurs hexadécimales de `0` à `F`. Sur la DE10-Lite, les segments fonctionnent en logique active à l’état bas : un `0` allume le segment concerné.

### 4. Comparaison du code

Le comparateur de 16 bits est réalisé à partir de **quatre comparateurs de 4 bits**. Chacun compare un chiffre saisi avec le chiffre correspondant du code de référence `1234`.

Les quatre résultats sont regroupés par une porte logique **ET** :

- si les quatre comparaisons sont vraies, `Ouverture = '1'` ;
- sinon, `Ouverture = '0'`.

Le code de référence est directement défini dans le VHDL. Il s’agit donc d’une serrure pédagogique et non d’un système de sécurité destiné à un usage réel.

## Organisation des fichiers VHDL

| Fichier | Rôle |
| --- | --- |
| `detecteur_de_front.vhd` | Détecte la transition de `KEY0` servant à valider un chiffre. |
| `bascule_d.vhd` | Mémorise un bit au front montant de l’horloge, avec `enable` et reset asynchrone. |
| `registre_changement_parallele.vhd` | Assemble quatre bascules D pour mémoriser un chiffre sur 4 bits. |
| `decodeur_7_seg.vhd` | Convertit une valeur sur 4 bits en signaux pour un afficheur 7 segments. |
| `comparateur_4bits.vhd` | Vérifie l’égalité entre deux valeurs sur 4 bits. |
| `comparateur_16bits.vhd` | Réunit quatre comparateurs 4 bits pour vérifier le code complet. |
| `top_module.vhd` | Relie les composants et décrit le fonctionnement global de la serrure. |
| `top_module_tb.vhd` | Simule les entrées utilisateur, le reset et les différents scénarios de saisie. |
| `simu.do` | Automatise la compilation et la simulation dans ModelSim. |

Les fichiers utilisés pour l'assemblage global se trouvent dans [`Mini_projet/Modelsim/Top_module/`](Mini_projet/Modelsim/Top_module/).

## Simulations sous ModelSim

J’ai d’abord testé séparément les composants afin de vérifier leur fonctionnement avant l’assemblage final. Les bancs de test permettent notamment de contrôler le reset, l’activation des registres, la mémorisation des valeurs, le décodage des afficheurs et le résultat des comparateurs.

Le banc de test global [`top_module_tb.vhd`](Mini_projet/Modelsim/Top_module/top_module_tb.vhd) simule ensuite deux situations :

- **Code correct :** saisie successive de `1`, `2`, `3`, puis `4`. La sortie `Ouverture` doit passer à `1`.
- **Code incorrect :** saisie de `F`, `2`, `3`, puis `4`. La sortie `Ouverture` doit rester à `0`.

### Lancer la simulation complète

Dans ModelSim, se placer dans le dossier `Mini_projet/Modelsim/Top_module/`, puis lancer le script :

```tcl
do simu.do
```

Ce script crée la bibliothèque de travail, compile les composants VHDL ainsi que le banc de test, lance `top_module_tb` et ouvre les signaux pour visualiser les chronogrammes. La commande de simulation prévue dans le fichier est `run 200 ns`.

Le même principe peut être utilisé dans les dossiers des composants individuels, qui disposent également de leurs scripts `simu.do`.

## Préparation du projet dans Quartus Prime

Après la validation des composants en simulation, j’ai regroupé les fichiers VHDL dans le dossier [`Mini_projet/quartus/`](Mini_projet/quartus/), afin de préparer leur utilisation sur la carte DE10-Lite.

Le fichier [`top_module.qpf`](Mini_projet/quartus/top_module.qpf) permet d’ouvrir le projet dans Quartus Prime. Le fichier `top_module.qsf` contient notamment le choix du FPGA Intel MAX 10 et les affectations des broches correspondant aux entrées, aux afficheurs 7 segments et à la sortie `Ouverture`.

Cette partie a demandé de consulter la documentation et le schéma électronique de la carte pour identifier les connexions. Les configurations et contraintes Quartus présentes dans le dépôt doivent être vérifiées avant une nouvelle compilation ou programmation de la carte : le rapport présente surtout les simulations et le travail d’intégration, pas une validation matérielle exhaustive.

## Difficultés rencontrées

Une des premières difficultés concernait la **détection de l’appui sur le bouton poussoir**. En simulation, le détecteur de front montant fonctionnait comme prévu. En revanche, lors des essais sur la carte DE10-Lite, la validation se faisait au relâchement de `KEY0` et non au moment de l’appui.

Après avoir analysé le comportement du bouton, j’ai constaté que son entrée était **active à l’état bas** : l’appui correspondait donc à une transition de `1` vers `0`. J’ai modifié le détecteur pour prendre en compte ce **front descendant**, puis adapté son banc de test afin de vérifier le nouveau comportement.

J’ai également rencontré un problème d’affectation de broches dans Quartus Prime. Certains signaux internes, notamment `Buscode`, apparaissaient alors qu’ils ne devaient pas être directement connectés aux broches de la carte. Je suis revenu sur les fichiers VHDL et sur les simulations pour vérifier les connexions entre les composants, avant de remettre à jour les fichiers du projet Quartus.

Ces difficultés m’ont permis de mieux comprendre la différence entre un comportement validé en simulation et son intégration sur une carte physique.

## Documentation

- [Rapport du mini-projet (PDF)](Mini_projet/Rapport_FPGA.pdf) — démarche de conception, schémas et résultats de simulation.
- [Sujet du mini-projet (PDF)](Mini_projet/Sujet/Mini-Projet_Elec_Numerique_Serrure_electronique_DE10Lite.pdf) — consignes et fonctionnement attendu.
- [Schéma électronique DE10-Lite (PDF)](Mini_projet/Sujet/de10-lite_schematic.pdf) — documentation utilisée pour les broches et les périphériques.
- [Fichiers du module principal](Mini_projet/Modelsim/Top_module/) — code et banc de test du système complet.

---

**Projet réalisé dans le cadre de l’enseignement d’électronique numérique de Polytech Sorbonne — année universitaire 2025–2026.**
