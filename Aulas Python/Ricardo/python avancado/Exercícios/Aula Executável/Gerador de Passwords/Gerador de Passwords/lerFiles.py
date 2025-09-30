from pathlib import Path

ficheiro = Path("./teste.txt")  # Cria o arquivo na pasta atual

with ficheiro.open("r", encoding="utf-8", errors="ignore") as file:
    for linha in file:
        (print(linha))
