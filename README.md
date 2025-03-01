# Projet LO03 : Pcron

Ce projet est un projet de cours LO03, nommé **Pcron**. Pcron est un script d’application similaire à Cron, qui implémente les fonctionnalités suivantes :

1. **Exécution de tâches à des moments donnés**
   Exécution de commandes et de scripts selon des horaires ou des périodes prédéfinis.
2. **Vérification automatique et enregistrement**
   Vérification régulière des fichiers de tâches dans un répertoire spécifique et enregistrement des journaux d’exécution dans un fichier désigné.
3. **Gestion des droits d’utilisateur**
   Contrôle des utilisateurs autorisés à utiliser le service via un fichier de configuration.
4. **Mode de liste blanche et mode de liste noire**
   Activation de la liste blanche ou de la liste noire des utilisateurs via des fichiers.
5. **Outil de gestion des tâches**
   La commande `pcrontab` permet d’éditer, de consulter ou de supprimer les plans de tâches des utilisateurs. Chaque tâche est définie par six champs horaires et un champ de commande, avec des règles de configuration flexibles.

------

## Développement et déploiement

Ce projet est entièrement réalisé en utilisant **Shell** et exécuté avec **bash**. Il a été testé en termes de fonctionnalité et de performance sur les versions **Ubuntu 18.04, 20.04, 22.04 et 24.04**.

Le code source du projet est publié sur [GitHub](https://github.com/) sous licence **AGPL**. Les logiciels ainsi que les paquets d’installation sont également disponibles sur [Launchpad](https://launchpad.net/) pour la distribution et l’installation.