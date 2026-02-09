# Smart Backup for WSL/Linux
> Intelligent backup automation for development environments.

This Shell script was developed to address the problem of large backups in lab and development environments, where dependency directories (such as `node_modules` or `.terraform`) consume unnecessary space in archive files.

## Technical Highlights
- **Smart Exclusion:** Automatically filters heavy and redundant directories, reducing backup size by up to 95%.
- **Execution Logs:** Generates detailed logs for auditing and failure troubleshooting.
- **Security:** Implemented with write-permission checks and directory integrity validation.
- **Scheduling:** Fully compatible with `cron` for periodic, unattended executions.

## Technologies
- **Language:** Bash (Shell Scripting)
- **Tools:** `tar`, `gzip`, `find`
- **System:** Linux / WSL (Windows Subsystem for Linux)

## How to Use
1. Clone the repository.
2. Grant execution permission to
