# Challenge #20
# https://www.codewars.com/kata/582cb0224e56e068d800003c

# strip the fractional part and divide by two without the remainder
printf $((${1%.*} / 2)) 
