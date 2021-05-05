.DEFAULT_GOAL := help

.PHONY: help ## Generate list of targets with descriptions
help:
	@grep '##' Makefile \
	| grep -v 'grep\|sed' \
	| sed 's/^\.PHONY: \(.*\) ##[\s|\S]*\(.*\)/\1:\t\2/' \
	| sed 's/\(^##\)//' \
	| sed 's/\(##\)/\t/' \
	| expand -t14

.PHONY: run ## Run playbooks
run:
	ansible-playbook -v -i inventories/default playbook-install-nmap.yml
	ansible-playbook -v -i inventories/default playbook-install-wiki.yml

.PHONY: server0 ## SSH connect to server0
server0:
	ssh root@server0

.PHONY: server1 ## SSH connect to server1
server1:
	ssh root@server1

.PHONY: server2 ## SSH connect to server2
server2:
	ssh root@server2