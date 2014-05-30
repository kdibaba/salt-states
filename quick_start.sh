#!/usr/bin/env bash

name=${0##*/}

function die() {
    echo "$1"
    exit 1;
}

function print_help() {
    echo "usage: $name <pillar-repo>

required args:
    <pillar-repo> repo to clone for pillar data
optional args:

    -h|--help     print this help."
}

pretend=0
bundleupdate=0
OPTS=$(getopt -o h --long help -n "$name" -- "$@")

if [ $? != 0 ]; then echo "option error" >&2; exit 1; fi

eval set -- "$OPTS"

while true; do
    case "$1" in
        -h|--help)
            print_help
            exit 0
            ;;
        --)
            shift; break;;
        *)
            echo "Internal error!"; exit 1;;
    esac
done

if [ $# -ne 1 ]; then echo "Need pillar repo"; exit 1; fi

pillar_repo="$1"

pushd $(dirname $0) &> /dev/null

git clone https://github.com/johnnygaffey/salt-states.git $HOME/salt-states || die "Failed to clone salt-states."
git clone $pillar_repo $HOME/salt-pillar || die "Failed to clone salt-pillar."

wget -O - http://bootstrap.saltstack.org | sudo sh

sudo ln -s $HOME/salt-states /srv/salt
sudo ln -s $HOME/salt-pillar /srv/pillar

sudo salt-call --local state.highstate

popd &> /dev/null
