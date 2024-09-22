# Crée une requête pour surveillé les échecs de connexion dans les journaux de sécurité
$Query = @"
<QueryList>
  <Query Id="0" Path="Security">
    <Select Path="Security">*[System[EventID=4625]]</Select>
  </Query>
</QueryList>
"@

# Enregistre un événement qui s'exécute lorsqu'un nouvelle événement correspond à la requête puis l'écrit
Register-ObjectEvent -InputObject (Get-WinEvent -Query $Query) -EventName "EventRecordWritten" -Action {
    $event = $EventArgs.NewEvent
    # Affiche une alerte pour chaque échec de connexion détecté via l'ID EVENT 4625
    Write-Host "Intrusion détectée: Échec de connexion avec l'ID: $($event.Id), message: $($event.Message)"
} | Out-Null
