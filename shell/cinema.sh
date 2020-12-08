# Challenge 38
# https://codewars.com/kata/562f91ff6a8b77dfe900006e

# Since we're dealing with floating-point arithmetic and precision, we
# conveniently fall back to bc rather than pure Bash

bc << EOF

    define ceil(x) {
        scale = 0
        i = x / 1 # integer part
        if (i < x) { return i + 1 } # x has fractional part so round up
        return x # no fractional part
    }

    a = 0  # total a
    b = $1 # total b
    d = $3 # discount
    n = 0  # tickets

    while (a <= ceil(b)) {
        scale = 10
        a += $2
        b += $2 * d
        # the following line is the key. I've tried using geometric progressions
        # and a few other methods to calculate the price of the nth ticket, but
        # every time I had a bunch of failed tests. The kata is very picky about
        # precision and it turns out dealing with discount separately does the
        # trick best.
        d *= $3
        n += 1
    }
    print n

EOF
