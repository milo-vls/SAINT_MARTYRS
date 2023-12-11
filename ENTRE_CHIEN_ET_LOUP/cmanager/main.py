import pygame
from fonctions import *
import sys

# Initialisation de Pygame
pygame.init()

# Définir les constantes
FENETRE_TITRE = "ECEL - Crime manager"
CARTE_FILENAME = "./map.png"
COULEUR_FOND = (255, 255, 255)
TAILLE_REFERENCE = (1920, 1080)
TAILLE_FENETRE_INIT = (1600, 900)
CHEMIN_ACCESS_BDD = "../datafiles/DEV/ECELdata.db"

# Initialisation SQLite
init_bdd(CHEMIN_ACCESS_BDD)
init_tk()

# Charger la carte
carte = pygame.image.load(CARTE_FILENAME)
largeur_carte, hauteur_carte = carte.get_rect().size
coef_redim = TAILLE_REFERENCE[0]/TAILLE_FENETRE_INIT[0]

# Calculer le ratio de l'image
ratio_image = largeur_carte / float(hauteur_carte)

carte_redimensionnee = redimensionner_carte(carte, ratio_image, TAILLE_FENETRE_INIT[0])

# Initialiser la fenêtre avec la taille de la carte redimensionnée
fenetre = pygame.display.set_mode(TAILLE_FENETRE_INIT, pygame.RESIZABLE)
pygame.display.set_caption(FENETRE_TITRE)


# Boucle principale
en_cours = True
while en_cours:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            en_cours = False
        elif event.type == pygame.MOUSEBUTTONDOWN:
            # Lorsque la souris est cliquée, récupérer les coordonnées de la souris
            x, y = pygame.mouse.get_pos()
            # Transforme x,y vers les coordonnées correspondante au format reference
            x_transfo, y_transfo = int(x*coef_redim), int(y*coef_redim)
            
            # Afficher la fenêtre d'input
            afficher_popup(x_transfo, y_transfo)

        # Gérer l'événement de redimensionnement de la fenêtre
        elif event.type == pygame.VIDEORESIZE:
            nouvelle_largeur = event.w
            carte_redimensionnee = redimensionner_carte(nouvelle_largeur)
            fenetre = pygame.display.set_mode((nouvelle_largeur, int(nouvelle_largeur / ratio_image)), pygame.RESIZABLE)
            coef_redim = TAILLE_REFERENCE[0]/nouvelle_largeur

    # Afficher la carte
    fenetre.fill(COULEUR_FOND)
    fenetre.blit(carte_redimensionnee, (0, 0))
    pygame.display.flip()

# Fermeture
cloture_bdd()
pygame.quit()
sys.exit()