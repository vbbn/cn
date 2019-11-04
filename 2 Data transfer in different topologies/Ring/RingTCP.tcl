set ns [new Simulator]
set nf [open out.nam w]
$ns namtrace-all $nf
proc finish {} {
global ns nf
$ns flush-trace
close $nf
exec nam out.nam
exit 0

}

set n0 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n1 [$ns node]
$ns duplex-link $n0 $n2 1mb 10ms DropTail
$ns duplex-link $n2 $n3 1mb 10ms DropTail
$ns duplex-link $n3 $n1 1mb 10ms DropTail
$ns duplex-link $n1 $n4 1mb 10ms DropTail
$ns duplex-link $n4 $n5 1mb 10ms DropTail
$ns duplex-link $n5 $n0 1mb 10ms DropTail

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set cbr0 [new Application/Traffic/CBR]

$cbr0 set packetsize_ 5
$cbr0 set interval_ 0.000005
$cbr0 attach-agent $tcp0

set sink0 [new Agent/TCPSink]
$ns attach-agent $n1 $sink0
$ns connect $tcp0 $sink0

$ns at 0.5 "$cbr0 start"
$ns at 4.5 "$cbr0 stop"


$ns at 5.0 "finish"
$ns run


