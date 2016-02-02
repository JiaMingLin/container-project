#!/bin/bash

PWDD=`pwd`
#RRO_VERSION_MAJOR=3
#RRO_VERSION_MINOR=2.2
R_PATH="noop"
LIB_PATH=
ETC_PATH=


checkPreviousMklInstall() {
if [ -e $LIB_PATH/libmkl_core.so ]; then
echo "A previous installation of MKL was detected. To reinstall, you must first uninstall the current MKL installation. Exiting now..."
exit 0
fi
}

copyLinkMklLibraries() {
## ensure libRlapack.so and libRblas.so exist
if [ -e $LIB_PATH/libRlapack.so ]; then
   if [ -e $LIB_PATH/libRblas.so ]; then
       mv $LIB_PATH/libRlapack.so $LIB_PATH/libRlapack.so.keep
       mv $LIB_PATH/libRblas.so $LIB_PATH/libRblas.so.keep
       ## copy mkl libraries
       cp $PWDD/mkl/libs/* $LIB_PATH
       ## set env variables in Rprofile.site
       sed -i -e '1 a\
Sys.setenv("MKL_INTERFACE_LAYER"="GNU,LP64")\
Sys.setenv("MKL_THREADING_LAYER"="GNU")\
' $ETC_PATH/Rprofile.site
       ## install RevoUtilsMath
       $R_PATH CMD INSTALL $PWDD/RevoUtilsMath.tar.gz  > mkl_log.txt 2>&1
       echo "MKL was successfully installed for Revolution R Open ${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}."
       echo "Exiting now..."
       exit 0
   fi
fi
echo "Error: This does not look like a valid Revolution R Open installation."
echo "libRlapack.so and/or libRblas.so do not exist in ${LIB_PATH}"
exit 0
}

checkForValidRROInstallation() {
## check RRO installation
if [ ! -e /usr/bin/R ]; then
     ## check default path
    if [ ! -e /usr/lib64/RRO-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}/R-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}/lib64/R/bin/R ]; then
        ## prompt user for valid RRO installation
        echo "Could not find a valid installation of Revolution R Open ${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}."
        echo "Exiting now..."
        exit 1
    else
        R_PATH=/usr/lib64/RRO-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}/R-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}/lib64/R/bin/R
    fi
fi
if [ ! -e $R_PATH ]; then
    ## get full path
    TEMP_PATH=`ls -l /usr/bin/R`
    R_PATH=`echo $TEMP_PATH | awk -F "[ >]" '{print $NF}'`
fi

## get version
RRO=`echo "print(Revo.version)" | $R_PATH -q --no-save`
MAJOR=`echo $RRO  | awk -F" " '{
for(i=1;i<=NF;i++){
if($i~/major/) {
{print $(i+1)}
exit
}
}}'`

MINOR=`echo $RRO  | awk -F"[ -]" '{
for(i=1;i<=NF;i++){
if($i~/minor/) {
{print $(i+1)}
exit
}
}}'`

    if [ "$MAJOR" = $RRO_VERSION_MAJOR ] && [ "$MINOR" = $RRO_VERSION_MINOR ]; then
        ## get lib path
        PATH_LEN=${#R_PATH}
        LIB_PATH_LEN=`expr $PATH_LEN - 6`
        LIB_PATH=${R_PATH:0:$LIB_PATH_LEN}
        ETC_PATH=$LIB_PATH/etc
        LIB_PATH=$LIB_PATH/lib
        if [ -e $LIB_PATH ]; then
            return 0
        fi
    else
        echo "Error: Revolution R Open was detected; however, it is not the correct version."
        echo "This utility is for version ${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR} only.  Exiting now........."
        echo ""
        exit 1
    fi
}

installMklLibraries() {
checkForValidRROInstallation
if [ -e $LIB_PATH ]; then
    checkPreviousMklInstall
    copyLinkMklLibraries
fi
}

echo "mkl_log" > mkl_log.txt 2>&1
installMklLibraries

