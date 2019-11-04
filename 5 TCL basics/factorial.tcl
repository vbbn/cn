
proc fun { a } {
    set b 1

    while { $a > 0 } {
        set b [expr $b*$a]
        incr a -1
    }

    puts -nonewline "factorial = "
    puts $b
} 

puts "enter a no."
set a 0

set vname [gets stdin]
scan $vname "%d" a  

fun $a
