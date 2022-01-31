#!/bin/sh

############# CODER STUFF #############

set -eu

# We do this first to ensure sudo works below when renaming the user.
# Otherwise the current container UID may not exist in the passwd database.
eval "$(fixuid -q)"

if [ "${DOCKER_USER-}" ]; then
  USER="$DOCKER_USER"
  if [ "$DOCKER_USER" != "$(whoami)" ]; then
    echo "$DOCKER_USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/nopasswd > /dev/null
    # Unfortunately we cannot change $HOME as we cannot move any bind mounts
    # nor can we bind mount $HOME into a new home as that requires a privileged container.
    sudo usermod --login "$DOCKER_USER" coder
    sudo groupmod -n "$DOCKER_USER" coder

    sudo sed -i "/coder/d" /etc/sudoers.d/nopasswd
  fi
fi


############# CODE KITCHEN STUFF #############


# Put the get started guide in a more convenient location
sudo cp /code-kitchen/GetStarted.md ~/GetStarted.md


# In case there are permission issues for the users ssh key
printf "Checking -f id_rsa to fix permissions if needed\n\n"
if ls ~/.ssh* 1> /dev/null 2>&1; then
  printf "Setting ~/.ssh/id_rsa permissions to 600\n\n"
  chmod 600 ~/.ssh/id_rsa
  printf "\n\n"
fi


printf "\nProceeding To Server Startup\n\n"


############# CODER STUFF #############

dumb-init /usr/bin/code-server "$@"