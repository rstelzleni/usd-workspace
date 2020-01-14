#!/bin/bash

buildcmd="python3 ./build_scripts/build_usd.py ../USD-inst --tests"
image_name=usd-build-env
version=centos
usd_dir=USD

usage()
{
    echo "$0 [-b | --build USD-flavor] [-e | --env docker environment version]"
    echo ""
    echo "Builds USD in the indicated docker container"
    echo ""
    echo "USD-flavor is the directory containing a USD/ folder with full source."
    echo "A USD-inst folder will be created as a sibling to USD with the compiled output"
    echo "The default is ${usd_dir}"
    echo ""
    echo "docker environment version is a version for the ${image_name} docker image."
    echo "The default is ${version}"
    echo ""
    echo "For example, \"$0 -b USD-nvidia -e centos\" would result in the following directory"
    echo "structure, assuming USD-nvidia/USD is a clone of the USD repo."
    echo "> tree -L 1 ./USD-nvidia/"
    echo "USD-nvidia/"
    echo "├── USD"
    echo "└── USD-inst"
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
        * )             usage
                        exit 1
    esac
    shift
done

if [ "$version" != "" ]; then
    echo "Building for ${version}"
    image_name=${image_name}:${version}
fi

docker run -it --rm -v `pwd`/${usd_dir}/USD:/opt/USD -v `pwd`/${usd_dir}/USD-inst/:/opt/USD-inst $image_name $buildcmd

