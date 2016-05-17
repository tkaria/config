Configuration

Clone into home directory to use 
```
cd ~;
git clone git@github.com:tkaria/config.git config 
cp ~/.bash_profile ~/.bash_profile.bak
cp ~/.vimrc ~/.vimrc.bak
cp -i ./config/.bash_profile ./
cp -i ./config/.vimrc ./
```

# Cheatsheet
### Docker 
Stop all containers
`docker stop $(docker ps -a -q)`

Remove all containers
`docker rm $(docker ps -a -q)`

Remove all images
`docker rmi $(docker images -a -q)`

