# Challenge #8
# https://www.codewars.com/kata/56bc28ad5bdaeb48760009b0

printf ${1:1:$((${#1} - 2))}

# Many users submitted a better solution: ${1:1:-1}. Nice!
