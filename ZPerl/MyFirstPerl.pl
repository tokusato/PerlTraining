#!/usr/bin/perl

use warnings;
use strict;
use File::Basename;
use utf8;
#binmode STDOUT, ':encoding(utf8)'; #Windows は utf8->cp932


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
print "$var";
print "\n";

# クォートを用いた配列の生成
my @list = qw/one two three four/;

# モジュールを利用した処理(ファイルのパスなど)
my $path = '/path/to/some/file.txt';
my $filename = basename($path);
my $dir = dirname($path);
print "$filename\n";

# 利用可能なモジュール一覧を表示(INCは環境変数)
print "#######################\n";
print "Printing usable modules\n";
print "#######################\n";
foreach my $path (@INC){
    print "$path\n";
}

# perl のモジュール利用
print "#####################\n";
print "use module with perl \n";
print "#####################\n";
# 簡略化のため、このプログラムと同じ階層にあるperlモジュールを利用
require "sample.pm";
my $y = func1(10);
print "$y\n";

# perl のオブジェクト指向
require "Class1.pm";
print "#####################\n";
print "OOP with perl program\n";
print "#####################\n";
my $obj = Class1->new;  # Class1 のコンストラクタを呼出しインスタンス化
print $obj->get, "\n";  # 初期値が 0 であることを確認。
$obj->set(5);           # 値を書き換える。
print $obj->get, "\n";  # 値が 5 になったことを確認。

