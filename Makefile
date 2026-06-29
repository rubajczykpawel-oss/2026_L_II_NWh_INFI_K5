.PHONY: deps lint test run docker_build docker_run

deps:
	python -m pip install -r requirements.txt; \
	python -m pip install -r test_requirements.txt

lint:
	python -m flake8 hello_world test

test:
	PYTHONPATH=. python -m pytest test

run:
	python main.py

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer