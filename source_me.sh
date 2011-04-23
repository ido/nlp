#!/bin/sh

if [ -f env/bin/activate ]; then
  source env/bin/activate
else
  python virtualenv/virtualenv.py env
  source env/bin/activate
fi

pip install -r requirements.txt
