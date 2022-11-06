@"
--- Part Two ---
The line is moving more quickly now, but you overhear airport security talking about how passports with invalid data are getting through. Better add some data validation, quick!

You can continue to ignore the cid field, but each other field has strict rules about what values are valid for automatic validation:

byr (Birth Year) - four digits; at least 1920 and at most 2002.
iyr (Issue Year) - four digits; at least 2010 and at most 2020.
eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
hgt (Height) - a number followed by either cm or in:
If cm, the number must be at least 150 and at most 193.
If in, the number must be at least 59 and at most 76.
hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
pid (Passport ID) - a nine-digit number, including leading zeroes.
cid (Country ID) - ignored, missing or not.
Your job is to count the passports where all required fields are both present and valid according to the above rules. Here are some example values:

byr valid:   2002
byr invalid: 2003

hgt valid:   60in
hgt valid:   190cm
hgt invalid: 190in
hgt invalid: 190

hcl valid:   #123abc
hcl invalid: #123abz
hcl invalid: 123abc

ecl valid:   brn
ecl invalid: wat

pid valid:   000000001
pid invalid: 0123456789
Here are some invalid passports:

eyr:1972 cid:100
hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

iyr:2019
hcl:#602927 eyr:1967 hgt:170cm
ecl:grn pid:012533040 byr:1946

hcl:dab227 iyr:2012
ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

hgt:59cm ecl:zzz
eyr:2038 hcl:74454a iyr:2023
pid:3556412378 byr:2007
Here are some valid passports:

pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
hcl:#623a2f

eyr:2029 ecl:blu cid:129 byr:1989
iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

hcl:#888785
hgt:164cm byr:2001 iyr:2015 cid:88
pid:545766238 ecl:hzl
eyr:2022

iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
Count the number of valid passports - those that have all required fields and valid values. Continue to treat cid as optional. In your batch file, how many passports are valid?
"@


#Import the file. Using Get-Content dumps it in to an array
$Array = Get-Content(".\day4-data.txt")
$byr = $null
$iyr = $null
$eyr = $null
$hgt = $null
$hcl = $null
$ecl = $null
$psid = $null
$ValidPassports = 0
$Found = 0
#Pattern string for the hair color check
$colorpattern = "^[a-fA-F0-9]+$"
#Pattern string for PID
$idpattern = "^[0-9]+$"
#Array of valid eye colors
[array]$eyecolors = "amb,blu,brn,gry,grn,hzl,oth"

#Scan the entry for the requires fields and count the matches
ForEach ($Line in $Array)
{
    $SplitLine = $Line -split " "
    Foreach ($Entry in $SplitLine)
    {
        $Value = $null
        #If it is not null, it has values we want to combine with any other lines
        If (!($Entry))
            {
            #Reset the Found variable to protect against a line containing only cid which is not needed
            $Found = 0
            $byr = $null
            $iyr = $null
            $eyr = $null
            $hgt = $null
            $hcl = $null
            $ecl = $null
            $psid = $null
            }
        else 
            {
                #Scan the line for values
            If ($Entry -like "*byr:*")
                {
                    [int32]$Value = $Entry.Remove(0,4)
                    If (($Value -le 2002) -and ($Value -ge 1920)) 
                        {
                        $byr = $true
                        }
                }
            If ($Entry -like "*iyr:*")
                {
                    [int32]$Value = $Entry.Remove(0,4)
                If (($Value -le 2020) -and ($Value -ge 2010))
                    {
                    $iyr = $true
                    }
                }    
            If ($Entry -like "*eyr:*")
                {
                    [int32]$Value = $Entry.Remove(0,4)
                If (($Value -le 2030) -and ($Value -ge 2020))
                    {
                    $eyr = $true
                    }
                }
            If ($Entry -like "*hgt:*")
                {
                    #Trim off the "hgt:" part of the string, have to output as string else will fail due to the cm/in at end
                    [string]$Value = $Entry.Remove(0,4)
                    #Trim off the "cm/in" part at the end and put back to Int to do -ge/-le checks
                    [int]$Value = $Value.Substring(0,$Value.Length-2)
                    If ($Entry -like "*in")
                    {
                        If (($Value -ge 59) -and ($Value -le 76))
                        {
                            $hgt = $true
                        }
                    }
                    If ($Entry -like "*cm")
                    {
                        If (($Value -ge 150) -and ($Value -le 193))
                        {
                            $hgt = $true
                        } 
                    }
                $hgt = $true
                }
            If ($Entry -like "*hcl:#*")
                {
                    #Trim off the first hcl:# since it has been checked
                    [string]$Value = $Entry.Remove(0,5)
                    #The allowed characters were declaired above. This will confirm the string only contains those characters
                    If ($Value -match $colorpattern)
                    {
                        $hcl = $true
                    }
                }
            If ($Entry -like "*ecl:*")
                {
                    [string]$Value = $Entry.Remove(0,4)
                    Foreach ($color in $eyecolors)
                    {
                        If ($color -match $Value)
                        {
                            $ecl = $true
                        }
                    }
                    
                }
            If ($Entry -like "*pid:*")
                {
                    If($Entry.Length -eq 13)
                    {
                        [string]$Value = $Entry.Remove(0,4)
                        If ($Value -match $idpattern)
                        {
                            $psid = $true
                        }
                        
                    }
                }
            #See if enough values are entered
            If (($byr -and $iyr -and $eyr -and -$hgt -and $hcl -and $ecl -and $psid) -and ($found -eq 0))
                {
                    $ValidPassports ++
                    $found = 1
                }
        }
    }    

}
Write-Output $ValidPassports