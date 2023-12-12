import pygame
from fonctions import *
import sys

# Initialisation de Pygame
pygame.init()

# Définir les constantes
WINDOW_NAME = "ECEL - Crime manager"
MAP_FILENAME = "./map.png"
BG_COLOR = (255, 255, 255)
REF_SIZE = (1920, 1080)
INIT_WINDOW_SIZE = (1600, 900)
DB_ACCESS_PATH = "../datafiles/DEV/ECELdata.db"

# Initialisation SQLite
init_bdd(DB_ACCESS_PATH)
init_tk()

# Charger la carte
map = pygame.image.load(MAP_FILENAME)
map_width, map_height = map.get_rect().size
resize_ratio = REF_SIZE[0]/INIT_WINDOW_SIZE[0]

# Calculer le ratio de l'image
image_ratio = map_width / float(map_height)

resized_map = map_resize(map, image_ratio, INIT_WINDOW_SIZE[0])

# Initialiser la fenêtre avec la taille de la carte redimensionnée
window = pygame.display.set_mode(INIT_WINDOW_SIZE, pygame.RESIZABLE)
pygame.display.set_caption(WINDOW_NAME)


# Boucle principale
ongoing = True
while ongoing:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            ongoing = False
        elif event.type == pygame.MOUSEBUTTONDOWN:
            # Lorsque la souris est cliquée, récupérer les coordonnées de la souris
            x, y = pygame.mouse.get_pos()
            # Transforme x,y vers les coordonnées correspondante au format reference
            x_transfo, y_transfo = int(x*resize_ratio), int(y*resize_ratio)
            
            # Afficher la fenêtre d'input
            fetch_popup(x_transfo, y_transfo)

        # Gérer l'événement de redimensionnement de la fenêtre
        elif event.type == pygame.VIDEORESIZE:
            new_width = event.w
            resized_map = map_resize(new_width)
            window = pygame.display.set_mode((new_width, int(new_width / image_ratio)), pygame.RESIZABLE)
            resize_ratio = REF_SIZE[0]/new_width

    # Afficher la carte
    window.fill(BG_COLOR)
    window.blit(resized_map, (0, 0))
    pygame.display.flip()

# Fermeture
close_bdd()
pygame.quit()
sys.exit()