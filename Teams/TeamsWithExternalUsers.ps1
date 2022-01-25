##Cleaninguptheteamscloset##

#1. Connect to Microsoft Teams
Connect-MicrosoftTeams

# 2. Get all teams and pass them to $Teams
$Teams = Get-team


# 3. For each team in $Teams
# 4. Get the groupid and pass it to $GroupID
# 5. Get Team Users "name" who have a role of "Guest" and pass it to $TeamGuests
# 6. Get Team Users "name" who have a role of "Owner" and pass it to $Owner

$Teams | ForEach-Object{
    $GroupID = $_.GroupID
    
     $global:TeamGuests = Get-TeamUser -GroupId $GroupID -Role Guest | select name
     $global:Owner = Get-TeamUser -GroupId $GroupID -Role Owner | select name

# 7. For each Guest in $TeamGuests
# 8. Get-Team where groupid is from $GroupID, Select the groupid, displayname, teamowner, guest.

        $TeamGuests | ForEach-Object {
        Get-Team -GroupId $GroupID | select Groupid, Displayname,@{ Name = 'TeamOwner'; Expression = {$global:Owner}}, @{Name = 'TeamGuestUser'; Expression = {$global:TeamGuests}}

# 9. Formats the output into a list, Makes sure output is unique and outputs the file to the location of your choice.
        ## Please Ensure you change the output location to a location of your choice ##
       
        } | fl | Get-Unique | Out-File -Append C:\Temp\PowershellExtracts\TeamGuestUsers.txt


}