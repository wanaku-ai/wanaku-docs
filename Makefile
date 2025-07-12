setup:
	npm add -D vitepress

WANAKU_ROUTER_VERSIONS=0.0.4 0.0.5 0.0.6
DEMOS_DIR=demos
VERSIONS_DIR=version
TOOLSETS_DIR=toolsets

.PHONY: docs demos

$(WANAKU_ROUTER_VERSIONS):
	@if [ ! -e $(VERSIONS_DIR)/wanaku-$(@) ]; then \
  		git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku $(VERSIONS_DIR)/wanaku-$(@) ; \
  	fi
	@if [ ! -e $(DEMOS_DIR)/wanaku-demos-$(@) ]; then \
  		git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku-demos $(DEMOS_DIR)/wanaku-demos-$(@) || true ; \
  	fi
	@if [ ! -e $(TOOLSETS_DIR)/wanaku-toolsets-$(@) ]; then \
  		git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku-toolsets $(TOOLSETS_DIR)/wanaku-toolsets-$(@) || true ; \
  	fi

router-main:
	@if [ ! -e $(VERSIONS_DIR)/wanaku-main ]; then \
  		git clone --branch main https://github.com/wanaku-ai/wanaku $(VERSIONS_DIR)/wanaku-main ; \
  	fi ;

demos-main:
	@if [ ! -e $(DEMOS_DIR)/wanaku-demos-main ]; then \
		git clone --branch main https://github.com/wanaku-ai/wanaku-demos $(DEMOS_DIR)/wanaku-demos-main ; \
	fi

toolsets-main:
	@if [ ! -e $(TOOLSETS_DIR)/wanaku-toolsets-main ]; then \
		git clone --branch main https://github.com/wanaku-ai/wanaku-toolsets $(TOOLSETS_DIR)/wanaku-toolsets-main ; \
	fi

main: router-main demos-main toolsets-main

fetch: $(WANAKU_ROUTER_VERSIONS) main

docs: fetch
	npm run docs:build

clean:
	@rm -rf $(VERSIONS_DIR)/wanaku-*
	@rm -rf $(DEMOS_DIR)/wanaku-*
	@rm -rf $(TOOLSETS_DIR)/wanaku-*
	@rm -rf docs

serve:
	npm run docs:dev