#!/usr/bin/perl
use strict;
use warnings;

my $exp = <STDIN>;
chomp( $exp );
if ($exp =~ /^([\-|\+]?[\d]+)\s*([\-|\+][\d]+(.)$)/) {
  print "\n";
}
