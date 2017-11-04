venv ?= .env

init: $(venv)
	$(venv)/bin/pip install runcommands
	$(venv)/bin/pip install -r requirements.txt
	$(venv)/bin/runcommand init

$(venv):
	virtualenv -p python3 $(venv)

run:
	$(venv)/bin/tangled serve -f development.ini

sdist: clean clean-dist
	$(venv)/bin/python setup.py sdist

test:
	$(venv)/bin/tangled test

clean: clean-dist clean-pycache

clean-all: clean-build clean-dist clean-pycache clean-venv

clean-build:
	rm -frv build

clean-dist:
	rm -frv dist

clean-pycache:
	find . -type d -name __pycache__ | xargs rm -rf

clean-venv:
	rm -frv $(venv)

.PHONY = init install run sdist test clean clean-all clean-build clean-dist clean-pycache clean-venv
