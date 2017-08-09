# Set-Service clipsrv -startuptype "manual"


powershell_script 'Windows vmcfg' do
code <<-EOH

## wuauserv (Windows Update) ##
$Getwuauserv = Get-WmiObject -Class Win32_Service -Filter "Name='wuauserv'"
     If ($Getwuauserv.State -eq 'running') {
        $Getwuauserv.stopservice()
    }

    If ($Getwuauserv.StartMode -eq 'manual') {

  }  Elseif ($Getwuauserv.StartMode -eq 'Disabled' -or 'Auto') {

        Set-Service wuauserv -StartupType Manual
  }

### NlaSvc (Network Location Awareness ###
$GetNlaSvc = Get-WmiObject -Class Win32_Service -Filter "Name='NlaSvc'"
    If ($GetNlaSvc -eq 'manual') {

  }  Elseif ($GetNlaSvc -eq 'Disabled' -or 'Auto') {

        Set-Service NlaSvc -StartupType Manual
  }

### browser (Computer Browser) ###
$Getbrowser = Get-WmiObject -Class Win32_Service -Filter "Name='browser'"
     If ($Getbrowser.State -eq 'running') {
        $Getbrowser.stopservice()
    }
    If ($Getbrowser -eq 'Disabled') {


  }  ElseIf ($Getbrowser -eq 'Manual' -or 'Auto') {

        Set-Service browser -StartupType Disabled
}

### BITS (Background Intelligent Transfer Service) ###
$GetBITS = Get-WmiObject -Class Win32_Service -Filter "Name='BITS'"
If ($GetBITS.State -eq 'running') {
        $GetBITS.stopservice()
    }

    If ($GetBITS.StartMode -eq 'manual') {

  }  Elseif ($GetBITS.StartMode -eq 'Disabled' -or 'Auto') {

        Set-Service BITS -StartupType Manual
  }


### hidserv (Human Interface Device Access) ###
$Gethidserv = Get-WmiObject -Class Win32_Service -Filter "Name='hidserv'"
    If ($Gethidserv.State -eq 'running') {
        $Gethidserv.stopservice()
   }

    If ($Gethidserv.StartMode -eq 'Disabled') {

  }  Elseif ($Gethidserv.StartMode -eq 'Manual' -or 'Auto') {

        Set-Service hidserv -StartupType Disabled
  }

### PolicyAgent (IPsec Policy Agent Service) ###
$GetPolicyAgent = Get-WmiObject -Class Win32_Service -Filter "Name='PolicyAgent'"
    If ($GetPolicyAgent.State -eq 'Stopped') {
        $GetPolicyAgent.startservice()
    }
    If ($GetPolicyAgent.StartMode -eq 'Auto') {

  }  Elseif ($GetPolicyAgent.StartMode -eq 'Manual' -or 'Disabled') {

        Set-Service PolicyAgent -StartupType Auto
  }

### pla (Performance Logs & Alerts) ###
$Getpla = Get-WmiObject -Class Win32_Service -Filter "Name='pla'"
    If ($Getpla.State -eq 'Stopped') {
        $Getpla.startservice()
    }
    If ($Getpla.StartMode -eq 'Auto') {

  }  Elseif ($Getpla.StartMode -eq 'Manual' -or 'Disabled') {

        Set-Service pla -StartupType Auto
  }

### Spooler (Print Spooler) ###
$GetSpooler = Get-WmiObject -Class Win32_Service -Filter "Name='Spooler'"
    If ($GetSpooler.State -eq 'running') {
        $GetSpooler.stopservice()
    }
    If ($GetSpooler.StartMode -eq 'Manual') {

  }  Elseif ($GetSpooler.StartMode -eq 'Auto' -or 'Disabled') {

        Set-Service Spooler -StartupType Manual
  }

  ### RasAuto (Remote Access Auto Connection Manager) ###
$GetRasAuto = Get-WmiObject -Class Win32_Service -Filter "Name='RasAuto'"
    If ($GetRasAuto.StartMode -eq 'Auto') {

  }  Elseif ($GetRasAuto.StartMode -eq 'Manual' -or 'Disabled') {

        Set-Service RasAuto -StartupType Auto
  }

  ### RasMan (Remote Access Auto Connection Manager) ###
$GetRasMan = Get-WmiObject -Class Win32_Service -Filter "Name='RasMan'"
    If ($GetRasMan.StartMode -eq 'Manual') {

  }  Elseif ($GetRasMan.StartMode -eq 'Auto' -or 'Disabled') {

        Set-Service RasMan -StartupType Manual
  }

  ### TapiSrv (Telephony) ###
$GetTapiSrv = Get-WmiObject -Class Win32_Service -Filter "Name='TapiSrv'"
    If ($GetTapiSrv.State -eq 'running') {
        $GetTapiSrv.stopservice()
    }
    If ($GetTapiSrv.StartMode -eq 'Manual') {

  }  Elseif ($GetTapiSrv.StartMode -eq 'Auto' -or 'Disabled') {

        Set-Service TapiSrv -StartupType Manual
  }

   ### msiserver (Windows Installer) ###
$Getmsiserver = Get-WmiObject -Class Win32_Service -Filter "Name='msiserver'"
    If ($Getmsiserver.State -eq 'Stopped') {
        $Getmsiserver.startservice()
    }

Invoke-Item -Path c:\\Windows\\System32 -Exclude bcdedit.exe -Include "/timeout 5"

Invoke-Item -Path c:\\Windows\\System32 -Exclude powercfg.exe -Include "/hibernate off"

# Set Day Light Saving
$GetRegInfo = "HKLM:\\system\\CurrentControlSet\\Control\\TimeZoneInformation"
$value = "0"
    If($GetRegInfo.DynamicDaylightTimeDisabled -eq "0") {break}

        Else {
            New-ItemProperty -Path $GetRegInfo -Name DynamicDaylightTimeDisabled -Value $value -Force
           }


$GetRegInfo = "HKLM:\\software\\Microsoft\\Windows\\CurrentControlSet\\Control\\policies"
$value = "1"
  If($GetRegInfo.EnableLUA -eq "1") {break}
    Else {
            New-ItemProperty -Path $GetRegInfo -Name EnableLUA -Value $value -Force
          }

# Restart-Computer -ComputerName $env:computername

EOH

end
