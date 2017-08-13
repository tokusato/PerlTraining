

my $curdir = "getcwd";

print("$curdir\n");

#system関数を利用してOSコマンドを実行する。
system("dir");

#0埋めの5桁で数字を連続表示
for (1..5){
	my $strNum = sprintf("%05s",$_);
	print ("$strNum\n");
}







