import sqlite3
import pygame
import tkinter as tk
from tkinter import simpledialog
from tkinter import ttk
import sys

conn = None
cursor = None
tk_window = None

def init_bdd(access_path) : 
    global conn 
    global cursor
    conn = sqlite3.connect(access_path)
    cursor = conn.cursor()
    
def close_bdd() : 
    global conn
    conn.close()

# Redimensionner la carte en conservant le ratio
def map_resize(map, image_ratio, new_width):
    new_height = int(new_width / image_ratio)
    return pygame.transform.scale(map, (new_width, new_height))

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
        victim_id = char_id[0]
    return victim_id    

def writeNewCrime(inputData) :    
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

def readCharacters() :
    global cursor
    characters = list()
    cursor.execute("SELECT nickname FROM Characters")
    result = cursor.fetchall()
    
    for ch in result :
        characters.append(ch[0])    
    return characters

def readCases() :
    global cursor
    cases = list()
    cursor.execute("SELECT idCa FROM Cases")
    result = cursor.fetchall()
    
    for case in result : 
        cases.append(case[0])
    return cases

def init_tk() :
    global tk_window
    tk_window = tk.Tk()
    tk_window.withdraw()  # Masquer la fenêtre Tkinter principale
    tk_window.title("Nouveau crime")

def fetch_popup(x, y):
    global tk_window
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

            cases = readCases()
            self.cases_var = tk.StringVar()
            self.cases_menu = ttk.Combobox(master, textvariable=self.cases_var, values=cases)
            victims = readCharacters()
            self.victim_var = tk.StringVar()
            self.victim_menu = ttk.Combobox(master, textvariable=self.victim_var, values=victims)
            self.day_entry = tk.Entry(master)
            self.hour_entry = tk.Entry(master)
            self.minute_entry = tk.Entry(master)
            last_crime = ["true", "false"]
            self.last_crime_var = tk.StringVar()
            self.last_crime_menu = ttk.Combobox(master, textvariable=self.last_crime_var, values=last_crime)
            self.sprite1_entry = tk.Entry(master)
            self.sprite2_entry = tk.Entry(master)
            self.sprite3_entry = tk.Entry(master)
            self.sprite4_entry = tk.Entry(master)

            self.cases_menu.grid(row=0, column=1, sticky=tk.W)
            self.victim_menu.grid(row=1, column=1, sticky=tk.W)
            self.day_entry.grid(row=2, column=1)
            self.hour_entry.grid(row=3, column=1)
            self.minute_entry.grid(row=4, column=1)
            self.last_crime_menu.grid(row=5, column=1, sticky=tk.W)
            self.sprite1_entry.grid(row=6, column=1)
            self.sprite2_entry.grid(row=7, column=1)
            self.sprite3_entry.grid(row=8, column=1)
            self.sprite4_entry.grid(row=9, column=1)

        def apply(self):
            inputData = list()
            inputData.append(self.cases_var.get())
            inputData.append(self.victim_var.get())
            inputData.append(self.day_entry.get())
            inputData.append(self.hour_entry.get())
            inputData.append(self.minute_entry.get())
            inputData.append(x)
            inputData.append(y)
            inputData.append(self.last_crime_var.get())
            inputData.append(self.sprite1_entry.get())
            inputData.append(self.sprite2_entry.get())
            inputData.append(self.sprite3_entry.get())
            inputData.append(self.sprite4_entry.get())
            inputData.append(False)
            
            # Ecriture dans le fichier CSV
            writeNewCrime(inputData)
            
    popup = PopupDialog(tk_window)