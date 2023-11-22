#!/usr/bin/perl
use strict;
use warnings;

sub cal {
  if ($_[0] =~ /^([\-|\+]?[\d]+)\s*([\-|\+][\d]+)(.*)$/) {
    my $a = $1 + $2;
    $_[0] = $a.$3;
    return cal($_[0]);
  } else {
    return $_[0];
  }
}
#MAIN------------
my $exp = <STDIN>;
chomp( $exp );
print cal($exp);
print "\n";



