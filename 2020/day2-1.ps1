@"
--- Day 2: Password Philosophy ---
Your flight departs in a few days from the coastal airport; the easiest way down to the coast from here is via toboggan.

The shopkeeper at the North Pole Toboggan Rental Shop is having a bad day. "Something's wrong with our computers; we can't log in!" You ask if you can take a look.

Their password database seems to be a little corrupted: some of the passwords wouldn't have been allowed by the Official Toboggan Corporate Policy that was in effect when they were chosen.

To try to debug the problem, they have created a list (your puzzle input) of passwords (according to the corrupted database) and the corporate policy when that password was set.

For example, suppose you have the following list:

1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a given letter must appear for the password to be valid. For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

In the above example, 2 passwords are valid. The middle password, cdefg, is not; it contains no instances of b, but needs at least 1. The first and third passwords are valid: they contain one a or nine c, both within the limits of their respective policies.

How many passwords are valid according to their policies?
"@

#We are probably going to need to set a header on the imported file to set Range, Letter, Sample or something
$Array = import-csv .\day2-data.csv -delimiter " " -Header Range, Letter, Password
#We will need to set a count of how many correct entries we get
[int]$CorrectPasswords = 0

Foreach ($Entry in $Array)
{
    [int]$lettercount = 0
#I need to create logic to actually filter out the password range. My Range[0] and Range [2] don't account for multi-digit possibilities
#Maybe process as a string, moving the characters to one variable looking for the -. When you find it, move to a differnt variable?    
    [string]$stringlow = $null
    [string]$stringhigh = $null

    For ($count=0; $count -lt $Entry.Range.Length; $count++)
    {
        If ($Entry.Range[$count] -ne '-')
        {
        $stringlow = $stringlow + $Entry.Range[$count]
        } else {
        $count = $Entry.Range.Length
        }
    }

    For ($count=($Entry.Range.length - 1); $count -ge 0; $count--)
    {
        If ($Entry.Range[$count] -ne '-')
        {
            $stringhigh = $Entry.Range[$count] + $stringlow
        } else {
            $count = -1
        }
    }
    #Write-Output $Entry.Letter[0]
    #Write-output $Entry.Password
    #Write-output $Entry.Password.Length
    #parse through the Password counting all of the letters matching the letter rule
    For ($count=0; $count -lt $Entry.Password.Length; $count++)
    {
        If ($Entry.Password[$count] -match $stringlow)
        {
            $lettercount++
        }
    }
#See if $lettercount matches the critera given in the Range
#I am still not exactly sure why it worked, but I had to add double quotes to the $lettercount variable. Maybe when comparing two variables, it does something?
#Supposedly, to have a variable expand to is info, rather than looking at the words written, you need a double quote.
    If ("$lettercount" -ge $Entry.Range[0])
        {
            If ("$lettercount" -le $stringhigh)
            {
              $CorrectPasswords++
          }
        }
}
Write-Output $CorrectPasswords