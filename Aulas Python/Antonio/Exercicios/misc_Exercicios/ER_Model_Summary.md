# 📘 ER Model (Modelo Entidade-Relacionamento) - Summary Notes

## 1. 📐 Conceptual Modeling

- Purpose: Bridge between real-world requirements and database implementation.
- Independent of DBMS and physical structure.

---

## 2. 🧩 Key Concepts in the ER Model

### ➤ Entities
- Real-world objects or concepts with independent existence.
- **Physical Examples:** ALUNO, PESSOA, CARRO.
- **Conceptual Examples:** EMPRESA, CURSO, FACULDADE.

### ➤ Attributes
- Properties describing entities.
- **Example:** ALUNO(NumMec, Nome, Sexo, DataNasc)

### ➤ Relationships
- Connections between entities.
- **Example:** ESTUDA(ALUNO, FACULDADE)

---

## 3. 📄 Entity-Type and Instances

### ➤ Entity-Type
- Abstract template for similar entities.
- **Syntax Convention:** Name in uppercase, singular. Attributes capitalized, abbreviated if needed.
- **Example:**  
  `ALUNO(NumMec, Nome, Sexo, DataNasc)`

### ➤ Entity Instances
- Concrete examples of entity-types.
- **Example:**  
  `ALUNO1(193942, 'José Silva', 'M', 17-11-2000)`

### ➤ Key Attributes
- Uniquely identify each entity.
- **Example:** NumMec is underlined to denote key.
  `ALUNO(_NumMec_, Nome, ...)`

---

## 4. 🧠 Attribute Domains

### ➤ Attribute Types
- **Simple:** indivisible (e.g., Sexo, NumCC)
- **Composite:** decomposable (e.g., Endereço → Rua, Cidade, CódigoPostal)
- **Derived:** computed (e.g., Idade from DataNasc)
- **Multi-valued:** set of values (e.g., NumTelefone)
- **Complex:** nested multi-valued + composite (e.g., Habilitação(Grau, Ano, Instituição))
- **Optional:** may be NULL (e.g., Andar)

---

## 5. ✍️ Example (Entity ALUNO)

```
ALUNO(
  NumMec, Nome, Sexo, DataNasc, [Idade],
  Morada(Rua, Num, Andar?, Localidade, CodPostal),
  {NumTelefone},
  {Habilitação(Grau, Ano, Instituição)}
)
```

- `Idade`: Derived
- `Morada`: Composite with optional sub-attribute `Andar`
- `{NumTelefone}`: Multi-valued
- `{Habilitação}`: Complex

---

## 6. 🔗 Relationships

### ➤ General Form
```
NOME(Entidade1, Entidade2 [, AtributosRelacionamento])
```
- NOME often includes verbs (e.g., TRABALHA_PARA)

### ➤ Examples
- RESPONSAVEL_POR(DEPARTAMENTO, CURSO)
- DIRECTOR_DE(PROFESSOR, DEPARTAMENTO)
- TRABALHA_EM(PROFESSOR, DEPARTAMENTO)
- INSCRITO_EM(ALUNO, CURSO, AnoInsc, AnoConcl?)

---

## 7. 🔢 Cardinality & Participation

### ➤ Cardinality Types
- 1:1 → One-to-one
- 1:N → One-to-many
- M:N → Many-to-many

### ➤ Participation
- **Total:** All instances participate
- **Partial:** Only some participate

#### Examples:
| Relationship        | Cardinality | Participation             |
|---------------------|-------------|----------------------------|
| DIRECTOR_DE         | 1:1         | Parcial / Total           |
| TRABALHA_EM         | N:1         | Total / Total             |
| INSCRITO_EM         | M:N         | Parcial / Parcial         |

---

## 8. 🏢 Case Study: Company Database (BD Empresa)

### ➤ Entities:
```
FUNCIONÁRIO(NumCC, Nome, Email?, DataNasc, Salário, [HorasProj])
DEPARTAMENTO(Nome, {Localização(Rua, Num, Andar?, Localidade, CodPostal)})
PROJECTO(Nome, DataInício, DataFim)
```

### ➤ Relationships:
```
SUPERVISIONA(FUNCIONÁRIO, FUNCIONÁRIO)
TRABALHA_PARA(FUNCIONÁRIO, DEPARTAMENTO)
GERE(FUNCIONÁRIO, DEPARTAMENTO)
CONTROLA(DEPARTAMENTO, PROJECTO)
DIRIGE(FUNCIONÁRIO, PROJECTO)
TRABALHA_EM(FUNCIONÁRIO, PROJECTO, Horas)
```

---

## 9. 🧱 Weak Entities

- No key attribute.
- **Dependent on another entity** through an identifying relationship (N:1, total participation).
- **Partial key** distinguishes entities in context.

### ➤ Example:
- DEPENDENTE(Nome) is weak, depends on FUNCIONÁRIO.
- Nome is partial key.

---

## 10. ⚠️ Higher-Degree Relationships

- Relationships can involve more than 2 entities.

### ➤ Example:
```
FORNECE(FORNECEDOR, PRODUTO, PROJECTO, Quant)
```
- Involves 3 entities and a quantity attribute.
- Could be modeled using a weak entity if needed.
