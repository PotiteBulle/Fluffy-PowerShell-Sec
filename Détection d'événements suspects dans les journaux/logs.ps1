# Récupère les entrées du journal des événements de sécurité et filtre pour ne conserver que les événements ayant l'ID '4625' (échec de connexion)
Get-EnventLog -LogName Securty | Where-Object { $_.EventID -eq 4625 } |

# Selection les propriétés pertinantes à afficher puis affiche
Select-Object -Property TimeGenerated, EntryType, InstanceId, Message |

# Affiche les résultats sous forme de table avec un ajustement automatique des colonnes
Format-Table -AutoSize
