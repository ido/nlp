#!/bin/sh

# clone or pull the virtualenv tools from their git repository.
if [ ! -f virtualenv/virtualenv.py ]; then
  git submodule init
  git submodule update
fi

# If a virtual environment does not exist, create one so we don't need to
# litter Python modules all over the system.
if [ ! -f env/bin/activate ]; then
  python virtualenv/virtualenv.py env
fi

# Enter the virtual environment we created above or previously...
source env/bin/activate

# I realize this seems unnecessarily complicated, but it's necessary
# since the NLTK.org download link is broken and the tarball does not
# explicitly identify PyYAML as a dependency if it's used directly...
pip install pyyaml
pip install -r requirements.txt

# Download NLTK datasets.
python -m nltk.downloader all
