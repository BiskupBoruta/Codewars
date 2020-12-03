# Challenge #23
# https://www.codewars.com/kata/582cd9033c1acf1d45000052

n=20
while (($n)); do printf "Count: %d\n" $n; let "n--"; done

# It can be done without an explicit loop:
# printf "Count: %d\n" {1..20}
