# Récupère les mises à jour disponibles pour Windows en utilisant la commande Get-WindowsUpdate. Puis filtre ensuite pour n'inclure que celles qui ne sont pas installées (IsInstalled -eq $false).
$missingPatches = Get-WindowsUpdate | Where-Object { $_.IsInstalled -eq $false }

# Si des correctifs manquants sont détectés
if ($missingPatches){
    # Affiche un message indiquant que des correctifs sont manquants
    Whrite-Host "Correctifs Manquants :"

    # Affiche une table formaté avec les collones 'Title' et 'KBArticleID' des correctifs manquants
    $missingPatches | Format-Table -Property Titel, KBArticleID
} else{
    # Si aucun correctif n'est maanquant, affiche un message indiquant que tous les correctifs sont installés
    Whrite-Host "Tous les correctifs de sécurités sont installés."
}