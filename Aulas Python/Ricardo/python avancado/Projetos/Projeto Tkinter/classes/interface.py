import tkinter as tk
from tkinter import ttk


class Interface:

    def __init__(self):
        self.__janela = tk.Tk()
        self.__janela.title("Gerador de passwords")
        self.__janela.geometry("300x200")
        # icon = tk.PhotoImage(file='Aulas Python\\Ricardo\\python avancado\\Projetos\\Projeto Tkinter\\icon.png')
        # self.__janela.iconphoto(False, icon)

        self.maiusculas = tk.BooleanVar(value=False)
        self.minusculas = tk.BooleanVar(value=False)
        self.numeros = tk.BooleanVar(value=False)
        self.simbolos = tk.BooleanVar(value=False)

        self.interface_user()

    def interface_user(self):
        self.__janela.grid_columnconfigure(0, weight=1)
        self.__janela.grid_columnconfigure(1, weight=1)

        tk.Label(self.__janela, text="Tamanho da password:").grid(
            row=0, column=0, sticky="e", padx=10, pady=5
        )
        lista_tamanhos = [8, 9, 10, 11, 12, 13, 14, 15, 16]
        tamanho = ttk.Combobox(self.__janela, values=lista_tamanhos, width=17)
        tamanho.grid(row=0, column=1, sticky="w", padx=10, pady=5)

        tk.Checkbutton(self.__janela, text="Maiúsculas", variable=self.maiusculas).grid(
            row=1, column=0, sticky="w", padx=10, pady=2
        )
        tk.Checkbutton(self.__janela, text="Minúsculas", variable=self.minusculas).grid(
            row=1, column=1, sticky="w", padx=10, pady=2
        )
        tk.Checkbutton(self.__janela, text="Números", variable=self.numeros).grid(
            row=2, column=0, sticky="w", padx=10, pady=2
        )
        tk.Checkbutton(self.__janela, text="Símbolos", variable=self.simbolos).grid(
            row=2, column=1, sticky="w", padx=10, pady=2
        )

        ttk.Separator(self.__janela, orient='horizontal').grid(
            row=3, column=0, columnspan=2, sticky='ew', pady=5)

        tk.Label(self.__janela, text="Password Gerada:").grid(
            row=4, column=0, sticky="e", padx=10, pady=5
        )
        gerado = tk.Entry(self.__janela, width=20)
        gerado.grid(row=4, column=1, sticky="w", padx=10, pady=5)

        botao_frame = tk.Frame(self.__janela)
        botao_frame.grid(row=5, column=0, columnspan=2, pady=10)
        gerarBtn = tk.Button(botao_frame, text="Gerar Password", command="")
        gerarBtn.pack(side="left", padx=10)
        copiarBtn = tk.Button(botao_frame, text="Copiar Password", command="")
        copiarBtn.pack(side="left", padx=10)

        self.__janela.mainloop()
