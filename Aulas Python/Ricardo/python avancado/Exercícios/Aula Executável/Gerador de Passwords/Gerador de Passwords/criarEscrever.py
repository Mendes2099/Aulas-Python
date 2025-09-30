from pathlib import Path

ficheiro = Path("teste.txt")  # Cria o arquivo na pasta atual

with ficheiro.open("w", encoding="utf-8", errors="ignore") as file:
    file.write("Fans Fans")