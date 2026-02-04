# 💾 Smart Backup for WSL/Linux
> Automação inteligente de backups para ambientes de desenvolvimento.

Este script em Shell foi desenvolvido para solucionar o problema de backups volumosos em ambientes de lab e desenvolvimento, onde pastas de dependências (como `node_modules` ou `.terraform`) ocupam espaço desnecessário nos arquivos de arquivamento.

## 🚀 Diferenciais Técnicos
* **Exclusão Inteligente:** Filtra automaticamente diretórios pesados e redundantes, reduzindo o tamanho do backup em até 95%.
* **Logs de Execução:** Gera registros detalhados para auditoria e troubleshooting de falhas.
* **Segurança:** Implementado com verificação de permissões de escrita e integridade de diretórios.
* **Agendamento:** Totalmente compatível com `cron` para execuções periódicas sem intervenção manual.

## 🛠️ Tecnologias
* **Linguagem:** Bash (Shell Scripting)
* **Ferramentas:** `tar`, `gzip`, `find`
* **Sistema:** Linux / WSL (Windows Subsystem for Linux)

## 📋 Como utilizar
1. Clone o repositório.
2. Dê permissão de execução ao script: `chmod +x backup.sh`.
3. Configure as variáveis de origem e destino no cabeçalho do arquivo.
4. Execute manualmente ou adicione à sua `crontab`.

---
*Este projeto demonstra competências de automação Linux e otimização de storage, fundamentais para práticas de SRE.*
