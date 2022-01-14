#!/usr/bin/perl

$cmdlineEnergyPP0Dump          ="sudo rdmsr 0x639 -f 31:0 -u";

$kernel_list = "kernel_list";

$msr_val = `sudo rdmsr 0x606`;
chomp($msr_val);
$msr_res = sprintf("%f",hex($msr_val));
$msr_res1 = sprintf("%f",(1.0*($msr_res >> 8)& 0x1f)); 
$energy_unit = 0.5 ** $msr_res1;

$RUN_TYPE="prof";
if ( $#ARGV >= 0) {
    $RUN_TYPE="$ARGV[0]";
}
$PROFFILE="prof_file";
if ( $#ARGV >= 0) {
    $PROFFILE="$ARGV[1]";
}



%CORE = (	
'Const' => 	602.5,
#UOPS_EXECUTED_X87
#'r02C0' =>  0,
#UOPS_EXECUTED_THREAD
#'r01B1' => 	0,
#UOPS_DISPATCHED_PORT_PORT_0
#'r01A1' => 	0,
#UOPS_DISPATCHED_PORT_PORT_1
'r02A1' => 	374.8046,
#UOPS_DISPATCHED_PORT_PORT_2
'r04A1' => 	346.4311,
#UOPS_DISPATCHED_PORT_PORT_4
#'r10A1' => 	 0,
#UOPS_DISPATCHED_PORT_PORT_5
#'r20A1' =>   0,
#UOPS_DISPATCHED_PORT_PORT_6
'r40A1' =>   0,
#UOPS_DISPATCHED_PORT_PORT_7
#'r80A1' =>   0,
#IDQ_DSB_UOPS
'r0879' =>   0,
#IDQ_MITE_UOPS
'r0479' =>   0,
#IDQ_MS_UOPS
'r3079' =>   0,
#LSD_UOPS
'r01A8' =>   -139.22,
#UOPS_RETIRED_RETIRE_SLOTS
'r02C2' =>   287.5236,
#L2_RQSTS_MISS
'r3F24' =>   1126.095
#FP_ARITH_INST_RETIRED_128BIT_PACKED_DOUBLE
#'r04C7' =>	0,
#FP_ARITH_INST_RETIRED_128BIT_PACKED_SINGLE
#'r08C7' =>	0,
#FP_ARITH_INST_RETIRED_256BIT_PACKED_DOUBLE
#'r10C7' =>	0,
#FP_ARITH_INST_RETIRED_256BIT_PACKED_SINGLE
#'r20C7' =>	0,
#FP_ARITH_INST_RETIRED_SCALAR_DOUBLE
#'r01C7' =>	0,
#FP_ARITH_INST_RETIRED_SCALAR_SINGLE
#'r02C7' =>	0

);

%EXE = (	
'Const' => 	231.0355,
#UOPS_EXECUTED_X87
#'r02C0' =>      0,
#UOPS_EXECUTED_THREAD
#'r01B1' => 	    0,
#UOPS_DISPATCHED_PORT_PORT_0
#'r01A1' => 	    0,
#UOPS_DISPATCHED_PORT_PORT_1
'r02A1' => 		0,
#UOPS_DISPATCHED_PORT_PORT_2
'r04A1' => 		0,
#UOPS_DISPATCHED_PORT_PORT_4
#'r10A1' => 		0,
#UOPS_DISPATCHED_PORT_PORT_5
#'r20A1' =>  	0,
#UOPS_DISPATCHED_PORT_PORT_6
'r40A1' =>  	-112.062,
#UOPS_DISPATCHED_PORT_PORT_7
#'r80A1' =>  	0,
#IDQ_DSB_UOPS
'r0879' =>  	155.598,
#IDQ_MITE_UOPS
'r0479' =>  	156.080,
#IDQ_MS_UOPS
'r3079' =>  	112.829,
#LSD_UOPS
'r01A8' =>  	163.458,
#UOPS_RETIRED_RETIRE_SLOTS
'r02C2' =>  	69.805,
#L2_RQSTS_MISS
'r3F24' =>  	0
#FP_ARITH_INST_RETIRED_128BIT_PACKED_DOUBLE
#'r04C7' =>	    0,
#FP_ARITH_INST_RETIRED_128BIT_PACKED_SINGLE
#'r08C7' =>	    0,
#FP_ARITH_INST_RETIRED_256BIT_PACKED_DOUBLE
#'r10C7' =>	    0,
#FP_ARITH_INST_RETIRED_256BIT_PACKED_SINGLE
#'r20C7' =>	    0,
#FP_ARITH_INST_RETIRED_SCALAR_DOUBLE
#'r01C7' =>	    0,
#FP_ARITH_INST_RETIRED_SCALAR_SINGLE
#'r02C7' =>	    0

);



%FE = (	
'Const' => 	83.3972,
#UOPS_EXECUTED_X87
#'r02C0' =>  0,
#UOPS_EXECUTED_THREAD
#'r01B1' => 	0,
#UOPS_DISPATCHED_PORT_PORT_0
#'r01A1' => 	0,
#UOPS_DISPATCHED_PORT_PORT_1
'r02A1' => 	0,
#UOPS_DISPATCHED_PORT_PORT_2
'r04A1' => 	0,
#UOPS_DISPATCHED_PORT_PORT_4
#'r10A1' => 	0,
#UOPS_DISPATCHED_PORT_PORT_5
#'r20A1' =>  0,
#UOPS_DISPATCHED_PORT_PORT_6
'r40A1' =>  56.558,
#UOPS_DISPATCHED_PORT_PORT_7
#'r80A1' =>  0,
#IDQ_DSB_UOPS
'r0879' =>  93.660,
#IDQ_MITE_UOPS
'r0479' =>  188.14,
#IDQ_MS_UOPS
'r3079' =>  288.431,
#LSD_UOPS
'r01A8' =>  0,
#UOPS_RETIRED_RETIRE_SLOTS
'r02C2' =>  0,
#L2_RQSTS_MISS
'r3F24' =>  0
#FP_ARITH_INST_RETIRED_128BIT_PACKED_DOUBLE
#'r04C7' =>	0,
#FP_ARITH_INST_RETIRED_128BIT_PACKED_SINGLE
#'r08C7' =>	0,
#FP_ARITH_INST_RETIRED_256BIT_PACKED_DOUBLE
#'r10C7' =>	0,
#FP_ARITH_INST_RETIRED_256BIT_PACKED_SINGLE
#'r20C7' =>	0,
#FP_ARITH_INST_RETIRED_SCALAR_DOUBLE
#'r01C7' =>	0,
#FP_ARITH_INST_RETIRED_SCALAR_SINGLE
#'r02C7' =>	0

);

%MEM = (	
'Const' => 	144.376,
#UOPS_EXECUTED_X87
#'r02C0' =>      0,
#UOPS_EXECUTED_THREAD
#'r01B1' => 	    0,
#UOPS_DISPATCHED_PORT_PORT_0
#'r01A1' => 	    0,
#UOPS_DISPATCHED_PORT_PORT_1
'r02A1' => 		0,
#UOPS_DISPATCHED_PORT_PORT_2
'r04A1' => 		294.34,
#UOPS_DISPATCHED_PORT_PORT_4
#'r10A1' => 		0,
#UOPS_DISPATCHED_PORT_PORT_5
#'r20A1' =>  	0,
#UOPS_DISPATCHED_PORT_PORT_6
'r40A1' =>  	0,
#UOPS_DISPATCHED_PORT_PORT_7
#'r80A1' =>  	0,
#IDQ_DSB_UOPS
'r0879' =>  	0,
#IDQ_MITE_UOPS
'r0479' =>  	0,
#IDQ_MS_UOPS
'r3079' =>  	0,
#LSD_UOPS
'r01A8' =>  	0,
#UOPS_RETIRED_RETIRE_SLOTS
'r02C2' =>  	0,
#L2_RQSTS_MISS
'r3F24' =>  	1459.34
#FP_ARITH_INST_RETIRED_128BIT_PACKED_DOUBLE
#'r04C7' =>	0,
#FP_ARITH_INST_RETIRED_128BIT_PACKED_SINGLE
#'r08C7' =>	0,
#FP_ARITH_INST_RETIRED_256BIT_PACKED_DOUBLE
#'r10C7' =>	0,
#FP_ARITH_INST_RETIRED_256BIT_PACKED_SINGLE
#'r20C7' =>	0,
#FP_ARITH_INST_RETIRED_SCALAR_DOUBLE
#'r01C7' =>	0,
#FP_ARITH_INST_RETIRED_SCALAR_SINGLE
#'r02C7' =>	0

);






if($RUN_TYPE eq "prof"){


 foreach  $kernel (`cat $kernel_list `){
    chomp( $kernel );    
     $out = "out_$kernel";   
     print "Running kernel $kernel \n"; 
    # `perf stat  -o  $out -x ,          -e r0111,r0211,r1010,r4010 ./$kernel*`;  
    # `perf stat  -o  $out -x , --append -e r8010,r2010,r0110,r0CA1 ./$kernel*`;  
    # `perf stat  -o  $out -x , --append -e r30A1,r40A1,r0879,r0479 ./$kernel*`;  
    # `perf stat  -o  $out -x , --append -e r3079,r01A8,r02C2,r5524 ./$kernel*`;  
    # `perf stat  -o  $out -x , --append -e rAA24,r01A1,r02A1,r80A1 ./$kernel*`;  
#All Events 
#r01A1,r01A8,r01B1,r01C7,r02A1,r02C0,r02C2,r02C7,r0479,r04A1,r04C7,r0879,r08C7,r10A1,r10C7,r20A1,r20C7,r3079,r3F24,r40A1,r80A1
#r01A1,r01A8,r01B1,r01C7,r02A1,r02C0,r02C2,r02C7,r0479,r04A1,r04C7,r0879,r08C7,r10A1,r10C7,r20A1,r20C7,r3079,r3F24,r40A1,r80A1
    
      `perf stat  -o  $out -x ,          -e ref-cycles,r01A8,r02A1,r02C2,r0479,r04A1,r0879,r3079,r3F24,r40A1 ./$kernel*`;  
     #`perf stat  -o  $out -x ,          -e r01A1,r01A8,r01B1,r01C7,r02A1,r02C0,r02C2,r02C7,r0479,r04A1,r04C7,r0879,r08C7,r10A1,r10C7,r20A1,r20C7,r3079,r3F24,r40A1,r80A1 ./$kernel*`;  
#     `perf stat  -o  $out -x , --append -e  ./$kernel*`;  
#     `perf stat  -o  $out -x , --append -e  ./$kernel*`;  
#     `perf stat  -o  $out -x , --append -e  ./$kernel*`;  
#     `perf stat  -o  $out -x , --append -e  ./$kernel*`;  


     $startEnergyPP0=`$cmdlineEnergyPP0Dump`;
     $before= `./rdtsc`;
     foreach $it (1 .. 2000){ 
        `./$kernel*`;
     }
     $after= `./rdtsc`;
     $endEnergyPP0=`$cmdlineEnergyPP0Dump`;
     $benchmarkEnergyPP0 = ($endEnergyPP0 - $startEnergyPP0)*$energy_unit ;
     if($benchmarkEnergyPP0 <0){
        $benchmarkEnergyPP0 = (2**32 + $endEnergyPP0 - $startEnergyPP0)*$energy_unit; 
     }
     $bechmarkTime = ($after-$before)/(2.4*1000000000);
     $power = $benchmarkEnergyPP0/$bechmarkTime;
     print "benchmarkEnergyPP0 = $benchmarkEnergyPP0 \n";
     print "bechmarkTime       = $bechmarkTime \n";
     print "Power = $power \n";
     `echo total_power=$power >> $out`;
     print " Core.X87 Coeff $CORE{'r02C0'} \n";
     print "-------------------------------------------------------------------\n";
     sleep 2;
}
}else{
my  $CORE_Power = 0;
my  $FE_Power = 0;
my  $EXE_Power = 0;
my  $MEM_Power = 0;
my  $count_val;
my  $count_code;

open my $FILE,$PROFFILE or die "Could not open file: $!";
my $found_ref_cycles = 0;
my $ref_cycles = 0;
while(my $line = <$FILE>){
   if($line =~ /(.*),ref-cycles.*/){
        $ref_cycles = $1;
        $found_ref_cycles = 1;
        print "Ref Cycles $ref_cycles  \n";
   }
   if($line =~ /(.*),(.*)/){
      if($found_ref_cycles != 1){ 
           die "did not found ref cycles"; 
      }
     $count_val  = $1;
     $count_code  = $2;
            
     print "$count_val,$count_code\n";
     $CORE_Power = $CORE_Power +  $count_val*$CORE{$count_code}/$ref_cycles;
     $FE_Power  = $FE_Power  +  $count_val*$FE{$count_code}/$ref_cycles;
     $EXE_Power = $EXE_Power +  $count_val*$EXE{$count_code}/$ref_cycles;
     $MEM_Power = $MEM_Power +  $count_val*$MEM{$count_code}/$ref_cycles;
   }
}
print "CORE_Power = $CORE_Power\n";
print "FE_Power  = $FE_Power\n";
print "EXE_Power = $EXE_Power\n";
print "MEM_Power = $MEM_Power\n";
}
