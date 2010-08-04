//Config parameters

use strict;

package Config;

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
		`
		};

sub ships {
	return $config->{ships};
}

sub boardHeight {
	return $config->{boardSize}->{height};
}

sub boardWidth {
	return $config->{boardSize}->{width};
}



1;
