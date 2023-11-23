#!/usr/bin/perl
use strict;
use warnings;
sub concac  {
  #my ($x, $y) = @_;
  $_[0] .= $_[1];
  #$x .= $y;

}
#expresión que detecta las sumas
=pod
if ($exp =~ /^([\-|\+]?[\d]+)\s*([\-|\+][\d]+)(.*)$/) {
  my $a = $1 + $2;
  $exp = $a.$3;
  print "$exp\n";
} else {
  print "No encontrado\n";
}
=cut
=pod
if ($exp =~ /^([\-|\+]?[\d]+)\s*([\*|\/])\s*([\-|\+]?[\d]+)(.*)$/) {
  my $a;
  if ($2 eq "*") {
    $a = $1 * $3;
  } else {
    $a = $1 / $3;
  }
=cut
#MAIN-----------
my $exp = <STDIN>;
chomp($exp);

if ($exp =~ /(.*)\((.+)\)([^)]*)/) {
  $exp = $1.$2.$3;
  print "$exp\n";
} else {
  print "No tiene\n";
}
