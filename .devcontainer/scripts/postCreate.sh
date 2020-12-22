#!/bin/sh
HOMEDIR=$HOME
echo "Performing post container creation steps in directory: $HOMEDIR"

echo "Mapping host .ssh to container .ssh"
rm -fr $HOMEDIR/.ssh
ln -s $HOMEDIR/host-home/.ssh $HOMEDIR/.ssh

echo "Mapping host .gitconfig to container .gitconfig"
rm -f $HOMEDIR/.gitconfig
ln -s $HOMEDIR/host-home/.gitconfig $HOMEDIR/.gitconfig

echo "Mapping container .vscode-server/extensions to container external mount"
if [ ! -d "$HOMEDIR/persistent_data/.vscode-server/extensions" ]; then
    mkdir -p $HOMEDIR/persistent_data/.vscode-server/extensions
    mv $HOMEDIR/.vscode-server/extensions $HOMEDIR/persistent_data/.vscode-server/
else
    rm -fr mv $HOMEDIR/.vscode-server/extensions
fi
ln -s $HOMEDIR/persistent_data/.vscode-server/extensions $HOMEDIR/.vscode-server/extensions