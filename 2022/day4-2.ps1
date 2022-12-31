@"
--- Part Two ---
It seems like there is still quite a bit of duplicate work planned. Instead, the Elves would like to know the number of pairs that overlap at all.

In the above example, the first two pairs (2-4,6-8 and 2-3,4-5) don't overlap, while the remaining four pairs (5-7,7-9, 2-8,3-7, 6-6,4-6, and 2-6,4-8) do overlap:

5-7,7-9 overlaps in a single section, 7.
2-8,3-7 overlaps all of the sections 3 through 7.
6-6,4-6 overlaps in a single section, 6.
2-6,4-8 overlaps in sections 4, 5, and 6.
So, in this example, the number of overlapping assignment pairs is 4.

In how many assignment pairs do the ranges overlap?

0 > 2 and 0 < 3
1 > 2 and 1 < 3
2 > 0 and 2 < 1
3 > 0 and 3 < 1

($c -le $a -and $d -ge $a) -or ($c -le $b -and $d -le $b -and $d -ge $a) -or ($c -le $b -and $d -ge $b) )

2 < 0 and 3 > 0
2 < 1 and 3 < 1 and 3 > 0
2 < 1 and 3 > 1
Answer is 843
"@

$Total = 0
ForEach ($Pair in (Get-Content $PSScriptRoot\day4-data.txt))
{  
    $Pair = $Pair.Split(",").Split("-")
if (
 ($Pair[0] -ge $Pair[2] -and $Pair[0] -le $Pair[3]) -or
 ($Pair[1] -ge $Pair[2] -and $Pair[1] -le $Pair[3]) -or
 ($Pair[2] -ge $Pair[0] -and $Pair[2] -le $Pair[1]) -or
 ($Pair[3] -ge $Pair[0] -and $Pair[3] -le $Pair[1]) 
 ) {
    $Total++
    }
}
Write-Output $Total