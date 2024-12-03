#Part 1
#Import List, two column array
#Sort both columns into numerical order
#Subtract smaller number from bigger number, running count of the difference.
	#If A is bigger than B, A - B, Else B - A
$Total = 0
$count = 0
$array = @(Import-Csv $PSScriptRoot\day1-sample.csv -Header 'First', 'Second')
$firstArray = $array.First | Sort-Object
$secondArray = $array.Second | Sort-Object

#$array = @(Import-Csv $PSScriptRoot\day1-sample.csv -Header 'First', 'Second') | Sort-Object -Property First | Sort-Object -Property Second
while ($count -lt $firstArray.length)
{
	If ($firstarray[$count] -ge $Secondarray[$count]){
		$Total = $Total + ($firstArray[$count] - $SecondArray[$count])
		}
		Else {
		$Total = $Total + ($SecondArray[$count] - $firstArray[$count])
		}
		$count++
	}
Write-Output Part 1 $total

#set a Part2Total variable
#Get the first digit
#go through the second list and count how many times it shows up
#multiply the first digit against how many times it appears in the second list, and add it to the Total

$Part2Total = 0
$Part2Count = 0
Foreach ($Digit in $FirstArray)
{
$Part2Count = 0
	Foreach ($MatchDigit in $secondArray)
	{
		If ($Digit -eq $MatchDigit)
		{
			$Part2Count++
		}
	}
$Part2Total = $Part2Total + ([int]$Digit * $Part2Count)
}
Write-Output "Part 2 $Part2Total"