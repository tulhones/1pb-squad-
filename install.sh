#!/bin/bash

set -e

REPO="https://github.com/ohmyjahh/1pb-squad.git"
COMMANDS_DIR="$HOME/.claude/commands"
TMP_DIR=$(mktemp -d)

echo ""
echo "1PB Squad — Instalando 144 agentes IA..."
echo ""

# Verificar se Claude Code está instalado
if [ ! -d "$HOME/.claude" ]; then
  echo "Erro: Claude Code não encontrado."
  echo "Instale em: https://claude.ai/code"
  exit 1
fi

# Criar pasta de commands se não existir
mkdir -p "$COMMANDS_DIR"

# Clonar repositório
echo "Baixando agentes..."
git clone --depth=1 "$REPO" "$TMP_DIR/1pb-squad" 2>/dev/null

# Copiar squads
SQUADS=(advisory-board brand c-level claude-code copy cybersecurity data design hormozi movement storytelling traffic)

for squad in "${SQUADS[@]}"; do
  if [ -d "$TMP_DIR/1pb-squad/$squad" ]; then
    rm -rf "$COMMANDS_DIR/$squad"
    cp -r "$TMP_DIR/1pb-squad/$squad" "$COMMANDS_DIR/$squad"
    echo "  ✓ $squad"
  fi
done

# Limpar temporários
rm -rf "$TMP_DIR"

echo ""
echo "Instalação concluída! 144 agentes disponíveis."
echo ""
echo "Use no Claude Code:"
echo "  /copy:david-ogilvy"
echo "  /hormozi:hormozi-offers"
echo "  /traffic:pedro-sobral"
echo ""
