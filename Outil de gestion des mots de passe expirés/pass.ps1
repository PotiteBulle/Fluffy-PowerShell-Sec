# Récupère tous les utilisateurices Active Directory avec les propriétés 'PasswordExpired' & 'PasswordLastSet'
$users = Get-ADUser -Filter * - Property PasswordExpired, PasswordLastSet

# Boucle pour récupérer chaque tulisateurices
foreach ($user in $users) {
    # Vérifie si le password de l'utilisateurice est expiré
    if($user.PasswordExpired){
        # Affiche un message indiquant que le password de l'utilisateurice à expiré
        Write-Host "$($user.SamAccountName) a un mot de passe expiré."
    }
}