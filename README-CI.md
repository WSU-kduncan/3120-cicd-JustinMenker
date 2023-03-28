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
	* To build an image from the docker file you will first ofcourse have to kva emade a docker file and put in whatever directory your choose. usually would be a project folder or something of the like. THen you will need to run a docker build command that builds the contianer fro mthe file like so `sudo docker build -t "image name" .`
		* the `.` at the end of the comamnd is in reference to the directory. for me I used `.` because i was already cd in the directory that contained the docker file other wise you would have to replace the dot with the path to said directory adn docker file
