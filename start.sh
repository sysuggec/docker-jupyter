#!/bin/bash
if [ ! -d .jupyter ]
then
	echo "jupyter config not found"
	exit
fi

docker run -v `pwd`/notebook:/home/notebook  -v  `pwd`/.jupyter:/root/.jupyter -t  -p 8089:8888 jasonwen/jupyter:1.0  jupyter notebook --allow-root &
