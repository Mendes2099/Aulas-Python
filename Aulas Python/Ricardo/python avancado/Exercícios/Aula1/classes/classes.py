class Menu:
    """
    Menu class for displaying a simple interactive menu in the console.
    Attributes:
        options (list): A list of options to display in the menu.
        title (str): The title of the menu.
    Methods:
        show():
            Displays the menu, prompts the user to select an option, and returns the selected option.
            Returns None if the user chooses to exit.
            Handles invalid input and keyboard interrupts gracefully.
    """

    def __init__(self, options, title="Menu"):
        self.options = options
        self.title = title

    def set_new_title(self, new_title):
        self.title = new_title

    def show(self):
        while True:
            line_length = max(len(self.title) + 8, 20)
            line = '-' * line_length
            print(f"\n{line}")
            print(f"--- {self.title} ---")
            print(f"{line}")
            for idx, option in enumerate(self.options, 1):
                print(f"[{idx}] {option}")
            print("[0] Sair")
            print(f"{line}")
            try:
                option = int(input("\nEscolha uma opção: "))
                if option == 0:
                    print("Saindo do menu.")
                    return None
                elif 1 <= option <= len(self.options):
                    return option
                else:
                    print(f"Erro: escolha entre 0 e {len(self.options)}.")
            except (ValueError, KeyboardInterrupt):
                print("Insira um valor válido!")


class Documento(object):
    def __init__(self, titulo, autor, tipo):
        self.titulo = titulo
        self.autor = autor
        self.tipo = tipo

    def __str__(self):
        return f"{self.tipo}-> {self.titulo} de {self.autor}"


class Livro(Documento):
    def __init__(self, titulo, autor, tipo, paginas):
        super().__init__(titulo, autor, tipo)
        self.paginas = paginas

    def __str__(self):
        return f"{self.titulo} de {self.autor} do tipo {self.tipo} com {self.paginas}"


class Ebook(Documento):
    def __init__(self, titulo, autor, tipo, tamanho, extensao):
        super().__init__(titulo, autor, tipo)
        self.tamanho = tamanho
        self.extensao = extensao

    def __str__(self):
        return f"{self.tipo}-> {self.titulo} de {self.autor} tamanho:{self.tamanho} extensão: {self.extensao}  "
