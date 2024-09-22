# Crée un écouteur sur le port RDP (3389) pour attirer les attaquants (Remote Desktop Protocol est un protocole qui permet à un.e utilisateurice de se connecter sur un serveur exécutant Microsoft Terminal Services.)
$listener = New-Object System.Net.Sockets.TcpListener([IPAddress]::Any, 3389)
$listener.Start()

# Boucle infinie pour accepter les connexions entrantes
while ($true) {
    $client = $listener.AcceptTcpClient()
    $remoteIP = $client.Client.RemoteEndPoint.Address.ToString()
    # Enregistre chaque connexion suspecte dans une log 'Honeypot.log'
    Write-Host "Connexion détectée depuis : $remoteIP"
    Add-Content -Path "C:\SecurityLogs\Honeypot.log" -Value "Connexion suspecte depuis : $remoteIP à $(Get-Date)" # Changer en fonction de vos paramètres
}