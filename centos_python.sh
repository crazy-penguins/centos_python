#!/usr/bin/env bash
mkdir -p /u/downloads ;
version=${1:-"3.6.7"}
printf "\e[36mBuilding python %s\e[0m\n" "${version}"
pushd /u/downloads
filename="/u/downloads/python-${version}.tgz"
if [[ ! -f "${filename}" ]] ; then
    printf '\e[32mdownloading source bundle\e[0m\n'
    wget "https://www.python.org/ftp/python/${version}/Python-${version}.tgz" -O "${filename}" ;
fi
pdir="/u/python-${version}"
if [[ ! -d "${pdir}" ]] ; then
    mkdir -p "${pdir}"
    pushd "${pdir}"
    printf '\e[32muntarring bundle\e[0m\n'
    tar xzf "/u/downloads/python-${version}.tgz" --strip-components=1
else
    pushd "${pdir}"
fi
printf '\e[32mbuilding!\e[0m\n'
./configure --enable-optimizations && make
popd
popd
