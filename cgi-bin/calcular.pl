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
    return sum($s.$5);
  } 
  return $_[0];
}

sub mult {
  if ($_[0] =~ /(.*?)([\d]+)\s*([\*|\/])\s*([\-|\+])?([\d]+)(.*)$/) {
    #definir las variables
    my $p1 = $2;
    my $p2 = $5;
    if (defined($4)) {
      $p2 = $4.$5;
    }
    #operación
    my $p;
    if ($3 eq "*") {
      $p = $p1 * $p2;
    } else {
      $p = $p1 / $p2;
    }
    return $1.$p.$6;
  }
  return $_[0];
}

sub calculate {
  if ($_[0] =~ /(.*)([\+|-])\s*([\+|-])(.*)/) {
    if ($2 eq $3) {
      $_[0] = $1."+".$4;
    } else {
      $_[0] = $1."-".$4;
    }
    return calculate($_[0]);
  }
  if ($_[0] =~ /(.*)\((.+)\)([^)]*)/) {
    $_[0] = $1.calculate($2).$3;
    return calculate($_[0]);
  }

  return $_[0];
}
#MAIN------------
my $exp = <STDIN>;
chomp( $exp );
#calculate($exp);
#print $exp."\n";
print mult($exp)."\n";

