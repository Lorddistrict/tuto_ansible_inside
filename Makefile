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