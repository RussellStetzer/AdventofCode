@"
--- Part Two ---
Time to check the rest of the slopes - you need to minimize the probability of a sudden arboreal stop, after all.

Determine the number of trees you would encounter if, for each of the following slopes, you start at the top-left corner and traverse the map all the way to the bottom:

Right 1, down 1.
Right 3, down 1. (This is the slope you already checked.)
Right 5, down 1.
Right 7, down 1.
Right 1, down 2.
In the above example, these slopes would find 2, 7, 3, 4, and 2 tree(s) respectively; multiplied together, these produce the answer 336.

What do you get if you multiply together the number of trees encountered on each of the listed slopes?
"@

#For the last example, maybe keep a count of how many rown down you go. If even, increment the Column and row. If odd, only increment the row?

$Passes = import-csv .\day3-input.csv -Header Right, Down
$Array = import-csv .\day3-sample.csv -Header Value
#Starting Total at 1 so that we can multiply the later steps succesfully
[Int64]$Total = 1
#Using this count to accound for the Passes that have Down set to a value higher than 1
[int]$Count = 0

ForEach ($Pass in $Passes)
{
    #Reinitalize these values being unique to this Pass
    $Column = 0
    [int]$Hits = 0
    ForEach ($Entry in $Array)
    { 
        #Increment the count to see if this pass is recorded for the ones with Down being higher than 1
        $Count++
        #If matching, will record the hits and reset the count
        If ($Count -match $Pass.Down)
        {
            #incrementing the column per loop
            $Column = $Column + $Pass.Right
            Write-Output $column
            If ($Entry.Value[$Column] -match "#")
            {
                $Hits++ 
            }
            #looping back to the left once we get past the 31 digits of the row
            If ($Column -ge $Entry.Value.Length)
            {
                $Column = $Column - $Entry.Value.Length
            }
            #Resets the counter to be incremented next pass
            $Count = 0
        } 
    }
    Write-output $Hits
    $Total = $Total * "$Hits"
}
Write-Output $Total