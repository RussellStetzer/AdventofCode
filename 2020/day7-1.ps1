@"
--- Day 7: Handy Haversacks ---
You land at the regional airport in time for your next flight. In fact, it looks like you'll even have time to grab some food: all flights are currently delayed due to issues in luggage processing.

Due to recent aviation regulations, many rules (your puzzle input) are being enforced about bags and their contents; bags must be color-coded and must contain specific quantities of other color-coded bags. Apparently, nobody responsible for these regulations considered how long they would take to enforce!

For example, consider the following rules:

light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
These rules specify the required contents for 9 bag types. In this example, every faded blue bag is empty, every vibrant plum bag contains 11 bags (5 faded blue and 6 dotted black), and so on.

You have a shiny gold bag. If you wanted to carry it in at least one other bag, how many different bag colors would be valid for the outermost bag? (In other words: how many colors can, eventually, contain at least one shiny gold bag?)

In the above rules, the following options would be available to you:

A bright white bag, which can hold your shiny gold bag directly.
A muted yellow bag, which can hold your shiny gold bag directly, plus some other bags.
A dark orange bag, which can hold bright white and muted yellow bags, either of which could then hold your shiny gold bag.
A light red bag, which can hold bright white and muted yellow bags, either of which could then hold your shiny gold bag.
So, in this example, the number of bag colors that can eventually contain at least one shiny gold bag is 4.

How many bag colors can eventually contain at least one shiny gold bag? (The list of rules is quite long; make sure you get all of it.)
"@

$Rules = Get-Content .\day7-sample.txt
$BagColors = New-Object -TypeName "System.Collections.ArrayList"
$BagColors.Add("shiny gold")
[array]$SplitBag = $null
$BagCount = 0
#Parse the list getting all of the shiny gold bag entries, copying and trimming to a list of bags colors. 
#Loop the check statment to see how many bags are listed, loop while the list of bag colors is keep increasing. Hopefully no loops?

#I am going to need to prime the list of bag colors. I can't just have shiny gold in it, since it is a sub-bag, not the outer bag.
<#ForEach ($Rule in $Rules)
{
    If ($Rule -match 'shiny gold')
        {
            If ($Rule -notmatch 'shiny gold bags contain')
            {    
                
                $SplitBag = $Rule.Split(" bags")
                $BagColors.Add($SplitBag[0])
            }
        }
}
#>
#Can we do this all at once by pre-importing shiny gold to the list?
For ($i = 0; $i -lt $Rules.Length; $i++)
{
    Foreach ($Bag in $BagColors)
    {
        foreach ($Rule in $Rules)
        {
            If ($Rule -match $Bag)
            {
                If ($Rule -notlike "$Bag bags contain")
                {
                    $SplitBag = $Bag.Split(" bags")
                    $BagColors.Add($SplitBag[0])
                }
            }
        }
    }
    If ($BagColors.count -gt $BagCount)
        {
        $BagCount = $BagColors.count
        }
        else {
            $i = $BagColors.count
        }
}
#If we have shiny gold imported into the list to begin with, we'll need to subtract one from the final count
Write-Output $BagColors.count