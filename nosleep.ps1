#NoSleep



param($sleep = 5) # of Seconds
$announcementInterval = 10 # of loops

Clear-Host

$WShell = New-Object -com "Wscript.Shell"
$date = Get-Date -Format "dddd MM/dd HH:mm (K)"

$stopwatch

try {
    $stopwwatch = [System.Diagnostics.stopwatch]::StartNew()
} catch {
    Write-host "Couldn't Start the stopwatch"

}

Write-Host "Excecuting Scrolllock-toggle Nosleep routine."
Write-Host "Start Time:" $(Get-Date -Format "dddd MM/dd HH:mm (K)")

Write-Host "<3" -fore Red

$index = 0

while ( $true )
{ 
    Write-Host "< 3" -fore red #heartbeat
    $WShell.sendkeys("{SCROLLLOCK}")
    Write-Host "<3" -fore red #heartbeat

    Start-sleep -seconds $sleep

    #Annonce runtime on interval

    if ( $stopwatch.IsRunning -and (++$index % $announcementInterval) -eq 0 )
    {
        Write-Host "Elapsed Time: " $stopwatch.Elapsed.ToString('dd\.hh\:mm\:ss')
    }
}
