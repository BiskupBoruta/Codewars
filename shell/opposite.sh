# Challenge 5
# https://www.codewars.com/kata/56dec885c54a926dcd001095

# Bash does not (easily) support floating point arithmetics. In order to avoid
# external dependencies such as bc we may use pattern matching to tell the
# difference between positive and negative numbers. As soon as floating point
# input joins the party, the code quickly reaches the level of insanity.
# Consider, for instance, -0.000, for which we should simply echo 0. All things
# considered, I will go with bc and sacrifice bash purity for simplicity and
# convenience. :)

bc <<< "0 - $1"

# EDIT: That is what I thought until I found a beautiful pure bash
# implementation that is not insane:
#
# echo $((-${1%.*}))${1#${1%.*}}

# submitted by @highcat, https://www.codewars.com/users/highcat
