#!/usr/bin/perl
#
#=============================================================
# Created: Wed 18 May 2022 02:58:01 PM -03
# Modified: Mon 23 May 2022 09:33:55 AM -03
#=============================================================                                                               
#=============================================================   
# Author: Leonardo Berbert                                       
#=============================================================


use Data::Dumper;
use Getopt::Std;

local %opts = ();
getopts("u:c:m:h",\%opts);

if ($opts{u}) { $user = $opts{u};} else { do_help();}
if ($opts{c}) { $comm = $opts{c};} else { do_help();}
if ($opts{m}) { $machine = $opts{m};} else { do_help();}
if ($opts{h}) { do_help();}

my @machine = split /,/, $machine;

my @list = ();

for my $i (0 .. $#machine){
	my $m = `ssh $user\@$machine[$i] $comm`;
	print("SERVER: $machine[$i]\n");
	print("$m");
}

sub do_help {

print <<EOF;

	Use $0 -u USER -c COMMAND -m HOST

	Options are:

	-u USER. (Mandatory)
	-m MACHINE. For more than one argument use comma. Ex: -m myhost1,myhost2. (Mandatory)
	-c COMMAND. Command to be executed.
	-h This help

	Example: $0 -u tcserver -c uptime -m myhost1,myhost2

EOF

exit(1);
}
