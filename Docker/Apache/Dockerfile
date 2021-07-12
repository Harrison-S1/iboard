FROM ubuntu:latest

#update and upgrade contianer image 
RUN apt update
RUN apt upgrade -y

#install make and curl
RUN apt install make curl -y

#the following ARG turns off the questions normally asked for location and timezone for Apache and set Europe/London time zone
ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"
#install apache
RUN apt install apache2 -y
#move iboard folder over and move into the its dir
COPY ./iboard /iboard
WORKDIR /iboard

#move into the CGI folder and run make
RUN cd CGI-4.51/; perl Makefile.PL; make; make install
WORKDIR /iboard
#move into the Date-EzDate folder and run make
RUN cd Date-EzDate-1.16/; perl Makefile.PL; make; make install
#enable cgi
RUN a2enmod cgi

#create dir if not already there
RUN mkdir -p /usr/lib/cgi-bin/ryansiob
#change dir and copy the relevant files
WORKDIR /iboard/ryansiob
RUN cp envelope.gif ryansiob.config.pl ryansiob.pl ryansiob.search.pl /usr/lib/cgi-bin/ryansiob/

#change dir and change permissions and ownership
WORKDIR /usr/lib/cgi-bin/ryansiob/
RUN chown root:www-data envelope.gif
RUN chmod +x /usr/lib/cgi-bin/ryansiob/*

#change dir, create new dir if not already there, copy the relevant files, change permissions and ownership and create a symbolic link
WORKDIR /iboard/ryansiob
RUN mkdir -p /usr/local/ryansiob/
RUN cp allout.pl datafile /usr/local/ryansiob/
RUN chown -R root:www-data /usr/local/ryansiob/
RUN chmod -R 770 /usr/local/ryansiob/
RUN ln /usr/lib/cgi-bin/ryansiob/envelope.gif /var/www/html/

#expose port 80 of the container
EXPOSE 80

#start the container
CMD ["apachectl", "-D", "FOREGROUND"]