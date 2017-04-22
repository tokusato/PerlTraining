# usr/bin/perl


open FILE, "atom" or die 'cannot open file';
@data = ();
while(<FILE>){
#chomp;
#push @data,[split /\s+/ ];
 @data = <FILE>;
}
close FILE;

$rows = @data;
$cols = @{$data[0]};



for ($i=0;$i<$rows;$i++){
 
 $data[$i] =~ s/1/H/g;
 $data[$i] =~ s/6/C/g;
 $data[$i] =~ s/8/O/g;
print "$data[$i]";

}








