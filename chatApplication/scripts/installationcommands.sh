#!/bin/bash
sudo apt-get update
sudo apt-get install python3-pip3 python3-dev nginx git -y
sudo apt-get update
cd /new_chatapp
pip3 install virtualenv
virtualenv venv
source /new_chatapp/venv/bin/activate
pip3 install -r requirements.txt
pip3 install django bcrypt django-extensions
pip3 install gunicorn
cd fundoo/
python3 manage.py collectstatic --noinput
python3 manage.py migrate
sudo cp /new_chatapp/scripts/gunicorn.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo unlink /etc/nginx/sites-enabled/*
sudo cp /new_chatapp/scripts/fundoo /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/fundoo /etc/nginx/sites-enabled
sudo systemctl restart nginx
