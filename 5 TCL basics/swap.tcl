set a 10
set b 110

puts -nonewline "a = "
puts $a

puts -nonewline "b = "
puts $b

set a [expr $a^$b]
set b [expr $a^$b]
set a [expr $a^$b]

puts -nonewline "a = "
puts $a

puts -nonewline "b = "
puts $b
