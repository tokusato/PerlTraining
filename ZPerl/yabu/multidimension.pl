
use strict

$data[0][0] = "cat" ;
$data[1][0] = "dog" ;
$data[0][1] = "pig" ;
$data[1][1] = "cow" ;

foreach my $ref(@data){
     print "@$ref\n";
}

print "\n\n";

#print "$data[0][1] \n";
print "@data \n";
print "$data \n";
print "@$data \n";
print "$#data \n"; #  $#を用いるとこの配列で指定できる最大の添え字を参照できる



#@array = (); ここでは空の配列@arrayを定義


system("dir");
system('cd ..');
system("dir");
