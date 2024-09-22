# Définit une liste de paramètres de sécurité à vérifier (Password & Lock)
$settings = @(
    @{ Name="Longueur du mot de passe"; Path="HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"; Key="MinimumPasswordLength"; Expected=14 },
    @{ Name="Seuil de verrouillage de compte"; Path="HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"; Key="LockoutThreshold"; Expected=5 }
)

# Vérifie chaque paramètre pour voir s'il respecte les attentes demander
foreach ($setting in $settings) {
    $currentValue = Get-ItemProperty -Path $setting.Path -Name $setting.Key
    # Compare la valeur actuelle à la valeur attendue
    if ($currentValue.$($setting.Key) -ne $setting.Expected) {
        Write-Host "$($setting.Name) n'est pas conforme. Valeur actuelle: $($currentValue.$($setting.Key)), attendu: $($setting.Expected)"
    } else {
        Write-Host "$($setting.Name) est conforme."
    }
}