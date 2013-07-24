# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
JAVAWS=/usr/local/java/
Q=~/q/l32
PATH=$PATH:$JAVAWS:$Q

JAVA_HOME=/usr/local/java/

PATH=$JAVA_HOME/bin:$PATH

export JAVA_HOME

# svn vars
export SVN_EDITOR=/usr/bin/vim

# git vars
export GIT_EDITOR=/usr/bin/vim


alias gotest='cd ~/capitalk/timir'
alias gotick='cd /mnt/raid/tickdata'
alias maek=make
alias h='history'
alias p='pushd'
alias lcd='popd'

# Added by Sean
SSH_ENV="$HOME/.ssh/environment"

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	eval `$SSHAGENT $SSHAGENTARGS`
	trap "kill $SSH_AGENT_PID" 0
fi

function wtitle {
if [ "$TERM" == "xterm" ] ; then
# Remove the old title string in the PS1, if one is already set.
PS1=`echo $PS1 | sed -r 's/^\\\\\[.+\\\\\]//g'`
export PS1="\[\033]0;$1 - \u@\h:\w\007\]$PS1 "
else
echo "You are not working in xterm. I cannot set the title."
fi
}

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# Source setup for intel compiler suite
source /opt/intel/bin/compilervars.sh intel64

# AWS Information 
export EC2_HOME=~/bin/ec2-api-tools-1.6.8.0/
export PATH=$PATH:$EC2_HOME/bin:$EC2_HOME
# for orderbook
#export EC2_PRIVATE_KEY=pk-APKAIV7W7WYA2X7MTDDA.pem
#export EC2_CERT=awsorder_book.pem
# for capk
#export CAPK_EC2_PRIVATE_KEY=
#export CAPK_EC2_CERT=capk.pem
# for Boto
export AWS_ACCESS_KEY_ID=AKIAITZSJIMPWRM54I4Q
export AWS_SECRET_ACCESS_KEY=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

# Local binaries
export PATH=$PATH:/home/timir/bin

# added by Sean Rolinson (see: /etc/skel/.bash_profile)
PATH=$PATH:$HOME/bin:/usr/local/numpy/bin:/usr/local/ipython/bin
PYTHONPATH=/usr/local/lib/python2.7/site-packages

#/usr/local/scipy/lib64/python2.6/site-packages:/usr/local/ipython/lib/python2.6/site-packages:/usr/local/matplotlib/lib64/python2.6/site-packages:/usr/local/lib64/:/usr/lib64/python2.6/lib-dynload/:/usr/lib64/python2.6/site-packages/matplotlib/backends/

#LD_LIBRARY_PATH=/usr/local/atlas/lib:$LD_LIBRARY_PATH:/usr/local/lib64:/usr/local/lib
#LD_LIBRARY_PATH=/usr/local/lib/:/opt/wx/2.8/lib/:/usr/local/lib64:/usr/local/lib64/mysql:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=/usr/local/lib64/mysql:$LD_LIBRARY_PATH
#PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/local/ipython/lib/python2.6/site-packages/

# Note that PANTHEIOS logger relies on STLPORT 
export PANTHEIOS_ROOT=/opt/src/pantheios
export STLSOFT=/opt/src/stlsoft
export PATH PYTHONPATH LD_LIBRARY_PATH
umask 0002
