#/usr/bin/perl

use strict;

#use Config;
use Board;
use Ship;

package Player;

sub new {
	my ($class, $name, $boardHeight, $boardWidth) = @_;

	my $self = {
		name => $name,
		myBoard => new Board(1,$boardHeight, $boardWidth),
		opponentBoard => new Board(0, $boardHeight, $boardWidth),
		myShips => {},
		opponentShips => {}
		};
	bless ($self, $class);
	return $self;
}

sub name {
	my $self = $_;
	return $self->{name};
}

sub addShip {
	my ($self, $ship) = @_;
	$self->{myBoard}->addShip($ship);
	$self->{myShips}->{$ship->name} = $ship;
} 

sub myBoardDisplay {
	my $self = $_;
	return $self->myBoard->displayBoard();
}

sub opponentBoardDisplay {
	my $self = $_;
	return $self->opponentBoard->displayBoard();
}

1;



