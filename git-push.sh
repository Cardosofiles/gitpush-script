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
