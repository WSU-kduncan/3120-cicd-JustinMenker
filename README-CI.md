# Part 1

-  CI Project Overview
	* We are using a program called docker to run containers on our local system.
		* we are doing this to get aquainted with containers and their uses. In this case we are using it in part one to hold a webserver that we are going to use to host site content.
	* The tools we are using are docker, to be able to use containers, a webserver in the container, in my case I plan on using apache, and the ste content in questions is goingto be the supplied site.tar.gz we were gicen in the project description
- Run Project Locally
	* First things firts you would need to install docker so that you cna run contianers that and then the depdencies you will need. in this case we have WSL2.
	* To intall WSL2 you will need to open your windows cmd terminal and run this command `wsl –install`
	* To insatll docker you will first need to download and install docker desktop.
		* after following the basic install instructions you need to go into settings -> General -> select the use WSL2 based engine box -> apply
