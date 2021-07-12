#!/usr/bin/perl
# Ryan's In/Out Board search script file
# Part of Ryan's In/Out Board v3.2
#
# Ryan's In/Out Board by Ryan Cartwright
# Licenced unger GPL - see docs.
# see http://ryansiob.sceforge.net for more details
# Ryan's In/Out Board is copyright (c) Ryan P. Cartwright
#
use CGI qw(param);
use strict;

# amend the line below to point to the location of your config file on
# the server filessytem
require "/usr/lib/cgi-bin/ryansiob/ryansiob.config.pl";

# NOTHING BELOW THIS LINE NEEDS ALTERING!

my $searchstring = param("name");
my $found = 0;
my ($line,$email,$name,$status,$date,$comment,$phone,$return,$dept);
my %datalist;
if ($searchstring){
	open("DATA",$ryansiob::datafile);
	while ($line = <DATA>){
		chomp($line);
		($email,$name,$status,$date,$comment,$phone,$return,$dept) = split (/\|/,$line);
		if ($name =~ m/$searchstring/i){
			$datalist{$name} = { mail=>$email, name=>$name, status=>$status,
			lastchanged=>$date, comment=>$comment, phone=>$phone, estimatedreturn=>$return,dept=>$dept};
			++$found;
		}
	}
	&give_results;
}
else {
	&header("Search for a person");
	print << "noentry";
	<P ALIGN=CENTER>Enter the name you wish to search for below and click Search.
	<P ALIGN=CENTER><FORM ACTION=$ryansiob::searchurl METHOD=POST>
	Name: <INPUT TYPE=TEXT NAME=name SIZE=30><INPUT TYPE=SUBMIT VALUE=Search></FORM>
noentry
	&footer;
}
	
sub give_results{	
	if ($found > 0){
		&header("Search Results");
		print "<div align=$ryansiob::page_alignment>
		<p style=\"font-size : $ryansiob::page_fontsize; font-family : $ryansiob::page_fontfamily;\">
		The following results matched your search of <b>$searchstring</b><br>
		<a href='$ryansiob::cgiurl' title='Return to the full listing'>Return to the full listing</a></p>";
		&table_header('search');

		my $backcolour = $ryansiob::tablerow_colour1;
		foreach my $person (sort keys %datalist) {
			&print_line($datalist{$person},$backcolour);
		}
		&table_footer('search');
		print "</table>";
		&footer;
	}
	else{
		&header("Search failed - no matches found");
		print << "notfound";
		<P>Sorry, but I couldn't find any matches to your search for <b>$searchstring</b></p>
		<p><a href='$ryansiob::cgiurl' title='Return to the full listing'>Return to the full listing</a></p>
notfound
		&footer;
	}
}

