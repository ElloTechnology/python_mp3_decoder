#! /bin/bash

curl https://sourceforge.net/projects/swig/files/swig/swig-3.0.12/swig-3.0.12.tar.gz/download
tar -xzf swig-3.0.12.tar.gz
cd swig-3.0.12.tar.gz
curl https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.bz2/download
mv pcre-8.45.tar.bz2 pcre-8.45.tar
./Tools/pcre-build.sh
./autogen.sh
./configure
make
make install
ln -s $(which swig) $(which swig | sed 's/\[^\/]*$/swig3.0/')

brew install lame
pip install .