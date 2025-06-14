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
