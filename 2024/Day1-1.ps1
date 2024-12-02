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