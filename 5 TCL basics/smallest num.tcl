set a 10
set b 11
set c 15

set m 0

if { $a <= $b } {
    set m $a
}

if { $c <= $m } {
    set m $c
}

puts -nonewline "largest = "
puts  $m
