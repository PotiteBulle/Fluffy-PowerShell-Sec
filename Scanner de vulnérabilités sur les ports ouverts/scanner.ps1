$ip = "192.168.1.1"
$ports = 1..1024

foreach ($port in ports){
    $connection = Test-NetConnection -ComputerName $ip -Port $port
    if($connection.TcpTestSucceeded){
        Whrite-Host "Port $ port is open"
    }
}