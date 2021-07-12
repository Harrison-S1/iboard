# iboard
Ryan's In/Out Board is an intranet based in-out board for small-medium sized organisations. Features: one/no click status change; no database required; default & custom comments; return times; contact info; can auto check everyone out overnight.<br>
<br>
**Features**
- Simple to use and deploy
- Single click status change
- No complex backend database
- Fully customisable interface
- Staff can be grouped into teams/departments
- Multiple statuses (meeting, in, lunch, leave etc.)
<br>

[Do it in docker](https://github.com/Harrison-S1/iboard/tree/main/Docker)
<br>

Tested on CentOS 6 & 7 and Ubuntu 16:04,18:04,20:04. Example below is for Ubuntu.<br>
<br>
Download the iboard repo.<br>
`git clone https://github.com/Harrison-S1/iboard.git`
 
Install apache2.<br>
`sudo apt install apache2`

Install make.<br>
`sudo apt install make`

Move into the iboard dir and install the required perl mods.<br>
`cd CGI-4.51/; perl Makefile.PL; make; make install` <br>
`cd Date-EzDate-1.16/; perl Makefile.PL; make; make install`<br>

Enable CGI on apache.<br>
`cd /etc/apache2/mods-enabled`<br>
`sudo ln -s ../mods-available/cgi.load`<br>
or <br>
`sudo a2enmod cgi`<br>

Copy the following files to /usr/lib/cgi-bin/exampleboard .
 ```
-rwxr-xr-x 3 root www-data   914 Oct 29 15:38 envelope.gif*
-rwxr-xr-x 1 root root     30900 Oct 29 16:26 ryansiob.config.pl*
-rwxr-xr-x 1 root root      8223 Oct 29 15:38 ryansiob.pl*
-rwxr-xr-x 1 root root      2274 Oct 29 15:38 ryansiob.search.pl*
```

Change the group of envelope.gif.<br>
`chown root:www-data envelope.gif`<br>

Make .pl exacutable.<br>
`chmod +x /usr/lib/cgi-bin/exampleboard/*`<br>

Copy the following files to /usr/local/exampleboard.<br>
 ```
-rwxrwx---  1 root     www-data 2229 Oct 29 09:26 allout.pl*
-rwxrwx---  1 root     www-data 1100 Oct 29 16:14 datafile*
-rwxrwx---  1 www-data www-data 1100 Oct 29 17:40 datafile.bak*
```

Change the group of the perant folder - apache needs to be able to read and write here so change there permissions as well.<br>
`chown -R root:www-data /usr/local/exampleboard/`<br>
`chmod -R 770 /usr/local/exampleboard/`<br>

Create a link for the envelope.gif in the root of the /var/www/html.<br>
 `ln /usr/lib/cgi-bin/exampleboard/envelope.gif /var/www/html/`<br>

Check permission have followed.<br>
 ```
 -rwxr-xr-x 3 root www-data   914 Oct 29 15:38 envelope.gif*
 -rw-r--r-- 1 root root     10918 Oct 29 17:28 index.html.og
```

The site refreshes every 30 seconds, but does this based on the URL. Change the url with:<br>
 `sed -i "s|localhost/|FQDN/|g"`<br>

Allow port 80 on the firewall.<br>
 `sudo ufw allow 80`<br>

Restart apache.<br>
 `sudo systemctl restart apache2`<br>

In the web browser go to: <br>
 `http://FQDN/cgi-bin/exampleboard/ryansiob.pl`<br>

**I DID NOT WRITE THIS CODE**<br>
Full credit goes to Ryan Cartwright additional windows information supplied by Steve Collett.I have put this up as there is no where else that I am aware of that has this documented.<br>
<br>
Software source.<br>
[https://sourceforge.net/projects/ryansiob/files/latest/download Ryansiob]<br>
[https://cpan.metacpan.org/authors/id/L/LE/LEEJO/CGI-4.51.tar.gz CGI-4.51]<br>
[https://cpan.metacpan.org/authors/id/M/MI/MIKO/Date-EzDate-1.16.tar.gz Date-EzDate-1.16]<br>
