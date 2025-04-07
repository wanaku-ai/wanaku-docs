setup:
	npm add -D vitepress

VERSIONS=0.0.1 0.0.2 0.0.3 main

.PHONY: docs

$(VERSIONS):
	[[ -e version/wanaku-$(@) ]] || git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku version/wanaku-$(@)

main:
	[[ -e version/wanaku-main ]] || git clone --branch main https://github.com/wanaku-ai/wanaku version/wanaku-main

fetch: $(VERSIONS) main

docs: fetch
	npm run docs:build

clean:
	rm -rf version/wanaku-*
	rm -rf docs

serve:
	npm run docs:dev