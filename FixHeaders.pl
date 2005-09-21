#!/usr/bin/perl
use warnings;
use strict;

my $header = q{

  XCSoar Glide Computer - http://xcsoar.sourceforge.net/
  Copyright (C) 2000 - 2005  

  	M Roberts
	Scott Penrose <scottp@dd.com.au>
	John Wharington <jwharington@bigfoot.com>

  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

};

foreach my $file (@ARGV) {
	print STDERR "Fixing copyright in $file\n";
	rename $file, $file . ".tmp";
	open (IN, "< " . $file . ".tmp")
		or die("Unable to open temp file " . $file . ".tmp - you may need to fix by hand - $!");
	my $buffer;
	{
		local $/;
		$buffer = <IN>;
	}
	$buffer =~ s/Copyright_License\s*{[^}]*}/Copyright_License {$header}/;
	close IN;

	open (OUT, "> $file")
		or die("Unable to open original input file $file for output - $!");
	print OUT $buffer;
	close OUT;
}
