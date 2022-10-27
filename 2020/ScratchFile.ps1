$numbers = import-csv .\day1-1sample.csv -Header Value
$total = $numbers.count - 1
write-output $total
foreach ($n In $numbers) 
{
    write-output $n.Value
    For ($counter = 0; $counter -lt $total; $counter++)
    {   
        write-output "N value" $n
        Write-Output "Counter" $counter
    }  
}