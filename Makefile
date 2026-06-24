.PHONY: deps lint test run

deps:
	pip install -r requirements.txt; \

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. pytest test

run:
	python main.py