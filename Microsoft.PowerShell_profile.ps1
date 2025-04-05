Invoke-Expression (&starship init powershell)
$host.UI.RawUI.WindowTitle = "PowerShell"

Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})

function activate {
    if (Test-Path ".venv\Scripts\Activate.ps1") {
        . .venv\Scripts\Activate.ps1
    } else {
        Write-Host "No .venv found in current directory."
    }
}

Import-Module PSReadLine
