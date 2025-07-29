import pandas as pd

# Caminho do arquivo Excel
PATH = "historico_criptomoedas_jovens.xlsx"

# Lê o arquivo Excel em um DataFrame
df = pd.read_excel(PATH)

# Exibe as 5 primeiras linhas do DataFrame (head é um método, precisa de parênteses)
print(df.head())  # Mostra as 5 primeiras linhas

# Exibe as 10 primeiras linhas do DataFrame
print(df.head(10))  # Mostra as 10 primeiras linhas
print()

# Exibe as 7 últimas linhas do DataFrame
print(df.tail(7))  # Mostra as 7 últimas linhas
print()

# Exibe a tupla (linhas, colunas) do DataFrame
print(df.shape)  # shape é um atributo, não um método
print()

# Exibe o nome da segunda coluna (índice 1)
print(df.columns[1])  # Mostra o nome da segunda coluna
print()

# Exibe os tipos de dados de cada coluna
print(df.dtypes)  # Mostra os tipos de dados
print()

# Exibe a contagem de valores nulos em cada coluna
print(df.isnull().sum())  # Mostra a soma de valores nulos por coluna

# -------------- Analise exploratoria de dados -----------------

# Exibe os valores únicos da coluna "Nome"
print(df["Nome"].unique())  # Mostra os valores únicos
print()
print(df["Criptomoeda"].unique())  # Mostra os valores únicos
print()
# Mostra a quantidade dos valores únicos
print(df["Plataforma"].value_counts().reset_index())  # Retira o dtype
print()
print(df["Criptomoeda"].value_counts(
    normalize=True).round(2)*100)  # Converte para %
print()
print(df.groupby("Criptomoeda")["Valor Investido (€)"].mean().round(2))

# -------------- Manipulação de Dados -----------------

# # Converte a coluna 'Data de Compra' para o tipo datetime
# df['Data de Compra'] = pd.to_datetime(df['Data de Compra'])

# # Cria uma nova coluna 'Ano de Compra'
# df['Ano de Compra'] = df['Data de Compra'].dt.year

# Exibe o DataFrame com a nova coluna
print(df.head())
print()

# -------------- Filtragem e Ordenação -----------------

# Filtra o DataFrame para exibir apenas as compras de Bitcoin
df_bitcoin = df[df['Criptomoeda'] == 'Bitcoin']
print(df_bitcoin)
print()

# Ordena o DataFrame por 'Valor Investido (€)' em ordem decrescente
df_ordenado = df.sort_values(by='Valor Investido (€)', ascending=False)
print(df_ordenado.head())
print()

# -------------- Agregação de Dados -----------------

# Calcula o total investido por plataforma
total_investido_por_plataforma = df.groupby(
    'Plataforma')['Valor Investido (€)'].sum()
print(total_investido_por_plataforma)
print()


print(df[df["Valor Investido (€)"] > 4000])
print(df[(df['Criptomoeda'] == 'Cardano') & (df["Plataforma"] == "Binance")])

exel = pd.ExcelFile(PATH)
print(exel.sheet_names[0])

# Por numeros em vez de nomes de colunas iloc[linha,coluna]
print(df.iloc[0, 0])

# Média investida na plataforma Binance
# Corrigido: imprime a média dos valores investidos na plataforma Binance
print(df[df["Plataforma"] == "Binance"]["Valor Investido (€)"].mean())

# Média investida em Bitcoin
# Corrigido: imprime a média dos valores investidos em Bitcoin
print(df[df["Criptomoeda"] == "Bitcoin"]["Valor Investido (€)"].mean())
