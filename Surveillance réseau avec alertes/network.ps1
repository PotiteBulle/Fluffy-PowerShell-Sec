# Liste noire d'IPs à surveiller (IP utilisée pour l'exemple - IP à changer en fonction de vos paramètres).
$badIPs = @("198.51.100.1", "203.0.113.5")

# Récupère toutes les connexions TCP en cours
$connections = Get-NetTCPConnection | Where-Object { $badIPs -contains $_.RemoteAddress }

# Pour chaque connexion suspecte, affiche une alerte
foreach ($connection in $connections) {
    Write-Host "Connexion suspecte détectée : Source $($connection.LocalAddress) vers $($connection.RemoteAddress) sur le port $($connection.RemotePort)"
}

# Enregistre les connexions suspectes dans un fichier log dans le dossier prévue pour
$logPath = "C:\SecurityLogs\NetworkMonitor.log" # à changer en fonction de vos paramètre
$connections | Out-File -Append $logPath
