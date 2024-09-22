# Liste des serveurs à auditer
$servers = @("Server1", "Server2", "Server3") # Changer en fonction de vos propre paramètre

# Pour chaque serveur, vérifie les mises à jour manquantes
foreach ($server in $servers) {
    Invoke-Command -ComputerName $server -ScriptBlock {
        # Récupère les mises à jour manquantes
        $missingUpdates = Get-WindowsUpdate -IsInstalled -eq $false

        # Si des mises à jour sont manquantes, affiche un rapport
        if ($missingUpdates) {
            Write-Host "Mises à jour manquantes sur $env:COMPUTERNAME"
            $missingUpdates | Format-Table -Property Title, KBArticleID
        } else {
            Write-Host "Pas de mises à jour manquantes sur $env:COMPUTERNAME"
        }
    }
}

# Option d'installation automatique des mises à jour puis faire un redémarrage
Install-WindowsUpdate -AcceptAll -AutoReboot