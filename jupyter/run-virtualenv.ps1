python -m pip install virtualenv
python -m virtualenv venv

. .\venv\Scripts\activate.ps1

echo "Installing dependencies"
pip install -r requirements.txt

jupyter notebook ennablData.ipynb