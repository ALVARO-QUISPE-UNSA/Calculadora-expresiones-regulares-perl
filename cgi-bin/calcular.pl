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
  } elsif ($_[0] =~ /\d+/) {
    return $_[0];
  } else {
    print "Patrón de suma no encontrado en $_[0]\n";
  }
}

sub mult {
  if ($_[0] =~ /^([\-|\+])?([\d]+)\s*([\*|\/])\s*([\-|\+])?([\d]+)(.*)$/) {
    #definir las variables
    my $p1 = $2;
    if (defined($1)) {
      $p1 = $1.$2;
    }
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
    return $p.$6;
  }
}

sub calculate {
  if ($_[0] =~ /(.*)([\+|-])([\+|-])(.*)/) {
    if ($2 eq $3) {
      $_[0] = $1."+".$4;
    } else {
      $_[0] = $1."-".$4;
    }
    print "$_[0]\n";
    return calculate($_[0]);
  }
  if ($_[0] =~ /(.*)\(.+\)([^)])*/) {
    return $2."\n";
  } else {
    print "nope \n";
  }
}
#MAIN------------
my $exp = <STDIN>;
chomp( $exp );
print calculate($exp)."\n";
