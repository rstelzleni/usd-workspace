#!/bin/bash

image_name=usd-build-env
version=centos
usd_dir=

usage()
{
    echo "$0 [-b inst location] [-e env] command and params"
    echo ""
    echo "Runs a command in the indicated docker container, with an optional USD install"
    echo ""
    echo "inst location is the directory containing a USD-inst/ folder."
    echo "If not provided the command is run in the container with no usd install available"
    echo ""
    echo "env is a version for the ${image_name} docker image. The default is ${version}"
    echo ""
    echo "For example, \"$0 -b USD-nvidia -e centos bash\" would start a bash shell in the"
    echo "centos container, and mount the USD-inst from USD-nvidia/USD-inst in it"
    echo ""
    echo "\"$0 echo hello world\" will run that echo from inside a ${version} container with no"
    echo "USD-inst mounted."
}

while [ "$1" != "" ]; do
    case $1 in 
        -h | --help )   usage
                        exit
                        ;;
        -b | --build )  shift
                        usd_dir=$1
                        ;;
        -e | --env )    shift
                        version=$1
                        ;;
        * )             break
    esac
    shift
done

if [ "$version" != "" ]; then
    echo "Running in ${version}"
    image_name=${image_name}:${version}
fi

if [ "$usd_dir" != "" ]; then
    usd_dir="-v `pwd`/${usd_dir}/USD:/opt/USD -v `pwd`/${usd_dir}/USD-inst:/opt/USD-inst"
fi

docker run -it --rm $usd_dir $image_name $@
