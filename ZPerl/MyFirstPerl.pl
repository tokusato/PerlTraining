#!/usr/bin/perl

use warnings;
use strict;

print "Hello world \n";

##正規表現の練習

# 量指定子
my $string1 = "aaa";
if ($string1 =~ /a{1,3}/){
	print "match 量指定子 \n";
}

# 量指定子 + 文字クラス
my $string2 = "aar1";
if ($string2 =~ /a{1,3}[p,q,r]1/){
	print "match 量指定子 + 文字クラス \n";
}

# マッチ + 置換
my $string3 = "aar1";
if ($string3 =~ s/a{1,3}[p,q,r]1/"HelloWorld"/){
	print "replaced to $string3\n";
}

# 正規表現のオプション
my $string4 = "  aaa  ";
if ($string4 =~ /^\s+/m) {
	print "there are spaces before contents\n";
}
# 改行文字の削除
my $var = "hello\n";
chomp($var);
print "$var)";
