@" 
--- Part Two ---
The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.

In your expense report, what is the product of the three entries that sum to 2020?
"@

#import CSV
$numbers = import-csv .\day1-data.csv -Header Value
#No Foreach loop, that way we can share a single counter to key it all off of. We just need to subtract 1 from the count since the array starts at 0, not 1
#For loop 1 starts at 0 to capture the first number.
For ($Value1 = 0; $Value1 -lt $numbers.count -1; $Value1++)
{
    #For loop 2 increments Value1 by to get the second number.
    For ($Value2 = [int]$Value1 + 1; $Value2 -lt [int]$numbers.count - 1; $Value2++)
    {
        #For loop 3 increments value2 by one to start on the third number
        For ($Value3 = [int]$Value2 +1; $Value3 -lt [int]$numbers.count - 1; $Value3++)
        {
            If ([int]$numbers[$Value1].Value + [int]$numbers[$Value2].Value + [int]$numbers[$Value3].Value -eq 2020)
            {
                Write-host Solution!!!
                [int]$numbers[$Value1].Value * [int]$numbers[$Value2].Value * [int]$numbers[$Value3].Value | Write-output
            }
        }
    
    }
}
#I think that the for loops would technically all end up one the last number at the same time. When I was testing it and decreasing the $Number.Count by 2, the sample data failed to parse.
