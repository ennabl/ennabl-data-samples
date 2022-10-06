#!/bin/bash
set -ex

# Create and Activate Conda Env
echo "Creating ennablData conda enviornment"
conda create --name ennablData python=3.9 ipykernel jupyter nb_conda -y
 
echo "Activating ennablData"
eval "$(conda shell.bash hook)"
conda activate ennablData

echo "Installing dependencies"
pip install pandas
pip install sqlalchemy==1.4.32
pip install pyathena==2.14.0

jupyter notebook ennablData.ipynb