#!/usr/bin/env python
# coding: utf-8
import os
import json
from notebook.auth import passwd

p=passwd()
print(p)
filePath="/root/.jupyter/jupyter_notebook_config.json"
config={"NotebookApp":{"password":p}}
passwdStr=json.dumps(config)+"\n"
with open(filePath,"w+") as f:
    f.write(passwdStr)
