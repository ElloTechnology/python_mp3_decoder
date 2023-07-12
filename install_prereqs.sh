#! /bin/bash

wget https://sourceforge.net/projects/swig/files/swig/swig-3.0.12/swig-3.0.12.tar.gz/download -O swig-3.0.12.tar.gz
tar -xzf swig-3.0.12.tar.gz
cd swig-3.0.12
curl https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.bz2/download -O pcre-8.45.tar
./Tools/pcre-build.sh
./autogen.sh
./configure
make
make install
ln -s $(which swig) $(which swig | sed 's/\/[^\/]*$/swig3.0/')

brew install lame
cd ..
mkdir -p /usr/local/include/lame
mkdir -p /usr/local/lib/
ln -s /opt/homebrew/opt/lame/ /usr/local/include/lame
ln -s /opt/homebrew/opt/lame/lib/libmp3lame.a /usr/local/lib/libmp3lame.a
pip install .