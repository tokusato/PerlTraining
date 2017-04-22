#!usr/bin/perl 

$cat = 1.000;
$dog = 1.500;


open (IN,"MCPlin.inp");
open (OUT,">newcoord.inp");
while (<IN>){
  s/7.740747/$dog/;
  s/7.740746/$cat/;
print OUT;
}

close(IN);
close(OUT);





