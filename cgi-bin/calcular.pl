#!/usr/bin/perl
use strict;
use warnings;
use CGI;


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
    return mult($1.$p.$6);
    #return $1.$p.$6;
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
  if ($_[0] =~ /(.*)\((.+?)\)(.*)/) {
    ##print $2."\n";
    $_[0] = $1.calculate($2).$3;
    return calculate($_[0]);
  }
  return sum(mult($_[0]));
}
=pod
#MAIN------------
my $exp = <STDIN>;
chomp( $exp );
print calculate($exp)."\n";
=cut

#Partes de CGI
my $q = CGI->new;
my $ex = $q->param("ex");
my $ans = calculate($ex);
#INICIANDO HTML
print "Content-type: text/html\n\n";
print<<OJOSAZULES
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Calculadora en perl</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
  </head>

  <body>
    <h1>Calculadora :)</h1>
    <form action="calcular.pl" method="GET">
      <label type="text" name="ex">Ingrese su operación algebraica:</label>
      <br>
      <input type="text" name="ex" value="$ex">
      <br>
      <input type="submit" value="Calcular">
    </form>
    <br>
    <div>
      <h2>Resultado:</h2>
      <p class="answer">$ans</p>
    </div>

  </body>
</html>

OJOSAZULES

