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
