#!/usr/bin/perl
use strict;
use warnings;

my $exp = <STDIN>;
chomp( $exp );
if ($exp =~ /^([\-|\+]?[\d]+)\s*([\-|\+][\d]+)(.)*$/) {
  my $a = $1 + $2;
  $exp = $3;
  print "$exp\n";
}
