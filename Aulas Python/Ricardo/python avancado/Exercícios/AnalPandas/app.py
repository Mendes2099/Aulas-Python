# Importar a biblioteca PANDAS
import pandas as pd

# Guardam o caminho do ficheiro em var
CAMINHO = 'historico_criptomoedas_jovens.xlsx'

# Carregar o ficheiro para DF em PANDAS
df = pd.read_excel(CAMINHO)

# ==================
# EXPLORAÇÃO INICIAL
# ==================

# Mostra estatísticas gerais da DataFrame
print('Estatísticas Gerais')
print(df.describe())
print()

# Mostrar as primeiras 5 linhas da DataFrame
print('5 primeiras linhas:')
print(df.head())
print()

# Mostrar as primeiras 10 linhas da DataFrame
print('10 primeiras linhas:')
print(df.head(10))
print()

# Mostras as 7 últimas linhas da DataFrame
print('7 últimas linhas:')
print(df.tail(7))
print()

# Mostrar o número total de linhas e colunas
print('Número total de linhas e colunas')
print(df.shape)
print()

# Mostrar os nomes de todas as colunas da DataFrame
print('Nome das colunas')
print(df.columns)
print()

# Mostrar o tipo de dados das colunas
print('Tipo de dados nas colunas')
print(df.dtypes)
print()

# Mostrar se há campos Nulos na DataFrame
print('Campos nulos:')
print(df.isnull().sum())
print()

# ===================================
# ANÁLISE EXPLORATÓRIA DE DADOS (AED)
# ===================================

# Mostrar os dados únicos da serie nomes
print('Pesquisar os nomes na Coluna nome')
print(df['Nome'].unique())
print()

# Mostrar os dados únicos da serie criptomoedas
print('Pesquisar os nomes na Coluna nome')
print(df['Criptomoeda'].unique())
print()

# Mostrar quantas operações ocorreram em cada plataforma
print('Quantas operações por plataforma')
print(df['Plataforma'].value_counts())
print()

# Mostrar quantas operações em cada Criptomoeda sem aparecer o name e dtype
print('Quantas operações por criptomoedas SEM DTYPE')
print(df['Criptomoeda'].value_counts().reset_index())
print()

# A % das operações em cada Criptomoeda sem aparecer o name e dtype
print('Quantas operações por criptomoedas SEM DTYPE')
print(df['Criptomoeda'].value_counts(normalize=True).round(2)*100)
print()

# A média do valor investido por Criptomoeda
print('Média valor investido por Criptomoeda')
print(df.groupby('Criptomoeda')['Valor Investido (€)'].mean().round(2))

# A média do valor investido por Plataforma
print('Média valor investido por Plataforma')
print(df.groupby('Plataforma')['Valor Investido (€)'].mean().round(2))

# Total investido por cada utilizador
print('Média valor investido por Plataforma')
print(df.groupby('Nome')['Valor Investido (€)'].sum())

# ===================================
# FILTRAGEM E ANÁLISE DOS DADOS
# ===================================

# Mostra apenas as transações feitas na plataforma Binance
# df[boolean]
print('Transações na Binance')
print(df[df['Plataforma'] == 'Binance'])
print()

# Mostra apenas as transações feitas pela Zara
print('Transações pela Zara')
print(df[df['Nome'] == 'Zara'])
print()

# Mostrar transações com valores acima dos 4000€
print('Transações acima dos 4k')
print(df[df['Valor Investido (€)'] > 4000])
print()

# Mostrar transações de pessoas com idade < 20
print('Transações c/ idades inferior a 20 anos')
print(df[df['Idade'] < 20])
print()

# Mostrar transações da cardano feitas na binance
print('Transações cardano na binance')
print(df[(df['Criptomoeda'] == 'Cardano') & (df['Plataforma'] == 'Binance')])
print()

# + uma folha
ecsel = pd.ExcelFile(CAMINHO)
print(ecsel.sheet_names[0])

# por números em vez de nomes colunas
# iloc[linha, coluna]
print(df.iloc[0, 0])

# média investida na plataforma Binance
valor_investido = df[df['Plataforma'] ==
                     'Binance']['Valor Investido (€)'].mean()
print(f'Média investido na Binance: {valor_investido:.2f}€')

# média investida especificamente em Bitcoin
media_investido = df[df['Criptomoeda'] ==
                     'Bitcoin']['Valor Investido (€)'].mean()
print(f'Média investido na Bitcoin: {media_investido:.2f}€')


# ===================================
# EXERCÍCIOS
# ===================================

# 1. Mostra as primeiras 10 linhas do ficheiro
print('1. As primeiras 10 linhas do ficheiro:')
print(df.head(10))
print()
# 2. Quantas colunas e quantas linhas tem o dataset?
print('2. Número de colunas e linhas:')
print(df.shape)
print()
# 3. Existem valores nulos?
print('3. Verificação de valores nulos:')
print(df.isnull().sum())
print()
# 4. Quais são as plataformas de investimento disponíveis?
print('4. Plataformas de investimento disponíveis:')
print(df['Plataforma'].unique())
print()
# 5. Quantas transações foram feitas em cada plataforma?
print('5. Número de transações por plataforma:')
print(df['Plataforma'].value_counts())
print()
# 6. Qual a criptomoeda mais comprada?
print('6. Criptomoeda mais comprada:')
print(df['Criptomoeda'].value_counts().idxmax())
print()
# 7. Qual a percentagem de transações associada à Ethereum?
print('7. Percentagem de transações de Ethereum:')
percentagem_ethereum = df['Criptomoeda'].value_counts(normalize=True)[
    'Ethereum'] * 100
print(f'{percentagem_ethereum:.2f}%')
print()
# 8. Qual é a média de valor investido por criptomoeda?
print('8. Média de valor investido por criptomoeda:')
print(df.groupby('Criptomoeda')['Valor Investido (€)'].mean().round(2))
print()
# 9. Quem foi o utilizador com maior investimento total?
print('9. Utilizador com maior investimento total:')
total_investido_utilizador = df.groupby('Nome')['Valor Investido (€)'].sum()
print(total_investido_utilizador.idxmax())
print()
# 10. Qual a idade média dos utilizadores que compraram Dogecoin?
print('10. Idade média dos compradores de Dogecoin:')
idade_media_dogecoin = df[df['Criptomoeda'] == 'Dogecoin']['Idade'].mean()
print(f'{idade_media_dogecoin:.0f} anos')
print()
# 11. Mostra todas as transações feitas por utilizadores com menos de 18 anos
print('11. Transações de utilizadores com menos de 18 anos:')
print(df[df['Idade'] < 18])
print()
# 12. Mostra as transações com valor superior a 5000€
print('12. Transações com valor superior a 5000€:')
print(df[df['Valor Investido (€)'] > 5000])
print()
# 13. Quais foram as transações feitas na plataforma Revolut com Bitcoin?
print('13. Transações de Bitcoin na Revolut:')
print(df[(df['Plataforma'] == 'Revolut') & (df['Criptomoeda'] == 'Bitcoin')])
print()
# 14. Qual foi a data com mais transações?
print('14. Data com mais transações:')
print(df['Data da Compra'].value_counts().idxmax().date())
print()
