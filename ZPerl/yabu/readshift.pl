#!/usr/bin/perl

open FILE, "coord.txt" or die 'ファイルが開けません。';
@data = ();
while (<FILE>) {
chomp;
push @data, [ split /\s+/ ];
}
close FILE;

#print "$data[0][0] \n";
#print "$data[0][3] \n";
#print "$data[0][1] \n";
#print "$data[1][0] \n";
#print "$data[1][1] \n";
#print "$data[5][1] \n";
#print "$data[5][3] \n";
# もしかして後半が[0]のものは値として読み取られていない。

$rows=@data;
$cols=@{$data[0]};


#print "$rows \n"; # 257
#print "$cols \n"; # 4

$shift =  15.41;

for ($i =0; $i< $rows;$i++) {

#print "$data[$i][1] \n"
$data2[$i][1] = $data[$i][1] + $shift;
print "$data2[$i][1] $data[$i][2] $data[$i][3] \n";


}

