# Challenge #16
# https://www.codewars.com/kata/5b853229cfde412a470000d0
#
# $1 - the age of the father
# $2 - the age of the son
#
# The father is twice as old as his son only once in a lifetime. It is when the
# age of the son is equal to the age difference between them, therefore the
# answer is simply $1 - $2 - $2. If the result is negative, it means "n years
# ago", 0 means "this year", positive means "in n years". Though we only need to
# print out the absolute value.

y=$(($1 - $2 - $2))
printf ${y#-}
