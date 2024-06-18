# Verifica se o Winget está instalado
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "Winget não está instalado. Por favor, instale o Winget e execute novamente."
    exit 1
}

# Lista de programas para instalar
$programs = @(
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "JetBrains.IntelliJIDEA.Ultimate",
    "Oracle.MySQLWorkbench",
    "Discord.Discord",
    "Valve.Steam",
    "Spotify.Spotify",
    "Cockos.REAPER",
    "ONLYOFFICE.DesktopEditors",
    "OBSProject.OBSStudio",
    "VMware.WorkstationPlayer"
)

# Instalação dos programas
foreach ($program in $programs) {
    Write-Host "Instalando $program..."
    winget install --id=$program -e --accept-package-agreements --accept-source-agreements
}

# Instalação do JDK/JRE
Write-Host "Instalando o JDK e JRE..."
winget install --id=Oracle.JDK -e --accept-package-agreements --accept-source-agreements

# Habilitar virtualização
Write-Host "Habilitando a virtualização..."
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -All -NoRestart

# Mensagem de conclusão
Write-Host "Instalação de software concluída. Por favor, reinicie o sistema para concluir a habilitação da virtualização."
