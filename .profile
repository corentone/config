#VM stuff
alias start-vm="./Scripts/start-vm"
alias stop-vm="./Scripts/stop-vm"
alias sshvm="ssh 192.168.56.101"
alias smb-mount="mount -t smbfs //'WORKGROUP;localuser':local@192.168.56.101/mars /Users/corentin/mnt-vm"
alias smb-umount="umount /Users/corentin/mnt-vm"
alias status-vm="VBoxManage list runningvms"

ssh-agent
ssh-add ~/.ssh/id_rsa

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# VirtualEnvs (pip install virtualenvwrapper)
export WORKON_HOME=~/python/envs
source /usr/local/bin/virtualenvwrapper.sh
#mkvirtualenv ENVNAME
#workon env1

source ps1.sh
