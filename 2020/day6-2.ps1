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
#Using an array list since that will allow you to remove entries from it since Arrays are static length
[System.Collections.ArrayList]$Values = $null
$ValuesSet=$False
[string]$BadValues = $null
[int]$Sum = 0
ForEach ($Answer in $Answers)
{
    If (!($Answer))
    {
        Write-Output "Resulting Values $Values"
        #Using -join $null displays the whole array as a single entry with no delimiter
        If (!($Values)) {} else
        {
            $Sum = $Sum + ($Values -join "").Length
            Write-output "Sum $Sum"
        }
        $ValuesSet = $false
    }
    elseif ($ValuesSet -eq $false)
    {
        #The first pass will just set the list of Answers to a list to compare future answers against
       $Values = $Answer.ToCharArray()
       #Had to add a ValueSet variable since it could fully wipe out the existing Values entry if there are no matches
       $ValuesSet = $true
       Write-Output $Values
    }
    else {
       #loop through every value in $Values. If that value does not appear in the answer, add it to BadValues to remove after checking everything
       ForEach ($Value in $Values)
       {
        If ($Value -notlike $Answer)
        {
            Write-output "Not Match $Value"
            $BadValues = $BadValues + "$Value"
        }
    }
    #Remove all of the identified bad values
    Write-Output "Bad Letters $BadValues"
    [array]$BadValuesArray = $BadValues.toCharArray()
    Write-Output "Bad Values Array $BadValuesArray"
    Foreach ($BadValue in $BadValuesArray)
    {
        $Values.remove($BadValue)
    }
    $BadValues = $null
    }
}

$Sum = $Sum + ($Values -join "").Length
Write-Output "Final Sum $Sum"