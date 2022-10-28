@"
--- Day 1: Report Repair ---
After saving Christmas five years in a row, you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them stars. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

To save your vacation, you need to get all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

For example, suppose your expense report contained the following:

1721
979
366
299
675
1456
In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

"@
#import CSV
$numbers = import-csv .\day1-data.csv -Header Value
#Loop through the array
foreach ($n In $numbers) 
{
#Start at the end of the array and work your way forward in the list for the loop to break if you reach the ForEach number. Everything past it would be already tested.
    For ($counter = $numbers.Count - 1; $counter -ge 0; $counter--)
    {
        #Check if we have gone through the loop back to matching numbers
        IF ($n.value -ne $numbers[$counter].Value)
        {
            #Test if we have two values adding up to 2020
            If ([int]$n.Value + [int]$numbers[$counter].Value -eq 2020)
                {
                    Write-output "Solution!!!"
                    [int]$n.value * [int]$numbers[$counter].Value | Write-output
                }
        }  
        Else
            {    
            #The number match, so every number after this is a repeat. Exit the loop
            break
            }    
    }  
}