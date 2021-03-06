use strict;
use vars qw($test $ok $total);
sub OK { print "ok " . $test++ . "\n" }
sub NOT_OK { print "not ok " . $test++ . "\n"};

BEGIN { $test = 1; $ok=0; $| = 1 }
END { NOT_OK unless $ok }

use enum;

$ok++;
OK;

use enum qw(Foo Bar Cat Dog);
use enum qw(
	:Months_=0 Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
	:Days_     Sun=0 Mon Tue Wed Thu Fri Sat
	:Letters_=0 A..Z
	:=0
	: A..Z
	Ten=10	Forty=40	FortyOne	FortyTwo
	Zero=0	One			Two			Three=3	Four
	:=100
);

#2
(Zero != 0 or One != 1 or Two != 2 or Three != 3 or Four != 4)
	? NOT_OK
	: OK;

#3
(Ten != 10 or Forty != 40 or FortyOne != 41 or FortyTwo != 42)
	? NOT_OK
	: OK;

BEGIN { $total = 3; print "1..$total\n" }
