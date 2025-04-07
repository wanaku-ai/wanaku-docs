setup:
	npm add -D vitepress

VERSIONS=0.0.1 0.0.2 0.0.3 main

.PHONY: docs

$(VERSIONS):
	@if [ ! -e version/wanaku-$(@) ]; then \
  		git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku version/wanaku-$(@) ; \
  	fi

main:
	@if [ ! -e version/wanaku-main ]; then \
  		git clone --branch wanaku-main https://github.com/wanaku-ai/wanaku version/wanaku-main ; \
  	fi

fetch: $(VERSIONS) main

docs: fetch
	npm run docs:build

clean:
	rm -rf version/wanaku-*
	rm -rf docs

serve:
	npm run docs:dev