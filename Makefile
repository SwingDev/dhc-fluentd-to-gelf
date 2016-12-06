NAME = swingdevelopment/dhc-fluentd-to-gelf
SHA1 = $(shell git rev-parse HEAD)

build:
	docker build -t $(NAME):$(SHA1) .

tag_latest:
	docker tag $(NAME):$(SHA1) $(NAME):latest

test:
	docker run $(DOCKER_RUN_TEST_PARAMS) $(NAME):$(SHA1) echo "No tests here."

push:
	docker push $(NAME):$(SHA1)

push_latest:
	docker push $(NAME):latest
