#===================================
#   Simulation parameters setup
#===================================
set val(stop)  10.0  ;

#===================================
#    Initialization    
#===================================
#Create a ns simulator
set ns [new Simulator]

$ns color 0 blue
$ns color 1 red
$ns color 2 yellow
$ns color 3 green
$ns color 4 black
$ns color 5 pink
$ns color 6 white
$ns color 7 black
$ns color 8 violet
$ns color 9 orange

set cir 1000000
set cbs 3000
set pir 3000
set ebs 3000
set pbs 3000
set packetSize 1000
set testTime 10.0;

#Open the NS trace file
set tracefile [open ns-tcp.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open ns-tcp.nam w]
$ns namtrace-all $namfile

#Open the NAM trace file
set stats [open ns-tcpstatsa.tr w]

#===================================
#    Nodes Definition    
#===================================
#Create 23 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]
set n9 [$ns node]
set n10 [$ns node]
set n11 [$ns node]
set n12 [$ns node]
set n13 [$ns node]
set n14 [$ns node]
set n15 [$ns node]
set n16 [$ns node]
set n17 [$ns node]
set n18 [$ns node]
set n19 [$ns node]
set n20 [$ns node]
set n21 [$ns node]
set n22 [$ns node]

#===================================
#    Routers Definition    
#===================================
#Create 0 routers

#===================================
#    Links Definition    
#===================================
#Createlinks between nodes
$ns duplex-link $n0 $n22 10.0Mb 60ms DropTail
$ns duplex-link $n22 $n20 10.0Mb 60ms DropTail

$ns duplex-link $n0 $n20 10.0Mb 120ms DropTail
$ns duplex-link $n5 $n20 10.0Mb 120ms DropTail
$ns duplex-link $n20 $n1 10.0Mb 120ms DropTail
$ns duplex-link $n8 $n20 10.0Mb 120ms DropTail
$ns duplex-link $n20 $n6 10.0Mb 120ms DropTail
$ns duplex-link $n9 $n20 10.0Mb 120ms DropTail
$ns duplex-link $n7 $n20 10.0Mb 120ms DropTail
$ns duplex-link $n4 $n20 10.0Mb 120ms DropTail
$ns duplex-link $n2 $n20 10.0Mb 120ms DropTail
$ns duplex-link $n3 $n20 10.0Mb 120ms DropTail

$ns duplex-link $n14 $n21 10.0Mb 120ms DropTail
$ns duplex-link $n16 $n21 10.0Mb 120ms DropTail
$ns duplex-link $n12 $n21 10.0Mb 120ms DropTail

$ns duplex-link $n13 $n21 10.0Mb 120ms DropTail
$ns duplex-link $n10 $n21 10.0Mb 120ms DropTail
$ns duplex-link $n11 $n21 10.0Mb 120ms DropTail
$ns duplex-link $n15 $n21 10.0Mb 120ms DropTail
$ns duplex-link $n19 $n21 10.0Mb 120ms DropTail
$ns duplex-link $n18 $n21 10.0Mb 120ms DropTail
$ns duplex-link $n17 $n21 10.0Mb 120ms DropTail

$ns duplex-link $n20 $n21 4.0Mb 20ms DropTail
$ns duplex-link $n20 $n21 10.0Mb 20ms DropTail
$ns queue-limit $n20 $n21 20

#Give node position (for NAM)
$ns duplex-link-op $n0 $n20 orient left-down
$ns duplex-link-op $n5 $n20 orient left-down
$ns duplex-link-op $n20 $n1 orient right-down
$ns duplex-link-op $n8 $n20 orient left-up
$ns duplex-link-op $n20 $n6 orient right-down
$ns duplex-link-op $n9 $n20 orient right-up
$ns duplex-link-op $n7 $n20 orient right-up
$ns duplex-link-op $n4 $n20 orient right-up
$ns duplex-link-op $n2 $n20 orient right-down
$ns duplex-link-op $n3 $n20 orient right-down
$ns duplex-link-op $n0 $n22 orient left

$ns duplex-link-op $n22 $n20 orient right-down
$ns duplex-link-op $n14 $n21 orient right-down
$ns duplex-link-op $n16 $n21 orient left-down
$ns duplex-link-op $n12 $n21 orient left-down
$ns duplex-link-op $n13 $n21 orient left

$ns duplex-link-op $n10 $n21 orient left-up
$ns duplex-link-op $n11 $n21 orient left-up
$ns duplex-link-op $n15 $n21 orient right-up
$ns duplex-link-op $n19 $n21 orient right-up
$ns duplex-link-op $n18 $n21 orient right-down
$ns duplex-link-op $n17 $n21 orient right-down
$ns duplex-link-op $n20 $n21 orient right

#===================================
#    Agents Definition    
#===================================
set tcp0 [new Agent/TCP/Vegas]
set tcp1 [new Agent/TCP/Vegas]
set tcp2 [new Agent/TCP/Vegas]
set tcp3 [new Agent/TCP/Vegas]
set tcp4 [new Agent/TCP/Vegas]
set tcp5 [new Agent/TCP/Vegas]
set tcp6 [new Agent/TCP/Vegas]
set tcp7 [new Agent/TCP/Vegas]
set tcp8 [new Agent/TCP/Vegas]
set tcp9 [new Agent/TCP/Vegas]

set sink0 [new Agent/TCPSink]
set sink1 [new Agent/TCPSink]
set sink2 [new Agent/TCPSink]
set sink3 [new Agent/TCPSink]
set sink4 [new Agent/TCPSink]
set sink5 [new Agent/TCPSink]
set sink6 [new Agent/TCPSink]
set sink7 [new Agent/TCPSink]
set sink8 [new Agent/TCPSink]
set sink9 [new Agent/TCPSink]

$tcp0 set fid_ 0
$tcp1 set fid_ 1
$tcp2 set fid_ 2
$tcp3 set fid_ 3
$tcp4 set fid_ 4
$tcp5 set fid_ 5
$tcp6 set fid_ 6
$tcp7 set fid_ 7
$tcp8 set fid_ 8
$tcp9 set fid_ 9

$ns attach-agent $n22 $tcp1
$ns attach-agent $n7 $tcp2
$ns attach-agent $n8 $tcp3
$ns attach-agent $n3 $tcp4
$ns attach-agent $n4 $tcp5
$ns attach-agent $n5 $tcp6
$ns attach-agent $n6 $tcp7
$ns attach-agent $n9 $tcp8
$ns attach-agent $n1 $tcp9
$ns attach-agent $n2 $tcp0

$ns attach-agent $n10 $sink0
$ns attach-agent $n11 $sink1
$ns attach-agent $n12 $sink2
$ns attach-agent $n13 $sink3
$ns attach-agent $n14 $sink4
$ns attach-agent $n15 $sink5
$ns attach-agent $n16 $sink6
$ns attach-agent $n17 $sink7
$ns attach-agent $n18 $sink8
$ns attach-agent $n19 $sink9

$ns connect $tcp0 $sink0
$ns connect $tcp1 $sink1
$ns connect $tcp2 $sink2
$ns connect $tcp3 $sink3
$ns connect $tcp4 $sink4
$ns connect $tcp5 $sink5
$ns connect $tcp6 $sink6
$ns connect $tcp7 $sink7
$ns connect $tcp8 $sink8
$ns connect $tcp9 $sink9

#===================================
#    Applications Definition    
#===================================
set ftp0 [new Application/FTP]
set ftp1 [new Application/FTP]
set ftp2 [new Application/FTP]
set ftp3 [new Application/FTP]
set ftp4 [new Application/FTP]
set ftp5 [new Application/FTP]
set ftp6 [new Application/FTP]
set ftp7 [new Application/FTP]
set ftp8 [new Application/FTP]
set ftp9 [new Application/FTP]

$ftp0 attach-agent $tcp0
$ftp1 attach-agent $tcp1
$ftp2 attach-agent $tcp2
$ftp3 attach-agent $tcp3
$ftp4 attach-agent $tcp4
$ftp5 attach-agent $tcp5
$ftp6 attach-agent $tcp6
$ftp7 attach-agent $tcp7
$ftp8 attach-agent $tcp8
$ftp9 attach-agent $tcp9

$ns at 0.0 "$ftp0 start"
$ns at 0.5 "$ftp1 start"
$ns at 1.0 "$ftp2 start"
$ns at 1.5 "$ftp3 start"
$ns at 2.0 "$ftp4 start"
$ns at 2.5 "$ftp5 start"
$ns at 3.0 "$ftp6 start"
$ns at 3.5 "$ftp7 start"
$ns at 4.0 "$ftp8 start"
$ns at 4.5 "$ftp9 start"

#===================================
#    Termination    
#===================================
#Define a 'finish' procedure
proc finish {} {
  global ns tracefile namfile
  $ns flush-trace
  close $tracefile
  close $namfile
  exec nam -a ns-tcp.nam &
  exec awk -f delay.awk ns-tcp.tr > ns-tcp-flow.tr
  exec xgraph ns-tcp-flow.tr -geometry 800x400 -t " Time Delay " -x " Packet" -y " Time (sec) " &
  exit 0
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
