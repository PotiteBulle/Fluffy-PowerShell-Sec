# Déclare un tableau contenant les chamins des dossiers à vérifier
$folders = @("C:\SensitiveData", "C:\Confidential") # Pour l'exemple (changer en fonction de vos dossiers sensibles)


#Boucle pour chaque dossier dans le tableau $folders
foreach ($folder in $ folders){

    # Récupère les contrôles d'accès (ACL) pour le dossier actuel
    $acl = Get-Acl -Path $folder

    # Affiche un message indiquant que le dossiier dont on va afficher les permissions
    Write-Host "Permissions pour le dossier : $folder"

    # Affiche les permission d'accès sous forme de table : Utilisateurices ou Groupe / Droits d'accès (Lecture, écriture, etc...) / Type de contrôle d'accès (Autoriser ou Refuser)
    $acl.Access | Format-Table -Property IdentityReference, FileSystemRights, AccessControlType
}