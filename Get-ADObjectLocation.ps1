

Function Get-ADObjectLocation {

    Param (
    
        [String]$ComputerName,
        [String]$UserName

    )
    
    $Output = "`n`n"

    if ($ComputerName) {

        Try {
            $PCInfo = Get-ADComputer $ComputerName -Properties CanonicalName
        }
        Catch {
            write-host "`nError: Unable to query AD object $ComputerName." -ForegroundColor Red
            Write-Host ("Below error was returend by the command`n" + $_.Exception.Message + "`n" + $_.Exception.ItemName) -ForegroundColor Red
            break
        } 
            
        $PCInfo.CanonicalName | foreach {

            $item = $_.split('/')

            for ($i = 0;$i -lt $item.count;$i++){
                Write-host ($output + $item[$i])

                $output = "|___ ".PadLeft($i+$i+5)
                $OU = $item[$item.count - 2]

            }

        }
    }
    elseif ($UserName) {
        Try {
            $UserInfo = (Get-ADUser $UserName -Properties CanonicalName)
        }
        Catch {
            write-host "`nError: Unable to query AD object `"$UserName`"." -ForegroundColor Red
            Write-Host ("Below error was returend by the command`n" + $_.Exception.Message + "`n" + $_.Exception.ItemName) -ForegroundColor Red
            break
        }
        $UserInfo.CanonicalName | foreach {

            $item = $_.split('/')

            for ($i = 0;$i -lt $item.count;$i++){
                Write-host ($output + $item[$i])

                $output = "|___ ".PadLeft($i+$i+5)
                $OU = $item[$item.count - 2]

            }

        }
    }
    
    else {
        Write-Host "`nError: Either ComputerName or UserName is expected, both cannot be left empty." -ForegroundColor Red
    }
}