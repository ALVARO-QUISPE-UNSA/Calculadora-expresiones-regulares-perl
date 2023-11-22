#!/usr/bin/perl
use strict;
use warnings;

#Calculas las sumas
sub sum {
  if ($_[0] =~ /^([\-|\+])?\s*([\d]+)\s*([\-|\+])\s*([\d]+)(.*)$/) {
    my $s1 = $2;
    if (defined($1)) {
      $s1 = $1.$2;
    }
    my $s2 = $3.$4;
    my $s = $s1 + $s2;
    $_[0] = $s.$5;
    return sum($_[0]);
  } else {
    return $_[0];
  }
}
#MAIN------------
my $exp = <STDIN>;
chomp( $exp );
print sum($exp);
print "\n";



