#FEITO POR: Anderson Souza, João Mendes, Elisabete Samagaio

from time import sleep

print("------------REGISTO DE UTILIZADOR------------\n")

print("+++++BEM-VINDO(A)!+++++\n")
sleep(1)

username = input("Digite o seu username: \n---> ").strip().lower()
sleep(1)

email = input("Digite o seu email: \n---> ").strip().lower()
sleep(1)

password = input("Digite a sua senha: \n---> ").strip().lower()
sleep(1)

if email.find("@") == -1 or email.find('.'[email.find('@'):]) == -1:
  print(f"\nEmail inserido é inválido.")
else:
    print('Registro efetuado com sucesso!\n')

    print('-_-_-_-_-_-_-_- \n\t  MENU  \n -_-_-_-_-_-_-_-')

    opcao = int(input('Selecione uma Opção:\n[1]-Login\n[2]-Sair\n---> '))

    if opcao == 1:
        print("\n------------LOGIN DO UTILIZADOR------------\n")

        infUsername = input('Escreva seu username\n---> ').strip().lower()
        infPassword = input('Escreva sua password\n--> ').strip().lower()

        if infUsername == username and infPassword == password:
            print(f'\nMuito bem-vindo a nosso programa, {username}!!')
        else:
            print('\nAs informações do username ou da password estão erradas...')
            sleep(1)

            print('Tente novamente\n.')

            userName2 = input('Escreva seu username\n---> ').lower().strip()
            password2 = input('Escreva sua password\n---> ').lower().strip()

            if userName2 == username and password2 == password:
                print('\nLogin efetuado com sucesso!')
            else:
                print('Username e password errados! Sua conta irá ser bloqueada.')
    elif opcao == 2:
        print('Foi evacuado com sucesso!')
    else:
        print('Opção inválida!')



