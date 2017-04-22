#!/usr/bin/perl
#このプログラムではファイルの内容を変数に代入し、その変数に対して演算をしてファイルへ書きだすものである。

open FILE, "MCP3.1.inp" or die 'ファイルが開けません。';
@data = ();
while (<FILE>) {
chomp;
push @data, [ split /\s+/ ];
}
close FILE;

#print "$data[0][3] \n";
#print "$data[0][1] \n";
#print "$data[1][0] \n";
#print "$data[1][1] \n";
#print "$data[5][1] \n";
#print "$data[5][3] \n";
# もしかして後半が[0]のものは値として読み取られていない。

$rows=@data;
$cols=@{$data[0]};

print "$data[506][2] \n" ;
print "$data[507][2] \n" ;
print "$data[508][2] \n" ;
print "$data[509][2] \n" ;
print "$data[510][2] \n" ;
print "$data[511][2] \n" ;

# $data[$i] =~ s/1/H/g;

$value = 0.05;

for ($i=506 ; $i<509 ;$i++){

$data[$i][2] = $data[$i][2] + $value ;

print "$data[$i][2] \n";

}
for ($i=509 ; $i<512 ;$i++){

$data[$i][2] = $data[$i][2] - $value ;

print "$data[$i][2] \n";

}


open (OUT,">data.dat");
#print OUT "$data[1][1] \n";
foreach my $ref(@data){
 print  OUT "@$ref\n";
}




#print "$rows \n"; # 257
#print "$cols \n"; # 4


#for ($i =0; $i< $rows;$i++) {

#print "$data[$i][1] \n"
#$data2[$i][1] = $data[$i][1] + $shift;
#print "$data2[$i][1] $data[$i][2] $data[$i][3] \n";


#}








