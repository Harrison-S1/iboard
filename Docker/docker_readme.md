# Docker build

The docker file is exactly as doing it manually. I have tried to put meaningful comments in the build files.
The structure of the folder will need to be:<br>
- Docker_Project_name
  - iboard
    - CGI-4.51
    - Date-EzDate-1.16
    - ryansiob
  - Dockerfile
<br>
The ryansiob folder will be the "example board" folder, you just need to rename it to "ryansiob". If you are going to use a different name, change it in the Dockerfile.
When accessing the iboard you will need access the root path i.e. http://localhost/cgi-bin/ryansiob/ryansiob.pl.<br>
I will work on getting it at the root of the FQDN.
