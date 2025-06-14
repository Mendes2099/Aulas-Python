""" Este ficheiro contém todos os livros e os seus respectivos atributos. """

#TODO O valor "ano" destes dados não está 100% corretamente formatado em certas obras (ex:  ("id": 49, "ano": "c. século V a.C.") )
#TODO O id começa no index 1 e talvez deveria começar no 0.

catalogo = [
  {"id": 1, "titulo": "Os Três Mosqueteiros", "autor": "Alexandre Dumas", "ano": 1844, "genero": "Aventura", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 2, "titulo": "Ben-Hur", "autor": "Lew Wallace", "ano": 1880, "genero": "Histórico", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 3, "titulo": "Laranja Mecânica", "autor": "Anthony Burgess", "ano": 1962, "genero": "Distopia", "estado": "EMPRESTADO", "emprestado_por": "Joana Silva", "cc_emprestimo": "12345678"},
  {"id": 4, "titulo": "Os Maias", "autor": "Eça de Queirós", "ano": 1888, "genero": "Romance", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 5, "titulo": "Frei Luís de Sousa", "autor": "Almeida Garrett", "ano": 1843, "genero": "Drama", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 6, "titulo": "Uma Abelha na Chuva", "autor": "Carlos de Oliveira", "ano": 1953, "genero": "Romance", "estado": "EMPRESTADO", "emprestado_por": "Miguel Torres", "cc_emprestimo": "87654321"},
  {"id": 7, "titulo": "O Iluminado", "autor": "Stephen King", "ano": 1977, "genero": "Terror", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 8, "titulo": "Drácula", "autor": "Bram Stoker", "ano": 1897, "genero": "Terror", "estado": "EMPRESTADO", "emprestado_por": "Rita Costa", "cc_emprestimo": "99887766"},
  {"id": 9, "titulo": "Meditações", "autor": "Marco Aurélio", "ano": "c. 180", "genero": "Filosofia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 10, "titulo": "1984", "autor": "George Orwell", "ano": 1949, "genero": "Distopia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 11, "titulo": "Admirável Mundo Novo", "autor": "Aldous Huxley", "ano": 1932, "genero": "Distopia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 12, "titulo": "Crime e Castigo", "autor": "Fiódor Dostoiévski", "ano": 1866, "genero": "Romance psicológico", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 13, "titulo": "O Processo", "autor": "Franz Kafka", "ano": 1925, "genero": "Ficção", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 14, "titulo": "Ensaio sobre a Cegueira", "autor": "José Saramago", "ano": 1995, "genero": "Ficção", "estado": "EMPRESTADO", "emprestado_por": "Ana Melo", "cc_emprestimo": "65432100"},
  {"id": 15, "titulo": "Dom Quixote", "autor": "Miguel de Cervantes", "ano": 1605, "genero": "Romance", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 16, "titulo": "O Pequeno Príncipe", "autor": "Antoine de Saint-Exupéry", "ano": 1943, "genero": "Fábula", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 17, "titulo": "O Senhor dos Anéis", "autor": "J.R.R. Tolkien", "ano": 1954, "genero": "Fantasia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 18, "titulo": "Harry Potter e a Pedra Filosofal", "autor": "J.K. Rowling", "ano": 1997, "genero": "Fantasia", "estado": "EMPRESTADO", "emprestado_por": "Bruno Lima", "cc_emprestimo": "44556677"},
  {"id": 19, "titulo": "O Hobbit", "autor": "J.R.R. Tolkien", "ano": 1937, "genero": "Fantasia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 20, "titulo": "Orgulho e Preconceito", "autor": "Jane Austen", "ano": 1813, "genero": "Romance", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 21, "titulo": "Jane Eyre", "autor": "Charlotte Brontë", "ano": 1847, "genero": "Romance", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 22, "titulo": "Frankenstein", "autor": "Mary Shelley", "ano": 1818, "genero": "Terror", "estado": "EMPRESTADO", "emprestado_por": "Carlos Silva", "cc_emprestimo": "33445566"},
  {"id": 23, "titulo": "O Nome da Rosa", "autor": "Umberto Eco", "ano": 1980, "genero": "Mistério", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 24, "titulo": "A Metamorfose", "autor": "Franz Kafka", "ano": 1915, "genero": "Ficção", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 25, "titulo": "O Retrato de Dorian Gray", "autor": "Oscar Wilde", "ano": 1890, "genero": "Romance", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 26, "titulo": "O Velho e o Mar", "autor": "Ernest Hemingway", "ano": 1952, "genero": "Ficção", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 27, "titulo": "A Ilha do Tesouro", "autor": "Robert Louis Stevenson", "ano": 1883, "genero": "Aventura", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 28, "titulo": "O Código Da Vinci", "autor": "Dan Brown", "ano": 2003, "genero": "Suspense", "estado": "EMPRESTADO", "emprestado_por": "Sofia Rocha", "cc_emprestimo": "22113344"},
  {"id": 29, "titulo": "As Aventuras de Tom Sawyer", "autor": "Mark Twain", "ano": 1876, "genero": "Juvenil", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 30, "titulo": "O Coração das Trevas", "autor": "Joseph Conrad", "ano": 1899, "genero": "Ficção", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},

  {"id": 31, "titulo": "O Leitor", "autor": "Bernhard Schlink", "ano": 1995, "genero": "Drama", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 32, "titulo": "Veronika Decide Morrer", "autor": "Paulo Coelho", "ano": 1998, "genero": "Ficção", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 33, "titulo": "O Alquimista", "autor": "Paulo Coelho", "ano": 1988, "genero": "Ficção", "estado": "EMPRESTADO", "emprestado_por": "Helena Duarte", "cc_emprestimo": "11223344"},
  {"id": 34, "titulo": "Cem Anos de Solidão", "autor": "Gabriel García Márquez", "ano": 1967, "genero": "Realismo mágico", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 35, "titulo": "O Amor nos Tempos do Cólera", "autor": "Gabriel García Márquez", "ano": 1985, "genero": "Romance", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 36, "titulo": "O Lobo da Estepe", "autor": "Hermann Hesse", "ano": 1927, "genero": "Filosofia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 37, "titulo": "Siddhartha", "autor": "Hermann Hesse", "ano": 1922, "genero": "Filosofia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 38, "titulo": "O Estrangeiro", "autor": "Albert Camus", "ano": 1942, "genero": "Filosofia", "estado": "EMPRESTADO", "emprestado_por": "Tiago Gomes", "cc_emprestimo": "77889900"},
  {"id": 39, "titulo": "A Peste", "autor": "Albert Camus", "ano": 1947, "genero": "Filosofia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 40, "titulo": "A Revolução dos Bichos", "autor": "George Orwell", "ano": 1945, "genero": "Satírico", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 41, "titulo": "Hamlet", "autor": "William Shakespeare", "ano": 1603, "genero": "Tragédia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 42, "titulo": "Macbeth", "autor": "William Shakespeare", "ano": 1606, "genero": "Tragédia", "estado": "EMPRESTADO", "emprestado_por": "Luis Ferreira", "cc_emprestimo": "55443322"},
  {"id": 43, "titulo": "Romeu e Julieta", "autor": "William Shakespeare", "ano": 1597, "genero": "Tragédia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 44, "titulo": "Odisseia", "autor": "Homero", "ano": "c. VIII a.C.", "genero": "Épico", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 45, "titulo": "Ilíada", "autor": "Homero", "ano": "c. VIII a.C.", "genero": "Épico", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 46, "titulo": "A Divina Comédia", "autor": "Dante Alighieri", "ano": 1320, "genero": "Poesia épica", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 47, "titulo": "O Príncipe", "autor": "Maquiavel", "ano": 1532, "genero": "Política", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 48, "titulo": "A República", "autor": "Platão", "ano": "c. 380 a.C.", "genero": "Filosofia", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None},
  {"id": 49, "titulo": "A Arte da Guerra", "autor": "Sun Tzu", "ano": "c. século V a.C.", "genero": "Estratégia", "estado": "EMPRESTADO", "emprestado_por": "João Tavares", "cc_emprestimo": "99884411"},
  {"id": 50, "titulo": "O Apanhador no Campo de Centeio", "autor": "J.D. Salinger", "ano": 1951, "genero": "Romance", "estado": "DISPONÍVEL", "emprestado_por": None, "cc_emprestimo": None}
]