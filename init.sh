#!/bin/bash

for i in {1..10}; do
	name=exercise${i}
	if [ ! -e "${name}" ]; then
		mkdir ${name}
		cd ${name}
		touch description.md
	       	touch solve.sh && chmod 777 solve.sh
	fi
	cd ..
done
