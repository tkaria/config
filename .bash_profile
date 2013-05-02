# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

LOCAL_BIN=$HOME/bin
PATH=$PATH:$LOCAL_BIN

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_13.jdk/Contents/Home
export JAVA_HOME
PATH=$PATH:$JAVA_HOME:

GIT_CL=/usr/local/git/bin
PATH=$PATH:$GIT_CL

# svn vars
export SVN_EDITOR=/usr/bin/vim

# git vars
export GIT_EDITOR=/usr/bin/vim

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	eval `$SSHAGENT $SSHAGENTARGS`
	trap "kill $SSH_AGENT_PID" 0
fi


# Stuff for Amazon EC2
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY="$EC2_HOME/pk-amazon-timir.pem" 
export EC2_CERT="$EC2_HOME/cert-amazon-timir.pem"
export AWS_ACCESS_KEY_ID=AKIAITZSJIMPWRM54I4Q
export AWS_SECRET_ACCESS_KEY=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

# added by Sean Rolinson (see: /etc/skel/.bash_profile)
PATH=$PATH:$HOME/bin:/usr/local/numpy/bin:/usr/local/ipython/bin
PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
LD_LIBRARY_PATH=/usr/local/atlas/lib:$LD_LIBRARY_PATH
export PATH PYTHONPATH LD_LIBRARY_PATH
umask 002

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

REL_MAVEN_OPTS="-Xmx1024M -XX:MaxPermSize=1024M"
DBG_MAVEN_OPTS='-Xdebug -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=y -Xmx1024M -XX:MaxPermSize=1024M'

alias RDBG='export MAVEN_OPTS=$DBG_MAVEN_OPTS'
alias NDBG='export MAVEN_OPTS=$REL_MAVEN_OPTS'
alias m='mvn clean install'
alias mo='mvn -o clean install'
