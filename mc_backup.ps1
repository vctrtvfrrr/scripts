$minecraftPath = "$env:APPDATA\PrismLauncher\instances\Ethernal\minecraft"
$resticRepo = "D:\Games\Minecraft"
$iconFile = "$minecraftPath\icon.png"
$logFile = "$resticRepo\backup.log"
$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

function Send-Notification {
    param(
        [Parameter(Mandatory=$true)][string]$Title,
        [Parameter(Mandatory=$true)][string]$Message,
        [string]$Icon = $iconFile
    )

    if (Get-Module -Name BurntToast -ListAvailable) {
        Import-Module BurntToast
        New-BurntToastNotification -Text $Title, $Message -AppLogo $Icon
    } else {
        Write-Warning "$timestamp - O módulo BurntToast não está instalado. A notificação não foi enviada." | Out-File -FilePath $logFile -Append -Encoding UTF8
    }
}

$processToBackup = $false
try {
    $processes = Get-Process -Name "javaw" -ErrorAction Stop
    foreach ($p in $processes) {
        if ($p.Path -like "*PrismLauncher*") {
            $processToBackup = $true
            break
        }
    }
} catch {
}

if ($processToBackup -and (Test-Path $resticRepo)) {
    Write-Output "$timestamp - Minecraft rodando. Iniciando backup" | Out-File -FilePath $logFile -Append -Encoding UTF8

    try {
        cd $minecraftPath
        & restic --repo $resticRepo --insecure-no-password backup "." --exclude "*.lock" 2>&1 | Out-File -FilePath $logFile -Append -Encoding UTF8
        & restic --repo $resticRepo --insecure-no-password forget --keep-last 3 --prune 2>&1 | Out-File -FilePath $logFile -Append -Encoding UTF8

        if ($LASTEXITCODE -eq 0) {
            $successMsg = "Backup do Minecraft concluído com sucesso."
            Write-Output "$timestamp - $successMsg" | Out-File -FilePath $logFile -Append -Encoding UTF8
            Send-Notification -Title "Backup Concluído" -Message $successMsg
        } else {
            $errorMsg = "O Restic retornou um código de erro: $LASTEXITCODE. Verifique o log para detalhes."
            Write-Output "$timestamp - $errorMsg" | Out-File -FilePath $logFile -Append -Encoding UTF8
            Send-Notification -Title "ERRO no Backup" -Message $errorMsg -Icon $iconFile
        }
    } catch {
        $fatalError = "Erro FATAL ao executar o Restic: $($_.Exception.Message)"
        Write-Output "$timestamp - $fatalError" | Out-File -FilePath $logFile -Append -Encoding UTF8
        Send-Notification -Title "ERRO FATAL no Backup" -Message $fatalError -Icon $iconFile
    }
} else {
    $cancelMsg = "Minecraft não está rodando. Backup cancelado."
    Write-Output "$timestamp - $cancelMsg" | Out-File -FilePath $logFile -Append -Encoding UTF8
}
