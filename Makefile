setup:
	npm add -D vitepress

VERSIONS=0.0.1 0.0.2 0.0.3 main

$(VERSIONS):
	git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku version/wanaku-$(@)

main:
	git clone --branch main https://github.com/wanaku-ai/wanaku version/wanaku-main

fetch: $(VERSIONS) main

docs:
	npm run docs:build

clean:
	rm -rf version/wanaku-*
	rm -rf docs

serve:
	npx vitepress dev docs