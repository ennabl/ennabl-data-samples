#!/bin/bash
set -ex

python -m pip install virtualenv
python -m virtualenv venv

activate () {
    . $PWD/venv/bin/activate
}

activate

echo "Installing dependencies"
pip install pandas
pip install sqlalchemy==1.4.32
pip install pyathena==2.14.0

pip install jupyter notebook
jupyter notebook