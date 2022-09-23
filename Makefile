
APP_NAME=server
IMAGE_NAME=ngrok-server-example

all: clean build docker

clean:
	@echo '- removing bin folder...'
	rm -rf bin

build:
	@echo '- building arm binary...'
	@GOOS=linux GOARCH=arm CGO_ENABLED=0 go build -o bin/$(APP_NAME)

build-amd64:
	@echo '- building amd64 binary...'
	@GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o bin/$(APP_NAME)

docker:
	@echo '- removing docker image...'
	docker rmi ${IMAGE_NAME}:latest -f
	@echo '- building docker image...'
	docker build -t $(IMAGE_NAME) .