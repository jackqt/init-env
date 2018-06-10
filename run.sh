#!/usr/bin/env bash

check_app_exist() {
  dpkg-query -l $1 2>&1 >/dev/null
  return $?
}

install() {
  APP_NAME=$1
  check_app_exist $APP_NAME
  if [ $? -eq 0 ];then
    echo "[debug] install($1): the app already been installed, exit"
    return 0
  fi

  echo "[debug] install($1): the app does not installed, install from apt"
  sudo apt-get install -y $1 2>&1 >/dev/null
  check_app_exist $APP_NAME
  if [ ! $? -eq 0 ];then
    echo "[debug] install($1): the app cannot be installed for some reason. please install manually "
    return 1
  else
    echo "[debug] install($1): install app successfully"
    return 0
  fi
}

CLI_APPS="puppet"
for item in $CLI_APPS;do install $item; done

sudo puppet apply manifests --modulepath=./modules
