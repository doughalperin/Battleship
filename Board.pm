#/usr/bin/perl

use strict;

use Config;

package Board;

sub new {
	my ($class, $isMine) = @_;

	my $self = {};
	my $board = {isMine => $isMine};
	for (my $i = 0; $i < Config->boardHeight; $i++) {
		my $char = chr(65 + $i);
		$board->{$char} = [];
		for (my $j = 1; $j < Config->boardWidth; $j++) {
			$board->{$char}->[$j] = {
				hit => 0,
				ship => undef
				};'
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
	for (my $i = 0; $i < Config->boardWidth; $i++) {
		$s .= " -$i - ";
	}
	$s .= "\n";

	for (my $i = 0; $i < Config->boardHeight; $i++) {
		my $char = chr(65 + $i);
		my $row = $board->{$char};
		$s .= "$char: ";
		for (my $j = 1; $j < Config->boardWidth; $j++) {
			my $cell = $row->[$j];
			my $hit = $cell->{hit} ? 'X' : ' ';
			if ($self->{isMine}) {
				if ($cell->{ship}) {
					$s .= " $hit" . $ship->abbrev . "$hit ";
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



