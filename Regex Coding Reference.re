(?# Regex Coding Reference:)

. any character

(?# --------------------------------------------------------------------------------------------------------------)
(?# ESCAPED GENERAL CHARACTERS:)
\d any digit character
\D any non-digit character
\w any alphanumeric character ; is equivalent to [A-Za-z0-9_]
\W any non-alphanumeric character
\s any whitespace no matte the length ; tab (\t), space ( ), newline (\n), carriage return (\r)
\S any non-whitespace character


(?# --------------------------------------------------------------------------------------------------------------)
(?# ESCAPED SPECIAL CHARACTERS:)

\. period
\  space
\" double quote
\' single quote
\? question mark
\~
\`
\!
\@
\#
\$
\%
\^
\&
\*
\(
\)
\-
\_
\+
\=


(?# --------------------------------------------------------------------------------------------------------------)
(?# ESCAPED SPECIAL CHARACTERS:)
-
:


(?# --------------------------------------------------------------------------------------------------------------)
(?# RANGES:)

[abc] any single character that IS a, b, or c
[^abc] any single character that IS NOT a, b, or c

[a-z] any single character that is within the range of lowercase a to lowercase z, inclusive
[A-Z] any single character that is within the range of uppercase A to uppercase Z, inclusive


(?# --------------------------------------------------------------------------------------------------------------)
(?# REPETITIONS:)
{3} repetition of a preceding character exactly times
{5,} repetition of a preceding character greater than or equal to 5 times
{2,10} repetition of a preceding character 2~10 times inclusive

* zero or more repetitions of a preceding character ; kleene star
+ one or more repetitions of a preceding character ; kleene plus
? zero or one of a preceding character ; optional character


(?# --------------------------------------------------------------------------------------------------------------)
(?# ANCHORS:)

^ match only the character or string at the START of the line ; starting anchor
^[abc] any single character that IS a, b, or c at the START of the string
^[^abc] any single character that IS NOT a, b, or c at the START of the string

$ match only the character or string at the END of the line ; ending anchor
[abc]$ any single character that IS a, b, or c at the END of the string
[^abc]$ any single character that IS NOT a, b, or c at the END of the string

\b match only the preceding character or string strictly excluded from other non-whitespace characters ; boundary anchor
\B match only the preceding character or string strictly included with other non-whitespace characters ; negatory boundary anchor


(?# --------------------------------------------------------------------------------------------------------------)
(?# CAPTURE GROUPS:)

() use parenthesis around any part of a regex filter to initialize a capture group for data extraction
(()) use nested parenthesis around part of an already initialized capture group to initialize a capture sub-group
\0 the fully matched text group
\1 captured text group number one
\2 captured text group number two
... etc


(?# --------------------------------------------------------------------------------------------------------------)
(?# MISC:)

| logical OR ; pipe


(?# --------------------------------------------------------------------------------------------------------------)
(?# USEFUL REGULAR EXPRESSIONS:)

^(\~|\+|\-)?\d+(,\d+)*(\.\d+(e\d+)?)?$ matches many formats of written math values, excluding ones with any special characters
^([\+\-\w\.]+)@([\+\-\w\.]+)([\.]\w{2,3})*([\.]\w{2,3})$ matches many proper formats of email addresses
[\+]?(\d{1,2})?[\s-]?[\(]?(\d{3})[\)]?[\s-]?\d{3}[\s-]?\d{4} matches many proper formats of phone numbers, local and international
(\w+)[\.](gif|jpg|png)$ matches filenames with specific extentions and captures the filename
^\s*(.*)\s*$ matches and captures anything inside of illformed STARTing and ENDing whitespace
(\w+)\:\/\/([\w\-\.]+)(\:(\d+))?\/([\/\w\%\#\&\=\?\-]*)((\.*\w+)*) matches many URLs and captures scheme, domain, port number, path, and extention













