# Challenge 28
# https://www.codewars.com/kata/51c8991dee245d7ddf00000e

# a single copy of $1 as a string
#
str=$1
while [ -n "$str" ]; do
    last=${str#${str% *}}
    [[ -z $last ]] && printf $str && break;
    printf "${last:1} "
    str=${str%$last*}
done

# a single copy of $1 as an array
#
# read -a orig <<< $1
# let i=${#orig[@]}
# while (($i)); do
#     printf "${orig[$i-1]}"
#     [ $i -ne 1 ] && printf " "
#     let "i--"
# done

# cleanest
# submitted by https://www.codewars.com/users/schan219
# result=
# for word in $@; do
#    result="$word $result"
# done
# echo "$result"
