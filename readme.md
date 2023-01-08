# Lecoincoin

##### Réalisé par DIEKE Ange Jonathan & DOUDOU Bi Serge T. A.

# Contexte
Existant depuis 1940, Lecoincoin est une société familiale (de dépôt vente) qui a raté le tournant numérique et voudrait se rattraper en se créant une présence en ligne pour diffuser ses annonces.

# Acteurs et objectifs
Monsieur Gérard et Madame Mathilde sont les gérants de la société. Leur souhait est d'avoir une plateforme web complète (backend + API) leur offrant une gestion plus aisée de leurs activités.

# Besoins Fonctionnels
- Mise en place un système d'authentification à un facteur
- Association un rôle aux différents utilisateurs (administrateur, modérateur, client)
- Seuls les rôles modérateur et administrateur peuvent accéder au backend
- Implémentation d'opérations CRUD pour les entités suviantes : utilisateur, annonce

# Règles de gestion
- Les mots de passe des utilisateurs sont hachés
- L'administrateur peut lister, créer, modifier ou supprimer les annonces ou d'autres utilisateurs.
- Le modérateur peut lister, créer, modifier ou supprimer les annonces. Cependant il ne peut que lister et consulter des utilisateurs.
- Un utilisateur peut créer une ou plusieurs annonces et une annnoce à un seul autheur
- Les annonces peuvent avoir 0, 1 ou plusieurs illustrations (sous forme d'images). Et réciproquement, une illustration n'est associée qu'à une annonce
- La suppression d'un utilisateur entraine la suppression de toutes ses annonces assciocées. Et la suppression d'une annonce entraine la suppresion de ses illustrations.

# Lancement de l'application
Au lancement de l'application 4 utilisateurs sont créés : un administrateur, un modérateur et deux clients dont les identifiants sont les suivants :
- Administrateur : username = *admin* / mot de passe = *admin*
- moderateur : username = *moderator* / mot de passe = *moderator*
- Client 1 : username = *customer1* / mot de passe = *customer1*
- Client 2 : username = *customer2* / mot de passe = *customer2*

# Démonstration
Nous proposons une vidéo de démonstration de notre solution à l'adresse suivente : www.youtube.com

# Lien vers l'application :
Pour faciliter les tests de Monsieur et Madame Lecoincoin, l'application a été déployé sur la plateforme heroku à l'adresse suivante : https://lecoincoin.herokuapp.com





