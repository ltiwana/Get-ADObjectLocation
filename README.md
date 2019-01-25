# Get-ADObjectLocation
Get OU location of the user or computer using PowerShell. This script can create a simple visual map for you to point out exact location of the AD object

<b>Examples</b>:<br>
`Get-ADObjectLocation -ComputerName MYPC`

<b>Output</b>:<br>
my.domain.local
<br>
&nbsp; &nbsp; |___ Developers
<br>
&nbsp; &nbsp; &nbsp; &nbsp; |___ Computers
<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |___ MYPC
    
    
<u><b>Examples</b></u>:<br>
`Get-ADObjectLocation -Username MyUserName`

<u><b>Output</b></u>:<br>
my.domain.local
<br>
&nbsp; &nbsp; |___ Developers
<br>
&nbsp; &nbsp; &nbsp; &nbsp; |___ Users
<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |___ MyUserName
