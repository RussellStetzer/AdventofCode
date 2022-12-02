@"
--- Part Two ---
The Elf finishes helping with the tent and sneaks back over to you. "Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"

The total score is still calculated in the same way, but now you need to figure out what shape to choose so the round ends as indicated. The example above now goes like this:

In the first round, your opponent will choose Rock (A), and you need the round to end in a draw (Y), so you also choose Rock. This gives you a score of 1 + 3 = 4.
In the second round, your opponent will choose Paper (B), and you choose Rock so you lose (X) with a score of 1 + 0 = 1.
In the third round, you will defeat your opponent's Scissors with Rock for a score of 1 + 6 = 7.
Now that you're correctly decrypting the ultra top secret strategy guide, you would get a total score of 12.

Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?
"@
$Guide = Get-Content(".\day2-data.txt")
$Score = 0

Foreach ($Round in $Guide)
{
$SplitRound = $Round.split(" ")
#A is Rock, B is Paper, C is Scissors for opponent
#X is Lose, Y is Tie, Z is win for us
    If ($SplitRound[0] -eq "A")
    {
        If ($SplitRound[1] -eq "X")
        {
            $Score = $Score + 3
        }
        If ($SplitRound[1] -eq "Y")
        {
            $Score = $Score + 4
        }
        If ($SplitRound[1] -eq "Z")
        {
            $Score = $Score + 8
        }
    }
    If ($SplitRound[0] -eq "B")
    {
        If ($SplitRound[1] -eq "X")
        {
            $Score = $Score + 1
        }
        If ($SplitRound[1] -eq "Y")
        {
            $Score = $Score + 5
        }
        If ($SplitRound[1] -eq "Z")
        {
            $Score = $Score + 9
        }  
    }
    IF ($SplitRound[0] -eq "C")
    {
        If ($SplitRound[1] -eq "X")
        {
            $Score = $Score + 2
        }
        If ($SplitRound[1] -eq "Y")
        {
            $Score = $Score + 6
        }
        If ($SplitRound[1] -eq "Z")
        {
            $Score = $Score + 7
        } 
    }

}
Write-Output $Score