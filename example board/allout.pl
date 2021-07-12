#!/usr/bin/perl
# Ryan's In?out Board allout script
# For changing entire Ryansiob datafile list to OUT without amending comments
# Part of Ryan's In/Out Board v3.2
#
# Ryan's In/Out Board by Ryan Cartwright
# Licenced unger GPL - see docs.
# see http://ryansiob.sceforge.net for more details
# Ryan's In/Out Board is copyright (c) Ryan P. Cartwright

# amend the line below to point to the location of your config file on
# the server filessytem
require "/usr/lib/cgi-bin/ryansiob/ryansiob.config.pl";

# nothing below here needs altering
use strict;
use Date::EzDate;
use CGI qw(param);
use File::Copy;

my $counter = 0;
my ($line,$email,$name,$status,$date,$comment,$phone,$return,$dept);
my @alldata;

# Make backup of datafile before we access it
my $bak_datafile = $ryansiob::datafile . ".bak";
copy ($ryansiob::datafile, $bak_datafile)||die "Unable to make backup copy of datafile";

open (DATA,$ryansiob::datafile) ||die "datafile cannot be opened";
while ($line = <DATA>) {
    chomp($line);
    ($email,$name,$status,$date,$comment,$phone,$return,$dept)=split(/\|/,$line);
	 if (grep /$status/, $ryansiob::instatuses ) {
       $status = "OUT";
       $comment = "AUTO $comment";
	 	 my $newdate = Date::EzDate->new;
	    $date = $newdate->{"%d %h / "};
	    if ($ryansiob::dateformat == 1){
		   $date .= "12:00 am";
       }
	    else {
		   $date .= "00:00";
	    }
    }
    $alldata[$counter]="$email|$name|$status|$date|$comment|$phone|$return|$dept\n";
++$counter;
}
close (DATA);

my $todate = Date::EzDate->new;
copy($ryansiob::datafile,$ryansiob::datafile . "_" . $todate->{"%Y%m%d%H%M%S"}. ".log")||die "Unable to copy datafile to logfile!";

# Write to temporary datafile first
my $tmp_datafile = $ryansiob::datafile . ".tmp";
print $tmp_datafile;
if (eval {open (WRITETEST,">$tmp_datafile") } ){
	open (OUTPUT,">$tmp_datafile");
	foreach (@alldata) {
    	print OUTPUT $_;
	}
	close (OUTPUT);
	# Check temp file size. If > 0 copy over the original
	my $tmp_filesize =  -s $tmp_datafile;
	if ($tmp_filesize > 0){
		copy($tmp_datafile,$ryansiob::datafile)||die "Unable to copy temp datafile over original!";
	}
	else { 
		die "temp data file empty.";
	}
}
else { 
	die "Unable to write to temp datafile";
}

