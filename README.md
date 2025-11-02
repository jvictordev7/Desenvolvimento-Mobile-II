# 🧮 Calculadora Flutter — Desenvolvimento Mobile II

Trabalho acadêmico da disciplina de Desenvolvimento Mobile II.

- 👨‍🏫 Professor: Luccas Rafael
- 🧑‍🎓 Aluno: João Victor

---

## ✨ Visão Geral

Calculadora desenvolvida em Flutter com layout semelhante ao exemplo apresentado em aula. Permite a digitação de números e realiza as 6 operações exigidas no desafio:

- ✅ Soma (ex.: 6,7 + 9,2 = 15,9)
- ✅ Subtração (ex.: 5 − 3 = 2)
- ✅ Multiplicação (ex.: 2 × 4 = 8)
- ✅ Divisão (ex.: 6 / 3 = 2)
- ✅ Potenciação (ex.: 3 ^ 2 = 9)
- ✅ Fatorial (ex.: 5! = 120)

Detalhes de uso:
- Aceita entrada com ponto ou vírgula (exibe sempre vírgula no visor).
- Botão `00` para facilitar a digitação de inteiros grandes.
- Fatorial definido apenas para inteiros não negativos (0! = 1, limite prático ≤ 170).
- Orientação travada em retrato e teclado responsivo.

---

## 📱 Layout

Layout inspirado no exemplo da disciplina:

```
C   ^   !   /
7   8   9   *
4   5   6   -
1   2   3   +
0  00   .   =
```

- Botões de operação em preto (texto branco) e dígitos em cinza claro (texto preto).
- Visor com fundo cinza escuro e texto autoajustável.

---

## 🚀 Como Executar

Pré-requisitos:
- Flutter SDK 3.x instalado (`flutter --version`)
- Android Studio ou VS Code com extensões Flutter/Dart
- Emulador Android/iOS ou dispositivo físico

Clonando e rodando:
```
git clone <URL_DO_REPOSITORIO>
cd <PASTA_DO_REPOSITORIO>
flutter pub get
flutter run
```

Também é possível rodar no Chrome (se o Flutter Web estiver habilitado):
```
flutter run -d chrome
```

---

## ▶️ Como Usar

- Dígitos: `0–9`, `00` e `.`
- Limpar: `C`
- Operações binárias: `+  -  *  /  ^` (pressione `=` para o resultado)
- Operação unária: `!` (aplica sobre o número atual no visor)

Exemplos rápidos:
- `6 . 7 + 9 . 2 =` → `15,9`
- `3 ^ 2 =` → `9`
- `5 !` → `120`

Notas de precisão:
- A exibição aplica arredondamento para evitar caudas como `15,899999999999999`.
- O visor sempre usa vírgula como separador decimal.

---

## 🧠 Estrutura do Projeto

```
lib/
  main.dart                 # Inicialização e lock de orientação
  telas/
    calculadora.dart        # Scaffold, visor e teclado
  componentes/
    visor.dart              # Visor com AutoSizeText
    teclado.dart            # Linhas de botões
    botao.dart              # Botão (dígito/operador)
    linha_botoes.dart       # Linha com espaçamentos
  modelos/
    memoria.dart            # Lógica da calculadora
```

---


## 🛠️ Desenvolvimento

- Formatação/estilo: padrão do projeto Flutter.
- Dependências: `auto_size_text`.
- SDK: `>=3.0.0 <4.0.0`.

---

## 📝 Créditos

Projeto acadêmico da disciplina Desenvolvimento Mobile II.

- 👨‍🏫 Professor: Luccas Rafael
- 🧑‍🎓 Aluno: João Victor
