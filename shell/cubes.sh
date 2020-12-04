# Challenge #29
# https://www.codewars.com/kata/5763bb0af716cad8fb000580

# Let's consider a single-color 3x3 Rubik's cube. That is essentially a cube
# cut twice in all three dimensions. The number of small cubes with at least
# one side colored is equal to the number of Rubik's cube pieces, that is 26.
# (9 in the top layer, 8 in the middle layer, 9 in the bottom layer).
#
# For three cuts in all three dimensions, that would be a 4x4 Rubik's cube which
# consists of 56 pieces: 16 in the top and bottom layer, and 12 in the middle
# layers.

# We can try to come up with a formula for the number of pieces in nxn Rubik's
# cube.
#
# 1) there is always a top and a botom layer with n² pieces
# 2) there are n-2 middle layers (n minus top and bottom)
# 3) the number of pieces in a middle layer is: n² - (n-2)²
#
# Therefore:
#
# i = 2 * n² + (n - 2) * [ (n² - (n-2)²) ] =
#   = 2n² + (n - 2) * [ n² - (n² - 4n + 4) ] =
#   = 2n² + (n - 2) * ( n² - n² + 4n - 4 ) =
#   = 2n² + (n - 2) * (4n - 4) =
#   = 2n² + 4 * (n - 2) * (n - 1) =
#   = 2n² + 4 * (n² - n - 2n + 2) =
#   = 2n² + 4 * (n² - 3n + 2) =
#   = 2n² + 4n² - 12n + 8 =
#   = 6n² - 12n + 8

# The formula is incorrect for 0 cuts (1x1 cube), which consists of a single
# piece. So that is a special case.

# $1 is the number of cuts in all three dimensions
# Each cut adds one layer in the respective dimension. Therefore one cut in each
# dimension produces 2x2 Rubik's cube. Two cuts in each dimension produce a 3x3
# Rubik's cube, and so on. This is our n from the formula above.
# Thus n = $1 + 1.
# Thus:
(($1 == 0 )) && printf 1 || \
    printf "%d" $((6 * ($1 + 1) * ($1 + 1) - 12 * ($1 + 1) + 8))
