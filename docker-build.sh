#!/bin/bash

image_name=usd-build-env
file_name=Dockerfile
version=

usage()
{
    echo "$0 [version]"
    echo ""
    echo "Builds a new docker image for USD builds."
    echo "The optional version will select a dockerfile, named like Dockerfile-version."
    echo "The version will also be set on the resulting image like ${image_name}:version."
    echo ""
    echo "\"$0 centos\" will build a version ABI compatible with rhel's default setup"
}

while [ "$1" != "" ]; do
    case $1 in 
        -h | --help )   shift
                        usage
                        exit
                        ;;
        * )             version=$1
    esac
    shift
done

if [ "$version" != "" ]; then
    echo "Building for ${version}"
    image_name=${image_name}:${version}
    file_name=${file_name}-${version}
fi

docker build ./docker -t image_name -f ./docker/$file_name
