# Challenge #24
# https://www.codewars.com/kata/57a0e5c372292dd76d000d7e

#n=$1
#while (($n)); do printf $2; let "n--"; done

# A shorter implementation with eval and brace expansion:
eval "printf \"%.s$2\" {1..$1}"
