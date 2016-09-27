#!/bin/bash

for blog in cronicashungaras.blogspot.com.es imbratisare.blogspot.com.es labocadora.blogspot.com.es elterritoriodellince.blogspot.com.es blogdelviejotopo.blogspot.com.es miguel-esposiblelapaz.blogspot.com.es amistadhispanosovietica.blogspot.com.es
do
    mkdir "${blog}-$(date +%Y%m%d)"
    cd "${blog}-$(date +%Y%m%d)"
    wget --recursive --level=2 --no-clobber --no-parent --page-requisites --continue --convert-links --user-agent="" -e robots=off --reject "*\\?*,*@*" --exclude-directories="search" --referer= "http://${blog}/" --wait 1 "http://${blog}/"
    cd ..
    tar -czvf "${blog}-$(date +%Y%m%d).tar.gz" "${blog}-$(date +%Y%m%d)/"
done
