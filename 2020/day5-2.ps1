@"
--- Part Two ---
Ding! The "fasten seat belt" signs have turned on. Time to find your seat.

It's a completely full flight, so your seat should be the only missing boarding pass in your list. However, there's a catch: some of the seats at the very front and back of the plane don't exist on this aircraft, so they'll be missing from your list as well.

Your seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from yours will be in your list.

What is the ID of your seat?

"@

$Seats = Get-Content .\day5-data.txt
[int]$MySeat = 0
[int]$CurrentSeat = 0


# Parsing the values into their seat value and returning the info to a new array
$results = @(
Foreach ($Seat in $Seats)
{
    #Split off the Row and Column
    $Row = $Seat.Substring(0,7)
    $Row = $Row.Replace('F','0')
    $Row = $Row.Replace('B','1')
    $Row = [Convert]::ToInt32($Row,2)
    $Column = $Seat.Trim("B","F")
    $Column = $Column.Replace('R','1')
    $Column = $Column.Replace('L','0')
    $Column = [Convert]::ToInt32($Column,2)
    ($Row * 8) + $Column
}
)
#Sets the CurrentSeat to the first number in the array
$CurrentSeat = ($results | Sort-Object)[0]
#Going through the array looking for the missing entry

For ($CurrentSeat = ($results | Sort-Object)[0]; $CurrentSeat -lt ($results | Sort-Object -Descending)[0]; $CurrentSeat++)
{
    If ($Results.Contains($CurrentSeat))
    {} Else {$MySeat = $CurrentSeat}
}

Write-Output $MySeat