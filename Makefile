SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -c

.PHONY: help
help: ## Print info about all commands
	@echo "Helper Commands:"
	@echo
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[01;32m%-20s\033[0m %s\n", $$1, $$2}'
	@echo

.PHONY: build
build: ## build
	pnpm run build

.PHONY: identify
identify: ## identify people in videos
	node lib/identify-people.js

.PHONY: bind-videos
bind: ## bind videos
	node lib/bind-videos.js

.PHONY: speakers
speakers: ## detect speakers
	node lib/detect-speakers.js

.PHONY: speakers
missing: ## missing speakers stats
	node lib/missing-speakers.js

extract-pp:
	node lib/yt-extract.js pp-prague:hcpp24 playlist PLRUSTVWJngiefsTySFA3DuW20v4ehxKb8 '{"project":"hcpp", "event": "hcpp24"}'

extract-urza:
	node lib/yt-extract.js pp-prague:ancap playlist PLmwDL0lIJTxCc0yL4i9M2aNQ4a5wRzjb7 '{"people":["urza"], "lang": "cs", "project": "ankap-serie"}'

extract-ksp:
	node lib/yt-extract.js svobodny-pristav:ksp20 playlist PLmwDL0lIJTxCexaPXOeLubdilZ7qT0SHa '{"lang": "cs", "project": "konference-sp", "event": "ksp20"}'
	node lib/yt-extract.js svobodny-pristav:ksp21 playlist PLmwDL0lIJTxDbyaF8OSIHIUKT3nUfPn8d '{"lang": "cs", "project": "konference-sp", "event": "ksp21"}'
	node lib/yt-extract.js svobodny-pristav:ksp22 playlist PLmwDL0lIJTxAKDGKwJWMwXG3QLWm65xHl '{"lang": "cs", "project": "konference-sp", "event": "ksp22"}'
	node lib/yt-extract.js svobodny-pristav:ksp23 playlist PLmwDL0lIJTxAiv4UON_5YAKB0-UWp-osA '{"lang": "cs", "project": "konference-sp", "event": "ksp23"}'
	node lib/yt-extract.js svobodny-pristav:ksp24 playlist PLmwDL0lIJTxBfzH_IglHxH60OmmswxoNx '{"lang": "cs", "project": "konference-sp", "event": "ksp24"}'

extract-dod:
#node lib/yt-extract.js dod:ethberlin24-keynotes playlist PLjOcf_IVqERmocijf0P3_JTt04xgFa1YZ '{"project": "ethberlin", "event": "ethberlin4"}'
	node lib/yt-extract.js dod:protocol-berg-2023-main-stage playlist PLjOcf_IVqERn-nzPYZ54Idhfb7jWWlO03 '{"project": "protocol-berg", "event": "protocol-berg-2023"}'

extract-w3p-cypherpunk-congress-2024:
	node lib/yt-extract.js w3pn:eth-cypherpunk-congress-2024 playlist PLSsVHWrO8Yh2FBmQ3JwauylmYI4F6z5Q3 '{"project": "w3pn", "event": "w3pn-eth-cypherpunk-congress-2024"}'

# monerokon
extract-monerokon19:
	node lib/yt-extract.js monerokon-community:monerokon19 playlist PLsSYUeVwrHBkJHJg_l2uDgbicDJ1PmAVW '{"project": "monerokon", "event": "monerokon19"}'

extract-monerokon22:
	node lib/yt-extract.js monerokon-community:monerokon22 playlist PLsSYUeVwrHBndRQoQ-vLezzlHPLRDNzaw '{"project": "monerokon", "event": "monerokon22"}'

extract-monerokon23:
	node lib/yt-extract.js monerokon-community:monerokon23 playlist PLsSYUeVwrHBm1m7IaU3JiDVb5EC7cn0KG '{"project": "monerokon", "event": "monerokon23"}'

extract-monerokon24:
	node lib/yt-extract.js monerokon-community:monerokon24 playlist PLsSYUeVwrHBk-C3zImaDAQLx453PL7dR- '{"project": "monerokon", "event": "monerokon24"}'

# nestatni penize
extract-nestatni-penize:
	node lib/yt-extract.js pp-prague:nestatni-penize playlist PLCY6Q2vuBJALblREr_5E0Wa6MwWIJFVCH '{"people":["Josef Tětek|josef-tetek"], "lang": "cs", "project": "nestatni-penize"}'
	
# parallel society congress
extract-psc24: 
	node lib/yt-extract.js ift:psc24 playlist PLZe53tXAogqNNtKdrY8UhN8KsXphKDS_z '{"project": "parallel-society-congress", "event": "psc24"}'