.PHONY: freeze test reset

SHELL := /bin/bash

venv = make_sample
venv_go = source ./$(venv)/bin/activate

$(venv)/touchfile: requirements.txt
	python3 -mvenv ./$(venv); \
	$(venv_go); \
	pip install -r requirements.txt; \
	pip install --upgrade pip; \
	touch ./$(venv)/touchfile

freeze: $(venv)/touchfile
	$(venv_go); \
	cp requirements.txt requirements.txt.bak; \
	pip freeze > ./requirements.txt

test: $(venv)/touchfile
	$(venv_go); \
	python test.py

reset:
	-rm -rf ./$(venv)/
	echo "numpy" > requirements.txt
