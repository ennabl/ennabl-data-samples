python -m pip install virtualenv
python -m virtualenv venv

. .\venv\Scripts\activate.ps1

echo "Installing dependencies"
pip install pandas
pip install sqlalchemy==1.4.32
pip install pyathena==2.14.0

pip install jupyter notebook
jupyter notebook ennablData.ipynb