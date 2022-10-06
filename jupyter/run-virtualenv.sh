#!/bin/bash
set -ex

python -m pip install virtualenv
python -m virtualenv venv

activate () {
    . $PWD/venv/bin/activate
}

activate

echo "Installing dependencies"
pip install -r requirements.txt

jupyter notebook ennablData.ipynb