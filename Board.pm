#/usr/bin/perl

use strict;

#use Config;
use Ship;

package Board;

sub new {
	my ($class, $isMine, $boardHeight, $boardWidth) = @_;

	my $self = {};
	my $board = {
		isMine => $isMine,
		boardHeight => $boardHeight,
		boardWidth => $boardWidth,
		};
	for (my $i = 0; $i < $boardHeight; $i++) {
		my $char = chr(65 + $i);
		$board->{$char} = [];
		for (my $j = 1; $j < $boardWidth; $j++) {
			$board->{$char}->[$j] = {
				hit => 0,
				ship => undef
				};
		}
	}
	$self->{board} = $board;
	bless ($self, $class);
	return $self;
}

sub displayBoard {
	my $self = $_;
	my $board = $self->{board};
	my $s = '   ';
	for (my $i = 0; $i < $self->{boardWidth}; $i++) {
		$s .= " -$i - ";
	}
	$s .= "\n";

	for (my $i = 0; $i < $self->{boardHeight}; $i++) {
		my $char = chr(65 + $i);
		my $row = $board->{$char};
		$s .= "$char: ";
		for (my $j = 1; $j < $self->{boardWidth}; $j++) {
			my $cell = $row->[$j];
			my $hit = $cell->{hit} ? 'X' : ' ';
			if ($self->{isMine}) {
				if ($cell->{ship}) {
					$s .= " $hit" . $cell->{ship}->abbrev . "$hit ";
				} else {
					$s .= "     ";
				}
			} else {
				$s .= "  $hit  ";
			}
		}
	}
	return $s;
}

#return emsg or undef
sub addShip {
	my ($self, $ship) = @_;

	#place on Board
	my $cells = $ship->cells;
	for my $cell (@$cells) { 
		$self->{board}->{$cell->[0]}->[$cell->[1]]->{ship} = $ship;
	}
}

1;



