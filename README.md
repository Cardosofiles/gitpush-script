# 🚀 Script de Git Push Automatizado no WSL

Este script simplifica o fluxo de trabalho com Git, permitindo que você execute `git add .`, `git commit` com mensagem, e `git push` para a branch atual com um único comando.

---

## 📁 Estrutura

- Script: `git-push.sh`
- Local: `~/git-push.sh`

---

## 📜 Conteúdo do Script

```bash
#!/bin/bash

if [ ! -d .git ]; then
  echo "❌ Você não está em um repositório Git!"
  exit 1
fi

echo "📦 Status do repositório:"
git status

read -p "✏️  Digite a mensagem do commit: " mensagem

if [ -z "$mensagem" ]; then
  echo "⚠️  A mensagem do commit não pode estar vazia!"
  exit 1
fi

echo "➕ Adicionando arquivos..."
git add .

echo "📝 Criando commit..."
git commit -m "$mensagem"

branch=$(git rev-parse --abbrev-ref HEAD)

echo "🚀 Enviando para a branch '$branch'..."
git push origin "$branch"

echo "✅ Push realizado com sucesso!"
```

---

## ✅ Como Instalar e Usar

### 1. 📥 Criar o script

```bash
nano ~/git-push.sh
```

Cole o conteúdo acima e salve (`Ctrl+O`, `Enter`, `Ctrl+X`).

---

### 2. 🔓 Dar permissão de execução

```bash
chmod +x ~/git-push.sh
```

---

### 3. ⚙️ Tornar o script global

Edite o arquivo `.zshrc` ou `.bashrc`:

```bash
nano ~/.zshrc
```

Adicione esta linha ao final:

```bash
alias gitpush="~/git-push.sh"
```

Salve e recarregue o terminal:

```bash
source ~/.zshrc
```

---

### 4. 🚀 Usar o comando

Navegue até o diretório do seu projeto e rode:

```bash
gitpush
```

---

## 🧠 Dica

Você pode personalizar este script para incluir validações, log de histórico, commits convencionais, entre outros.

---

## 📌 Requisitos

- Git instalado
- Ambiente Linux (Ubuntu, Kali, Arch, etc...)
- Projeto já inicializado com Git (`git init`)
- Configuração com ssh CLI do Github

---

## 🛠 Exemplo de uso

```bash
$ gitpush
📦 Status do repositório:
...
✏️  Digite a mensagem do commit: feat: adiciona script de automação
...
✅ Push realizado com sucesso!
```

# 🚀 GitHub CLI – Guia de Comandos e Convenções de Commits

## 🧠 Prefixos de Commits Convencionais

| Prefixo    | Descrição                                                                           |
| ---------- | ----------------------------------------------------------------------------------- |
| `feat`     | ✨ Inclusão de novo recurso (relaciona-se com **MINOR** no versionamento semântico) |
| `fix`      | 🐛 Correção de bugs (relaciona-se com **PATCH** no versionamento semântico)         |
| `docs`     | 📚 Mudanças na documentação (ex: README)                                            |
| `test`     | 🧪 Criação ou modificação de testes (sem alterar lógica do código)                  |
| `build`    | 🛠️ Alterações em arquivos de build ou dependências                                  |
| `perf`     | ⚡ Melhorias de performance                                                         |
| `style`    | 🎨 Alterações visuais no código (indentação, espaçamento, etc)                      |
| `refactor` | 🧹 Refatorações sem alteração de comportamento                                      |
| `chore`    | 🔧 Tarefas administrativas (ex: configuração, atualizações de pacote)               |
| `ci`       | 🤖 Mudanças na integração contínua (CI/CD)                                          |
| `raw`      | 📦 Mudanças em arquivos de configuração ou parâmetros crus                          |
| `cleanup`  | 🧽 Limpeza de código, comentários ou arquivos obsoletos                             |
| `remove`   | ❌ Remoção de arquivos ou funcionalidades obsoletas                                 |

---

## 💻 GitHub CLI: Autenticação e Configuração

| Comando        | Descrição                             |
| -------------- | ------------------------------------- |
| gh auth login  | 🔑 Login na conta GitHub via terminal |
| gh auth status | 🔍 Verifica status da autenticação    |
| gh auth logout | 🚪 Faz logout                         |

## 📦 Comandos `gh repo` Repositórios (GitHub CLI)

| Comando                                                                    | Descrição                                         |
| -------------------------------------------------------------------------- | ------------------------------------------------- |
| `gh repo create`                                                           | ✨ Cria novo repositório (público ou privado)     |
| `gh repo clone <user>/<repo>`                                              | 📥 Clona um repositório existente                 |
| `gh repo fork`                                                             | 🍴 Cria um fork do repositório atual              |
| `gh repo view`                                                             | 🔍 Visualiza detalhes do repositório              |
| `gh repo list <user>`                                                      | 📜 Lista todos os repositórios de um usuário      |
| `gh repo edit --name novo-nome`                                            | ✏️ Renomeia o repositório                         |
| `gh repo edit --description "..."`                                         | 📝 Altera a descrição do repositório              |
| `gh repo edit --homepage URL`                                              | 🌐 Define ou altera a homepage associada          |
| `gh repo edit --visibility public --accept-visibility-change-consequences` | 🌞 Torna o repositório **público**                |
| `gh repo edit --visibility private`                                        | 🔒 Torna o repositório **privado**                |
| `gh repo delete`                                                           | 🗑️ Exclui o repositório (confirmação obrigatória) |

## 🌿 Branches e PRs

| Comando               | Descrição                           |
| --------------------- | ----------------------------------- |
| `gh pr create`        | 🚀 Cria uma nova Pull Request       |
| `gh pr list`          | 📋 Lista todas as Pull Requests     |
| `gh pr view <id>`     | 👀 Visualiza os detalhes de uma PR  |
| `gh pr checkout <id>` | 🔄 Faz checkout de uma Pull Request |
| `gh pr merge`         | ✅ Realiza o merge da Pull Request  |
| `gh pr close`         | ❌ Fecha uma Pull Request           |
| `gh pr reopen`        | ♻️ Reabre uma Pull Request fechada  |

## 🐞 Issues

| Comando                | Descrição                             |
| ---------------------- | ------------------------------------- |
| `gh issue create`      | 🐛 Cria uma nova issue                |
| `gh issue list`        | 📋 Lista todas as issues abertas      |
| `gh issue view <id>`   | 🔎 Visualiza os detalhes de uma issue |
| `gh issue close <id>`  | ✅ Fecha uma issue                    |
| `gh issue reopen <id>` | ♻️ Reabre uma issue fechada           |

## ⚙️ GitHub Actions e Workflows

| Comando            | Descrição                                         |
| ------------------ | ------------------------------------------------- |
| `gh workflow list` | ⚙️ Lista os workflows configurados no repositório |
| `gh run list`      | 🔁 Mostra as execuções recentes dos workflows     |

## ✨ Exemplo de uso prático

```bash
gh repo create <name_repo> --public
gh repo clone Cardosofiles/minha-app
cd minha-app
gh issue create --title "Novo recurso" --body "Descrição aqui"
gh pr create --base main --head feature/api --title "Nova API" --body "Adiciona integração"
```

### ❤️ Este guia foi criado com 💻 + ☕ por Cardosofiles
