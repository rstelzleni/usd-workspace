# usd-workspace
A place for scratch files to share between people/machines

## usage

Clone this repository, then create a folder named like USD-something. Inside that
folder clone a USD repository. Then you can use the build-usd and usd-run scripts
with that cloned repo.

Example
```
git clone https://github.com/rstelzleni/usd-workspace
cd usd-workspace
mkdir USD-github
git clone https://github.com/PixarAnimationStudios/USD USD-github/USD
./docker-build.sh
./build-usd.sh -b USD-github
./usd-run.sh -b USD-github python -c "from pxr import Usd; print dir(Usd)"
```
