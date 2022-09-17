
APP_NAME=server

all: clean build-arm docker

clean:
	rm -rf bin

build-linux:
	@echo '- building linux...'
	@GOOS=linux go build  -o bin/$(APP_NAME).bin

build-arm:
	@echo '- building arm...'
	@GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o bin/$(APP_NAME).arm

build-mac:
	@echo '- building mac...'
	@GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -o bin/$(APP_NAME).app

build-win:
	@echo '- building windows...'
	@GOOS=windows GOARCH=386 CGO_ENABLED=0 go build -o bin/$(APP_NAME).exe

docker:
	docker build -t $(APP_NAME) .