# Challenge #34
# https://codewars.com/kata/554e4a2f232cdd87d9000038

# This is a pure Bash implementation. We first replace each character with its
# lowercase counterpart and then uppercase the entire result.

str=${1//A/t}
str=${str//T/a}
str=${str//G/c}
str=${str//C/g}
printf ${str^^}
