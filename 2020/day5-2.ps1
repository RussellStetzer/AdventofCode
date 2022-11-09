@"
--- Part Two ---
Ding! The "fasten seat belt" signs have turned on. Time to find your seat.

It's a completely full flight, so your seat should be the only missing boarding pass in your list. However, there's a catch: some of the seats at the very front and back of the plane don't exist on this aircraft, so they'll be missing from your list as well.

Your seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from yours will be in your list.

What is the ID of your seat?

"@

$Seats = Get-Content .\day5-data.txt
#We need to build a function looking for seat 9 (Column 1 * 8 + 1). If no hit, increment the number and see if we get a match. Once we get a match, continue looking for matches until we don't find one. That one we don't find is our seat id.
$MySeat = 0
$SeatStart = $false

For ($count=0; $count -lt $MySeat; $count++)
{
    If ($SeatStart -eq $false)
    {
        #We have not yet found the first seat in the dataset
    }
    else {
       #We have found the first seat in the dataset
        
    }
}

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
    $SeatID = ($Row * 8) + $Column
    If ($SeatID -gt $HighSeatID)
    {
        $HighSeatID = $SeatID
    }
}
