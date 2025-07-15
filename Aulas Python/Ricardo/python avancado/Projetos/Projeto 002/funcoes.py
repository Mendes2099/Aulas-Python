import sqlite3
from bcrypt import hashpw, gensalt, checkpw
import tkinter as tk
from tkinter import ttk, messagebox
import os

# Path relativo (à partida este path funciona independentemente do vosso caminho pessoal no pc)
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, "Ex2.db")

# TODO Adicionei mais um atributo (blocked) á tabela users para que possamos "trancar" users através das tentativas através de uma valiação


def init_db():
    con = sqlite3.connect(DB_PATH)
    cursor = con.cursor()
    cursor.execute('''
          CREATE TABLE IF NOT EXISTS user(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE NOT NULL,
            password BLOB NOT NULL,
            blocked INTEGER DEFAULT 0 
    )''')
    con.commit()
    con.close()


def registar():
    username = registar_username.get().strip()
    password = registar_password.get()

    if not username or not password:
        messagebox.showwarning(
            "Dados em falta", "Preencha username e password")
        return

    hashed_password = hashpw(password.encode("utf-8"), gensalt())

    try:
        con = sqlite3.connect(DB_PATH)
        cursor = con.cursor()
        cursor.execute("INSERT INTO user (username, password) VALUES (?, ?)",
                       (username, hashed_password))
        con.commit()
        con.close()
        messagebox.showinfo("Sucesso", "Conta registada com sucesso!")
        registar_username.delete(0, tk.END)
        registar_password.delete(0, tk.END)
    except sqlite3.IntegrityError:
        messagebox.showerror("Erro", f"Username {username} já existe")


def login():
    username = login_username.get().strip()
    password = login_password.get()

# TODO Validação
    if not username or not password:
        messagebox.showwarning(
            "Dados em falta", "Preencha username e password")
        return
    try:
        con = sqlite3.connect(DB_PATH)
        cursor = con.cursor()
        cursor.execute(
            "SELECT password FROM user WHERE username = ?", (username,))
        result = cursor.fetchone()
        con.close()
    except Exception as e:
        messagebox.showerror("Erro", f"{str(e)}")

    if result is None:
        messagebox.showerror("Erro", "User não existe")

    if result and checkpw(password.encode("utf-8"), result[0]):
        messagebox.showinfo("Sucesso", "Login bem-sucedido!")
        login_username.delete(0, tk.END)
        login_password.delete(0, tk.END)
    else:
        messagebox.showerror("Erro", "Username ou password incorretos")


# Interface
root = tk.Tk()
root.title("Login Seguro com Bcrypt")

notebook = ttk.Notebook(root)
aba_registo = ttk.Frame(notebook, padding=10)
aba_login = ttk.Frame(notebook, padding=10)

notebook.add(aba_registo, text="Sign Up")
notebook.add(aba_login, text="Login")
notebook.pack(fill="both", expand=True)

# Widgets de registo
ttk.Label(aba_registo, text="Username").grid(
    row=0, column=0, sticky="e", pady=5)
registar_username = ttk.Entry(aba_registo)
registar_username.grid(row=0, column=1, pady=5)

ttk.Label(aba_registo, text="Password").grid(
    row=1, column=0, sticky="e", pady=5)
registar_password = ttk.Entry(aba_registo, show="*")
registar_password.grid(row=1, column=1, pady=5)

ttk.Button(aba_registo, text="Registar Conta", command=registar).grid(
    row=2, column=0, columnspan=2, pady=10)

# Widgets de login
ttk.Label(aba_login, text="Username").grid(row=0, column=0, sticky="e", pady=5)
login_username = ttk.Entry(aba_login)
login_username.grid(row=0, column=1, pady=5)

ttk.Label(aba_login, text="Password").grid(row=1, column=0, sticky="e", pady=5)
login_password = ttk.Entry(aba_login, show="*")
login_password.grid(row=1, column=1, pady=5)

ttk.Button(aba_login, text="Login", command=login).grid(
    row=2, column=0, columnspan=2, pady=10)

# Inicializar base de dados
init_db()

root.mainloop()
