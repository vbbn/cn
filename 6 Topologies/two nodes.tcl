

set ns [new Simulator]
set nf [open out.nam w]

set tcp0 [new Agent/TCP]
$ns attach-agent $ns $tcp0 
set cbr0 [new Application/traffic/CBR]


$ns namtrace-all $nf

proc finish { } {
    global ns nf
    $ns flush-trace
    close $nf
    exec nam out.nam
    exit 0 
}

$CBR0 set packetSize_ 500
$CBR0 set interval_ 0.005
$CBR0 set attach-agent $tcp

set sink0 [new Agent/Sink]
$ns attach-agent $n1 $sink0

$ns connect $tcp0 $sink
$ns at 0.5 cbr0 start
$ns at 4.5 "$cbr0 stop"

$ns at 5.0 "finish"
$ns run



