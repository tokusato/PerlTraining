use strict;
use warnings;

print "(1)現在の日付と時刻(協定世界時)を取得する。\n";
#    秒   分    時     日     月    年     曜日   年初か 夏時間を
#                                                 らの   適用して
#                                                 経過日 いるか
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = gmtime;

# localtime関数からは1900年から数えた年が返却される。
$year += 1900;

# 月は0から始まるので、表示するときは1を加える。
$mon++;

# 日曜日は0になります。
my @day_of_week = qw/日 月 火 水 木 金 土/;

print "現在は、$year年$mon月$mday日 $hour時$min分$sec秒です。";
print "曜日は" . $day_of_week[$wday] . "曜日です。\n\n";
print "1年で数えると$yday日が経過しました。\n\n";

if ($isdst){
  print "現在夏時間が適用されいます。\n\n";
}
else {
  print "現在夏時間は適用されていません。\n\n";
}

print "(2)文字列として現在の日付(協定世界時)を取得する。\n";
my $date_str = gmtime;
print $date_str . "\n";