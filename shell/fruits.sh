# Challenge #27
# https://www.codewars.com/kata/56c5847f27be2c3db20009c3

fruits=(kiwi pear kiwi banana melon banana melon pineapple apple pineapple \
cucumber pineapple cucumber orange grape orange grape apple grape cherry pear \
cherry pear kiwi banana kiwi apple melon banana melon pineapple melon \
pineapple cucumber orange apple orange grape orange grape cherry pear cherry \
pear apple pear kiwi banana kiwi banana melon pineapple melon apple cucumber \
pineapple cucumber orange cucumber orange grape cherry apple cherry pear \
cherry pear kiwi pear kiwi banana apple banana melon pineapple melon pineapple \
cucumber pineapple cucumber apple grape orange grape cherry grape cherry pear \
cherry apple kiwi banana kiwi banana melon banana melon pineapple apple \
pineapple)

# If we take any natural number greater than or equal to 10, and subtract from
# it the sum of its digits, the results will always divisible by 9. Here is
# a proof:
#
# Let's assume ab a two-digit natural number. The value of it will be 10a + b.
# Now, let's subtract the sum of the number's digits (a + b):
#
# 10a + b - (a + b) = 10a + b - a - b = 10a - a + b - b = 9a
# We see that 9a is divisible by 9.
#
# For a three-digit number abc, that would be: 100a + 10b + c - (a + b + c) =
# 100a - a + 10b - b + c - c = 99a + 9b = 9 * (11a + b) which is also divisible
# by 9.

# In our challenge we repeat the above operation until the result will belong to
# a closed interval [1, 100]. Therefore for any number given in the input, we
# need to find the closest integer for the aforementioned interval that is also
# divisible by 9. In other words, we need to find an integer that belongs to
# the following collection: {9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99}.

# If we take a look into the array, we'll see, that the elements corresponding
# to the numbers from the above collection are always 'apple'. Having said that,
# the simplest solution would be:
#
# printf apple

# If we wanted to write a script, that would be correct for any array equal in
# in size to the one above, the implementation would be as follows:

let "n=$1-($1 % 9)"

# the array is indexed from 0 to 99, so we need to subract 1 to get the correct
# element.
(($n <= 99)) && printf ${fruits[$n-1]} || printf ${fruits[98]}
