puts "enter two nos."
set a 0
set b 0

set vname [gets stdin]
scan $vname "%d %d" a b  

set c [expr $a + $b]

puts -nonewline "sum = "
puts $c
