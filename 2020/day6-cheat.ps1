$input = Get-Content ".\input.txt"

$input = ($input | out-string).TrimEnd()
$delimiter = "`r`n`r`n"
$part1Sum = 0
$part2Sum = 0

#part 1
foreach ($group in ($input -split $delimiter) -replace "`r`n", "") {
    $group = $group.tochararray() | group
    $part1Sum = $part1Sum + $group.Length
}

#part 2
foreach ($group in ($input -split $delimiter)) {
    $numInGroup = ($group -split "`r`n").Length
    $group = ($group -replace "`r`n", "").ToCharArray() | Group-Object | Where-Object Count -eq $numInGroup
    $part2Sum = $part2Sum + $group.Length
}

Write-Output "Part 1 Sum: $part1Sum"
Write-Output "Part 2 Sum: $part2Sum"