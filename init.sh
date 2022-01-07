#!/bin/bash

image="jasonwen/jupyter:1.0"

if [ ! -f ./.genPasswd.py ] 
then
	echo "genPasswd.py no found"
	exit
fi

#create notebook directory
mkdir -p notebook

#生成配置文件
docker run --rm   -v  `pwd`:/root  $image   jupyter notebook --generate-config

echo "set notebook"
sed  -i "s/# c.NotebookApp.notebook_dir = ''/c.NotebookApp.notebook_dir = '\/home\/notebook'/g" .jupyter/jupyter_notebook_config.py
sed  -i "s/# c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '*'/g" .jupyter/jupyter_notebook_config.py
sed  -i "s/# c.NotebookApp.port = 8888/c.NotebookApp.port = 8888/g" .jupyter/jupyter_notebook_config.py
sed  -i "# c.NotebookApp.open_browser = True/c.NotebookApp.open_browser = False/g" .jupyter/jupyter_notebook_config.py


#set password
docker run --rm -it  -v  `pwd`:/root  $image  python3 /root/.genPasswd.py





