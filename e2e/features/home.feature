#language: fr

@home
Fonctionnalité: Page d'acceuil
	Pour pouvoir me renseigner sur carnet de bord
	En tant que visiteur
	Je veux pouvoir consulter la page d'acceuil

Scénario:
	Soit un utilisateur sur la page d'accueil
	Alors je vois "La nouvelle version du Carnet de bord est en ligne"
	Alors le lien "Accéder à mon compte" pointe sur "/auth/login"
