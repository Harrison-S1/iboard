#!/usr/bin/perl -w
# Ryan's In/Out Board config file
# Part of Ryan's In/Out Board v3.2
#
# Ryan's In/Out Board by Ryan Cartwright
# Licenced unger GPL - see docs.
# see http://ryansiob.sceforge.net for more details
# Ryan's In/Out Board is copyright (c) Ryan P. Cartwright

use strict;

# amend the entry below to point to the location of your datafile
# on the server filesystem
$ryansiob::datafile = "/usr/local/ryansiob/datafile";

# amend the entry below to point to the web url of the ryansiob.pl script
$ryansiob::cgiurl = "http://localhost/cgi-bin/ryansiob/ryansiob.pl";

# amend the entry below to point to the web url of the search script
my $searchurl = "/cgi-bin/ryansiob/ryansiob.search.pl";

# amend this to reflect the uri of your images directory - trailing /
# not required - leave empty if the envelope image file will be in the root
# of your website (i.e. "http://www.yourdomain.com/envelope.gif")
my $images = "";

# comment this out if you don't want the generated page to auto-refresh 
my $autorefresh=1;

# amend this line for the amount of time between refreshes (in seconds)
my $autoreftime=30;

# Estimated return field
#   0 = omit the field entirely, 1 = free text field, 2 = drop down
#     (if using drop down, see Return drop down values as well)
# Default = 1
my $return_field = 2;

# Return drop down values: if using a drop down for Estimated return values
#   set the options here. This will be ignored is $return_field = 1 above.
# Default: ("08:00","08:30","09:00","09:30","10:00","10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00");
my @return_values = ("08:00","08:30","09:00","09:30","10:00","10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00");

# amend the line below to indicate if you want a header shown or not.
# 1 = show header, 0 = hide header. 
my $showheader = 1;

# amend the line below to point to the location of your header file on the
# server filesystem.
# If you set it to 0 , Ryansiob will insert a simple default header
# Note: no header is shown if showheader (above) equals 0.
# Default : 0;
my $header_file = 0;

# amend the line below to point to the location of your footer file
# on the server filesystem
# if you set it to 0 , Ryansiob will insert a simple default footer
# Default : 0
my $footer_file = 0;

# By default the bottom of the page contains a form which enables users to
# enter custom comments and/or return times. If you set this to 1 the form
# will be shown at the top of the page rather than the bottom.
# Default : 0
my $custom_form_at_top = 0;

# add your company or organisation name below - this is used in default headers
my $company = "Chocolate Teapot Company";

# Set this to 0 if you do NOT want e-mail links in your in/out board
#	default = 1
my $maillinks = 1;

# Your Email domain name only - this is used for the mail links
# see also maillinks above. This domain will be added to any email
# address in the datafile that does not conatin a '@'.
my $maildomain = "yourdomain.com";

# Date format: 1 = 12hr, 0=24 hr
$ryansiob::dateformat=1;

# Clientzone - set this to the time difference between your server and clients
#   i.e. If your server is three hours behind your clients, set this to 3
#        if it is 3 hs ahead, set this to -3
#   default is 0
$ryansiob::clientzone = 0;

# Statuses - Prior to v3, people could only be In or Out. From v3 you can have a range
#	of values reflecting whether somebody is away from the office or not and where they are.
# 	These are split into two arrays (lists) here. Edit each list accordingly
#	These option replaces the @reasons (default comments) option
#	Note that the two lists should contain unique values

# Instatuses - these statuses will change the person colour to $incol
#	example = ("Building 1", "Building 2" "Internal mtg", "In");
#	No quotes within the values e.g. "Ryan's office" is not permitted
#	Default = ("IN","Int mtg","At desk","Away from desk");
my @instatuses = ("IN","Int mtg","At desk","Away from desk");

# Outstatuses - these statuses will change the person colour to $incol
#	example = ("Lunch", "Visiting client, "External mtg", "Out");
#	No quotes within the values e.g. "Ryan's office" is not permitted
#	Default = ("OUT","On leave","Lunch","Sick","TOIL","Work from home");
my @outstatuses = ("OUT","On leave","Lunch","Sick","TOIL","Work from home");

# Statusorder - The two lists above are shown in a single drop down. Use this
#	setting to define the order in which they are sorted.
#	values: 0 = alphabetical, 1 = Instatuses then Outstatuses, 2 = Outstatuses then Instatuses
#	Default = 0;
my $statusorder = 0;


##############################
# HTML configuration         #
##############################
#
# These settings will change the appearance of the produced html page.
# Some (as indicated) will not have any effect if you use your own header file
# see above on how to use your own header file.
#
# Status colours - amend your preferred in and out colours - hex only
my $incol = "#00cc00";
my $outcol = "#cc0000";

# Page details - these will not make any difference if you use your own header file.
$ryansiob::page_alignment = "center"; # Default content alignment
my $page_background="#ddd"; # background colour
my $page_fontsize="0.8em"; # Default page font size
my $title_fontsize = "1.8em"; # for title of standard header
                         # ensure you include em, px or % accordingly.
my $title_fontfamily = "sans-serif";
my $title_fontweight = "bolder";
my $title_colour = "#14428b";



# Table details
my $table_background = "#ffffff"; # generic background of table;
my $tableborder_colour="#779"; # colour of external border only 
my $tableborder_width="1"; # in pixels - 0 for no border 
my $tableborder_style="solid"; # solid, ridge, groove etc.
my $table_width = "98%"; # width of table within the page
my $table_fontsize = "1em"; # for text not in the header or rows
                           # ensure you include em, px or % accordingly.
my $tabletext_align = "center"; # default alignment for table content
my $tablenotes_align = "left"; # default alignment for notes at the bottom of the table

# Table header details
my $tableheader_background = "#c4cddb"; # background colour
my $tableheader_textcolour = "#14428b"; # text colour
my $tableheader_borderwidth = "1"; # border width set in pixels 0 for no border
my $tableheader_bordercolour = "#779"; # border colour
my $tableheader_fontsize = "1em"; # ensure you include em, px or % accordingly.
my $tableheader_fontfamily = "sans-serif"; # leave blank to use browser default typeface

# Table rows details.
# You can set alternating background colours for the table rows - makes it easier
# to see the status of people for longer lists.
$ryansiob::tablerow_colour1="#e4edfe";
$ryansiob::tablerow_colour2="#ffffff";
my $tablerow_border_width = "1"; # set in pixels - 0 for no border
my $tablerow_border_colour = "#aaaaaa"; # border colour
my $tablerow_colour = "#555"; # Font colour to be used when not displaying a statusrow
my $tablerow_fontsize = "1em"; # ensure you include em, px or % accordingly.
my $tablerow_fontfamily = "Arial, Helvetica, 'sans-serif'";
	# None alpha characters must be single-quoted as with 'sans-serif' above.

# Preferred layout - swap the columns around to your preference
# ensure you keep the names used here the same and each
# column is separated by a comma - the whole thing must be enclosed in parenthesis.
# default layout is ("phone","mail","name","dept","status","comment","estimatedreturn","lastchanged");
# NOTE: if you want to use departments include the field as "dept" here
# regardless of the setting of dept_title below.
@ryansiob::layout = ("phone","mail","name","dept","status","comment","estimatedreturn","lastchanged");

# Default sort column/field - by default the board will be sorted alpha-numerically
# by this column.
# default : name
my $default_sort = "name";

# status change column - APART from the status drop down, which column do you want users to
#	be able to click on to change their status.
#	For two or more columns separate them with commas (name,status);
# Default = ("name","comment");
my @status_change = ("name","comment");

# Which columns do you want to be shown in the status colour
# (i.e not the normal text colour ). Comma separated.
# Default = "name,status,comment";
my $status_columns = "name,status,comment";

# Show Departments
# Allow users to be split into departments. Set this to 0 if all your
# users are in the same team/group/dept
# Default = 1
$ryansiob::use_depts = 1;

# Allow dept filtering
# If you want to allow users to show only a selected dept set this to 1
# Default : 1;
$ryansiob::dept_filtering = 1;

# The two options below only have effect if dept_filtering = 1
#
# Department names - Comma separated.
# First entry must always be "Every" the rest correspond to your dept numbers
# in the datafile - so 0 = Every, 1 = IT, 2 = Finance etc.
my @dept_names = ("Every","IT","Finance","HR","dept4","dept5","dept6","dept7","d8","d9","d10","d11","d12");

# Department title
# What do you want to call a "department"? Group, team etc?
# Keep as lower case.
# Default: Department
my $dept_title = "department";

# AvoidJavascript - by default javascript is used to change the status when the drop down value
#	is changed. If you'd rather not use javascript on your site, set this to 1.
#	Note that not using javascript will give you an extra button with which to submit the change
#	Thus making two clicks to change your status
#  IMPORTANT: If you have javascript disabled on your client browsers you shoykd set this to 1
#             Otherwise the status drop down will have no way to submit
#	Default = 0;
my $avoidjavascript = 0;

# ShowUserDept - if you set this to 1 then any call to the script which
#	includes a users' name will show that users' department only.
#	Possibly only useful if you have a lot of departments or large departments.
#	Default = 0;
$ryansiob::showuserdept = 0;

# That's the end of the configurable stuff
# The rest of this file is used for common procedures etc.
# So don't edit it unless you know what you're doing.
#

#####################################
# NOTHING BELOW HERE NEEDS ALTERING #
#####################################

$ryansiob::sort_field = param("sort")||$default_sort;
$ryansiob::filter = param("filter") if ($ryansiob::dept_filtering == 1);

my @allstatuses;
if ($statusorder == 2){
	@allstatuses = (@outstatuses,@instatuses);
} else {
	@allstatuses = (@instatuses,@outstatuses);
} 
if ($statusorder == 0){
	@allstatuses = sort { $a cmp $b } @allstatuses;
}
$ryansiob::statuses = join(',',@allstatuses);
$ryansiob::instatuses = join(',',@instatuses);

my $colspan;
if ($ryansiob::use_depts == 1){
	$colspan = 8;
} else{
	$colspan = 7;
}

my ($refreshcode);
@ryansiob::datalist;

$ryansiob::version = 3.2;


if ($autorefresh) {
  $refreshcode = "<meta http-equiv='Refresh' content='$autoreftime;url=$ryansiob::cgiurl";
  if (param('sort')){
	  $refreshcode .= "?sort=" . $ryansiob::sort_field;
  }
  if ($ryansiob::filter > 0){
		if ($refreshcode =~ m/\?/){
			$refreshcode .= "&amp;";
		}
		else {
			$refreshcode .= "?";
		}
		$refreshcode .= "filter=" . $ryansiob::filter;
	}
  $refreshcode .= "'>";
}
else {  $refreshcode=""; } 

sub print_line{
	my ($person) = @_;
   my %person  = %{ $person };
	my $query_string =  $ENV{'QUERY_STRING'};
	$query_string =~ s/name=[a-z]+\b//i;
	if ($ryansiob::filter > 0 ){
		if (!($query_string =~ m/filter/)){
			if ($query_string =~ m/\&/){
				$query_string .= "&amp;";
			}
			$query_string .= "filter=" . $ryansiob::filter;
		}
	}
	my $statcolour;
   if ($ryansiob::rowClass eq "altRow"){
		$ryansiob::rowClass = "stdRow";
	} else {
		$ryansiob::rowClass = "altRow";
	}
	if (grep /$person{status}/, $ryansiob::instatuses ) {
			$statcolour = $incol;
	}
	else {
			$statcolour = $outcol;
	}
	print "\n<tr class=\"" . $ryansiob::rowClass ."\">";
	foreach my $layout_item(@ryansiob::layout){
		if ( $ryansiob::use_depts == 0 && $layout_item =~ m/dept/i){}
		elsif ( $return_field == 0 && $layout_item =~ "return") {}
		else {
			print "<td style='";
			if ($status_columns =~ m/$layout_item/i){
				print "color : $statcolour; width: 10%";
			}
			if ($layout_item =~ m/comment/i){
				print "min-width: 20%;";
			}
			if ($layout_item =~ m/status/i){
				print "'><form action='" . $ryansiob::cgiurl ."' id='statusForm_" . $person{name} ."'><input type='hidden' name='name' value='" . $person{name} ."'><select name='status' autocomplete=\"off\"";
				if (grep /$person{status}/, @outstatuses) {
					print "style='color:" . $outcol .";";
				} else {
					print "style='color:" . $incol .";";
				} 
				print " background-color: white' ";
				if ($avoidjavascript == 0){
					print " title='Select a status to change to it";
					if ($autorefresh){
						print " instantly";
					}
					print "' onChange='this.form.submit();'";
				}
				print ">";
				my $count = 0;
				foreach my $statusitem(@allstatuses) {
					print "<option value='" . $statusitem ."' id='option_". $count ."_" . $person{name} . "'";
					if ($statusitem eq $person{status}){
						print " SELECTED";
					}
					if (grep /$statusitem/, @outstatuses) {
						print " style='color:" . $outcol .";'";
					} else {
						print " style='color:" . $incol .";'";
					} 
					print ">" . $statusitem . "</option>";
					++$count;
				}
				print "</select>";
				if ($avoidjavascript == 1){
					print "<input type='submit' value='Go'>";
				}
				print "</form>";
			}
			elsif (grep /$layout_item/i, @status_change){
				print "'><a style=\"font-weight : bold;";
				if ($status_columns =~ m/$layout_item/i){
					print "color : $statcolour;";
				}
				if ($layout_item =~ m/lastchanged/i){
					print " text-align : right;";
				}
				print "font-weight: bold;\" href='". $ryansiob::cgiurl ."?name=" . $person{'name'};
				if (length($query_string) > 0){
					print "&amp;" . $query_string;
				}
				print	"' title='Click to quickly change your status'>";
				print $person{$layout_item} ."</a>";
			}
			elsif ($layout_item =~ m/lastchanged/i){
				print "text-align : right;'>";
				print $person{$layout_item};
			}
			elsif ($layout_item =~ m/dept/i){
					print "padding-left: 3px; font-style:italic;'>";
					print $dept_names[$person{$layout_item}];
			}
			elsif ($layout_item eq "mail" && $maillinks == 1 ){
				print "font-size : inherit;'><a style=\"font-size : inherit;";
				if ($status_columns =~ m/$layout_item/i){
					print "color : $statcolour;";
				}
				print "\" href='mailto:" . $person{'mail'};
				if ($person{'mail'} =~ m/\@/){}
				else {
					print "@". $maildomain;
				}
				print "'><img src='". $images . "/envelope.gif' alt='email' longdesc='email'
				border=0></a>";
			}
			else { 
				print "'>$person{$layout_item}";
			}
			print "</td>\n";
		}
  	}
	print "</tr>\n";
}

sub header {
  my ($subheader) = @_;
	# always print http headers
	print "Content-type: text/html\nPragma: no-cache\n\n";
	print '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';

# Generate the styles for this page
my $pageStyles = "<style type=\"text/css\">
		body {
			background-color: ". $page_background . ";
			margin-top: 0px;
			font-size: ". $page_fontsize .";
		}
		select {
			border: 1px solid silver;
			min-width: 80px;
		}
		input {
			border: 1px solid silver;
			color: #555;
		}
		#titleDiv {
			text-align: " . $ryansiob::page_alignment .";
			color: ". $title_colour .";
		}
		#titleDiv form {
			font-family: ". $title_fontfamily .";
		}
		#titleDiv p {
			max-width: 650px;
			margin: 15px auto;
			font-family: ". $title_fontfamily .";
		}
		#titleDiv p.titleP {
			max-width: 80%;
			font-size: ". $title_fontsize .";
			font-family: ". $title_fontfamily .";
			font-weight: ". $title_fontweight .";
		}
		#tableContainer {
			text-align: ". $ryansiob::page_alignment .";
		}
		table {
			color: ". $tablerow_colour .";
		}
		#mainTable {
			background : ". $table_background .";
			border: ". $tableborder_colour ." ". $tableborder_style ." ". $tableborder_width ."px;
			border-collapse : collapse;
			margin: 2px 0px;
			width: ". $table_width .";
			text-align: ". $tabletext_align .";
		}
		#mainTable tr {
			color: " . $tablerow_colour .";
			border-bottom : ". $tablerow_border_width ."px solid ". $tablerow_border_colour .";
			font-size: ". $tablerow_fontsize .";
			font-family: ". $tablerow_fontfamily .";
			text-align: left;
		}
		#mainTable tr.stdRow {
			background : ". $ryansiob::tablerow_colour1 .";
		}
		#mainTable tr.altRow {
			background : ". $ryansiob::tablerow_colour2 .";
		}
		#mainTable tr.tableHeader {
			background: ". $tableheader_background .";
			font-family: ". $tableheader_fontfamily .";
			color: ". $tableheader_textcolour .";
			border-bottom: ". $tableheader_borderwidth ."px solid ". $tableheader_bordercolour .";
			font-size: ". $tableheader_fontsize .";
		}
		#mainTable tr.tableHeader th a {
			color: ". $tableheader_textcolour .";
		}
		td, th {
			padding: 1px 2px;
		}
		label {
			font-weight: ". $title_fontweight .";
		}
		#mainTable tr.tableFooterNotes {
			background-color: ". $table_background .";
			text-align: ". $tablenotes_align .";
			font-size: ". $table_fontsize .";
		}
		form.deptForm {
			font-family: ". $tablerow_fontfamily .";
		}
		form.deptForm select, form.deptForm input {
			background-color: " . $ryansiob::tablerow_colour2 .";
		}
		form.deptForm input[type=submit] {
			background-color: ". $ryansiob::tablerow_colour1 .";
		}
		.in {
			color: ". $incol .";
		}
		.out {
			color: ". $outcol .";
		}
		.tableFont {
			font-size: ". $table_fontsize .";
		}
		div.error {
			color:white; background-color: darkred; border: solid 2px red; max-width:500px; padding: 10px;
		}
		</style>";

  if ($showheader > 0) { 
	if ($header_file ne 0) {
		open (HEADER,$header_file||die "could not open $header_file");
		my @header = <HEADER>;
		close (HEADER);
		my ($line,$insertdone);
		foreach $line(@header) {
			if ($line =~ m/<\/head>/i){
				print "<!-- This page has been generated by Ryan's In/Out Board in/out board v" . $ryansiob::version ." -->";
				print "<!-- by Ryan Cartwright - http://www.equitasit.co.uk/ryansiob -->";
				print "<!-- Ryan's In/Out Board is licenced under the GPL - see docs for details -->";
				print "<!-- Ryan's In/Out Board is copyright (c) Ryan P. Cartwright -->";
				print $pageStyles;
				print $refreshcode;
				print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >";
				print "<meta http-equiv='Pragma' content='no-cache'>";
				print "<meta http-equiv='Expires' content='-1'>";

				$insertdone = 1;
			}
			print $line;
		}
		if ($insertdone  == 0){ 
				print "<!-- This page has been generated by Ryan's In/Out Board in/out board v" . $ryansiob::version ." -->";
				print "<!-- by Ryan Cartwright - http://www.equitasit.co.uk/ryansiob -->";
				print "<!-- Ryan's In/Out Board is licenced under the GPL - see docs for details -->";
				print "<!-- Ryan's In/Out Board is copyright (c) Ryan P. Cartwright -->";
				print "<meta http-equiv='Pragma' content='no-cache'>";
				print "<meta http-equiv='Expires' content='-1'>";
				print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >";
				print $pageStyles;
				print $refreshcode;
		}
		print "<div id=\"titleDiv\">";
	}	
	else {
		print "<html><head><title>$company - In / Out Board ";
		print << "Header_end";
	</title>
	<!-- This page has been generated by Ryan's In/Out Board in/out board v$ryansiob::version -->
	<!-- by Ryan Cartwright - http://www.equitasit.co.uk/ryansiob -->
	<!-- Ryan's In/Out Board is licenced under the GPL - see docs for details -->
	<!-- Ryan's In/Out Board is copyright (c) Ryan P. Cartwright -->
	<meta http-equiv='Pragma' content='no-cache'>
	<meta http-equiv='Expires' content='-1'>
	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >
	$refreshcode
	$pageStyles
	</head>
	<body>
	<div id="titleDiv">
	<p class="titleP">$company In/Out Board<br>$subheader</p>
	<p>
	Below you can see the <span class="in"><b>in</b></span>/<span class="out"><b>out</b></span> status of individuals.<br>You can quickly change the status of a person by clicking their 
Header_end
	my $countChanges = $#status_change;
	my $rowCount = 0;
	foreach my $changeColumn(@status_change){
		if (!$countChanges--) {
			print " or " . $changeColumn;
		} elsif ($rowCount > 0){
			print ", " . $changeColumn;
		}  else {
			print $changeColumn;
		}
		$rowCount++;
	}
	print ". You can also select a specific status from the drop down list. If you want you can add a comment using the form below the list. Finally, you can sort the list by clicking one of the headings (except mail).</p>";
	}
print << "extra-end";
	<p>You may search for a particular person's status by entering their name (or part of it) here and clicking <em>Search</em>
	<form class="deptForm" method=post action=\"/cgi-bin/ryansiob/ryansiob.search.pl\">
	<label for="name">Name :</label> <input type=text name=name maxlength=100> <input type=submit value=Search></form>
	</div>
extra-end
  }
  else {
	print "<html><head><title>$company - In / Out Board ";
	print << "Header_end2";
	</title>
	<!-- This page has been generated by Ryan's In/Out Board -->
	<!-- by Ryan Cartwright - http://www.equitasit.co.uk/ryansiob -->
	<!-- Ryan's In/Out Board is licenced under the GPL - see docs for details -->
	<!-- Ryan's In/Out Board is copyright (c) Ryan P. Cartwright -->
	<meta http-equiv='Pragma' content='no-cache'>
	<meta http-equiv='Expires' content='-1'>
	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >
	$pageStyles
	$refreshcode
	</head>
	<body>
Header_end2
	}
}

sub footer {
	if ($footer_file ne 0) {
		open (FOOTER,$footer_file);
		my @footer = <FOOTER>;
		close (FOOTER);
		foreach my $line(@footer) {
			print $line . "####";
		}
	}
	print "</div></body></html>";
}

sub table_header {
	my ($namer) = @_;
	print "<table id=\"mainTable\" summary=\"Table of staff names with their in-out status\">";
	if ($custom_form_at_top == 1 || $ryansiob::use_depts == 1){
		print "<tr class=\"tableHeaderNotes\"><td colspan=$colspan>";
	}
	if ($namer ne "search"){
		if ($custom_form_at_top == 1){
			print "Use a custom comment by using the form below";
			print "<form class=\"deptForm\" \"action=\"$ryansiob::cgiurl\" method=\"POST\">\n<input type=\"hidden\" name=\"sort\"
 			value=$ryansiob::sort_field>
			<table summary=\"Table used for customised comments form\">
			<tr>
			<th>Name</th><th>Status</th><th title=\"Default coments are now in the status field\">Comment</th>";
			if ($return_field != 0){
				print "<th>Estimated return</th>";
			}
			print "</tr><tr style=\"font-size: $table_fontsize; text-align : left;\">
			<td><select name=name>";
			my @print_list;
			my $tmp_sort_field = $ryansiob::sort_field;
			if ($ryansiob::sort_field =~ m/_1/){
				$tmp_sort_field =~ s/_1//;
				@print_list = sort {$b->{$tmp_sort_field} <=> $a->{$tmp_sort_field} } @ryansiob::datalist;
			}
			else {
				@print_list = sort {$a->{$tmp_sort_field} <=> $b->{$tmp_sort_field} } @ryansiob::datalist;
			}
			foreach my $listitem (@print_list){
				print "<option value='". $listitem->{'name'} ."'";
				if ($namer && $namer eq $listitem->{'name'}){
					print " selected=selected"
				}
				print ">$listitem->{'name'}</option>";
			}
			print "</select></td><td><select name=status>";
			foreach my $statusitem(@allstatuses) {
				print "<option value='" . $statusitem ."'";
				if (grep /$statusitem/, @outstatuses) {
					print " style='color:" . $outcol .";'";
				} else {
					print " style='color:" . $incol .";'";
				} 
				print ">" . $statusitem . "</option>";
			}
			print "</select> </td> <td><input title=\"Default comments are now in the statuses to the left\" type=text name=comments size=25 maxlength=50></td>";
			if ($return_field == 1) {
				print "<td><input type=text name=return size=15 maxlength=15></td>";
			} elsif ($return_field == 2){
				print "<td><select name=return>";
				foreach my $ret_value(@return_values){
					print "<option value=\"". $ret_value ."\">". $ret_value . "</option>";
				}
				print "</select></td>";
			}
			print "<td><input type=submit value=Update></td> </tr> </table></form>";
		}
	}
	if ($ryansiob::use_depts == 1 && $ryansiob::dept_filtering == 1){
		print "<div>";
		print "<form class=\"deptForm\" name=\"filterForm\" action=\"$ryansiob::cgiurl\" method=\"POST\">\n";
		if (param('sort')){
			print "<input type=hidden name=sort value=" . param('sort') . ">";
		}
		print "<div class=\"tableFont\">";
		print "Show ";
		if ($avoidjavascript == 0){
			print  "<select name=filter OnChange=\"this.form.submit();\">";
		} else {
			print  "<select name=filter>";
		}
		my $dept_count = scalar(@dept_names);
		my $j;
		for ($j=0; $j < $dept_count; $j++){
			print "<option value=$j ";
			if ($ryansiob::filter == $j){
				print "selected=selected";
			}
			print ">$dept_names[$j]</option>";
		}
		print "</select> ". $dept_title ;
		print " <input type=\"submit\" value=\"Go\"></div></form>";
		print "</div>";
	}
	if ($ryansiob::use_depts == 1 && $ryansiob::dept_filtering == 1 && $ryansiob::filter && $ryansiob::filter > 0){
		print "<span style=\"font-style: italic\"> ( Currently showing : ". $dept_names[$ryansiob::filter] ." )</span>";
	}
	if ($custom_form_at_top == 1 || $ryansiob::use_depts == 1){
		print "</td></tr>";
	}

	print "<tr class=\"tableHeader\">";
	my ($layout_item,$layout_item_print);
	
	foreach $layout_item(@ryansiob::layout){
		$layout_item_print = $layout_item;
		if ($layout_item =~ m/return/i && $return_field == 0 ){}
		elsif ($layout_item =~ m/dept/i && $ryansiob::use_depts == 0){}
		else {
			print "<th style=\"text-align :";
			if($layout_item =~ m/return/i){
				print " left ";
				$layout_item_print = "estimated Return";
			}
			elsif ($layout_item =~ m/lastchanged/i){
				print " right ";
				$layout_item_print =~ s/changed/ Changed/i;
			}
			elsif ($layout_item =~ m/dept/i){
				print " left ";
				$layout_item_print =~ s/dept/$dept_title/i;
			}
			else { print " left ";}
			print "\">";
			print "<a href=\"". $ryansiob::cgiurl ."?sort=" . $layout_item;
			if ($ryansiob::sort_field =~ m/$layout_item/i){
				if (!($ryansiob::sort_field =~ m/_1/i)){
					print "_1";
				}
			}
			if ($ryansiob::filter > 0){
				print "&amp;filter=" . $ryansiob::filter;
			}
			print "\" title=\"";
			if ($ryansiob::sort_field =~ m/$layout_item/i){
				if (!($ryansiob::sort_field =~ m/_1/i)){
					print "reverse ";
				}
			}
			print "sort by this field\"";
			print ">" . ucfirst($layout_item_print);
			print "</a>";
			if ($ryansiob::sort_field =~ m/$layout_item/i){
				print " *";
			}
			else {
				print " &nbsp;";
			}
			print "</th>";
		}
	}
	print "</tr>";
}

sub table_footer {
	my ($namer) = @_;
	print "<tr class=\"tableFooterNotes\"><td colspan=$colspan>";
	if ($ryansiob::use_depts == 1 && $ryansiob::dept_filtering == 1){
		print "<form class=\"deptForm\" action=\"$ryansiob::cgiurl\" method=\"POST\">\n";
		print "Show  ";
		print  "<select name=filter onChange=\"this.form.submit();\">";
		my $dept_count = scalar(@dept_names);
		my $j;
		for ($j=0; $j < $dept_count; $j++){
			print "<option value=$j ";
			if ($ryansiob::filter == $j){
				print "selected=selected";
			}
			print ">$dept_names[$j]</option>";
		}
		print "</select> ". $dept_title ;
		print "<input type=\"submit\" value=\"Go\"></form>";
		print "* sort field  ";

	}
	print "<p>Click a $status_columns to change a person's status. ";
	if ($autorefresh)  {
		print "This page will refresh every $autoreftime seconds. ";
	}
	else {
		print "This page will not automatically refresh. ";
	} 
	$status_columns =~ s/\,/ or /g;
	print "Click <a href=\"$ryansiob::cgiurl";
   if (param('sort')){
		print "?sort=" . $ryansiob::sort_field;
	}
   if ($ryansiob::filter > 0){
		if (!param('sort')){
			print "?";
		}
		else {
			print "&amp;";
		}
		print  "filter=" . $ryansiob::filter;
	}
	print "\">here</a> to refresh it now.<div><p>";
	if ($namer ne "search"){
		if ($custom_form_at_top == 0){
			print "<dd><br>Use a custom comment by using the form below";
			print "<form class=\"deptForm\" \"action=\"$ryansiob::cgiurl\" method=\"POST\">\n<input type=\"hidden\" name=\"sort\"
	 		value=$ryansiob::sort_field>
			<table summary=\"Table used for customised comments form\">
			<tr>
			<th>Name</th><th>Status</th><th title=\"Default coments are now in the status field\">Comment</th>";
			if ($return_field > 0){
				print "<th>Estimated return</th>";
			} 
			print "</tr><tr style=\"font-size: $table_fontsize; text-align : left;\"> <td><select name=name>";
			my @print_list;
			my $tmp_sort_field = $ryansiob::sort_field;
			if ($ryansiob::sort_field =~ m/_1/){
				$tmp_sort_field =~ s/_1//;
				@print_list = sort {$b->{$tmp_sort_field} <=> $a->{$tmp_sort_field} } @ryansiob::datalist;
			}
			else {
				@print_list = sort {$a->{$tmp_sort_field} <=> $b->{$tmp_sort_field} } @ryansiob::datalist;
			}
			foreach my $listitem (@print_list){
				print "<option value='". $listitem->{'name'} ."'";
				if ($namer && $namer eq $listitem->{'name'}){
					print " selected=selected"
				}
				print ">$listitem->{'name'}</option>";
			}
			print "</select></td><td><select name=status>";
			foreach my $statusitem(@allstatuses) {
				print "<option value='" . $statusitem ."'";
				if (grep /$statusitem/, @outstatuses) {
					print " style='color:" . $outcol .";'";
				} else {
					print " style='color:" . $incol .";'";
				} 
				print ">" . $statusitem . "</option>";
			}
			print "</select> </td> <td><input title=\"Default comments are now in the statuses to the left\" type=text name=comments size=25 maxlength=50></td>";
			if ($return_field == 1) {
				print "<td><input type=text name=return size=15 maxlength=15></td>";
			} elsif ($return_field == 2){
				print "<td><select name=return>";
				foreach my $ret_value(@return_values){
					print "<option value=\"". $ret_value ."\">". $ret_value . "</option>";
				}
				print "</select></td>";
			}
			print "<td><input type=submit value=Update></td> </tr> </table></form></dd>";

			print "</dl></div></td></tr>";

			print "</table>";
		}
	}

# The next few lines print the "powered by Ryansiob comment
# You are not obliged to keep this in but it would be nice to point back to where you got RyansIOB.
# Credit where it's due and all that :)
	print "<div style=\" color: #666; text-align:center; font-size: 0.7em\">
	{ Powered by <a style=\"color: #444;\" href=\"http://www.equitasit.co.uk/ryansiob\"
	target=top>Ryan's In/Out Board v" . sprintf("%.1f",$ryansiob::version)."</a> } <br> ";
	print "</div>";

}
# always return 1
return 1;
# end of file
