# Challenge 17
# https://www.codewars.com/kata/55d24f55d7dd296eb9000030

# 1, 2, 3, ..., n is an arithmetic sequence. The sum of first n terms of
# an arithmetic sequence (arithmetic series) equals: S(n) = n(a1 + an)/2
# where n is the number of terms, a1 is the first term, and an is the
# last term in the partial sum S(n).

printf $(($1 * (1 + $1) / 2))
