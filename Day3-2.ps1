#O2 Rating is based off the more common digit
#If equal number of 0 and 1, select 1

#CO2 scrubbing is based off the less common digit
#If equal number of 0 and 1, selct 0

#Import list
#Parse first digit for most common, tie break 1
#Audit list removing all of the less common first digit
#Count number of remaining entries

$Zero = 0
$One = 0
$Keeper =


#We are using ArrayList since it lets us delete entries in the Array directly
[System.Collections.ArrayList]$Values = Import-Csv .\Day3-Demo.csv -header Values

#This was the loop statement I was looking for in Day3-1



for ( $index = 0; $index -lt $Values.count; $index++)
{
$l = $Values[$index].Values.ToString()
If ($l.Substring(0,1) -eq 1)
    {$One ++}
Else {
    $Zero ++}
}

If ($Zero -gt $One)
    {$Keeper = 0}
else {
    $Keeper = 1}

for ( $index = 0; $index -lt $Values.count; $index++)
{
$l = $Values[$index].Values.ToString()
If ($l.Substring(0,1) -ne $Keeper)
{$Values.RemoveAt($index)}
}

If ($Values -eq 1)
{Write-Host $Values}

#I think this works, but I need to encapsulate the whole thing in a second loop looking at which digit is being looked at.