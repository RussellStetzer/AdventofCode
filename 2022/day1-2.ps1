@"
--- Part Two ---
By the time you calculate the answer to the Elves' question, they've already realized that the Elf carrying the most Calories of food might eventually run out of snacks.

To avoid this unacceptable situation, the Elves would instead like to know the total Calories carried by the top three Elves carrying the most Calories. That way, even if one of those Elves runs out of snacks, they still have two backups.

In the example above, the top three Elves are the fourth Elf (with 24000 Calories), then the third Elf (with 11000 Calories), then the fifth Elf (with 10000 Calories). The sum of the Calories carried by these three elves is 45000.

Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?

"@
$Foods = Get-Content(".\day1-data.txt")
$CurrentCalories = 0
$ThirdCalories = 0
$SecondCalories = 0
$FirstCalories = 0
$TotalCalories

Foreach ($Food in $Foods)
{
    If (!($Food))
    {
        If ($CurrentCalories -gt $ThirdCalories)
        {
            If ($CurrentCalories -gt $SecondCalories)
            {
                If ($CurrentCalories -gt $FirstCalories)
                {
                    $ThirdCalories = $SecondCalories
                    $SecondCalories = $FirstCalories
                    $FirstCalories = $CurrentCalories
                }
                else {
                    $ThirdCalories = $SecondCalories
                    $SecondCalories = $CurrentCalories
                }
            }
            else {
                $ThirdCalories = $CurrentCalories
            }
        }
        $CurrentCalories = 0
    }
    else
    {
        $CurrentCalories = $CurrentCalories + $Food
    }

}

If ($CurrentCalories -gt $ThirdCalories)
        {
            If ($CurrentCalories -gt $SecondCalories)
            {
                If ($CurrentCalories -gt $FirstCalories)
                {
                    $ThirdCalories = $SecondCalories
                    $SecondCalories = $FirstCalories
                    $FirstCalories = $CurrentCalories
                }
                else {
                    $ThirdCalories = $SecondCalories
                    $SecondCalories = $CurrentCalories
                }
            }
            else {
                $ThirdCalories = $CurrentCalories
            }
        }

$TotalCalories = $ThirdCalories + $SecondCalories + $FirstCalories
Write-Output $TotalCalories

