#O2 Rating is based off the more common digit
#If equal number of 0 and 1, select 1
#Dump all values that don't match the value

#CO2 scrubbing is based off the less common digit
#If equal number of 0 and 1, selct 0
#Dump all values that don't match the value

#Import list
#Parse first digit for most common, tie break 1
#Audit list removing all of the less common first digit
#Count number of remaining entries
#Repeat

#We are using ArrayList since it lets us delete entries in the Array directly
[System.Collections.ArrayList]$Values = Import-Csv .\Day3-Demo.csv -header Values


#This was the loop statement I was looking for in Day3-1

#Digit Zero
$Zero = 0
$One = 0
$Keeper =

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

#If ($Values -eq 1)
#{Write-Host $Values}
#Else {Write-host $Values.Count}
Write-Host Value 0
Write-Host Zero $Zero
Write-Host One $One
Write-Host Keeper $Keeper
Write-Host $Values


#Digit 1
$Zero = 0
$One = 0
$Keeper =

for ( $index = 0; $index -lt $Values.count; $index++)
{
$l = $Values[$index].Values.ToString()
If ($l.Substring(1,1) -eq 1)
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
If ($l.Substring(1,1) -ne $Keeper)
{$Values.RemoveAt($index)}
}

#If ($Values -eq 1)
#{Write-Host $Values}
#Else {Write-host $Values.Count}
Write-Host Value 1
Write-Host Zero $Zero
Write-Host One $One
Write-Host Keeper $Keeper
Write-Host $Values

#Digit 2
$Zero = 0
$One = 0
$Keeper =

for ( $index = 0; $index -lt $Values.count; $index++)
{
$l = $Values[$index].Values.ToString()
If ($l.Substring(2,1) -eq 1)
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
If ($l.Substring(2,1) -ne $Keeper)
{$Values.RemoveAt($index)}
}


#If ($Values -eq 1)
#{Write-Host $Values}
#Else {Write-host $Values.Count}
Write-Host Value 2
Write-Host Zero $Zero
Write-Host One $One
Write-Host Keeper $Keeper
Write-Host $Values

#Digit 3
$Zero = 0
$One = 0
$Keeper =

for ( $index = 0; $index -lt $Values.count; $index++)
{
$l = $Values[$index].Values.ToString()
If ($l.Substring(3,1) -eq 1)
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
If ($l.Substring(3,1) -ne $Keeper)
{$Values.RemoveAt($index)}
}

#If ($Values -eq 1)
#{Write-Host $Values}
#Else {Write-host $Values.Count}
Write-Host Value 3
Write-Host Zero $Zero
Write-Host One $One
Write-Host Keeper $Keeper
Write-Host $Values

#Digit 4
$Zero = 0
$One = 0
$Keeper =

for ( $index = 0; $index -lt $Values.count; $index++)
{
$l = $Values[$index].Values.ToString()
If ($l.Substring(4,1) -eq 1)
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
If ($l.Substring(4,1) -ne $Keeper)
{$Values.RemoveAt($index)}
}

#If ($Values -eq 1)
#{Write-Host $Values}
#Else {Write-host $Values.Count}
Write-Host Value 4
Write-Host Zero $Zero
Write-Host One $One
Write-Host Keeper $Keeper
Write-Host $Values