#/usr/bin/perl

use strict;

use Config;
use Board;

package Player;

sub new {
	my ($class, $name) = @_;

	my $self = {
		name => $name,
		myBoard => new Board(1),
		opponentBoard => new Board(0),
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
	$self->myShips{$ship->name} = $ship;
} 

sub myBoardDisplay {
	return $self->myBoard->displayBoard();
}

sub opponentBoardDisplay {
	return $self->opponentBoard->displayBoard();
}

1;



