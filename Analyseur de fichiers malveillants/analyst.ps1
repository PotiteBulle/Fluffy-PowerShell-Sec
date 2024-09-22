# Définit le répertoire à analyser
$directory = "C:\Users\Verify\Downloads\" # Changer en fonction de vos paramètre
# Récupère les hachages de tous les fichiers dans le répertoire
$hashes = Get-ChildItem -Path $directory -Recurse | Get-FileHash | ForEach-Object {
    $_ | Add-Member -MemberType NoteProperty -Name "FilePath" -Value $_.Path
    $_
}

# Appel vers l'API VirusTotal (exemple non fonctionnel, à compléter avec votre clé API)
$apiKey = "YOUR_API_KEY" #Clé Token API
# Vérifie chaque hachage contre VirusTotal
foreach ($hash in $hashes) {
    $response = Invoke-RestMethod -Uri "https://www.virustotal.com/vtapi/v2/file/report?apikey=$apiKey&resource=$($hash.Hash)" -Method Get
    # Si le fichier est suspect, affiche une alerte
    if ($response.response_code -eq 1 -and $response.positives -gt 0) {
        Write-Host "Fichier suspect : $($hash.FilePath) - Détections : $($response.positives)"
    }
}