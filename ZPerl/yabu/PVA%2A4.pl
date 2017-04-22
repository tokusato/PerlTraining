# usr/bin/perl


open FILE, "tekito" or die 'cannot open file';
@data = ();
while(<FILE>){
chomp;
push @data,[split /\s+/ ];
}
close FILE;

$rows = @data;
$cols = @{$data[0]};


$shifty = 3.50;
$shiftz = 3.50;

for ($i=0;$i<$rows;$i++){
$data2[$i][1] = $data[$i][1] ;
$data2[$i][2] = $data[$i][2] + $shifty;
$data2[$i][3] = $data[$i][3] + $shiftz;
print " $data2[$i][1] $data2[$i][2] $data2[$i][3] \n";
}

for ($i=0;$i<$rows;$i++){
$data3[$i][1] = $data[$i][1] ;
$data3[$i][2] = $data[$i][2] - $shifty;
$data3[$i][3] = $data[$i][3] + $shiftz;
print " $data3[$i][1] $data3[$i][2] $data3[$i][3] \n";
}

for ($i=0;$i<$rows;$i++){
$data4[$i][1] = $data[$i][1] ;
$data4[$i][2] = $data[$i][2] + $shifty;
$data4[$i][3] = $data[$i][3] - $shiftz;
print " $data4[$i][1] $data4[$i][2] $data4[$i][3] \n";
}

for ($i=0;$i<$rows;$i++){
$data5[$i][1] = $data[$i][1] ;
$data5[$i][2] = $data[$i][2] - $shifty;
$data5[$i][3] = $data[$i][3] - $shiftz;
print " $data5[$i][1] $data5[$i][2] $data5[$i][3] \n";
}
