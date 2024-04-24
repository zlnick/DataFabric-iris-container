#!/bin/bash
###
 # @Author: Lin Zhu
 # @Date: 2024-04-24 15:45:06
 # @LastEditors: Lin Zhu
 # @LastEditTime: 2024-04-24 15:57:53
 # @Description: 
 # @FilePath: \DataFabric-iris-container\image-iris\init.sh
### 

# DIR=$(dirname $0)
# if [ "$DIR" = "." ]; then
# DIR=$(pwd)
# fi
# iris-community login need no username and password

# echo " Merge configuration..." 
# iris merge iris /external/irismerge.conf /usr/irissys/iris.cpf

# do \$SYSTEM.OBJ.Load("/dur/WebTerminal-v4.9.5.xml", "cuk")
# do \$SYSTEM.OBJ.Load("/dur/zpm-0.7.0.xml", "cuk")
# zpm "version"
# zn "MOCKSYS"
# do \$SYSTEM.OBJ.Load("/dur/mocksysns/mocksys_classes.xml", "cuk")
# write "zpm and webterminal installed"
# zpm
# zn HCC
# load -v /dur/hccns
# exit
# halt

iris session $ISC_PACKAGE_INSTANCENAME -U USER <<- EOF

EOFdo

echo ""
echo "Installation complete."
echo ""

echo "stop iris and purge unnecessary files..."
iris stop $ISC_PACKAGE_INSTANCENAME quietly
rm -rf $ISC_PACKAGE_INSTALLDIR/mgr/journal.log 
rm -rf $ISC_PACKAGE_INSTALLDIR/mgr/IRIS.WIJ
rm -rf $ISC_PACKAGE_INSTALLDIR/mgr/journal/*
rm -rf /dur/*

exit 0