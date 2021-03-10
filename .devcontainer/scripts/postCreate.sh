#!/bin/sh
HOMEDIR=$HOME
echo "Performing post container creation steps in directory: $HOMEDIR"

echo "Mapping host .ssh to container .ssh"
rm -fr $HOMEDIR/.ssh
ln -s $HOMEDIR/host-home/.ssh $HOMEDIR/.ssh

echo "Mapping host .gitconfig to container .gitconfig"
rm -f $HOMEDIR/.gitconfig
ln -s $HOMEDIR/host-home/.gitconfig $HOMEDIR/.gitconfig

echo "Mapping folder ~/.vscode-server/extensions to persistent mount"
if [ ! -d "$HOMEDIR/persistent_data/.vscode-server/extensions" ]; then
    mkdir -p $HOMEDIR/persistent_data/.vscode-server/extensions
    mv $HOMEDIR/.vscode-server/extensions $HOMEDIR/persistent_data/.vscode-server/
else
    rm -fr $HOMEDIR/.vscode-server/extensions
fi
ln -s $HOMEDIR/persistent_data/.vscode-server/extensions $HOMEDIR/.vscode-server/extensions

echo "Mapping folder ~/.conan to persistent mount"
if [ ! -d "$HOMEDIR/persistent_data/.conan" ]; then
    mkdir -p $HOMEDIR/persistent_data/.conan
    mv $HOMEDIR/.conan/* $HOMEDIR/persistent_data/.conan/
else
    rm -fr $HOMEDIR/.conan
fi
ln -s $HOMEDIR/persistent_data/.conan $HOMEDIR/.conan

# setup conan
conan profile update settings.compiler.libcxx=libstdc++11 default
conan remote add me-repo https://markuseggenbauer.jfrog.io/artifactory/api/conan/me-conan -i 0 --force