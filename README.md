# MooveAlert

Addon WoW d'alerte sol/zone dangereuse (concurrent de GTFO), Retail + Classic.

## Installation
Copier le dossier `MooveAlert/` dans `World of Warcraft/_retail_/Interface/AddOns/`
(ou `_classic_/Interface/AddOns/` pour Classic Era / progression).

## Différences vs GTFO
- Un seul moteur de détection (combat log) pour Retail et Classic, au lieu de deux moteurs séparés.
- Flash plein écran + nom du sort affiché, en plus du son (GTFO est son uniquement).
- Profil par personnage (`MooveAlertCharDB`) pour couper un sort précis sans affecter les autres personnages.
- API publique `MooveAlert:RegisterSpell(id, data)` / `RegisterSpells({...})` pour ajouter des sorts sans toucher au moteur.
- Mode Scan (`/ma scan`, `/ma report`) pour repérer les sorts non répertoriés et les proposer à l'ajout.

## Commandes
`/ma` ou `/moovealert` affiche l'aide (test, sound, flash, volume, mute/unmute, scan, report).

## Données
Les sorts (`MooveAlert/Data/Spells_*.lua`, ~6000 entrées) sont convertis depuis GTFO 6.10.2
via `tools/convert_gtfo_data.py` (données uniquement : spellID + catégorie/niveau d'alerte,
pas le code moteur de GTFO). Pour resynchroniser après une mise à jour de GTFO :

```
python3 tools/convert_gtfo_data.py <chemin racine GTFO> MooveAlert/Data
```

## Non testé en jeu
Ce code n'a pas été lancé dans un client WoW réel (pas d'accès ici). À valider :
`/reload`, `/ma test` (flash+son), puis un vrai combat pour confirmer la détection.

## Volontairement pas fait (YAGNI)
- Panneau d'options graphique : slash commands seulement pour l'instant.
- Intégration `C_UnitAuras.AddAuraSound` (API privée retail) : le combat log suffit
  et évite d'avoir deux moteurs à maintenir. À ajouter seulement si la latence
  du combat log s'avère un problème mesuré en jeu.

## Licence

GPL-3.0-or-later (voir `LICENSE`).
