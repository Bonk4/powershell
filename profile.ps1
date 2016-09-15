#If first time running:
#set execution policy to allow scripts before profile will run
#Set-ExecutionPolicy RemoteSigned

#print spidey logo
function BootUpPowerShell {
    $logo = Get-Content ".\Documents\WindowsPowerShell\spidey_logo.txt"

    foreach($line in $logo) {
        Write-Host ($line) -foregroundcolor Red
    }
    Write-Host ("")
}

#when powershell is launched
BootUpPowerShell

#register scripts from scripts folder
$scriptsPath = $env:USERPROFILE + "\Documents\WindowsPowershell\scripts\"
$scripts = Get-ChildItem -Path $scriptsPath
foreach($script in $scripts) {
    if ($script.Name -like '*.ps1') {
        . ($scriptsPath + $script.Name)
    }
}

try {
    ScriptsTest
}
catch [Exception]{
    Write-Host "Failed to import local scripts."
}

#custom cmd prompt
function Prompt {
    Write-Host ("Spider") -nonewline -foregroundcolor Red
    Write-Host ("-Man") -nonewline -foregroundcolor Blue
    Write-Host ("@") -nonewline -foregroundcolor Green
    Write-Host ((Get-Location).Path) -nonewline -foregroundcolor Yellow
    Write-Host (">") -nonewline -foregroundcolor Green
    return " ";
}

