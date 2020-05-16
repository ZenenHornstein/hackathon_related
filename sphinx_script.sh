#!/usr/bin/bash

###
#Dependancy: $ apt-get install python3-sphinx
###
mkdir docs
cd docs
sphinx-quickstart

#Change conf.py
sed -i '14,17s/#\s//' conf.py
#Do path
sed "17s/abspath('.')/abspath('..\/')/" conf.py
#Change index.rst
sed '13a\   modules' index.rst

sphinx-apidoc -o . ..
sleep 1
make html
sleep 1
google-chrome http://localhost:8000/ && python3 -m http.server -d _build/html


