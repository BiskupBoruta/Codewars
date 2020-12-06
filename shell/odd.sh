# Challenge #37
# https://codewars.com/kata/55fd2d567d94ac3bc9000064

# 1, 2, 3, ..., n is an arithmetic sequence. The sum of first n terms of
# an arithmetic sequence (arithmetic series) equals: S(n) = n(a1 + an)/2
# where n is the number of terms, a1 is the first term, and an is the
# last term in the partial sum S(n).

# 1) $1 is the number of the row, but also the number of terms in that row.
# 2) The nth term of {1,2,3,...} is n
# 3) The nth term of {1,3,5,...} is 2n - 1
# 4) The nth term of {2,4,6,...} is 2n

# Now:
# 1) The sum of n consecutive odd numbers is n * F + S(n-1) 2n
#    where F is the first number and S(n-1) 2n is the sum of
#    n - 1 terms of 2n sequence. E.g. 1 + 3 + 5 = 3 * 1 + (2 + 4).
#
# 2) In our case to determine F we need to know, how many terms
#    there are in the rows above the $1th row. Since the number of
#    terms in rows is a simple n sequence, we need to know the
#    sum of the first $1 - 1 elements of n: ($1 -1)(1 + $1 - 1) / 2.
# 3) The sum tells us which term of {1,3,5,...} we start with, which is
#    our F: F = 2 * ($1 -1)(1 + $1 - 1) / 2) - 1
# Hence:

printf "%d" $(($1 * (2 * ((($1 - 1) * $1 / 2) + 1) - 1) + \
            (($1 - 1) * (2 + 2 * ($1 - 1)) / 2)))

# that happens to be $1³ :-)
