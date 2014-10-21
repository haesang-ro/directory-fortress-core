#!/bin/sh
#
#   Licensed to the Apache Software Foundation (ASF) under one
#   or more contributor license agreements.  See the NOTICE file
#   distributed with this work for additional information
#   regarding copyright ownership.  The ASF licenses this file
#   to you under the Apache License, Version 2.0 (the
#   "License"); you may not use this file except in compliance
#   with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing,
#   software distributed under the License is distributed on an
#   "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#   KIND, either express or implied.  See the License for the
#   specific language governing permissions and limitations
#   under the License.
#
if [ -z $1 ]
then
    echo 'sudo NOT enabled'
else
    echo 'sudo enabled='$1
    export SUDO=true
    fi

SERVICE='slapd'
x=1
while [ $x -le 10 ]
do
  echo "Attempt $x to stop $SERVICE"
  if ps ax | grep -v grep | grep $SERVICE > /dev/null
  then
	echo 'stop the slapd server ' $a
	if [ $SUDO ]
	then
			echo $SUPW | sudo -S kill -HUP $(pidof $SERVICE)
	else
			kill -HUP $(/sbin/pidof $SERVICE)
    fi

  else
	echo "$SERVICE has been stopped"
	break;
  fi
  x=$(( $x + 1 ))
done