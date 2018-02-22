#!/bin/bash
echo "Did you remember to activate your virtual environment?"
echo "Did you remember to change the file path variable inside this script?"
read -p "Press [Enter] key to continue, or Ctrl-C to cancel..."

# Insert your file path to R here
RPATH="/mnt/c/Users/j_sig/Anaconda3/R"

export PYTHONPATH=$PYTHONPATH:$VIRTUALENV/lib/python3.5/site-packages
#wget https://pypi.python.org/packages/7d/3e/48954b03db340b6f0be31e2f49f562a21bc9e0dcfa2cb7eba99ee0e11a47/rpy2-2.9.2.tar.gz
#https://pypi.python.org/packages/source/r/rpy2/rpy2-2.9.2.tar.gz
export LDFLAGS="-Wl,-rpath,$RPATH/R-2.13.0/lib64/R/lib"
tar xvfz rpy2-2.9.2.tar.gz
cd rpy2-2.9.2
python setup.py build --r-home $RPATH/ install
export R_HOME=$RPATH/library/
