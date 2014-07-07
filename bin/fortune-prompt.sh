#!/bin/bash

# initialize random seed with number of seconds since 1st january 1970

RANDOM=`date +%s`

# randomize to decide if we are using cowsay or cowthink.

SAY=$[$RANDOM % 2]

if [ $SAY = 1 ]
then
  COMMAND='cowsay'
else
  COMMAND='cowthink'
fi

# choose between five models
# koala, meow, sheep, tux, simple cow

MODEL=$[$RANDOM % 5]

case $MODEL in
  0)FLAG=' -f tux';;
  1)FLAG=' -f sheep';;
  2)FLAG=' -f meow';;
  3)FLAG=' -f koala';;
  4)FLAG='';;
esac

# fire the command
fortune | $COMMAND $FLAG | lolcat
