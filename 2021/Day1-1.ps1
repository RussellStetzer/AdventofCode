$list = Import-Csv .\Day1.csv -Header Depth
$olddepth = 188
$increase = 0
foreach ($l in $list)
{
if ([int]$l.Depth -gt [int]$olddepth)
{$increase ++}
$olddepth = $l.Depth
}
$increase