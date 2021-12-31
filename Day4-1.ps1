#Import the list of boards into some kind of searchable array
    #Do we use a multivariable array, assign each value a grid location header and then call those for the math?

#Import the list of picks in to an array

#Make a loop through each of the Picks in the array
#Take the pick and look through each of the boards to see if there is a match
#If there is a match, re-write the value to be zero
#Sum each row and column in each board to see if the sum of the values equal zero
    #Write the winning number to a variable, the winning board array number and Break
#Add up all of the values on the winning board and multiply it by the winning number

<# From AdventOfCode, the only powershell solution listed.
$numberdata = Get-Content "L:\Geeking Out\AdventOfCode\2021\Day 04 Squid\Numbers.txt"
$BingoBoards = Get-Content "L:\Geeking Out\AdventOfCode\2021\Day 04 Squid\Bingo Boards.txt"
$numbers = $numberdata.split(",")
$win = "No"
$lowcount = 999
for($counter=0;$counter -lt $BingoBoards.count;$counter += 6){
    $TTT = New-object 'object[,]' 5,5
    for($i=0;$i -le 6;$i++){
        if($BingoBoards[$counter+$i].Length -gt 0){
            for($j=0;$j -lt 5;$j++){$TTT[($i-1),$j] = [int]$BingoBoards[$counter+$i].substring($j*3,2)} 
        }
    }
    $numbercount = 0
    $win = "No"
    $sum = 0
    foreach($number in $numbers){
        if($win -ne "Yes"){
            $numbercount++
            for($x=0;$x -le 4;$x++){
                for($y=0;$y -le 4; $y++){
                    if($ttt[$x,$y] -eq $number){$ttt[$x,$y] = ""}
                }
            }
            for($x=0;$x -le 4;$x++){
                if(($ttt[$x,0] -eq "") -and ($ttt[$x,1] -eq "") -and ($ttt[$x,2] -eq "") -and ($ttt[$x,3] -eq "") -and ($ttt[$x,4] -eq "")){
                    $Win = "Yes"
                    $winningnumber = $number
                    $ttt | Foreach { $sum += $_} -ErrorAction SilentlyContinue             
                    $total = $sum * $winningnumber
                }
            }    
            for($y=0;$y -le 4;$y++){
                if(($ttt[0,$y] -eq "") -and ($ttt[1,$y] -eq "") -and ($ttt[2,$y] -eq "") -and ($ttt[3,$y] -eq "") -and ($ttt[4,$y] -eq "")){
                    $Win = "Yes"
                    $winningnumber = $number
                    $ttt | Foreach { $sum += $_} -ErrorAction SilentlyContinue
                    $total = $sum * $winningnumber             
                }
            }    
        }
    }
    if($numbercount -lt $lowcount){
        $lowcount = $numbercount
        write-host "Moves:" $numbercount "total score:" $total
    }
#>
