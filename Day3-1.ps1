$list = Import-Csv .\Day3.csv -header Values
#Two multi-field variables for storing the winning and losing value for each
$ones = 0,0,0,0,0,0,0,0,0,0,0,0
$zeros = 0,0,0,0,0,0,0,0,0,0,0,0
$gamma = 0,0,0,0,0,0,0,0,0,0,0,0
$epsilon = 0,0,0,0,0,0,0,0,0,0,0,0
Foreach ($l in $list)
{
    #This takes the "System.Object" type of a list array and dumps one of is fields to a plain String so we can run substring against it.
    $l = $l.Values.ToString()
#I realize that there must be a way to foreach repeat this string, but I learned enough already.     
    If ($l.Substring(0,1) -eq 1)
        {$ones[0] ++}
        else {$zeros[0] ++}
    If ($l.Substring(1,1) -eq 1)
        {$ones[1] ++}
        else {$zeros[1] ++}
    If ($l.Substring(2,1) -eq 1)
        {$ones[2] ++}
        else {$zeros[2] ++}
    If ($l.Substring(3,1) -eq 1)
        {$ones[3] ++}
        else {$zeros[3] ++}
    If ($l.Substring(4,1) -eq 1)
        {$ones[4] ++}
        else {$zeros[4] ++}
    If ($l.Substring(5,1) -eq 1)
        {$ones[5] ++}
        else {$zeros[5] ++}
    If ($l.Substring(6,1) -eq 1)
        {$ones[6] ++}
        else {$zeros[6] ++}
    If ($l.Substring(7,1) -eq 1)
        {$ones[7] ++}
        else {$zeros[7] ++}
    If ($l.Substring(8,1) -eq 1)
        {$ones[8] ++}
        else {$zeros[8] ++}
    If ($l.Substring(9,1) -eq 1)
        {$ones[9] ++}
        else {$zeros[9] ++}
    If ($l.Substring(10,1) -eq 1)
        {$ones[10] ++}
        else {$zeros[10] ++}
    If ($l.Substring(11,1) -eq 1)
        {$ones[11] ++}
        else {$zeros[1] ++}
}

If ($ones[0] -gt $zeros[0])
    {$gamma[0] = 1}
    else {$epsilon[0] = 1}
If ($ones[1] -gt $zeros[1])
    {$gamma[1] = 1}
    else {$epsilon[1] = 1}
If ($ones[2] -gt $zeros[2])
    {$gamma[2] = 1}
    else {$epsilon[2] = 1}
If ($ones[3] -gt $zeros[3])
    {$gamma[3] = 1}
    else {$epsilon[3] = 1}
If ($ones[4] -gt $zeros[4])
    {$gamma[4] = 1}
    else {$epsilon[4] = 1}
If ($ones[5] -gt $zeros[5])
    {$gamma[5] = 1}
    else {$epsilon[5] = 1}
If ($ones[6] -gt $zeros[6])
    {$gamma[6] = 1}
    else {$epsilon[6] = 1}
If ($ones[7] -gt $zeros[7])
    {$gamma[7] = 1}
    else {$epsilon[7] = 1}
If ($ones[8] -gt $zeros[8])
    {$gamma[8] = 1}
    else {$epsilon[8] = 1}
If ($ones[9] -gt $zeros[9])
    {$gamma[9] = 1}
    else {$epsilon[9] = 1}
If ($ones[10] -gt $zeros[10])
    {$gamma[10] = 1}
    else {$epsilon[10] = 1}
If ($ones[11] -gt $zeros[11])
    {$gamma[11] = 1}
    else {$epsilon[11] = 1}

Write-Host Gamma $gamma
Write-Host Epsilon $epsilon

write-host ([convert]::ToInt32($gamma,2) * [convert]::ToInt32($epsilon,2))