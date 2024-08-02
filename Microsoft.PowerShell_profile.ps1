Invoke-Expression (&starship init powershell)
$host.UI.RawUI.WindowTitle = "PowerShell"

Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})

Import-Module PSReadLine
