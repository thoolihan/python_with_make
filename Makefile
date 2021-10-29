.PHONY: freeze test reset

SHELL := /bin/bash

venv = make_sample

$(venv)/touchfile: requirements.txt
	python3 -mvenv ./$(venv); \
	source ./$(venv)/bin/activate; \
	pip install -r requirements.txt; \
	pip install --upgrade pip; \
	touch ./$(venv)/touchfile

freeze: $(venv)/touchfile
	source ./$(venv)/bin/activate; \
	cp requirements.txt requirements.txt.bak; \
	pip freeze > ./requirements.txt

test: $(venv)/touchfile
	source ./$(venv)/bin/activate; \
	python test.py

reset:
	-rm -rf ./$(venv)/
	echo "numpy" > requirements.txt
