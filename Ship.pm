#!/usr/bin/perl

use strict;

package Ship;

sub new {
  my ( $class, $name, $length, $position, $orientation ) = @_;

  my $self = {
    name => $name,
    position_char => substr( $position, 0, 1 ),
    position_num => substr( $position, 1, 1 ),
    len => $length,
    orientation => $orientation,
    sunk => 0
  };

  bless ( $self, $class );

  return $self;

}

sub name {
  my ($self) = @_;
  return $self->{name}
}

sub length {
  my ($self) = @_;
  return $self->{len};
}

sub position {
  my ($self) = @_;
  return ( $self->{position_char} , $self->{position_num} );
}

sub orientation {
  my ($self) = @_;
  return $self->{orientation};
}

sub cells {
  my ($self) = @_;
  print "cells " . $self->{len} . "\n";
  my $a = [];
  for ( my $i = 0; $i < $self->{len}; $i = $i + 1 )
  {
    my $char;
    my $num;
    if ( $self->{orientation} eq 'H' )
    {
      $char = $self->{position_char};
      $num = $self->{position_num} + $i;
    }
    else
    {
      $char = chr( ord($self->{position_char}) + $i );
      $num = $self->{position_num};
    }
    push @$a, ( $char . $num );
  }
  return $a;
}

sub abbrev {
  my ($self) = @_;
  return substr( $self->{name}, 0, 2 )
}
1;
