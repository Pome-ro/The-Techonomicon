$SearchBase = "OU of accounts we're migrating"
$AllADUsers =  get-aduser -filter * -searchbase $searchbase -properties SamAccountName,LegacyExchangeDN,Name,UserPrincipalName

foreach($ADUser in $AllADUsers){
	$LegacyExchangeDN = $ADUser.LegacyExchangeDN
	$Name = $ADUser.Name
	$SAM = $ADUser.SamAccountName
	$UPN = $ADUser.UserPrincipalName
	$Mailbox = Get-Mailbox -Identity $UPN
	$ForwardingAddress = "$SAM@newdomainname.com"

	# Make New Mail Contact
	if(!(Get-MailContact $ForwardingAddress -ErrorAction SilentlyContinue)){
		New-MailContact -name "$Name" -externalemailaddress $ForwardingAddress  -OrganizationalUnit "Contacts"
		Set-MailContact -identity "$Name" -emailaddresses "[X500]$LegacyExchangeDN"
	}

	Set-Mailbox $Mailbox -ForwardingAddress $ForwardingAddress -DeliverToMailboxandForward:$false
}