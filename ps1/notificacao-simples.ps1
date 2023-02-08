$Title = "Notificação"
$Message = "Teste Notificação"
$Button1 = New-Object System.Management.Automation.Host.ChoiceDescription "Ir para o Site", "Start-Process 'https://example.com'"
$Button2 = New-Object System.Management.Automation.Host.ChoiceDescription "Abrir no Explorer", "Start-Process explorer.exe"
$Options = [System.Management.Automation.Host.ChoiceDescription[]]($Button1, $Button2)
$Result = $Host.UI.PromptForChoice($Title, $Message, $Options, 0)
