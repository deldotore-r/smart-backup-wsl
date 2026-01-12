# Smart Backup for Source Code (Linux/WSL) 🚀
[![Shell Script](https://img.shields.io/badge/Shell_Script-%23121011.svg?style=flat&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)](https://www.linux.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

### 📉 De 4.2GB para 3.6MB: Otimização Real no WSL

Este script nasceu da necessidade de criar backups diários eficientes para ambientes de desenvolvimento. Ao ignorar dependências pesadas que podem ser recriadas (como `node_modules` e providers do Terraform), consegui uma redução drástica no armazenamento e tempo de execução.

## ✨ Funcionalidades

- **Smart Backup:** Usa o `tar` com filtros inteligentes para focar apenas no código autoral.
- **Security First:** Preparado para respeitar permissões de usuário (Privilégio Mínimo).
- **Auto-Cleanup:** Sistema de retenção configurável para remover backups antigos automaticamente.
- **Log Amigável:** Saída visual com data, hora e tamanho do arquivo gerado.

## 🛠️ Como usar

1. **Clonar o repositório:**
```bash
   git clone https://github.com/deldotore-r/smart-backup-wsl.git
   cd nome-do-repo
```

2. **Configurar o script:**
   
   Abra o arquivo `script_backup.sh` e ajuste as variáveis de diretório:
```bash
   SOURCE_DIR="$HOME/meus-projetos"
   BACKUP_DIR="$HOME/backups"
```

3. **Dar permissão de execução:**
```bash
   chmod +x script_backup.sh
```

4. **Executar manualmente:**
```bash
   ./script_backup.sh
```

## ⏰ Automatizando com Cron (Recomendado)

Para automatizar o backup, edite o crontab do seu usuário:
```bash
crontab -e
```

No editor que abrir, adicione a seguinte linha ao final do arquivo:
```bash
# ┌───────────── minute (0 - 59)
# │ ┌─────────── hour (0 - 23)
# │ │ ┌───────── day of month (1 - 31)
# │ │ │ ┌─────── month (1 - 12)
# │ │ │ │ ┌───── day of week (0 - 6) (Sunday=0)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * command to execute

# Ex.: Todos os dias úteis, às 13h00

0 13 * * 1-5 /bin/bash /caminho/completo/para/script_backup.sh
```

**Dica:** Use o caminho absoluto para o script. 

Salve o arquivo (no nano: `Ctrl+O`, `Enter`, `Ctrl+X`; no vim: `:wq`). Para verificar se a tarefa foi agendada:
```bash
crontab -l
```

## 🔍 Exclusões Personalizadas

O script já vem configurado para ignorar:
- `.git`
- `node_modules`
- `.terraform`
- `vendor`

Para adicionar novas pastas (como `venv` ou `target`), basta editar a seção de `tar` no script adicionando a flag `--exclude='nome-da-pasta'`.

---


Projeto focado em automação local confiável, aplicando fundamentos essenciais de Linux e Shell Script usados rotineiramente em ambientes SRE e DevOps.





