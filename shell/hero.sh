# Challenge #36
# https://codewars.com/kata/55efecb8680f47654c000095

# As long as we are concerned about integers within the range corresponding to
# the platform, e.g. 64-bit integers on a 64-bit machine, the following pure
# bash implementation is sufficient:

# x=$2 # initial guess
# i=0  # progression steps
#
# while ((1)); do
#     let new_x="($x + $1 / $x) / 2"
#     let "steps++"
#     (($x - $new_x == 0)) && break
#     x=$new_x
# done
#
# printf "%d" $steps

# However, one of the testcases in the challenge requires us to perform the
# operation on a much larger number, namely 9094947017729282379150390625, 
# we are going to rely on an external program 'bc'.

x=$2 # initial guess
i=0  # progression steps

while ((1)); do
    new_x=$(bc <<< "($x + $1 / $x) / 2")
    let "steps++"
    error=$(bc <<< "y=$x - $new_x; if (y < 0) -y < 1 else y < 1")
    [ $error -eq 1 ] && break
    x=$new_x
done

printf "%d" $steps
