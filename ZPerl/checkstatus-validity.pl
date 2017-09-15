#!/usr/bin/perl

use strict;
use warnings;
#use Cwd;

#################################################
#use constant SST_DIR => "/root/perl/status-tools";
#use constant SST_DIR => Cwd::getcwd();
#use constant CHECK_STATUS_SHELL => "/root/perl/status-tools/checkstatus.sh";
#################################################

#exectime
my $datetime = `date +"%Y%m%d%H%M%S" `;
#directory path
my $sst_dir = `pwd`; chomp($sst_dir);
my $check_status_shell = $sst_dir . "/checkstatus.sh";
my $check_status_outputfile = "$sst_dir" . "/status/exec/status" . "$datetime";
my $master_status_outputfile = "$sst_dir" . "/status/status_master.txt" ;
#my $check_status_outputfile = "$sst_dir". "$datetime";
#my $check_status_outputfile = "$sst_dir" . "/exec/status" ;

#print("########");
#print("$sst_dir\n");
#print("$check_status_outputfile\n");
#print("########");



#Step1 checkstatusを実行し、実行結果をexecディレクトリに格納する。
&output_status;

#Step2 状態マスターファイルから状態を読み取る
my @pattern_string = ();
@pattern_string = &register_status_pattern;
#print("$pattern_string[0]");
#print("##############\n");
#print("@pattern_string\n");
#print("$pattern_string[0]\n");

#Step3 配列の要素がcheckstatus実行結果に含まれるかを確認する。
&validity_check(@pattern_string);



###############################################################################
#subroutine
sub output_status{
	#print("checking status\n");
	system("$check_status_shell > $check_status_outputfile");
}

sub register_status_pattern{

	my $hostname = `hostname`;
	
	open FILE, "$master_status_outputfile" or die 'cannot open file';
	my @status_data = ();
	my $host_match_flag;
	while(<FILE>){
		#select hostname section
		#print ("$hostname\n");
		if ($_ =~ m/^$hostname/){
			$host_match_flag = 1;
			#print ("match" . " " .  $_ . "\n");
		}
		if ($host_match_flag){
			chomp;
			push (@status_data,$_);
		}
		if ($_ =~ m/^$/){
			$host_match_flag = 0;
			#print ("match" . $_ . "\n");
		}
		#print("$status_data[0]");
	}
	close FILE;
	#print("##################");
	#print("$status_data[0]");
	#print("##################");
	#先頭要素はホスト名のため、削除
	shift @status_data;
	#末尾要素は改行のため、削除
	pop   @status_data;
	return @status_data;
}

sub validity_check{

	#引数を配列に格納
	my @pattern_string = @_;
	my $total_check_number = $#pattern_string + 1;
	my $valid_check_number ;
	my $invalid_check_number ;
	my @valid_list = ();
	my @invalid_list = ();
	#my $compare_status;	

        foreach my $pattern(@pattern_string){
		print("pattern is " . $pattern . "\n");
	}


	open FILE, "$check_status_outputfile" or die 'cannot open file';
	my @output_status_data = ();
	while(<FILE>){
		chomp;
		push (@output_status_data,$_);
	}
	close FILE;
	#print("$#output_status_data\n");

	foreach my $pattern(@pattern_string){
		#my $pattern_match_flag = 0;
		my $counter = 0;
		foreach my $output_data(@output_status_data){
			
			#$compare_status = "【TOBE】 : " . $pattern . "   【ASIS】" . $output_data;
			print ("$output_data" . "::::" . "$pattern\n");
			if ($output_data =~ /$pattern/){
				print("this is valid : pattern => $pattern output_data => $output_data\n");
				push (@valid_list,$output_data);
				last;
			} else {
				#正しい状態パターンにマッチしなかったので
				if ($counter == $#output_status_data){
					push (@invalid_list,$pattern);
				print("this is invalid : pattern => $pattern\n");
				}
				#print("this is invalid : pattern => $pattern output_data => $output_data\n");
				#print("$compare_status\n");
			}	
			$counter++;
		}
		
	}
	print("\n\n\n\n");
	print("$#output_status_data\n");
	print("\n\n\n\n");

	

	my @unique_valid_list = do { my %h; grep { !$h{$_}++ } @valid_list };
	my @unique_invalid_list = do { my %h; grep { !$h{$_}++ } @invalid_list };
	foreach my $tmp(@unique_valid_list){
		print ("####");
		print ("$tmp\n");
	}

	$valid_check_number =  $#unique_valid_list + 1;
	$invalid_check_number =  $total_check_number-$valid_check_number;
	print ("状態確認の結果 =>    " . "$valid_check_number/" . "$invalid_check_number/" . "$total_check_number" . " :  (正常数)/(異常数)/(総数)\n");
	if ($#invalid_list != 0){
		print("異常な起動状態のPPは以下\n");
		my $number = 1;
		foreach my $invalid_element(@unique_invalid_list){
			print("(" . $number . ") : $invalid_element\n");
			$number++;
		}
	}
	
	print("\n\n\nAAAAAAAAAAAAAA\n");
        foreach my $tmp(@unique_valid_list){
		print("$tmp\n");
	}
	print("AAAAAAAAAAAAAA\n");
        foreach my $tmp(@unique_invalid_list){
		print("$tmp\n");
	}

}




