$ous = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=People,OU=Student Computing Services,DC=UTSARR,DC=NET" | Select-Object -ExpandProperty DistinguishedName
$ous | ForEach-Object{
    [psobject][ordered]@{
        OU = $_
        Count = (Get-ADUser -Filter * -SearchBase "$_").count
    }
}