# Challenge #33
# https://codewars.com/kata/5506b230a11c0aeab3000c1f

# $1 - the contents in ml
# $2 - loss per day (in %)
# $3 - threshold (in %)

# Bash is not very capable, when it comes to floating-point arithmetics, so we
# have to use bc.

# Let's assume every day we lose x% of the gas in the evaporator. It means that
# on the n-th day, we'll have x% less gas than on the (n-1)-th day. Example:
#
# day 0: 100% of the original contents
# day 1: 100-x% compared to day 0
# day 2: 100-x% compared to day 1
# ...
#
# Actually, on day 2, we'd have (100-x%) of (100-x%) of the original contents.
# That would be ((100 - x) / 100) * ((100 - x) / 100) of the original contents,
# which can be written as ((100 - x) / 100)². On day 3, that will be
# ((100 -x) / 100)³, and so on.
#
# On day n the content in the evaporator will finally drop below some known
# threshold. We need to find n.
#
# ((100 - $2) / 100) ^ n =  ($3 / 100)
# thus:
# n = log(a, b)
# where a = (100 - $2) / 100) and is the base of the logarithm,
# and b = ($3 / 100) and is the operand.
#
# log(a, b) = ln(b) / ln(a), where ln() is natural logarithm which in bc is just
# l.
#
# Since we count days as they start, we want to know the ceiling. An easy way
# to do that is to add 1 in bc and drop the fractional part with printf.

n=$(bc -l <<< "l($3 / 100) / l((100 - $2) / 100) + 1")
printf "${n%%.*}"
