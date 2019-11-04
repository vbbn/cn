#stop and wait
set ns [new Simulator]

set namfile [open out.nam w]
$ns namtrace-all $namfile
set tracefd [open SWP.tr w]
$ns trace-all $tracefd
set namtrace [open SWP.nam w]

proc finish {} {
global ns namfile
$ns flush-trace
close $namfile
exec nam out.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n1 2Mb 100ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 2Mb 10ms DropTail
$ns queue-limit $n0 $n1 15


Agent/TCP set nam_tracevar_ true

set tcp [new Agent/TCP]
$tcp set window_ 1
$tcp set maxcwnd_ 1
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n1 $sink

$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp

$ns add-agent-trace $tcp tcp
#$ns monitor-agent-trace $tcp
$tcp tracevar cwnd_
 $ns at 0.1 "$ftp start"
$ns at 3.0 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n1 $sink"
$ns at 3.5 "finish"

$ns at 0.0 "$ns trace-annotate \"Stop and Wait with normal operation\""

$ns at 0.05 "$ns trace-annotate \"FTP starts at 0.1\""

$ns at 0.12 "$ns trace-annotate \"Send Packet_0\""
$ns at 0.24 "$ns trace-annotate \"Receive Ack_0\""
$ns at 0.36 "$ns trace-annotate \"Send Packet_1\""
$ns at 0.48 "$ns trace-annotate \"Receive Ack_1\""
$ns at 0.60 "$ns trace-annotate \"Send Packet_2\""
$ns at 0.72 "$ns trace-annotate \"Receive Ack_2  \""
$ns at 0.84 "$ns trace-annotate \"Send Packet_3\""
$ns at 0.96 "$ns trace-annotate \"Receive Ack_3\""
$ns at 1.08 "$ns trace-annotate \"Send Packet_4\""
$ns at 1.20 "$ns trace-annotate \"Receive Ack_4\""
$ns at 1.32 "$ns trace-annotate \"Send Packet_5\""
$ns at 1.44 "$ns trace-annotate \"Receive Ack_5\""
$ns at 1.56 "$ns trace-annotate \"Send Packet_6\""
$ns at 1.68 "$ns trace-annotate \"Receive Ack_6\""
$ns at 1.80 "$ns trace-annotate \"Send Packet_7\""
$ns at 1.92 "$ns trace-annotate \"Receive Ack_7\""
$ns at 2.04 "$ns trace-annotate \"Send Packet_8\""
$ns at 2.16 "$ns trace-annotate \"Receive Ack_8\""
$ns at 2.28 "$ns trace-annotate \"Send Packet_9\""
$ns at 2.40 "$ns trace-annotate \"Receive Ack_9\""
$ns at 2.52 "$ns trace-annotate \"Send Packet_10\""
$ns at 2.64 "$ns trace-annotate \"Receive Ack_10\""
$ns at 2.76 "$ns trace-annotate \"Send Packet_11\""
$ns at 2.88 "$ns trace-annotate \"Receive Ack_11\""
$ns at 3.00 "$ns trace-annotate \"Send Packet_12\""
$ns at 3.12 "$ns trace-annotate \"Receive Ack_12\""
$ns at 3.24 "$ns trace-annotate \"Send Packet_13\""
$ns at 3.36 "$ns trace-annotate \"Receive Ack_13\""

$ns at 3.4 "$ns trace-annotate \"FTP stops\""


$ns at 0.0 "$n0 label Sender"
$ns at 0.0 "$n1 label Receiver"
#$ns at 0.00 "$cbr start"
#$ns at 3.5 "$cbr stop"

#$ns at 4.0 "finish"

$ns run

