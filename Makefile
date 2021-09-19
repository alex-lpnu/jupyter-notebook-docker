CONTAINR_NAME = notebook
IMAGE_NAME    = sashakovalchuk/jupyter-notebook:1.0

.PHONY: build
build: 
	$(SU) docker build --tag $(IMAGE_NAME) .

.PHONY: create-container
create-container:
	$(SU) docker run -d -v $(PWD):/notebooks -p 80:8888 --name $(CONTAINR_NAME) $(IMAGE_NAME)

.PHONY: stop
stop: 
	$(SU) docker stop $(CONTAINR_NAME)

.PHONY: start
start: 
	$(SU) docker start $(CONTAINR_NAME)

.PHONY: clean
clean:
	$(SU) docker rm -f notebook
	$(SU) docker image rm $(IMAGE_NAME)