# Récupère les membres du groupe Administrateurice
$admins = Get-ADGroupMember -Identity "Administrators" -Recursive | Select-Object -Property Name, SamAccountName, DistinguishedName

# Affiche la liste des comptes administrateurices dans Active Directory
Write-Host "Liste des comptes administrateurices dans Active Directory :"
$admins | Format-Table -AutoSize

# Recherche les utilisateurices avec des permissions spéciales dans une unité organisationnelle
$permissions = Get-ACL "AD:\OU=SensitiveOU,DC=domain,DC=com" | Select-Object -ExpandProperty Access
Write-Host "Permissions spéciales détectées :"
# Filtre les résultats pour n'afficher que les permissions non administratives
$permissions | Where-Object { $_.IdentityReference -notlike "*Administrators*" } | Format-Table -AutoSize