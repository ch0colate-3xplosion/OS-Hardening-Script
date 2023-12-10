# PowerShell Script to Configure Security Settings on Individual Machines

# Enable LSA Protection
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" -Name "RunAsPPL" -Value 1
Write-Host "Enabling LSA Protection"

# Enable 'Require additional authentication at startup' for BitLocker
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE" -Name "UseAdvancedStartup" -Value 1

# Disable 'Autoplay' for all drives
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoDriveTypeAutoRun" -Value 255
Write-Host "Disabling Autoplay for all drives"

# Set default behavior for 'AutoRun' to 'Do not execute any autorun commands'
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoAutorun" -Value 1
Write-Host "Disabling Autorun to not execute any autorun"

# Disable 'Autoplay for non-volume devices'
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoAutoplayfornonVolume" -Value 1
Write-Host "Disabling Autorun for all non-volume devices"

# Set IPv6 source routing to highest protection
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\MSS\DisableIPSourceRouting" -Name "IPv6" -Value 2

# Enable 'Hide Option to Enable or Disable Updates' for Microsoft Office 2016
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" -Name "hideupdatenotifications" -Value 1

# Disable JavaScript on Adobe DC
New-Item -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown" -Force
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown" -Name "bDisableJavaScript" -Value 1

# Ensure Microsoft Defender Antivirus with Real-Time Protection is enabled
Set-MpPreference -DisableRealtimeMonitoring $false

# Set User Account Control (UAC) to automatically deny elevation requests
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value 0

# Enable 'Block third party cookies' in Google Chrome
Set-ItemProperty -Path "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" -Name "BlockThirdPartyCookies" -Value 1

Write-Host "Security settings applied."