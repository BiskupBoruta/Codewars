# This is a pure Bash implementation without any external dependencies.

comp() {

    # Preprocess $1: square each element, separate elements with commans, and
    # add trailing commas.
    a=,
    for i in $1; do
        a="$a$(($i*$i)),"
    done

    # Comparison: for every element of $2, find an occurrence in $a and remove
    # it. Mind the commas. If there is no match, we have an immediate answer the
    # lists are different.
    for i in $2; do
        len=${#a}       # length of $a before replacement
        a="${a/,$i,/,}" # replacement (supposed to decrease the length)
        [ $len -eq ${#a}  ] && printf 'false\n' && return # mismatch!
    done

    # Answer: if the lists match, we should have a single comma in $a at this
    # point.
    [ "$a" == "," ] && printf 'true\n' || printf 'false\n'
}

comp "$1" "$2"
