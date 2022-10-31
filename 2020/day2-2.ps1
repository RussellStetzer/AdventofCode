@"
--- Part Two ---
While it appears you validated the passwords correctly, they don't seem to be what the Official Toboggan Corporate Authentication System is expecting.

The shopkeeper suddenly realizes that he just accidentally explained the password policy rules from his old job at the sled rental place down the street! The Official Toboggan Corporate Policy actually works a little differently.

Each policy actually describes two positions in the password, where 1 means the first character, 2 means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of "index zero"!) Exactly one of these positions must contain the given letter. Other occurrences of the letter are irrelevant for the purposes of policy enforcement.

Given the same example list from above:

1-3 a: abcde is valid: position 1 contains a and position 3 does not.
1-3 b: cdefg is invalid: neither position 1 nor position 3 contains b.
2-9 c: ccccccccc is invalid: both position 2 and position 9 contain c.
How many passwords are valid according to the new interpretation of the policies?
"@

#We are probably going to need to set a header on the imported file to set Range, Letter, Sample or something
$Array = import-csv .\day2-data.csv -delimiter " " -Header Range, Letter, Password
#We will need to set a count of how many correct entries we get
[int]$CorrectPasswords = 0

Foreach ($Entry in $Array)
{
#I need to create logic to actually filter out the password range. My Range[0] and Range [2] don't account for multi-digit possibilities   
    [string]$stringlow = $null
    [string]$stringhigh = $null
    [int]$match = 0
#Start at the first digit of .Range, if not a -, add it to StringLow. When you find the -, set the Count past the For range and it will exit after the pass.
    For ($count=0; $count -lt $Entry.Range.Length; $count++)
    {
        If ($Entry.Range[$count] -ne '-')
        {
        $stringlow = $stringlow + $Entry.Range[$count]
        } else {
        $count = $Entry.Range.Length
        }
    }
    $stringlow = [int]$stringlow - 1
    #decremeting stringlow to account for not starting at zero
    #Get the length of the .range and subtract one since the count starts at zero. Starting on the last digit, check if it is a - and add it to StringHigh. Since we are going backwards, we have to append the following diging BEOFRE stringHigh else it would write multi-digts backwards
    For ($count=($Entry.Range.length - 1); $count -ge 0; $count--)
    {
        If ($Entry.Range[$count] -ne '-')
        {
            $stringhigh = $Entry.Range[$count] + $stringhigh
        } else {
            $count = -1
        }
    }
    $stringhigh = [int]$stringhigh - 1
    #decrementing stringhigh since it is not starting at zero
    #Write-Output $Entry
    #Write-Output $Entry.Letter[0]
    #Write-output $Entry.Password
    #Write-output $Entry.Password.Length
    #Write-Output $stringlow
    #write-output $stringhigh

#Since we have the Letter, the lower number and the higher number, check the password list if stringlow +1 matches the letter and/or if stringhigh+1 does.
If ($Entry.Password[$stringlow] -match $Entry.Letter[0])
{
    $match++
}

If ($Entry.Password[$stringhigh] -match $Entry.Letter[0])
{
    $match++
}
    If ($match -eq 1)
    {$CorrectPasswords++}
}
Write-Output $CorrectPasswords