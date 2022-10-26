$list = Import-Csv .\Day1.csv -Header Depth
$old1depth = 
$old2depth = 
$oldtotal = 
$newtotal =
$increase = 0
foreach ($l in $list)
{
    If([int]$old2depth -gt 0)
    {
        If([int]$old1depth -gt 0)
        {
            $newtotal = [int]$old2depth + [int]$old1depth + [int]$l.depth
            if([int]$oldtotal -gt 0)
            {
    if ([int]$newtotal -gt [int]$oldtotal)
{$increase ++}
}
$oldtotal = $newtotal
}
}
$old2depth = $old1depth
$old1depth = $l.Depth
}
$increase