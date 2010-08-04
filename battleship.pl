#!/usr/bin/perl

use strict;

use Player;
use Board;
use Ship;
use Data::Dumper;


my $config = {
	ships => {
		submarine => 2,,
		destroyer => 3,
		cruiser => 4,
		battleship => 4,
		carrier => 5
		},
	boardSize => {
		width => 10,
		height => 10
		},
		};

main();

sub main {
	print <<EOL;
Welcome to doug's battleship
Version 0.1

Two human players compete

EOL

	print "What's your name?";
	my $name = <STDIN>;
	chomp $name;
	my $player1 = new Player($name, $config->{boardSize}->{height}, $config->{boardSize}->{width});

	while (1) {
		print "What's your opponent's name?";
		$name = <STDIN>;
		chomp $name;
		if ($name eq $player1->name) {
			print "Hey you can't play yourself!";
			next;
		}
		last;
	}
	my $player2 = new Player($name, $config->{boardSize}->{height}, $config->{boardSize}->{width});

	for my $player ($player1, $player2) {
		print "Choose your ship locations <letter><number>";
		for my $shipName (keys %{$config->{ships}}) {
			print $player->name . " here's the board:";
			print $player->myBoardDisplay;
			my $length = $config->{ships}->{$shipName};
			while (1) {
				print "$shipName\n";
				print "Position:";
				my $position = <STDIN>;
				chomp $position;
				$position = uc($position);
				if ($position !~ /^[A-J][0-9]$/i) {
					print "Position must be specified as Letter followed by number\n";
					next;
				}
				print "Orientation[H/V]:";
				my $orientation = <STDIN>;
				chomp $orientation;
				$orientation = uc($orientation);
				if ($orientation !~ /^[HV]/i) {
					print "Orientation must be H or V\n";
					next;
				}
				my $position_char = substr($position, 0, 1);
				my $position_num = substr($position, 1, 1);
				#confirm ship fits on board


				my $ship = new Ship($shipName, $length, $position, $orientation);
				$player->addShip($ship);
				last;
			}
		}
	}


}







