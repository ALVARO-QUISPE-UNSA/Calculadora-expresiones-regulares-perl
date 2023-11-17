#!/usr/bin/perl
use strict;
use warnings;

my $exp = <STDIN>;
chomp( $exp );
if ($exp =~ /^([\d]+)\s*([\d]+)/) {
  print $1 + $2;
  print "\n";
}
=pod
if ($exp =~ /^( [\-+*\d]+ )\+\*( [\-+*\d]+ )$/) {
  print "$1, $2, \n";
}
=cut