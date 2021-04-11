# 20b - AV2

Avaliação 2 - Elementos de Sistemas 

| AV      | Pontos HW | Pontos SW |
| ------- | ------    | ------    |
| Prática |           |           |

- **Trabalhar sozinho**.
- **60 min** total.
- Ficar conectado no canal geral (para ouvir instruções)
- **Commit a cada 15 minutos**
- Lembre de dar push ao final

Para testar basta descomentar o módulo que deseja validar no arquivo `config_testes.txt` e executar o comando `python3 ./testeHW.py`.

----------------------------------

## 1. MIPS

O diagrama a seguir é uma representação da ULA do processador MIPS, este processador de 32 bits foi muito utilizado antigamente, a ULA possui os seguintes sinais:

- **A e B**: Entradas de 32 bits que serão manipuladas pela ULA
- **inverteA e inverteB**: Inverte os sinais de entrada A e B
- **carryIn**: Adiciona `1` a soma
- **carryOut**: Indica estoudo na soma
- **Seleção**: Controle o MUX
- **Resultado**: Saída da Ula (32 bits)
- **Zero**: Flag de saída da ULA que indica que o resultado é zero.

![](figs/ula-mips.png)

### 1a. (10 HW/ 0 SW) ULA MIPS

| Arquivo           | pnts    |
| -------           | ----    |
| `src/mipsULA.vhd` | 10 (HW) |


Usando os componentes (mux2Way32, mux4Way32, add32), implementa a ula descrita anteriormente no arquivo `mipsUla.vhd`, lembre de testar.

**Lembre de descomentar o módulo no arquivo config_testes.txt**

### 1b. (10 HW / 0 SW) ControlUnit

> Não depende do item 1a

| Arquivo               | pnts  |
| -------               | ----  |
| `src/controlUnit.vhd` | 10 HW |

Criei o controlUnit que irá controlar a ULA do MIPS dado a seguinte tabela de operações:

| Instrução | Operação                 |
| --------  | ---------                |
| `0000`    | Resultado = A or B       |
| `0001`    | Resultado = A or (not B) |
| `0010`    | Resultado = not(A and B) |
| `0011`    | Resultado = not(A or B)  |
| `0100`    | Resultado = A + 1        |
| `0101`    | Resultado = A - B        |
| `0110`    | Resultado = 0            |

**Lembre de descomentar o módulo no arquivo config_testes.txt**

### 1c. (5 HW / 10 SW) Pergunta

| Arquivo            | pnts         |
| -------            | ----         |
| `src/pergunta.txt` | 5 HW / 10 SW |

Responda a pergunta no arquivo: `pergunta.txt`


--------------------------

## 2. (10 HW / 0 SW) Compare

> Não depende da questão 1

| Arquivo           | pnts    |
| -------           | ----    |
| `src/compare.vhd` | 10 (HW) |

Você resolveu melhorar a ULA do Z01.1, para isso irá avaliar a ideia em uma versão simplificada que opera apenas com **dois bits de largura**. Sua ideia foi a de adicionar informações que comparam a entrada `X` com a entrada `Y` da ULA, fornecendo os seguintes sinais: `XeqY` (x igual a y) e `XltY` (x menor que y).

- `XeqY = 1` quando a entrada X for igual a entrada Y (`X == Y`)
- `XltY = 1` quando a entrada X for menor que a entrada Y (`X < Y`)

O componente a ser criado possui a estrutura a seguir:

```
 x1,x0 |------------|
  -/-->|            |--> XeqY
       | Comparador | 
 y1,y0 |            |
  -/-->|            |--> XltY
       |------------|
```

Escreva em VHDL o código que implementa o comparador (`src/compare.vnd`). **Você não pode utilizar `when` ou `with select` a ideia é implementar a equação booleana que representa XeqY e XltY.**

Dica:
  - Faça a tabela verdade e encontre as equações e implemente em VHDL.
  - X e Y são entradas de 2 bits cada
  - XeqY e XltY são saídas de 1 bit cada

**Lembre de descomentar o módulo no arquivo config_testes.txt**
