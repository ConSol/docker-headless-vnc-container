#!/usr/bin/make -f

SHELL=bash

help:
	@echo "make prepare|update|test"

update:
	docker-compose pull
	for IMG in $$(grep FROM Dockerfile.* | awk '{ print $$2 }' | sort -u); do docker pull $$IMG; done

clean:
	docker-compose kill
	docker-compose rm -f
	-docker network prune -f

prepare:
	docker-compose build
	docker-compose up --remove-orphans --scale base=0 -d
	docker ps
	@while read LOGLINE; do \
		echo "$${LOGLINE}"; \
		[[ "$${LOGLINE}" == *"connect via"*":6901/?password="* ]] && exit 0; \
		[[ "$${LOGLINE}" == *"ERROR"* ]] && exit 1; \
	done < <(docker-compose logs -f)

test: prepare
	perl -MExtUtils::Command::MM -e "test_harness(1)" *.t
