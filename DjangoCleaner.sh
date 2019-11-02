#!/bin/bash

echo
echo "Executing migrations cleaning script for datamodel. . ."
echo

find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc"  -delete

rm db.sqlite3

python3 ./manage.py makemigrations datamodel 
python3 ./manage.py migrate datamodel

python3 ./manage.py migrate admin
python3 ./manage.py migrate auth
python3 ./manage.py migrate contenttypes
python3 ./manage.py migrate sessions

echo
echo "CLEANING TASKS COMPLETED!"
echo "Follow me on GitHub -- https://github.com/M4RC0Sx"
echo
