#This sets the variable for the OU being targeted just need the OU name. 
#If there is a duplicate named OU you will need the destinguised name. 
#example: OU=Workstations,OU=Administrative Computing Services,DC=UTSARR,DC=NET
$OUNAME = Read-Host "What OU Name to give LAPS Access to?"

#This sets the variable to What user or Security group to grant access to
$SECGROUP = Read-Host "What security group to grant access to?"


#This grants access to all systems in the OU to write the password to AD.
Set-AdmPwdComputerSelfPermission -identity $OUNAME

#This grants Access to read the password for an OU to specified Users.
Set-AdmPwdreadpasswordpermission -Identity $OUNAME -AllowedPrincipals $SECGROUP

#This grants Access to require the system to rotate its password.
Set-AdmPwdresetpasswordpermission -Identity $OUNAME -AllowedPrincipals $SECGROUP

#This provides a list of all Groups/Users that have permissions to LAPS for the OU
Find-AdmPwdExtendedRights -Identity $OUNAME | format-table extendedRightHolders -wrap