import sys
import sqlite3
import pygame
import tkinter as tk
from tkinter import simpledialog
from tkinter import ttk

conn = None
cursor = None
fenetre_tk = None

def init_bdd(chemin_access_bdd) : 
    global conn 
    global cursor
    conn = sqlite3.connect(chemin_access_bdd)
    cursor = conn.cursor()
    
def cloture_bdd() : 
    global conn
    conn.close()

# Redimensionner la carte en conservant le ratio
def redimensionner_carte(carte, ratio_image, nouvelle_largeur):
    nouvelle_hauteur = int(nouvelle_largeur / ratio_image)
    return pygame.transform.scale(carte, (nouvelle_largeur, nouvelle_hauteur))


def isTheFirstCrime(case_id):
    global cursor
    caseRequest = "SELECT idCa FROM Cases"
    cursor.execute(caseRequest)
    result = cursor.fetchall()
    for id in result : 
        if id[0] == case_id :
            return False
    return True

def findCharID(nickname):
    global cursor
    charRequest = "SELECT idC FROM Characters WHERE nickname='" + str(nickname) + "'"
    cursor.execute(charRequest)
    result = cursor.fetchall()
    for char_id in result : 
        victime_id = char_id[0]
    return victime_id    

def enregistrementCrime(inputData) :    
    global cursor
    inputData[1] = findCharID(inputData[1])
    inputData[12] = isTheFirstCrime(inputData[0])

    request = "INSERT INTO Crimes (case_id, victim_char_id, day_number, hour, minute, x, y, last_of_case, sprite_name_clue_1, sprite_name_clue_2, sprite_name_clue_3, sprite_name_clue_4, first_of_case) VALUES ("
    for val in inputData : 
        request += "'"+ str(val) +"',"
    request = request[:-1] + ")"
    try :
        cursor.execute(request)
        conn.commit()
    except :
        print("Erreur")
    return True

def lirePersonnages() :
    global cursor
    victimes = list()
    cursor.execute("SELECT nickname FROM Characters")
    result = cursor.fetchall()
    
    for perso in result :
        victimes.append(perso[0])    
    return victimes

def init_tk() :
    global fenetre_tk
    fenetre_tk = tk.Tk()
    fenetre_tk.withdraw()  # Masquer la fenêtre Tkinter principale
    fenetre_tk.title("Nouveau crime")

def afficher_popup(x, y):
    global fenetre_tk
    class PopupDialog(simpledialog.Dialog):
        def body(self, master):
            tk.Label(master, text="Case ID :").grid(row=0, sticky=tk.W)
            tk.Label(master, text="Victime :").grid(row=1, sticky=tk.W)
            tk.Label(master, text="Jour :").grid(row=2, sticky=tk.W)
            tk.Label(master, text="Heure :").grid(row=3, sticky=tk.W)
            tk.Label(master, text="Minute :").grid(row=4, sticky=tk.W)
            tk.Label(master, text="Dernier crime :").grid(row=5, sticky=tk.W)
            tk.Label(master, text="Sprite 1 :").grid(row=6, sticky=tk.W)
            tk.Label(master, text="Sprite 2 :").grid(row=7, sticky=tk.W)
            tk.Label(master, text="Sprite 3 :").grid(row=8, sticky=tk.W)
            tk.Label(master, text="Sprite 4 :").grid(row=9, sticky=tk.W)

            self.caseid_entry = tk.Entry(master)
            victimes = lirePersonnages()
            self.victime_var = tk.StringVar()
            self.victime_menu = ttk.Combobox(master, textvariable=self.victime_var, values=victimes)
            self.jour_entry = tk.Entry(master)
            self.heure_entry = tk.Entry(master)
            self.minute_entry = tk.Entry(master)
            dernier_crime = ["true", "false"]
            self.dernier_crime_var = tk.StringVar()
            self.dernier_crime_menu = ttk.Combobox(master, textvariable=self.dernier_crime_var, values=dernier_crime)
            self.sprite1_entry = tk.Entry(master)
            self.sprite2_entry = tk.Entry(master)
            self.sprite3_entry = tk.Entry(master)
            self.sprite4_entry = tk.Entry(master)

            self.caseid_entry.grid(row=0, column=1)
            self.victime_menu.grid(row=1, column=1, sticky=tk.W)
            self.jour_entry.grid(row=2, column=1)
            self.heure_entry.grid(row=3, column=1)
            self.minute_entry.grid(row=4, column=1)
            self.dernier_crime_menu.grid(row=5, column=1, sticky=tk.W)
            self.sprite1_entry.grid(row=6, column=1)
            self.sprite2_entry.grid(row=7, column=1)
            self.sprite3_entry.grid(row=8, column=1)
            self.sprite4_entry.grid(row=9, column=1)

        def apply(self):
            inputData = list()
            inputData.append(self.caseid_entry.get())
            inputData.append(self.victime_var.get())
            inputData.append(self.jour_entry.get())
            inputData.append(self.heure_entry.get())
            inputData.append(self.minute_entry.get())
            inputData.append(x)
            inputData.append(y)
            inputData.append(self.dernier_crime_var.get())
            inputData.append(self.sprite1_entry.get())
            inputData.append(self.sprite2_entry.get())
            inputData.append(self.sprite3_entry.get())
            inputData.append(self.sprite4_entry.get())
            inputData.append(False)
            
            # Ecriture dans le fichier CSV
            enregistrementCrime(inputData)
            
    popup = PopupDialog(fenetre_tk)