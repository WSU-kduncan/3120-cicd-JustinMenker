# Part 1 Semantic Versioning

- CD Project Overview
	* What we are doing for this project is the deployment process. This would mean we are pushing our changes to repositories and tagging them appropriately usng semantic versioning to keep everything nice and tidy. We are doing this by using github action workflows to automatically push newly tagged docker images everytime we push a tag to github. In the workflows we are using some tools such ad docker metadata action to auto generate the tags based on our git hub tags.

- Generate tag in git/github
	* to generatea  tag in github you first need to have a commit queued up with changes then before you push you need to run a command like `git tag -a v*.*.*` this will tag that commit. then to push a tag you will need to run a command like `git push orgin v*.*.*` this will push your changes but in tag that functions like a seperate branch. therefore those changes will not be on main branch until you run the `git psuh` for those commits you queued up.

- Behavior of github action workflow
	* the behavior of this specific workflow will be do a similar process to last projects workflow. However with the last one we specified a tag of `name/app:Latest`. in this worklfow we are adding two things. First we changed the code so that it will run when a tag is pushed. Then we added the docker metadata action. This is what is generating our semantic versioning formatted tags. So TLDR; this action will run when a git tag is pushed and will build and push new docker images based on semantic versioning using the tags we used for the git commit. SO for example with agit tag of v1.3.1 it will generate docker images for v1.3.1, v1.3, and latest

- Link to docker repository
[docker repository](https://hub.docker.com/repository/docker/jmenker/project4/general)


# Part 2 - Deployment

- How to install docker on your instance
	* To install docker on your instance it is as simple as running `sudo apt install docker.io`. you may need to runa `sudo apt-get update` before this as well

- Container restart script
```
#!/bin/bash

sudo docker stop upbeat_hermann
sudo docker rm upbeat_hermann
sudo docker pull jmenker/project4:latest
sudo docker run --name upbeat_hermann  -d -p 80:80 jmenker/project4:latest
```
	* justification, I used one of the default names that docker gave me for a container and kept it. the first thing in the script is the shebang so that it knows what interpretor to run this code in, in this case that would be bash -> next is to stop the currently running container -> then remove that container you must do it in this order or else you will get an error that you cant remove a running container -> then we are pulling the latest image from dockerhub -> and last we are running the new contianer in detached on port 80 since we have webcontent.

