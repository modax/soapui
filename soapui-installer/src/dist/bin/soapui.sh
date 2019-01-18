#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  SoapUI Bootstrap Script                                                 ##
##                                                                          ##
### ====================================================================== ###

### $Id$ ###
EXECUTABLE=`dirname $0`/`basename $0`
LS_LD=`ls -ld "${EXECUTABLE}"`
SYM_LINK_INDICATOR="->"
if [ "$LS_LD" != "${LS_LD%$SYM_LINK_INDICATOR*}" ]
then
  EXECUTABLE=`ls -ld "${EXECUTABLE}" | sed -e 's|.*-> ||' -e 's|.* ${EXECUTABLE}|${EXECUTABLE}|'`
  case "$EXECUTABLE" in
    /*);;
    *)EXECUTABLE=`dirname $0`/$EXECUTABLE
  esac
fi
DIRNAME=`dirname $EXECUTABLE`

MAIN_CLASS="com.eviware.soapui.SoapUI"
JAVA_OPTS="$JAVA_OPTS -splash:SoapUI-Spashscreen.png"
cd "$DIRNAME" && DIRNAME=`pwd` # make sure DIRNAME is absolute
. ./baserunner.sh
