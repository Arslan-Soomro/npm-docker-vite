## Docker + Vite
tried to configure the docker container with vite,
vite didn't create much problem and still can work with these configs.

## What failed ?
The problem is the node_modules folder in order to avoid conflict between the node_modules folder at host system and docker container system,
in docker_container we install node_modules into the parent directory of the project. So this is how it is supposed to work in docker container,
node module resolver will first look into the project directory it won't find node_modules, so it will go up one directory and find node_modules it will find
it there and load all modules from there. We also put node_modules in .dockerignore in order to avoid copying node_modules into project folder.
Okay sounds great, but what is the problem. 
The problem is that when we mount the whole project from host system to container it also mounts node_modules folder but its empty since we also exclude it
in volumes, this **empty node_module folder is the root of the problem** the node module resolver sees it and doesn't go up one directory and since node_modules
is empty it doesn't find any modules to load, only if this node_modules folder didn't exist the problem would have been resolved.
There are shell commands in place to remove this node_modules folder but somehow the node_modules folder is not affected at first so it doesn't work with docker-compose
but later you can run the container with docker run or from inside the shell of docker container and it would work.
## Solution
Find a way so that node_modules folder is not mounted with the whole project onto container.
