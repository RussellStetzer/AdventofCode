$move = import-csv .\Day2.csv -Header Direction, Speed -Delimiter " "  
$depth = 0
$distance = 0
$aim = 0
$total = 0
ForEach ($m in $move){
If ($m.Direction -eq "forward")
    {$distance += [int]$m.speed
    $depth += ([int]$m.speed * $aim)
    }
If ($m.Direction -eq "down")
    {$aim += [int]$m.speed}
If ($m.Direction -eq "up")
    {$aim -= [int]$m.speed}
$total = [int]$depth * [int]$distance
}
$total