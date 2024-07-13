#!/bin/bash

createvolumes () {
	mkdir -p /tmp/dali3/db /tmp/dali3/wp
}

deletevolumes (){
	rm -rf /tmp/dali3/db /tmp/dali3/wp
}

if [ "$1" == "setup" ] 
then 
	createvolumes
fi


if [ "$1" == "clean" ]
then 
	deletevolumes 
fi
