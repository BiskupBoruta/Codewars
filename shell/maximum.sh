# Challenge #4
# https://www.codewars.com/kata/5ae62fcf252e66d44d00008e

# The problem statement suggests to 'try every combination' but it is not
# necessary if we take into account a few simple and mathematically provable
# facts about positive integers, addition, and multiplication.
#
# Facts:
#
# 1. Since x * 1 = x and x + 1 > x, we always have to add 1 in order to obtain a
#    greater result.
#
# 2. The number 2 is a special case, as 2 + 2 = 2 * 2, so whenever we have
#    two adjacent twos, it does not matter if we perform an addition or a
#    multiplication.
#
# 3. If one number is equal or greater than 2 and the other one is greater than
#    2, the result of multiplication is always greater than the result of
#    addition, e.g. 2 + 3 < 2 * 3. Essentially, multiplication is repeated
#    addition.

result() {
    printf $1 && exit 0
}

# The order of the conditions below is important as they act as filters.

# Multiplication is optimal when all operands are greater than 1.
(($1 > 1 && $2 > 1 && $3 > 1)) && result $(($1 * $2 * $3))

# Addition is optimal when there is a one on the left and on the right.
(($1 == 1 && $3 == 1)) && result $(($1 + $2 + $3))

# Addition on the left is optimal when the operand on the right is not a one and
# also not lesser than the operand on the left.
(($3 != 1 && $1 <= $3)) && result $((($1 + $2) * $3))

# All other cases work best with the addition on the right.
result $(($1 * ($2 + $3)))
