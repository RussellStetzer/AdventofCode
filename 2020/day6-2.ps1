@"
As you finish the last group's customs declaration, you notice that you misread one word in the instructions:

You don't need to identify the questions to which anyone answered "yes"; you need to identify the questions to which everyone answered "yes"!

Using the same example as above:

abc

a
b
c

ab
ac

a
a
a
a

b
This list represents answers from five groups:

In the first group, everyone (all 1 person) answered "yes" to 3 questions: a, b, and c.
In the second group, there is no question to which everyone answered "yes".
In the third group, everyone answered yes to only 1 question, a. Since some people did not answer "yes" to b or c, they don't count.
In the fourth group, everyone answered yes to only 1 question, a.
In the fifth group, everyone (all 1 person) answered "yes" to 1 question, b.
In this example, the sum of these counts is 3 + 0 + 1 + 1 + 1 = 6.
"@

$Answers = Get-Content .\day6-sample.txt
[string]$Values = $null
[int]$Sum = 0
ForEach ($Answer in $Answers)
{
    If (!($Answer))
    {
       #Using -join $null displays the whole array as a single entry with no delimiter
        $Sum = $Sum + ($Values -join $null).Length
        $Values = $null
    }
elseif ($null -eq $Values)
    {
       $Values = $Answer
       Write-Output "Values $Values"
    }
    else {
       #loop through every value in $Values. If that value does not appear in the answer, null out the value
       ForEach ($Value in $Values.ToCharArray())
       {
        If ($Value -notmatch $Answer)
        {$Value -replace $null}
       }
    }
}

$Sum = $Sum + ($Values -join $null).Length
Write-Output "Final Sum $Sum"