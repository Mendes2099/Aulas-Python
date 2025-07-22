from random import randint

menu = dict()


aluno = dict()

aluno["Nome"] = input(f"Insira o nome do aluno: ")
aluno["Média"] = int(input(f"Insira a média do aluno: "))


if aluno["Média"] < 9.5:
    aluno["Status"] = "Reprovado"
    print(f"{aluno["Status"]}")
else:
    aluno["Status"] = "Aprovado"
    print(f"{aluno["Status"]}")

jogadores = list()
numJogadores = randint(2, 4)

for i in range(0, numJogadores, 1):
    jogador = dict()
    jogador["Nome"] = input(f"Insira o nome do jogador: ").strip().lower()
    jogador["Roll"] = randint(1, 20)
    jogadores.append(jogador)
    jogadores.sort(key=lambda x: x["Roll"], reverse=True)

for i, jogador in enumerate(jogadores):
    print(
        f"{i+1}º lugar: O jogador {jogador['Nome']} rolou o valor: {jogador['Roll']}")

match(pattern)
