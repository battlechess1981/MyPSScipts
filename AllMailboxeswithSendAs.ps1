Set-ExecutionPolicy RemoteSigned
$Cred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Cred -Authentication Basic –AllowRedirection
Import-PSSession $Session –DisableNameChecking
#Get-Mailbox | Get-RecipientPermission | ? {$_.Trustee -ne "NT AUTHORITY\SELF" -and $_.Trustee -ne "NULL SID"} | select Identity,@{n="RecipientType";e={((Get-Recipient $_.Identity -ErrorAction silentlycontinue).RecipientTypeDetails + (Get-Recipient $_.Identity -RecipientTypeDetails GroupMailbox -ErrorAction silentlycontinue).RecipientTypeDetails)}},Trustee, Access* | ft -a 
