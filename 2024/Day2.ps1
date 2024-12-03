#Take the input
#Each line is its own test
#Need to confirm if
	#All of the numbers are always increasing or decreasing
	#Each next number is at least one or at most three different than the previous

$SafeReports = 0
$count = 0
Foreach ($report in (Get-Content $PSScriptRoot\day2-sample.txt))
{
	$report = $report.Split(" ")
	$count = 0
	$fail = 0
	If ($report[$count] -gt $report[$count + 1])
{
	#Decreasing Numbers
	While ($count -le 5)
	{
			If (($report[$count] -gt $report[$count + 1]) -and (($report[$count] - $report[$count + 1]) -le 3))
			{
				#do nothing
			}
			else {
				$fail = 1
			}
			$count++
	}
}
ElseIf ($report[$count] -lt $report[$count + 1])
{
	#Increasing Numbers
}
If ($fail = 0)
{
	$SafeReports++
}
}
Write-Output $SafeReports