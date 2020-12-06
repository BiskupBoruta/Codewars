# Challenge #35
# https://www.codewars.com/kata/55e6f5e58f7817808e00002e/

# This is a pure Bash implementation

# The challenge requires is to reduce the number provided in the input to some
# two-digit number in a specific way and count the steps. The divisibility by 7
# has nothing to do with the implementation.

# The above implies we only need to process numbers that have three digits or
# more. For shorter numbers we can simply print the input and the number of
# steps will be zero.

# There is catch, though. One of the testcases requires us to reduce a number
# out of range of the unsigned 64-bit integer. We cannot rely on basic integer
# arithmetic and need a more sophisticated solution. The solution is implemented
# in the reduce() function below. It takes a number and reduces it the way we
# need, eg. for 1039 it will return 103 - 9  = 94. It supports much larger
# numbers than 64-bit integers.

reduce() {
    local length=${#1}          # grab the length of the number
    local last=${1:$length-1}   # grab the last digit
    local tail=${1:$length-3:2} # grab the second and third last digit
    tail=${tail#0}              # and remove leading zero if any
    local excess=${1::-3}       # grab the rest of the number

    # naively reduce just the tail
    local result=
    let result="$tail - (2 * $last)"

    # if there is no excess, simply print out the result
    [ -z "$excess" ] && printf "%d" "$result" && return

    # if we don't need to borrow from the excess, print out the result
    (($result >= 0)) && printf "%s%02d" $excess $result && return

    # Oh, no! We need to borrow from the excess! Essentially, we need to iterate
    # over the excess from right to left, replacing zeros with nines, until
    # a non-zero digit is found, which need to decrement by one.

    let result="$result + 100" # because we borrow
    local reduced_excess=
    local i=1

    while ((1)); do
        local digit=${excess:${#excess}-$i:1} # grab a digit
        if (($digit == 0)); then # replace a zero with a nine
            reduced_excess="9$reduced_excess"
        else # subtract one from the digit
            let "digit--"

            # if we have reached the rightmost digit, we don't want to end up
            # with a leading zero.
            if (($i == ${#excess})); then
                (($digit == 0)) && printf "$reduced_excess$result" && return
                printf "$digit$reduced_excess$result" && return
            else
                printf ${excess::-$i}$digit$reduced_excess$result && return
            fi
        fi
        let "i++" # advance our pointer
    done
}

# if we already have a number that is short enough, no reduction is needed.
length=${#1}
(($length <= 2)) && printf "%d, %d" $1 0 && exit

# reduce the number if it has three digits or more
steps=0
number=$1
while [ $length -gt 2 ]; do
    number=$(reduce $number)
    let "steps++"
    length=${#number}
done

# print the result
printf "%s, %d" $number $steps
