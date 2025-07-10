import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
import random
import string


class Autores:
    """
    Exibe os autores
    """
    @staticmethod
    def mostrar_autores():
        messagebox.showinfo(
            "Autores", "Realizado por: Osvaldo (25), João (15) e Rui (14)")


class Interface:
    def __init__(self):
        self.__janela = tk.Tk()
        self.__janela.title("Gerador de Passwords")
        self.__janela.geometry("300x230")

        # Variáveis
        self.__tamanho = tk.StringVar()  # Usar StringVar pois Combobox retorna string
        self.__maiusculas = tk.BooleanVar(value=False)
        self.__minusculas = tk.BooleanVar(value=False)
        self.__numeros = tk.BooleanVar(value=False)
        self.__simbolos = tk.BooleanVar(value=False)
        self.__resultado = tk.StringVar()  # Password gerada

        self.interface_user()

    def interface_user(self):
        """
        Cria os widgets da interface.
        """
        self.__janela.grid_columnconfigure(0, weight=1)
        self.__janela.grid_columnconfigure(1, weight=1)

        # Tamanho
        tk.Label(self.__janela, text="Tamanho da password:").grid(
            row=0, column=0, sticky="e", padx=10, pady=5)
        lista_tamanhos = list(range(8, 17))
        tamanho_cb = ttk.Combobox(self.__janela, values=lista_tamanhos,
                                  width=17, textvariable=self.__tamanho, state='readonly')
        tamanho_cb.grid(row=0, column=1, sticky="w", padx=10, pady=5)
        tamanho_cb.set(12)

        # Checkbuttons
        tk.Checkbutton(self.__janela, text="Maiúsculas", variable=self.__maiusculas).grid(
            row=1, column=0, sticky="w", padx=10, pady=2)
        tk.Checkbutton(self.__janela, text="Minúsculas", variable=self.__minusculas).grid(
            row=1, column=1, sticky="w", padx=10, pady=2)
        tk.Checkbutton(self.__janela, text="Números", variable=self.__numeros).grid(
            row=2, column=0, sticky="w", padx=10, pady=2)
        tk.Checkbutton(self.__janela, text="Símbolos", variable=self.__simbolos).grid(
            row=2, column=1, sticky="w", padx=10, pady=2)

        # Separador
        ttk.Separator(self.__janela, orient='horizontal').grid(
            row=3, column=0, columnspan=2, sticky='ew', pady=5)

        # Resultado
        tk.Label(self.__janela, text="Password Gerada:").grid(
            row=4, column=0, sticky="e", padx=10, pady=5)
        tk.Entry(self.__janela, textvariable=self.__resultado, width=20,
                 state='readonly').grid(row=4, column=1, sticky="w", padx=10, pady=5)

        # Botões
        botao_frame = tk.Frame(self.__janela)
        botao_frame.grid(row=5, column=0, columnspan=2, pady=10)

        tk.Button(botao_frame, text="Gerar Password",
                  command=self.gerar).pack(side="left", padx=10)
        tk.Button(botao_frame, text="Copiar Password",
                  command=self.copiar).pack(side="left", padx=10)

        self.__janela.mainloop()

    def gerar(self):
        """
        Gera a password com base nas opções selecionadas.
        """
        tamanho = int(self.__tamanho.get())

        caracteres = ""
        if self.__maiusculas.get():
            caracteres += string.ascii_uppercase
        if self.__minusculas.get():
            caracteres += string.ascii_lowercase
        if self.__numeros.get():
            caracteres += string.digits
        if self.__simbolos.get():
            caracteres += string.punctuation

        if not caracteres:
            messagebox.showwarning(
                "Erro", "Selecione pelo menos um tipo de caractere a modificar.")
            return

    # Lógica do agregador
        password = ''.join(random.choice(caracteres)
                           for i in range(0, tamanho, 1))
        self.__resultado.set(password)

    def copiar(self):
        """
        Copia a password gerada para a área de transferência.
        """
        messagebox.showinfo(
            "Mensaguem haha", "Ainda por implementar.")
