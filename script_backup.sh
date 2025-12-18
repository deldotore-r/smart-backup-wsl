#!/bin/bash

# ==============================================================================
# Script: Smart Backup de Código-Fonte (Linux / WSL)
#
# Objetivo:
# Criar snapshots compactados apenas do código autoral,
# excluindo dependências e artefatos que podem ser recriados.
#
# Uso típico:
# - Ambientes locais (Linux, WSL)
# - Backups rápidos e leves
# - Automação via cron
# ==============================================================================


# ------------------------------------------------------------------------------
# 1. CONFIGURAÇÃO DO USUÁRIO
# ------------------------------------------------------------------------------
# Diretório que contém seus projetos de código-fonte
SOURCE_DIR="$HOME/meus-projetos"

# Diretório onde os arquivos de backup serão armazenados
BACKUP_DIR="$HOME/backups"

# [OPCIONAL] Dias para manter os backups antigos (0 para desativar)
RETENTION_DAYS=7


# ------------------------------------------------------------------------------
# 2. METADADOS DO BACKUP
# ------------------------------------------------------------------------------
# Data no formato ISO (Ano-Mês-Dia) para melhor ordenação em listas
DATE_TAG="$(date +%Y-%m-%d)"

# Nome curto da máquina
HOST_TAG="$(hostname -s)"

# Nome final do arquivo de backup
BACKUP_FILE="backup_source_${HOST_TAG}_${DATE_TAG}.tar.gz"


# ------------------------------------------------------------------------------
# 3. PREPARAÇÃO DO AMBIENTE
# ------------------------------------------------------------------------------
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Erro: O diretório de origem '$SOURCE_DIR' não existe."
    exit 1
fi

echo "[$(date +%T)] Iniciando backup do código-fonte..."


# ------------------------------------------------------------------------------
# 4. EXECUÇÃO DO SMART BACKUP
# ------------------------------------------------------------------------------
# O foco é preservar apenas o código autoral.
# 
# NOTA SOBRE EXCLUSÕES: 
# Caso necessário, acrescente mais linhas "--exclude='...'" abaixo para ignorar
# pastas de build ou ambientes virtuais (ex: 'venv', 'target', '.next', 'bin').
# ------------------------------------------------------------------------------

tar -zcf "$BACKUP_DIR/$BACKUP_FILE" \
    --exclude='.git' \
    --exclude='.terraform' \
    --exclude='node_modules' \
    --exclude='vendor' \
    "$SOURCE_DIR" 2>/dev/null


# ------------------------------------------------------------------------------
# 5. VALIDAÇÃO E LIMPEZA
# ------------------------------------------------------------------------------
if [ $? -eq 0 ]; then
    echo "-------------------------------------------"
    echo "Backup concluído com sucesso."
    echo "Arquivo: $BACKUP_DIR/$BACKUP_FILE"
    ls -lh "$BACKUP_DIR/$BACKUP_FILE"
    echo "-------------------------------------------"

    # Limpeza: Remove backups antigos para evitar lotação do disco
    if [ $RETENTION_DAYS -gt 0 ]; then
        find "$BACKUP_DIR" -name "backup_source_*.tar.gz" -mtime +$RETENTION_DAYS -delete
        echo "Limpeza: Arquivos com mais de $RETENTION_DAYS dias foram removidos."
    fi
else
    echo "Erro crítico durante o backup."
    exit 1
fi