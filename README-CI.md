# Part 1

-  CI Project Overview

	* We are using a program called docker to run containers on our local system.
		* we are doing this to get aquainted with containers and their uses. In this case we are using it in part one to hold a webserver that we are going to use to host site content.
	* The tools we are using are docker, to be able to use containers, a webserver in the container, in my case I plan on using apache, and the site content in questions is going to be the supplied site.tar.gz we were given in the project description

- Run Project Locally

	* First things firts you would need to install docker so that you cna run contianers that and then the depdencies you will need. in this case we have WSL2.
	* To intall WSL2 you will need to open your windows cmd terminal and run this command `wsl –install`
	* To install docker you will first need to download and install docker desktop.
		* after following the basic install instructions you need to go into settings -> General -> select the use WSL2 based engine box -> apply and Restart
	* To build an image from the docker file you will first, of course have to have made a docker file and put in whatever directory you choose. usually would be a project folder or something of the like. Then you will need to run a docker build command that builds the contianer from the file like so `sudo docker build -t "image name" .`
		* the `.` at the end of the comamnd is in reference to the directory. for me I used `.` because i was already cd in the directory that contained the docker file other wise you would have to replace the dot with the path to said directory and docker file
	* To run the container you just built you will need to run a command like this `docker run -d -p 80:80 mywebserver:latest`
		* `docker run` is the start of the run command. the `-d` runs the contianer in detached mode. the `-p 80:80` will expose port 80 on the docker host for your container if it needs it. in my case I did since my container is hosting a webserver. after that is the name followed by a semicolon and the tag. if you didnt specify a tag when it was created then the tag you will need is latest like mine shows above
	* to view the project running in the container first make sure that the contianer has been started and is currently running. then you can go back into your docker desktop application. click on containers and you will see the one you made. if it it currently running then the ports colunm will be a link that will take you to the local host. you should see your site content after clicking or the default apache page if you have not put your site content on the container

# part 2

- Creating public repo
	* to create a public repo in dockerhub, first make sure you have made an account and signed in. Next click the repositories button on the top bar -> then click the blue create repository button -> Then fill out all neccesary information whcich includes the repository name, description, and visibility status which will be public or private -> then click create and you will have a repository in dockerhub

- How to authenticate with dockerhub via CLI
	* to authenticate on your command line with docker hub we will be using the access token method, whcih is the recommended method shown in class. To do this youwill need to create an acces token first. To do this simply logi to dockerhub and click the account settings button under your name -> then click the security section -> Then click the blue new access token button -> you will need to give the token a description which acts as its name, so give a description related to what you are using it for, and you will need to set its permissions of read, write, and delete as you see fit -> once you click create you will be given the token to copy and a sample command for loging in copy both then head over to the command line -> in your command line paste the login command which will look something like this `docker login -u "dockerhub username"` you will then be prompted for a password, this is where you will paste the acces token and click enter -> at this point you should have a little message saying login succesful

- How to push container image to Dockerhub (without github actions)
	* To push an image to docker hub without github actions all you need to do is retag your image with something appropriate for the destination that it is being pushed to aka your docker hub repository which will be public. You can do this by running a command like this `docker tag imagename:tag dockerhubusername/newname:newtag` -> then you just need to run the docker push command like so `docker push dockerhubusername/newname:newtag` this will take a minute, when it is done you shouldbe able to referesh your repository page on dockerhub and see the new push

- Configuring Github secrets
	* To set a github secret you simply need to head over to your github repository via giithub website and click your repository settings -> then click the secrets and variables option on the side bar. This will open adrop down menu -> then click the actions option -> From there you will need to click a green button called new repository secret -> you will then be promted for the name of the secret which acts as like a variable name and then to fill in said secret -> Next you will need to fill i nthe information just mentioned as appropriate for what you want your secret to be.
	* The secrets we are setting for this project are two secrets, one for our dockerhub username and one for our dockerhub password. We are doing this so that we can reference that information in our workflows while not having them be exposed to anyone willing to dig for that information since it is a public repo

- Behavior of Github workflow
	* What does it do and when. This particular workflow we made for this project builds and pushes an image to dockerhub form the current dockerfile in the repo whenever a push is made to the github repo.
	* The varibles that may need changed would be the secret that reference your dockerhub username and the one that references your dockerhub password, the tag section for that image being pushed, and maybe the runs-on section if perhaps your are not running on the latest verison of ubuntu or are not running this on ubuntu at all.
