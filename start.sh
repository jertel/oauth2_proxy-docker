#!/bin/sh

if [ "$AUTO_RESTART_SECONDS" != "" ]; then
  restartSeconds=$AUTO_RESTART_SECONDS
else
  restartSeconds=120; 
fi 

code=143 
while [ $code == 143 ]; do 
  echo -n `date`
  echo " Running proxy for $restartSeconds seconds, and will then restart, to reload htpasswd"
  timeout -t $restartSeconds /usr/local/bin/oauth2_proxy $*
  code=$?
done
echo "Exiting proxy start loop with exit code $code"
exit $code
