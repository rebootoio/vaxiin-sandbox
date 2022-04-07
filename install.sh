#!/bin/bash -e

OS="$(uname)"
if [[ "${OS}" == "Linux" || "${OS}" == "Darwin" ]]
then
  MY_OS="$(echo ${OS} | tr '[:upper:]' '[:lower:]')"
else
  echo "Error: Unsupported OS, cuurently only linux & darwin are supported"
  exit 1
fi

git clone https://github.com/rebootoio/vaxiin-sandbox.git
cd vaxiin-sandbox

VAXCTL_VERSION="$(curl -s https://api.github.com/repos/rebootoio/vaxctl/releases/latest |grep '"tag_name"' | sed -E 's/.*"(v[0-9\.]+)".*/\1/')"
curl -s -L -o vaxctl.zip https://github.com/rebootoio/vaxctl/releases/download/${VAXCTL_VERSION}/vaxctl_${VAXCTL_VERSION}_${MY_OS}_amd64.zip
unzip vaxctl.zip
rm vaxctl.zip

docker run -d -v $(pwd):/db -p 5000:5000 --rm rebooto/vaxiin-server

