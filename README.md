Configuration

Clone into home directory to use - will kill existing 

```
cd ~;
copy ./.bash_profile ./.bash_profile.bak
copy ./.vimrc ./.vimrc.bak
git clone git@github.com:tkaria/config.git ./
```

# Cheatsheet
### Docker 
Stop all containers
`docker stop $(docker ps -a -q)`

Remove all containers
`docker rm $(docker ps -a -q)`

Remove all images
`docker rmi $(docker images -a -q)`

