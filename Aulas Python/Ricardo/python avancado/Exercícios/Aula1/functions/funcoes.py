from classes.classes import Livro, Ebook
import os
import sqlite3

# === Função de conexão ===


def get_connection():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.normpath(os.path.join(base_dir, '..', 'data', 'db.db'))
    return sqlite3.connect(db_path)

# === Criar as tabelas ===


def databaseStarter():
    try:
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute('''
            CREATE TABLE IF NOT EXISTS livro (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                titulo TEXT NOT NULL,
                autor TEXT NOT NULL,
                tipo TEXT NOT NULL,
                paginas INTEGER NOT NULL,
                stock INTEGER DEFAULT 0,
                status TEXT DEFAULT 'Disponível',
                emprestado_a TEXT DEFAULT 'Ninguém',
                vendido_a TEXT DEFAULT 'Ninguém'
            )
        ''')

        cursor.execute('''
            CREATE TABLE IF NOT EXISTS ebook (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                titulo TEXT NOT NULL,
                autor TEXT NOT NULL,
                tipo TEXT NOT NULL,
                tamanho INTEGER NOT NULL,
                extensao TEXT NOT NULL,
                stock INTEGER DEFAULT 0,
                status TEXT DEFAULT 'Disponível',
                emprestado_a TEXT DEFAULT 'Ninguém',
                vendido_a TEXT DEFAULT 'Ninguém'
            )
        ''')

        conn.commit()
        print("Tabelas criadas com sucesso.")
    except Exception as e:
        print("Erro ao criar tabelas:", e)
    finally:
        conn.close()

# === Registrar documentos ===


def registar():
    try:
        conn = get_connection()
        cursor = conn.cursor()

        selection = input(
            "Deseja registar um livro ou um e-book? ").strip().lower()

        if selection == "livro":
            num = int(
                input(f"Quantos registros de {selection} deseja inserir?: "))
            for i in range(num):
                print(f"\nRegistro {i+1}:")
                titulo = input("Título: ")
                autor = input("Autor: ")
                tipo = "livro"
                paginas = int(input("Número de páginas: "))
                while True:
                    stock = input(
                        "Quantidade em stock (pressione Enter para 1): ").strip()
                    if stock == "":
                        stock = 1
                        break
                    elif stock.isdigit() and int(stock) >= 0:
                        stock = int(stock)
                        break
                    else:
                        print("Por favor insira um número inteiro não-negativo.")
                status = input(
                    "Status ('Disponível' ou 'Emprestado'): ").strip() or "Disponível"

                cursor.execute(
                    "INSERT INTO livro (titulo, autor, tipo, paginas, stock, status) VALUES (?, ?, ?, ?, ?, ?)",
                    (titulo, autor, tipo, paginas, stock, status)
                )
            print(f"\n{num} livro(s): {titulo} registrado(s) com sucesso!")

        elif selection in ["ebook", "e-book"]:
            num = int(
                input(f"Quantos registros de {selection} deseja inserir?: "))
            for i in range(num):
                print(f"\nRegistro {i+1}:")
                titulo = input("Título: ")
                autor = input("Autor: ")
                tipo = "ebook"
                tamanho = int(input("Tamanho (MB): "))
                extensao = input("Extensão (ex: pdf, epub): ")
                while True:
                    stock = input(
                        "Quantidade em stock (pressione Enter para 1): ").strip()
                    if stock == "":
                        stock = 1
                        break
                    elif stock.isdigit() and int(stock) >= 0:
                        stock = int(stock)
                        break
                    else:
                        print("Por favor insira um número inteiro não-negativo.")
                status = input(
                    "Status ('Disponível' ou 'Emprestado'): ").strip() or "Disponível"

                cursor.execute(
                    "INSERT INTO ebook (titulo, autor, tipo, tamanho, extensao, stock, status) VALUES (?, ?, ?, ?, ?, ?, ?)",
                    (titulo, autor, tipo, tamanho, extensao, stock, status)
                )
            print(f"\n{num} e-book(s): {titulo} registrado(s) com sucesso!")
        else:
            print("Tipo inválido. Use 'livro' ou 'ebook'.")

        conn.commit()

    except Exception as e:
        print("Erro ao registar:", e)
    finally:
        conn.close()

# === Pesquisar documentos ===


def pesquisar():
    try:
        conn = get_connection()
        cursor = conn.cursor()

        selection = input(
            "Deseja pesquisar um livro ou um e-book? ").strip().lower()

        if selection not in ["livro", "ebook", "e-book"]:
            print("Tipo inválido.")
            return

        nome = input(f"Qual é o nome do {selection}? ").strip()

        table = "livro" if selection == "livro" else "ebook"

        cursor.execute(
            f"SELECT * FROM {table} WHERE LOWER(titulo) = LOWER(?)", (nome,))
        rows = cursor.fetchall()

        if not rows:
            print("Nenhum registro encontrado.")
            return

        print(f"\nRegistros encontrados em {table}:\n")
        for row in rows:
            if table == "livro":
                obj = Livro(
                    id=row[0],
                    titulo=row[1],
                    autor=row[2],
                    tipo=row[3],
                    stock=row[5],
                    status=row[6],
                    emprestado_a=row[7],
                    vendido_a=row[8],
                    paginas=row[4]
                )
            else:
                obj = Ebook(
                    id=row[0],
                    titulo=row[1],
                    autor=row[2],
                    tipo=row[3],
                    stock=row[6],
                    status=row[7],
                    emprestado_a=row[8],
                    vendido_a=row[9],
                    tamanho=row[4],
                    extensao=row[5]
                )
            print(obj)
            print("-" * 40)

    except Exception as e:
        print("Erro ao pesquisar:", e)
    finally:
        conn.close()


# === Funções futuras ===


def vender():
    try:
        conn = get_connection()
        cursor = conn.cursor()
        selection = input(
            'Deseja vender um livro ou um e-book? ').strip().lower()
        if selection not in ["livro", "ebook", "e-book"]:
            print("Tipo inválido.")
            return
        titulo = input('Qual é o título? ').strip()
        table = "livro" if selection == "livro" else "ebook"
        cursor.execute(
            f"SELECT id, stock, status FROM {table} WHERE LOWER(titulo) = LOWER(?)", (titulo,))
        row = cursor.fetchone()
    except Exception as e:
        print('Erro ao vender:', e)
    finally:
        conn.close()


def emprestar():
    try:
        conn = get_connection()
        cursor = conn.cursor()
        selection = input(
            'Deseja emprestar um livro ou um e-book? ').strip().lower()
        if selection not in ["livro", "ebook", "e-book"]:
            print("Tipo inválido.")
            return
        titulo = input('Qual é o título? ').strip()
        table = "livro" if selection == "livro" else "ebook"
        cursor.execute(
            f"SELECT id, stock, status FROM {table} WHERE LOWER(titulo) = LOWER(?)", (titulo,))
        row = cursor.fetchone()
    except Exception as e:
        print('Erro ao emprestar:', e)
    finally:
        conn.close()
