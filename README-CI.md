# Part 1

-  CI Project Overview
	* We are using a program called docker to run containers on our local system.
		* we are doing this to get aquainted with containers and their uses. In this case we are using it in part one to hold a webserver that we are going to use to host site content.
	* The tools we are using are docker, to be able to use containers, a webserver in the container, in my case I plan on using apache, and the ste content in questions is goingto be the supplied site.tar.gz we were gicen in the project description
- Run Project Locally
	* First things firts you would need to install docker so that you cna run contianers that and then the depdencies you will need. in this case we have WSL2.
	* To intall WSL2 you will need to open your windows cmd terminal and run this command `wsl –install`
	* To install docker you will first need to download and install docker desktop.
		* after following the basic install instructions you need to go into settings -> General -> select the use WSL2 based engine box -> apply and Restart
	* To build an image from the docker file you will first, of course have to have made a docker file and put in whatever directory you choose. usually would be a project folder or something of the like. Then you will need to run a docker build command that builds the contianer from the file like so `sudo docker build -t "image name" .`
		* the `.` at the end of the comamnd is in reference to the directory. for me I used `.` because i was already cd in the directory that contained the docker file other wise you would have to replace the dot with the path to said directory and docker file
	* To run the container you just built you will need to run a command like this `docker run -d -p 80:80 mywebserver:latest`
		* `docker run` is the start of the run command. the `-d` runs the contianer in detached mode. the `-p 80:80` will expose port 80 on the docker host for your container if it needs it. in my case I did since my container is hosting a webserver. after that is the name followed by a semicolon and the tag. if you didnt specify a tag when it was created then the tag you will need is latest like mine shows above
	* to view the project running in the container first make sure that that contianer has been started and is currently running. then you cna go back into your docker desktop application. click on contianers and you will see the one you made. if it it currently running then the ports colun will be a link tat will take you to hte local host..
