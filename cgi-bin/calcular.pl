#!/usr/bin/perl
use strict;
use warnings;

my $exp = <STDIN>;
chomp( $exp );
if ($exp =~ /^([\-|\+]?[\d]+)\s*([\-|\+][\d]+)(.)*$/) {
  $exp = $1.$2;
  print "$exp\n";
}
