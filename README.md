Configuration files that I like
```
cd ~;
git clone git@github.com:tkaria/config.git ./
```

Cheatsheet
### Docker 
Stop all containers
`docker stop $(docker ps -a -q)`
Remove all containers
`docker rm $(docker ps -a -q)`
Remove all images
`docker rmi $(docker images -a -q)`
