#!/usr/bin/perl
# Ryan's In/Out Board main script file
# Part of Ryan's In/Out Board v3.2
#
# Ryan's In/Out Board by Ryan Cartwright
# Licenced unger GPL - see docs.
# see http://ryansiob.sceforge.net for more details
# Ryan's In/Out Board is copyright (c) Ryan P. Cartwright

# amend the line below to point to the location of your config file on
# the server filessytem
require "/usr/lib/cgi-bin/ryansiob/ryansiob.config.pl";


# NOTHING BELOW THIS NEEDS ALTERING
use strict;
use CGI qw(param);
use Date::EzDate;
use File::Copy;



my $namer = param("name");

&Display;

sub Display {
	&header;
	my ($datafile_error,$line,$email,$name,$status,$date,$comment,$phone,$return,$dept);
	print "<div class=\"tableDiv\" align=\"". $ryansiob::page_alignment ."\">";
	if ($ryansiob::version < 3.0){
			print "<div class=\"error\"><h2>Error: Old config file detected</h2>You seem to be using an older version of the config file. A number of things changed in version 3 and your in\/out board will not work properly with an older config file. Please read the supplied documentation and/or comments in the config file and update your config file accordingly<p>More information can be found on the <a href=\"http://www.equitasit.co.uk/ryansiob#upgrading\" style=\"color:yellow\" target=\"_new\">Ryan's In\/Out board website</a></div>";exit;
	}
	if ($ryansiob::datafile) {		

   # CHECK WE CAN READ AND WRITE TO THE DATA FILE
      $datafile_error = 0;
		if (!eval {open (DATATEST,$ryansiob::datafile) } ){
			print "<div class=\"error\"><h2>Warning can't open datafile for READING : $! </h2> The system has returned the above error when trying to open the datafile (the exact path of which I have not revealed here for security) to read from it. I tried to open it as the systems user designated by your webserver software.<br>Usually this is a permissions problem. The datafile AND the directory containing it must readable and writable by the webserver system user.</div>";
			exit;
		}


## NOW CONTINUE WITH USER STATUS LIST
	# Make a copy of the original
	my $bak_datafile = $ryansiob::datafile . ".bak";
	copy ($ryansiob::datafile, $bak_datafile)||die "Unable to make backup copy of datafile";
		open (DATA,$ryansiob::datafile);
		while ($line = <DATA>){
			chomp($line);
			($email,$name,$status,$date,$comment,$phone,$return,$dept) = split (/\|/,$line);
			if (length($dept) == 0){ $dept = 0; }
			push @ryansiob::datalist , { mail=>$email, name=>$name, status=>$status,
			lastchanged=>$date, comment=>$comment, phone=>$phone, estimatedreturn=>$return,dept=>$dept};
		}

		if (length($dept) == 0){ $dept = 0; }

		$ryansiob::rowClass = "stdRow";

		@ryansiob::output_list;
		my $tmp_sort_field = $ryansiob::sort_field;
		if ($tmp_sort_field =~ m/_1/){
			$tmp_sort_field =~ s/_1//;
			@ryansiob::output_list = sort { $b->{$tmp_sort_field} cmp $a->{$tmp_sort_field} } @ryansiob::datalist;
		}
		else {
			@ryansiob::output_list = sort { $a->{$tmp_sort_field} cmp $b->{$tmp_sort_field} } @ryansiob::datalist;
		}
		my $max_rows = @ryansiob::output_list;
		my $changed = 0;
		# CHECK FOR CHANGES REQUIRED
		for (my $i=0; $i < $max_rows; $i++) {
			if ($ryansiob::output_list[$i]{'name'} eq $namer){
				&change($i);
				$changed = 1;
				if ($ryansiob::showuserdept == 1){
					$ryansiob::filter = $ryansiob::output_list[$i]{'dept'} if ($ryansiob::dept_filtering == 1);
				}
			}
		}

		if ($changed == 1) {

			# Write to temporary datafile first
			my $tmp_datafile = $ryansiob::datafile . ".tmp";
			#print "<script type=\"text/javascript\"> alert('$tmp_datafile');</script>";
			if (eval {open (WRITETEST,">$tmp_datafile") } ){
				open (OUTPUT,">$tmp_datafile");
				my @save_list = sort { $a->{'name'} <=> $b->{'name'} } @ryansiob::output_list;
				foreach my $newdata (@save_list) {
					print OUTPUT "$newdata->{'mail'}|$newdata->{'name'}|$newdata->{'status'}|$newdata->{'lastchanged'}|$newdata->{'comment'}|$newdata->{'phone'}|$newdata->{'estimatedreturn'}|$newdata->{'dept'}\n";
				}
				close (OUTPUT);

				# Check temp file size. If > 0 copy over the original
				my $tmp_filesize =  -s $tmp_datafile;
				my $datalog = $ryansiob::datafile . ".log";
				if ($tmp_filesize > 0){
					copy($tmp_datafile,$ryansiob::datafile)||die "Unable to copy temp datafile over original!";
					`echo ----------- >> $datalog`;
				   `date >> $datalog`;
					`cat $tmp_datafile >> $datalog`;
				}
				else { # REPORT BACK IF UNABLE TO WRITE TO TEMP DATAFILE
					print "<div class=\"error\"><h2>Warning empty datafile being produced</h2> Whilst trying to save the new datafile to a temporary location, the newly created file was empty. This indicates something is wrong with the setup of RyansIOB and you should contact your system administrator / IT support to let them know what happened.<br>The original datafile has remained intact.</div>";
					exit;
				}
			}
			else { # REPORT BACK IF UNABLE TO WRITE TO TEMP DATAFILE
				print "<div class=\"error\"><h2>Warning cannot open temporary datafile for WRITING : $! </h2> The system has returned the above error when trying to open a temporayr datafile (the exact path of which I have not revealed here for security) to write to it. I tried to open it as the systems user designated by your webserver software.<br>Usually this is a permissions problem. The datafile AND the directory containing it must readable and writable by the webserver system user.</div>";
				exit;
			}
			# Refresh the page without the username. This is to avoid a user reverting their status by
			# refreshing their browser before the autorefresh kicks in
			# see forum post here: https://sourceforge.net/forum/message.php?msg_id=4034423 for more
			# details
   		my $jsrefresh =  "\<\!\-\-\n window.location = \"" . $ryansiob::cgiurl;
			my $URLoperator = "?";
   		if ($ryansiob::use_depts == 1 && $ryansiob::dept_filtering == 1){
      		if ($ryansiob::filter > 0){
         		$jsrefresh .= $URLoperator . "filter=" . $ryansiob::filter;
					$URLoperator = "&";
      		}
   		}
			if ($ryansiob::sort_field){
				$jsrefresh .= $URLoperator ."sort=".$ryansiob::sort_field;
			}
			$jsrefresh .= "\"\;\n\-\-\>";
			print "<script type=\"text/javascript\" language=\"JavaScript\">";
			print  $jsrefresh;
   		print "</script>";
			print "<noscript></noscript>";
		}
		else {
## ASSUMING NO DATAFILE ERRORS - IF WE GET THIS FAR - WE CONTINUE
   &table_header;
		for (my $i=0; $i < $max_rows; $i++) {
			if ($ryansiob::use_depts == 1 && $ryansiob::dept_filtering == 1){
				if ($ryansiob::filter == 0 || $ryansiob::output_list[$i]{'dept'} ==  $ryansiob::filter ){
					&print_line($ryansiob::output_list[$i]);
				}
			}
			else {
					&print_line($ryansiob::output_list[$i]);
			}
		}
		&table_footer($namer);
		}
	}
	else {
		print "Datafile not specified! Please amend config file.";
	}
	&footer;
}

sub change {
	my ($person_in) = @_;
	my $pcom = param("comment");
	my $pcoms = param("comments");
	$ryansiob::output_list[$person_in]{'comment'} = "$pcom - $pcoms";
	if (param("status")){
		my $statusIn = param{"status"};
		if ($ryansiob::statuses =~ m/$statusIn/i){
			$ryansiob::output_list[$person_in]{'status'} = param("status");
		} else {
			$ryansiob::output_list[$person_in]{'comment'} = param("status");
		}
	} else {
		if ($ryansiob::instatuses =~ m/$ryansiob::output_list[$person_in]{'status'}/) {
			$ryansiob::output_list[$person_in]{'status'} = "OUT";
		}
		else {
			$ryansiob::output_list[$person_in]{'status'} = "IN";
		}
	}

	my $newdate = Date::EzDate->new();
	my $hour = $newdate->{'%H'};
	my $minute = $newdate->{'minute'};
	if ($ryansiob::clientzone != 0) {
		$hour += $ryansiob::clientzone;
		if ($hour < 0) {
			--$newdate;
			$hour += 24;
		} elsif ($hour > 23) {
			++$newdate;
			$hour -= 24;
		}
	}
	my $p = 'a';
	if ($ryansiob::dateformat == 1 && $hour > 12){
		$hour -= 12;
		$p  = 'p';
	}
	$ryansiob::output_list[$person_in]{'lastchanged'} = $newdate->{"%d %h / "} .  (sprintf "%02u",$hour) .":" . $newdate->{'%M'};
	if ($ryansiob::dateformat == 1){
		$ryansiob::output_list[$person_in]{'lastchanged'} .= " " . $p . "m";
	}
	chomp($ryansiob::output_list[$person_in]{'lastchanged'});
	$ryansiob::output_list[$person_in]{'estimatedreturn'} = param("return");
}

