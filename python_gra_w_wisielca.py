# python_wyzwania_rozdzial_10_zadanie_1.py

hangmanlist = ["Piszczałka", "Kot", "Raport", "mniejszości",
           "Titanic", "Ostatni", "Jedi", "Incepcja",
           "Pulp", "Fiction", "Człowiek", "ogień", "Seksmisja",
           "Majonez", "malarstwo", "Piccasso", "Guernica", "Pulpet"]

import random

word = random.choice(hangmanlist)

def hangman(word):
    wrong = 0
    stages = ["",
              "___________             ",
              "|                       ",
              "|                       ",
              "|            |          ",
              "|            |          ",
              "|            0          ",
              "|           /|\         ",
              "|          / | \        ",
              "|           / \         ",
              "|          /   \        ",
              "|                       ",
              "|                       ",
              ]
    rletters = list(word)
    letter_board = ["_"] * len(word)
    win = False
    print("Gra w wisielca")
    while wrong < len(stages) - 1:
        print("\n")
        msg = "Odgadnij literę: "
        char = input(msg)
        if char in rletters:
            cind = rletters.index(char)
            letter_board[cind] = char
            rletters[cind] = "$"
        else:
            wrong += 1
        print((" ".join(letter_board)))
        e = wrong + 1
        print("\n".join(stages[0: e]))
        if "_" not in letter_board:
            print("Wygrałeś!")
            print(" ".join(letter_board))
            win = True
            break
    if not win:
        print("\n".join(stages[0: wrong]))
        print("Przegrałeś! Miałeś odgadnąć: {}.".format(word))

hangman(word)
