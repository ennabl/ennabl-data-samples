#!/bin/bash
set -ex

# Create and Activate Conda Env
echo "Creating ennablData conda enviornment"
conda create --name ennablData python=3.9 ipykernel jupyter nb_conda -y
 
echo "Activating ennablData"
eval "$(conda shell.bash hook)"
conda activate ennablData

echo "Installing dependencies"
pip install -r requirements.txt

jupyter notebook ennablData.ipynb