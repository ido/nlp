#!/bin/sh

if [ ! -f env/bin/activate ]; then
  if [ ! -f virtualenv/virtualenv.py ]; then
    git submodule update --init
  fi
  python virtualenv/virtualenv.py env
fi

source env/bin/activate

pip install nltk
