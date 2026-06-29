.PHONY: deps lint test run docker_build docker_run docker_push

TAG=$(USERNAME)/hello-world-printer-k7-2026

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
	docker build -t hello-world-printer -t hello-world-printer-k7-2026 .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer

docker_push: docker_build
	@echo "$$DOCKER_PASSWORD" | docker login --username $(USERNAME) --password-stdin; \
	docker tag hello-world-printer-k7-2026 $(TAG); \
	docker push $(TAG); \
	docker logout