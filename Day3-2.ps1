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
[System.Collections.ArrayList]$Values = Import-Csv .\Day3-Demo.csv -header Value


#This was the loop statement I was looking for in Day3-1

#This is setting the number of digits in length of the CSV entries
$ValueCount = $Values.Value[0].Length
#Decrementing the number by one since the indexes start at 0 instead of 1
$ValueCount--

#This will loop the whole process the number of times to match the length of the CSV entries
for ($indexLength = 0; $indexLength -lt $ValueCount; $indexLength++)
{

#Reset the variables for each pass
$Zero = 0
$One = 0
$Keeper =

#Loop for each entry in the CSV, looping for the number of entries in the CSB
for ($index = 0; $index -lt $Values.Count; $index++)
{
#Convert the entry to string to run SubString actions on it
    $l = $Values[$index].Value.ToString()
#Looking at the digit matching the loop we are in and incrementing the count on Zero or One
If ($l.Substring($indexLength,1) -eq 1)
    {$One ++}
Else {
    $Zero ++}
}
#Deciding which number has a higher count, giving One precident on ties
If ($Zero -gt $One)
    {$Keeper = 0}
else {
    $Keeper = 1}

# I need to reverse this lookup. When deleting an entry, the next number would slide back and get skipped when the index increments
for ($index = $ValueCount; $index -gt -1; $index--)
{
#Convert the entry to string to run SubString actions on it
$l = $Values[$index].Value.ToString()
#Checking if the entry not equals the keeper value, remove the entry
If ($l.Substring($indexLength,1) -ne $Keeper)
{
    Write-Host $Values.RemoveAt($index)
}
Else {Write-Host Keeping $Values($index)}
}
#If we have gotten down to 
If ($Values.count -eq 1)
{Break
Write-Host $Values}

Write-Host Value $indexLength
Write-Host Zero $Zero
Write-Host One $One
Write-Host Keeper $Keeper
Write-Host $Values
}

