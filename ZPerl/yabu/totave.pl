#!/usr/bin/perl

print "write the number of the array\n";

$num =<stdin>;

print "input section\n";

for ($i = 0 ;  $i<$num  ; $i++)
{
  $list[$i] = <STDIN>;
# print "\n";
}

print "total is ";

$total = 0;

for ($i = 0 ; $i<$num ; $i++)
{ 
$total = $total + $list[$i];
}

print "$total\n";

print "average is ";

$ave = $total/$num;

print "$ave\n";









