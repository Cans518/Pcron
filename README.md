# Projet LO03 : Pcron

Ce projet est un projet de cours LO03, UTSEUS (équivalent à UTT LO14), nommé **Pcron**. Pcron est un script d’application similaire à Cron, qui implémente les fonctionnalités suivantes : 

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

---

# 项目 LO03 : Pcron

这个项目是课程 LO03, UTSEUS (等同于 UTT LO14) 的一个项目，名为 **Pcron**。Pcron 是一个类似于 Cron 的应用脚本，实现了以下功能：

1. **在指定时间执行任务**  
   根据预定的时间表执行命令和脚本。

2. **自动检查和记录**  
   定期检查特定目录下的任务文件，并将执行日志记录到指定文件中。

3. **用户权限管理**  
   通过配置文件控制哪些用户可以使用该服务。

4. **白名单与黑名单模式**  
   通过文件启用用户的白名单或黑名单模式。

5. **任务管理工具**  
   `pcrontab` 命令可以用来编辑、查看或删除用户的定时任务计划。每个任务由六个时间字段和一个命令字段定义，支持灵活的配置规则。

------

## 开发与部署

该项目完全使用 **Shell** 进行开发，并使用 **bash** 执行。在 **Ubuntu 18.04, 20.04, 22.04 和 24.04** 版本上进行了功能和性能测试。

该项目的源代码已发布在 [GitHub](https://github.com/) 上，采用 **AGPL** 许可证。软件以及安装包也可以在 [Launchpad](https://launchpad.net/) 上获取，方便分发和安装。

---

# Project LO03: Pcron

This project is a course project for LO03, UTSEUS (equivalent to UTT LO14), named **Pcron**. Pcron is an application script similar to Cron, which implements the following features:

1. **Execution of tasks at specified times**  
   Execution of commands and scripts according to predefined schedules or periods.

2. **Automatic checking and logging**  
   Regular checking of task files in a specific directory and logging execution records into a designated file.

3. **User permission management**  
   Control of users authorized to use the service via a configuration file.

4. **Whitelist and blacklist modes**  
   Enabling whitelist or blacklist modes for users through files.

5. **Task management tool**  
   The `pcrontab` command allows editing, viewing, or deleting user task plans. Each task is defined by six time fields and a command field, with flexible configuration rules.

------

## Development and deployment

This project is entirely developed using **Shell** and executed with **bash**. It has been tested for functionality and performance on versions **Ubuntu 18.04, 20.04, 22.04, and 24.04**.

The project’s source code is published on [GitHub](https://github.com/) under the **AGPL** license. The software and installation packages are also available on [Launchpad](https://launchpad.net/) for distribution and installation.