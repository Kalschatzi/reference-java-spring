.ig.PHONY: clean
clean:
	./gradlew :service:clean -x test

.PHONY: build
build: clean
	./gradlew :service:build -x test

.PHONY: test
test:
	./gradlew :service:test


.PHONY: run
run:
	./gradlew :service:bootRun
