<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Talamas Almonord
    LinkedIn        : https://www.linkedin.com/in/talamas-almonord-137733282/
    GitHub          : https://github.com/taalmonord/taalmonord
    Date Created    : 09-07-2026
    Last Modified   : 9-07-2026
    Version         : 5.00
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# STIG: WN11-AU-000500
# Requirement:
# The Application event log size must be configured to 32768 KB or greater.

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$ValueName    = "MaxSize"
$ValueData    = 32768

# Create the registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
    Write-Host "Created registry path: $RegistryPath"
}

# Configure the required STIG value
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -Value $ValueData `
    -PropertyType DWord `
    -Force | Out-Null

Write-Host "WN11-AU-000500 remediation complete."
Write-Host "Application Event Log MaxSize configured to $ValueData KB."
